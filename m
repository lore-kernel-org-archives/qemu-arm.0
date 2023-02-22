Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3738509ejb;
        Tue, 21 Feb 2023 16:10:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8DmTihCP/j5YWJ7KxEYAAtGRF71tUKrcdXLPEUzPYq+PDFKeI/LNfQPrbn+0ABynF4/+yw
X-Received: by 2002:ad4:5aa7:0:b0:56e:b347:8df4 with SMTP id u7-20020ad45aa7000000b0056eb3478df4mr14654115qvg.11.1677024635422;
        Tue, 21 Feb 2023 16:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677024635; cv=none;
        d=google.com; s=arc-20160816;
        b=C/L93uNDvX1VGcvpCY3ujbr15EnqYMzsWMWSFowkSGvOkyHj5tz4S02PPHEsp/YJcs
         gdryFfHcLijpEJE/MwENmxIX1gi+3I2G/owFwP1/Gnm5gUps7XJt0vc+V24ejfK1QM9g
         5RsWND6GahWXbD09iEOBTEgaWfQkTxZUu44si7Mbok6nf8rp2zq8efmm0lo5aRrK9FPd
         q4c1d6XXlHTnG5wWUE10niG3BABZrH+yUcohbU3psocBFHvStwQ59kW8U8SNOaZu5HOl
         Hg+gW1iegKiJcHuDtPBxty0aPBJbQhVqz/OAhzv7zCx3qh6iVPh/h6oSDJj50y+qsR6w
         5KKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JYV3fJshr0JNLpOhPXMcV2wmbI/0XyUi8Qu+MeFkiSA=;
        b=Q1zPwcM/illFQUdNl49PQ3jSPwyWV1Yl0DQwi6TKk3cS7RCxg1cnTZYByVcFI2CZN3
         qKy1Scae8SAzXBVyr1UxSqnQpvNY4/Xrc2Kf7gWKqQc3wWj8D/OJDQeXiJ/cWtTRIO7c
         TZcbI/flkhrCA7kyQRx7GXJ+LvW8q7CnJyyPgJmDzKgtZGixWJ1Xw1PBDzucIpjiRPVf
         Gy7QoHHdu/fgRg5ygOW5nlo70nZjOptk3E9gWeNyNVbadbm5V7+gVEoLUiGXzZPQOu+b
         a4HOjNLDqi7Pa9XhUHQytaKJgAkKHrp+7sQw9XTGZma0g//850p0xHxq8YOVRQ4S+h73
         Vwkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQF2Z520;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d30-20020a0caa1e000000b0056ea60a5c74si4595093qvb.528.2023.02.21.16.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 16:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQF2Z520;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUciK-0006Gd-8h; Tue, 21 Feb 2023 19:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUci2-0006Fl-Ib
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:10:10 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUci0-0003EH-Q0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 19:10:10 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso520067pjv.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 16:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYV3fJshr0JNLpOhPXMcV2wmbI/0XyUi8Qu+MeFkiSA=;
 b=gQF2Z520wDEEjt3idIh9gjZRbjwevg/ujfMh4+5pwAETodQKXmDI+exqpEpperkvFy
 EN2r+MyY3/q2/xnzjBQM5Exn56oIg44jgguHCDhX2wDxqXd5/NwF3DwSC+0EEcgeZsmr
 1OK9Oy03u/Uv9OcOAm238KqcQgTFw0Oh5c7n8O2vdjNJN2+7JaasbSugauVQzMW6kG4b
 U/l8agy/YnJ+dF09k/SBjDDZFDbArQw+y01d8karyKWeI2Q1t/u2ADPqKvqRTxZZ4VJQ
 4lfKNDp8O4nx2+fMArs5HIzsU7BpiGZzOlnVl+CkffL7gAltZ23QKuDkWZIrFX7HYe95
 s/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYV3fJshr0JNLpOhPXMcV2wmbI/0XyUi8Qu+MeFkiSA=;
 b=SQWOMwSGiC8J6IteNopvXal+AoEltQA+FjOMF8649MWfEbwRiDpJ7lr1hj33OZKPqZ
 iM63klRmxhzJ2MEnXD0OVLS/Oe6O1P3DL/bg2/3QANbUmsIV0kRBYS/u78GPuNllnaIG
 6lnLniD2yJGsrNVypz2eggoZolAXXt6YVrvhzeO9mJQC+t83W+LjAnqV4r4nJQpFgdBm
 4lYMTsNRzMkT/OFM5mxzCghYXWfycZsN0PBS1+Iwu6WYT6+r9igt1lD+Z4mNPoOxu5Zk
 x/yDJR4SvBmJmiTb57pijsXBPArT+q0NjCz1H7ytdlkTq/e9zgbkKqbn22e6mjJTaxk4
 i+vw==
X-Gm-Message-State: AO0yUKWWnHBJQcXkZF4ge0i0m+GmKmqj5BeYmjHk7s4sUQ/+UDv5pdaQ
 f/5WW01sFEi0pnRKtck9Ur1U5Q/6W0X2n6J37ZuofQ==
X-Received: by 2002:a17:90b:4d83:b0:233:d4aa:dd01 with SMTP id
 oj3-20020a17090b4d8300b00233d4aadd01mr5919031pjb.26.1677024607400; 
 Tue, 21 Feb 2023 16:10:07 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aaf8500b00233ba499104sm3461727pjq.36.2023.02.21.16.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 16:10:06 -0800 (PST)
Message-ID: <235a9537-b2f9-f5d9-45d7-1c54a5c53424@linaro.org>
Date: Tue, 21 Feb 2023 14:10:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221232520.14480-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qSfBLJNHdQEV

On 2/21/23 13:25, Philippe Mathieu-Daudé wrote:
> Since commit 262a69f428 ("osdep.h: Prohibit disabling
> assert() in supported builds") 'NDEBUG' can not be defined.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/scsi/mptsas.c   | 2 --
>   hw/virtio/virtio.c | 2 --
>   2 files changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index c485da792c..5b373d3ed6 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
>       n = qemu_get_be32(f);
>       /* TODO: add a way for SCSIBusInfo's load_request to fail,
>        * and fail migration instead of asserting here.
> -     * This is just one thing (there are probably more) that must be
> -     * fixed before we can allow NDEBUG compilation.
>        */
>       assert(n >= 0);
>   
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..c6b3e3fb08 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
>   
>       /* TODO: teach all callers that this can fail, and return failure instead
>        * of asserting here.
> -     * This is just one thing (there are probably more) that must be
> -     * fixed before we can allow NDEBUG compilation.
>        */
>       assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
>       assert(ARRAY_SIZE(data.out_addr) >= data.out_num);

