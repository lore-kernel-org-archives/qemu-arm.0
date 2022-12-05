Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3775243ejx;
        Mon, 5 Dec 2022 11:07:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4NJiIHkbZyQQmyDswYKKTViRh04CU0PKcFsCcEv3ObZJ9raW9u1GGSPBZHIJUiZUcDOhog
X-Received: by 2002:a05:620a:488a:b0:6f1:187c:8f79 with SMTP id ea10-20020a05620a488a00b006f1187c8f79mr72877425qkb.593.1670267228116;
        Mon, 05 Dec 2022 11:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670267228; cv=none;
        d=google.com; s=arc-20160816;
        b=FIGX6cp88se4AlmaPoqm2xCdryzbAKaEP+JgZPCHa4QTKAxpmEElrPVw/2qTbOZyo3
         nYb2hEF+/G879lj1XJq+uMCaIcdQuo7WpqYwGbiuN/GvL3hZzCdL6pvrwGTd/2czFnU6
         76D2NqG/rD6T0UeGFi02rxGy//bdT5pnxbV7h89tLhWBttJPhbAnmrMo1yi0mpTRZMaR
         lPScGhF8aXYYVMuxHPid+0L9BekVCEIgRyzCSZNLYAAZ/NYotnFLkLDtGt9QQ66jHR+a
         5Civ2BbDXVXWffQt+7mSfl3gkJEpzRYv1AZrAOYTglQcz3J3efXocurNoWcDR6jN5MvE
         mJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IX04X/vkhL9e03NKsKGqVInIVWlBjDXUTOzJzVxAPtE=;
        b=qrcP2ZCPAQYB1TBU+CeaA+bve1D/cvKpe1t8Nkj7FCzHGWnY+d7vEvTtzgCLSHuYTt
         JUEqDkJe5VR40tm9OcImTlfsHGsgruOSbafbBbwP1SPAlvDuT924dmGJWV9WUQRN30V2
         rMxZUIoOH2WlknwIR351GbiLcP+J4rFDjVg10HicrEEhaJN4qy+oRSzVeA8u5RZxcp67
         UwHXzOLcK7Kx/47QVSNUbghdJA8jwEoBkMzON0pSXz2QRmembKrW+kFE6+2rsEDN4hnK
         QU3H4wL0nytYJI3Pi/SZXbl6R6If+g62N0mFFv0ZloUB1NRMCfhL8ocm7Few/5yaNK2H
         TK3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jau/Tgzt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b003a7e4a908d3si1935763qtx.279.2022.12.05.11.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Dec 2022 11:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jau/Tgzt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2Gn6-0003fm-Ky; Mon, 05 Dec 2022 14:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2Gn5-0003fe-UR
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 14:06:11 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2Gn4-0004yp-6f
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 14:06:11 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 cn2-20020a056830658200b0066c74617e3dso7866159otb.2
 for <qemu-arm@nongnu.org>; Mon, 05 Dec 2022 11:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IX04X/vkhL9e03NKsKGqVInIVWlBjDXUTOzJzVxAPtE=;
 b=jau/TgztnUr7iXxQpWEz6gm8Pz/OuS8CJerdzlMRaxva7X4OCmXFvkfglCTyZctxCY
 PfWDQETWkFl5Vr9gzmGrX8OQNCUKAsicKUL3iU3fRIOYyN2FKn14HpOdd5VfWzBuj14z
 VHrk7WIqLxlFTEWs+31hLsrqWhKAIJgHFCb8vSinXHbFWdBsXeNSYtDqr6LAgtQXgQkv
 3dAz0hEwoi79RJwm6ayKvbyUrlbseHQAZL6kTbrg+uly75kimAMZxxQwFWki/Ma+C8dP
 rOKNJ4GM3mBV5PRCVyl8Ck6yss/4KGaLJcFT2P7KVqv405aJhUecSDPgRIRujhzBnScP
 KFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IX04X/vkhL9e03NKsKGqVInIVWlBjDXUTOzJzVxAPtE=;
 b=rwzEMDmK6C7MmDtSmSabXAcKBVG+iIuUle/qQYe/NtKQIv4z6myh6QGAVLOSW7sEs3
 54bYhxej+craouvwlKVAkwDMgRLRo0m4LWCLrt4brp84UmE4xgnc3JbsUEdao7LxZhpY
 cdCrm3ah7+mxLeYiu2ETca3PPq8NvCH8aQhyzT0TKZspzplRC00sMeuuA6a5TM3zVZIG
 JpDPxoYxha4OzryFNlZs/kXrYlPTN6RenU2lw11U0QbudznRMOgppY3iQCl55w5uTLAT
 TghtywfmT3zxRusb04gtHx4uea65JnYROMl0T7tcMpqY1MFpfWYOzqVb+SfzZro/8b7G
 nQxg==
