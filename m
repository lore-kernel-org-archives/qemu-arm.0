Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1268C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 13:28:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whonQ-0004SA-RA; Thu, 09 Jul 2026 09:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1whonO-0004RV-IL
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:28:06 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1whonN-0008KT-1q
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 09:28:06 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664d530fcfdso1323085d50.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 06:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783603683; cv=none;
 d=google.com; s=arc-20260327;
 b=elbjLkmo4WsyE5na08kn16SzHBsSCBWxYs4KbyD8sEGQZTcluQf9owQMT/UdRV3Iwv
 hyHku30Df44P6uRvcxKNtxrwd4QIYzqIFEjn9RZV4FvEJUVD50pkPya0Nucn+2KpG9h2
 lSCiI4AoNrmCoTcx5G+dRaPpioLLpqAFXCZrUFeVOyWZo8md30ywLWVpqjSqAfZoh866
 GZbxojVnh1n2xgFA87gQKua+T5KmoIKuiC9P6PrOQu9XrmOlFA5fQcv8XQAMRFPUSZ3x
 sYYpPyZ26hHsKUG0a5CcKZ34lW63PaQSsBdxthVyxQqP3XoG1qgX6dXSANWzbMKeHAEk
 Nsew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=whJVHBLU8XN1bu29etXrqHdM1+t3RsWUdRcRhBEktyA=;
 fh=nS2trf6nL7oXkovbM7MTmVlGYKfhjECu3hLJlrcUZXA=;
 b=P7G+rl2WrU2sFLn5q9wxPkMC6TNOTKU7k9tQXEkB5juseD06ioTltgHNP7gjzfUswl
 mEreJCEVXvT6iZrsw7Ehw5+4e6lBCuEMZrqO7C4DjhgkGnhHL6VEYyL0B1rUKY9zA/4y
 WqjsmjGwUT95njl7zgRXAn0xDZ08dnchvouRKP4m5hkt9mbliQhsOQ2DGgwM06bjQF4i
 HDGy6M98IHTfow2vMU3fMtYSBq78AH8/WKMQcxmtcoumipRSpH9Q8A7xIPll5Ac+X/O+
 6e1b8OkvFEX8d3xeDDQQGmf2T86pxruWA7cxGJYnf2ulqiZEMpWaGSDW8MMA4rr+I0s8
 NEoA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783603683; x=1784208483; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=whJVHBLU8XN1bu29etXrqHdM1+t3RsWUdRcRhBEktyA=;
 b=ma/ko62fhBwcU98rRodsUYNydkYZONxAS/5VpmZWH+aKmlgsTva/ZSQS/Qc8ESqAYx
 tqJ9ouUhf8XWwc2uu3m/vhV7o0KLSX+d3UrwYQHa18NH/+65FSbZyqdHwhaipfI+xopH
 lqaUw/RNvjYYikpoYxrnRCOmJdpxG1DilP5M/A0HzPVwNcVG1HonSWIplIODgflmDpbh
 aqFbN3Y2QuCwjaokqAr73J0XomLl+nl0gzjJkQHauNuIJg5/mGWb6cjJ1KnkTKpDRwDC
 hBeQ3qwhD/XdsuNd22/elpuVRH8raQqJb9c+DLGGKNwIfiKmm7+Nd1cDz8NE1+4eD9By
 g7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783603683; x=1784208483;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=whJVHBLU8XN1bu29etXrqHdM1+t3RsWUdRcRhBEktyA=;
 b=XbQRmOaDOG/iAzxr+37Fv95492L7Q/K06iHGjY6o4Z6Q9WqVkv5ZXB0xvdv4+jsEvn
 Si4HiRUQCc7yAoIosIK/YOgI8kwuVDz/rCHRgekeXeT5Fj8nLO+Tj4I9Ua+WjyZBKLr8
 tfxn27vmLODOYAqXmdmUM4FqFvflC3utGvCgXa1Y7l9hPm42+6jTidprvZ+1L6QbKdgr
 +wMQmtBcihTeJVz2eEuIQePIXID5Sa6GfcEKIfgRJR+wMM60Vw7A8q/2iItPKyNqnIW5
 S6rP71cT0bACP/2qUFsoEIOIGYSQ0RAHfwH9B2jCDoejZRlrM1QHYVr5tflhxhxLAklY
 YAeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RppPsr5wbdlR672/BXBlEwrXNINjn/PIGY5lOgx2ijLBx783HFTyVIfwwCmpsXZZKZllluExdGX9Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx5hRzygkArmY2a/8f7GlW8vaRznYVU+kOHjRf47hVPhDbaeB48
 PfwkWcJeQlVKbQUucvuRE1Z/OEbUT2+AtW8E+8oZZKbSEZXukNjgu0967iDfAkO5Fvck/Iruspa
 oKHI6tWlSmG12IRJgmLmczai5JmlHArM=
