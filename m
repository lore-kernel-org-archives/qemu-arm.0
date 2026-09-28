Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8364FC9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 11:39:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB9gz-00083H-9s; Mon, 28 Sep 2026 07:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB9gx-00082w-1Y
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:38:43 -0400
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB9gv-0002Wf-0r
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:38:42 -0400
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6ac6fa788e6so1548412a12.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 04:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790595519; cv=none;
 d=google.com; s=arc-20260327;
 b=Qk3KaSEzAJ4WJr3tzBjFpD1I50bf9mVQJZPcqs8kyUUHWD+7zKTn6cACmWcH+zmE6J
 rhtAVhlV9NiEe+TvpwQHYg+en7mAYgeRvGMj4ArKrUw4y2wToJ8CIGkAFVKTPNyK6MR7
 BnHawqeUraPsA0FT/h8Xhi3KjAWEERuv8xvXmIKUJ8RWWSsi8koA7Blx9XXOJNUEJWLD
 YQOLDp9KVcxAv3pBEKdrjITW2ExwQLZEG6UXGMPziVspxA+9cd/pYzxh0DnuCeFyQTz5
 jE/6bAxwBjn2DvrMpBEQoxOShZqINAKXf5dpMjZEliHYJLXAcN1spW4ugaP5zsqHyVMK
 398g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7qO7jEHwA4OUWrWsQdikFZSTfu7bq8bn+uja9uOUEk8=;
 fh=43/N4pNjzio5TRyb6Bu4TVRIOWKazyepqF35pZviLTU=;
 b=fQ0UjqIAAOojvSX8UKSzA7AsEbNRoKIY7YxH9C6HnpRF9ul10BnRXDAIV5cjps+BkP
 ag9Zqukt8r2bVib+I8FZMn2s8YyHEx0N44Me5pmDTrAT+onLeJBfjB31RL+cWgnxROII
 wGDyz/k+23pvxTq/XkoU4yTVmEnCoc/0RKLzD9VOls/UpsWTbJPtTNjeYUUrrXgAGYJi
 VAroyHr4a8zSyw6AMnZAdZWI5ssC7jC+OPfj8pPniQbBAw6qbu6/B93HHL/rQwtS/j+H
 hdyFaFk5IOyFjs0YtYxPeaSTumlmqsJyhiyXYLH07YwYg5YTBumXClxCQvM1LQ1zN2iG
 p6CQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790595519; x=1791200319; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7qO7jEHwA4OUWrWsQdikFZSTfu7bq8bn+uja9uOUEk8=;
 b=i3FWuAP/a0/2ItVygvRqd+LJFWkXSKpWqhDrIKGQFbEaPQC4NuYKh3J1HC46Zaepz/
 BtmL2hdnQQGLdvjBfONmJREE8NurLYSXmIiyjbMsvUOaWQ4z1heF9tyb/wXVPVVPP6lZ
 3CkIbOnn243RzLO/Z1as+YsyjV6CQ7GoCTgUBborIIgqU7nsAXRvDPP3iQO3ep8j99vj
 EdG+cu99gvWSjDLM6KSI8dyrqCpyYoYnkGA9qg2SY0fIuo/8K4cx9mh0oX/tjlSqjhFI
 9ge2kGH8kG1PoBarcxnd3xp4hf2QxNotZxzoQu+xRC+9ELlc82U9XrZudaIm6gzmMFU9
 zaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790595519; x=1791200319;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7qO7jEHwA4OUWrWsQdikFZSTfu7bq8bn+uja9uOUEk8=;
 b=pswFHkF23X4dtRtUOhr0pLhKUQhtvSq4M/k70YbBwmUv3bUNXPwyRH5lbyjFza+08Y
 IctCxTF2wMiQGBcm4VNZxHy9tftbHApeFYykf/OouLXFD2vEIy4u+4kmQ37IWrjVYJhQ
 Pfg8Hot+WXZX6nXoWKlgXWODTYJWlZe2op6LB4ntE+4PVdGT/Yvn2OGaxecEyKVxINJg
 118Iq8BfC4JuK0aR5UvRToo1hQxqXMV1WeLoCHif6j5/Rv2Ywey8NiA7vO0NIYXjEuND
 epGyiCL/LuBCeDmPVX7EbzLaIygLf4LbAikOwLXexMsdR6jEOGhF21TuLBRlPUmefJUH
 NCSQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtpelHJrVHQeGDWt1l4QeZZshZKMh+35bAdLXBB1OKjQ2I/oUd7SkAuDKhVqOFUhMs/xAiMhEkeg==@nongnu.org
