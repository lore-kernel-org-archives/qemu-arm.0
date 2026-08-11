Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D5CC5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:22:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjbu-0006LQ-Kq; Tue, 11 Aug 2026 06:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjbr-0006Kc-8B
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:21:27 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjbp-0004MX-NG
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:21:26 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-81ed2a00f12so40040607b3.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786443684; cv=none;
 d=google.com; s=arc-20260327;
 b=LDPrsW5fU3b4eGOKNb8x6o7HBNJlpJnDf1K4QIJ/Lmi4907K6naseioM8od1CP/9V3
 2EdMExKdM50bwvxZqCSxpCYFt84zBYRV6ukdwU2j40lo3Ht5AmPE5JExaigt+LJUyYe6
 sObrHfjGYrvU27bXi8/l72vjNpRC4kFlQbG5a2Dqr4ZTOPusZ22fvReTOdHUtRu1chK7
 D+edjiua5X42psaVPRHK2/kJkyAS0pNI3MiQ2DIvQIi+8k8erAlzbs7dMAn9+XNn3aFA
 ILTmIPxwHjHlaAGDpbbBvuaxuPlXXU3jOLNn0twOmCOCA5WP/02HdLjrxGW4YSndshxV
 SLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=y6AZvIOMeqq+xm9kNHugzkoGRJ3Z04fLImudWqE4IYE=;
 fh=Ot2rjYwxryxrndT5oZAVNN2ZCm841lwzr+rihIhy1SU=;
 b=l/XcxNBzlRZR6C3rfCsEJWGyFRYfeXWOrDlYCIbbb3f/4Gt1Tbog3DQn3o+7n/fGf5
 OtmArDcg7EI3UyNtv2oh3VbwOMOljYxjfwURb2uN4etRYIBx0fnEirl5aPgp4z5VuzYl
 AzrlLJaaZRNLSLIErdUWvCXSLv6sWNA4wdBV7QZJxnT/pF3Wu7f0RmTPQV9cEsT2nKl/
 NAMtl6H6IctcxUQrGJXHWx/1x0+d/+TLfVI17E5I35gLyMJ7KHIlps6CDnnAjVnnqM52
 qF5wYAusNCtSUC0ll4jkIGhs4+v5ylx81oR+HMH0IaypFlx0uI/uy9SIEymm4TwUKVw+
 xpBg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786443684; x=1787048484; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=y6AZvIOMeqq+xm9kNHugzkoGRJ3Z04fLImudWqE4IYE=;
 b=VZacTRzuo41sPeXEr/p3cIxcI98cbnj2rM+I6KU+6jVcSp1NyN4EwBWyDkCRaO2XQj
 xXrnk7ZPjZKHgiJ/CguWFCjoEd2/th2ulaFT8t308IHDCOB6MQhijXJqTDMVoBtpRTha
 SqpBPEGUh+3HARax/wO/hW1VSiFPlpRuRHXKO8zOJkFUTlFUggK22O9+4rxcUvk0o8hY
 uJ5FyQSOSyGwkuDHuMIkONJeaZYwsaZZvXyO4U6CExt6J2A+eZ1QoEs0f/TQxnCbW5Dx
 DckCX0JmJhUj9XcI3BRQBQx+mFOYS5zbXYDi2O4AuYb8aSymjY2WZdRL+7Q799itBPyn
 X7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786443684; x=1787048484;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=y6AZvIOMeqq+xm9kNHugzkoGRJ3Z04fLImudWqE4IYE=;
 b=L8qlrW+6CAk4wSgmz3j/RXQ1/CFCr81I330VEL23nfpMqbO2pyJaPqzlrq2VjhiMlh
 IHfaWEaCvhxoy2VzLshkL+4+5MpYrbT2mol4qwGwesxJjLaEwj0Em2nV4bJjbhRSlGpp
 AcVhLZ37AUQuKwgH7HpgfvL7pGX3aWtGoE8ZLBUoPeVT4oMap9OP3HM+X5d5groWFWw2
 e7U3DGHs+okGa3m65infn3IB2N0NYX04O8qPM69uu0Hdp75WrbKp5/0sFWAfvVLsjiZW
 k25Mif6tV3wV3ZDJecWLA4KL/aAUGJC4J1iOrKiLxCuyC+8HqSqi7+XAGCJPpnBujFXQ
 eoyg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqps2jBUq6Rxz1LG2SDNS7Kk8YuoKJKk5TbhISq05P2b9RPELiZsm42a/ucpMUGPta+EsqJgOrvdw==@nongnu.org
X-Gm-Message-State: AOJu0YwDCQQZn1bOxOWSacLwq/hYlh5i7msDOtih1qFAn47yFFdbTPkd
 Z4R/uStajJVJR+vVAE2lLbFJ9h+lj939d3dhUA/riBiDn1oJ+6Vw+cS3Ju29J+X+IKy/w8fVM/0
 Ve0gxBum3WFksv70+3jK9g3iOiOytfIhhWJ/8UQWD7Q==
X-Gm-Gg: AR+sD12kQzOXnkCwG6drOJteEzAm8V1NIFFkZLruS6tb4Skwd626MMoC1WFYh3okj+S
 zRw9fRDOdlgGXhnl1cMxlmhrsQeIrnRqM4SrFVmcaggKoxVrMeeI6hBEJg9FUIW2cQow2eY78+J
 PJvnX+gi4kBsNF+jJ9+++bgz6RdW3eYHEtMu2pAngSj+56p5M/uelw0CrAEM976A5fKDo0k85PG
 5t6EmHNTOSlHS3y38HxZ//OPoRnAUQaGS4YsNp5MjnJ3Yr78XtdUlEFO86/knt4VRWpaOOeezN/
 txM48vv6Vykxo8ZQAF10A1S/LMJgPv2Nyz0MXHDpVhBN6U+6H2kq/HmIX1U7GCKP4ovMfYcERR8
 OzwQe4mmzgpaX/kmT0VbQmXnQn0HsFw1fqf8KSis=
X-Received: by 2002:a05:690c:19:b0:809:fd83:a88b with SMTP id
 00721157ae682-82f28ebd239mr14612227b3.3.1786443684399; Tue, 11 Aug 2026
 03:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260805191257.11303-1-simonxhy0404@gmail.com>
 <20260805191257.11303-4-simonxhy0404@gmail.com>
In-Reply-To: <20260805191257.11303-4-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:21:12 +0100
X-Gm-Features: AUfX_mwPDo6LjuL1LyrBvvq4EXbSgoJHfanaE0lE7u8GzdsZJtq8ozUKUIPuTk4
Message-ID: <CAFEAcA99BcdTawef1p6Q24wqMzSgnh74rU6zEF4y5vft22KPBg@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/mps2-tz.c: fix AN547 APB PPC EXP0 MPC ports
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Wed, 5 Aug 2026 at 20:13, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> The AN547 TRM defines them to be on ports [15:13], not [2:0].
>
> AN547 TRM: https://developer.arm.com/documentation/dai0547/latest/
>
> Fixes: eb09d533d87f ("hw/arm/mps2-tz: Add new mps3-an547 board")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

