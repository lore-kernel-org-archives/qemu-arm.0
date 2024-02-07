Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp111616eji;
        Tue, 6 Feb 2024 18:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPxojK7A8EHqPois/vRlq4DI7+e6ZrnPWT4jC1K9oLigmFaXIqfVTmDe20KAIRXZ598Wi7
X-Received: by 2002:a05:6214:519b:b0:68c:9b50:b839 with SMTP id kl27-20020a056214519b00b0068c9b50b839mr4727197qvb.61.1707271834469;
        Tue, 06 Feb 2024 18:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707271834; cv=none;
        d=google.com; s=arc-20160816;
        b=EmjUqO95g6+ykSIwiDsOxuW2jDNUdkJss20eBCQbHOkCOnYAYDBErDHqWBobOhS+rh
         5LyAS6AOmY+5ukjwejswr0nj4mAtcGXIieLSdE5Hlw6gOh/d+8Z1s6FS22jRFVR4yF+i
         PzdzUl2V8INVF9sTlMMBL3PcjkMGMBR71bCyim+eUHpxhJfihsJ9AqNe9/ClkXO7ThRC
         BDu5iRIsj7sCve5U8H7IuD089CBL/S9uFHYUqF4l4rZjLoO1wOK3IwvfWTiC0yBvF4gz
         DHoPZW5O1FTD0YZiEBtGID8r5YOS3yT0D5+rkupDz8enYyrPojG+buNAGYvkyVABnEh8
         A07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EVQKN/Pi5kHdlmu4AcjjVSVeVN6r0rU/9RwRvbWg3Z0=;
        fh=9XP/sSz6Wu4GpPHqa7FPsHpzyw352eBooE0zrjz94bM=;
        b=OAZQIPBja/9O8We/QSylNPzuHQT4hIov2f9wFBjvKpLp55h94LJ0KcU8Qt2VKAtuJ3
         nFBq/GEj0VoHBZOIMyAX+vURUY/c+Ixi9L1k8d5h15LGV0wZilcS9rgeedHJU81AQPdf
         tb/59yCr/m+HifgR2TKsSFJbdCiarPeJ5aiIw703mruA48AvYkUcSAvXBKbOc6k7zV5H
         yoAEFWYv8Upg1UWdKoXujvNo7ng4I4NCXetylY3UnkEtTT+wtw/zsr/NTfmEuTgIALkb
         V1sungrQWP6KwRE1iDJqdiUIuvML2yH7u1PZ/ubqmFm+Wf3U3cnVBg9DK8FKNA7B4cg0
         ZDDQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=edNGb1au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXic3sJvxsBA0txivZ9X6VJtsWeNR//fcNVhA359GMsah0dIQgMPTMYPSUMPE7PiJtAsUaUP3rlG7vf1zmafPYrh8+6G6g/
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020a0cec0c000000b0068c4223caaasi231412qvo.224.2024.02.06.18.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=edNGb1au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXXOL-00023s-B9; Tue, 06 Feb 2024 21:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXXOK-00021o-3W
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:10:24 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXXOG-0000Bd-6E
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:10:23 -0500
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5cddfe0cb64so61317a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707271818; x=1707876618; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EVQKN/Pi5kHdlmu4AcjjVSVeVN6r0rU/9RwRvbWg3Z0=;
 b=edNGb1audfszmPie/yYSY3G2FTJE+JiWgGu/TPZ0O1sfEv1LfdbvHWvUE5cGkFKf8X
 g6oQTpiB8txZNUXzLTGxwbm2TCKHZYSpSXfOh4rT1xLyZ8KtNaRC/zYOs7CXrdHIpwdV
 9rRNaPleTjiTGgMitVw8MSaxsXHfhoxlULJdFz8Zj6H2g8q5oYx5366SRUArwrCFFPAu
 UfgrEO5fwjKFE4Nb259BL+Vxv+wF1dcvoP79+5Z4S70ZRQdpmf2iao1r1ID5hggrBAtm
 jtXjNwSLtBwvUJrS4AVNHzONSJzatoFvv3PgR1dWF2d5z/RnmcMY6i8ii3QCTVSn1bkI
 gEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707271818; x=1707876618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EVQKN/Pi5kHdlmu4AcjjVSVeVN6r0rU/9RwRvbWg3Z0=;
 b=kqsau2WTEMkjAO3/gMf2NTeOMcPpD0i/gbqyzBzsCc2AGoo6kCqVr1mEZn9/e/xxxK
 4tEuTKt6EBPwWeDJUTXUAInaOTSEeTG3bJGwNFXumThhiNCmo3Bhr7ARftzPSSkzBcYe
 +BtNbURri+fEkRmBCahb1bC2fnHVJx0QdD1+zPCO4MZs/+cNzkAomX4ih+Gk9CmCJl3d
 Uhk6EHoti2rOQ35RN0WXogKfma3RLkBF/UqZrWCVa0BoaFbm+IzkyCJoecPQ28d8w7B/
 efMKxs356iZxfgAgrvcAt2O5CEDJavYHLiDXMQX4S6vs5CHiYoRPXAvjuzmOhV90z4Ah
 uC0Q==
