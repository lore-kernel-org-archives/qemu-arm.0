Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp835352wrs;
        Fri, 23 Aug 2019 10:14:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywwufWIkvx9ap25NhyLvsEFl2+X5AQ/jAa47z88JCRpece5DcJn1viueqWQAMegtoZtbh1
X-Received: by 2002:a37:aa04:: with SMTP id t4mr5075387qke.359.1566580465670;
        Fri, 23 Aug 2019 10:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566580465; cv=none;
        d=google.com; s=arc-20160816;
        b=oRIGFwwBcQQSou65FQy6OjxuSNwwPUqoaI9WRTt8ElthL4Nthi5zkx6u6YOVZdFisp
         gWQFsa+mtHUKfaj+HSi2Kg9grnunq+jF4KKtzUzL7oWPofQjbzzq39AiEhHvOcHVamSW
         IznZ1F79pmSTeO/uWGUhuoc7n/q5USGeyqm7UH3i+sddzYkYGq0utTbsDRPaTFVp60zY
         isit1db6wgCUOSKULpoI/IvHtD78LrGC00pVUih6K2ALeagQF7w2HXedDx9FqvT6qLP4
         enaTrmeOsZZHnzr0yxTkICbLBAW8CTB1YU5XNkI1MzEMweGtn75zLOq2LwEjQBMfqDoM
         QNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=UwwDyKsK20hJbCWszD7R2tx8Gw3xJoPyexTPnK2ele8=;
        b=AEE6udq/SruJGoGIw42QZ2Be1XVqBwYLJtdL8/ZvB+r/9o/paP1BW4GjKCbdRnLoS1
         pGe6vmjltoawO5Qr0I+4DutBaG3QLeDbX1LCI0RShj7h3qkyvIYVN9IyN1rfsvh61R21
         iWpYVTqvXPtG6O+8QTKqWVuYI90dhjCeKBwW4rlj9VlbcnF6cDYf+4Rzh7TSvwM9/vZa
         VGVY6mgyvauk/G7HyVR0nUKTWa5cPXxAFGEDoe0FdNpKeJ3/Ah6gmjd3bvuoF+L4IEYA
         b0wOxBcA4jTmc2I65/CBcY5zWS2gWx+I3cHyAusAcrKomKzb75F0lWkwMnxSdRFSdIOA
         Wn3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TvNsXiTp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si2157860qkk.378.2019.08.23.10.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TvNsXiTp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1D8r-0003hm-3O
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D8d-0003hT-Tk
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1D8d-0007U0-4L
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:14:11 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44846)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1D8c-0007TS-VW
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:14:11 -0400
Received: by mail-pg1-x541.google.com with SMTP id i18so6096373pgl.11
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UwwDyKsK20hJbCWszD7R2tx8Gw3xJoPyexTPnK2ele8=;
 b=TvNsXiTpqlLwLx4roNlEHeVKyTgEX5zVZ84ANPufUcijNdkXHEi+4HbeQTaBqZjyLQ
 rQOUzzW4bwjV6MtzLEVcQb0Xy4THSx7BTymjNVCD8r0Dj1ngRJjokhBhv/gQU0O2xBsp
 Qb1Dfx2wqNEpYqmBy2sYjqJueSQxyL4SMz1PF3ArLD03ot+DZYpW0uaYWsfdDv6xooke
 tOZ7KtZ55ZhslxxTgDbO6JjOcTPuqDytHfrM3Nb1BlZTzK4ogGrdNznL6P7EBghLpsLk
 FQJtxAuilqR3ffOca+kzmQPkOW6vSbxed2kbqxqkfcNHDNjqHgLB2SMQjFeAiFaKsFn4
 TRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UwwDyKsK20hJbCWszD7R2tx8Gw3xJoPyexTPnK2ele8=;
 b=esf4E6lCoRLsKS5am4BTuBTgQSTRPOKtET9cjUt8h/Aqpswvhu4Y5ub+/gzCFtXb54
 yuL+gA2UqUxD8gwr7zMxJO8kt4JcxutO6PUoU/YmzinmLOwKVk3blZTZ2Zxp92hVK2LM
 BFxodpEPnZXnse4YScvzt7v6EKnkvUnSXWGo7ODiMiv7oXRxlhiVvSDEMefVrlkDOVK4
 J4kNiX7we0AjrF0JZk8kL6EcI+58sjUmPRisIMumOxH9QFKytUy5ojHI6uEoR/gC5daB
 tnzHHB63yntMDQT9aBB9dCP9BRJxMddXBDjNgFyEzSo9O3tgGzdUwq1OEQKPpkzI3t2U
 SAEg==
X-Gm-Message-State: APjAAAU7KaTHC9T37pyr3v9M6BTd8zNpRHMnKftGEw2f4lIC0F8lq0Tb
 L3HqaVrh1I8pYqW8W4M9YmTm/g==
X-Received: by 2002:aa7:9393:: with SMTP id t19mr6283753pfe.12.1566580450075; 
 Fri, 23 Aug 2019 10:14:10 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i15sm3194848pfd.160.2019.08.23.10.14.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:14:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a26e5860-7fe8-5095-3041-c0f7e188052a@linaro.org>
Date: Fri, 23 Aug 2019 10:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823135811.13883-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/4] RFC target/arm: Do not
 build A/M-profile cpus when using KVM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /whv8auEYVg9

On 8/23/19 6:58 AM, Philippe Mathieu-Daudé wrote:
> +# ARM Microcontroller profile
> +config ARM_V7M
> +    default y
> +    depends on !KVM
> +    bool

Likewise as for the previous patch, "depends on TCG".


r~
