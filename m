Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3839991wrq;
        Fri, 25 Oct 2019 06:52:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoFY1HB3kzD62+JA8BQFvwMXQ4/C8+xpcytRC6bw/jNs5HBMhzSvnRycn2rRPBwEbGiaZj
X-Received: by 2002:a50:8a88:: with SMTP id j8mr4178895edj.35.1572011567236;
        Fri, 25 Oct 2019 06:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572011567; cv=none;
        d=google.com; s=arc-20160816;
        b=clU/JjevLT6QQCgazpAzy3Y8D7hjJc6lH11J96XffxHcF7DZSGOHSXiFc1cld4xU7A
         1Xgp7GliVppQXzWSORIWLDGbsWyFHOAnbySYU6o1divipER2lYkuXOfedYubvTV9A9Ws
         h1nEt8H7IQ3sImtHd3HlthcnuZPuZJG3AK+DVdCunbuZ92N9D/WCLIgoCOoVKuYrqa5t
         7LD0BPoIbVK1qldtN0E6b7l9Eb2ICdTrPHIrQOIJ/D2dLnnG4pUK5YhyaJBx6pabSP36
         dx3Gh794JjK5qe8ZJyuBnKauNOWfja7w1ADNAKovnfi8U0npuJ3def38PHrrQQmUsRXM
         7eAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=dfGtXbCptlzerX9PE/1KxUFqdRj7jeMerK7yCllC5/A=;
        b=shj8BOyqt7f76h7eSvY8dpVxALmGbqcelFDqNkm8AYgFbSaxN4pgi+dVtyGzT3ZCvw
         5VQq4LNhsh6c2jF17RaZeBXwHDQeTXH3F1OioidGDiTffSK8pKmYydEfWa8eY/vQzE1v
         GP8Em09WThX9JUYpEiGWs3m0hPqiik1/1CaXPgm/C/PH8dqx6/TvDyyON/SVDiie4bTL
         IntHRFSyFRAfpVVo2EkuPCvCbxxQphRDgK6ejavfMEZ/1PLahga/EY/b0sZFfB96kzt0
         oYC6NXUwIn0yV4G/sGIpO3MmG9nRccUhCTKO8jpLpQ75/DkouI5Kcf3gPUZCFMrQeLpr
         SG3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YaUj5rfP;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id a9si1204123eje.210.2019.10.25.06.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YaUj5rfP;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572011566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfGtXbCptlzerX9PE/1KxUFqdRj7jeMerK7yCllC5/A=;
	b=YaUj5rfPbVUCy3fscWWo7ZJYzUjSx97RhPe73iTSSZCWVDMU+29KeddypeBWPqWrIXGaGi
	cHstJHIYou6aJKtsKzh42R//6yVWGtZlYt4dTv+8qqW4RX6EeQq3JDB9ouRHCbhgRuHqM8
	1oRBTGRDn/RZgzy3D/y1u7yNouRdAs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-17fZNRTsNru3_LMF3Yx1jQ-1; Fri, 25 Oct 2019 09:52:39 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF21107AD31;
	Fri, 25 Oct 2019 13:52:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13CAD5C222;
	Fri, 25 Oct 2019 13:52:01 +0000 (UTC)
Date: Fri, 25 Oct 2019 15:51:59 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: m.mizuma@jp.fujitsu.com, Beata Michalska <beata.michalska@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v7 0/9] target/arm/kvm: enable SVE in guests
Message-ID: <20191025135159.44siz7g3szpz23og@kamzik.brq.redhat.com>
References: <20191024121808.9612-1-drjones@redhat.com>
 <CAFEAcA9ehcuktCTGR0xpTvZegUkr99H62F_fiT7RY_L_dqgN4g@mail.gmail.com>
 <CAFEAcA981jAU6F9RRWBuzg+_5JDrd-ip-L_awtzdZFqKmewMvA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA981jAU6F9RRWBuzg+_5JDrd-ip-L_awtzdZFqKmewMvA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 17fZNRTsNru3_LMF3Yx1jQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: ZqbsKBDgo8hG

On Fri, Oct 25, 2019 at 01:06:26PM +0100, Peter Maydell wrote:
> On Thu, 24 Oct 2019 at 14:42, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Thu, 24 Oct 2019 at 13:18, Andrew Jones <drjones@redhat.com> wrote:
> > >
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
> > >
> >
> >
> >
> > Applied to target-arm.next, thanks.
>=20
> Fails 'make check' on my aarch32-compile-in-chroot-on-aarch64
> machine:

Are there easy-to-follow instructions for setting this environment up
somewhere?

>=20
> (armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
> QTEST_QEMU_BINARY=3Darm-softmmu/qemu-system-arm tests/arm-cpu-features
> /arm/arm/query-cpu-model-expansion: OK
> /arm/arm/kvm/query-cpu-model-expansion: qemu-system-arm: Failed to
> retrieve host CPU features
> Broken pipe

I guess the problem is how we're determining if KVM is available, which
is like this

int main(int argc, char **argv)
{
    bool kvm_available =3D false;

    if (!access("/dev/kvm",  R_OK | W_OK)) {
#if defined(HOST_AARCH64)
        kvm_available =3D g_str_equal(qtest_get_arch(), "aarch64");
#elif defined(HOST_ARM)
        kvm_available =3D g_str_equal(qtest_get_arch(), "arm");
#endif
    }


So we need /dev/kvm and the QEMU binary arch type (qemu-system-arm in
this case) needs to match the host arch type. The problem is that
HOST_<type> doesn't imply anything about the actual host arch type.
<type> comes from the configure $ARCH variable, which for 'arm'
comes from the $cpu variable, which for 'arm' comes from whether or
not the compiler defines __arm__, and cross compilers certainly do.
I guess we'd have the same problem in an aarch32-compile-in-chroot-on-
<any-other-type> environment, if a cross compiler is used for the
compiling. I should change the KVM available check to something that
uses the actual host arch type. I assume the following works, but
I don't know if I'm allowed to use uname() in these tests, and, if
not, then I don't know what the right way to get the actual host
type is.


diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 6b8c48de8aa8..712af2b405fb 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -13,6 +13,7 @@
 #include "libqtest.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
+#include <sys/utsname.h>
=20
 /*
  * We expect the SVE max-vq to be 16. Also it must be <=3D 64
@@ -506,13 +507,16 @@ static void test_query_cpu_model_expansion_kvm(const =
void *data)
 int main(int argc, char **argv)
 {
     bool kvm_available =3D false;
+    struct utsname u;
+
+    g_assert(uname(&u) =3D=3D 0);
=20
     if (!access("/dev/kvm",  R_OK | W_OK)) {
-#if defined(HOST_AARCH64)
-        kvm_available =3D g_str_equal(qtest_get_arch(), "aarch64");
-#elif defined(HOST_ARM)
-        kvm_available =3D g_str_equal(qtest_get_arch(), "arm");
-#endif
+        if (g_str_equal(u.machine, "aarch64")) {
+            kvm_available =3D g_str_equal(qtest_get_arch(), "aarch64");
+        } else if (!strncmp(u.machine, "arm", 3)) {
+            kvm_available =3D g_str_equal(qtest_get_arch(), "arm");
+        }
     }
=20
     g_test_init(&argc, &argv, NULL);

> /home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
> terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted
>=20
> Dropping again :-(

Sigh...

Thanks,
drew
