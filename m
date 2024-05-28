Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp102687ejk;
        Tue, 28 May 2024 10:31:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1i7blwPVqB41nJcpT9H22yoKjHBruodURWLZ+TnnMRs64Jcf9tPPbx3sZ9Jzh3wsP32mGH/FnkDflw1lMO45TYalTG13H
X-Google-Smtp-Source: AGHT+IESFvzgGl7IntPI46wLztUi90hLNUCkD8CJ3tIXOcTs2R5PWoWPCJX0ibXWqQIZsTUknvLj
X-Received: by 2002:a05:6214:5c46:b0:6ad:644b:5b64 with SMTP id 6a1803df08f44-6ad644b5ccbmr116507166d6.7.1716917492352;
        Tue, 28 May 2024 10:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716917492; cv=none;
        d=google.com; s=arc-20160816;
        b=DN/PEsi7T5n5tbgLGM7fki/3oovIfuWzo283uIX91OCAlroYBZ2bI67gwuNB08T+Tz
         Vq5syIVo7P47rnqGn8CvjImJrzfIU/uVr7btAqOnqKGMeDfViKGHmhhugyvp0pQ2A3QC
         aFG8rXUHKOWa1w3DGngfmbhzpgGdYy1O7SASR8D00ZbGUdUgo8e/Os02fTRlUIOyvqoN
         yCmX4hvjb2eXeMIXFl5TICARrbGTR+kSGEU0uYpx144TayZUPRe6zlePP+FUtQjTSnNU
         aprmtH3qCTMt7+Z8regwWS/4upqW9iBQPwEP1BZBAZI8UVHidvQOxHcGrvZlWisOBxg7
         ITkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ddoEk8SCUGeJcFxzW+97wHAXgv6KKxC6gZU+3qXMuSA=;
        fh=I+Ui4EEYxtenCf+G/0qZTXjJxFMcm73esLVCGtBTD6U=;
        b=pHHwgkzZjWqRSyByLwI2GvathNvr0oRZOnK/g4p/hgRJE6EQrHYxuFV3ABCdANk8mu
         huR7iOWtsXDB1BltlZBTaQIC/pvdMI84CEkZ0v0t3niPriMKf//MTOAWIGJt2DYX+PV+
         QDHAHtWJz5GW0D46oGxClVOFBIJwc87bMtNmlBz2ddMXd9p6l2ZFVpO3HveSpkaGxaGc
         giHYDcunogCPGY0LuN0lA56AFJ40cmv/Fakev5xtIJcxRPUDNaXVEswDRHnI8QvOdaPN
         ga7+F/kz3Tc90pOe058tItPtEIiuPGoo0LdrARTvI/Cb2TVUKp1tgHf+3JqO6a5rn2BG
         6aGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9+AKViH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac06f4e7casi112141456d6.22.2024.05.28.10.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 10:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i9+AKViH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC0eu-0004cz-HA; Tue, 28 May 2024 13:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0er-0004be-Fk
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:30:45 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0ep-0003Pj-NK
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:30:45 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-68195b58daeso887656a12.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716917441; x=1717522241; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ddoEk8SCUGeJcFxzW+97wHAXgv6KKxC6gZU+3qXMuSA=;
 b=i9+AKViHTi/a/iS04hB/6+1WyNz59ZVvALfvF/qCxBbHVeMfDs/ebmqLleu5c7gRad
 Mu44gwJsLkwJE+YtGLdFHZGzpE62EJPBk/zVhFf6KmC5ClUp36hwfk8p07W3XLQ52vjN
 CkJ1HtFvNeFSgYVdEQaaKguQGvrUnSyKetNfGeC4c81p846/w6NvzphLKTuGPGOtKBdw
 1MalWz08qPFMF9qG8zzegBX86JhLQ9jNmYFmFT0+ACvxgaif12CwZEDnpyyw67io4NWm
 uW6bPGG8ZZea0FPf3h+RY7oafGiqX7Z8NCVlEyZ88yGJw+lneS5w38h8F3X+OmUhzJq5
 a13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716917441; x=1717522241;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddoEk8SCUGeJcFxzW+97wHAXgv6KKxC6gZU+3qXMuSA=;
 b=U5Pfv15D7WRZB3flfRQaOOpjdI4FxYAbnyhGxXGQgF9fi4QQwsUnI2jYIvvUkA06kX
 2Ei8mn+yY7+Ky1HTHaEFo4VaYHy56KqSTHrSSDRQsXbdFhs4JT5ya3m8GuzbX236Jk3c
 BweXH3FYSwpJyrIfr+OWlrgyrpP4SWEq+epxxUCl1YvvbYAVlWo5yPJyuQyid4cAm0mm
 uc7tf4p1vhnbhOnJd+wGDjjyxC92xHaseqon7Px/DCRdhOLc/w9/OHtUkYdze8Hoae3b
 uf7qvXPLIR46DUhQuGjWllXm5EXWP3o0PVucx1Eyg+wiazKWxJAj+O9ZwDjSkCzGFtVX
 AGVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHX9Cy6P+iml1pwplqdW+/fI+ResGWiswdgnPkYG5sj91Cf4NbIZFC/BnAuBwb1akFLzfNVmF6Mer2h8/TtJz7Ajyd
