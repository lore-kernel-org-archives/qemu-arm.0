Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2174290njb;
        Sun, 20 Oct 2024 22:57:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9CuWInMBG3O6hGPU1cZVFEJydCGyOG3qdiBPOJ8qMNs391050TRX+RVsgls3LqTKKuOWy4gSzGW/gRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEMIWW4oFlwLkcIFV8FT5d2Gd0m+riCpU0llefo7vI6q6L8fBEGe6KLe66YmusTOjHPs1de
X-Received: by 2002:a05:620a:2a0b:b0:7ac:ae32:286a with SMTP id af79cd13be357-7b157b6b9b0mr1463997085a.34.1729490238598;
        Sun, 20 Oct 2024 22:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729490238; cv=none;
        d=google.com; s=arc-20240605;
        b=l2dhdsTs5lpUkUKyZM0XRbWc9y2GSEQoCFCFBlSO4+UXA/uQ/8vr0uNnNL7NKunpQr
         nirE2KqznvpfB/uEnVcZzM4bkajLeedcF8CRurcqFshyKbf/Kik1RW6LMVFqWwTNwJCP
         gSWw8TwTg+f08Le3u1aqOwSyxWvA5Ii3KQgeWb4yNKFNjXh5iyja1p2eltpWxgmEVo/j
         mWFjXJPpl7OFbdvGZ1OPFTqAXF9vPOKY4bRoUTBeLlBj3wQkZ5VW4zhAqGjYkp4yRUjL
         Glycxjz2fIoXSeDGzGZ7AFOI5kFXl409dN/87iXQmeNvZL0K6BDvCZYu3cVN+qczMH3V
         ZZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Ipi+4dLl6wjj5zvUaQoJRl1bUD5+iX/uRALqdzMGNVE=;
        fh=eN7lZ9heibeUB6u5SzBPQic8EU7Yz3B8TtcMbhjB3Lg=;
        b=atoeo8tZ5bBrx0xiw5IWgujwA9j/APIAjaNXkpCtZRKiJa5UvnS5xwyuxPaHatiboL
         bRdT/D9TwAuY7ZsveuUj6FFEtxCcdDqA0tfcaisTRAO4vFfaC0bvNM4zdWtAjT9imga6
         yc1Ye6Z6tlb/ktZQjQfXNCtWV8GuYVjrGg0sIgQlAXfn9XLN31Rr0f9FWvxPH3rUcxck
         gvDjPhU9k6j1NO5dUQDTwIE5W443A9ikgoB/7nTz9AzpaZ8/YeBltPLnCzLNBTW24D7n
         x1x97bJH+XiD6J5+edamAMNmhGY8F8PfOTV3ASTPwdlFI/Lp/r+HDykG/TcH9e/VSDIe
         odaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1659d0a33si314011685a.50.2024.10.20.22.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 22:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t2lPe-00005n-JQ; Mon, 21 Oct 2024 01:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lPa-00004v-8R; Mon, 21 Oct 2024 01:57:02 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lPY-0005E9-Kk; Mon, 21 Oct 2024 01:57:02 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX4MD6wzCz4wbr;
 Mon, 21 Oct 2024 16:56:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX4M971vvz4w2R;
 Mon, 21 Oct 2024 16:56:53 +1100 (AEDT)
Message-ID: <a3b39fdd-96b8-484d-a419-2e608d535779@kaod.org>
Date: Mon, 21 Oct 2024 07:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] docs/system/target-arm.rst: Remove "many boards are
 undocumented" note
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
 <20241018141332.942844-8-peter.maydell@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018141332.942844-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y7b4oXzqcewX

On 10/18/24 16:13, Peter Maydell wrote:
> We now have at least placeholder documentation for every Arm board,
> so we can remove the apologetic note that says that there are
> undocumented ones which you can only find out about via the
> ``--machine help`` option.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/target-arm.rst | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 1f806cf4a46..9aaa9c414c9 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -63,10 +63,6 @@ large amounts of RAM. It also supports 64-bit CPUs.
>   Board-specific documentation
>   ============================
>   
> -Unfortunately many of the Arm boards QEMU supports are currently
> -undocumented; you can get a complete list by running
> -``qemu-system-aarch64 --machine help``.
> -
>   ..
>      This table of contents should be kept sorted alphabetically
>      by the title text of each file, which isn't the same ordering


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