X-Gm-Message-State: AFq9FYLVrG0/pqOnKQKVH8DkAs2NSjXEsTknHMcMsXMT/quUpxMCcez0
 RQYXQAR7zuP5AbNNVHuXsQ2xTVNiYH+gkhZxjJKxc2dqImHy1UaGYy9fL/c6D/cjceu/ctflKKR
 QQ0nYaoVyuIVSsDZKNg5F5un4lyy6218=
X-Gm-Gg: AYBFou1+1GT6hhTOPJKs4yWZNhgyEuiyeOGvZR0ZqV+cSUF09iSpoGWI1qEoBOIuKlw
 JH7EMCw9R0uLH5uuW6JZ6EipSOdWmVi6ofo4ZLUyHxhSg38MA8mNiy8BRh32Xn5Rs86XMeg67Da
 cdETGbnbmVMp4hYaVPnV2s/1upJMc4QoP0IRoYz0b9I88aQzuzu0UpExgPlcnHGH1LT+VtMkxhG
 UzFgcxht9hcboinmu6CFSDJ+0IL+YuJI3K905OBvPcftUi6M7j8OEsf20vldLHIfdZnrkD+9gfd
 UhVBWETq/qncr90/ZjFxDJKMfEC2o4PZaiWapeC40ZSOYOOv6Gl+tdI=
X-Received: by 2002:a05:6402:2318:b0:6aa:e729:423 with SMTP id
 4fb4d7f45d1cf-6aae7290ad1mr5016298a12.26.1790595518845; Mon, 28 Sep 2026
 04:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
 <CAE2XoE9qsZZ+AnfGQ797SQj5yXP8SDOZyxYoKP=oh57UPFqq0Q@mail.gmail.com>
 <a4b7056e-1651-4167-86e0-e7eaa3941d02@oss.qualcomm.com>
In-Reply-To: <a4b7056e-1651-4167-86e0-e7eaa3941d02@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 28 Sep 2026 19:38:26 +0800
X-Gm-Features: AclHuK_XhGMu1KY8MUrPqLq8CsGd4GT9s4oLjix7cR9RGNVYEmbplzAsJP0a5Vs
Message-ID: <CAE2XoE8BD6V0jeAVWeZ4e_ftgqeKBsW4P5P_UX0T0AjA4MWP0Q@mail.gmail.com>
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d657be065c898119"
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

