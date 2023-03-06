Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4801829ejc;
        Mon, 6 Mar 2023 07:45:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/h5112935kQUNXFvdSEc13oDj4+VcWAmblDlrWLgSW8C5ZtQnJ5wAXGeCSr+JHecf11M+d
X-Received: by 2002:a05:622a:40a:b0:3bf:ca4f:9c5d with SMTP id n10-20020a05622a040a00b003bfca4f9c5dmr19725763qtx.49.1678117553600;
        Mon, 06 Mar 2023 07:45:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678117553; cv=none;
        d=google.com; s=arc-20160816;
        b=BsE3coP2OKvo9hiK+DRbys9rPKHaw8DjbESOGnBNCSCpXrCw8Gk9+qJxj9UfjC8xA2
         oHIwCJZNWwp0JzlbqGuq0EPwbTfM88bHy19i15y8TZ7tDBHWspg6p5dAbY41xCWC6SPU
         PStG41XHCrk8aIaQ4wJgOR/evhu1JCuVNLJmioz77W91ZHIpXfDWrU6P9rPr7ETqqhcr
         /cfml4nzUqDYiCFNKLf/kOLlID+P3tHG+mKfZIoDAXfMtaWUR2b8M5a0O+zZLRWYGIDr
         w8ZP3nZmTEiEh7kXhGnvFkN0gZ0iNRKQFjhgTLEprtnQ5QkrI+WexcBS0wbAtg2ROMo+
         P7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
        b=QBC10pNYcVV0zcscC7Xc6yFnUVZnbc3eLpF837IGPlPOx3NT6FKznkvVRCCw9PFBi9
         I0AFzV8FKQrUfvF9NvzzRLkhIKJOZ7crwFv0A1430A98LcbmpP1W/5OI81LOJ2o9kF2x
         lYKoMk7qlVPkJqgzz9B9FvBMSGH1WY3F7lltH8xyHIGnbTI/9mkMZlKVZiHxcEC9in4X
         6E+ZuKeG8vFa4WD1G7jCRSDxsW7Gy6LQ6Dkh3H5he4ITD122TuXDoi6K3LCr8bh86Icl
         HWUuvgjHP6Z1sWaGtYamC4uJTHFMUNmtzGwHgV9ImLbQ6L5ek+lXu5Ak7aLPqi9+69d4
         kysw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DTxFRPXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi32-20020a05620a31a000b007066b70e803si8468725qkb.543.2023.03.06.07.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:45:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DTxFRPXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCvw-0003aI-2b; Mon, 06 Mar 2023 10:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvu-0003Gc-Ax
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:39:26 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvs-00036u-N7
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:39:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id az36so5951020wmb.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
 b=DTxFRPXcb4SCyM3BKWwZ9I/mBqmVJ2p1/u6uTbsEpblXloYGrDz4ajswRUWzMLNV4y
 d6i8pVIRS6lmB4st7Kr3mQaXZdnS3WMwoG0+RE8Am/vCo8JxdeLsBQv9Zn+yrY9yRkfZ
 rNp2o8SqJ1n3CBseWCsJP7H3mYgt/4Kg+vzfhknd1r6e5codD/cTftQFlVzYb1rLn60t
 0iOxG+96EWZS++cCCSU2ZbxCtZ3JNp3gOfhHFhQ8NJjn63JhiURUK2NjGVzAtz69vy8l
 V2nPA/b7I34YgKM2WKZeG/nxWtG3+8sLNMG7iN4oJtnvnyKmom8H9+UioyFg3ZRIy7FK
 V7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
 b=R2LGmWZZy/iZWKCRs3pswTYd8cOQb820tkcGMjppGFCyZpxObt+/3CtmzokGmK+O65
 e+DZY7Blva/62j2FQ+yrF1ML0jt/1dxbSPEh6vPHHTBIbOqCrDb8SKBE86hKmF0oKpK0
 51npOAzP4L29x+7PqaMzSREuz15/Hb7ArpnJHYBxfBZsvk9D2uNEnvMc4rzjzcdMc5zx
 uqo+UQk/6V7ebWYYme1gX650hjSWjD7Jwa5EuNe0NWppXKDQ65mFJsHtpSYCeD98cweh
 yeNlYSP7pJ0ENbZP4+7VDD31vLZbSFGIqXUlZlKodbeDgYGWv+Q0c+IADRJo5QbwOUyk
 3WGQ==
X-Gm-Message-State: AO0yUKVT3vEJldj9OrNa4RuD+L5NWOh5Fz9d9CqYbr3dRmBX2IfoMXdM
 U25sG2Vs286F7mm2a2CHw7Cw4w==
X-Received: by 2002:a05:600c:3c9d:b0:3eb:598d:6494 with SMTP id
 bg29-20020a05600c3c9d00b003eb598d6494mr10401598wmb.16.1678117163444; 
 Mon, 06 Mar 2023 07:39:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q30-20020a05600c331e00b003dc5b59ed7asm10362405wmp.11.2023.03.06.07.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:39:23 -0800 (PST)
Message-ID: <f8e7b83a-f8da-d2ca-022f-033a960a26d7@linaro.org>
Date: Mon, 6 Mar 2023 16:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 59/70] target/tricore: Use setcondi instead of explicit
 allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-60-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-60-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: bqHm5TC5MCo5

On 27/2/23 06:42, Richard Henderson wrote:
> This removes the only use of temp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


