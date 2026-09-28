Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEF7C9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 10:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB8y5-00061L-2S; Mon, 28 Sep 2026 06:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB8xk-0005zO-Ra
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:52:00 -0400
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB8xh-0005oB-50
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 06:51:58 -0400
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aaf8415866so3288417a12.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 03:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790592715; cv=none;
 d=google.com; s=arc-20260327;
 b=WXcZQMm/S734+KFpWKaI+DaVsHtLM6XNHh4i4kPoBOYDsXbOTqB0CQMXoUQcNmGwJQ
 8fYYv50X9Czn97DxE3yc/a1px8KT0KwsqqxkaFSLxtEhRwhJZlmJhKxlAbK/JQvTNS1D
 EFfHh9Se2uZ1BKe/1PmHLwvN7r2C+aQIRvS7FCxK4xugav50lxA6Bwyq/j4LeSfMwsK5
 r+1Q7A+AyS7CeohjkiDpwncXYJbQuI3Oywk/bLCGmaM6gV7Q0KdRN2tjCOAt3G2tAuap
 7/5UBxFhZjsWxKzhZj5Is71zFue15GBznvWNUxV8yefFW2cWP80RYH8mLD73wi/GCKBj
 Kvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dkScZIslhglrv8pC/q+zW+v7BV22OaNiE1eeH22q0ZE=;
 fh=muHEjR7ypwyosVRmWDbDSMgwGLGDlszacQjSib07ZMo=;
 b=E+TpwQcI2+QLGY+goV2vTsIH7WiV4N/iyN1eNeQaECcxl7laYbsWlh4QW3jitrEtjq
 STylcIP47cuGnvOsQYFRF8xQFDDCrAvPURWQSKxWGtdpA8w5g2w5u2A9dZ4W5UleMBk3
 VVrfckvZfMmaQtHxsayw6xJAJ3bn0QfpDdy+OBhwPX1TJDoz2K4hA/ZPDp5GfbKsQ0+x
 xXFNm6qKaMRxeu3MnPzOxui9vGGxMkD/0oBV9EQNfpRFxtcoVXrG7G1NSKqu2g6UdhhJ
 IRmu0JDzDcP75rThL0vL32vftihKoRhJrV7mpp2lUGOnMztptCbpwHVpVbfh833P6KdX
 64Zg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790592715; x=1791197515; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dkScZIslhglrv8pC/q+zW+v7BV22OaNiE1eeH22q0ZE=;
 b=czG5tbwjKS0KFTiIyCn2R8rNi3wmiuUojrjYxS+40Z1VBJ9NhAW2o7XNbxnV9gWYZh
 65BugwU/Wdh5cCKywBjCn5u/8LVli5mpbTXKdymA4b0biovKkw1lAk3lbk8eA7Vd47Mz
 DWnm4V3cuzICLUafXF79sd16dBSyXCmkdQzSCyu7Lz/CiF9B0kPT7lk2alueuaU/Q4G5
 8gidjFnQ6kc4t820CHS1nC5LJwV+TCpVO33YXin85P/Ix+PuQMhGIApvC1gQbBd5fath
 7MwBdp0L2lxf2f+V+CRIK3mVBSOcoCo212mlPFjiZSArGSqhI8qnfVF7vX0RgguIrVee
 1elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790592715; x=1791197515;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dkScZIslhglrv8pC/q+zW+v7BV22OaNiE1eeH22q0ZE=;
 b=GU53Adu8WeMFeGg6Cz2oZM6wMsUy4/yEWtDnPjo9ew2IgKK52e3yspI7jwQu+KnH0g
 q70lSlXCsOGazm+qxrfayRV26TVpQJIzh8BT6nQpSatwLt2YK/JMRvXK1bwf3MzvqQWq
 LdhZWs9AdOX344UHjou1VJsQlMASD3D6R0YautlGQL1HS3x9wCcwwEd5VRDnlG5SRDRs
 ed9nIwpgIzhPiYp6cjA0uK+7Sc8BsHnp41KLttvunnIiUfnNjQW5BvNRF8P++0GzT53c
 Os/pNJWvlOODdCawHx+ZAO/HqOAfk0aLi3sKwMXNIt+w3EcM7SeyeEUZ7cOJMSil5JKm
 mY3A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwJQR1p9wP9xHiOcLXreltznOGYnvIWx6fFxvsthKbdCviNKeQqkXquKIgAKx4Azdbe7/P36I+YNg==@nongnu.org
