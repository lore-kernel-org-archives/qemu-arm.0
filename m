Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04737CA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 23:03:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEafD-0004eb-AH; Wed, 07 Oct 2026 19:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEafA-0004dq-ME
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 19:03:04 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEaf8-0007d3-GR
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 19:03:04 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so19511266b.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 16:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791414181; cv=none;
 d=google.com; s=arc-20260327;
 b=q8k1Lzvdvwx5ZuA+XCFLMoRAY2V03jtecWchjwuiDltDB94AJBKV7fJh2j27+v2aRv
 Osowt0jt/iNhfzkRwgNYHODfAQhuxe8YRTijg+NepNzJlj73dhhxI8fkaQ6j4qluV7bg
 XOpjVzk9biBxzHDMzPEs7M6RdHKsz3WORg7D4j1e9ApehifgEKUXiuo7t5D8/fYypB3c
 zGxn8KL+on4F89TDqwsaJNJtM+E7TtFzY/AZUZsKd7zTlO4KvcsUhL8db/BIRcJ5M6RS
 3UUqb/UaMa2YEiLHfOH6cVSmyiH/t8ykV7orfxAUAcj1+aNZFx2QVdE3CEXn8obQLIxx
 rK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=eZGM6Bm9f+pChsYBGl3aR4v3S8XlttTKcga5IZaRWho=;
 fh=HdwEjYYxiZIM7RahxfxK5HXESN/DJNNgzI7AALKPgMk=;
 b=Ium84vbMB0e6danEvPGHLqMO/RprXNucGzPtteZxKH/w4z4wXQeKCsAt9sRCoRuzSK
 zwGtrQ48fx5BOT8H/csQdBfEMoNlzgsGDHa278yzxcums62uJMpw3fCOgtdPQOyXecrX
 M9vSeXO9DtOTCwhNtmHtQ9eBqP4RKJalLXqD0uI1ePVu7gLTn936oiAHsmJUnw10NHJg
 V6mpk+585bxgM5SluTlUVQomMW8zhQnj7e74Y0d84QImT2iO4nEQ+CvM5auOeIm4MmRO
 fnO8L0c98keig3CvyMiraaDZLSgcWUrISoe6lo9aUs+Czd8zcS0uHc5uBT4GYQL4gXo6
 sIvA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791414181; x=1792018981; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eZGM6Bm9f+pChsYBGl3aR4v3S8XlttTKcga5IZaRWho=;
 b=nstUwDjG3PYXqDgE0gnXgmJRv8Zgj/ClfydJawPZylYn0g9UfJ91oJqBspmip1Ld2S
 t0y2Zv0//yL3dtv9X3QNSThTiU0GlC8rCacR18eNSRKoul1dUSw2+QEsGSRvHXyVgKWk
 FpymQPgUuQuTtBIZ6xzIdx6pUtIQApgDN7MUtuY3bHTWd/vd49FxuiFHBzBZ6fdFoQvK
 80yjfgxQUF5W6/VsbQ33pugqZ0F48PHGl7o2Ag87qCtC/6qVrX1A0PFxZVmBFUukIbNy
 BlNMIWPW/oG29TNWkshok9e0OAO3sRgEKFDNCXmwqZWm41UfBLVJWD45nXt+Lhdb/0UP
 wnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791414181; x=1792018981;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eZGM6Bm9f+pChsYBGl3aR4v3S8XlttTKcga5IZaRWho=;
 b=LZBI9L9iDiaDww/WxMZ65nDzIegBbpluE1RRse6s3jRsL9XUs54aUDucBQqSyUbyJX
 H0yBITH5Hn69yPztAqxCu8R97eYrjNBI/W3LFMpc7ALEvdK9RpXsql0ApVvdR8RYNX+5
 gZrwboo2fhd80lz4k7+C9nqy1TFQrR81Wz6goJNszzAKMRrRNj4Z1K0wnEHrFVUwE/Nr
 wpjqlkS6QsdndBVqR5hNylHMb/8dGbsEkNsDqIys41tmsGiwpIkHWm35iFTQ2JAmRjg4
 HDg8Qfb8h4LR47bKapB64gfhpSHMB1JQa8gXUSkw9MByKY9MxKlga08nezP591wTH5L+
 vXIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw4k6yZRwvu7NOSqoR/kZW2dxXo5Ch75t2pgI59lqs0T/zq6fRMDmOhzIwS5VA5O4QdEQU4vQEXeA==@nongnu.org
