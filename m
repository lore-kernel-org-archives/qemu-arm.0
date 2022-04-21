Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp583844lfk;
        Thu, 21 Apr 2022 12:16:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg7GHC9ZPjOwg5KlehzjLh3wbStxD/UhCtDxFmDpCR+Vfrc9pIlx/Oe4FhUJfZKmfsNspx
X-Received: by 2002:a0d:d844:0:b0:2ec:1ec9:205f with SMTP id a65-20020a0dd844000000b002ec1ec9205fmr1235250ywe.435.1650568580266;
        Thu, 21 Apr 2022 12:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650568580; cv=none;
        d=google.com; s=arc-20160816;
        b=wU8UB073kGiE7t/Sw+h7QArJmMgv4M7oGydDCxKSF6kwN9te9z9Twv8bI5Isr7+Kis
         /VaqUyqzhY7xwTkyPNG+L68UUCMxXFT/x8CenizMCq2x4fjHm4I+ZoO8DzXaQ55hqxNJ
         7vCNUwlvW5nffdsKrnrYfPWVasDiT5HE+WnZODO9eRIMtXnbwqQ8Byv3Jddba4U6h0Ov
         /GLKKvj9wYVpnt66H5TwnyysVWBPM9nJwTckNpg6O28XU1h+z1gZfkWPvj3x70dDaRVW
         aEdnpnLUp5pmuzL+dl6OwBMSuRyl31bCOpBMEgzP3NqhiRO+/517hoHNqR5rRokfhfqm
         0ykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kirLd6colEHDS6fjE+FyeSeo9mW7W1OMzaxGY8ucuH8=;
        b=cSXloydJQPUlzVyj7cZgxJAs1XC+ZEjl9Mj1b8oJDmhsIkBsj6wjlcn7nJ29sVmfdK
         S/jA/72Oa1ubAh/Z6S7E3jsltVFR8vGTiVHXYPIDLw/mAfy1maEZhqPfNhwnVlhYq0HX
         cupyOZ0CPtXdtzTu8x0pBtiAxXsgTaSsvnOaKPWwyy4j7xcgmDCpPDvEv3jkE9vkm7AN
         s8KuMyf0UJGGhuu9imLrTKpUhuBdBN+eWPD1Qbkt8C8l2frir8TJrky6bhkBkphgvIk3
         mtJ20ENnNzWJZyRZGHDuUMUfRTfHaxKONyQNYIFdRze+QXtCkK0MK+LdEsqs/nnhwpQc
         NoDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYYYk6L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 185-20020a8116c2000000b002e5e1776a66si3121479yww.123.2022.04.21.12.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYYYk6L4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhcHr-0008Fa-MW
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCS-0006e0-US
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:10:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:38451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCR-0002SB-GV
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:10:44 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v10so1659336ybe.5
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kirLd6colEHDS6fjE+FyeSeo9mW7W1OMzaxGY8ucuH8=;
 b=MYYYk6L4Ons2kKKmGI20RbnB2Rz64Yz7y5iYxideH+015nzE33u1sC8PyZzNZSyEfF
 Bx7ylA7I/y/tq/J4rwxGHzgnVGFXeSPcg3s6a0AqZmEWltaSMWhZuYQNm5boMZxmHJLW
 b30TEb2Gmc0zt1bTigb84A5tIeSAUnYXLeRn9cU3zGsStGdJrQdA0Bdd3jy8xsBZyFpm
 wKl4mU8anrS8hwRObSS5PqERkg3HHU6SPaIeCH8xohYi4PB6Pp5Mr6NRXz3JSsdYpeYy
 AL7MVVLB1L0qOEkRlTg7r3GZ4lCQ27TaEgNeRNySecuB1hB9AUgcKnvT96IXKynFyfLn
 btdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kirLd6colEHDS6fjE+FyeSeo9mW7W1OMzaxGY8ucuH8=;
 b=l1wGkez8uRPD+MRPiOT2FY9/tFMpBSiNcNHAmezMcDpMJp/rmh9JEyd3i4qhwQOYgo
 rvji+NWfqxHVU/+oaDsO8Ea4HrMI9VMEcoiJHoHAqOe8qQkuPjnw5fpERRCTjDct9hk1
 d99l3LDCFEFN96YRC95Fd1tRNNanWJgzUr90qLoc86a0bp9xU5EFWL5QVkVz/HBEmcv8
 YEdXLCgl9Z8PvaosVQ7m/lu+45i1nYrwg13GRZaOGop49HUNDZEmJzzwj+H1jHXS6qM3
 +NgrQ5wos92lumMcuWAzosOJTp2AQKM0p6SLax5Y8RxXgba2BZHlmijAEtRe6RpR1BAj
 TZ/w==
X-Gm-Message-State: AOAM530KR2XDi/pb4jNrB6o1/iOixyMq4beSY9xk0WcfH8rmaYYiKqoh
 OXUfPbZU3IwHJqrb3EETAGF8M9SSPTbSIbKRATulEA==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr18558yba.193.1650568242319; Thu, 21
 Apr 2022 12:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-23-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:10:31 +0100
Message-ID: <CAFEAcA9hmYHKLAXM7OuW1p-=9Pmhb26V-+27OuLsVHcurxaXVw@mail.gmail.com>
Subject: Re: [PATCH v3 22/60] target/arm: Use tcg_constant in translate-vfp.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /UtDF2yLcqu8

On Sun, 17 Apr 2022 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c | 76 ++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 53 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
