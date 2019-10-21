Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4778479wrm;
        Mon, 21 Oct 2019 09:12:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/wUX/BIkS/xKuswP2kwo+Opi7IXoKV1D7lf/bKiSfBFLtiwNTgL4bDVq57jMMhChaXQfc
X-Received: by 2002:a37:4a87:: with SMTP id x129mr22524175qka.43.1571674365243;
        Mon, 21 Oct 2019 09:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571674365; cv=none;
        d=google.com; s=arc-20160816;
        b=GrALOlMOnSIQldF459YGr86gHX75EQTiBTWm1xUXhglHtmikqM4w+nkKVH1OA2vkXK
         dWqIoRx7SVy3r9l9dZwLl7QEKn7Hv2iC3o7PyhyKE5E8CwmuVpRVqELuO/7ngZwCmadB
         7Pqu93G3K5P2pXYA79C1nrSs1iloBaV8O/6LAJClwhbtRRC2wE8D7GYRuDpnrb/30B56
         O8dmPaoqJCdBULaMJimuu2hEsbQ2uW9Mg4DAYaro3KiSJpwcdtjIL4ikGS+0zUdlpiKV
         5nnp7yr1nqOX2+ZrYC70lQQubltcHFi5cqSeLV0Gr+mApA7YTtbdU+zC7ZDlfli5FqOj
         Szog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=RecJFlyUhcIH6EYaAp3d+0MMEZYWE8DIiJ9f4wba0o8=;
        b=Sakd9y2TlraHL8tR3TCcHIQwNoUb3KSbu9wazixdsmIxvOWk2hmxwJuKPa8UcTe+Gu
         /6eRLucIQrRMtpixjKMLDOpV8nqu5XtQyU4K4eBs9SaEnC0HroeY8zr2gYY9G6yztNvn
         Q4LNBRrQsPwbyhV53MArmgC9WClGCX8UEpz0uQWwC2jbjPy/hIg6fqnL4newrn2wgvoS
         G2pnKsjIESbM+zMC1Cqwhr0AOKoRHADCQSrV9DvFeRnEVeqSvsc5kQvY1i+f0yDZ0fhw
         QXKi4u+yHLfX3fhZlzicnS+broR1sM1Lra3wImSDCVHGqOrm6fvOrGZ5JcE6/bUW/EFx
         9tiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YSnVaRVW;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id a5si17084871qvf.42.2019.10.21.09.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 09:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YSnVaRVW;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571674364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RecJFlyUhcIH6EYaAp3d+0MMEZYWE8DIiJ9f4wba0o8=;
	b=YSnVaRVWpapI4Bxz2TQGI3NxEcTKV6+2aDn5DJPnD0FcrdFr9lxtgZ3gCoWj3mPEfEYLNA
	wH+2I/bA7fhrSkSQiztDF6+bdsOV5g6vcpWyNp3ZBPpmloj7f1ZLVY8MKqV22HSvGMP7Q/
	4D0EUlm9t8Ci5VHhA5bM7tvsrjnu7WY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-pIq7-l6IO-a9d1uxHSiunQ-1; Mon, 21 Oct 2019 12:12:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A152476;
	Mon, 21 Oct 2019 16:12:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B01960BE2;
	Mon, 21 Oct 2019 16:12:29 +0000 (UTC)
Date: Mon, 21 Oct 2019 18:12:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
Message-ID: <20191021161226.mnm6eomghb37xlby@kamzik.brq.redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
 <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
 <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com>
 <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
 <CAFEAcA-bezS5tSVB+N223+N+xoYYYHuSJmDTaRCJgO+4Y=VjdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bezS5tSVB+N223+N+xoYYYHuSJmDTaRCJgO+4Y=VjdQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: pIq7-l6IO-a9d1uxHSiunQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: lLpzpVbz7Ebc

On Mon, Oct 21, 2019 at 04:43:22PM +0100, Peter Maydell wrote:
> On Mon, 21 Oct 2019 at 15:23, Andrew Jones <drjones@redhat.com> wrote:
> > Peter, would you mind running your test on the kvm32 machine with this
> > change before I send a v7?
>=20
> Still fails:
>=20
> pm215@pm-ct:~/qemu/build/arm$
> QTEST_QEMU_BINARY=3Darm-softmmu/qemu-system-arm tests/arm-cpu-features
> /arm/arm/query-cpu-model-expansion: OK
> /arm/arm/kvm/query-cpu-model-expansion: **
> ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:498:test_query_cpu_model_=
expansion_kvm:
> assertion failed: (resp_has_props(_resp))
> Aborted
>=20
> This is asserting on the line:
> 498             assert_has_not_feature(qts, "host", "sve");
>

Oh, I see. It's not failing the specific absence of 'sve', but the test
code (assert_has_not_feature()) is assuming at least one property is
present. This isn't the case for kvm32 'host' cpus. They apparently
have none. We need this patch too, then

diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 14100ebd8521..9aa728ed8469 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -136,8 +136,8 @@ static bool resp_get_feature(QDict *resp, const char *f=
eature)
 ({                                                                     \
     QDict *_resp =3D do_query_no_props(qts, cpu_type);                   \
     g_assert(_resp);                                                   \
-    g_assert(resp_has_props(_resp));                                   \
-    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
+    g_assert(!resp_has_props(_resp) ||                                 \
+             !qdict_get(resp_get_props(_resp), feature));              \
     qobject_unref(_resp);                                              \
 })
=20

Thanks,
drew