X-Gm-Message-State: AFuF++lf57isBEp4yQWgXA/7J/V7CYpIKNLRHN/sM2BAP25lD1p16XbE
 AeAKWxiuOkB3W0wZzrmKtDnHwwwnjU/1+T4mZcLflryPxjNcrB1wbh+YAzpTo2gQJUCVR6hOEYQ
 l5nPlGX0m0ooSSqmWtiOL7OBO5cLQVVg=
X-Gm-Gg: AYBFou1lnC5S55hTiokYRFhqTkP1U2xykfTtqQPT7sCp1bCpoZElUDFJ1e1tdtcfLOE
 47DFRvw9aJxi+lHYhyikA4rtGewCyADtNfHiq8Yw2MdB8gMAq550NG05UDYUZX9DWYwK02Ne6pt
 gubh3bsyngV4D2ig/Gc94DogAP1T5qLdxlKGGXWEF3jZILuBdABC+7/n0XEKIC9L45BdQk0yMVS
 4HnomIsns8OJLBbUBWLSpkHqjG7JctXP5FCoYcOJBANkswa4L3NzwJoYePry1L9jbjyv2E7VvMj
 1NbsK6aPtuowPWU3iGusvMRnm0hOGdXBs7HDSWibWR8ZLuxNW6banqE=
X-Received: by 2002:a17:907:7211:b0:c2e:6570:6882 with SMTP id
 a640c23a62f3a-c3191aefe1bmr47550666b.10.1791414180719; Wed, 07 Oct 2026
 16:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-5-luoyonggang@gmail.com>
 <37275f1f-aee9-444b-aaed-3e0bf34b63cd@oss.qualcomm.com>
 <CAE2XoE_GmDbA5SSUb3k_9HwE+bxnBjK+kBj-RE5BonEBC=GpMw@mail.gmail.com>
 <919a1a75-78b9-42a9-93ed-9edf6757f707@oss.qualcomm.com>
In-Reply-To: <919a1a75-78b9-42a9-93ed-9edf6757f707@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 8 Oct 2026 07:02:46 +0800
X-Gm-Features: AclHuK97-4__VE_gu5Q2LVEVdudJU9WZ8bBVXNKl4QsfC6MqTigc3wyfr_Y9CLQ
Message-ID: <CAE2XoE-XeHnywvAGOCgxO30a_qCMgxbnBF5kjtStGa9=5D=Rkg@mail.gmail.com>
Subject: Re: [PATCH 4/8] target-info: replace QOM registration with a
 constructor list
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Oct 8, 2026 at 6:31=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/7/2026 1:50 PM, Yonggang Luo wrote:
> > On Thu, Oct 8, 2026 at 4:29=E2=80=AFAM Pierrick Bouvier
> > <pierrick.bouvier@oss.qualcomm.com> wrote:
> >>
> >> On 10/7/2026 4:48 AM, Yonggang Luo wrote:
> >>> Register target definitions through constructors instead of
> >>> MODULE_INIT_TARGET_INFO, making target_info_list() and target_info()
> >>> available on entry to main(), without explicit initialization or a
> >>> call to module_call_init(MODULE_INIT_QOM).
> >>>
> >>> Keep the target list sorted by target_arch and default to its first
> >>> entry. Provide an unknown TargetInfo fallback for target-independent
> >>> tools such as qemu-img and unit tests that link no target-info-def.c
> >>> objects.
> >>>
> >>> Remove the obsolete QOM target-info registration infrastructure and
> >>> update the multi-target test to inspect target information before
> >>> initializing QOM.
> >>>
> >>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>> ---
> >>>  include/qemu/module.h           |  1 -
> >>>  include/qemu/target-info-def.h  | 56 +++++++++++++++++++++++++++---
> >>>  include/qemu/target-info-init.h | 53 ----------------------------
> >>>  include/qemu/target-info-qom.h  | 31 -----------------
> >>>  include/qemu/target-info.h      |  9 +++++
> >>>  meson.build                     |  6 ++--
> >>>  system/vl.c                     |  4 ---
> >>>  target-info-def.c               |  1 -
> >>>  target-info-qom.c               | 60 -------------------------------=
-
> >>>  target-info.c                   | 61 +++++++++++++++++++++++++++++++=
+-
> >>>  tests/qtest/fuzz/fuzz.c         |  3 --
> >>>  tests/unit/test-multi-target.c  | 12 +++----
> >>>  12 files changed, 129 insertions(+), 168 deletions(-)
> >>>  delete mode 100644 include/qemu/target-info-init.h
> >>>  delete mode 100644 include/qemu/target-info-qom.h
> >>>  delete mode 100644 target-info-qom.c
> >>>
> >>
> >> This approach (custom list based) was considered before implementing
> >> things with QOM Types. The rationale I followed was that if everything
> >> is in QOM, we might better follow that for consistency sake.
> >> Yes, the compromise if that we need an extra init step, but it was not=
 a
