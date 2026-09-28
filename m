Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74450C9832F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:21:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7Y8-0004Jk-MV; Mon, 28 Sep 2026 05:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB7Y6-0004J9-BS
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:21:26 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB7Y3-00056o-Is
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:21:26 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a60591ae54so4362164a12.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790587280; cv=none;
 d=google.com; s=arc-20260327;
 b=hNXhlA5mlw1tKXXHNMz8BvadyFVWb1k9CqVMQVsC333O71WBldO8Dcjfr/IwMOvgRJ
 N5yMnt1qDFZGuhHEx98qwl/rU5mgCFTSZ7BWJFhpn0GpwWPG3ZE25/CaByu6gWSdo/FU
 ZSQTgSblBtw97lNQTtJQOWC050Jv0f7ZULLGSh/r6HtFmvPKBOAzWcl/zdMVn2SX/nR1
 nfTr24xbZMzioZ0ZGUpYf4X/VSteZZS4BvfJdPcLttp/I40J+w/BNLUbT7v092XWblaD
 myEeJAW4RecrHefX9Sm7QK1Od1ruyucBcJPa/Yiye8qQVSI1GDc9khT7j9By7sGIfDSq
 FVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BaD9gTLRQUl+GaSgB7F/ge7MYAXO7CUa8FzcMMr2ZCQ=;
 fh=Gi9wtIYKYssP3ay0VRrVFKF81kLZkAKOgB0H2MGLcKw=;
 b=EAXgS7c8BKytncDKKiy47nJJd6cqcqCfzT26aEm36Isi53bDc/FT9g3bYGaGQXZHX/
 M5+MC7LUV94/o4h6lrQuxVlR7zxwwSqup65C/LC/yFDmN/74goN4fFtbtZwEtSUBdzc8
 6l4Ib2TOZrQAHUTVSJakT3DnCauZMWGnkUC97WWIEV2117yspeIsi71tnwZsK79L1vjR
 qNI0KGWlFLnDzCvxo5lI2X5N3RfGK6lPlHmxxCWYwJE3d7FzIP/nERHEgYXdZ16UzvJ9
 c117KLrSrLTRvWx/FR0HzCDafSwfb0sk/3s6sWujNREDaZdtgupg/1uYeqOnj0m2ZXNd
 sfaA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790587280; x=1791192080; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BaD9gTLRQUl+GaSgB7F/ge7MYAXO7CUa8FzcMMr2ZCQ=;
 b=myj5srgZ9+yI08hIs4xNsdXp2/qE2F/sBsdaeSLM0GHdbk6ivqYKZpF7ehrXluvpxi
 eRqLhcc47i7hG7aki0MaX/awW+XQLdONfcn7JiSLjKx33iLyfSvphA7eu/rrxFsb9H/j
 BCSiv5tT1RHRPjAChxVoAgkfImCwyAKxIx5mwKPRi3+YXsRL9OAYlYThrf3SrsqaOJ8g
 K5Dz4SSbA5IXNt1kYedb7Jk5g/8xNXoEmzOUE+OjRdk1zkngM434pQxW2LgzoTH12TdV
 QDNyNIIeSWtGGkVTKz4iyemejksv3PIIyxY74Gc4LnwRdvxZYHJPMBGziEXbbKqc9rd6
 1rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790587280; x=1791192080;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BaD9gTLRQUl+GaSgB7F/ge7MYAXO7CUa8FzcMMr2ZCQ=;
 b=iPH2urOJUYZIhFBc4+koNqe0aeoF3Gx5cQqm+fypFriA9ntGcF6+oxWXfCKkvbUssi
 U1gTwNill1gUkShfLi0ccqAL8hj3ls3PFPxf+B7BIW5V/1zOs+dtbgVnCZoyZjh9Lw8u
 /1FZiH4iysA0qgBccouQ5PrveQUEBBrUam1LTikmBSO1bCHNHdN2/bJvNnq8/3i7oPvp
 oSeSsxhKx7Oy1b8iaCqu+sTboUBB6CX+zA+yafT4bK0jwW3ugL46IcDYYm7yuo27Cbjs
 MrjFtcy/fHx6qk5QJT2xzE5mx8GJo3Hsbj6jhsRUI6EckNDrHyIW8vLEtu/0rWPXoR5o
 w+iQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+n0Q4vFACGQ4O71yTt2wfpXlkRglRLZIKiWwUMyorrItwgcEkeDZ8KiDDtcYB+oIVQz5sOHytsw==@nongnu.org
