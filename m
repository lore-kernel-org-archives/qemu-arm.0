Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6034143wrm;
        Tue, 22 Oct 2019 06:50:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQ/Yuki9BGL4n5PHWVFFdz7I10O51rJL/uaXeaN7O+CaM7d6+IdZb/XaYNXS7a9UVAEKrE
X-Received: by 2002:a17:906:5388:: with SMTP id g8mr27298506ejo.278.1571752204717;
        Tue, 22 Oct 2019 06:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571752204; cv=none;
        d=google.com; s=arc-20160816;
        b=pGv6BAoo1kcgcLwp1ilMjK22iQYWoR89w6WpZYcowh+VBcLtY6j8zAY7LT7T44J+mp
         ArHpd/1ySG5UIb6FvKiu9g0quI2CMfSExoQ5hnlB6M7/t1TzuOH+Sd7ppfAdA3cKSnon
         wUE6DVaZSiYn91bxbF5gQIApQYhm+DhlLxudFdL2aNiDn1dGUQiJZ1P6XoTwsueE/oRh
         rFaHQK51vsGuW2DBuBKDK08O8oMQj3PmgIkLRncSblf1YWXodN1dLWtb09AnTiaWHIHo
         OuaM6D9oN22FC1ET/vrlWm+gPGQBlu3DA13u+Zy534FfnEZnyA7tfufsi7a5uqfEjr33
         A8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=X8qYxAI0WgSx6/CqYTtmZjD3iL28I4NbYPq9pRIVPNU=;
        b=DhErumJ8bCJLyzofhfRMu62RxsR2QQrmHWFih+TIArtzPIAhdIViJiHmRFUTCyPx58
         rCNb8182rkyAgX4KDNVVJadYn+BpUt3MPAsdbEzdGx6r6OKl/4G3k91hIzXw/E1a1IKn
         xOP3sQeFjKBnbTD2ahCgrmYlfft0LsVrd2qUlS72/FrK9q1S61q+HtVL+aU9hEvofUBy
         k1adRO7euejIplG94ej3BLJdQDWEKklQSSioiIdKKZhXC9doVdllzJuL6HeiHYo9Vnva
         +yKHD783vAHMeoij682OgcT28MF1ECgVO6bQ/dypQvgf0o2Ff8HkWRAeyqQ0JjBp4gpm
         o/NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V69ymUDW;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id q45si3551890eda.202.2019.10.22.06.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 06:50:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V69ymUDW;
       spf=pass (google.com: domain of drjones@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571752203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8qYxAI0WgSx6/CqYTtmZjD3iL28I4NbYPq9pRIVPNU=;
	b=V69ymUDWcmYKRcUwSj3mDn9IHjBOf+nKTBQ9UhIvWxH7DfU+ShqZaylchiDVVmfawfdQJ6
	bptP41o5PI2bZfZZVtVl+GPQQIGn3mYgeeNBI13v56S7j2MleYmgKqwjKaKAoM3tb/AtFV
	GsK3KayhXgOjKPJ3eIhOkmLK5+PNXg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-T-zk6OqVOVC4BXtf4backQ-1; Tue, 22 Oct 2019 09:50:00 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0275D800D4E;
	Tue, 22 Oct 2019 13:49:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EAAB4503;
	Tue, 22 Oct 2019 13:49:54 +0000 (UTC)
Date: Tue, 22 Oct 2019 15:49:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
Message-ID: <20191022134951.znjbk4piuiqwbveb@kamzik.brq.redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
 <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
 <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com>
 <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
 <CAFEAcA-bezS5tSVB+N223+N+xoYYYHuSJmDTaRCJgO+4Y=VjdQ@mail.gmail.com>
 <20191021161226.mnm6eomghb37xlby@kamzik.brq.redhat.com>
 <CAFEAcA-vHmtCi3HGqpu34sAaNxGeQwS_+0yZ5Hr4SbnGm+rjYA@mail.gmail.com>
 <CAFEAcA9o4G5yn0GzgdwvUnT_fEwRA7DChuV=miZaEvgavoU5xg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9o4G5yn0GzgdwvUnT_fEwRA7DChuV=miZaEvgavoU5xg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: T-zk6OqVOVC4BXtf4backQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-TUID: csc4hU7sTybt

On Tue, Oct 22, 2019 at 11:29:05AM +0100, Peter Maydell wrote:
> On Mon, 21 Oct 2019 at 17:18, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Mon, 21 Oct 2019 at 17:12, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Mon, Oct 21, 2019 at 04:43:22PM +0100, Peter Maydell wrote:
> > > > On Mon, 21 Oct 2019 at 15:23, Andrew Jones <drjones@redhat.com> wro=
te:
> > > > > Peter, would you mind running your test on the kvm32 machine with=
 this
> > > > > change before I send a v7?
> > > >
> > > > Still fails:
> > > >
> > > > pm215@pm-ct:~/qemu/build/arm$
> > > > QTEST_QEMU_BINARY=3Darm-softmmu/qemu-system-arm tests/arm-cpu-featu=
res
> > > > /arm/arm/query-cpu-model-expansion: OK
> > > > /arm/arm/kvm/query-cpu-model-expansion: **
> > > > ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:498:test_query_cpu_=
model_expansion_kvm:
> > > > assertion failed: (resp_has_props(_resp))
> > > > Aborted
> > > >
> > > > This is asserting on the line:
> > > > 498             assert_has_not_feature(qts, "host", "sve");
> > > >
> > >
> > > Oh, I see. It's not failing the specific absence of 'sve', but the te=
st
> > > code (assert_has_not_feature()) is assuming at least one property is
> > > present. This isn't the case for kvm32 'host' cpus. They apparently
> > > have none. We need this patch too, then
> > >
> > > diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> > > index 14100ebd8521..9aa728ed8469 100644
> > > --- a/tests/arm-cpu-features.c
> > > +++ b/tests/arm-cpu-features.c
> > > @@ -136,8 +136,8 @@ static bool resp_get_feature(QDict *resp, const c=
har *feature)
> > >  ({                                                                  =
   \
> > >      QDict *_resp =3D do_query_no_props(qts, cpu_type);              =
     \
> > >      g_assert(_resp);                                                =
   \
> > > -    g_assert(resp_has_props(_resp));                                =
   \
> > > -    g_assert(!qdict_get(resp_get_props(_resp), feature));           =
   \
> > > +    g_assert(!resp_has_props(_resp) ||                              =
   \
> > > +             !qdict_get(resp_get_props(_resp), feature));           =
   \
> > >      qobject_unref(_resp);                                           =
   \
> > >  })
> >
> > Yep, with that extra the test passes. I'm just rerunning the
> > full 'make check'...
>=20
> ...which passed OK. For the record, the changes on top of the
> patchset were:
>=20
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index 92668efb8f5..9aa728ed846 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -136,8 +136,8 @@ static bool resp_get_feature(QDict *resp, const
> char *feature)
>  ({                                                                     \
>      QDict *_resp =3D do_query_no_props(qts, cpu_type);                  =
 \
>      g_assert(_resp);                                                   \
> -    g_assert(resp_has_props(_resp));                                   \
> -    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
> +    g_assert(!resp_has_props(_resp) ||                                 \
> +             !qdict_get(resp_get_props(_resp), feature));              \
>      qobject_unref(_resp);                                              \
>  })
>=20
> @@ -417,8 +417,6 @@ static void
> test_query_cpu_model_expansion_kvm(const void *data)
>=20
>      qts =3D qtest_init(MACHINE "-accel kvm -cpu host");
>=20
> -    assert_has_feature(qts, "host", "pmu");
> -
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          bool kvm_supports_sve;
>          char max_name[8], name[8];
> @@ -428,6 +426,7 @@ static void
> test_query_cpu_model_expansion_kvm(const void *data)
>          char *error;
>=20
>          assert_has_feature(qts, "host", "aarch64");
> +        assert_has_feature(qts, "host", "pmu");
>=20
>          assert_error(qts, "cortex-a15",
>              "We cannot guarantee the CPU type 'cortex-a15' works "
> @@ -497,9 +496,6 @@ static void
> test_query_cpu_model_expansion_kvm(const void *data)
>          }
>      } else {
>          assert_has_not_feature(qts, "host", "sve");
> -        assert_error(qts, "host",
> -                     "'pmu' feature not supported by KVM on this host",
> -                     "{ 'pmu': true }");
>      }
>=20
>      qtest_quit(qts);
>

Thanks Peter!

The changes look good to me. If we wanted to, we could also add

 assert_has_not_feature(qts, "host", "pmu");

in that kvm32 block where we have the

 assert_has_not_feature(qts, "host", "sve");

and we could even add

 assert_has_not_feature(qts, "host", "aarch64");

there as well.

If I need to spin a v7, then I'll do that. I could also submit just those
additions as another patch, though, or even just not worry too much about
those cases and not add the tests...

Thanks,
drew
