Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3983293lft;
        Tue, 5 Jul 2022 07:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyEjPzbEYMTZDb5Ge7W/Vy1rKEQRTu6NXLsNwFWzxxduPMWyd++jajC4J5Hlb9CoFni55V
X-Received: by 2002:a05:620a:2845:b0:6a9:b149:8d31 with SMTP id h5-20020a05620a284500b006a9b1498d31mr23174163qkp.86.1657030361968;
        Tue, 05 Jul 2022 07:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657030361; cv=none;
        d=google.com; s=arc-20160816;
        b=mfoS54D11EkSoHCWCdmFeZ4Nf1gn+/9l4vkVc4HikuS/EdwZBbAL+EBJ/JqjWB3qMx
         x/C5VueTSLW95CZr5LTsBFKm3nHZiJ+DlkTcvYbV9fMmY9Po0UKKn+oJKnpO7xTNwMKR
         esW0jrYf9BpccwUwEuK2qZf+p87nGPI4tQ7kBnpnh35dOPrAtvjbFJdCJq/P603Wel0z
         Fb2dmbO1xS7Az4jCzEzi8LHIwaukKiMM3rfoE9wI9SGvQLuLAfVeM1jdi5XqHVxEbPgn
         ptLp6z8YkEKq8BDkr+Le2iOnA/4l7AFed1fR+QAQRb3+MAa/zAiElTSO04cOOxpfBelh
         n/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UqsobVuHM5F53h11JRDooFYJPVur6KDy5QXdIciqs7I=;
        b=CPA8n82pnFF1TbJlX+dO8UxDODJ5VNxeP21S7ffkNaQ8OW0cq7VpCZthVGAcvnJTqs
         XDD1TB8s52GEHpAZc1sWGzxOeXGWdjK4VK5QLB/92RwrK+U7xI2/2wSkCjoZ2XTU6d6g
         vaK5hvtdZou0UfakdhC2g4bgfsqaYS3v7uCPdkuPVzRxM6F38/0NegS+IlY50rh0LzOJ
         gWlyuVh7yaTFtlcBwkQWy72hZqT6ycuJJFoMYQjLEmGKpBWKTwinv+CASXqnb7bDa6Tp
         x37FwpRXhN7CXdJZ0/Y054Y6n32KT0gR9J/sw4459Gv5BTWvdcT9S7SUflT0JIH3lODa
         qSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxv6JOV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw8-20020a0562140f0800b004622a2cd4c2si18270628qvb.66.2022.07.05.07.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 07:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yxv6JOV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8jI9-0000hg-GF
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jHx-0000f5-MV
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 10:12:29 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:39532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jHv-0001ik-03
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 10:12:28 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31c9b70c382so47695077b3.6
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqsobVuHM5F53h11JRDooFYJPVur6KDy5QXdIciqs7I=;
 b=yxv6JOV9rlORgTfxHCQc745Aw2SDyLvgy0ZwEpQRO20/j9Ojxb3NGWJe91/GC3YleN
 yO1Bils3vch93oxVVqCIkikPObLBlhsbFR/rHwY2JI6PoQZRV/kUUr1hDBcFctLO5My1
 +x+cIEd0XQfP8ldTfAuJ9KPR7dMlw4BqmQezHIJJB6F0YF6NJKt4KrXmbLzQPLKR7hHl
 MYYBghi/ioD7T1YVPYCzs2dKqRHNEtSE5lKkDFUx9jZHh0k3dO+cYKWLdCGfXf4t4Ejv
 7IeWh4YE0uIF5dOTn94Nr3ytAmpznUHIHZv2YqA9meol9uIrBRoVllfbQRDzcbDpPrUa
 QIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqsobVuHM5F53h11JRDooFYJPVur6KDy5QXdIciqs7I=;
 b=yx0ymaPOwmlXrUJUE8FZorNI8Kw8milVCMQ5nVp91+kSCv7/k/AFJWc1zBfr55lWY6
 IsjHzCpiclR/wT+9VGpBHx6vDQ3EBSiCDy2jPljlLq6yRH2vaFsKVcUDiZBJxXvckdAa
 kHkMJaDYfOYqEOeqQ5gGq0346UyXkoWKECqqDhmzi0NesGzRFq3s5IKMkSCLRwBwWx3L
 t5X2w3wpiqvdj+M16HMrqQZb88lz+JTV5zt3gTG5o4MGH7p2SLOX96Ji5EPC8EaFV9BG
 LVHlm13N+bwlDJNCLCaGKgMrkTbBDufIuiBpsXBnWE0XEtzYy4cvy/hTAVE5ayHCNDrE
 T1eQ==
X-Gm-Message-State: AJIora8ziDzPT0jk66IcbhG6KRGpTWCYkogzBxVpAUW+Ii3Y2vhOkO4g
 sHN/Fj5HGuGPwEvSEOUBmsQ4/Wxny71QbUMCo8HfGQ==
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr17948485ywc.64.1657030345691; Tue, 05
 Jul 2022 07:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-7-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 15:12:14 +0100
Message-ID: <CAFEAcA8WN6DkZXFEXZFKQ3gN3GySCTVswhLiTSoeHvSCgjFtpA@mail.gmail.com>
Subject: Re: [PATCH 06/62] target/arm: Use PageEntryExtra for BTI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZN98NeVert2T

On Sun, 3 Jul 2022 at 09:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a bit to ARMCacheAttrs to hold the guarded bit between
> get_phys_addr_lpae and arm_cpu_tlb_fill, then put the bit
> into PageEntryExtra.
>
> In is_guarded_page, use probe_access_extra instead of just
> guessing that the tlb entry is still present.  Also handles
> the FIXME about executing from device memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
