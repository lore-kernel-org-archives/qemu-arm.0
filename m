Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A5606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciUTYuhX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWys1-0002f2-LF; Fri, 27 Nov 2026 11:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWys0-0002ef-9Z
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:32:20 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWyry-00057D-UN
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 11:32:20 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b502b9b702so95633157b3.3
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 08:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797137; cv=none;
 d=google.com; s=arc-20260327;
 b=myG9iI09VfoGd9VQ5ewibr7xiMAMB4IAXNgPgaZ51ytxdGRTHx+g6ThvDQzQ3jsBPN
 dNgteTPk8kZj3iTz8ntUkpujdVOiqpiinRVMxjTgD8BDbna/+Nz6zUqJoK1C5w3g0DqE
 nvL+/eYSbcJpv9xElvPQyjQ5vFi8Qm500Rz5dfP/TBvM1U4knEvIIp8gbZvKxMQgpgWO
 xYHtfBuUorWRvMcFSQ9TO6D3m3Nf0Z6rhCaeQkJFQPDnfPxyepeRIywJrxylShC+w+dM
 FiILBFLLHK0WzWxuDfWAVg6IFszybOWfLsZ7b6MvOk+JtGPmNqqfG9YwhluEbVMroqqd
 TTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KLtlk+TdHgw3CehDohe/QPYEXiX1nen96Hla4zHMC2s=;
 fh=wzJP1R+7J/5dpdsroHXkUt8O3otQAUw0a0eLKko3ydE=;
 b=WmB47K55d+LVnu/1QvkgPdvXztQKaJIGIfI5N81P+KWNKgdeFuowij05sMMClDdIZH
 2gv9v+tQ4Bp2XfqNeisfvsLUJCOWO/FFjGgnP1QHYESEBQwJLJga1JQwDbNwFQTP3Yoa
 1UTF1M6fgwVCcr/YKN2aMAdB9ICE6hJ+EuPvVSfmy7k+HyPmFiOY5ZavNTFMmOC6s6qK
 hYA4Yj+k07/tL63r1FHYYQWeiy8CECwpnoLWklLdadBB/qajM8D4xhnChFt15KDtdILB
 31sHe0gPALv9uwNoEZLm3wtVuUto57fm69/wNTY8cYfDvMRkiOsJVc4fAFFHbKj09qH8
 NjbA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795797137; x=1796401937; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KLtlk+TdHgw3CehDohe/QPYEXiX1nen96Hla4zHMC2s=;
 b=ciUTYuhX7vWYCOzpiDzW8f3sdV1A23xRgJ8W71jVE5ZPZ7xN8xCPv71ZMexRTUNgqu
 uM4pYZlzgJtMQYLavH+eDMzkefKMTBrEVaRFvNMW1uGnUOmDhqtu6g5PHF2sdQdvzq1X
 A+wqU3dFWI/gVeTUH5CRJXq49qfpp9wS4Uo8kVMWlqwHyRZO42X5DH9Ueta88vBuK8GG
 YZ5vVFurgmqQrNy4E99H3T2XvPcdt/JlofwS40RZcD5psiBVo4v3HYKCd3cL4Z/zi/5h
 n6PjAtnNLcKCA0R5MpnVAgdDGBRdKaJ5gy87l/sO1PN1vlQ4+Kv2X3MvMW0sI9Z8t0dh
 eOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795797137; x=1796401937;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KLtlk+TdHgw3CehDohe/QPYEXiX1nen96Hla4zHMC2s=;
 b=CxfH6rpatqKYdYY+52a1gfnq1DXmQP2qXd0hFgxBVonb+3BoJllwHk/fD/Ibzy52rF
 fHHknmohyoLDh9XsQ7/zRs3xFwxP35RuDSe/F9t11RkSpE6X82kOqgYWC0YOLsDLcrg7
 GV2U799Hi0B5eELVItjIBqSkq90Qdj2Yuz9vjqGvKzUxiFzkhV670Unvx3EKpBqZfC5L
 FOnoRZ4ovRjsUnwUFFQp4Ups2MtulJX4O/RGcu5060muaFYmyRoJIFzfxoaPPRlj2QmP
 ECkbYWeIhZyniy5fDYjd2o+DsDEo4guXlihpJ4o/gYE2jeOFuIUTJ4FapLY0dMBERh/Z
 NSOQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFrOyp4njT5z/JVzg8xAtB+HQIwDocgFrO29gNu133/WXXnwnkSMKRUphumtoFVCVTcJ+1eHPU4Hw==@nongnu.org
X-Gm-Message-State: APuU4Z9/+Ti/B9i44eKF7k/9hMvnBUvbVSbmTi5b8XvCZ551EXfTJfvA
 730PjhI18R5U/4DU2u7j/zxxefwUkfT48xl0q1UzP43fUBxgku+8fRyq17PxbXeZJyiGLLyLwQ/
 no7424pX/kp2uH0hMMuXt1rHS3sXiFFPyEzwF5ftKig==
X-Gm-Gg: AZFdTZe7Py5ZosF8wfcSzOeIx6JaLCYpImitvu17kB/iE0lRs1NsxQbr3D7LJ7+kNHM
 VqO8qrwbDOQQv/vVgrazgIgodaRc7O8cUnj1BlsxvqgDiXchJql6UiLd4dSoi4J+MgiUoCL66p3
 RY80xCzEGyzVRAvncZo0BzV0aWsfxQNiBiTxIC+KsEWbZwnkF2LZTCKC7xejsBJAocE1A/GW4yf
 NMqeAYFTqiqNg+7pRugchVrxnTRUoDnycJOiIDP1T/LBDFHAp9kKSS7+tJe24aPqdI6VtEDL4KS
 7Q/AYkRlIp46IGoyF7hVJAF9sQRYMNZotpgwN6U1iTDeRHljlb7OkVvBaql9PzarPOWM8D/OYR5
 ABlotY0zfYMTrGa7WCBo9771G4/ndvf8uEBCMN51A21tMTmqq/9GtufaI1hx5agrpHIjm+YNCaV
 lk14TWKMTH8PMAk0gI5GAN
X-Received: by 2002:a05:690e:1698:b0:67d:ab75:a917 with SMTP id
 956f58d0204a3-67df445360bmr8695540d50.60.1795797137298; Fri, 27 Nov 2026
 08:32:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030194318.319310-1-richard.henderson@linaro.org>
 <20261030194318.319310-4-richard.henderson@linaro.org>
In-Reply-To: <20261030194318.319310-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 16:32:03 +0000
X-Gm-Features: Aa3M54qs1Ndoi1CpLz3b7ZRD0HwYRBAQlZC2cuHr2e9jhcG-BV1TXiBSfylV02k
Message-ID: <CAFEAcA-Kftdu66GSjrdmyqYtcd+_CJ8gZC1ao_FBGsY3AGoDiQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] target/arm: Add second value to DisasCompare64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 19:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not assume zero for the second value.
> But do set it to zero in a64_test_cc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

