Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5248886ejc;
        Mon, 6 Mar 2023 15:49:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8oHqEirFb6215Ms+364qrNrjDsFNEsgnSp/j5/eBMDEAYFDK+ecjOqL2nXrHCrp1ecIEnv
X-Received: by 2002:a05:6214:d6c:b0:56e:b5a0:29eb with SMTP id 12-20020a0562140d6c00b0056eb5a029ebmr22294027qvs.40.1678146579398;
        Mon, 06 Mar 2023 15:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678146579; cv=none;
        d=google.com; s=arc-20160816;
        b=zhFXRR33GfF0/HH9Wwzlb7xW+JM/jyuTwVGlxRbmx9i48DjZN5aCfAFeMJ1OqJuVB9
         Szxc/NYJPs152QMT8e9ZMiH0h+m2+2lUg9aFm49P5T23EWlKqhQGoiP4b1jeZd7Y7UN+
         6OvSLHkK2yk8z7XkXR1xDSULnHXnkCRUHlt7LDFCTvVyP8CEmvk6eH/gseuHoeAW1LHo
         ClicbABwJtzfU7fXuBhWXhEGNSHEQp2QHNhoKfOEwSo7JqGlq9hPzq0saKe1fJZxPPaH
         +3zg6joFrFShu0XgY7Q8rQkoyb3sZmHpFBI8IvHGMIgIBwZDIZ3mS3M7YMjtP/l5CiS8
         WUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bThY2eI5Ds5muPeAlltRAb1kZcFCFT3Ulo1RmRXTQWE=;
        b=k6K/yUNGaDw/Hob37BGjUm03WPUAHce29O276ZfS8E/kaAMzG5P50QfKqMQaCECiIt
         210wB/G+IKjNCxWBXfSiCFUKVTz8zW3x+B2GRij/qkiVrCRvEX+K6G+q6SRpF+cM62lA
         pSYf04iit9Fd2/s7bapUmfa+jA6SlWq/zwZBtqG+NtGvhFdruEfC6XUPGXjCG6SoJUm+
         BR/ODIXKPj7XZ7/bKpTFzT8LnYAN/IGJd+sxUP+EZwhM1FKYSy4yLpr73fbPgCXU5qNY
         wGJYjgtzOjkgE3xSQMe9ny1swZydsaU7zVb7QWwHPZKRWX0WYoIGbAXxuzJ/57sVkCYm
         u92g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bn3ZY8ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a0c8dcd000000b0056eb2269008si7779900qvb.498.2023.03.06.15.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 15:49:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bn3ZY8ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZKaC-0008W7-U4; Mon, 06 Mar 2023 18:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKaA-0008Uq-Vn
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 18:49:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKa8-0008Qw-00
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 18:49:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so9387551wms.2
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 15:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678146566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bThY2eI5Ds5muPeAlltRAb1kZcFCFT3Ulo1RmRXTQWE=;
 b=bn3ZY8abyq0sk5r4wQEr+W1aa3KEgSS/GTvBKzl0txVHtI/1V1tBm+RSQdnDVBdYNR
 sRB6cj7E2HYk4iJ3B5eyt/18ryMK/FbCiDsDZh9LIG5Cz3tE9b/4NZ8VeZCt5RQK5X22
 7vMKV7b4GBE8ByNk7YAuOyJrX/5FOUIplJUawty4gc4hmiIg3a9+rospsteWLOR+3Vee
 zjaapfP2Pq3Y+3yGSFqYjihNl9C9vbOnD/xnJOJR90YzOAB3if6REgA/M3fCbjZ6Mgpt
 WW2L7tja/USBaDBXVsgTvdaGKDvIIBWFNWQFDG2QuBlh18az2c0Z0sGOOYPYaHIlykge
 d3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678146566;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bThY2eI5Ds5muPeAlltRAb1kZcFCFT3Ulo1RmRXTQWE=;
 b=ZgGBJHyOkFS8FIAQDc+C66VXdR27upOKhzlJbtCTflTmQ3JpDT7Qy38Gr3DK0Hi3nf
 tEAKZ62CTesLV+KIi6VSTAvzyTUKKS1eUxisU087HrPJ2Tcbvf0xuYJGhhjMaBfmcr2a
 LphxsnTqsda/4zybmAlf0y41EggdhMqA2CRHjJMCCh89m73yYYK9bVv0tZMQ2/GQKu/1
 PbxhQoaXLRRTf7l3mphCqUQrMXik/5ildZqoK4WSR05SkEV4IIv7w9H9aIIZcYbgWtQ9
 ia0bfYg1NwHiI4WvYemaDRHjdp/AWHtcp/2dK07ggAz5qv8KCGektvXXc1k0+ks+RaDC
 VngQ==
X-Gm-Message-State: AO0yUKVCElJpsDRRjXlMQ/63p/WgMFhBTc5nf+q92Q/IHz3KVmXfTZYK
 an/NPudeodoUjHduXV2KLlS+qw==
X-Received: by 2002:a05:600c:19d2:b0:3eb:37ce:4c38 with SMTP id
 u18-20020a05600c19d200b003eb37ce4c38mr11102440wmq.3.1678146566306; 
 Mon, 06 Mar 2023 15:49:26 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 m7-20020a7bcb87000000b003dc4a47605fsm15212311wmi.8.2023.03.06.15.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:49:25 -0800 (PST)
Message-ID: <2ba8d293-9f86-9ed6-f8b9-e8c930f13e8a@linaro.org>
Date: Tue, 7 Mar 2023 00:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 13/70] target/avr: Avoid use of tcg_const_i32 throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OTlV/0LV8mnA

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/avr/translate.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

