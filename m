Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp645280ejf;
        Thu, 11 Aug 2022 10:06:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4k26nxdfANq5D1JYyHujDuElYnGv7XWilPmuzWFXWel+HpZdVfWjVMV1WPNpftZKLMsgQj
X-Received: by 2002:ac8:574f:0:b0:31e:d34a:971 with SMTP id 15-20020ac8574f000000b0031ed34a0971mr90662qtx.126.1660237595309;
        Thu, 11 Aug 2022 10:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660237595; cv=none;
        d=google.com; s=arc-20160816;
        b=svRvbEoJXlhnFAGeB7AMSda4kByC+cJKm347JNROu9JeZfkcAqY3Pj4hUFke4K0dJ+
         0KfVorlbhAnaSiFniDUahD0qnxV9I4Oint/8gUNrOSOtO3meCb7vFqHZRfpuq4o8Jt00
         j+UToyfIXaXVead0AnXXGUISzWQ7SzTr+vCZ9AI6ppZTA7QkdYoRaKvum8MQoNSxPNZb
         vePdCuD6VVRsrKQct9BQVvEM/2SNEsx9vkNlzVl9XzYLv6Lz5YCVWQLFyDuKyL6//kDQ
         PJp7lMrTXkR8QYyq5jKmUWMjeTsnbUe3xt3/F931yIiN8yy9IX+TzFDE4Bw6ukMfAFQi
         GrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KNYubXLlUp3JSG0xR6rce6fOtBsj2gWVJouAGy+hW2k=;
        b=ICqCIrMkHFnvAzpIr+76GIv5puIXfVdNqoiUx1R6AmTubov8gd04OUfiWdlyJj6Tsb
         2cUGtPWgXh+BUMqi7azKgQz+6xusdLOMrM+0mLJCZ2GX72mU1lJx2ZwS3FnrnvRgStxV
         wHzmOPB4kBV2FuO9mg+lw/pEqPDR2F0nnHRW+sjN0G4YNBILeENIij1N5gsBNDvtadar
         mROl40+AFn4CFxEFqPpMTlMDuT3SA2p//rHCzKqRVsTekE6eydIHKSG9/eKU2GuuuKi6
         1yY6y+sJZbpGR64466/SOTFWRZE3fu9fApsW5QJ01E5Kgi7vdHDrqkXCRoEHZXrRkLYd
         zyEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlyiYv7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020a05622a004100b0034356093a96si2054005qtw.480.2022.08.11.10.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlyiYv7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBdi-0003L8-PU
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBZI-0007o2-G0
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:02:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBZF-0007H8-0w
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:01:59 -0400
Received: by mail-pl1-x632.google.com with SMTP id 17so17409153plj.10
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=KNYubXLlUp3JSG0xR6rce6fOtBsj2gWVJouAGy+hW2k=;
 b=MlyiYv7EYoYtWV4vIW6b99Cq3oaGhA3lAM3fwjGBolS8hnHkURmP6wOqlkER4F/+Bp
 NGQIEZc4OyvRZTjRMSqatfhMZcWW65SDmll7e7vnKWorwh5YRc5Pvg1BlxyuJhHhkBX6
 bFZfq2I7e0qomQIx9r150mALDP4zrk+a2PZVdOdGioMNxqV3KshgbwIH21piFf7Ph4EZ
 ch0quYsCHjyK5npvrGHu5Q9/FP3p869dLVWMSiMuC4CGBgYLMlCXMf+H4gH3WkRrUqLU
 m97ATFIMfHQciHLsySgZ/jkOze1EEwx/PgjxkCi3T40NCgPPXGkhpGW8rErMJAjimmc4
 sJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=KNYubXLlUp3JSG0xR6rce6fOtBsj2gWVJouAGy+hW2k=;
 b=E0zdzubEMyNI5DZ/4IGqHh8WiC4etV7zFG03SrHYqjQrn5jCApukYS1b+TM1QFHFio
 x+69QQ5hTmXfIcCDBJ6UiGEuRvSCzdHNQ5i1RA/w0zgHU0BwJpPzit86p5HSkeGGJK6I
 Qj4GuTD8DTyFC8nMgVW8qr9Pzqq9V3MQAILESHEw34mBqe9bmhddXBtTijkNhvkXczVs
 jOa9JVZkGWlap/V8x0yd1SINNSiWbvUDgO1V1DqVNe5BI6c0lUREa5AgwqXQkH5LftCt
 ZV8uEW2CE7PBy9bVL2HCAKHll2pSQSllgFIWDeqhgKmjw+czLQEZn2CgVgBPkbLjc7y/
 +Y0g==
X-Gm-Message-State: ACgBeo3MfyGylqmxv9KWDSqSsvS74ziYNRFpx6UNxLwUT8b6Y3B1Gqkr
 sxbHz1NCN5Oia5GOxUnHY+9IYA==
X-Received: by 2002:a17:902:ef46:b0:168:bac3:2fd4 with SMTP id
 e6-20020a170902ef4600b00168bac32fd4mr131085plx.132.1660237315416; 
 Thu, 11 Aug 2022 10:01:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902be1300b0016bdf2220desm15015411pls.263.2022.08.11.10.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:01:54 -0700 (PDT)
Message-ID: <08433cdd-465b-eb40-0177-6de47475d29c@linaro.org>
Date: Thu, 11 Aug 2022 10:01:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] target/arm: Don't report Statistical Profiling
 Extension in ID registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Zenghui Yu <yuzenghui@huawei.com>
References: <20220811131127.947334-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811131127.947334-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: Mn2A6oAkkTmw

On 8/11/22 06:11, Peter Maydell wrote:
> The newly added neoverse-n1 CPU has ID register values which indicate
> the presence of the Statistical Profiling Extension, because the real
> hardware has this feature.  QEMU's TCG emulation does not yet
> implement SPE, though (not even as a minimal stub implementation), so
> guests will crash if they try to use it because the SPE system
> registers don't exist.
> 
> Force ID_AA64DFR0_EL1.PMSVer to 0 in CPU realize for TCG, so that
> we don't advertise to the guest a feature that doesn't exist.
> 
> (We could alternatively do this by editing the value that
> aarch64_neoverse_n1_initfn() sets for this ID register, but
> suppressing the field in realize means we won't re-introduce this bug
> when we add other CPUs that have SPE in hardware, such as the
> Neoverse-V1.)
> 
> An example of a non-booting guest is current mainline Linux (5.19),
> when booting in EL2 on the virt board (ie with -machine
> virtualization=on).
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think we missed this earlier because it happens not to be hit if
> you boot the kernel into EL1, only EL2.
> ---
>   target/arm/cpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
