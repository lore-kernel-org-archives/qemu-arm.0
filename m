Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp994065ejb;
        Tue, 13 Jun 2023 23:00:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7WQon/0tk/nrONTmA0RHkBPf6ENvduBHPt6JQWw4MKgXjpGJHwoNAx0JxAyL9ZqniuVgRJ
X-Received: by 2002:a05:6214:c4f:b0:625:aa49:c342 with SMTP id r15-20020a0562140c4f00b00625aa49c342mr16324522qvj.54.1686722449658;
        Tue, 13 Jun 2023 23:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686722449; cv=none;
        d=google.com; s=arc-20160816;
        b=hAcwnxkjzaeA9DemlmzsNTnX1CJrbX+heoN+2Q/wDETFeLz5bZdMPjQwDnTNZ7P7Ki
         sLZub9Wl+VTbzJJfu7v3SvIQDg6DanWIa/DreW6V5L38rTGIU0Qs9Ci76Qa01rJwS4Gt
         xmWPFS/UmVC99AM9KkBuFM3WRJHUmajLqB4tuldsW3eMalnXBfwSw6hL5nP/bF3udx7Q
         KzkYOCJplgKDiVKJzJaJJ9ZwBJx0g6HlhDCUx8CqcHPp+zxNx9VksSu62RYKgj+CW5Fw
         A6WG1+0kj3eSviv84uhQZSqGtBoG1LBss87wE5mmqoKU5V4p62P5i+Wfd0Ou5nY9zYH5
         SxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gwdvB3Znfl/4MMuRaEnU7kxIzt7z4sAyMfkbySmpu+A=;
        b=LE/Z2GQkD9K6yte8O/n1KBFgcxMaCx6Zx1GGxzq/1ux4zIV5Gijo81Iko0Iq3CMg6F
         KfeOcp52bAkiK+tWchi1HUShzTnzgVnVUfbUxbful8VkZzwh+0kmKSfugK227IxaLJHW
         RcXf1Z/Tq3YHkQU/Wg/uai+CeJIuOAJRZu6XsM+XC6KT6Cd10I6uLF2lXVUOmkygUihF
         HsAre9xToIp2iI0M1lY6XdLpIpQFvG+LSE7C0yWDV3pmNb3n3+BlKfMQnA7hNsicZ+0i
         H3WKyxEIvesjoshMytTnbELvUODauvlNBN4DF+qLahn80qJTKueB62bebL/ecjwkUJDp
         H6Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N5UmufFW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx6-20020a0562142b0600b0062b6a5ee024si8452693qvb.102.2023.06.13.23.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 23:00:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N5UmufFW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9JYT-0003WQ-Bx; Wed, 14 Jun 2023 02:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9JYR-0003Vp-0V
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 02:00:27 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9JYO-0003W1-JF
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 02:00:25 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f6454a21a9so7961205e87.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jun 2023 23:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686722422; x=1689314422;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gwdvB3Znfl/4MMuRaEnU7kxIzt7z4sAyMfkbySmpu+A=;
 b=N5UmufFWIMd+RKxYtNI+lRIERnTjpqSZWy4eTbCqsjHniOH/JIjk8lQdsfXId2dRz2
 4RV/mizoIom85qSNOi2hcqU+8DcGKHdbpUWQ92de+Df6hZEw6yq4kT3Qwdglnv/O5iZL
 VIjLvyhMEOfojflq7F3aT2kGmLLpWSuzxJQVhCBs9qMC6xMtTtIlMDLeFQm3G7zacfZe
 83vtIFgND5LUOW4b8d+arhI7cucUVNyfMGwKpnm0UNKCYo7KtKSAMKftE/dtZyX1brLp
 7JOvUURv3tfv5Yr1EmQt16VkupG3je7hgqpNq6j7oOqTdsA20zDfSVOY5D30HkJErNmG
 xM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686722422; x=1689314422;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gwdvB3Znfl/4MMuRaEnU7kxIzt7z4sAyMfkbySmpu+A=;
 b=PpBcQeR6J1ogNfhBk+7GBc13WiRfzlN91JTjT3EAjdcPMx912KxxnMxzOhNZECbuxK
 rsDIPIdXQfuVxEK1GFo1t7A/89voLXwVqCDwabB0E8sB7bbcUhi2fyEklfvwDHsr5nS5
 aUw2ftLIa3f/v2j2epIPE5vLKSROiwLa2pCrfrX46E++OQFGuVqkuzOFeJVCZujpKaAn
 MaUdkSRXYGr4rKWDZt5zChlWPItobYJpv8vlWFFXC++Bfd/FT6yNC5kOluvXn43lMpqq
 NkIizL9qu0Ehdcfop8e2E84f5J136cQhXjx6nl6vBmSm57VIfHsf0ADRuPCXTzj4qmge
 te1Q==
X-Gm-Message-State: AC+VfDxdM7X+hnDx9XVezQJ4xP69fLzR5//Qdxyi6AU7YWSqHn7JsDgp
 aRSPgcWnYbFu2IwYp+UYckT9Ow==
X-Received: by 2002:a19:6704:0:b0:4f6:2199:57b4 with SMTP id
 b4-20020a196704000000b004f6219957b4mr7373681lfc.47.1686722422508; 
 Tue, 13 Jun 2023 23:00:22 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003f8d80ecc4bsm1190040wml.34.2023.06.13.23.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 23:00:22 -0700 (PDT)
Message-ID: <f48945a8-3a03-b43c-9a0a-21e516b79fd5@linaro.org>
Date: Wed, 14 Jun 2023 08:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] hw/arm/raspi: Import Linux raspi definitions as
 'raspberrypi-fw-defs.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230612223456.33824-1-philmd@linaro.org>
 <20230612223456.33824-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230612223456.33824-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: m1ZZ6DWzPqBC

On 6/13/23 00:34, Philippe Mathieu-Daudé wrote:
> From: Sergey Kambalin<sergey.kambalin@auriga.com>
> 
> Signed-off-by: Sergey Kambalin<sergey.kambalin@auriga.com>
> Message-Id:<20230531155258.8361-1-sergey.kambalin@auriga.com>
> [PMD: Split from bigger patch: 1/4]
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/misc/raspberrypi-fw-defs.h | 163 ++++++++++++++++++++++++++
>   1 file changed, 163 insertions(+)
>   create mode 100644 include/hw/misc/raspberrypi-fw-defs.h

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
