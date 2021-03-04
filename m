Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6558091lfg;
        Thu, 4 Mar 2021 12:29:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztdbtF45hH3ML7QxJS0uJp+uuXcGl/VUCF0+fzKOnu1m124B4YzCAkP1L0t5i/SBuq6o1X
X-Received: by 2002:a05:6e02:1a6d:: with SMTP id w13mr5939165ilv.181.1614889790796;
        Thu, 04 Mar 2021 12:29:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889790; cv=none;
        d=google.com; s=arc-20160816;
        b=kVNGWSYoehUqp3bRR/lK5bueMzxawJ2eS7zjazizpE13SfV4AvcwpfqO2vfI275gGm
         tswmDMjBWrPuhNNqxcPbgeLiCcc0IjKCUVTNZPPmARF8vi53dZfvnshlkaQ0jrfQzTop
         gyurPOglZzFYrbGLmjkZeC5yB0nNlzpSoWu9lpLGGaFWF+zdCQRmSJw7IvbcOlSp5Yem
         izEZlysj2o1CIyGCWYZFioxIDwqlulOoVVs/wh/BhCuaYXcf4Eyer/KrKxJCbiA/LdSo
         9oJYk3Mmrb/91vKIfFZm4hFFCNgEbfRgzxHHvmjxsQEQeyhtrGA9Hp0X+R+HHkL1qmDj
         veLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/CGlW3pc52JpVh9HgbXYO3RXSjgVXwb7vrL5K0RPuwM=;
        b=ukks9pAVNJVM6EIjyyv8rc2rQpeg6BtIvWPRnk4kpd2yTLyEww0W0IlrjTGJysmR2M
         Uy2MxZkK0JWH0uXmd05bZA5ymxSRrqG6c/R6XpMlP0bUQEKKTLfBh1aKnuv3mgRL51rW
         SHNd0iywnnq8HDW68xPNF/rIlc+p7WiVxgzEKmdr7eaQCCviIBE2m5+ymmchmZK52zkv
         zsLeD3fIkU3y5jTKKhkjMeXenknTBDG2DsFcLE96x1IUvHubX9X6ZZ+xprWtPsNecN0G
         RS2nnKTRt8limoD7cG/xWgEEjN1X8Ow5F6/UOgqXsFf1iou5OXRwUlRZU2VIs9uagHOH
         qxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=co5fpDih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si321345jat.110.2021.03.04.12.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:29:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=co5fpDih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHubW-0004c2-2i
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuWo-0000Fk-AI
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:24:58 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuWm-0000PN-Nk
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:24:58 -0500
Received: by mail-pl1-x630.google.com with SMTP id s16so16811383plr.9
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/CGlW3pc52JpVh9HgbXYO3RXSjgVXwb7vrL5K0RPuwM=;
 b=co5fpDihOgLbTy7CFh6/QDjkUEyLmU6K3m+mYxwlBEqVQVnriuviCTv7BiMKlMZJmP
 YSgYz/Abt2vLW73om8AQlTnyZMsetlZkP+Zj8S3bhwPw5lsKyashNErlVstCkuhObj3s
 pR55X8yv9bOcDUpRtqsWIlQQHbQH3WqpOIgbY4qY54aHAqaOrmqv4ht3iN88FefRIzL/
 JOH9bEMBmFBFQXvR9bXahCZgV+k7rPJQoxA5M0cI8iBzz/191fsDE0iFgGj9YF5m8MJx
 yCxs8BJsYHbXH2b/5LU49WcWV+cNrzK9Az4/kZPrnqhkWABn88XZGbk19ASYR+MiIyzZ
 d0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/CGlW3pc52JpVh9HgbXYO3RXSjgVXwb7vrL5K0RPuwM=;
 b=XB8TDnrZkB/PD3pTa49+zfEhUbc/LuV7ELBjQJzpDqPLa+PKoyWT4VAvTb4hTs/D7O
 j6O8B29LIFPTD6Kne/FDBWjdHFWhtsVdQLsJG1rBG+oEVNl3j3FgRsXUrBwX2j2yYLGd
 s+j5jJ/8Z5AjvxG5Ze350JgXozPCG79FLCxpL5nKia89c+J4gmI3w3KyBKDlst3vZ1b3
 Qsel9JshgmkFUCF2ikHG+2KAGGKwXE1FD/TLjWaujLA/WYOLP/IFj2j9g3RNDIxMqZTJ
 fPelQnoIT27BQmnYjJ13wlX2YA/Bplmmi2cVUp9zOFAkdOGTiowcul0IEpDh6OJppzW3
 sXBg==
X-Gm-Message-State: AOAM531RFxJ8zbo4id9AcKBg5v8nQOTsTR0CiYfPUYtCUdbSiFgSHC8P
 i74mOivKbT/v7zXcPkZFKZApxg==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id
 z9-20020a1709030189b02900e5d7c3a264mr5521832plg.6.1614889495180; 
 Thu, 04 Mar 2021 12:24:55 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y19sm265720pfo.0.2021.03.04.12.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:24:54 -0800 (PST)
Subject: Re: [PATCH 29/44] hw/arm/armsse: Move PPUs into data-driven framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b4b07146-eeb8-dfd7-ed09-9bb1b18bf60e@linaro.org>
Date: Thu, 4 Mar 2021 12:24:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ygpjg38eRvsI

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Move the PPUs into the data-driven device placement framework.
> We don't implement them, so they are just TYPE_UNIMPLEMENTED stubs.
> 
> Because the SSE-200 and the IotKit diverge here (the IoTKit does
> not have the PPUs) we need to separate out the ARMSSEDeviceInfo
> for the two variants, and only add the PPUs to the SSE-200.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
