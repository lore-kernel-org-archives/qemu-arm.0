Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6522610lfg;
        Thu, 4 Mar 2021 11:38:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlv+dN+031zY8tgtTYFWEWNF5SLnFE9LwwsLwe6EnVQC7m5V5FtPdvbYR63a89tFTlv9GA
X-Received: by 2002:a5e:a515:: with SMTP id 21mr4929402iog.164.1614886727726;
        Thu, 04 Mar 2021 11:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614886727; cv=none;
        d=google.com; s=arc-20160816;
        b=huiMKS5WSzucnYG0R6fZNDBCq3EJ40j/VWB64obk63S5zIKKN7+yVqGnGVjW1juUAK
         N5XYopK4AQATKyenKms1uZuXKLbNlzcC7nWJR+ABp08NuBdqMHN4G9JiyO30GyMDS7Q1
         zTlGOWZziey5wRumH7VePxht1W68k2tIbbQYV7Se/+55ZwNDNoS/NeZSFeJFDQkyKfpM
         g9zT3gwzywSYwY/IOOez6c7DKoQeNdJWmp4vixOzestIFTvOoKbh6S9RmRqJev+ld+FI
         arCwVaotOCD6KZTDnaq+9K3hjPby03oUR9GVfbMQ7q7O8+CUenEgEniyN2oozhi9x/Ru
         sa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8/KbsUQXoQujQBGoJrpx+Q/5JMYqfSMq2kqKgBgTlkE=;
        b=iPYiPNukDupo0ukuut1TijhiO8pPHAckeJCKHSx2s+/AbEjmkk9yMXwQEAsveoyckz
         pql1QEP9lghB53xFZrhfc3OxJ+J+CEGFHQvAwx3lxjXMAzwCTxNYeIjHanFEsJyHxQNV
         sfYnos2jFReq7VNf5WHixePTmtZs9DU6O1EVFQY1pxepdBJFo0FIsLPO55cy8UWwFCZI
         KQ0J1sAtu4C5gfA2uNB0iAB/6peZeVysvEhLBwJaJ5KIAp1hUQAVqAA6OZAY8IoSfxCt
         cajv+dqW/qibdZ5QjVgBqBGeso0nCkMzg/dLCSWQFD2wT7Rhnnvq9YGN9lvWoUgkKUiZ
         VO5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utqeVOqb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si28637ilx.115.2021.03.04.11.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 11:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utqeVOqb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHto7-0008Be-2A
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 14:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtnb-00089J-Qz
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:38:17 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtnZ-00066R-Ek
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:38:15 -0500
Received: by mail-pf1-x42e.google.com with SMTP id q20so19686998pfu.8
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8/KbsUQXoQujQBGoJrpx+Q/5JMYqfSMq2kqKgBgTlkE=;
 b=utqeVOqbf7IIjhRNcaREU+Cga9w4KGpnDcVWyjRut+753kwPIG/jGbEecmKhzVuP7f
 kKnGB5NFeE9KeV6lHfdlCBtnhhPP70eTSzrTvNh9m3SIssAQpRAK8YKT442lilnT+Rjg
 SXXPK5jVFxUsrs+o2FMfmPB7LeRXW35o2xZfh5bnbRvIo5QfOtIHv4l/djB8g9YNszRj
 n1vuVfw1SIt8xAKaI18UxQ5wHnl8C5Xbhbf0Ig0rBXoOCgbJLkm3MBAbY7exhzRySYVB
 1pChUKLTUr3qXXvtQYcudwhKZSlm45V77jAnhq/orzJ3yriGJJcbpTGsXjgVy38Dee5F
 8Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/KbsUQXoQujQBGoJrpx+Q/5JMYqfSMq2kqKgBgTlkE=;
 b=nMiE3t08m+Lzq35mE+ktNRTIPW0yzqNKAi2dTuhg4mQauTvAHKPUfbJ7SQrZzolRdN
 CkvTUReuy/SI+Ixwz8Dv8l9MBOzeDliTedFMZfZVEqWlv7/3tqZ3rPEFy+n+ubiR0wt2
 vA2bv1hOS6O+SS0k8ls9SYPPjC6cV6dDHXRLXnbTz6VMgZx4qw95OTq2HInQBOP2rDMK
 a/BO/bvCAkdS1TWsIf3oVf6thV+j+hzAqwZ+vaYinjA1sKSwuJwNV+I8SkW8+jniPXv3
 Ku918QVGXNmLPUFb1NOKgitsBJMO3IIpHP6ARi+bk1f+51S/3Ed/Ph5grHevGA2yRdzl
 367Q==
X-Gm-Message-State: AOAM531K+VfaXhBaDSvFE1jZrsPT4g7rcxohz7JAPbGzdYuqGePVK55k
 T41J2yCpp0V3QhSTs3b4kO9yaw==
X-Received: by 2002:a05:6a00:1693:b029:1ec:b0af:d1d with SMTP id
 k19-20020a056a001693b02901ecb0af0d1dmr5166543pfc.42.1614886691962; 
 Thu, 04 Mar 2021 11:38:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q15sm165853pfk.181.2021.03.04.11.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:38:11 -0800 (PST)
Subject: Re: [PATCH 15/44] hw/misc/iotkit-sysctl: Handle INITSVTOR* for SSE-300
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77c90abe-bcfb-b563-3af8-859656f4543d@linaro.org>
Date: Thu, 4 Mar 2021 11:38:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SaRiEifmuTGn

On 2/19/21 6:45 AM, Peter Maydell wrote:
> +            s->initsvtor0 = value;
> +            set_init_vtor(0, s->initsvtor0 & ~R_INITSVTOR0_LOCK_MASK);

As long as you're clearing bits, initsvtor0 begins at bit 7.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
