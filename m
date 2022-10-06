Received: by 2002:a2e:b168:0:0:0:0:0 with SMTP id a8csp546170ljm;
        Thu, 6 Oct 2022 13:59:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4296kk4efsjEKh+Xdof6kpdwuiB0gXnhAW2hPOeyx7iWAfiWodUfD/WLFZdrfA3uEGppZ6
X-Received: by 2002:a05:622a:111:b0:35d:51e8:9620 with SMTP id u17-20020a05622a011100b0035d51e89620mr1898603qtw.172.1665089948943;
        Thu, 06 Oct 2022 13:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665089948; cv=none;
        d=google.com; s=arc-20160816;
        b=mGEvrmhxIWHnWlGZhNs+Isl9/V9lYgIceaqZyqzrTCAXGg07EkhWBCtaonFlE6ExZn
         qBsF52lheludMKUWG/wUF0thRS2hnUiaFBQ/+NNn5LxT/a7pDPRtlRNY8kuq/4B0tCCy
         rxwayNSu1SOTx7oGYQWdRs6jL0RTwc7SblUzCXxKbxbnXmQzxo89WGua99p6gVkrF3Jg
         Un6a51ZDs1qcaydxeljbpoy0sw2hlm3f7ZPcX5i34CgY5Xn5U4QfFwE2Rt3XX7KbyjQN
         Boejsq9OI/WjHkXrno+8BOpFpYHOiKqtkg9H1mqF3AF9OE5Zx/56V7jHffI+QQfxNPbC
         uIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pq1msKz+wIDW/rYUGOrF9YdCo02fAvSjM7c0uxTtfMw=;
        b=uzTJ/SeQ4IJMLzMe85W3J9cq+tGlY07Ba1JbA+Bz5vPvb2YeS+fxj4NZ8qaIMfnyjp
         sYAk+0t8ngIjnPFZ/Y1n1pJ0CIIf5hrwGyF8OPaISuZ46ynW5x/tYFBQZw9vdHYl38EE
         MoFrIYslM8fcTQoeoOUYw3Vv0rK4zxviita+nfrvdY1koD3XJcMKzKCo7v6eRYnLshPJ
         dS4TcXjntZMhtpJAlQOdGOzFS1CrWf02nM2dfhn6Qa3wnBzYdOby3KZRa9KXdOMP4eUN
         Mqegtvp2Ws5C0SizNevUko3c1S3CC/AZ0DKQ5lcHtAZMJvch+RxHvrHxxyNzWKWNtMM7
         AFjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuzGv2PZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85c0e000000b00394d2967a1fsi462089qti.225.2022.10.06.13.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 13:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuzGv2PZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogXxU-0008RG-Fc
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 16:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogXx5-0008PV-C6
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 16:58:46 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogXx3-0001IK-O4
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 16:58:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id 129so2905033pgc.5
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pq1msKz+wIDW/rYUGOrF9YdCo02fAvSjM7c0uxTtfMw=;
 b=SuzGv2PZWF73WKtucEOyCJ1cogYPsoPfasP3sjjWrKZILvNDMQwwP47rgqmHNMomjZ
 6aCBKMRmcrogRgs5nYxCYLzylwbtANXqCGVq9RZLNrlA4JogwLYPui6HUtPiMgLa+B4F
 NksmSXyzW+9Fh0rN5Ue4QxtSiGCRZeDikpZuJ0zhrATnlSkBVhw3RvUFCu8vgvd/56GQ
 Yukwd16xmgfLGh8ghn2POB4GL4JElZBu2j+qDcHy+z4XxAhVDjFsZ4b/yYFOmvrYFPlf
 xnRu3BqOgOoplUjnXbS7v/T4dfu/Xh7MWjIHupV6GaDpsk6nwVRlb4NyYM1MMQD1GuLg
 tf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pq1msKz+wIDW/rYUGOrF9YdCo02fAvSjM7c0uxTtfMw=;
 b=yQhUthXhb1rHJFCnB25ybrypy+WFSATCZ242229FdysyscQzgKn46SWXBrFtI51m28
 /TvobbH+JX7UI5z0CxRbFB+n80spq5VYf5bsUJTbmU1c5LUImYvOBu2P3EXUHqnpqZ8h
 DiL8iFOOlwg8QF2rekLkprqbZe8DJCQqHLhmYtdFFL3Ek2JRlAb1BMO2z2QIzMrJ0fGh
 mqVxSezD8r13GdbuPhud569pZSNC1LrmVP0UGQDdxpAd7KkVZDu8BnvCKclbz5vwv83q
 pstpRdOD5lf6wQzBLBVZ8/JXvdhzPptzaMKXSJ6HwH5TDMtuf5PdshNdVcqi8Ky/PUMa
 GjiQ==
X-Gm-Message-State: ACrzQf2KYSo8Qdf0yCaY9MI/MiEL8Ekz9kX5wbeGFEstU4ewkXqlM/2q
 J/VlvOAG7ohHwvwkUv045Fwe0g==
X-Received: by 2002:a05:6a00:1592:b0:562:b7a9:5c69 with SMTP id
 u18-20020a056a00159200b00562b7a95c69mr19692pfk.80.1665089919067; 
 Thu, 06 Oct 2022 13:58:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a17090a8b8900b001f8c532b93dsm172157pjn.15.2022.10.06.13.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 13:58:38 -0700 (PDT)
Message-ID: <cbae421e-906a-6d33-8480-a3f103c119b1@linaro.org>
Date: Thu, 6 Oct 2022 13:58:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
 <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
 <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
 <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jt1cs1GLRM87

On 10/6/22 11:55, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 19:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/6/22 08:22, Peter Maydell wrote:
>>> Yeah, cleared-at-start is fine. But here we're also relying on
>>> the stage 2 call to get_phys_addr_lpae() not setting it to 1,
>>> because we pass that the same 'result' pointer, not a fresh one.
>>
>> I clear it first: that patch is already merged:
>>
>>               memset(result, 0, sizeof(*result));
>>               ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
>>                                        is_el0, result, fi);
> 
> Yes, but that doesn't help if this ^^^ get_phys_addr_lpae()
> call sets result->attrs.secure = true.

Ok, sure, let's make the write to .secure be unconditional.
I've split this out into a new patch 2 for clarity.


r~
