Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327de8asm10409919f8f.84.2025.01.20.06.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:12:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 810EF5F780;
	Mon, 20 Jan 2025 14:12:12 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  qemu-arm <qemu-arm@nongnu.org>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Radoslaw Biernacki <rad@semihalf.com>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Fabiano Rosas <farosas@suse.de>,  Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  Laurent Vivier
 <lvivier@redhat.com>,  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Bernhard Beschow
 <shentey@gmail.com>,  Bin Meng <bmeng.cn@gmail.com>,  Laurent Vivier
 <laurent@vivier.eu>,  Joel Stanley <joel@jms.id.au>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  John Snow
 <jsnow@redhat.com>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Alistair Francis <alistair.francis@wdc.com>,
  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Leif Lindholm <quic_llindhol@quicinc.com>,
  Cleber Rosa <crosa@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  qemu-s390x@nongnu.org,  Eric Farman <farman@linux.ibm.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Peter Maydell <peter.maydell@linaro.org>,
  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 17/32] system/qtest: properly feedback results of
 clock_[step|set]
In-Reply-To: <259ca4e4-5b24-41bf-b81f-fdd07b19ca3a@redhat.com> (Thomas Huth's
	message of "Mon, 20 Jan 2025 14:20:15 +0100")
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
	<20250108121054.1126164-18-alex.bennee@linaro.org>
	<259ca4e4-5b24-41bf-b81f-fdd07b19ca3a@redhat.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 20 Jan 2025 14:12:12 +0000
Message-ID: <877c6pr2v7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wBhMGK49eKxv

Thomas Huth <thuth@redhat.com> writes:

