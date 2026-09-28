Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD1FCA5FA3
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 18:35:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBGBY-0002MD-VN; Mon, 28 Sep 2026 14:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBGBX-0002M1-Na
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:34:43 -0400
Received: from mail-ed2-x14.google.com ([2a00:1450:4864:33::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBGBV-0006SZ-Kv
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:34:43 -0400
Received: by mail-ed2-x14.google.com with SMTP id
 4fb4d7f45d1cf-6aa0ee64afdso3964224a12.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790620480; cv=none;
 d=google.com; s=arc-20260327;
 b=D9lom8W9NMJRiH7cBVUYmASFk2MEvn79Xv9G0rzYwhUzFuVdxTDj05+AIls/5yElLD
 +8iM2mQljr48iiLsLyUwMDoaAHTQGoPNyw3T91StQ5c0u1faLCLg0UcoAXF2VHFWxe9+
 G+3OHSiY4i51+OaAreEsn8J24BDvTyiIG8+c4I9Hn5Bh9v7JeS2KV0SjtQzxc0SYdxHn
 gXPkLrzovmRejClesoj5x0IsPNAucm3d/XkyONDdR7VYkHPzClhjve1bEg4/YeEgcMi7
 RN7xP+9FaEkmDIxXRQGW2kK2pEHPywoLpBniYud6OEvb46/ChfZirgeCHy5nm9aM83zR
 FK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5FFheZ5cQ9NK8d1jb2lLLTR7XGq7Hg+SNpJ+p6e3GbA=;
 fh=S6KlDqbdZD/QJuG+RnY5CrAbmyqRCGzaV+I+a184ylo=;
 b=DS0T0g6HmfLmCdl0pnJnyACcDqtjenMDov/Y0Vml62EUZOMuNeqviftlvlFfhRxhI9
 NfkQzIwMoez4q0F04jYmI4AgmpsDLw2fdbOhDKvj1o2VUSt+U19cJjpMRB00KH7/f3FD
 cxk4/FP1LfsZNr5AwVcKDuKvsgJQ5PXy+Ymxs0/IM7XRckCrdGl4qcM2mX3Ej2UYL9gg
 H4HukjazGXZolaPthx8G9iuaopr5fVgtD76pNy7Sm+ut9u+lsJeE7Z74fbpPfL6c4qLn
 Vj5h1SuCEyK5gOmb1g9xZ9ZsCL6KedVi109pErcKRr9q4i66iGPF7KdQnjNYapl3HT9U
 1tqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790620480; x=1791225280; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5FFheZ5cQ9NK8d1jb2lLLTR7XGq7Hg+SNpJ+p6e3GbA=;
 b=EZkbuPFR+WsIv9SPMj3awAbDNe7g9E7jVO259OaL4bjIfsw2thbd0OcI46R8T1Ul/U
 qT2pNiJvodjJrS7NhdaaEuJvjYuTh4SuWTofkT7YKWT59Rkc9HboEXYXfEn0SDQm9Oua
 W3eY0wRGVId2gRvQ3f3R8pJW8IxrsLNXgJu2zFizy/be1tB8jQem9FK1sBKzXk3MXHtl
 IFRZfILe5c37/2WOFLeFE9FqS3IBb32Ga51WwOjnmiaN1vC8VKoXLwncr8O0Z99GydFW
 gSGtOd6sMXtYBqdRO0Kx7gVYy+Zy7cIoBOXaiEVJiGwE2Y/CZruxU3a1e/h24QltYxXT
 NGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790620480; x=1791225280;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5FFheZ5cQ9NK8d1jb2lLLTR7XGq7Hg+SNpJ+p6e3GbA=;
 b=RBmYftNZ6hA7R0NFWFOvXJk7rck7RwzYfwHtGSA5a2yWC0USv6xtUv95zRu2MDOaS2
 KSLAZlbeCJqh+6rnddzPjT1WhE2wcpiynPXTdYhlMpHALC7i0E3CPPhv+g7zlZdyK1Mg
 51ep8gHv61zKjeny7VavZ9TIAijJ6HTZosK3bUTV74cWFqJuykCQml6i1JWW6j2q5RmC
 4PsmhLhAkuVDzLKHU7a3/FjMlPpbC5ZSbFmC18uODehE/dZT/VgjR8Xyv8c+7S/XWDdr
 vHQ1oGojBcA7M6Ti/Z7OrL/F1VCExv5OQI4EcqefIFF7xmeFhXF6lC6EbkMef1VrMytn
 8rAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2l4VtiPREV+lHlp31OYwS8pbm0kNBZKbk429udnoTH9gaqhGrVnfUVTvk49Z8etuc76OaHoDvMw==@nongnu.org
X-Gm-Message-State: AFq9FYIauN6IsjfCL2B33G3e4FDwKLMzTbd4FnbbEjyW1yzWACKJHruu
 z/lKz4rIQCM0dRIxaVHdqx0QfjyJ1gT30FOVKBGaQxWroZOzfp/HPv8bZ4S1dlxHyh01NHy0qoX
 nyXklPxlzHGaBUZgVjGO4z75ZDbjUU2A=
X-Gm-Gg: AYBFou0DoC6h6qUJkbMy9/2dXCdVut7VhOV5WYF37FDlq46OdIyL+3LHvMlZzW4PjQ+
 mWRVp35cMhcU1qvtk3BHuUwcO4a7qWszwPFMqdRZAKra0m6sND6g4FevHZ8J8hQ1JhzTqKqwoEK
 g8mQg1Pf2fM9UvI4P4wyFjMTUbt2snzyDHTAA1tvmhMfXbH3EtPwm+cX4J1FRiTBeACxxJ8YRQ0
 s6xaaLDYN85qepycexMJ6s3SRwT/fwdX9XR9ZWlf29jl6+MMPrP4BGBdHzTVmCqLMgihSY3ptuN
 UxzuyPUgOrpzKc5Tc5DjNm0iCoHMcVfs1G3RuaeQBD8G5mvcjJhyqSE=
X-Received: by 2002:a05:6402:4020:b0:6ac:26f0:15a4 with SMTP id
 4fb4d7f45d1cf-6ac26f01b6emr4739104a12.27.1790620479719; Mon, 28 Sep 2026
 11:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
In-Reply-To: <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 02:34:26 +0800
X-Gm-Features: AclHuK_IRArarHuG7tTpkILoxMmWpJtSVaUlI2r0XiP2bfhyfe8k076gzLlLeRk
Message-ID: <CAE2XoE8Fp8w4m0WBjEXF3LceFXUqKDcXhdSmhCThgkAM3wRVaQ@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000009f0f20065c8f515a"
Received-SPF: pass client-ip=2a00:1450:4864:33::14;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x14.google.com
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

--0000000000009f0f20065c8f515a
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
>
> See commit 0e2c5647d92 and surrounding for MicroBlaze for
> example.

Please take a look at
https://gitlab.com/lygstate-qemu/qemu/-/pipelines/2890507627

I do not have clue to fixes it properly



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000009f0f20065c8f515a
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
ns&#39;: &#39;QemuTargetInfo&#39; }<br>&gt; &gt;&gt; =C2=A0 <br>&gt; &gt;&g=
t; +##<br>&gt; &gt;&gt; +# @TargetMachines:<br>&gt; &gt;&gt; +#<br>&gt; &gt=
;&gt; +# One registered system target and the machines that can run on it.<=
br>&gt; &gt;&gt; +#<br>&gt; &gt;&gt; +# @arch: the target architecture<br>&=
gt; &gt;&gt; +#<br>&gt; &gt;&gt; +# @endianness: the target endianness<br>&=
gt; &gt;&gt; +#<br>&gt; &gt;&gt; +# @machines: machine type names, not alia=
ses<br>&gt; &gt;&gt; +#<br>&gt; &gt;&gt; +# Since: 11.2<br>&gt; &gt;&gt; +#=
#<br>&gt; &gt;&gt; +{ &#39;struct&#39;: &#39;TargetMachines&#39;,<br>&gt; &=
gt;&gt; + =C2=A0&#39;data&#39;: { &#39;arch&#39;: &#39;SysEmuTarget&#39;,<b=
r>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;endianness&=
#39;: &#39;EndianMode&#39;,<br>&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;machines&#39;: [&#39;str&#39;] } }<br>&gt; &gt;<br>&gt; &=
gt; We already have =C2=A0&#39;QemuTargetInfo&#39; struct which is used<br>=
&gt; &gt; with &#39;query-target&#39;, that should also be used with the<br=
>&gt; &gt; new &#39;query-targets&#39; command.<br>&gt; &gt;<br>&gt; &gt; W=
e need to add the &#39;endianness&#39; field to QemuTargetInfo.<br>&gt;<br>=
&gt; Why do we want to expose endianness, and what endianness to<br>&gt; ex=
pose? Endianness is a runtime bit state of CPUs. Sometime<br>&gt; this bit =
is hardwired but that is an implementation detail.<br>&gt;<br>&gt; See comm=
it 0e2c5647d92 and surrounding for MicroBlaze for<br>&gt; example.<div><br>=
</div><div>Please take a look at</div><div><a href=3D"https://gitlab.com/ly=
gstate-qemu/qemu/-/pipelines/2890507627">https://gitlab.com/lygstate-qemu/q=
emu/-/pipelines/2890507627</a></div><div><br></div><div>I do not have clue =
to fixes it properly<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<=
br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--0000000000009f0f20065c8f515a--