X-Gm-Message-State: AFq9FYJaicVicuZMm57hLZyX0SNizNPy1RwgALNSl5IfIPWgLP5idkhI
 yQZxphYo9LwM2/kL85y/JYJ140hmmt/QsjpHiO9XRvtVcjk8F6R3LOmui2co4SGNH6zDORQ9H+m
 f/HLxE/16YpfxTrsGkEUFTvqtM3MIkNw=
X-Gm-Gg: AYBFou37wnaStcpWGSAMum2aJKVsgAgO4nK7jl2a7xMCTC4/8/cZNWAvmwK/7fln3sw
 R2sw/wdY5BZcO5WtzclIiZ6smLswY5ty7LcxfzpHQtE5dhk725xZUd8xbmuIoz32mMp65C45Sik
 uBgKb8l5k+iCK7wjj/AnoI63T7f/kzxP5V7aDVdp95S3b71Jx96buHTtbjPGBlyULNrl1QSyDd+
 Ol/QyJLV/LjOg6ogOwbnODE35iTizFbJcScjuUsHLZAjvlKvm5ybyD94Zb6skBa6NLkfqMMxV7y
 9oKUgslLAjHQ2glmyrMfVFqWDtOvxB3b3W3gG2eSpQea1JW2t/XSCOU=
X-Received: by 2002:a05:6402:3509:b0:6aa:f74b:dc07 with SMTP id
 4fb4d7f45d1cf-6aaf74bddffmr6044537a12.17.1790592715205; Mon, 28 Sep 2026
 03:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
In-Reply-To: <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 28 Sep 2026 18:51:41 +0800
X-Gm-Features: AclHuK_NzwBy9OUNy1ovaC1Is2WdhJLFhxg2al37b3kU6I6KtouPyZ1JuIut_-Y
Message-ID: <CAE2XoE9qsZZ+AnfGQ797SQj5yXP8SDOZyxYoKP=oh57UPFqq0Q@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000ba30fa065c88dae5"
Received-SPF: pass client-ip=2a00:1450:4864:33::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0e.google.com
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