> >> problem to add it.
> > I have issue to add the init step for unit-tests, and hard to write the=
 -target
> > parse procedure and get it right. Not means this won't work. but for
> > me, too much
> > coupled.
> >
>
> We already have such a test upstream:
> https://gitlab.com/qemu-project/qemu/-/blob/master/tests/unit/test-multi-=
target.c#L35
>
> The init sequence is quite straightforward:
>
> ```
> /* initialize target types, and only them */
> module_call_init(MODULE_INIT_TARGET_INFO);
>
> /* we can get the list if we want, for -target or any other purpose */
> g_autoptr(GSList) targets =3D object_class_get_list(TYPE_TARGET_INFO, fal=
se);
>
> /* set the global target info from any element in this list */
> TargetInfo* ti =3D ...;
> target_info_qom_set_target_info(ti);
>
> /* register rest of QOM types */
> module_call_init(MODULE_INIT_QOM);
> ```
>
> It works fine to implement -target (if we would like to do it), since I
> implemented it myself. That was also my initial motivation by the way.
>
> Also, I appreciate that target-info is NULL by default, it crashes
> loudly when it has not been set, and make it easy to find who depends on =
it.
>
> > If we treat target_info as a QOM, but QOM needs target_info to set
> > up(is_avaible). That makes
> > the init sequence too much of a burden.
> >
>
> See sequence above, the solution is to initialize TARGET_INFO first,
> before the rest of QOM. You end up with the same result than with a
> statically initialized list.
>
> >
> > is_available is depends on target_arch
> > And before this patch, target_arch depends on QOM, pulls user/softmmu b=
ecause
> > target_info_init. By moving target-info to be a custom list based, we
> > can decouple
> > target-info from qom/softmmu/user. and target-info will always
> > available once "main(argv, argc)" is entered. We also have the
> > advantage of doing all sorts
> > of tests against it.
> >
>
> Which kind of tests are you trying to add?
>
> For now, the exact list of places where we need to do this initialize
> target dance are:
> - system/vl.c:    module_call_init(MODULE_INIT_TARGET_INFO);
> - tests/qtest/fuzz/fuzz.c:    module_call_init(MODULE_INIT_TARGET_INFO);
> - tests/unit/test-multi-target.c:

# Multi targets test
if multi_target_objects !=3D []
  test('test-multi-target',
       executable('test-multi-target',
                  sources: [multi_target_crates, files('test-multi-target.c=
')],
                  dependencies: multi_target_deps,
                  objects: multi_target_objects,
                  link_depends: [block_syms, qemu_syms],
                  link_args: multi_target_link_args),
       suite: ['unit'])
endif

I see this test, I am trying to add tests that do not pull so many
multi_target_objects, as it would be huge.
Just pull qom only.  And I am trying to call target_info() in
object.c, as inspect machines with
qemu-system is rejected, so maybe that's not an issue anymore


I means Subject: [PATCH v3 00/10] machine: uniquify virt QOM names
https://lore.kernel.org/qemu-devel/20260926081551.29-1-luoyonggang@gmail.co=
m/#r

So the current design always rejects types that do not belong to the
current target. Listing them
all is not an option at all. With this restriction, then these are
indeed not needed.
So I'll wait for your work first, otherwise it's always conflicting.


> module_call_init(MODULE_INIT_TARGET_INFO);
>
> If we want more tests, I'm totally ok to move this init code to
> target-info.c, and replace call sites if needed.
>
> >
> > Tools such as qemu-img and unit tests may link target-info.c without an=
y
> > target-info-def.c objects. Their target list remains empty, so use this
> > fallback.
> >
>
> Why should this tool get access to target list? qemu-img deals with disk
> images, and is unrelated to targets.
>
> >
> > static TypeImpl *type_register_internal(const TypeInfo *info)
> > {
> >     TypeImpl *ti;
> >
> >     if (!type_name_is_valid(info->name)) {
> >         fprintf(stderr, "Registering '%s' with illegal type name\n",
> > info->name);
> >         abort();
> >     }
> >
> >     if (info->is_available && !info->is_available()) {
> >         return NULL;
> >     }
> >
> >     ti =3D type_new(info);
> >
> >     type_table_add(ti);
> >     return ti;
> > }
> >
> >>
> >> Is there another good value this list approach brings compared to what
> >> exists?
> >>
> >> Regards,
> >> Pierrick
> >
> >
> >
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