X-Gm-Message-State: AOJu0YymaVY+NSBCLg0dox/74YngyW3YkpRZ6TQjBMeG08Ca/1s0WrJC
 pkqBMbzFRESJ5RUgSIEiiHzav3Zzw8tEBTun99dpYNv15lFHvykz7EcbpbXJVVk=
X-Received: by 2002:a05:6a21:2d86:b0:19e:9f2d:9818 with SMTP id
 ty6-20020a056a212d8600b0019e9f2d9818mr2058491pzb.57.1707271818288; 
 Tue, 06 Feb 2024 18:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWd85tV07kuOwngxEoHDV0qR2G6YXMBmCgv63M3LBtxbcU6Tb4QkXxuUglNFeOJy/kh2G3T/zlKp5jz4UQRf9TdpjpFby/LCo7PRRx1KTeOFc5R2wCW/ZKZZVCnBAd2
Received: from [192.168.188.227] (60-242-98-186.static.tpgi.com.au.
 [60.242.98.186]) by smtp.gmail.com with ESMTPSA id
 sl12-20020a17090b2e0c00b0029649f4ceb9sm244090pjb.54.2024.02.06.18.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 18:10:17 -0800 (PST)
Message-ID: <4fee3af5-eeab-42b8-b5e0-1f36235ebc3d@linaro.org>
Date: Wed, 7 Feb 2024 12:10:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] linux-user/aarch64: Extend PR_SET_TAGGED_ADDR_CTRL
 for FEAT_MTE3
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-2-richard.henderson@linaro.org>
 <CAFEAcA8AuQZNbT=7WFXVPDzDywPPp1YZ=Bkow7Dgq2pC9=9X-g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8AuQZNbT=7WFXVPDzDywPPp1YZ=Bkow7Dgq2pC9=9X-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WxfB6puTIHqz

On 2/7/24 00:23, Peter Maydell wrote:
>> +++ b/linux-user/aarch64/target_prctl.h
>> @@ -173,21 +173,22 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
>>       env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
>>
>>       if (cpu_isar_feature(aa64_mte, cpu)) {
>> -        switch (arg2 & PR_MTE_TCF_MASK) {
>> -        case PR_MTE_TCF_NONE:
>> -        case PR_MTE_TCF_SYNC:
>> -        case PR_MTE_TCF_ASYNC:
>> -            break;
>> -        default:
>> -            return -EINVAL;
>> -        }
> 
> We should probably check here and reject unknown bits being
> set in arg2, as set_tagged_addr_ctrl() does; but the old
> code didn't get that right either.

This is done higher up in this function:

     if (arg2 & ~valid_mask) {
         return -TARGET_EINVAL;
     }

The rejection of ASYNC | SYNC here was either a bug in my original implementation, or the 
kernel API changed since the initial implementation in June 2020 (not worth digging to 
find out).


r~

