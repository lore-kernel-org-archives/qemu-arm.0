Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D246606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T51vlwg1
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPLa4-0000CI-DH; Fri, 06 Nov 2026 10:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLZv-0008UU-9O
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:10:07 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLZr-0004CC-IU
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:10:06 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6774639a8a4so637011d50.0
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 07:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793977801; cv=none;
 d=google.com; s=arc-20260327;
 b=TpGO+rtyHLdSUX8b5j0TQNwt8jxvCz4OwtZeQ0DqSo7odQbwzCkbdy7g4aafmG4EhK
 2HR0/kXIy9yhkc3dGEwIPBRukJLaJMqdwSjaLPTI4wlrtaqnLFmQvWIxTiulU4u6Pr76
 EgYUMMwUmyg626g8hZQ+m5w4Qkj0yaWVu01+sxlevTkzMd3zkudeI482y8oYo7e2ZzUZ
 3cVSc2ZSFea79sKbskXU6Qcp/iSwK7DXSbWoo08gg3J1nmezTm+SaP2l9COPQX7XZTgF
 QZ+ct5XZXjfLG718kqHEWTjOBUulCOLO6PMwnJJZ9bafd1wd4jXEYumxP4Vnz7tDe1Gx
 8b3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5yc9T1zRNK7Z1rGOPdCtKkir82ZD7AjqoHTexBGKdl8=;
 fh=w6ke4KUq4IYtPuQtE6SUUACXzJ4CXS4HejKXK2GJ8i0=;
 b=ghy7OINF2LFB859TC8ZsJ5mYuYCQXDag6lkWSZuUtINjcM+E05K8N84ChpHhsy1X5y
 KnyxcyQbAe2KkaC86qJvKuA4MyyjQOLNJWxZG7u9VIoVWVZ6fCiQ3msfdAqwbj+8hBgm
 V1agre//tsPzyfGPqjw1wSZOex+CCUgJeJV+VXHHHa3nNQhRpcBUDPUHl7r7SH60c5sc
 O8dvTYFjQrv6MOiWB4eeYwaOq/TgBdVXbLEzuyps7aRcjPtapUV1LU1V9ztxLtdYY2x0
 cUD47vtdaKniduMttYY5lfH3PuvB95qHwCkUUEDjkGS+rWimOUBnQKTtZ4Tyus47Ctdr
 +hCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793977801; x=1794582601; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5yc9T1zRNK7Z1rGOPdCtKkir82ZD7AjqoHTexBGKdl8=;
 b=T51vlwg1NM1Qx0x/lWrsKDKDmbr3Ynyyo5VakKUvD2MbU8w6iRR4dl/VRwiGEvq9XR
 pQTEAc6GDMZQRuU6Zohra/CXLvhLJLCfqj9yS2FEgd1QdI5Njj83lfI04w/dk5Std7Jl
 IL7mZEMeYvg2tvdbNGJ4CJ+wcLleYSZcgOAa5jNNNMl+RI0xc1pVxp9qALA40UJK4USJ
 Um8guRDGAgYMkymMmtCh9EZ1OgOLPK6r1kVcTDomuYMkFTgmg/zW3w1iA/RWgyNag5LF
 NU/LGnalsllLNm+dG/ytlRqyWB413XD5Zr3RD51wu/QSGbD0HR0a4EE2dObJ8Mq+pSth
 qeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793977801; x=1794582601;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5yc9T1zRNK7Z1rGOPdCtKkir82ZD7AjqoHTexBGKdl8=;
 b=qebTkncZbrQ+hloIQilFMviHc4LKpsBv5j17FTIpNTC5dtllAEIioPCXkXCAFnA2Es
 zA6DgP0J6PS73eLaWOB717TD+AdMQwtZHfHrAxE9BeD5n1Oh0cUCaTaGwoUodHh/ss2p
 ZU+EKf/B2cOx07xw76NkfNSkhztMDxtnbfLR8QB2e/Pv3R3b3tJ5til0ZYCPXR6ddCRN
 LOftwAGzepBJUVB8pRSKzmovMqfVc6O5KmD8SjszSxUshoc45JLaj8GGwA1xdmduAbzs
 5KnE7fs4lrQWymGDcperoPN1r5Ub8htJ6LsfscBYUmBzvOnZMjcaYG3x3/7R1g3loLNJ
 XdPw==