X-Gm-Message-State: ANoB5pmRP+hddwgVHU5pAAa/0BO7TKxL4A9NzJye3/vQrqTqBcfpEkY2
 t0yrMnhAWZwe3MX459VDOmz+zQ==
X-Received: by 2002:a05:6830:18f1:b0:66b:99a2:feb9 with SMTP id
 d17-20020a05683018f100b0066b99a2feb9mr42109563otf.359.1670267168792; 
 Mon, 05 Dec 2022 11:06:08 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:1a20:95f1:5a63:705b?
 ([2806:102e:18:70b5:1a20:95f1:5a63:705b])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a4ac613000000b00480fd5b0d6bsm6998874ooq.22.2022.12.05.11.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 11:06:08 -0800 (PST)
Message-ID: <1c340eab-1a27-aec9-c9c0-62346550415c@linaro.org>
Date: Mon, 5 Dec 2022 13:06:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 14/14] target/arm: Use the max page size in a 2-stage
 ptw
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-15-richard.henderson@linaro.org>
 <CAFEAcA_5P+HgDjNJE6XZ7hN0TcOPOJfxzMANN9HQ8+b7R+34bw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_5P+HgDjNJE6XZ7hN0TcOPOJfxzMANN9HQ8+b7R+34bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zsapKxFTSnqT

On 12/5/22 10:50, Peter Maydell wrote:
>> @@ -2639,6 +2640,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>>           return ret;
>>       }
>>
>> +    /*
>> +     * Use the maximum of the S1 & S2 page size, so that invalidation
>> +     * of pages > TARGET_PAGE_SIZE works correctly.
>> +     */
>> +    if (result->f.lg_page_size < s1_lgpgsz) {
>> +        result->f.lg_page_size = s1_lgpgsz;
>> +    }
>> +
>>       /* Combine the S1 and S2 cache attributes. */
>>       hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>>       if (hcr & HCR_DC) {
> 
> Firstly, what if the lg_page_size is < TARGET_PAGE_SIZE ?
> I think this can't happen for VMSA, but for PMSA it will
> when the region (in either S1 or S2) is less than the page size
> (in which case lg_page_size is 0). Presumably in this case we
> want to set the result's lg_page_size to also be 0 to
> preserve the "don't put this in the TLB" effect.

Hmm, I hadn't considered that -- probably because I assumed a-profile.  You're right that 
we should preserve the "don't cache the result" behaviour.


> Secondly, how does this work for VMSA? Suppose that stage 1
> is using 4K pages and stage 2 is using 64K pages. We will then
> claim here that the result lg_page_size is 64K, but the
> attributes and mapping in the result are only valid for
> the 4K page that we looked up in stage 1 -- the surrounding
> 4K pages could have entirely different permissions/mapping.

This only works because the middle-end only registers one page, at TARGET_PAGE_SIZE.

But we need to record this as a large page, so that a flush of the (64k) stage2 page 
address affects all of the (4k) stage1 page entries that it covers.

Perhaps it would be less confusing in N target/ implementations if we have two 
lg_page_size structure members, and handle the unioning in the middle-end?  Soliciting 
suggestions for what to name such a beast (considering RME adds a stage3 lookup, and 
associated page/granule sizes), and how to signal that it is or isn't used (presumably 0, 
meaning that stageN+1 can't have a "don't record" setting).


r~

