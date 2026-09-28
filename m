Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8A8CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB82b-0007NU-3a; Mon, 28 Sep 2026 05:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB82Z-0007My-DS
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:52:55 -0400
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB82X-00087E-FQ
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:52:55 -0400
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6ac62c88c7cso2173617a12.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790589171; cv=none;
 d=google.com; s=arc-20260327;
 b=cgE2OAotrBC66TlqlPMbrkfe783wdKSd0btyGX8JQqRRhV4G6zI4zzClUK8NnmTb6f
 elREpkiBLUu1+t7GLknPwbZzUza8hVHARLvi29T/JACrx9Iv9rUAgR4CUJQrrjWYLNow
 gsjRo6byVV8mQ0RKmWxlz9vXavRFbeE9XXP5g1zyoZ+ae9JrEO05b8eoAV0WoK1JKJy3
 Z2IiPCDO5sxVGkodMeULDqGw4o1gheV1oNRJJj+ECEZlIvkNb3btr/5IGmpUBjH+DNHe
 YXYKel921XGruT3NstlkLsPyTCbB9HHz3nYlO1FyxZIXP99w0fev1jx4c6MNHUJNrTjN
 5U7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=16hfC2LW9swJl28G+eFKHSzYGTOo/LpaFUTErsNFz7E=;
 fh=ZJ3Ai58cWAoaB5aMqr1M46aHwHiha3GSF4R/+alYJ/o=;
 b=BOOGxzoXVe8aasm4Cci7Ko7mSyYFRSWo4wt+LLlEIddFCxVUnSlTqulvcrt2v1LrJT
 TjcKpRp6sCK1dXwFTW7GDoGjipMbxBETTLAADFgbCLd34dTyKW8oMAF8ESfe2hx9CJH+
 DP0UVGNDaubmGSusUBClEyP7YxWwBeXQIyKLOvFKAv+TExavhIk4vQY7wzOmheKyEex5
 0CYonXTEDeB+ojrIyPURWOZxC1n5Fh5k9ga5n/+7cWw+EBP/o7FtskY9hA5szauj2YzI
 VwnrrU5GCBcV6a447SA28n0JbcjgmuytLUlsXg0b9Jmu+j9c8dsBWdjR/mrZZS9u+ygo
 WqBA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790589171; x=1791193971; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=16hfC2LW9swJl28G+eFKHSzYGTOo/LpaFUTErsNFz7E=;
 b=BiKPBRbbm9Xbyn+Ot6RjjGMYxw5pjzuUh7TYqo0LEddKhWu43CszUNqPku6OQYb1VN
 Kj5jOtE3stlZW/NXO5Opo8152QD/RGlAuARQ4goTR7lQ1pMJHg5SQe0BcHGfNlaX6Z6w
 Ox3dglTaBxm7dTfOTviqzKbsF9BRBC4x9nxj9xSc9NaMSEf+nZzAfcO1ei1TXH180LAF
 70N0xvVfOsf1y69TTO3wa9fccbvYDNwzbVPEo3keMrrAxghg/nCYf1Q9QmxDigVVaic5
 J95UxIWmFkvdKQRG/dr5LcfEnr4aQRVe9snlwL1EYtYTHOhdSiO3PkLf/axU8EUBSHST
 FVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790589171; x=1791193971;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=16hfC2LW9swJl28G+eFKHSzYGTOo/LpaFUTErsNFz7E=;
 b=u/y55GCjBCCtlRp5tkZKmD7va42T/8AFNFsM9kLwLE77Fa7MzaP1G0njAnQxRedrGq
 7sX6UcQgDcwNRvqtsirI4JzAURr3lXs1LDkWnT++3o3wily/fheFgsdMrzUZitbAoCt3
 9sF1GU8EJ0mRnIP1xxH13Y/JP74zsdB19xKxi0RUp6aDGh443pfHUEGr/iHxMZfLHOqA
 ERFdmVT9G5pk6MdB0tGP4RlVp4yJdNump+8G6qR2dCnZMNMBBHYVhfBi81SbGS2jDYTk
 jIkAPVkRQF193/+0sq+dnZx4oclTZK3yFlwQvoGW4IDGDhA0hfM6pcAd6kmCg/UHJu1G
 OgPA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZQfEGITeaLIV4XFCCjf3vtw0n04oZS4BJ72THripNzhlxV9Lxl7r/7gKb6jY+ZVDlV0oW6lthwg==@nongnu.org
X-Gm-Message-State: AFq9FYLH1m50EHHojmDO6lQXrQ8A28lCs8Eh4OP2XeUXCeLz9C9wLEwz
 ih5I4ZhBxdhAAq+UxAf6lAcYHH9hnm4fWiZv4j2xORZLkXYo7Wiun7yEuj+h9A0wjAN98jtKQSO
 WVPleSWQ3JcmiExOvexXp4yJflGzxl/o=
X-Gm-Gg: AYBFou2HNJuc10eU1d2nFzeC6aDDEi0CPH5h0mNz9mHobQ5mJWR2NBDasQeCHCiBebi
 aot5v9lObSlouY1Voco/6z5oiQRSjjVrsf4IFUjnpjYk9Z2jqghvgtYuLLlwiuDdQ9r8WAAWM0l
 sxn/HS4rs4MOfPhg+33asyUTpSFc1dLsz8xsTjkKlItTW3R2Im0Yg1WU1Yb/Zm3R/MC8UK3Pn21
 HSp45VSCXSXzn5HgOYnDElBWb3G1TawStjCMOotz5J9a2L8VzoadJQkxFdrY/0wMOONfwAHDhkh
 o2txkdPdnb1nXVio/2/w+KYJJVErL3h1bpRCm3N7KAbAIgDtRhTIWfQ=