X-Gm-Message-State: AFq9FYIeGxv51Pay2Smq+eLUlUnXYMZnOfHmVk01vmxBkMI+dfo1xLR6
 6q+IJjJoSGcFSVug3qHN/C2UyyAmXjNwrHVx/KBr6pA4LuPqk0utb+nxEg8I30t/HTQIV/GdP3W
 pODndkCZgTt5Z+JgOAJ1KEvsDICmnvSE=
X-Gm-Gg: AYBFou0vvqC0p7vCneXwlj8f+qHrSVBmne1ThazSHRsZzQq1MKPOgTr93naPynzIEzP
 e1nP+bKmhooyZiEGL7ZYOb2h2TuPhQAZi0HIgi+mlrrPsYepTofM5gCn15ezLHN9423tuld7JhY
 etwbunj8o0/MWrSX6XWmK5IaTJS/DV5EvdajytA1jL4WyL5qHMSvXWBSvHgqs3B239C3CPp2c0j
 Z9cPXaUp5+mwSQbQuehipuKw1bsfe4WyN7Qr9Oun/0nNdWWsZBxATMsRHB/tlwTkJdI6KQ8xY0S
 hsFy1AJN6CS6LouqtIRwA6eRlRPm4+ai45OAs36nNMeSw7pHzIHYSiA=
X-Received: by 2002:a05:6402:43ca:b0:6aa:f809:ef40 with SMTP id
 4fb4d7f45d1cf-6aaf809f25fmr5698928a12.28.1790587280073; Mon, 28 Sep 2026
 02:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-8-luoyonggang@gmail.com>
 <87zex1hhhj.fsf@pond.sub.org>
