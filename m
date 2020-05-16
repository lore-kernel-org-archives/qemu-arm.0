Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1018288lfb;
        Fri, 15 May 2020 19:18:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqaIHNBYrtuFlKcP4HtD90lO5sLlGhppDfX4CqauHvEFIRZLozPS6Rae2h3gZRXIo8uzL7
X-Received: by 2002:aed:3c0d:: with SMTP id t13mr6615101qte.137.1589595497225;
        Fri, 15 May 2020 19:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589595497; cv=none;
        d=google.com; s=arc-20160816;
        b=lm34ZR2Gi8ymmoQ+XHCvaeg8km41p1va/wQWnaZtrTyiDaAXzkBuZPCkbmUyOyCw9E
         RAaQq8htvhu7YZBmwqIVJ23M5ePKSjcgx0cG6ZrUhhMLTtmjztuZYVN45gcC2XY6e9Mv
         dBOMV9mzphY2H+pSOffgzdCDzQOO7zqMM1N1eBK0KvlWTOw2Xpfv1XF0+VkndueqcoM4
         GfeE6FIIz9++vjCqhB7XSxqSRpRlYzqkJ8dLCvQb86mArRPYoMh1HZ33YL3tu8X7pJvK
         zIesuGofx4j9uRUccuGf6yRhHdEIFNhOvMYloaHXNGV1jqEYRVtutB2ucmB8raW2Exs9
         jH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oexMwPmJYyEN+ltFBiBZw8MCGG7aiN1HIamlEyzyot8=;
        b=o0463b9Ledh5ViU/CjECs/qPExbiGESw2ymNgephT6vBFFaPeiwMVN9o/ihaQwvWlQ
         UGFnnP8ebo2eUof4XsqcS3L38HBZiVPNFcbNWLn9Io8y4p2vKkSHB0APJr694paXszQw
         ZdM26Lfv4tPAy+HsBNcS9gdmk/ThDvRZAEiSHncqe9jrtWLQU7tI1sidt7nxAVGgkZW1
         x5KSCxYGWiXbFH7MvZGGFzKZEKa/Z80R5eQU4pCeAL0FmTF9I35ssukqttpqLs9Vcb+w
         bLUmxseKHDgDdemctKwXk4vUDpRGjCAc5SsHKUaQixJ+ZRPkNHfGsN/iWTYOaFTAWbLL
         X6pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beMzJ5sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si2271243qkh.192.2020.05.15.19.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 19:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beMzJ5sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZmP2-0005ca-KR
	for alex.bennee@linaro.org; Fri, 15 May 2020 22:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmOv-0005b5-A4
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:18:09 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmOu-00088O-9T
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:18:08 -0400
Received: by mail-pf1-x442.google.com with SMTP id x2so1879582pfx.7
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 19:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oexMwPmJYyEN+ltFBiBZw8MCGG7aiN1HIamlEyzyot8=;
 b=beMzJ5sjH7xSc+sRsV61mW0YlWlm5jZ4b2tqYPgJ/MBDzVlkOHv0t5lr2xuPn9/7b3
 yEPfgT9UkqiwAo6AM5MZ0zal5iR1Hwcxo6GlQik9aC/1+sZsMzi1BQs+GbjbavJPmfKF
 NNyVn78Fb/VsMQI5f086/gvrg2Xl+V1zxQYOzEtbDkavYtK6F4ksW1VmtyMhnwen27Hw
 vKaNc/TLPoA0mnmJ4osGOgpvhi8YA1QJUTaUnblMaU70KtErLh0ZIVDMiyq2/dgGehQX
 A9zWrbm8wyjzlFk2vWCuRQSaCykyZ5yjlLRSHv4ekXb6hwmkSgUwKEO4PbAfOEStask3
 l6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oexMwPmJYyEN+ltFBiBZw8MCGG7aiN1HIamlEyzyot8=;
 b=Suurac07ifvO8KPDdJdfxQVKVn1cXk9PyxPvWCaHfv+DBUDYFuCVUOXZORofxfHpJ6
 utzoOTsnLfVD9vMH6djJSueMupnKGe25tvTE2clW1aPjX+mBqp2fXwPLdtejL3MG+N6V
 qF92oXyFXXZhMd00dqgwBDgicz6FzpwPSsGbwlKnq8xma8txmcKhU5gw2o5Z6f8R7WlQ
 ADyKAamdWhi+TosMX1BUULfWeY4QTR5kwhtvyoyVGzwHJRnFb8QuaQhRGanxgvP0OziA
 iNdwmbdTmzX//RQLDZwPWD1gCHafxORkHsKgMrpTSCEre2nyveWhq3piU2UegE4+luLX
 PpBg==
X-Gm-Message-State: AOAM532Y1Q2RXYyI0fL7vsaw16rG/CBc2KG/vrsJM/utr7CfcxEQdsFK
 Bc5hUzRscW9LHwCAZGlyUsKOOw==
X-Received: by 2002:a63:5812:: with SMTP id m18mr5742234pgb.407.1589595486631; 
 Fri, 15 May 2020 19:18:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x7sm3042633pfj.122.2020.05.15.19.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 19:18:05 -0700 (PDT)
Subject: Re: [PATCH 08/10] target/arm: Convert Neon VSHLL, VMOVL to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39d9c3a1-59b0-26a0-594e-d565ae77a97b@linaro.org>
Date: Fri, 15 May 2020 19:18:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tCoJGhR0uGbP

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the VSHLL and VMOVL insns from the 2-reg-shift group
> to decodetree. Since the loop always has two passes, we unroll
> it to avoid the awkward reassignment of one TCGv to another.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 14 ++++++
>  target/arm/translate-neon.inc.c | 81 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 46 +------------------
>  3 files changed, 97 insertions(+), 44 deletions(-)

Modulo &2reg_shift_nq,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
