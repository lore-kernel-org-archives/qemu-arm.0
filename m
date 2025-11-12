Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7C7CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJBKD-0007Av-1j; Wed, 12 Nov 2025 08:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vJBBo-0006GV-38
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 08:47:13 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vJBBm-00021V-8K
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 08:47:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2955623e6faso7939315ad.1
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762955229; x=1763560029; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OXK67goNHJ+P+gI6mcNs3nLm7964gi6Yk2bGPQKvNY4=;
 b=mFOcEFiOc0EffmY7mYpiIhaDgIpG32KYvQMazZeuo5NFyxRsFBubgpDGeJEA0lkjd/
 Up/LL6PGmelyzd49HoAuxMpdxY2lvGly2rofAL43KTjsGSkKB7XhtLOKzHhe7yaNcj2e
 RQqKXzsaDVa/NWv7jwu5SyIPWHImz+cMmk5VikrqzlNpM6ujbmj20grEf6WrCqRN4CNH
 rNeEvPR3yxkLmy8O0j8xKlAoFDWhBxCMDjgSNLWqhjoqTGDoKL/zKJ9CuM2Ai736iYyy
 VurWluKdZ4cuLZ/VRD4mTu/jKn9xKq7wR75y47aeNTufNLRQkhcr/LZRfe9DL9qxxUvT
 HQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762955229; x=1763560029;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXK67goNHJ+P+gI6mcNs3nLm7964gi6Yk2bGPQKvNY4=;
 b=QMVYOwLhsHOWL5iahm9YC+Zxzclc4QMa9qgKEjCun0RDlO6R/s8g8iejlKnNGjILOx
 umtYsCNc/WbphQaiVIPCrJ3weACg9Rjzo0O79V2So0ddeH8EUvYfZefIzj3/5nqYV81J
 vCqt7utwz1F6BLmuOAAdhiYjz0StO0ypDrxxv+QvvIQe0SU2FKe43D5dGHhG5HaY6qsD
 gAUabpt/66l1VHOIOoyiM/ZdcgfxP0On0EsPCPTEENNOPIyWVGc0LAeE0tSjXGLN5omT
 5koAETGAwS4x+jQCbfr9owhlq3rAspew1u7D/vh8N/iFunMj9u697s/3aMQxYr7khEMR
 a/3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUquxx1nZlHkal4Drs6WZMbPsfQ/ph04G5dAsVbsB93LfUOMLIo/s5bPD9zq/yiVdlzUetDF5s9yg==@nongnu.org
X-Gm-Message-State: AOJu0Yytz7MR7p9v0h3kZs5KfDsK8CEI4AXwvvXYzATKeYH9BqTXekWO
 UejBEzLdlTV2bU3Cv1a5LQnYRxeEfxl8VGrB7VV5WgK1Sq6nZnS7lgd01fbPbj2Lb0akLVcnS6U
 OLigT4/k4Q0z1Ks91RcEu8AFps/cC8e0=
X-Gm-Gg: ASbGncsWVAeCoohlgypD4hCxQCMgKOnbEGB78MNCjWlYnaW1IEK5HP4m9jpU7fRjd6L
 Fnf0gAPqLuQLNaJ9RG9OrC60q0imw8kgOryXfXriVl+mmMvUIhlAa5fJOYOui/AA6qaqwpjkI9F
 FWjFsQJz67D7LNpgmN630au26wzfKUY1+5OnBZq3Qy8LyxgTiC5Vf7eg5U6BM/8+raZBXmFJjRz
 GDk/x+VL0arD1gN/cliGVvabLC9CC/P6cPZNMkKM3uhxNhy8AM+sMDLYWwY
X-Google-Smtp-Source: AGHT+IG0dnbEHCEjdmS540BIepNy1Zrt0slOR9WyQlHGmpMnhiOwetJAl239WazMBflxuvTB1pxWk+RJU1z1z5kwP7c=
X-Received: by 2002:a17:902:db0a:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-2984ed92172mr40082905ad.22.1762955228645; Wed, 12 Nov 2025
 05:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20251021205741.57109-1-philmd@linaro.org>
 <20251021205741.57109-7-philmd@linaro.org>
 <CAJy5ezqRdrpLvN5T_hZ2ec2FzQfQJvd+Osa9TpcFrOg=v8QW+Q@mail.gmail.com>
 <26e9622f-2390-4a30-9c63-2374a1068093@linaro.org>
