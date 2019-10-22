Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5805180wrm;
        Tue, 22 Oct 2019 03:29:17 -0700 (PDT)
X-Received: by 2002:aca:f545:: with SMTP id t66mr2222054oih.124.1571740157707;
        Tue, 22 Oct 2019 03:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571740157; cv=none;
        d=google.com; s=arc-20160816;
        b=kuMW6akBAamKTT3qe3AJt4933l/60KSO3oGRegCsBFuuayxc27jLc7U9UBzu0JghxN
         5sRUXDuTrghxRB4LneLny/QG7gsXIsHucjcaUENskI0rbscNoxfZ9N00bGtR8rR7WwbL
         PBXC13m7rhfsKRkond88uYw1z/O66crL99oxm+PvkQMddAwPjltXBEBnkC/A2NBjuZWe
         qI8zE13IOD2JCyEu8O7Dd7pR4M3n/kazk4NOsD7w17Q2Lqi+AjYzGukGMjEjuoodIBnr
         hO3w5y6UiBO8yEuISfwN45ZuYCBeGAgi1tgp+aOCedrjPOkuoGy98EDdi0FvyJyhweeL
         jg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f9SpE5RTTZ9ZFtnVBG8aQnaKHU7QG2XbFcYcpWytK8s=;
        b=WB4Ri8cWVkZj4RrRlVXJEqjMXiyu5ATtebeVZ9431DpuaZ7D46D+QJ6fOvG2KLkZwp
         s+0MqX4DOdmvTPfO4dsTEXmwWfQSAyaRFegICMPvjgFARReCBTY/Y5GnGhTECHG97Gco
         pQv1OF078hDnU6jdbDeipsVZVkHplg4xNZF5FAVf3Z8jJNjHklJ5VjMozhhyUNxX7fl3
         NVCqMr5ZbLcnO/77sHpo5jFB6Nq1ZH8lnEWH6RO69JBlJe2hDH3q/QKMqLnaQZEFHz8M
         b9OafkdTVTk9zrVKra2oLx0qFnAVfaetlhFpg16iQbKyqW8ueCwEpIiCKctoru0uH/v7
         Jf7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y9155m/v";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m12sor628537oic.108.2019.10.22.03.29.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2019 03:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y9155m/v";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9SpE5RTTZ9ZFtnVBG8aQnaKHU7QG2XbFcYcpWytK8s=;
        b=Y9155m/vcXFPXIMF+Bpf1+RO1U45HDCFyjok1dDav+gTgGhT0AcDOsMJcZEo8SpvdF
         I60Vi5ALZ3w5dJ9s50osXofurJVtTLV3/H94ouYzIW0Zwk5blEEFW9XhXzIHYcjLLL4a
         bLbmZ0A64mGP1HC6HfPXQvCrxhHDeb2Ae6BJdYF1wC9Ba34Cj1Z8GDDE82EKGsvcJ3iV
         DoaFWbuhDoBBHumFjsu/PVLz1X7616jeiVIYPf6OxvFaPWrVhqyr9m6Ec2FCZTAF5Mgk
         XLfxxOcCS0Rf4ZwcM25rT1IVUHr4AR/YK4xF6AGgnF8yg9+dDI0y1pdHux0C9yIK+Jrx
         TciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9SpE5RTTZ9ZFtnVBG8aQnaKHU7QG2XbFcYcpWytK8s=;
        b=imncTc0x4yQeAVIpsZFrogXYKbMUjnOQcBBGVQFmrRTvxNors3uhkwBqWODecch4Ih
         h+FfgduMzxMU9/RsLM7FOB3j73dCISXvTVPxJmhrhlYEy4LK9GgGs06mi3l01GFAMfjc
         40Uj/ismAHaR8sDR6cPTBCDJuWI120DQrjsiwKqSabbvednMFva8DS5/LjTkJURmXrqn
         LKztGUBHtYgFZnPK9y+6BD6AfoebBEPRpKOA6cDUgK+i5aKN44ouccFA9NW7n8YtfxeQ
         Xwvr3Os/ywRh0g1PT4sc26c563LiOrsoSzwbfuwM3uOxJ1y8f0U3a9jRHkzOCE+hf3Kg
         fuKg==
X-Gm-Message-State: APjAAAUyfyld0MQHK1zDHqkFDIbCQw1jNM9Mw2pxJLGsYHP+LzgIY6iu
	yfTyrikua3xXBi/wvyaJY5UNUVxL4gZK1BNZB8PpWTto
