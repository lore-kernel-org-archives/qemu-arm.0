Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp114825ejb;
        Tue, 21 May 2024 12:59:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2degcFPOZta+ZP0SgZCucPooJ/esh4Pu+KvLG1HRNmBUeAw1HqurDxcnM9vLesTz2O1uenGTj1+sPgQQ0fHoacVWC1svq
X-Google-Smtp-Source: AGHT+IHLPFE0GNJoK2fSJhNxsWRBrO3uLMpmGQ19SH4UQCqQBlC6UCCzjJ8lY1lNhvPlka2LyCPh
X-Received: by 2002:a05:622a:24e:b0:43c:5d37:5a97 with SMTP id d75a77b69052e-43f9e0e09cdmr569261cf.31.1716321563930;
        Tue, 21 May 2024 12:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716321563; cv=none;
        d=google.com; s=arc-20160816;
        b=CRPOpwcrtlzlXWx+RKHZE1PVQ+pxqY45EdfN0BtfGDIbkAYVsEDN0eUNGdgV+oDDkX
         0Ix+lx4K1NY73BamxDkN+Sv/KNZjfzTqbfMD3xnkMQNvzj1Dv5kEP0dW0NT9jc4/7KPO
         fqM0myDi5YzO4Uue9wfKCXTSh7xd0ImvsytiGZYUBLmokc/cjQASOVtkVR0K5O8pCv72
         WqGytukXUraEU40L4oc1akz3CEUowJze6XIjtles6HsiY/cUX+1MxEYtoPGE0hvBkx6d
         ISBp+eOoGXQ7P5cgh5tntoZXfsMa8Db940YTC0EahrJHkwIJtgmA/mTjALOJukspB7Jx
         qU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=85DgAYPxX99iUlxvF+yptWqt/GizS9t9ebZT9g6XIDM=;
        fh=KuKyock6n+nbE8PqPzl144FLN1epwIhGzO4H4EJAZQ4=;
        b=O5seQqa01PfEWoG/wdcJYJ+WoQ2rtSi5CRqVlTyh0HDS3ma+QzRn31oRDTFNwwUkwB
         LRB8me4iTDa+oWeIg9nAOAgHe+R61EqMh1CAMhHr5JUgj5sE5+A/GBE0jKXfkkytoCQu
         6yQQjK0CtKutTLt28ncJ3Nn5X2xweFEPa8NsiLog6kKe0vjiXlkcmRRghVY/PwUAudgF
         COoVxHlIPGw1nI8TdmDD85/tFlT/m5rY6YoQG/tNuVVT/mgff9+YTnKKG4UF44OtNMTz
         EdeY9vvD+nCnjL2E956PpOWoFVjcp29kSQnKKT0HWBlQBZE7wWKjX3X6Ysf9iYrmgItx
         /WGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9X9Hywp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e0184dd4bsi262714511cf.446.2024.05.21.12.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 12:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9X9Hywp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9VdT-0002vN-N1; Tue, 21 May 2024 15:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9VdM-0002p3-Vd
 for qemu-arm@nongnu.org; Tue, 21 May 2024 15:58:53 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s9VdH-0003YW-V8
 for qemu-arm@nongnu.org; Tue, 21 May 2024 15:58:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5d3907ff128so678969a12.3
 for <qemu-arm@nongnu.org>; Tue, 21 May 2024 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716321526; x=1716926326; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=85DgAYPxX99iUlxvF+yptWqt/GizS9t9ebZT9g6XIDM=;
 b=D9X9HywpEzWDXSloJ/WHIh+ih4KnFiVBEP0H/kR1SBjjhSNWQEVSfjxeRPyDPf30vf
 tsX8xc1huQIPfKQY9uYn/YQhm3sVC/LxBVnvWSc7Xp9GKGd8mjGC4EDIzeAAWxaNsznY
 TjBbOkR31dqYgdiGb5ZnNAvkYfC5rRSkfulDIUEyFq56vi7UIbQrKP/VaBL+08/M5GgR
 MnbtOPhqpIZrszMr9BueEALCUY5Q9TKLP+AybQUn4TZEqPG/+WxciAE855vHKhgV0gGs
 e7VxYn/wJY4cmrYlOnx5OO0LxHqK8DCnSAnmfxqzlrwcM1OmFhua7Y8FaTs7VxRSX4kH
 rduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716321526; x=1716926326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=85DgAYPxX99iUlxvF+yptWqt/GizS9t9ebZT9g6XIDM=;
 b=mwmJEpCN3GiAfu1u+YM06sxs/V766GskpGmBAsKXt1MpeEeHOoSSpJigNlBAFscGKr
 GvIK1bnm1JeIea3zobwhP+W0D5lgRp1rJBC/V4XzlKAFgpjN9v67o+/5w+n9R1keKAuf
 JrHNzxy8uGCobxFPo2Mr9OTcp2RovRLULZlhzfoETtVv0zp07G/Y06NHKiEf5YXHVBJx
 eq1UFJgHupDe5pCrp4RUyiF2d/R0zX+g4F0BXBhS7NK3hGA1uhmbxwR2/aH+/NREWNYh
 r1Nl7t7v5J7hSOTFdbp1AemvaqVk352Gp/1xZPsv67I2QNl/UpRmENqkL5vejGkDEiSs
 niBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2XZ3kAD+OJ0E7uzkRD0hsDcDCwrm0C2QU7uZl9mh1DEq2es/xIb4pFHTthdsbXBPLBh3JxJ7yQ9J+0Kp3kW+IolR6
X-Gm-Message-State: AOJu0YxL6BAPT/OWKcJ4ExUthIjBvjcTZf6fcnT0OiVahPWJYS1sa9cT
 ZvIpUKPw8ZKb6SlC1Gs2mhbheP2VjJyuyTFq42F+qp++sPSoMZQgUrHbuRb/PwM=
X-Received: by 2002:a17:90a:53a3:b0:2bd:7fc1:c91 with SMTP id
 98e67ed59e1d1-2bd9f5a1718mr151108a91.38.1716321526016; 
 Tue, 21 May 2024 12:58:46 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2bd78b2125fsm5034421a91.23.2024.05.21.12.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 12:58:45 -0700 (PDT)
Message-ID: <06765e15-9545-4765-84fe-ddf2a77d0454@linaro.org>
Date: Tue, 21 May 2024 12:58:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 57/57] target/arm: Convert SQDMULH, SQRDMULH to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-58-richard.henderson@linaro.org>
 <CAFEAcA8YQURkn5-SjVFmR16xcv6m2WRmnJpkeg9PVZ+eFGW8fg@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8YQURkn5-SjVFmR16xcv6m2WRmnJpkeg9PVZ+eFGW8fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2mIcK4sE2OG5

On 5/21/24 09:16, Peter Maydell wrote:
>> +void HELPER(neon_sqrdmulh_idx_s)(void *vd, void *vn, void *vm,
>> +                                 void *vq, uint32_t desc)
>> +{
>> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
>> +    int idx = simd_data(desc);
>> +    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
>> +
>> +    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
>> +        int16_t mm = m[i];
> 
> Wrong type -- this is the 's' version so should be int32_t,
> I think.

Oops, yes.


r~