In-Reply-To: <26e9622f-2390-4a30-9c63-2374a1068093@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 12 Nov 2025 07:46:56 -0600
X-Gm-Features: AWmQ_bnOFKCb5IBxOifMEeI4Tqo9wAjauSZHqwqeY6VtbhJGhCK-5xIMHsZntlw
Message-ID: <CAJy5ezqGwJj+pGkD1XDWLEN69B6=wQmsr7Vej6VJ41Rezz90Uw@mail.gmail.com>
Subject: Re: [PATCH v7 06/19] config/target: Implement per-binary TargetInfo
 structure (ARM, AARCH64)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>, 
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000288f38064366005a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000288f38064366005a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 2:21=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Edgar,
>
> On 11/11/25 22:28, Edgar E. Iglesias wrote:
> > On Tue, Oct 21, 2025 at 2:59=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> >
> >     Implement the TargetInfo structure for qemu-system-arm
> >     and qemu-system-aarch64 binaries.
> >
> >     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org
> >     <mailto:philmd@linaro.org>>
> >     Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org
> >     <mailto:pierrick.bouvier@linaro.org>>
> >     Reviewed-by: Richard Henderson <richard.henderson@linaro.org
> >     <mailto:richard.henderson@linaro.org>>
> >
> >
> >
> > Hi Phil!
> >
> > Trying to run xenpvh guests with latest QEMU but running into trouble,
> > the xenpvh does get built into qemu-system-aarch64 any more.
> > Bisecting pointed me to this patch.
> >
> > To reproduce --enable-xen, and see if xenpvh shows up in -M \? or not.
> >
> > Any ideas?
>
> Oops, sorry for that :/
>
> I suppose I missed the following in commit 38c5ab40031 ("hw/arm: Filter
> machine types for qemu-system-arm/aarch64 binaries"):
>
> -- >8 --
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 1a9eeb01c8e..86a02966161 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -12,2 +12,3 @@
>   #include "hw/xen/xen-pvh-common.h"
> +#include "hw/arm/machines-qom.h"
>
> @@ -97,2 +98,3 @@ static const TypeInfo xen_arm_machine_type =3D {
>       .instance_init =3D xen_arm_instance_init,
> +    .interfaces =3D arm_aarch64_machine_interfaces,
>   };
> ---
>
> I don't have a handy Aarch64 machine with Xen anymore, I'll see
> tomorrow if I can get access to one. Do you mind testing this hunk
> meanwhile?
>

Thanks Phil!

Yes, that fixes it!

Cheers,
Edgar



>
> Thanks,
>
> Phil.
>

--000000000000288f38064366005a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Nov 12, 2025 at 2:21=E2=80=AFAM P=
hilippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@=
linaro.org</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_contai=
ner"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Edgar,<br>
<br>
On 11/11/25 22:28, Edgar E. Iglesias wrote:<br>
&gt; On Tue, Oct 21, 2025 at 2:59=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <b=
r>
&gt; &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@lina=
ro.org</a> &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank=
">philmd@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Implement the TargetInfo structure for qemu-system-=
arm<br>
&gt;=C2=A0 =C2=A0 =C2=A0and qemu-system-aarch64 binaries.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:philmd@linaro.org" tar=
get=3D"_blank">philmd@linaro.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Pierrick Bouvier &lt;<a href=3D"mailto=
:pierrick.bouvier@linaro.org" target=3D"_blank">pierrick.bouvier@linaro.org=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:pierrick.bouvier@linar=
o.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Hi Phil!<br>
&gt; <br>
&gt; Trying to run xenpvh=C2=A0guests with latest QEMU but running into tro=
uble, <br>
&gt; the xenpvh=C2=A0does get built into qemu-system-aarch64 any more.<br>
&gt; Bisecting pointed me to this patch.<br>
&gt; <br>
&gt; To reproduce --enable-xen, and see if xenpvh shows up in -M \? or not.=
<br>
&gt; <br>
&gt; Any ideas?<br>
<br>
Oops, sorry for that :/<br>
<br>
I suppose I missed the following in commit 38c5ab40031 (&quot;hw/arm: Filte=
r<br>
machine types for qemu-system-arm/aarch64 binaries&quot;):<br>
<br>
-- &gt;8 --<br>
diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c<br>
index 1a9eeb01c8e..86a02966161 100644<br>
--- a/hw/arm/xen-pvh.c<br>
+++ b/hw/arm/xen-pvh.c<br>
@@ -12,2 +12,3 @@<br>
=C2=A0 #include &quot;hw/xen/xen-pvh-common.h&quot;<br>
+#include &quot;hw/arm/machines-qom.h&quot;<br>
<br>
@@ -97,2 +98,3 @@ static const TypeInfo xen_arm_machine_type =3D {<br>
=C2=A0 =C2=A0 =C2=A0 .instance_init =3D xen_arm_instance_init,<br>
+=C2=A0 =C2=A0 .interfaces =3D arm_aarch64_machine_interfaces,<br>
=C2=A0 };<br>
---<br>
<br>
I don&#39;t have a handy Aarch64 machine with Xen anymore, I&#39;ll see<br>
tomorrow if I can get access to one. Do you mind testing this hunk<br>
meanwhile?<br></blockquote><div><br></div><div>Thanks Phil!</div><div><br><=
/div><div>Yes, that fixes it!</div><div><br></div><div>Cheers,</div><div>Ed=
gar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Thanks,<br>
<br>
Phil.<br>
</blockquote></div></div>

--000000000000288f38064366005a--

