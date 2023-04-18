Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2613933ejm;
        Tue, 18 Apr 2023 08:50:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZrfmVIx5hjHySkKkjDujY/2v949Fg+vkSUnGGWXsCD5IeBIoaKQjP8BIRGQR16kaJdrADM
X-Received: by 2002:a05:6214:2583:b0:5ef:44f0:cabe with SMTP id fq3-20020a056214258300b005ef44f0cabemr24206926qvb.12.1681833045884;
        Tue, 18 Apr 2023 08:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681833045; cv=none;
        d=google.com; s=arc-20160816;
        b=yQz1N5BXy+qPBZybl9gQ5I/l3etUmYjHX8pwmTYQs6ywzVf+QA5ywb10NZatxqRDY0
         Rzv1CQcz6RbOH23EHQDQiCPLXz1SH0OUXEM/xdtHxC7UHLCqCLOssB78fzyKqcubg6IK
         gz4UUfo3d90VcEwFWyFgamKSGRGsf1chKPDZEnGPDKfP6MM4IDQd2PmSBRnRoXkGwZ9/
         iZwNBCswnNUkgju4n8N8WPiXl+6X+RGMMBNTn8t3XtqhJp6ELMuGi/C0rIasexxTE5ZB
         dM01tXgqSdtTRHdq1RoWfANtcijUE1jT7EgSCG106HeTT3pde6YuJ+dms30bcrzR1llo
         carw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8C3vLM04Twc5WXaQKRwbB5ilTeiUPhYRpvTnl8gjkb0=;
        b=vLm4jsf8kUlM66BEneymZKrnft3DRV5QXrxbKJWxONWhdEQZyvooUXw0Rc63gOhAvM
         n0iWXpTQQOVKAmxxCuW458R1IXEXwb/zueAIOz9+uVYXpB6vA7N9zWpLo/q8e76pmCfU
         StlPAr2WnucY6rWEmRVdZQtx/bsxdcRNDYhU5Z8B6qysiOBQOEpoUNWHz4pGy7SXyAmJ
         owh7Dz2lNAam8lko5Urxb8PPNrmSzFEKt2SHcfDY9UbnLIGvP8nGuJ8frI4JkvEMnGhB
         IzkMkmFTZSI1we0BqprnQq+nrrVBjPzI8iYR437/iEChMHDjxJjnXn/PInfavKsMDH+D
         G1DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5iQQDnv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a0562140c2800b005ef8c406729si1620294qvd.610.2023.04.18.08.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 08:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5iQQDnv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ponb9-0002NA-Nz; Tue, 18 Apr 2023 11:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ponb8-0002MW-9x
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 11:50:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ponb6-0003Nt-RM
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 11:50:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id q5so15755100wmo.4
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681833023; x=1684425023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8C3vLM04Twc5WXaQKRwbB5ilTeiUPhYRpvTnl8gjkb0=;
 b=m5iQQDnvaLVs59uYTlSwCFXs8rNpQSjtOcbHkqir3T7arLQ2JacGejC1qnPkTspn4k
 0R2jVnTJD4I6p7T2ok0zutCRsAla2aETZ9m6txeGPQuqID1FaVE5iQ65e6OwHxDgZb3P
 2TXFZ+A+RGyS7SaiY820hndbDbbNXzU1CnrTWX+lv/9pvAHJTeskDMCqmsZLBst1xanw
 4iK9LERgEQJZacS1jSpYyHvKs80pg2T3ZnH/Pft0MOR8OTlYmNqGLuy7ercc0Bt9c7+7
 LvYKFmDiSGEwJ4G/fvpY92PsHrq/1l5oL2Dl/99Ac3VMaapdqgW75/mqZ4587V+whhRu
 nMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681833023; x=1684425023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8C3vLM04Twc5WXaQKRwbB5ilTeiUPhYRpvTnl8gjkb0=;
 b=dXVR7hAN4Y9j9WnPWyrNXVdfsmgXOisH/9KQynHEsCPWn+xDRo3/lOQbAFuFixak3n
 r23Q7WIDbWHI/UgIJFqWrEFCEPq7CG8MRk0XEEbLPKAyzOuDpY+fYpj/rbHZblRwV9v0
 qs2pyIISWp79UHQxWsOlwFQiiJUVD3nRXuk7vpq+oScmpBPYMUrZdxC0dStIzDaNp1j/
 y2QZwLNe9kEjfWY6183YjNOaKoAbuhuxSVPTr40RE9s6bnMHNNQQDxLfIs67swMyneAs
 orQYVJBrIwGK9AKnji6+jZW7nXWeH4SAjl7B1h9qPcGuQg/9ettdA4lnGvy1gdbqqws7
 HPZg==
X-Gm-Message-State: AAQBX9dFcPIMUp5dwSRM5Ry7lOWL6IIciINrk+FEl+rFLRTPv/ARJB93
 fAZX2Dw3Q3fit43dxzXq0yayVA==
X-Received: by 2002:a7b:cb07:0:b0:3ed:514d:e07f with SMTP id
 u7-20020a7bcb07000000b003ed514de07fmr15069747wmj.3.1681833022825; 
 Tue, 18 Apr 2023 08:50:22 -0700 (PDT)
Received: from [192.168.58.227] (103.red-83-56-31.staticip.rima-tde.net.
 [83.56.31.103]) by smtp.gmail.com with ESMTPSA id
 d16-20020a5d6dd0000000b002d6f285c0a2sm13411965wrz.42.2023.04.18.08.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 08:50:22 -0700 (PDT)
Message-ID: <84d01381-45b6-c237-4973-cfa898398305@linaro.org>
Date: Tue, 18 Apr 2023 17:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] target/arm: Set ptw->out_secure correctly for stage 2
 translations
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-3-peter.maydell@linaro.org>
 <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
 <CAFEAcA8EOrEs=ivv+skKy+e40BiiD9qDP-KFakfgk1E=y89NVA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8EOrEs=ivv+skKy+e40BiiD9qDP-KFakfgk1E=y89NVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
X-TUID: kyXQEssIOGCS

On 4/18/23 13:30, Peter Maydell wrote:
> On Tue, 18 Apr 2023 at 12:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/14/23 18:04, Peter Maydell wrote:
>>> +        /* Check if page table walk is to secure or non-secure PA space. */
>>> +        ptw->out_secure = (is_secure
>>> +                           && !(pte_secure
>>> +                                ? env->cp15.vstcr_el2 & VSTCR_SW
>>> +                                : env->cp15.vtcr_el2 & VTCR_NSW));
>>> +    } else {
>>> +        /* Regime is physical */
>>> +        ptw->out_secure = pte_secure;
>>
>> Is that last comment really correct?  I think it could still be stage1 of 2.
> 
> I borrowed the comment from earlier in the function, in the ptw->in_debug
> branch of the code, which has the same
> 
>     if (regime_is_stage2(s2_mmu_idx)) {
>        ...stuff...
>     } else {
>        /* Regime is physical */
>     }
> 
> structure as this one does after this patch. If s2_mmu_idx isn't
> a stage 2 index and it's not one of the Phys indexes, what is it ?

Oh, right.  Nevermind.

r~