X-Forwarded-Encrypted: i=1;
 AL+hErGuCVFKN0hNpdvGvvnEtzo8VICps5CSXnULs8rHjQ0HwJkuAJH6jlijwnwgGJWlKifQC/ISlKzMoQ==@nongnu.org
X-Gm-Message-State: APuU4Z+e1cakpSi/dWaw/cezb4bKdv0Zw1mytYmhlhW+xSjStROX3HxT
 HOaPu8yb1BBzIFMEK4wwTAvRdw0CFvu22NcDmeUROEbqG0YExM0kI3GZIk2j55uPzDeB/uSkrJg
 YKXXpOCpVmhy4H8navxTQB0rBPs9yUDgCUMtC83qT5w==
X-Gm-Gg: AYBFou0+mSGNkvRNo3ptMDA0/0XhjmmvMc+EjeG6PhceSFm9iAt5TIJKTIoOV7czP2N
 yaQ3s0cnkcCoy5Jra2s0ok+W0n6zQkhkOT5r0FM74xhJOYq3gpJ5VJxmWT5HCMH+LX2MJUF0nc1
 PQnfkhbL7KmBx2sl96zk+kWEKgeFX6mwlwvbIkuB7T9UK4vUQ+OHyIW0unomUysTeqxVHwrEtuY
 AbIddw48bZ7iEmhpxSrHGEyfDWgyvlWk73BO2C3KkVcT764t/ITASjFq/mBC27AK6E06vbjV+cn
 SXbKose52TLw0BQzfUhdyCQD5Se4uiTTs9esM7mPnHrMckqKpwYiCBJRaa47FbcprrpDBewMX/h
 qewnRFZA1pKQJipy0ntjHlVFKl/5GGvMOVkGzlQHvLxx/aTMjdJC+tDuCSH4Jihbk+knANYD5kw
 4LzXnGneMr/P4XeZ80dUPf
X-Received: by 2002:a05:690c:e050:b0:8b0:c7d2:7060 with SMTP id
 00721157ae682-8b341b4b0aemr10750207b3.107.1793977801067; Fri, 06 Nov 2026
 07:10:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-armv6-xn-check-v2-1-1291bb77a6c2@linaro.org>
In-Reply-To: <20261106-armv6-xn-check-v2-1-1291bb77a6c2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 15:09:48 +0000
X-Gm-Features: AclHuK8nI5vcBdu2zcAdKCQTnR9rPi701N95Hb-bE1kvwpaRCak5Ab-nC8JIqNA
Message-ID: <CAFEAcA_=-miKcdxRkJsP+XdGV2AMSYR=EPMuGzMZ4M8xFyetKA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/ptw: check XN for ARMv6 in get_S1prot()
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 10:28, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> For the ARM_FEATURE_V6 case, it seems like we retrieve AP and XN bits in
> get_phys_addr_v6() but we don't check the XN bit in get_S1prot().
>
> Change the `else if (arm_feature(env, ARM_FEATURE_V7))` check in
> get_S1prot() to plain `else`.
>
> Fixes: d8e052b3876356 ("target-arm: get_phys_addr_lpae: more xn control")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4367
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> Changes in v2:
> - Change else if to plain else (thanks Peter)
> - Link to v1: https://lore.kernel.org/qemu-devel/20261105-armv6-xn-check-v1-1-fbeff926e692@linaro.org

Applied to target-arm.next, thanks (with a slightly expanded
commit message and a cc to stable).

-- PMM