X-Google-Smtp-Source: APXvYqyVvBpryFNHl2V2uDrohuAXnWC9ZE3495cppPYaUgJ+hfuqsDdi1143t+oqAtc4dbplC23m7ANLgG3LXjIWt/M=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr2339378oic.98.1571740157184;
 Tue, 22 Oct 2019 03:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085408.24360-1-drjones@redhat.com> <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
 <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com> <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
 <CAFEAcA-bezS5tSVB+N223+N+xoYYYHuSJmDTaRCJgO+4Y=VjdQ@mail.gmail.com>
 <20191021161226.mnm6eomghb37xlby@kamzik.brq.redhat.com> <CAFEAcA-vHmtCi3HGqpu34sAaNxGeQwS_+0yZ5Hr4SbnGm+rjYA@mail.gmail.com>
In-Reply-To: <CAFEAcA-vHmtCi3HGqpu34sAaNxGeQwS_+0yZ5Hr4SbnGm+rjYA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 11:29:05 +0100
Message-ID: <CAFEAcA9o4G5yn0GzgdwvUnT_fEwRA7DChuV=miZaEvgavoU5xg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: qU0JMxcNRx+x

On Mon, 21 Oct 2019 at 17:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 21 Oct 2019 at 17:12, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 04:43:22PM +0100, Peter Maydell wrote:
> > > On Mon, 21 Oct 2019 at 15:23, Andrew Jones <drjones@redhat.com> wrote:
> > > > Peter, would you mind running your test on the kvm32 machine with this
> > > > change before I send a v7?
> > >
> > > Still fails:
> > >
> > > pm215@pm-ct:~/qemu/build/arm$
> > > QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm tests/arm-cpu-features
> > > /arm/arm/query-cpu-model-expansion: OK
> > > /arm/arm/kvm/query-cpu-model-expansion: **
> > > ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:498:test_query_cpu_model_expansion_kvm:
> > > assertion failed: (resp_has_props(_resp))
> > > Aborted
> > >
> > > This is asserting on the line:
> > > 498             assert_has_not_feature(qts, "host", "sve");
> > >
> >
> > Oh, I see. It's not failing the specific absence of 'sve', but the test
> > code (assert_has_not_feature()) is assuming at least one property is
> > present. This isn't the case for kvm32 'host' cpus. They apparently
> > have none. We need this patch too, then
> >
> > diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> > index 14100ebd8521..9aa728ed8469 100644
> > --- a/tests/arm-cpu-features.c
> > +++ b/tests/arm-cpu-features.c
> > @@ -136,8 +136,8 @@ static bool resp_get_feature(QDict *resp, const char *feature)
> >  ({                                                                     \
> >      QDict *_resp = do_query_no_props(qts, cpu_type);                   \
> >      g_assert(_resp);                                                   \
> > -    g_assert(resp_has_props(_resp));                                   \
> > -    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
> > +    g_assert(!resp_has_props(_resp) ||                                 \
> > +             !qdict_get(resp_get_props(_resp), feature));              \
> >      qobject_unref(_resp);                                              \
> >  })
>
> Yep, with that extra the test passes. I'm just rerunning the
> full 'make check'...

...which passed OK. For the record, the changes on top of the
patchset were:

diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
index 92668efb8f5..9aa728ed846 100644
--- a/tests/arm-cpu-features.c
+++ b/tests/arm-cpu-features.c
@@ -136,8 +136,8 @@ static bool resp_get_feature(QDict *resp, const
char *feature)
 ({                                                                     \
     QDict *_resp = do_query_no_props(qts, cpu_type);                   \
     g_assert(_resp);                                                   \
-    g_assert(resp_has_props(_resp));                                   \
-    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
+    g_assert(!resp_has_props(_resp) ||                                 \
+             !qdict_get(resp_get_props(_resp), feature));              \
     qobject_unref(_resp);                                              \
 })

@@ -417,8 +417,6 @@ static void
test_query_cpu_model_expansion_kvm(const void *data)

     qts = qtest_init(MACHINE "-accel kvm -cpu host");

-    assert_has_feature(qts, "host", "pmu");
-
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
         char max_name[8], name[8];
@@ -428,6 +426,7 @@ static void
test_query_cpu_model_expansion_kvm(const void *data)
         char *error;

         assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature(qts, "host", "pmu");

         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "
@@ -497,9 +496,6 @@ static void
test_query_cpu_model_expansion_kvm(const void *data)
         }
     } else {
         assert_has_not_feature(qts, "host", "sve");
-        assert_error(qts, "host",
-                     "'pmu' feature not supported by KVM on this host",
-                     "{ 'pmu': true }");
     }

     qtest_quit(qts);


thanks
-- PMM