--000000000000d657be065c898119
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 7:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 12:51, Yonggang Luo wrote:
> > On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
> > philmd@oss.qualcomm.com> wrote:
> >>
> >> On 28/9/26 12:13, Daniel P. Berrang=C3=83=C2=A9 wrote:
> >>> On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
> >>>> query-targets lists each linked target, including none, with its
> >>>> arch, endianness, and the machines that target accepts.
> >>>>
> >>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>>> ---
> >>>>    hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
> >>>>    qapi/machine.json          | 35
+++++++++++++++++++++++++++++++++++
> >>>>    2 files changed, 65 insertions(+)
> >>>
> >>>
> >>>> diff --git a/qapi/machine.json b/qapi/machine.json
> >>>> index 6aaa2af709a..d8cdea6203e 100644
> >>>> --- a/qapi/machine.json
> >>>> +++ b/qapi/machine.json
> >>>> @@ -307,6 +307,41 @@
> >>>>    ##
> >>>>    { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
> >>>>
> >>>> +##
> >>>> +# @TargetMachines:
> >>>> +#
> >>>> +# One registered system target and the machines that can run on it.
> >>>> +#
> >>>> +# @arch: the target architecture
> >>>> +#
> >>>> +# @endianness: the target endianness
> >>>> +#
> >>>> +# @machines: machine type names, not aliases
> >>>> +#
> >>>> +# Since: 11.2
> >>>> +##
> >>>> +{ 'struct': 'TargetMachines',
> >>>> +  'data': { 'arch': 'SysEmuTarget',
> >>>> +            'endianness': 'EndianMode',
> >>>> +            'machines': ['str'] } }
> >>>
> >>> We already have  'QemuTargetInfo' struct which is used
> >>> with 'query-target', that should also be used with the
> >>> new 'query-targets' command.
> >>>
> >>> We need to add the 'endianness' field to QemuTargetInfo.
> >>
> >> Why do we want to expose endianness, and what endianness to
> >> expose? Endianness is a runtime bit state of CPUs. Sometime
> >> this bit is hardwired but that is an implementation detail.
> >
> > For some targets it's, but for some targets it's not. for example
> >
> > mips-softmmu.mak
> > mipsel-softmmu.mak
> > mips64el-softmmu.mak
> > mips64-softmmu.mak
> >
> >
> > mips64el-softmmu.mak
> > mips64-softmmu.mak
> > only differ the endianless
> If you look at git / mailing list history you'll see I spent more
> than a year unifying QEMU endianness. It was too much work for a
> single person so we decided to reduce the scope to ARM + MicroBlaze
> for single binary and we got MicroBlaze unified. We don't want
> an endianness-specific single binary. I'm not sure what you are
> trying to build, you didn't clearly explained what is your goal here.
>
> You can find series unifying endianness for MIPS, not merged because
> more things need to be addressed and not the priority.

It's only for testing. if we can not uniquely identify a target, then the
testing program won't work properly.
if  endianness  needs to be removed in future, let's defer that?



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000d657be065c898119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Sep 28, 2026 at 7:34=E2=80=AFPM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss.qualcomm.com">philmd@oss=
.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; On 28/9/26 12:51, Yonggang Luo=
 wrote:<br>&gt; &gt; On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Philippe Mathi=
eu-Daud=C3=A9 &lt;<br>&gt; &gt; <a href=3D"mailto:philmd@oss.qualcomm.com">=
philmd@oss.qualcomm.com</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On=
 28/9/26 12:13, Daniel P. Berrang=C3=83=C2=A9 wrote:<br>&gt; &gt;&gt;&gt; O=
n Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:<br>&gt; &gt;&g=
t;&gt;&gt; query-targets lists each linked target, including none, with its=
<br>&gt; &gt;&gt;&gt;&gt; arch, endianness, and the machines that target ac=
cepts.<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; Signed-off-by: Yon=
ggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.co=
m</a>&gt;<br>&gt; &gt;&gt;&gt;&gt; ---<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=
=A0hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++<br>&gt; &=
gt;&gt;&gt;&gt; =C2=A0 =C2=A0qapi/machine.json =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 35 +++++++++++++++++++++++++++++++++++<br>&gt; &gt;&gt;&gt;&gt; =C2=
=A0 =C2=A02 files changed, 65 insertions(+)<br>&gt; &gt;&gt;&gt;<br>&gt; &g=
t;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; diff --git a/qapi/machine.json b/qapi/m=
achine.json<br>&gt; &gt;&gt;&gt;&gt; index 6aaa2af709a..d8cdea6203e 100644<=
br>&gt; &gt;&gt;&gt;&gt; --- a/qapi/machine.json<br>&gt; &gt;&gt;&gt;&gt; +=
++ b/qapi/machine.json<br>&gt; &gt;&gt;&gt;&gt; @@ -307,6 +307,41 @@<br>&gt=
; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0##<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=A0{ =
&#39;command&#39;: &#39;query-target&#39;, &#39;returns&#39;: &#39;QemuTarg=
etInfo&#39; }<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; +##<br>&gt;=
 &gt;&gt;&gt;&gt; +# @TargetMachines:<br>&gt; &gt;&gt;&gt;&gt; +#<br>&gt; &=
gt;&gt;&gt;&gt; +# One registered system target and the machines that can r=
un on it.<br>&gt; &gt;&gt;&gt;&gt; +#<br>&gt; &gt;&gt;&gt;&gt; +# @arch: th=
e target architecture<br>&gt; &gt;&gt;&gt;&gt; +#<br>&gt; &gt;&gt;&gt;&gt; =
+# @endianness: the target endianness<br>&gt; &gt;&gt;&gt;&gt; +#<br>&gt; &=
gt;&gt;&gt;&gt; +# @machines: machine type names, not aliases<br>&gt; &gt;&=
gt;&gt;&gt; +#<br>&gt; &gt;&gt;&gt;&gt; +# Since: 11.2<br>&gt; &gt;&gt;&gt;=
&gt; +##<br>&gt; &gt;&gt;&gt;&gt; +{ &#39;struct&#39;: &#39;TargetMachines&=
#39;,<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0&#39;data&#39;: { &#39;arch&#39;: &#=
39;SysEmuTarget&#39;,<br>&gt; &gt;&gt;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;endianness&#39;: &#39;EndianMode&#39;,<br>&gt; &gt;&g=
t;&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;machines&#39;: [=
&#39;str&#39;] } }<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt; We already hav=
e =C2=A0&#39;QemuTargetInfo&#39; struct which is used<br>&gt; &gt;&gt;&gt; =
with &#39;query-target&#39;, that should also be used with the<br>&gt; &gt;=
&gt;&gt; new &#39;query-targets&#39; command.<br>&gt; &gt;&gt;&gt;<br>&gt; =
&gt;&gt;&gt; We need to add the &#39;endianness&#39; field to QemuTargetInf=
o.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Why do we want to expose endianness, a=
nd what endianness to<br>&gt; &gt;&gt; expose? Endianness is a runtime bit =
state of CPUs. Sometime<br>&gt; &gt;&gt; this bit is hardwired but that is =
an implementation detail.<br>&gt; &gt;<br>&gt; &gt; For some targets it&#39=
;s, but for some targets it&#39;s not. for example<br>&gt; &gt;<br>&gt; &gt=
; mips-softmmu.mak<br>&gt; &gt; mipsel-softmmu.mak<br>&gt; &gt; mips64el-so=
ftmmu.mak<br>&gt; &gt; mips64-softmmu.mak<br>&gt; &gt;<br>&gt; &gt;<br>&gt;=
 &gt; mips64el-softmmu.mak<br>&gt; &gt; mips64-softmmu.mak<br>&gt; &gt; onl=
y differ the endianless<br>&gt; If you look at git / mailing list history y=
ou&#39;ll see I spent more<br>&gt; than a year unifying QEMU endianness. It=
 was too much work for a<br>&gt; single person so we decided to reduce the =
scope to ARM + MicroBlaze<br>&gt; for single binary and we got MicroBlaze u=
nified. We don&#39;t want<br>&gt; an endianness-specific single binary. I&#=
39;m not sure what you are<br>&gt; trying to build, you didn&#39;t clearly =
explained what is your goal here.<br>&gt;<br>&gt; You can find series unify=
ing endianness for MIPS, not merged because<br>&gt; more things need to be =
addressed and not the priority.<br><br>It&#39;s only for testing. if we can=
 not uniquely identify a target, then the testing program won&#39;t work pr=
operly.<br>if =C2=A0endianness =C2=A0needs to be removed in future, let&#39=
;s defer that?<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=
=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=
=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--000000000000d657be065c898119--

