Received: by 2002:a05:7023:c086:b0:69:9a19:fb41 with SMTP id ip6csp2731991dlc;
        Tue, 22 Aug 2023 08:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0kqUCTjz85bheWcSsTl7GjPJMjOmsOMsotetDM37YuG6uIM+8ya4nqI7kUZ6f2l8asynL
X-Received: by 2002:a05:620a:1713:b0:76c:ba7a:2657 with SMTP id az19-20020a05620a171300b0076cba7a2657mr12749966qkb.23.1692716626285;
        Tue, 22 Aug 2023 08:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692716626; cv=none;
        d=google.com; s=arc-20160816;
        b=XjuQuJmbAVrXOUd0JPpiyxQoWdI0t5pAw2lNSNfsaGZwkLD6FWM6OWX5RVfF35EvqB
         Pxc5OULVyyWVoL831ZedN+DONkQG/a/U5sh6ZeZ7+lYQpeVtSYiL/tGg0ccx2pS6ASkG
         gtSbySdreM0gnznYPieEzEg2lV0UyJnnpz05UaFXQWvQee4omlk3BE8kLhucdaafWojb
         G6jx6pulqc9mOrxitQ7snBH6wQRzoDGXlPUgVo+RehnXMdT9OOSpouJqzfWY/LtMrDLP
         3SfbhDPFNU94WvQ22f0EUnx6EEpwfifAtNQXN7nboasd5m/71UdVuyD1LRlbTMap2skB
         FJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1c3Q8P0oq0kEBXmp4eoqEIjCy2qbJINRMas9Qi46fYQ=;
        fh=IzkshJUGWO2UnAxhT0rhoUSUmHocHU9nyHGLKQhM9qc=;
        b=ijHX5lQ0LpH3IzzRJi6QlmOVmBxldZQj65ph342NOq/50Xw6hcTJ43MHAaej1eiLzH
         4itG8H9smsDznCaID43hAJ1ySeV7gKT1hrEbYQAC+4RFzp2HKErS+uNPOXMuWMTMJpgN
         LyoeeD0+/44d03Az2IHqSU5StJx0sUzVhteK0Ki1fVnVPycosC/jUXRsm3wWIyk6RdrJ
         p0LggzM2K/mBBoUwj4HXrA8oAm1VtoatovcizOVMPBtiFTMy/7A5i7WlN/3PI7G8p7uB
         JGnIGmULmeMfvvS2TRJmlB7CO89ZeI19F0TKzR/DfS4rYkBlydkOsPkH3x/pu9CtJSW+
         HVzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CUfRN75y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp11-20020a05620a458b00b0076c8d5c1aeesi6427516qkb.551.2023.08.22.08.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 08:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CUfRN75y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYSuY-0003du-R1; Tue, 22 Aug 2023 11:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYSuW-0003dK-P8
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 11:03:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYSuU-0008Ep-Ic
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 11:03:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-26f9521de4cso451575a91.0
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692716589; x=1693321389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1c3Q8P0oq0kEBXmp4eoqEIjCy2qbJINRMas9Qi46fYQ=;
 b=CUfRN75y/on1343CWxAMGlmRy6eC+N6x7wblxRRDzqQQqTNFHWb6nPVbLSDPJwPycB
 m0HHNkl4Y+LGY0kjSsvdDDCLVjj+0VRcf0JLGez3pzXJFgqkH4ywVcqp5SkkJlwCp+yQ
 +kHzjaRz8YYWF2Qevcp9L4zCkoRy0jNIGJtKKG4uYY203mrfEYScGKhV1xIjb4LT2dLU
 9gRk39NuaEdIrdebh1Vs/QBOjS0Nm6s/HL2JWj366lqNSE1Ie31joH0LZHi+HoC2iKqJ
 ULZfqnT183l6Tf+kwVEUoDBGxfFbQlx61PCgcIx3KHiW+d1V/KSvUmJLut+C04TrFMEJ
 yCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692716589; x=1693321389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1c3Q8P0oq0kEBXmp4eoqEIjCy2qbJINRMas9Qi46fYQ=;
 b=CdNM4EWJ+PlANX1tlkrgQWPGB44MKrs1vtw6WqyCaUNiaY0Sax29RfdObYc1VMxDQl
 cYROSt0/Jr9yE8ph7nUYR62irHfd920zZ+YOwLNq4WRFMYFjOiZl+8/wGBIXMpbg78gB
 1ouHDmbyzPXfKJwi/GpCr86Nfp4MXw5REsXGLOz0hWIz+aOM//w/RRhwex02L6soCibM
 HK/gsX7gP1kFDTde7YC9ncG5GMCH8Hhj/c6Q/tl9kS8NC5c6qAl4upt5L4iSCUckNKOm
 Auqih9nI+pCu5ONQUqB1rh1yXbwIPyaw/82JNoqAVzAG2AHmynrIBYXaBIhr+t0zb73e
 uKMA==
X-Gm-Message-State: AOJu0Yw01IvYEY6UKkLqozvoalAOVTAix9KOM2FYuRSCztO8ENpNatjg
 PL/M4Fkl9QBphag6mcFngQ1v0A==
X-Received: by 2002:a17:90b:300d:b0:26d:1eec:1fc4 with SMTP id
 hg13-20020a17090b300d00b0026d1eec1fc4mr6650735pjb.19.1692716588841; 
 Tue, 22 Aug 2023 08:03:08 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:4e3c:f4a4:b92a:b5ab?
 ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a034800b0026f90d7947csm1670836pjf.34.2023.08.22.08.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 08:03:07 -0700 (PDT)
Message-ID: <c4491b26-8056-77fd-4ad1-0e6eaf0b6f4b@linaro.org>
Date: Tue, 22 Aug 2023 08:03:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/6] target/microblaze: Use hswap_i32() in SWAPH opcode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230822110129.41022-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: EKrXK154pH+e

On 8/22/23 04:01, Philippe Mathieu-Daudé wrote:
> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
> introduced the generic hswap_i32(). Use it instead of open-coding
> it as gen_swaph().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/microblaze/translate.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