> On 08/01/2025 13.10, Alex Benn=C3=A9e wrote:
>> Time will not advance if the system is paused or there are no timer
>> events set for the future. In absence of pending timer events
>> advancing time would make no difference the system state. Attempting
>> to do so would be a bug and the test or device under test would need
>> fixing.
>> Tighten up the result reporting to `FAIL` if time was not advanced.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Fabiano Rosas <farosas@suse.de>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2687
>> ---
>>   system/qtest.c | 23 ++++++++++++++---------
>>   1 file changed, 14 insertions(+), 9 deletions(-)
>> diff --git a/system/qtest.c b/system/qtest.c
>> index 99ef2042f6..e68ed0f2a8 100644
>> --- a/system/qtest.c
>> +++ b/system/qtest.c
>> @@ -78,6 +78,11 @@ static void *qtest_server_send_opaque;
>>    * let you adjust the value of the clock (monotonically).  All the com=
mands
>>    * return the current value of the clock in nanoseconds.
>>    *
>> + * If the commands FAIL then time wasn't advanced which is likely
>> + * because the machine was in a paused state or no timer events exist
>> + * in the future. This will cause qtest to abort and the test will
>> + * need to check its assumptions.
>> + *
>>    * .. code-block:: none
>>    *
>>    *  > clock_step
>> @@ -710,7 +715,8 @@ static void qtest_process_command(CharBackend *chr, =
gchar **words)
>>               qtest_sendf(chr, "OK little\n");
>>           }
>>       } else if (qtest_enabled() && strcmp(words[0], "clock_step") =3D=
=3D 0) {
>> -        int64_t ns;
>> +        int64_t old_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        int64_t ns, new_ns;
>>             if (words[1]) {
>>               int ret =3D qemu_strtoi64(words[1], NULL, 0, &ns);
>> @@ -719,11 +725,10 @@ static void qtest_process_command(CharBackend *chr=
, gchar **words)
>>               ns =3D qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>>                                               QEMU_TIMER_ATTR_ALL);
>>           }
>> -        qemu_clock_advance_virtual_time(
>> -            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns);
>> +        new_ns =3D qemu_clock_advance_virtual_time(old_ns + ns);
>>           qtest_send_prefix(chr);
>> -        qtest_sendf(chr, "OK %"PRIi64"\n",
>> -                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>> +        qtest_sendf(chr, "%s %"PRIi64"\n",
>> +                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
>>       } else if (strcmp(words[0], "module_load") =3D=3D 0) {
>>           Error *local_err =3D NULL;
>>           int rv;
>> @@ -740,16 +745,16 @@ static void qtest_process_command(CharBackend *chr=
, gchar **words)
>>               qtest_sendf(chr, "FAIL\n");
>>           }
>>       } else if (qtest_enabled() && strcmp(words[0], "clock_set") =3D=3D=
 0) {
>> -        int64_t ns;
>> +        int64_t ns, new_ns;
>>           int ret;
>>             g_assert(words[1]);
>>           ret =3D qemu_strtoi64(words[1], NULL, 0, &ns);
>>           g_assert(ret =3D=3D 0);
>> -        qemu_clock_advance_virtual_time(ns);
>> +        new_ns =3D qemu_clock_advance_virtual_time(ns);
>>           qtest_send_prefix(chr);
>> -        qtest_sendf(chr, "OK %"PRIi64"\n",
>> -                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>> +        qtest_sendf(chr, "%s %"PRIi64"\n",
>> +                    new_ns =3D=3D ns ? "OK" : "FAIL", new_ns);
>>       } else if (process_command_cb && process_command_cb(chr, words)) {
>>           /* Command got consumed by the callback handler */
>>       } else {
>
>  Hi Alex,
>
> this patch broke the check-cfi-ppc64-s390x and check-cfi-aarch64 tests
> in the gitlab CI:
>
>  https://gitlab.com/thuth/qemu/-/jobs/8896718604#L78
>  https://gitlab.com/thuth/qemu/-/jobs/8896718599#L72
>
> Though it does not seem to be related to CFI, but rather to
> --disable-slirp, I can reproduce it locally like this:
>
>  .../configure --target-list=3Dppc64-softmmu --disable-slirp --disable-do=
cs
>  make -j$(nproc)
>  make tests/qtest/qos-test
>  QTEST_QEMU_BINARY=3D./qemu-system-ppc64 tests/qtest/qos-test \
>   -p
>    /ppc64/pseries/spapr-pci-host-bridge/pci-bus-spapr/pci-bus/virtio-blk-=
pci/virtio-blk/virtio-blk-tests/config
>  **
>  ERROR:../qemu/tests/qtest/libqtest.c:719:qtest_rsp_args: assertion
>  failed (words[0] =3D=3D "OK"): ("FAIL" =3D=3D "OK")
>  not ok
>  /ppc64/pseries/spapr-pci-host-bridge/pci-bus-spapr/pci-bus/virtio-blk-pc=
i/virtio-blk/virtio-blk-tests/config
>  - ERROR:../qemu/tests/qtest/libqtest.c:719:qtest_rsp_args: assertion
>  failed (words[0] =3D=3D "OK"): ("FAIL" =3D=3D "OK")
>  Bail out!
>  Aborted (core dumped)

Hmm not sure why I didn't see these in the normal testing. I guess we
weren't exercising virtio-pci in anything other than the CFI tests?

>
> Bisecting the problem pointed me to your patch ... if you've got some
> spare time, could you please have a look?

The change in similar to tests/qtest: remove clock_steps from virtio
tests. This basically avoids the step at the start and it will complete
straight away.

--8<---------------cut here---------------start------------->8---
modified   tests/qtest/libqos/virtio-pci-modern.c
@@ -176,10 +176,10 @@ static void wait_config_isr_status(QVirtioDevice *d, =
gint64 timeout_us)
     QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
     gint64 start_time =3D g_get_monotonic_time();
=20
-    do {
+    while (!get_config_isr_status(d)) {
         g_assert(g_get_monotonic_time() - start_time <=3D timeout_us);
         qtest_clock_step(dev->pdev->bus->qts, 100);
-    } while (!get_config_isr_status(d));
+    };
 }
=20
 static void queue_select(QVirtioDevice *d, uint16_t index)
modified   tests/qtest/libqos/virtio-pci.c
@@ -174,10 +174,10 @@ static void qvirtio_pci_wait_config_isr_status(QVirti=
oDevice *d,
     QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
     gint64 start_time =3D g_get_monotonic_time();
=20
-    do {
+    while (!qvirtio_pci_get_config_isr_status(d)) {
         g_assert(g_get_monotonic_time() - start_time <=3D timeout_us);
         qtest_clock_step(dev->pdev->bus->qts, 100);
-    } while (!qvirtio_pci_get_config_isr_status(d));
+    }=20
 }
=20
 static void qvirtio_pci_queue_select(QVirtioDevice *d, uint16_t index)
--8<---------------cut here---------------end--------------->8---

As time has no meaning for the virtio tests (no processing is deferred)
we could we could just as easily simplify to:

--8<---------------cut here---------------start------------->8---
modified   tests/qtest/libqos/virtio-pci-modern.c
@@ -173,13 +173,7 @@ static bool get_config_isr_status(QVirtioDevice *d)
=20
 static void wait_config_isr_status(QVirtioDevice *d, gint64 timeout_us)
 {
-    QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
-    gint64 start_time =3D g_get_monotonic_time();
-
-    do {
-        g_assert(g_get_monotonic_time() - start_time <=3D timeout_us);
-        qtest_clock_step(dev->pdev->bus->qts, 100);
-    } while (!get_config_isr_status(d));
+    g_assert(get_config_isr_status(d));
 }
=20
 static void queue_select(QVirtioDevice *d, uint16_t index)
modified   tests/qtest/libqos/virtio-pci.c
@@ -171,13 +171,7 @@ static bool qvirtio_pci_get_config_isr_status(QVirtioD=
evice *d)
 static void qvirtio_pci_wait_config_isr_status(QVirtioDevice *d,
                                                gint64 timeout_us)
 {
-    QVirtioPCIDevice *dev =3D container_of(d, QVirtioPCIDevice, vdev);
-    gint64 start_time =3D g_get_monotonic_time();
-
-    do {
-        g_assert(g_get_monotonic_time() - start_time <=3D timeout_us);
-        qtest_clock_step(dev->pdev->bus->qts, 100);
-    } while (!qvirtio_pci_get_config_isr_status(d));
+    g_assert(qvirtio_pci_get_config_isr_status(d));
 }
=20
--8<---------------cut here---------------end--------------->8---


>
>  Thanks,
>   Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
