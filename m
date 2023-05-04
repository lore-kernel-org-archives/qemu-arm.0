Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b002fe522117fdsm35741381wrf.36.2023.05.04.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:11:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 640411FFBA;
	Thu,  4 May 2023 08:11:13 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <6ed176f9-be38-b4ea-ac90-906cc62c24c4@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org, Laurent Vivier
 <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>, Cleber
 Rosa <crosa@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Juan
 Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Thu, 04 May 2023 08:09:17 +0100
In-reply-to: <6ed176f9-be38-b4ea-ac90-906cc62c24c4@redhat.com>
Message-ID: <87pm7gsh9q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4gEo3qqBAM8d


Thomas Huth <thuth@redhat.com> writes:

> On 03/05/2023 20.32, Peter Maydell wrote:
>> On Wed, 3 May 2023 at 18:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> On 5/3/23 17:35, Alex Benn=C3=A9e wrote:
>>>>> You should select a device only if you cannot even start
>>>>> the machine without --nodefaults.
>>>>
>>>> Which is the case here right? We could skip tests that explicitly
>>>> instantiate a device but these are tests failing with default devices
>>>> the machine tries to instantiate.
>>>
>>> I'm sorry, I meant "select" directives are needed if you cannot even
>>> start the machine *with* --nodefaults.
>>>
>>> Devices that are added *without* --nodefaults should use "imply"
>>> directives instead, as is already the case.
>> Do we really want to build a QEMU that then barfs unless
>> you pass -nodefaults, though ? That doesn't seem very useful.
>> Something somewhere ought to be saying "if you want the
>> virt board then you almost certainly want these". Or
>> alternatively we should fall back to "don't create a
>> network device we don't have", maybe ?
>
> I think we should do the latter. If you compiled without certain
> devices that are used only in the default mode, the board should not
> try to instantiate such devices (since it is also working fine without
> them). Just my 0.02 =E2=82=AC.

So I hand hacked qtest_spawn_qemu with:

    va_start(ap, fmt);
    g_string_append_printf(command, CMD_EXEC "%s %s -nodefaults ",qtest_qem=
u_binary(), tracearg);
    g_string_append_vprintf(command, fmt, ap);
    va_end(ap);=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20

