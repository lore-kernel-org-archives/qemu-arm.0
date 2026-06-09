Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2FACD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:04:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWyw1-000244-41; Tue, 09 Jun 2026 12:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyuz-0001Hn-KX
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:03:30 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyuy-0002oA-41
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:03:09 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bf84a2b2077so239395366b.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020986; cv=none;
 d=google.com; s=arc-20240605;
 b=ZesroeL9MzYOE48AkO2NURyVvlPCYgMipMj8+51ij+/fiJnUi5r4neKmHC5WVe2X0S
 MvygVUzzpO0JQdYFxsTqbWImBa3FbrHxrPuWBp88/TNMQrbuyq4pccp3wun4NWwKBE2b
 wQc2iQ1E2rDDlYRlylx6k5T6n6xz3KT2prQEP3woDlbOONYjSi257P+maCCPTUIbB3zX
 rRCb/Sn7gLE6x0Mptoe03I4wZ+Og1atEqRTSRvT5pcR8rvyy0JtYP1cfBh3AiKJ/9iSs
 3xekyAIIUII2jcTNNozC0L56vUDUWo3pZ5BPgdmgnDRHmdEQb1etyE3kcv+QFCjmP7p1
 ehlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=C5vBW8iPqkDVLJMMuNst3+FGY0iTzbEm+AEpb51rgRY=;
 fh=u4Ufn+vzAcoTUL5RgcAwnpgYbs4+W64JXSev+SstCDU=;
 b=UetNSgKFDmqnndnYIjqyxtvCMduKMEuvOOvD/yySQF43lAiGHk8iMBbdCElsU2u6Fu
 VzX3HnjrxK4LrSLsROhr/X0AbIOzbsIzm1AqMHDZQOme9sSwe4R0/Mq9PgECBesdKzYU
 xbZ7e5DNpNs3RpY67h07Wa0VTLHGf0HXi06Vry9WC6qhIaa+Hk9icWIQ34rQTtM3Wses
 gRl/hEsA2U1tM0NlUC5TIaO+AF+xPUk32ZZVcfrqobQW4sjUwpRZ7pmFW7L5LBno6V30
 oVYadEQPXW5rm/U7gFawoo4Wifwcd0mmschgY7NvQ+3GUw/EdF4/H9SkfeonyRmg6pEk
 R5Bg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781020986; x=1781625786; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C5vBW8iPqkDVLJMMuNst3+FGY0iTzbEm+AEpb51rgRY=;
 b=BdlFIj1GV66Hs/aBxo7Co+2nuA5Jhdv3X0ezFPlkYcerXpDRsN18q789m/4h8a05dO
 qPnhFDKHzLcHYhODyjdzWFLYvVOAlY/T+bpqVY04vZ8uWEEQsH77jI7n0NFTHCwFlX/C
 4vinK6lsBWV/ZevuMrUiEF5zmrpCwfVPH0Aenzn8MF/LVWmjzXAnTWFgAGjqJX5UHicw
 bN5Jg2BkfJ1yjxb+UE7u4d6UnPBXPbX94SM+Gc5L9fNQezvmLCjgkwPfUt1qyGITSz5l
 PV6/+YE4rrd/yvRGMA5WhpXOKkXxw78TS3hqagCJ9h9Jise8wglVUbySnscLFOy55M4Y
 LAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781020986; x=1781625786;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5vBW8iPqkDVLJMMuNst3+FGY0iTzbEm+AEpb51rgRY=;
 b=AOv01TJsxIiQExgGP950Rl2f7FoBeNzXzsvduO4AasjiSJ7XMue7oj66MeiK3JhBIQ
 WLE5XHi3b4/8MNWZ5eE5DkaPvKPG52H24hX5Uk+ARfHZNljGc0jJq4x/95CJBJgw5LHm
 wKyNS6OqBxFEOdq1SNYt6G62EQtB2hs5UscNhiIFLOCWlBOo7WwkvH5incFecQBhT6qv
 BauBhwDHuQ1vefGWuhM/fXzy0mbW0ahOQUnLSbrTF43Zs733KgrBbID5iVSRwH8I5XlL
 xW7Jlk1tQnt2yWV1eFBvRrRVRXkFNJJB4+WGYb16eE/la6Wj8OVcUDxv31uR4rbybsDs
 iOpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nL7QAALb/SC435Kil9KRriI/HtnmxtZaRCdXtQBgZE/Ao3c7LsJSlxnyQ/L/bAV6LbBUsbZSZvA==@nongnu.org
X-Gm-Message-State: AOJu0YzEex8jUKfmWSig98/LBlMa7g/wbdud+xfPJ7KW+4s2A6JcAFMF
 mBK8DE6rU4xKv4WCG/ln9JuW1u5i6AYZjKnpnDN8DciXtaHvYHiPxWjL1szturVNyqC17+Q/HXV
 4ze9csict0tpXBCCLjCO2fxUuS7wliYs0bfmzXBFQohmWXUSk/qEc
X-Gm-Gg: Acq92OHbsYrgu/0ZMWkpVaBEtqJ+gHVtCQEP9TpeW6izR5WWNlLuB8dL1HNZomMVGfK
 w5LfERhrLpdcFmHwC083oVE9+X7RvYeAYhi10rmSE1zoj7b2QuCRbphNnkK0RrFssddxeVEIscQ
 1Q43ImBtV6503gXAPwigEc5QSiTTaA+jv07BePSVthA4k77GjrpxH3Cc6VQPb2c8TIslu5I5emY
 O3aRHFAdWd8m44VXPpW3epKUA5Lgn9BrMcOOYn/Ix9smsIsH53m4Hn1YK0tvm6s0Xdk6vxyGS3k
 gQv4IpzasbSbn736F7ylyil87CMHlwMb+aa0pfrLzqGeAPNL1Ff5tV5RsYapmMqhZjvpjdU+6Te
 Qkw==
X-Received: by 2002:a17:907:c247:b0:bf0:3f52:72e9 with SMTP id
 a640c23a62f3a-bf3743ea0ebmr1047022866b.44.1781020984817; Tue, 09 Jun 2026
 09:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-31-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:02:50 +0100
X-Gm-Features: AVVi8CfgOk9Fm-18wZKXpe5Xs8nEGQkC46mlVE1IeVnvgD21ydSSJ5Sxr5IR4S0
Message-ID: <CAFEAcA8Hg2=7iHx18TtCE_NSEMJPoPfBukt+Uox70qqK+Sf4Xw@mail.gmail.com>
Subject: Re: [PATCH v9 30/45] target/arm: Implement FMLALB, FMLALT (FP8 to
 FP16) for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 +++++
>  target/arm/tcg/translate-sve.c | 33 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  7 +++++++
>  3 files changed, 45 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

