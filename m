Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445D9CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 18:32:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBG9Q-0001nV-Fs; Mon, 28 Sep 2026 14:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBG9F-0001ms-8B
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:32:23 -0400
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBG9C-0006Ey-W5
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:32:20 -0400
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6ac6fa788e6so2353277a12.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790620337; cv=none;
 d=google.com; s=arc-20260327;
 b=grsQVG7567lvxaBiEmxKiewwHKwJoex8erKXujWATw/0q665d7HKqdDV6wVUMPrH6l
 mfx265mpcl8gw6cATpIR/if+rM0LbGnUu5GCmeK6QF6ygX8mtwq9RZhWFcLd9PKTGiEt
 gxVahCfC+2Wjc4LvDsxKmGsKbBdsWAi/QqXcIUrkQGk1mx7aygwnQspCodt+hNxhKIZI
 KaNiBCuV1Mj6nov24qUCFLeSbXXD5sYiJDRJHs0xTg1oJ72cQPGzAe7YpjNd0YfZdliw
 fWANFwEKIlc0qBCjFIwo4XSiNwRhRqjkUfGn8tTs/Ug/Gvq7WYBp9MWczcu7r6ISrpmB
 2Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=10zEOPshubpGlqILOXICUNX3+9WS1wLDtTKXkTd5Hok=;
 fh=BUGHwSnNaCQbVMqI9fYPHl6G6dQ5H0/ncofeyO3GIjA=;
 b=cQY6ROjpGl5hWPueKJZtHpr7EIZqKQH0abBA6jqLKlWdgALM9IKGhToSxmvDDs9Lbt
 llo4IA0u+Y3knROhRBBDPn3tnzHMYLSRvp25ixupMah3rYaLQRYzbE0o6jtHCqAKHoVJ
 j0HvqQKxk959FZ56XOK1omTqObiSLaqRMGJlLCFjxy0t3gMgRbiucj9w7FP2xln1KnbN
 yj8FA+MDlnYdgz2GVAfOSJVEcyw2j7c4a4JL/Hy4GhifxQHZlTGg16h5GsTjgTdpOF8r
 tTV1Fo7JV5frB9pvnF4x2nR+93egU+faqiZVV9dUiM2OXyOJEnzkB6FBa/Bq+8xn8iL0
 mMrw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790620337; x=1791225137; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=10zEOPshubpGlqILOXICUNX3+9WS1wLDtTKXkTd5Hok=;
 b=Fm9o0JrW71/ehKXcw/0jg382Ekpl+LpTieJIEvaijZ4PxNwXnQGRxUBYLDBaw887VM
 mzLdQOD59p9QREyzYVantoJSo1FTELPsIHdKRyQnLv2IacJb7ApT/+xeCDdc2J1ngC8e
 uj4EdijkhyQVJI77t+Y2Hx20iMrJu6anuDdNkg1JL3lYzb0PP420DXYY8dbm7GHN5r4A
 7Zeea4h2/6pBUfjGFv6BElz5T9KjeIhpqr/3RtTxaDEs3oQaYUByOAmb/G89S4OJp/qp
 MuKLoQ64RpjgpHHG13vZgZmVgNAzDSiTg1TyKiHsRzmpMTB2v1rwTGTwxOh6PFEJi6SL
 TIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790620337; x=1791225137;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=10zEOPshubpGlqILOXICUNX3+9WS1wLDtTKXkTd5Hok=;
 b=qf4/Otj7XkR/unoIE1hsBOPdjfMeJN5jG8AVjJLgruYuLSRBHi3rySR6ijlRDYBLip
 wyp3xf1KAIf20+rSmdFUcHGWjIXYGje4XDir/U/IfeROuLVsviBj/cDhcqu5VMemWj9A
 YPaa8st7/Gqi5fAfKpNrcEB9V6/vu9R567Yrgv9mmrY6C3czpY0LzvhxbgEOVEzWn1FN
 WkQi28caQq3yaDzUEeHqQ1PyPMHwS3elL0DKGK0UgvhluEjeBX6/E/p1T0iV3EMLOq6g
 /SHuSbhTeAakpXrFOrqbYFMgRfLtqBj0bDT6nh6BCJQm1jw9NEl+P6+Zz3c6PcxPCQZ8
 HhNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBymCz+oSwWQjFmhRaDjxVs3Tzp5yrwpPcn5fs0798ahBeusMtEwc5u4dmlYKseoHY/RLQ1ki8Pihw==@nongnu.org