X-Gm-Gg: AfdE7cmwVc14d4oxE55hxdKNNGkaOcCmSJ0PHm3ZQkJILQuRVxFudqM/qQqMx05Ehfo
 gUE8IZf+Zl4sn1sE86KdtjNem0iYG8kYRGGHjawlncNFtC0KycFVWBNbtzU99N2POdG0NnNXcrZ
 nJIBaKSRgGcxfI8d+q8ZKwmmArn0AGafynnPf/swSq+5nsjLwSEE4dEjAq8Aa2XpLPfl5lCMfEQ
 67K8r4eCMKwn1BlLsAfAxtyRKS93JELUoJI1xN59bRs733SOGH8b+p4IoNKhJ7VKWfUceY=
X-Received: by 2002:a05:690e:1289:b0:667:ae6e:1a18 with SMTP id
 956f58d0204a3-667ae6e3271mr4116184d50.36.1783603683395; Thu, 09 Jul 2026
 06:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260709104802.1989086-1-peter.maydell@linaro.org>
 <2726eb5e-61ae-4600-9c47-2ce9d764afc1@oss.qualcomm.com>
In-Reply-To: <2726eb5e-61ae-4600-9c47-2ce9d764afc1@oss.qualcomm.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Thu, 9 Jul 2026 15:27:52 +0200
X-Gm-Features: AVVi8Cc87T0UdhhurfCiVvN78WGsblq8ECfazO0Q34AhTx3QtKsEqKs9ArrzesM
Message-ID: <CABtshVQdNbKF6ebTmu32h7L-zuLT-W2wzTXCWbop5PJ9qCvXyA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/allwinner-r40-ccu.c: Correct handling of out of
 range accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f80b5706562d977c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000f80b5706562d977c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:03=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:

> On 9/7/26 12:48, Peter Maydell wrote:
> > In allwinner_r40_ccu_write() we handle writes to a MemoryRegion of
> > size AW_R40_CCU_IOSIZE, and the register array is sized accordingly
> > at (AW_R40_CCU_IOSIZE / sizeof(uint32_t)).  However, one of the cases
> > in the switch is a range up to AW_R40_CCU_IOSIZE, which makes
> > Coverity think we might index off the end of the array. We also
> > have a similar case in the read function, but since that returns
> > early it doesn't have the same issue.
> >
> > Adjust the handling of out of range accesses:
> >   - use AW_R40_CCU_IOSIZE - 4 as the upper bound, as this is the
> >     largest value we will actually see
> >   - return early in the write case, as we do in the read case
> >
> > Coverity CID: 1663687
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/misc/allwinner-r40-ccu.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
>

Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

--000000000000f80b5706562d977c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 9, =
2026 at 1:03=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@oss.qualcomm.com">philmd@oss.qualcomm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 9/7/26 12:48, Peter Mayde=
ll wrote:<br>
&gt; In allwinner_r40_ccu_write() we handle writes to a MemoryRegion of<br>
&gt; size AW_R40_CCU_IOSIZE, and the register array is sized accordingly<br=
>
&gt; at (AW_R40_CCU_IOSIZE / sizeof(uint32_t)).=C2=A0 However, one of the c=
ases<br>
&gt; in the switch is a range up to AW_R40_CCU_IOSIZE, which makes<br>
&gt; Coverity think we might index off the end of the array. We also<br>
&gt; have a similar case in the read function, but since that returns<br>
&gt; early it doesn&#39;t have the same issue.<br>
&gt; <br>
&gt; Adjust the handling of out of range accesses:<br>
&gt;=C2=A0 =C2=A0- use AW_R40_CCU_IOSIZE - 4 as the upper bound, as this is=
 the<br>
&gt;=C2=A0 =C2=A0 =C2=A0largest value we will actually see<br>
&gt;=C2=A0 =C2=A0- return early in the write case, as we do in the read cas=
e<br>
&gt; <br>
&gt; Coverity CID: 1663687<br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/misc/allwinner-r40-ccu.c | 6 +++---<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss.q=
ualcomm.com" target=3D"_blank">philmd@oss.qualcomm.com</a>&gt;<br></blockqu=
ote><div><br></div><div>Reviewed-by: Strahinja Jankovic &lt;<a href=3D"mail=
to:strahinja.p.jankovic@gmail.com">strahinja.p.jankovic@gmail.com</a>&gt;=
=C2=A0</div></div></div>

--000000000000f80b5706562d977c--

