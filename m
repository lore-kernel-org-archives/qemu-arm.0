Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4648586wrm;
        Mon, 21 Oct 2019 07:23:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXUMrDuO+SQU0Ndid/6OyrfPJ9YybLptDFI+x2/mqwzWr/kJqADmnpD10uRr3gvOHQ243L
X-Received: by 2002:a81:368a:: with SMTP id d132mr16148883ywa.390.1571667831746;
        Mon, 21 Oct 2019 07:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571667831; cv=none;
        d=google.com; s=arc-20160816;
        b=wX4JbmQhI0uVFFJLa9Xeqk/EWzPMg3nnRKV7oyP5c8sffUqF59uhPU79nkXGr2aIjj
         BHzm/FfZsLWOoxM0etnVswfFNWZxEVR+QKYiUCSptmBmkBCmNry3fD/EbLoJIpmzWimG
         0Belutk8FqePDGHqRig+lLWmwCtFyJWRkhnFTGH2uAPb4bZsfdDoPl37e/6LEx+IPEEX
         g5nnTbJ4eqW7eNo4H4JG3SiZGjfZb7ab5lNwbbKSQYo3amPZXmEEzXfMerb4OhSlkUHv
         ni2PTBF8KT+xNsx/OnqqhIgmBjXdp3mBxPGvVbJSAoR8Q+CIOZGEpPuh+aQpeBHR3V6t
         8XTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Mmzl8tBYsqn/W504QeCUkEapn7V7z3TPbpoTXZn8Mno=;
        b=ecJP0AISmtBjeHxWTo5vPFHyfOGm8mrRBbsmGKup+mEmqsrw6/GcnixeFcnQAfmIcE
         ZDRAvQ2bdBvY+16CJnDmiU8ONZuGUV0yvKjRKViL5KDMgiZ1YPQYX2Q7AETu5f6DhRVL
         rIaKjwyF3RSUKuiis0kB2pY4W1TiTKLehB52n8vPGNc9dvXwxlspe0rvOqajH9djzGWu
         /pHDc9GElSICpgXRvJbgZjkDG0A4dcLFAx4kkkvVIfgYcMoFe4phWjZ3+816UXLJ5UPx
         aKsu3yRKbhNwi4tu31cHlYqVvwxgBnBzSNPjm5enRQKBD5oh4ue3wUGMSIOnAIZS/Fmk
         aYdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=asiHonXL;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id a13si5502172ybe.289.2019.10.21.07.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 07:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=asiHonXL;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571667831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mmzl8tBYsqn/W504QeCUkEapn7V7z3TPbpoTXZn8Mno=;
	b=asiHonXLtLYKMy35hIEt+QOa5kLUp7/Q93Va6YPjKrbFn1jetKiZ19lWymShVkYNkrrDvk
	Cr86mES1jJDJOqMay5p/tDLHJ7VqExJ79XqQr6ngJlgf9vBBKSpqd77mcuZR/QDw9QIZjf
	iznILecSR1Uk1A45p7R8YevEQYGUvtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-ADIe0o63MeipDzLfcE0e-A-1; Mon, 21 Oct 2019 10:23:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0FD71800DC7;
	Mon, 21 Oct 2019 14:23:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B3C5C549;
	Mon, 21 Oct 2019 14:23:39 +0000 (UTC)
Date: Mon, 21 Oct 2019 16:23:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
Message-ID: <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
 <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
 <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ADIe0o63MeipDzLfcE0e-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: 3FbLDIOyUU5b

On Mon, Oct 21, 2019 at 02:54:30PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 10/21/19 2:36 PM, Peter Maydell wrote:
> > On Wed, 16 Oct 2019 at 09:54, Andrew Jones <drjones@redhat.com> wrote:
> > >=20
> > > Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guest=
s.
> > > This series provides the QEMU bits for that enablement. First, we
> > > select existing CPU properties representing features we want to
> > > advertise in addition to the SVE vector lengths and prepare
> > > them for a qmp query. Then we introduce the qmp query, applying
> > > it immediately to those selected features. We also document ARM CPU
> > > features at this time. We next add a qtest for the selected CPU
> > > features that uses the qmp query for its tests - and we continue to
> > > add tests as we add CPU features with the following patches. So then,
> > > once we have the support we need for CPU feature querying and testing=
,
> > > we add our first SVE CPU feature property, 'sve', which just allows
> > > SVE to be completely enabled/disabled. Following that feature propert=
y,
> > > we add all 16 vector length properties along with the input validatio=
n
> > > they need and tests to prove the validation works. At this point the
> > > SVE features are still only for TCG, so we provide some patches to
> > > prepare for KVM and then a patch that allows the 'max' CPU type to
> > > enable SVE with KVM, but at first without vector length properties.
> > > After a bit more preparation we add the SVE vector length properties
> > > to the KVM-enabled 'max' CPU type along with the additional input
> > > validation and tests that that needs.  Finally we allow the 'host'
> > > CPU type to also enjoy these properties by simply sharing them with i=
t.
> >=20
> > This fails 'make check' on an aarch32 box with KVM support:
> >=20
> > MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> > QTEST_QEMU_BINARY=3Darm-softmmu/qemu-system-arm QTEST_QEMU_IMG=3Dqemu-i=
mg
> > tests/arm-cpu-features -m=3Dquick -k --tap < /dev/null |
> > ./scripts/tap-driver.pl --test-name=3D"arm-cpu-features"
> > PASS 1 arm-cpu-features /arm/arm/query-cpu-model-expansion
> > **
> > ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:420:test_query_cpu_mode=
l_expansion_kvm:
> > assertion failed: (resp_has_props(_resp))
>=20
> Glad you could test it, I was wondering how this test work because it fir=
st
> unconditionally assert the host has PMU feature (failing the test) then
> there is a unreachable if(!aarch64) "'pmu' feature not supported" warning=
.
>

Yes, this is the case you were concerned about, but the problem is for a
slightly different reason. *If* the PMU feature was getting added to the
kvm32 'host' CPU type, then both tests here would be correct: the feature
would be present, but arm_set_pmu() would report "feature not supported",
as that's what KVM would report on kvm32. However, I see now that
target/arm/kvm32.c:kvm_arm_get_host_cpu_features() does *not* add
ARM_FEATURE_PMU, like it does in the target/arm/kvm64.c implementation
and in the 32-bit CPU models like the Cortex-A15. Indeed, had this
test been run with '-cpu cortex-a15', and the kvm32 host allowed that
CPU type, then this test would also work. We want to use 'host' here
though, as that's more appropriate, so the fix is simply to remove the
tests on kvm32 like below.

Peter, would you mind running your test on the kvm32 machine with this
change before I send a v7? Actually, do I need to send a v7? Or is
type of fixup OK to do on merge?

Thanks,
drew


diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 92668efb8f56..14100ebd8521 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -417,8 +417,6 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
=20
     qts =3D qtest_init(MACHINE "-accel kvm -cpu host");
=20
-    assert_has_feature(qts, "host", "pmu");
-
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
         char max_name[8], name[8];
@@ -428,6 +426,7 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
         char *error;
=20
         assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature(qts, "host", "pmu");
=20
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
@@ -497,9 +496,6 @@ static void test_query_cpu_model_expansion_kvm(const vo=
id *data)
         }
     } else {
         assert_has_not_feature(qts, "host", "sve");
-        assert_error(qts, "host",
-                     "'pmu' feature not supported by KVM on this host",
-                     "{ 'pmu': true }");
     }
=20
     qtest_quit(qts);