X-Gm-Message-State: AFq9FYIfDbu7X0SUQBd+XPdtmXyJMK9V8y9Q0OUYp4OO3rOuAs/c0Cqg
 JBasKdULeWCXIqSKIF7dCFU64gML9YP6mFXmNlpaVUF+lMKh/677mB/dX+q2pTx9CZYPQuJdLMb
 Sc6CmpYj5YpyY18GBsswRb6KECKHDQrE=
X-Gm-Gg: AYBFou3tFsPRoFADR6nRmsEQbxQFaWfFg9NIL7CIqOhzuhsKM00BiKgfhaOhsLzUPY7
 0RTyl75IROjOqjC2p1v4Y3XZ50lLXG3ZbbgCtgjj3AGtBdLk+FXZ7iSSLuwo+Ioe0yMaxjSPrMd
 09t/ONoo9Ia/eJu4eV9wM6Mk37SkbLuGsnpTm+1OJ3vIjFrDXICz0SFGnLb8kxWH0Lm2VkP3lRy
 kRdoJOBdBKI8aKay5H4Uo8V6bDNQcY07/boSIaAktuNBxD4m4Y+nDngPGLcmO4p4O6l11DLisXv
 9LVZeFh7ttEiagdPGXC0WYixWmPAj0hcMSPWdgpzUxtl0PAe5eHVu0fQ50gCqMLuFQ==
X-Received: by 2002:a05:6402:a0c3:b0:6a7:e514:1d85 with SMTP id
 4fb4d7f45d1cf-6aacc4f8724mr8897332a12.13.1790620337160; Mon, 28 Sep 2026
 11:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
 <CAE2XoE9qsZZ+AnfGQ797SQj5yXP8SDOZyxYoKP=oh57UPFqq0Q@mail.gmail.com>
 <a4b7056e-1651-4167-86e0-e7eaa3941d02@oss.qualcomm.com>
In-Reply-To: <a4b7056e-1651-4167-86e0-e7eaa3941d02@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 02:32:04 +0800
X-Gm-Features: AclHuK_ERp5IoAZ28BebMOFl2bqaypFi7obbPF7gF8oVgVehebJc-G4JFpsX_YE
Message-ID: <CAE2XoE9fm4wWqo5Hcxgg0GUKTcoVqVy81kybb_FaHsUV6dNpyg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000001fc52b065c8f498a"
Received-SPF: pass client-ip=2a00:1450:4864:33::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0d.google.com
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

--0000000000001fc52b065c8f498a
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


static const char * const mips64_machines[] =3D {
    "magnum",
    "malta",
    "none",
    "pica61",
};

static const char * const mips64el_machines[] =3D {
    "boston",
    "fuloong2e",
    "loongson3-virt",
    "magnum",
    "malta",
    "none",
    "pica61",
};
For example,  mips64el and  mips64 have different sets of machines. That
makes things hard.
And I can not create a proper test-case for it without the endianness
information for it. unless
I remove the tests about these things at all.


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000001fc52b065c8f498a
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
addressed and not the priority.<div><br></div><div><br></div><div>static co=
nst char * const mips64_machines[] =3D {<br>=C2=A0 =C2=A0 &quot;magnum&quot=
;,<br>=C2=A0 =C2=A0 &quot;malta&quot;,<br>=C2=A0 =C2=A0 &quot;none&quot;,<b=
r>=C2=A0 =C2=A0 &quot;pica61&quot;,<br>};<br><br>static const char * const =
mips64el_machines[] =3D {<br>=C2=A0 =C2=A0 &quot;boston&quot;,<br>=C2=A0 =
=C2=A0 &quot;fuloong2e&quot;,<br>=C2=A0 =C2=A0 &quot;loongson3-virt&quot;,<=
br>=C2=A0 =C2=A0 &quot;magnum&quot;,<br>=C2=A0 =C2=A0 &quot;malta&quot;,<br=
>=C2=A0 =C2=A0 &quot;none&quot;,<br>=C2=A0 =C2=A0 &quot;pica61&quot;,<br>};=
<br>For example,=C2=A0

mips64el and=C2=A0

mips64 have different sets of machines. That makes things hard.</div><div>A=
nd I can not create a proper test-case for it without the endianness inform=
ation for it. unless</div><div>I remove the tests about these things at all=
.</div><div><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=
=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 s=
incerely,<br>Yonggang Luo</div></div>

--0000000000001fc52b065c8f498a--