And the following tests fail on the --no-default-devices
--no-default-features build:

  18/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qom-test                     =
        ERROR          51.23s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
   37/436 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test        =
         ERROR           0.20s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
   55/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/test-hmp                    =
         ERROR          50.24s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
   94/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test                    =
         ERROR          50.19s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  103/436 qemu:qtest+qtest-sparc64 / qtest-sparc64/prom-env-test           =
         ERROR          608.02s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
  115/436 qemu:qtest+qtest-aarch64 / qtest-aarch64/cdrom-test              =
         ERROR           0.31s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  122/436 qemu:qtest+qtest-alpha / qtest-alpha/test-filter-mirror          =
         ERROR           0.16s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  123/436 qemu:qtest+qtest-alpha / qtest-alpha/test-filter-redirector      =
         ERROR           0.16s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  132/436 qemu:qtest+qtest-arm / qtest-arm/pflash-cfi02-test               =
         ERROR          50.28s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  134/436 qemu:qtest+qtest-arm / qtest-arm/microbit-test                   =
         ERROR          51.02s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  135/436 qemu:qtest+qtest-arm / qtest-arm/test-arm-mptimer                =
         ERROR          51.20s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  136/436 qemu:qtest+qtest-arm / qtest-arm/cdrom-test                      =
         ERROR           0.31s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  157/436 qemu:qtest+qtest-hppa / qtest-hppa/test-filter-mirror            =
         ERROR           0.16s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  158/436 qemu:qtest+qtest-hppa / qtest-hppa/test-filter-redirector        =
         ERROR           0.26s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  167/436 qemu:qtest+qtest-i386 / qtest-i386/test-filter-mirror            =
         ERROR           0.17s   killed by signal 6 SIGABRT=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
  168/436 qemu:qtest+qtest-i386 / qtest-i386/test-filter-redirector        =
         ERROR           0.17s   killed by signal 6 SIGABRT
  169/436 qemu:qtest+qtest-i386 / qtest-i386/ipmi-bt-test                  =
         ERROR           0.17s   killed by signal 6 SIGABRT
  171/436 qemu:qtest+qtest-i386 / qtest-i386/usb-hcd-uhci-test             =
         ERROR           0.17s   killed by signal 6 SIGABRT
  172/436 qemu:qtest+qtest-i386 / qtest-i386/usb-hcd-ehci-test             =
         ERROR           0.17s   killed by signal 6 SIGABRT
  173/436 qemu:qtest+qtest-i386 / qtest-i386/rtl8139-test                  =
         ERROR           0.17s   killed by signal 6 SIGABRT
  192/436 qemu:qtest+qtest-i386 / qtest-i386/cdrom-test                    =
         ERROR           0.65s   killed by signal 6 SIGABRT
  197/436 qemu:qtest+qtest-i386 / qtest-i386/readconfig-test               =
         ERROR           0.41s   killed by signal 6 SIGABRT
  287/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/test-filter-mirror          =
         ERROR          51.44s   killed by signal 6 SIGABRT
  288/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/test-filter-redirector      =
         ERROR          51.20s   killed by signal 6 SIGABRT
  289/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/m48t59-test                 =
         ERROR          51.20s   killed by signal 6 SIGABRT
  290/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/boot-order-test             =
         ERROR          51.19s   killed by signal 6 SIGABRT
  291/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/device-plug-test            =
         ERROR          51.20s   killed by signal 6 SIGABRT
  292/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/pnv-xscom-test              =
         ERROR          51.20s   killed by signal 6 SIGABRT
  293/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/rtas-test                   =
         ERROR          51.20s   killed by signal 6 SIGABRT
  294/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/usb-hcd-uhci-test           =
         ERROR          51.20s   killed by signal 6 SIGABRT
  295/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/display-vga-test            =
         ERROR          51.21s   killed by signal 6 SIGABRT
  296/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/numa-test                   =
         ERROR          51.19s   killed by signal 6 SIGABRT
  297/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/cpu-plug-test               =
         ERROR          51.20s   killed by signal 6 SIGABRT
  298/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/drive_del-test              =
         ERROR          51.20s   killed by signal 6 SIGABRT
  299/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/cdrom-test                  =
         ERROR          51.20s   killed by signal 6 SIGABRT
  300/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/device-introspect-test      =
         ERROR          51.20s   killed by signal 6 SIGABRT
  301/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/machine-none-test           =
         ERROR          51.20s   killed by signal 6 SIGABRT
  302/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qmp-test                    =
         ERROR          51.20s   killed by signal 6 SIGABRT
  303/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/qmp-cmd-test                =
         ERROR          51.19s   killed by signal 6 SIGABRT
  304/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/readconfig-test             =
         ERROR          51.20s   killed by signal 6 SIGABRT
  305/436 qemu:qtest+qtest-ppc64 / qtest-ppc64/netdev-socket               =
         ERROR          51.20s   killed by signal 6 SIGABRT
  306/436 qemu:qtest+qtest-ppc / qtest-ppc/test-filter-mirror              =
         ERROR           0.17s   killed by signal 6 SIGABRT
  307/436 qemu:qtest+qtest-ppc / qtest-ppc/test-filter-redirector
   ERROR           0.17s   killed by signal 6 SIGABRT
   338/436 qemu:qtest+qtest-s390x / qtest-s390x/test-filter-mirror         =
          ERROR           0.32s   killed by signal 6 SIGABRT
  339/436 qemu:qtest+qtest-s390x / qtest-s390x/test-filter-redirector      =
         ERROR           0.43s   killed by signal 6 SIGABRT
  341/436 qemu:qtest+qtest-s390x / qtest-s390x/device-plug-test            =
         ERROR           0.28s   killed by signal 6 SIGABRT
  342/436 qemu:qtest+qtest-s390x / qtest-s390x/virtio-ccw-test             =
         ERROR           0.16s   killed by signal 6 SIGABRT
  344/436 qemu:qtest+qtest-s390x / qtest-s390x/cdrom-test                  =
         ERROR           0.30s   killed by signal 6 SIGABRT
  365/436 qemu:qtest+qtest-sparc64 / qtest-sparc64/test-filter-mirror      =
         ERROR           0.33s   killed by signal 6 SIGABRT
  366/436 qemu:qtest+qtest-sparc64 / qtest-sparc64/test-filter-redirector  =
         ERROR           0.32s   killed by signal 6 SIGABRT
  391/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-filter-mirror        =
         ERROR           0.16s   killed by signal 6 SIGABRT
  392/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-filter-redirector    =
         ERROR           0.17s   killed by signal 6 SIGABRT
  393/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/ipmi-bt-test              =
         ERROR           0.17s   killed by signal 6 SIGABRT
  395/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/usb-hcd-uhci-test         =
         ERROR           0.18s   killed by signal 6 SIGABRT
  396/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/usb-hcd-ehci-test         =
         ERROR           0.16s   killed by signal 6 SIGABRT
  397/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/rtl8139-test              =
         ERROR           0.17s   killed by signal 6 SIGABRT
  416/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/cdrom-test                =
         ERROR           0.66s   killed by signal 6 SIGABRT
  421/436 qemu:qtest+qtest-x86_64 / qtest-x86_64/readconfig-test           =
         ERROR           0.40s   killed by signal 6 SIGABRT

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