X-Received: by 2002:a05:6402:3806:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6aae8f391b3mr6492934a12.30.1790589170871; Mon, 28 Sep 2026
 02:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-8-luoyonggang@gmail.com>
 <87zex1hhhj.fsf@pond.sub.org>
 <CAE2XoE9_R13NsUWu-s12QA9RBJykR87TEMh3VmndNEXQsCkNtg@mail.gmail.com>
 <aro2vIQRSspHUbju@redhat.com>
In-Reply-To: <aro2vIQRSspHUbju@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 28 Sep 2026 17:52:37 +0800
X-Gm-Features: AclHuK-o85qHlkeeo97uV89smy_E5G2VyjR6dbfSwGc6ZJKpdP_USxFaQlJ3OC4
Message-ID: <CAE2XoE8ASdhTpk9ncx8my2gRCwQO2QpvV9mwqDc+UxHFG-pxcA@mail.gmail.com>
Subject: Re: [PATCH v4 07/55] tests/unit: add test-target-info
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000077f0cf065c880790"
Received-SPF: pass client-ip=2a00:1450:4864:33::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--00000000000077f0cf065c880790
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:43=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:
>
> On Mon, Sep 28, 2026 at 05:21:06PM +0800, Yonggang Luo wrote:
> > On Mon, Sep 28, 2026 at 5:07=E2=80=AFPM Markus Armbruster <armbru@redha=
t.com>
wrote:
> > >
> > > Yonggang Luo <luoyonggang@gmail.com> writes:
> > >
> > > > Collect each target-info-def.c object in target_info_def_objects,
> > > > keyed by target dir. Link every value so constructors fill the
> > > > list. Assert target_info() is not NULL and target_info_list() has
> > > > one entry per linked object.
> > > >
> > > > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > >
> > > Doesn't compile for me:
>
> snip
>
> > >
> > > I have meson 1.8.5.
> > >
> >
> > Hi, It's because I use a feature from meson 1.10.0, you can install
meson
> > 1.12.0 for it. and the remote branch I also fixed for KVM and got gitla=
b
> > running. but for this series you need to install meson 1.12.x
>
> There needs to be a patch in this series that bumps the required
> meson version then.

Yeap, my bad, I did not run the gitlab-ci before(because too much work),
the newest branch get ci passed, and more patches needs.

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000077f0cf065c880790
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Sep 28, 2026 at 5:43=E2=80=AFPM Daniel P. =
Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.co=
m</a>&gt; wrote:<br>&gt;<br>&gt; On Mon, Sep 28, 2026 at 05:21:06PM +0800, =
Yonggang Luo wrote:<br>&gt; &gt; On Mon, Sep 28, 2026 at 5:07=E2=80=AFPM Ma=
rkus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com<=
/a>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Yonggang Luo &lt;<a href=
=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt; writes:<br>=
&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; Collect each target-info-def.c object=
 in target_info_def_objects,<br>&gt; &gt; &gt; &gt; keyed by target dir. Li=
nk every value so constructors fill the<br>&gt; &gt; &gt; &gt; list. Assert=
 target_info() is not NULL and target_info_list() has<br>&gt; &gt; &gt; &gt=
; one entry per linked object.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt=
; Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">=
luoyonggang@gmail.com</a>&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Doesn&#39=
;t compile for me:<br>&gt;<br>&gt; snip<br>&gt;<br>&gt; &gt; &gt;<br>&gt; &=
gt; &gt; I have meson 1.8.5.<br>&gt; &gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Hi=
, It&#39;s because I use a feature from meson 1.10.0, you can install meson=
<br>&gt; &gt; 1.12.0 for it. and the remote branch I also fixed for KVM and=
 got gitlab<br>&gt; &gt; running. but for this series you need to install m=
eson 1.12.x<br>&gt;<br>&gt; There needs to be a patch in this series that b=
umps the required<br>&gt; meson version then.<br><br>Yeap, my bad, I did no=
t run the gitlab-ci before(because too much work), the newest branch get ci=
 passed, and more patches needs.<br><br>&gt;<br>&gt; With regards,<br>&gt; =
Daniel<br>&gt; --<br>&gt; |: <a href=3D"https://berrange.com">https://berra=
nge.com</a> =C2=A0 =C2=A0 =C2=A0 ~~ =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"h=
ttps://hachyderm.io/@berrange">https://hachyderm.io/@berrange</a> :|<br>&gt=
; |: <a href=3D"https://libvirt.org">https://libvirt.org</a> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0~~ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https:/=
/entangle-photo.org">https://entangle-photo.org</a> :|<br>&gt; |: <a href=
=3D"https://pixelfed.art/berrange">https://pixelfed.art/berrange</a> =C2=A0=
 ~~ =C2=A0 =C2=A0<a href=3D"https://fstop138.berrange.com">https://fstop138=
.berrange.com</a> :|<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>You=
rs<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo
</div>

--00000000000077f0cf065c880790--