In-Reply-To: <87zex1hhhj.fsf@pond.sub.org>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 28 Sep 2026 17:21:06 +0800
X-Gm-Features: AclHuK-lburuGsp0597nwjJbOsl0IgXfPGG1dSZcoBfVhOTpTxugPjtZMvEfng0
Message-ID: <CAE2XoE9_R13NsUWu-s12QA9RBJykR87TEMh3VmndNEXQsCkNtg@mail.gmail.com>
Subject: Re: [PATCH v4 07/55] tests/unit: add test-target-info
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000c4a926065c8796e1"
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000c4a926065c8796e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 5:07=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Yonggang Luo <luoyonggang@gmail.com> writes:
>
> > Collect each target-info-def.c object in target_info_def_objects,
> > keyed by target dir. Link every value so constructors fill the
> > list. Assert target_info() is not NULL and target_info_list() has
> > one entry per linked object.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>
> Doesn't compile for me:
>
> ../tests/unit/meson.build:47:37: ERROR: Unknown method "values" in object
<[DictHolder] holds [dict]: {'aarch64-linux-user': <ExtractedObjects
'qemu-aarch64-linux-user': [<File: target-info-def.c (not built)>]>,
'aarch64_be-linux-user': <ExtractedObjects 'qemu-aarch64_be-linux-user':
[<File: target-info-def.c (not built)>]>, 'alpha-linux-user':
<ExtractedObjects 'qemu-alpha-linux-user': [<File: target-info-def.c (not
built)>]>, 'arm-linux-user': <ExtractedObjects 'qemu-arm-linux-user':
[<File: target-info-def.c (not built)>]>, 'armeb-linux-user':
<ExtractedObjects 'qemu-armeb-linux-user': [<File: target-info-def.c (not
built)>]>, 'hexagon-linux-user': <ExtractedObjects
'qemu-hexagon-linux-user': [<File: target-info-def.c (not built)>]>,
'hppa-linux-user': <ExtractedObjects 'qemu-hppa-linux-user': [<File:
target-info-def.c (not built)>]>, 'i386-linux-user': <ExtractedObjects
'qemu-i386-linux-user': [<File: target-info-def.c (not built)>]>,
'loongarch64-linux-user': <ExtractedObjects 'qemu-loongarch64-linux-user':
[<File: target-info-def.c (not built)>]>, 'm68k-linux-user':
<ExtractedObjects 'qemu-m68k-linux-user': [<File: target-info-def.c (not
built)>]>, 'microblaze-linux-user': <ExtractedObjects
'qemu-microblaze-linux-user': [<File: target-info-def.c (not built)>]>,
'microblazeel-linux-user': <ExtractedObjects
'qemu-microblazeel-linux-user': [<File: target-info-def.c (not built)>]>,
'mips-linux-user': <ExtractedObjects 'qemu-mips-linux-user': [<File:
target-info-def.c (not built)>]>, 'mips64-linux-user': <ExtractedObjects
'qemu-mips64-linux-user': [<File: target-info-def.c (not built)>]>,
'mips64el-linux-user': <ExtractedObjects 'qemu-mips64el-linux-user':
[<File: target-info-def.c (not built)>]>, 'mipsel-linux-user':
<ExtractedObjects 'qemu-mipsel-linux-user': [<File: target-info-def.c (not
built)>]>, 'mipsn32-linux-user': <ExtractedObjects
'qemu-mipsn32-linux-user': [<File: target-info-def.c (not built)>]>,
'mipsn32el-linux-user': <ExtractedObjects 'qemu-mipsn32el-linux-user':
[<File: target-info-def.c (not built)>]>, 'or1k-linux-user':
<ExtractedObjects 'qemu-or1k-linux-user': [<File: target-info-def.c (not
built)>]>, 'ppc-linux-user': <ExtractedObjects 'qemu-ppc-linux-user':
[<File: target-info-def.c (not built)>]>, 'ppc64-linux-user':
<ExtractedObjects 'qemu-ppc64-linux-user': [<File: target-info-def.c (not
built)>]>, 'ppc64le-linux-user': <ExtractedObjects
'qemu-ppc64le-linux-user': [<File: target-info-def.c (not built)>]>,
'riscv32-linux-user': <ExtractedObjects 'qemu-riscv32-linux-user': [<File:
target-info-def.c (not built)>]>, 'riscv64-linux-user': <ExtractedObjects
'qemu-riscv64-linux-user': [<File: target-info-def.c (not built)>]>,
's390x-linux-user': <ExtractedObjects 'qemu-s390x-linux-user': [<File:
target-info-def.c (not built)>]>, 'sh4-linux-user': <ExtractedObjects
'qemu-sh4-linux-user': [<File: target-info-def.c (not built)>]>,
'sh4eb-linux-user': <ExtractedObjects 'qemu-sh4eb-linux-user': [<File:
target-info-def.c (not built)>]>, 'sparc-linux-user': <ExtractedObjects
'qemu-sparc-linux-user': [<File: target-info-def.c (not built)>]>,
'sparc32plus-linux-user': <ExtractedObjects 'qemu-sparc32plus-linux-user':
[<File: target-info-def.c (not built)>]>, 'sparc64-linux-user':
<ExtractedObjects 'qemu-sparc64-linux-user': [<File: target-info-def.c (not
built)>]>, 'x86_64-linux-user': <ExtractedObjects 'qemu-x86_64-linux-user':
[<File: target-info-def.c (not built)>]>, 'xtensa-linux-user':
<ExtractedObjects 'qemu-xtensa-linux-user': [<File: target-info-def.c (not
built)>]>, 'xtensaeb-linux-user': <ExtractedObjects
'qemu-xtensaeb-linux-user': [<File: target-info-def.c (not built)>]>,
'aarch64-softmmu': <ExtractedObjects 'qemu-aarch64-softmmu': [<File:
target-info-def.c (not built)>]>, 'alpha-softmmu': <ExtractedObjects
'qemu-alpha-softmmu': [<File: target-info-def.c (not built)>]>,
'arm-softmmu': <ExtractedObjects 'qemu-arm-softmmu': [<File:
target-info-def.c (not built)>]>, 'avr-softmmu': <ExtractedObjects
'qemu-avr-softmmu': [<File: target-info-def.c (not built)>]>,
'hexagon-softmmu': <ExtractedObjects 'qemu-hexagon-softmmu': [<File:
target-info-def.c (not built)>]>, 'hppa-softmmu': <ExtractedObjects
'qemu-hppa-softmmu': [<File: target-info-def.c (not built)>]>,
'i386-softmmu': <ExtractedObjects 'qemu-i386-softmmu': [<File:
target-info-def.c (not built)>]>, 'loongarch64-softmmu': <ExtractedObjects
'qemu-loongarch64-softmmu': [<File: target-info-def.c (not built)>]>,
'm68k-softmmu': <ExtractedObjects 'qemu-m68k-softmmu': [<File:
target-info-def.c (not built)>]>, 'microblaze-softmmu': <ExtractedObjects
'qemu-microblaze-softmmu': [<File: target-info-def.c (not built)>]>,
'mips-softmmu': <ExtractedObjects 'qemu-mips-softmmu': [<File:
target-info-def.c (not built)>]>, 'mips64-softmmu': <ExtractedObjects
'qemu-mips64-softmmu': [<File: target-info-def.c (not built)>]>,
'mips64el-softmmu': <ExtractedObjects 'qemu-mips64el-softmmu': [<File:
target-info-def.c (not built)>]>, 'mipsel-softmmu': <ExtractedObjects
'qemu-mipsel-softmmu': [<File: target-info-def.c (not built)>]>,
'or1k-softmmu': <ExtractedObjects 'qemu-or1k-softmmu': [<File:
target-info-def.c (not built)>]>, 'ppc-softmmu': <ExtractedObjects
'qemu-ppc-softmmu': [<File: target-info-def.c (not built)>]>,
'ppc64-softmmu': <ExtractedObjects 'qemu-ppc64-softmmu': [<File:
target-info-def.c (not built)>]>, 'riscv32-softmmu': <ExtractedObjects
'qemu-riscv32-softmmu': [<File: target-info-def.c (not built)>]>,
'riscv64-softmmu': <ExtractedObjects 'qemu-riscv64-softmmu': [<File:
target-info-def.c (not built)>]>, 'rx-softmmu': <ExtractedObjects
'qemu-rx-softmmu': [<File: target-info-def.c (not built)>]>,
's390x-softmmu': <ExtractedObjects 'qemu-s390x-softmmu': [<File:
target-info-def.c (not built)>]>, 'sh4-softmmu': <ExtractedObjects
'qemu-sh4-softmmu': [<File: target-info-def.c (not built)>]>,
'sh4eb-softmmu': <ExtractedObjects 'qemu-sh4eb-softmmu': [<File:
target-info-def.c (not built)>]>, 'sparc-softmmu': <ExtractedObjects
'qemu-sparc-softmmu': [<File: target-info-def.c (not built)>]>,
'sparc64-softmmu': <ExtractedObjects 'qemu-sparc64-softmmu': [<File:
target-info-def.c (not built)>]>, 'tricore-softmmu': <ExtractedObjects
'qemu-tricore-softmmu': [<File: target-info-def.c (not built)>]>,
'x86_64-softmmu': <ExtractedObjects 'qemu-x86_64-softmmu': [<File:
target-info-def.c (not built)>]>, 'xtensa-softmmu': <ExtractedObjects
'qemu-xtensa-softmmu': [<File: target-info-def.c (not built)>]>,
'xtensaeb-softmmu': <ExtractedObjects 'qemu-xtensaeb-softmmu': [<File:
target-info-def.c (not built)>]>}> of type DictHolder.
>
> I have meson 1.8.5.
>

