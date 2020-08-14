Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp710182lfy;
        Fri, 14 Aug 2020 12:17:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlj+qsGJa9cyac+nbQmTwtTfbLgoQd75dy+kHxSuvBYHutlrG4ClNHDUcjGMnz7kfyETTY
X-Received: by 2002:a25:ba90:: with SMTP id s16mr5578256ybg.206.1597432627929;
        Fri, 14 Aug 2020 12:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597432627; cv=none;
        d=google.com; s=arc-20160816;
        b=Ljs7JOONT0M9Ss/nWf5UX5738BhU1NxPd6JYZWWdDIQebFzwZedfX7oJMwoDBjT8ig
         yQtfthc8yXRNXPGt0fatzsMNd6VkQ4NQGV/OuHhrletXCf+nDFPRHqMa1p1x1xV6DzK5
         GExrNX7nUrMgRG1F7TCQv0KiyxFc0CRKysvrGSjnq9cGJqHAEdZmdtI3jIZ4yzAKz6CZ
         HPZ8ShegMxBf2NPMmm5vHP1PS7Gu1f6Hwd4w8ccYoxBDubF3xcShKbYrOxI632Nf6SPh
         u35CBYeMYiO2zBj8sDTBILFvonuMjCiF0pgQhfTqAXi6wt/xC7iDSpXbEOlUYLQpJL8X
         oScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=InNc5iHyglONxzuoFETmtv9+FjywY4fvZ1hOaUZz9Ek=;
        b=ikXDF9S719WzQw2Zl5PuaTCuW+HceT5F93rZtoTGtMGcI+9URU/ixGyVV2VvVThpO8
         wyOVchDhco/BU3M4Rmbf8d4waIkQCeC7vvb+qlgzaOhUhw4Tde26jdUIeiRMT/kvuzdw
         oTgyw5ub7kO9O+5ruXQNw4nd5uk7I+RVAgBuyPQzs63Vc5jv6Gq9pgjer2sAavhlV9+j
         vyXgGkFXT5yAmEp6BZ4rhRfcC7cBM3pBYA3Lst/iUuB4PD054LAenCUmGh/wTq3zzGMa
         VdPzRFTiych/eJHKtBZYHIVxGSW1vvSiaxZIxyZc9EaxlXdziGm0ITKXoidettXormk4
         eTLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Go+yU8ZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189si8973672ybc.256.2020.08.14.12.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 12:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Go+yU8ZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6fCN-0001Af-7w
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 15:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6fBT-0000EG-2b
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:16:11 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6fBR-0003jW-59
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:16:10 -0400
Received: by mail-pg1-x541.google.com with SMTP id 189so4344186pgg.13
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 12:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=InNc5iHyglONxzuoFETmtv9+FjywY4fvZ1hOaUZz9Ek=;
 b=Go+yU8ZWD14hiW26+P60cZUQGFT7K7OML/yNyMI0w0jeT3XBbgobsCnQ/FwcrRMRCD
 KP2limwFF1f4/PwNvXVKlvz4ImfcWGdjXYvxVQ8APzgGblPY3jvtuIgJEG078XcNWOAc
 Ch0onKUeFUlTTJEc3AWKGvC6AMWbhmbAPT3a5G8yjX2zmh3m4MGbnOaICwJ+aqgsvTJD
 Bp/1qKbYj9pO0fOnkQm+4jFlNxXXlP31DiJVMI9xZKf8LgR3frqkdqnpltCC7cMzgyYe
 m3A4uEz9LETo21oH7DQiyBfmnTMVPTsi+0vmU3INbyFvhPk0uXMVuIyFMd5c6godmZeE
 lUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=InNc5iHyglONxzuoFETmtv9+FjywY4fvZ1hOaUZz9Ek=;
 b=OORlTgm9si29IKKbxI92ofSTjwnYp3v9MSzRNam+Ia2qP8Ppde5UDSNFAGg0qX9mX0
 bIN+KwVSHJAOxjjYVlk7+Fr0pNirqDHfm2f8YOqv/oSGIT3L2uiwwfAHfzhPZH0n8WvP
 pHT36P5vkt54pTScyJsRCGpbmhE0Qyhq/2VGhfHtydAoMlTgx/QXbyXyJDaenKLUjtft
 7iAE59X5g31TBMv/NOV/+9L0aJsax7gSDDda6dR178+cGCyTCQoQ1antzgA6VfRpR1JX
 yJ0Jp4Y9aHD5hP9NLXzx28LoGaHS87/xMb3N2tTlZDrxTePq7a6raUTQYsCU8U2LAkEQ
 UFfg==
X-Gm-Message-State: AOAM531xkM2jrJmLRY+WpdKJvJroWGOsrKqPvXd1kAgzHjQaO6jF+3U8
 j6Wa/qy1QxDkcqvKasZHXuDoxg==
X-Received: by 2002:a63:3157:: with SMTP id x84mr2643857pgx.256.1597432567709; 
 Fri, 14 Aug 2020 12:16:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x22sm9981761pfn.41.2020.08.14.12.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 12:16:07 -0700 (PDT)
Subject: Re: [PATCH 2/7] target/arm/kvm: spe: Add helper to detect SPE when
 using KVM
To: Haibo Xu <haibo.xu@linaro.org>, peter.maydell@linaro.org
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <76aa68f9ec73ced85070b81ef5251771ca27d072.1596768588.git.haibo.xu@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25bc0f3e-49d7-b98a-760e-4ef091a449b9@linaro.org>
Date: Fri, 14 Aug 2020 12:16:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <76aa68f9ec73ced85070b81ef5251771ca27d072.1596768588.git.haibo.xu@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rM2HDEtYAMVo

On 8/7/20 1:10 AM, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm.c     |  5 +++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  2 files changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
