Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F93CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:13:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ48A-0004R5-R9; Thu, 21 May 2026 10:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ484-0004N9-9X
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:12:05 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ480-0001kl-GI
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:12:03 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-65c5361142fso6047860d50.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372713; cv=none;
 d=google.com; s=arc-20240605;
 b=jXysIVW7gBb62TQYnkaTXQxculfjzQRIhFo6gYUKLQpHgJZny/uydJnnyAoZje6mLP
 aAPAc0Kv1lD6/5PikcklKa8T80JaEpSVTjCx2SMuIDXafh78kv91JG9tTFPwWJOcGGzS
 weRzhuw4ETLe/GpBSbPb+c+4umNjarZ24aSxkAi7OPh3iZb5QgxolLXRBDJcT1vswc25
 FyIUGsQyzkWchpokPb7uzbKOEfy8N1sMN8JCeLGncLhG0S3mF+m5rqNSnkYcz/SqBDcA
 U7wV4yut7vhFLW0I68XRkNAW+Yei7wdgc7rVg4wH4e4BcRJ+RYO0Vv6BlTY5gBrNYcLY
 jGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qPWs35sie46S8s5z3t95FtOk5lKAehKhIcFOa+1tCsk=;
 fh=JcBlkSJWobYi3Mpl8h4NE6oxkwGeB5TifG2WcaPsXaM=;
 b=BsQ7txNYKUE/5S6PV1u/K1ObOGvHxG+Fv8ZtQ67AHQPt5xgVPYj+pV/ZbD2h8JGPv0
 BGQgCS87EY4rIkZVQw0I3VD91fN2rfD2Z2pnWoyCvwA0a57aOBEmJ+87b13+IJYlOyY9
 4Y+JbM32fvNoP0Vuh2brxbYR2PHkP1nsuUviae2MSf2d+ZdtGrMMJZuUbdlEk1qWXbud
 HbIkQk+wPnlTID3+ZrkniN+vWt/J6IZ8g7z/buzu3KXVT1b08VTMj67YxrTlSQkwYnR0
 h3iWudb9abk4Tp4JriC1WRpVWHlrnkHOYKogaIF+YWfnlJGewEjwSg4Acn9+2m+XdITR
 tn4A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779372713; x=1779977513; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qPWs35sie46S8s5z3t95FtOk5lKAehKhIcFOa+1tCsk=;
 b=MvX9K1Lm6RzXY3R0E6/kwBDReNBM93GaWzm57mFFRmt0/pvNI13Gg8diJCm78ED2M8
 VZ+FyYxlMn7w/iUMrlVa3DX1UlolEj8PHhv//g2Zvno6kxX3uLhgL1Sby5IFIiHpCOjr
 oYgPIvrr7FsrV01C6XEzwLHwPtZX/U0CJCqqAo0RDvv/tx35vp9gnJaabpAjAIKxEk2Y
 iIeA7/bOUvNm3mjO+igdHzo941FWAD2S2oewL8vNOqi2YGrE79wk9Hsl87sVw1RymMjn
 1T/Bxe8xDd5+DOSGR4CF3b5oD67Z0g0v+tLtioOe51mD+l/TAU0d9z1WcWTT6vLDc4B9
 doQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779372713; x=1779977513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPWs35sie46S8s5z3t95FtOk5lKAehKhIcFOa+1tCsk=;
 b=r4nhvdNtegkVGHVQydVxgO2x9nK2jdnNJlxn7d8TqbJfo94J9AjZVwQFFvxsIkiOa7
 ZwL05DKj6LvNPi+nQ8EPyRIoPzPSXOviBml5JUOQYR24agc+wrZqUjGRFPYgcdrO594L
 SvBUquZkryynsTLqpSpq6VrX8ARGAF5/iHhwWhCuBC3RZi6X0+/PEQvs1JdIEmlnHJ16
 YHa3iiBEYlRLHEi1H9ly78CoVHryGk2CXZ4JRxe+V9JKVCxaSHowXR8v1rijflE0QxE1
 ES79eeRpBM6ZD4QBxvi3IDD7CkR6Md55WhBK9DQ7SpT05vYt5pveD7bDxfsRcI0P8CIq
 pumg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WmUmxQhXdQOUvKIMQmGG8rTjR1b9Tkp1OLgk41Rb3NTak+XpAUkkVEKjU2m6N/xsEYvPf09UN9A==@nongnu.org
X-Gm-Message-State: AOJu0YyGMu2RRX1pNY3orKY7/bGwLn8Uksuin4LLe12Vw04ohY49Tfxa
 Xv199cL95lDsfCQA2XIQ/7vwXfVYm+1l0x5rway6pGb4LUy8mxHjG6x+OGCPeK5LEGm617Uvynz
 RLgwkCuoUReIaFH99xNWf8BqcsdBMMaTXaeN8qNVWeg==
X-Gm-Gg: Acq92OG1eb7JJ+xW1zQ176lsz3gxiDVB0TiJNTq4Gp8JcB1CS18BI1hyDbEygaIpTf1
 apPTnNPDPT8L63K2KFoJUHgxM+EK/QAeuTioF60apkKsCEGUQ0r6wYlmjspAPctRHwH9GGNxCO/
 egqfb3VDWY+DDi5CONH3evRjbM2TfJc7tcqhVLmDDDo6yFOhmPCPSn/DycPu58RFuj7RHUzltBI
 0mCbDiF6bBRUlaj0TH4ZI/blwSjUyBD4QwWxk2GFg0IXJiQE708qgpg9oVKDuK5Lif8Xwx8CTmN
 lBny8u4jNg0cw+63L27ACqvfaAoRyFC9g8IEp5zzpJX8PVqY7BZWmK/sVZNYRl0DDiNEKCMI+0w
 ccg==
X-Received: by 2002:a53:ac96:0:b0:65e:4bcb:2a7d with SMTP id
 956f58d0204a3-65eae30eb83mr2507952d50.57.1779372713462; Thu, 21 May 2026
 07:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-10-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:11:41 +0100
X-Gm-Features: AVHnY4Jhr8fqC5s2SfCloCIwFDaDE-EbXnFLx9mKhs30xM3e-w2CkT_-hg9FJvE
Message-ID: <CAFEAcA9iZSXa7xSC4PSh8enDiJpQhO7xYfc=h9qAN+OTOLQ+FA@mail.gmail.com>
Subject: Re: [PATCH v6 09/64] target/arm: Update SCTLR bits for FEAT_FPMR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008261c90652547ed7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--0000000000008261c90652547ed7
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 19:24, Richard Henderson <
richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

--0000000000008261c90652547ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, 20 May 2026 at 19:24, Richard Henderson &l=
t;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.=
org</a>&gt; wrote:<br>&gt;<br>&gt; Signed-off-by: Richard Henderson &lt;<a =
href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</=
a>&gt;<br>&gt; ---<br>&gt; =C2=A0target/arm/cpu.h | 1 +<br>&gt; =C2=A01 fil=
e changed, 1 insertion(+)<br><div>&gt;</div><div><br></div><div>Reviewed-by=
: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_=
blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
thanks<br>
-- PMM<br>
<br></div></div>

--0000000000008261c90652547ed7--

