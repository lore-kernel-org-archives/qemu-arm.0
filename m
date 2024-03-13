Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2673460ejc;
        Wed, 13 Mar 2024 12:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdq8xh4bWxuJtK0mezgMSGqqe000yDvLCvRm3iosG/ymR+8O4SDt/RUL6O4rNkxYEwfTxJCuDC3AF/tvdnbzGfAKYNGDk/
X-Google-Smtp-Source: AGHT+IEBZCssURQl9gS4dBDIQuuQpsLOzZIl61hF0JzqL3vz27heWv44G4LO4MWIhR0Bzir7Ey/I
X-Received: by 2002:ad4:444a:0:b0:690:e3aa:d2a1 with SMTP id l10-20020ad4444a000000b00690e3aad2a1mr840149qvt.2.1710357827566;
        Wed, 13 Mar 2024 12:23:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710357827; cv=none;
        d=google.com; s=arc-20160816;
        b=mM3WUqfmma7ZzXFDbDBSj1uLWM5E0TmtNL3aUTlCU0Dcj1xARj+tiXaymkZxyOcMJF
         sqH0dtzJY58bUjh+yw0EmdwdyvwktoKCPhI3ML0zNeVD+38fazWjahq5GHrlSiIp6sdf
         DIm6Qk3+EXnWGxaIW4ZaJENYNHJcQAKFBP9u4HGbWcwrEeMC3xt6NCwCBeE/aKsKnwtd
         mPD5u0WDeMf0FTHrmWMigHcAIcqFZgZ6uMttziW5j8aRBcHYKEUV/ahsWYdQTgBhQUZQ
         yHk556kZsXYmzkdx46E/5V2q5VLGaAyxtKB86Pn/rtizONdGbl2kMrJuqVlWXE5dP8n3
         pAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eRHh2p+QifmRsULT1pE4FP41vA504ysLQ/KxMHYj6Bs=;
        fh=X5p6klwmSHZDNBLOgBqEh7912ad/1z5iSapkOab19JQ=;
        b=qbv6+gEBdifUx6eX29xPQ49Tg20p5NwuKHVAL+2ecAYkYhN1Rmaqv+/LtfVqwun8jy
         BXo8BX0E0j09bmFFuyjczsdkUfTn0EXtsxtsnw1+kSTY9N3JJEAwIUeTnmTLYVC3uyzQ
         cTY9MNZEwp4Ruc9GTMcp48Hfj28yoxJlX0anuvjtrE0gYlPStX0VhSyAS+vT4VQr5NTo
         xK7R/GHWlFA4p1+9PXz8U+XM3fVGa5ibPd0RZhWXDqx9JQrTs7HJTzv12eadTIhPc61E
         JayNf4wAexizRZ2Gsh4+S+d66DNaF9xa7K188kG97KRxUEsOUWT28cbVPw100o2Yt+JV
         uJOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQ+y0swY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05621420ef00b00690af36fa13si10704320qvk.338.2024.03.13.12.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 12:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQ+y0swY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkUCP-0005BZ-Rv; Wed, 13 Mar 2024 15:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkUCJ-0005Aq-2A
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 15:23:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkUCH-00014y-59
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 15:23:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e6c87b56ccso126157b3a.3
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710357807; x=1710962607; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eRHh2p+QifmRsULT1pE4FP41vA504ysLQ/KxMHYj6Bs=;
 b=CQ+y0swYDSsO+sWVcpVBAtVU+742J77qMchePBfjIGxekDmEITMKs4hxdfjSn6VmWT
 +eV6gc5km60SVdZh46FHwGrgJV2CSR2SetEl2B6Iup2XJJ9yFpJaDfb05YUUaHVaWIkL
 h3j82ly8Ny2hmNU/eFcXHKclWGGWUIgrcY5ntTib5Irvv4xB+sPgnlXthI47cIbI3BQq
 O8oJFR1d9AzPz0WwuFgI4d9qv+ZjeGbqpRH1RVDNDPTYF43jOwcTxb6yIXenSnJJvkGc
 /nO19DexjDRu1J6+Mdqlusjml2SSwiDJIjRX3SY2L1BttNFRWOHbS7WGlfJJAuzQOJI9
 98nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710357807; x=1710962607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eRHh2p+QifmRsULT1pE4FP41vA504ysLQ/KxMHYj6Bs=;
 b=oZ/cWm5zDmRDlk23Cvq/PRMTS6qq4GUNafTzMZGe+SjiwcyLW7lCA7FwwOXQCLnsIv
 rTzVt7T8PCdchaJcr9tuTz2Mo2apS94mIOENTTmivc57uDjENhe9gRKR18QizHqM9mvS
 OAP+Qq92JFvc0Q1s1ffExJ2NCL7gxrWObexpLnBbi+SMJLtSr6wWGG6n0A0hKGYpNCQb
 FjalqiKXbiGyOzxjmK6enAlfdoCg0lRetklmiKFlUAaO0E36yG1bmjAuTbxZCo7PedFi
 Xt09eqd8YOfet0zZ+ut8mtI17d8HFj7Gn+PvmP1dISYEeFrqCaGrCqvsYSZKSyN2v9VC
 GsYg==
X-Gm-Message-State: AOJu0YzNv4mBt7CiouVb3Y0cTNsE0n/VXjRD8nhiAwLpvY0FfwCRc3YK
 iOgTDNOQuWolO7Q/Glna2+NifECsz/QhVmd65elSQqAqJB+XAu9jYqlw43J8eDk=
X-Received: by 2002:a05:6a20:da82:b0:1a1:87a9:5cb6 with SMTP id
 iy2-20020a056a20da8200b001a187a95cb6mr13097955pzb.6.1710357807254; 
 Wed, 13 Mar 2024 12:23:27 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 y3-20020aa78543000000b006e641fee598sm8534878pfn.141.2024.03.13.12.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 12:23:26 -0700 (PDT)
Message-ID: <a5d84da4-5c7b-41d8-80f0-5a23af3b33c7@linaro.org>
Date: Wed, 13 Mar 2024 09:23:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix 32-bit SMOPA
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Zhuojia Shen <chaosdefinition@hotmail.com>
References: <20240305163931.242795-1-richard.henderson@linaro.org>
 <ffe7207d-c88f-444f-804f-a3597976ee3e@tls.msk.ru>
 <1f5e8229-18d5-46e5-afba-3fecf2c5504b@linaro.org>
 <0ad81b09-e115-42df-a5c0-b8032b0e8875@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0ad81b09-e115-42df-a5c0-b8032b0e8875@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: up/QKh4+JGkB

On 3/13/24 09:12, Michael Tokarev wrote:
> warning: TCG temporary leaks before 0000000000400730
> qemu-aarch64: ../tcg/tcg.c:1052: tcg_temp_free_internal: Assertion `ts->temp_allocated != 
> 0' failed.
> timeout: the monitored command dumped core
> Trace/breakpoint trap
> 
> Does it make sense to pick this for 7.2 with the above failures?

No, it doesn't.

I guess it was in the 8.x series that we eliminated the need for freeing tcg temporaries. 
The patch set would need adjustment for that, and I don't think it's worth the effort.


r~
