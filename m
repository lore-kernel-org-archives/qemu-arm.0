Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD46C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woje0-0000Mk-DN; Tue, 28 Jul 2026 11:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojdy-0000KC-Np
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:22:58 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojdv-0000Iz-13
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:22:58 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c15ca7a7ca9so396980566b.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252173; cv=none;
 d=google.com; s=arc-20260327;
 b=VoxpzkWLdECKiAYHsj7sRF8OaGRHXqvWWt8GRG1dxh7cgzRd1I1IHaRnCEkU+AkzvN
 oT7JJEO9ChvNM6WQr4RDKGCj8L7YJz9xby1vicMdje24YZyevvlLn7uHMPUgRZdzUZaM
 WGzwEy2iKyWyJ/9rCsDORSzLpPvEKcn0MkKjd+fM6nvWbusJL41YAl2pLtLcUClRUoDS
 lFMdKkH0HLzHsA+VrRHup26hcvA+el7O9dRqkaCpDXTpyHoI2a3y28l+1uf1/MzNqoEA
 kUrdqRUs9ZB/zHsR8oMaS/FaodqYSUBKkKaazAtdXm2zTZDUtEdCn5QGUTdnDb+VBR8L
 WS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ogZvDInZDBn1NFO0Umde521YcougVrryculVQchctzI=;
 fh=xnGUw+GeZ7Wm5Z/R5VDXCuqKREbL3Z6TtxRBFmsT+ms=;
 b=ScUhukGDWWKwBe6YPFbcZuZ7nF/VTIwut3Wg2QUgD955gSTNUeMJOkvmzMEuu+dPuU
 LhDdnqoD0D3cvOZw9wJ2pJwToHYmh6BrO9xMti4nqfaRPzq114FucQMQHPc2ZMMoZdMH
 0ttOxVcnttt8nZGlstll8vwpL+8DMT6KiW4C0zbT4vYe398XzUyNKkK0aOxgdAab2120
 ohoDXL5VlIK2TxTClOR0DpmsuB5Kryp/2vxcHtDixPPM3DrtUHHjBDDbCyp646xWDkfD
 a6k7vd3HGnkx7ornDz2Hr0DgADUBtSVsBoSrFoAhfQIRcBbrN0QNoQ28CgXCbIw62ktT
 MzuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252173; x=1785856973; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ogZvDInZDBn1NFO0Umde521YcougVrryculVQchctzI=;
 b=ksj6VXFocBK/BvsFnHM+8c0OgMUJ4DWFHDi62yrfWzv/bITSYdsJ2bA1quyhuD//kX
 R2Rqr28TxyrUMt836teyvJC/2ow2AsGLDuJlCdf/nupg+G8eE7fPAFSlMvNOJhIRjVz+
 n+PtEEqgERscONtMpzmi1O5GVUW/5VCoLVLTI5C7xCIjliISRKrbY+Y35GPH+JjAtOCl
 HafDGKWG+mGUBz0X54ZJ7Ca7KWTk5tYeAGbn79ylANjNUNATXg5GuJRvNJnJjlNKIYG1
 q64pxgo80nQ8dfYWy/l8c7aoLyCcKilPvxL5u7pgjBdXFlmvG1fF/Na4Hl7CYVi1BMny
 R+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252173; x=1785856973;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ogZvDInZDBn1NFO0Umde521YcougVrryculVQchctzI=;
 b=QSJ+bxqLY5ZUq2DrSXguHrUjN769oa0ahRa56u+Biug2GeIsKa67jtYgW/ZGMgtYq8
 nwRx8c1S3r+kL5RWzbfkgO22dt/93sSMAE/wpn3KFf4jttMwM/Q2Zd8OyRn6RJuvSTiM
 q/W5jkmi9SC322eZL6F96IOTCfhzGV8pCig8rEBsbslatTnlb6CyuYc6GqeuF3MCRrDj
 mvs34H8JZdUVV7x7my5/u8vueDMfW6zXhwB9rzZxeSgFkazugVXEtzKcWM9Mf/FbHvVz
 MeZTJ0Bz1XaEj/IbPFQfNZHHTzx8WWYEXMnptP5NqkIyRRT6pY+7hg1HcD2qPdJSKv1C
 xaBg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoMShUcxBKjjMjiy4lRJ6zgiWTyNTV5gjbunNWjl/2QXDV0IvRFFiws2ifl0Kpje0XsKJmzMJ/zjw==@nongnu.org
X-Gm-Message-State: AOJu0YxW+YH8OzGIF3FUrQzIqRgnIAbKjg1M7iweiJZCN/kmb3XGp6db
 rTA7fvzgXgJFif0fNmcRf1SQ6R2uvjmBMiTrCX4jKl0hC1O/qL4ckTLnpzrRsz5anLGotqcb42A
 +6zq49sQWX5f/x0w+LlUToowYLBqiXlXFFcGcCa4DMg==
X-Gm-Gg: AR+sD12DnwWd+toTni0SkSkTAT1t3vnaaHnmFb9rZdOebmkdCZ3y9LnTr/6ADTGps8U
 FQILjdhB4TRFy6RfgEYRqE5TnrddfMM0LlTrao2f6XCuPxpsA9cbsR2aeOzD/ZQFIvraNClaaZv
 X2XyoSs+G4INfkPMW2wm7OyNBuCYvq2yLKzQpCqIY8c9Y4goFCphSeqgvzvL0mra+0n6ZJl2bC+
 7exYajtyYd285by4NXH9EVhD4+z+RdpGockLSS6AvxbFVZVQ6zUZ3bPqBi84OFBokbmtoByx3CH
 R/njYFSQKhVpjjegLXP03unJSE2lgrGy4jA2lI3cRw2qssboTlPIo7J7
X-Received: by 2002:a17:907:a0c8:b0:c16:9ef6:b7da with SMTP id
 a640c23a62f3a-c1f727be1bdmr139367966b.59.1785252173106; Tue, 28 Jul 2026
 08:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-3-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:22:36 +0100
X-Gm-Features: AUfX_mw-J8d96no8_Z8pObvUFwGfaNIpg-ypNV5coC7vBnr6x0wcReD2BOLLTUs
Message-ID: <CAFEAcA_-2+A9VSa6xP=_U=kjpemohDVP5yLf2sA49Qq2PA5GYQ@mail.gmail.com>
Subject: Re: [PATCH 02/20] target/arm: Remove DO_ZPZZ_FP_B16 from
 translate-sme.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 21 Jul 2026 at 19:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Expand the macro at each use site.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 59 ++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

