Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2749701ejc;
        Sun, 22 Jan 2023 23:26:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXusx36tYuBPS1Y0YRezNuKnvIPOlxZCbjw8XsfRFOlPSJ0EAvHuIAZtxxfVJ/L8DTW+fPYa
X-Received: by 2002:ac8:5ed0:0:b0:3b6:37dc:cb13 with SMTP id s16-20020ac85ed0000000b003b637dccb13mr33124418qtx.51.1674458771158;
        Sun, 22 Jan 2023 23:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674458771; cv=none;
        d=google.com; s=arc-20160816;
        b=UKjwBLNQxuGIxU94v0g3oBhGSmi44A9gQvEJ4R+pjuFByjUPeP/K79HalRnhv3kfEU
         lY3NjBmyXUyWnNUT3tFALnSO8vxij6eIKDuS4T3I3onR9UCKKNV8WybPpOg6lUJDCwy3
         /Up3T/otu1osEtBC8U3+hhTWx9Iq3zjvOCBbybZ0mgIYwXuQJm9av7Kr7AmEL6w/Gvo1
         uTAze2IYSEf2VIODU9EcoXB3JFToEB5rS4BORD7e9g/KVr3rngXLBZfjELYupsGgSdA1
         N8iIgyK+WdeuLu2h05o6k69BUF6h7qNTxhp7fbtlWv671TCJ0hyuWMdjJaHj7+2X8wQu
         bSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HB1/QeBkm2hRdMTD3BOgsdtjebQYUh2d/gTlXGQ4b9A=;
        b=uV8MFxyz2XFUJxcUBPtswL1O4WaTgGxFcUON0nl3xz8HqPjtN7qcqsTEYj8bEr9Vj3
         GLscsqXJ+y1Oa/TIbDsVVIjdyXhWP51wUkk/ak40lus5zWb3m4sXdPjHQ+QdDSXNGw9I
         A8pW20DdoXCpnvHC3RaHCwYbz3B1x0dlkWEPxehEh3hviqFudVn+wWxCDqyO60NdcHWf
         mTqXPp5zSK2Z4EelAo1y+yNu9iGyn6AFicEK5g0JzxpfKhF38k+KaICElk76eUa1bBio
         K9U6muS8nUGOxAS0NwIJIV3Wtk4nmdOa3sDlQwGwcOE8TGHW3tE+PqFS61pNxJGCcLFt
         UEmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8itqXrn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020ac84791000000b003b6311a02a1si13851563qtq.442.2023.01.22.23.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Jan 2023 23:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8itqXrn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJrDE-0005Y2-02; Mon, 23 Jan 2023 02:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrCx-0005Vd-SR
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 02:25:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrCv-0006D2-S5
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 02:25:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id b7so9875050wrt.3
 for <qemu-arm@nongnu.org>; Sun, 22 Jan 2023 23:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HB1/QeBkm2hRdMTD3BOgsdtjebQYUh2d/gTlXGQ4b9A=;
 b=A8itqXrn3kXoqrdkodTC1dR8MNICtsbXrfsiRveeYC55U3W+yE4aKVPiE6wBeNTNSk
 TAB6ksub7uVxqxG1ziAe/M3R9cmc/TzgAvA8a3DDeA9OgZHG3db2p1vZD1SYvsJhCKI8
 umUcShthzLRVEj+xEKuQzXZgtqlP+wZr4NekDP12LJAzPyCytmwQoFdVGj63w232VrAX
 5oQRArLzbd4L/xIC+Qywpgd+miy/2sVDciAj4ECAnY3arBRgkV9zarXb2jmgoVRC6I+1
 A8H3lfW/4cevuX5fx5dafO56cgh4keiLR5cHd8sUCro1r5Inqik2uSFPSWBg2VLuVR2I
 /u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HB1/QeBkm2hRdMTD3BOgsdtjebQYUh2d/gTlXGQ4b9A=;
 b=GFlcHJJuQ6iS25dXhBhDqyQkkZNCQdGGz6FQliUbAg6UYI6SRUA+jnIuQ7jIoevPQO
 fePa45wSKVLNVYXFMxY2MbGi5VWcOYhIXl4f4Si+sfHkBdbrKxYJHeu11pVetSmElphc
 NEnO9INdAxUzViZaIWy4ptcBMpFatWGj7w9a5rH0QqSnIu1hvGFqt+DJAssdPQ5CuY8K
 tFcybtqgkGNs7qQBBvrxByBL1eIoHhTKOHdaS6vxL+4EBfq/AKoaHs4bMdjakQhhBnM4
 5RMsQH815g9nT2XhZw7yXxDFejP4aNSl8p10rPBOMojlIG2uXGPXQADmx8479Ur14+Wj
 X5UA==
X-Gm-Message-State: AFqh2kqZBtoezQyXXacvfogjNRWI9aHG5uclc27kuegOqtkrS9C/TfqP
 vW5khc1yEd8OJIj5clPZaBtMXQ==
X-Received: by 2002:adf:f0c8:0:b0:2bf:9656:d1a8 with SMTP id
 x8-20020adff0c8000000b002bf9656d1a8mr8225219wro.32.1674458729218; 
 Sun, 22 Jan 2023 23:25:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w7-20020adfd4c7000000b002baa780f0fasm4117229wrk.111.2023.01.22.23.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:25:28 -0800 (PST)
Message-ID: <af8222c9-539d-214f-4d5b-ab1862891503@linaro.org>
Date: Mon, 23 Jan 2023 08:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/5] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-TUID: E3UoE5ZGIZGi

On 20/1/23 16:54, Evgeny Iakovlev wrote:
> PL011 currently lacks a reset method. Implement it.
> 
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>   hw/char/pl011.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)

>   static void pl011_class_init(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
>       dc->realize = pl011_realize;
> +    dc->reset = pl011_reset;
Maybe directly implement as ResettableHoldPhase from "hw/resettable.h".

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
