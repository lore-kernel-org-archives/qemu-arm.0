Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2020450lfy;
        Thu, 6 Aug 2020 14:08:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhuabwFr2Ke5c7DBOZZTbCHPHUqH6YjU/vFHQW7ECs+BprcRxiHrr99FeFIfZ4j8ZbOGko
X-Received: by 2002:a25:59c5:: with SMTP id n188mr15813439ybb.489.1596748123435;
        Thu, 06 Aug 2020 14:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596748123; cv=none;
        d=google.com; s=arc-20160816;
        b=iLhIja07LVniRdPw4y6TnyUCoOzJL1Aewep2f9N9RzkyMAVKWrOxN0cil7ee2zBpLw
         vSypA7Q6987LZjPtBmgMe+4bhXNXash9RY9waNQxq8Surz2ltfgJfKmNC3KGdJQXc8dQ
         1MYYIkV6mdRy2I6pK/thIDhZNBgFk9cMnFc3pfsgINKqv6N4G+bp1IbsKtpputTLM6of
         6XmjQdo2CS7XdqEojYA2CFgH2JWLPng43++OVyL6wVezteNHJg1SCHQ31PUtld64fOBK
         1bPhBPeIT2yVIkjdL+WZyMJYvLtNhlxsTWxzZDux2s+sWukb5ZW4l5NpmM2UlXIEa7va
         hDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NQqHrEQAf0O1U1Tu9OxX2PHBqUeD13E4LA1zBf4f3+w=;
        b=i3xcwvbEciSBh3M8xAflsuKYlzCgazwvDTOi6FGyI42nKE1AkOwBjdoaouQbJkbOW7
         XbFTQpalrLioVuUEJz+chgfze8//vjO+avWW4d+mzAaPTC5gfnEcqqi57/yoaa6B+sVa
         SbaXTXfkoxhPla4n80eT2MR1jCJYohY6aQZGivVPwulFGE+3nI6NCPd7J335M9R4wmch
         jxg7w9OcfhanetiWB6grsQRMNB/Qt98AWqUHBtxfV5ID0iM/cl5HUT2vNVMTP8FyNvL3
         YqJ3xW5HMGT5IIXRD7wkaAkC5PzRkcF4HqHqwpaWYz6D1xK8+f7HMPdao0bWrZjYJFUA
         K8fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/L8gJXe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o186si5594821ybo.358.2020.08.06.14.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 14:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/L8gJXe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3n7y-0005Lz-S3
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 17:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3n7r-0005Ln-Le
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 17:08:35 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3n7q-0004Hh-3g
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 17:08:35 -0400
Received: by mail-pl1-x643.google.com with SMTP id q17so9993pls.9
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2020 14:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NQqHrEQAf0O1U1Tu9OxX2PHBqUeD13E4LA1zBf4f3+w=;
 b=T/L8gJXeUqHRiryEWxm5EFvd+vBJUPaF+DLEkzMcuB+x9fxvjaCsaCf8ULRDnggfC3
 F5OzMgh+DTnvla6/xmF2wxuwo3MLl7w7wQRau7wCY5RHnYoz8G7mEIS2gu040T/rTyO7
 Ar86pWEl7ctLRxB27bE+fcfM7JNhUZHst007iUBopVDpP2Y1suCtj6UH+6O14/O6iZbp
 uLMneAtOh0opak8I9OW6qvWK2pIgpC7og2uV1xxfG20HVJGA6hN7mUz1Ingf8FlfAiFi
 okjN6SSMzxBstm9ool3EZORj2+cM3f1oL0AufY7cGK/llRTuQq/YhgPwMrdnMK7BCIiG
 Aykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NQqHrEQAf0O1U1Tu9OxX2PHBqUeD13E4LA1zBf4f3+w=;
 b=U2s1g7dhcFoymcI2s2Vx9+P0iwkCyjNdq3CIvlfP6UFXTTNcBkPWspXCyo2HlKdn6W
 XWvs1s0zR4dWmOmGa3mIyGOGX7fY85Ve8FXQMQ9PyOaBgnveadwWkgl1fVFylahQjsia
 KDrQItIaw+9NGqpUTa4nlaaUlfXE2ZziZl/fI9nvJVcXfoBAVeJ6G8hiRgKrshcMSS58
 ZIwa5jKJsJCQdGQ8+18IxHlqjOBlc4WNoqAvQt7qsCPWL5Xm5daCEp1+0uGajSCLM72k
 7Ms9Xmv+lt2v834WJDoE0/KK+hmUdDvDe+imMTo+56GKuBXlj6pVKhFaBneqWNsnaVed
 8ZxQ==
X-Gm-Message-State: AOAM530UuiqHFIaCqIhdC519AtMKdB3YdGak8x2SyZW2XVcWtTECLhk1
 u6AC1yhagE/ULmvxjoRavdTz4A==
X-Received: by 2002:a17:902:7d8b:: with SMTP id
 a11mr8894886plm.342.1596748111596; 
 Thu, 06 Aug 2020 14:08:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x20sm8277193pgh.93.2020.08.06.14.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 14:08:30 -0700 (PDT)
Subject: Re: [PATCH 0/4] Refactor get_fpstatus_ptr() ready for AArch32 fp16
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200806104453.30393-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <130e85bb-2dfc-b983-bbd0-7f674e169c53@linaro.org>
Date: Thu, 6 Aug 2020 14:08:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104453.30393-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fcGqDjQBDues

On 8/6/20 3:44 AM, Peter Maydell wrote:
> Peter Maydell (4):
>   target/arm: Replace A64 get_fpstatus_ptr() with generic fpstatus_ptr()
>   target/arm: Make A32/T32 use new fpstatus_ptr() API
>   target/arm: Implement FPST_STD_F16 fpstatus
>   target/arm: Use correct FPST for VCMLA, VCADD on fp16

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