X-Gm-Message-State: AOJu0YyQ7aNhsdQn2/NCZ8Qms5zf1Hh+YS6+eX5v+zBEKSkvzQdrLNIz
 Au2LBr8/URo8xi+fwWvC2csswMS4JfVkq5U2Y/3J3NgBJVb6krZGy6UArjeUsGg=
X-Received: by 2002:a17:90a:688e:b0:2bf:9ed7:a7a2 with SMTP id
 98e67ed59e1d1-2bf9ed7aab8mr7805931a91.23.1716917441315; 
 Tue, 28 May 2024 10:30:41 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c00f389824sm1765562a91.1.2024.05.28.10.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:30:40 -0700 (PDT)
Message-ID: <0d61e5a8-84ab-4379-b58e-364d929293bc@linaro.org>
Date: Tue, 28 May 2024 10:30:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 44/67] target/arm: Convert SRSHL and URSHL (register)
 to gvec
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-45-richard.henderson@linaro.org>
 <CAFEAcA-4xMXjVZFGbDjefNabHn2MW=4jFaYD79iq5oV4qyXafA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-4xMXjVZFGbDjefNabHn2MW=4jFaYD79iq5oV4qyXafA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: oGBv4a2NjsSs

On 5/28/24 08:51, Peter Maydell wrote:
> On Sat, 25 May 2024 at 00:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper.h             | 10 +++++++++
>>   target/arm/tcg/translate.h      |  4 ++++
>>   target/arm/tcg/neon-dp.decode   | 10 ++-------
>>   target/arm/tcg/gengvec.c        | 22 +++++++++++++++++++
>>   target/arm/tcg/neon_helper.c    | 38 ++++++++++++++++++++++++++++++++-
>>   target/arm/tcg/translate-a64.c  | 17 ++++++---------
>>   target/arm/tcg/translate-neon.c |  6 ++----
>>   7 files changed, 84 insertions(+), 23 deletions(-)
> 
> 
>>   uint32_t HELPER(glue(neon_,name))(CPUARMState *env, uint32_t arg1, uint32_t arg2) \
>>   NEON_VOP_BODY(vtype, n)
>>
>> +#define NEON_GVEC_VOP2(name, vtype) \
>> +void HELPER(name)(void *vd, void *vn, void *vm, uint32_t desc) \
>> +{                                                               \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                      \
>> +    vtype *d = vd, *n = vn, *m = vm;                            \
>> +    for (i = 0; i < opr_sz / sizeof(vtype); i++) {              \
>> +        NEON_FN(d[i], n[i], m[i]);                              \
> 
> Does this need H macros for the bigendian case ? It looks
> like we use it for smaller-than-64-bit element cases.

The same operation happens in each lane, and order of evaluation does not matter.  So, no 
H macros needed.


r~