--000000000000ba30fa065c88dae5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 12:13, Daniel P. Berrang=C3=83=C2=A9 wrote:
> > On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
> >> query-targets lists each linked target, including none, with its
> >> arch, endianness, and the machines that target accepts.
> >>
> >> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >> ---
> >>   hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
> >>   qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++++
> >>   2 files changed, 65 insertions(+)
> >
> >
> >> diff --git a/qapi/machine.json b/qapi/machine.json
> >> index 6aaa2af709a..d8cdea6203e 100644
> >> --- a/qapi/machine.json
> >> +++ b/qapi/machine.json
> >> @@ -307,6 +307,41 @@
> >>   ##
> >>   { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
> >>
> >> +##
> >> +# @TargetMachines:
> >> +#
> >> +# One registered system target and the machines that can run on it.
> >> +#
> >> +# @arch: the target architecture
> >> +#
> >> +# @endianness: the target endianness
> >> +#
> >> +# @machines: machine type names, not aliases
> >> +#
> >> +# Since: 11.2
> >> +##
> >> +{ 'struct': 'TargetMachines',
> >> +  'data': { 'arch': 'SysEmuTarget',
> >> +            'endianness': 'EndianMode',
> >> +            'machines': ['str'] } }
> >
> > We already have  'QemuTargetInfo' struct which is used
> > with 'query-target', that should also be used with the
> > new 'query-targets' command.
> >
> > We need to add the 'endianness' field to QemuTargetInfo.
>
> Why do we want to expose endianness, and what endianness to
> expose? Endianness is a runtime bit state of CPUs. Sometime
> this bit is hardwired but that is an implementation detail.

For some targets it's, but for some targets it's not. for example

mips-softmmu.mak
mipsel-softmmu.mak
mips64el-softmmu.mak
mips64-softmmu.mak


mips64el-softmmu.mak
mips64-softmmu.mak
only differ the endianless

>
> See commit 0e2c5647d92 and surrounding for MicroBlaze for
> example.



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000ba30fa065c88dae5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss.qualcomm.com">philmd@oss=
.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; On 28/9/26 12:13, Daniel P. Be=
rrang=C3=83=C2=A9 wrote:<br>&gt; &gt; On Sat, Sep 26, 2026 at 03:00:45PM +0=
800, Yonggang Luo wrote:<br>&gt; &gt;&gt; query-targets lists each linked t=
arget, including none, with its<br>&gt; &gt;&gt; arch, endianness, and the =
machines that target accepts.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Signed-off-=
by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@g=
mail.com</a>&gt;<br>&gt; &gt;&gt; ---<br>&gt; &gt;&gt; =C2=A0 hw/core/machi=
ne-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++<br>&gt; &gt;&gt; =C2=A0 q=
api/machine.json =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 35 +++++++++++++++++++=
++++++++++++++++<br>&gt; &gt;&gt; =C2=A0 2 files changed, 65 insertions(+)<=
br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt;&gt; diff --git a/qapi/machine.json b=
/qapi/machine.json<br>&gt; &gt;&gt; index 6aaa2af709a..d8cdea6203e 100644<b=
r>&gt; &gt;&gt; --- a/qapi/machine.json<br>&gt; &gt;&gt; +++ b/qapi/machine=
.json<br>&gt; &gt;&gt; @@ -307,6 +307,41 @@<br>&gt; &gt;&gt; =C2=A0 ##<br>&=
gt; &gt;&gt; =C2=A0 { &#39;command&#39;: &#39;query-target&#39;, &#39;retur=
ns&#39;: &#39;QemuTargetInfo&#39; }<br>&gt; &gt;&gt; =C2=A0<br>&gt; &gt;&gt=
; +##<br>&gt; &gt;&gt; +# @TargetMachines:<br>&gt; &gt;&gt; +#<br>&gt; &gt;=
&gt; +# One registered system target and the machines that can run on it.<b=
r>&gt; &gt;&gt; +#<br>&gt; &gt;&gt; +# @arch: the target architecture<br>&g=
t; &gt;&gt; +#<br>&gt; &gt;&gt; +# @endianness: the target endianness<br>&g=
t; &gt;&gt; +#<br>&gt; &gt;&gt; +# @machines: machine type names, not alias=
es<br>&gt; &gt;&gt; +#<br>&gt; &gt;&gt; +# Since: 11.2<br>&gt; &gt;&gt; +##=
<br>&gt; &gt;&gt; +{ &#39;struct&#39;: &#39;TargetMachines&#39;,<br>&gt; &g=
t;&gt; + =C2=A0&#39;data&#39;: { &#39;arch&#39;: &#39;SysEmuTarget&#39;,<br=
>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;endianness&#=
39;: &#39;EndianMode&#39;,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;machines&#39;: [&#39;str&#39;] } }<br>&gt; &gt;<br>&gt; &=
gt; We already have =C2=A0&#39;QemuTargetInfo&#39; struct which is used<br>=
&gt; &gt; with &#39;query-target&#39;, that should also be used with the<br=
>&gt; &gt; new &#39;query-targets&#39; command.<br>&gt; &gt;<br>&gt; &gt; W=
e need to add the &#39;endianness&#39; field to QemuTargetInfo.<br>&gt;<br>=
&gt; Why do we want to expose endianness, and what endianness to<br>&gt; ex=
pose? Endianness is a runtime bit state of CPUs. Sometime<br>&gt; this bit =
is hardwired but that is an implementation detail.<br><br>For some targets =
it&#39;s, but for some targets it&#39;s not. for example <br><br>mips-softm=
mu.mak<br>mipsel-softmmu.mak<br>mips64el-softmmu.mak<br>mips64-softmmu.mak<=
br><br><br>mips64el-softmmu.mak<br>mips64-softmmu.mak<br>only differ the en=
dianless<div><br>&gt;<br>&gt; See commit 0e2c5647d92 and surrounding for Mi=
croBlaze for<br>&gt; example.<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br=
>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000ba30fa065c88dae5--