Hi, It's because I use a feature from meson 1.10.0, you can install meson
1.12.0 for it. and the remote branch I also fixed for KVM and got gitlab
running. but for this series you need to install meson 1.12.x

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000c4a926065c8796e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On Mon, Sep 28, 2026 at 5:07=E2=80=AFPM Markus Armbrus=
ter &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrot=
e:<br>&gt;<br>&gt; Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com=
">luoyonggang@gmail.com</a>&gt; writes:<br>&gt;<br>&gt; &gt; Collect each t=
arget-info-def.c object in target_info_def_objects,<br>&gt; &gt; keyed by t=
arget dir. Link every value so constructors fill the<br>&gt; &gt; list. Ass=
ert target_info() is not NULL and target_info_list() has<br>&gt; &gt; one e=
ntry per linked object.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Yonggang L=
uo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&g=
t;<br>&gt;<br>&gt; Doesn&#39;t compile for me:<br>&gt;<br>&gt; ../tests/uni=
t/meson.build:47:37: ERROR: Unknown method &quot;values&quot; in object &lt=
;[DictHolder] holds [dict]: {&#39;aarch64-linux-user&#39;: &lt;ExtractedObj=
ects &#39;qemu-aarch64-linux-user&#39;: [&lt;File: target-info-def.c (not b=
uilt)&gt;]&gt;, &#39;aarch64_be-linux-user&#39;: &lt;ExtractedObjects &#39;=
qemu-aarch64_be-linux-user&#39;: [&lt;File: target-info-def.c (not built)&g=
t;]&gt;, &#39;alpha-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-alpha-l=
inux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;arm=
-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-arm-linux-user&#39;: [&lt;=
File: target-info-def.c (not built)&gt;]&gt;, &#39;armeb-linux-user&#39;: &=
lt;ExtractedObjects &#39;qemu-armeb-linux-user&#39;: [&lt;File: target-info=
-def.c (not built)&gt;]&gt;, &#39;hexagon-linux-user&#39;: &lt;ExtractedObj=
ects &#39;qemu-hexagon-linux-user&#39;: [&lt;File: target-info-def.c (not b=
uilt)&gt;]&gt;, &#39;hppa-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-h=
ppa-linux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#3=
9;i386-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-i386-linux-user&#39;=
: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;loongarch64-linux=
-user&#39;: &lt;ExtractedObjects &#39;qemu-loongarch64-linux-user&#39;: [&l=
t;File: target-info-def.c (not built)&gt;]&gt;, &#39;m68k-linux-user&#39;: =
&lt;ExtractedObjects &#39;qemu-m68k-linux-user&#39;: [&lt;File: target-info=
-def.c (not built)&gt;]&gt;, &#39;microblaze-linux-user&#39;: &lt;Extracted=
Objects &#39;qemu-microblaze-linux-user&#39;: [&lt;File: target-info-def.c =
(not built)&gt;]&gt;, &#39;microblazeel-linux-user&#39;: &lt;ExtractedObjec=
ts &#39;qemu-microblazeel-linux-user&#39;: [&lt;File: target-info-def.c (no=
t built)&gt;]&gt;, &#39;mips-linux-user&#39;: &lt;ExtractedObjects &#39;qem=
u-mips-linux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, =
&#39;mips64-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-mips64-linux-us=
er&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;mips64el-l=
inux-user&#39;: &lt;ExtractedObjects &#39;qemu-mips64el-linux-user&#39;: [&=
lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;mipsel-linux-user&#39=
;: &lt;ExtractedObjects &#39;qemu-mipsel-linux-user&#39;: [&lt;File: target=
-info-def.c (not built)&gt;]&gt;, &#39;mipsn32-linux-user&#39;: &lt;Extract=
edObjects &#39;qemu-mipsn32-linux-user&#39;: [&lt;File: target-info-def.c (=
not built)&gt;]&gt;, &#39;mipsn32el-linux-user&#39;: &lt;ExtractedObjects &=
#39;qemu-mipsn32el-linux-user&#39;: [&lt;File: target-info-def.c (not built=
)&gt;]&gt;, &#39;or1k-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-or1k-=
linux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;pp=
c-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-ppc-linux-user&#39;: [&lt=
;File: target-info-def.c (not built)&gt;]&gt;, &#39;ppc64-linux-user&#39;: =
&lt;ExtractedObjects &#39;qemu-ppc64-linux-user&#39;: [&lt;File: target-inf=
o-def.c (not built)&gt;]&gt;, &#39;ppc64le-linux-user&#39;: &lt;ExtractedOb=
jects &#39;qemu-ppc64le-linux-user&#39;: [&lt;File: target-info-def.c (not =
built)&gt;]&gt;, &#39;riscv32-linux-user&#39;: &lt;ExtractedObjects &#39;qe=
mu-riscv32-linux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&g=
t;, &#39;riscv64-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-riscv64-li=
nux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;s390=
x-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-s390x-linux-user&#39;: [&=
lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;sh4-linux-user&#39;: =
&lt;ExtractedObjects &#39;qemu-sh4-linux-user&#39;: [&lt;File: target-info-=
def.c (not built)&gt;]&gt;, &#39;sh4eb-linux-user&#39;: &lt;ExtractedObject=
s &#39;qemu-sh4eb-linux-user&#39;: [&lt;File: target-info-def.c (not built)=
&gt;]&gt;, &#39;sparc-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-sparc=
-linux-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;s=
parc32plus-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-sparc32plus-linu=
x-user&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;sparc6=
4-linux-user&#39;: &lt;ExtractedObjects &#39;qemu-sparc64-linux-user&#39;: =
[&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;x86_64-linux-user&#=
39;: &lt;ExtractedObjects &#39;qemu-x86_64-linux-user&#39;: [&lt;File: targ=
et-info-def.c (not built)&gt;]&gt;, &#39;xtensa-linux-user&#39;: &lt;Extrac=
tedObjects &#39;qemu-xtensa-linux-user&#39;: [&lt;File: target-info-def.c (=
not built)&gt;]&gt;, &#39;xtensaeb-linux-user&#39;: &lt;ExtractedObjects &#=
39;qemu-xtensaeb-linux-user&#39;: [&lt;File: target-info-def.c (not built)&=
gt;]&gt;, &#39;aarch64-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-aarch64=
-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;alph=
a-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-alpha-softmmu&#39;: [&lt;Fil=
e: target-info-def.c (not built)&gt;]&gt;, &#39;arm-softmmu&#39;: &lt;Extra=
ctedObjects &#39;qemu-arm-softmmu&#39;: [&lt;File: target-info-def.c (not b=
uilt)&gt;]&gt;, &#39;avr-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-avr-s=
oftmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;hexago=
n-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-hexagon-softmmu&#39;: [&lt;F=
ile: target-info-def.c (not built)&gt;]&gt;, &#39;hppa-softmmu&#39;: &lt;Ex=
tractedObjects &#39;qemu-hppa-softmmu&#39;: [&lt;File: target-info-def.c (n=
ot built)&gt;]&gt;, &#39;i386-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-=
i386-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;=
loongarch64-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-loongarch64-softmm=
u&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;m68k-softmm=
u&#39;: &lt;ExtractedObjects &#39;qemu-m68k-softmmu&#39;: [&lt;File: target=
-info-def.c (not built)&gt;]&gt;, &#39;microblaze-softmmu&#39;: &lt;Extract=
edObjects &#39;qemu-microblaze-softmmu&#39;: [&lt;File: target-info-def.c (=
not built)&gt;]&gt;, &#39;mips-softmmu&#39;: &lt;ExtractedObjects &#39;qemu=
-mips-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39=
;mips64-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-mips64-softmmu&#39;: [=
&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;mips64el-softmmu&#39=
;: &lt;ExtractedObjects &#39;qemu-mips64el-softmmu&#39;: [&lt;File: target-=
info-def.c (not built)&gt;]&gt;, &#39;mipsel-softmmu&#39;: &lt;ExtractedObj=
ects &#39;qemu-mipsel-softmmu&#39;: [&lt;File: target-info-def.c (not built=
)&gt;]&gt;, &#39;or1k-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-or1k-sof=
tmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;ppc-soft=
mmu&#39;: &lt;ExtractedObjects &#39;qemu-ppc-softmmu&#39;: [&lt;File: targe=
t-info-def.c (not built)&gt;]&gt;, &#39;ppc64-softmmu&#39;: &lt;ExtractedOb=
jects &#39;qemu-ppc64-softmmu&#39;: [&lt;File: target-info-def.c (not built=
)&gt;]&gt;, &#39;riscv32-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-riscv=
32-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;ri=
scv64-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-riscv64-softmmu&#39;: [&=
lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;rx-softmmu&#39;: &lt;=
ExtractedObjects &#39;qemu-rx-softmmu&#39;: [&lt;File: target-info-def.c (n=
ot built)&gt;]&gt;, &#39;s390x-softmmu&#39;: &lt;ExtractedObjects &#39;qemu=
-s390x-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#3=
9;sh4-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-sh4-softmmu&#39;: [&lt;F=
ile: target-info-def.c (not built)&gt;]&gt;, &#39;sh4eb-softmmu&#39;: &lt;E=
xtractedObjects &#39;qemu-sh4eb-softmmu&#39;: [&lt;File: target-info-def.c =
(not built)&gt;]&gt;, &#39;sparc-softmmu&#39;: &lt;ExtractedObjects &#39;qe=
mu-sparc-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &=
#39;sparc64-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-sparc64-softmmu&#3=
9;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;tricore-softmmu=
&#39;: &lt;ExtractedObjects &#39;qemu-tricore-softmmu&#39;: [&lt;File: targ=
et-info-def.c (not built)&gt;]&gt;, &#39;x86_64-softmmu&#39;: &lt;Extracted=
Objects &#39;qemu-x86_64-softmmu&#39;: [&lt;File: target-info-def.c (not bu=
ilt)&gt;]&gt;, &#39;xtensa-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-xte=
nsa-softmmu&#39;: [&lt;File: target-info-def.c (not built)&gt;]&gt;, &#39;x=
tensaeb-softmmu&#39;: &lt;ExtractedObjects &#39;qemu-xtensaeb-softmmu&#39;:=
 [&lt;File: target-info-def.c (not built)&gt;]&gt;}&gt; of type DictHolder.=
<br>&gt;<br>&gt; I have meson 1.8.5.<br>&gt;<br><br>Hi, It&#39;s because I =
use a feature from meson 1.10.0, you can install meson 1.12.0 for it. and t=
he remote branch I also fixed for KVM and got gitlab running. but for this =
series you need to install meson 1.12.x<br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A=
<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--000000000000c4a926065c8796e1--

