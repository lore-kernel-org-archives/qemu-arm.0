Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2877756ejb;
        Sat, 9 Dec 2023 02:47:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOWiKaPfr6CBhLyoCESxqRB75vwTR7JfOBpoBSg6c410FA+iWyBn2+T1VtjTNVokaOjAEW
X-Received: by 2002:ad4:4f06:0:b0:67a:a721:f341 with SMTP id fb6-20020ad44f06000000b0067aa721f341mr1322755qvb.129.1702118866767;
        Sat, 09 Dec 2023 02:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702118866; cv=none;
        d=google.com; s=arc-20160816;
        b=FeWBTrbvURHjXAcqCueEoHh9SF/nGhckSBOCV5EXyag1YGsyZ66zybOO8sLsv3SSSJ
         5o/usGpA7JvPEJfZS/iqtF4zrKC38pyNS844XYCuaTFCe2Up/6PVf39AUEmFnekBPcqD
         3IgC0CL2ZmIaum91D0/Vj784HOhYTmNuXqYq0OwhOwiOZ0iE7WLjaNxxFD1nUDS1qKmM
         sIVrx1Kj3d0K3V6KfqMO14p+me3dAmzwIM7Nr8FS/SHXN9fz9fTLWKUpZIn7DvqFtlTG
         pVryaNIahK65/f0E//SfTIC8yHehsbYdbrcWjMg9s/vC9Kd/xSm44U6wChFrEiu3uRhR
         dfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=B0745HwPGaf8LJudLxxai9MHr04sbyDf8Frov0s+qp4=;
        fh=4T1CYAkBMP7kEbyO4JJNOfXVp6ykeJWZALJAUC5xl9s=;
        b=ppKpM719UaV+717SonQ7SZrgp3qtsY+mLudVlHTwgbdi4BdejBJxcBdhsXUW22xnk5
         c1uhowyXahoJ2XrbFZdHJTY66p8t/sWV7B3PAKzhgMKIE3Q9qzHg56rQRdW9xLXZ/EcZ
         Uf5y+NujCqcL0JkGgce9frp8GxFftwjO77Yc26lvVWnq7gbkFHZE/gJ0fCkVKgjxUWfw
         Gowb/cbOuwp2JIAuofcqfaL9PSWGZJ1VEQusS6O36mkrVWZyQ+LQU+7GgCfmSf+HPi6a
         4QWzI7K3rtDKxd8P+YPO+KxrUFvi/UkiFdOdwxDoqLHFoMRZ2rjw6JSoWlRl/gcbJqo8
         ri2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3Lr0kOM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14-20020a0cfbce000000b0067a39cb25f1si3910036qvp.363.2023.12.09.02.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Dec 2023 02:47:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3Lr0kOM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBurc-0007Hk-PB; Sat, 09 Dec 2023 05:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBurb-0007HN-Ak
 for qemu-arm@nongnu.org; Sat, 09 Dec 2023 05:47:15 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBurY-0005xY-B9
 for qemu-arm@nongnu.org; Sat, 09 Dec 2023 05:47:15 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3334d9b57adso2089574f8f.1
 for <qemu-arm@nongnu.org>; Sat, 09 Dec 2023 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702118830; x=1702723630; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B0745HwPGaf8LJudLxxai9MHr04sbyDf8Frov0s+qp4=;
 b=S3Lr0kOMTeHvrHyabP77uSuCsfaw2EZTHX/rJCFlBkznIowFTq7sAuUMWwq/hs5d45
 4YVh3+Ep1yQ/bnQ8MWesk4rMbc0EEB+M6RQ4bHHJpS1OJzvtfPNX/MjJSpzdaP1A58Cx
 56SD5Ws86GjUvUqEi63CwNO31KmeN1Q5mRDC7V3RWIVLzOurLdRR+ZQqeyzCHSLnU5Mk
 +5nSMf9IWMXV+iKVVXTqQSyOmYtn3ajv6htkHaLXzBhVrdICZlFE9jvdvKPlMUPNscQR
 V/mhHKXrvuFHn5bmBN8bDCFLZY/b0SOGQju92A2NzpMUxxJq43JLCv0bT9OrM75ehqTS
 BAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702118830; x=1702723630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B0745HwPGaf8LJudLxxai9MHr04sbyDf8Frov0s+qp4=;
 b=Y58Ed6vSEE6yygVbHAbSPbO8MbRu5BPhUUpkfgwYsh186bd4EvAqZNKnsy+XbzRzi4
 3Y6mb4/7n7VtAysPRyYETbC78Gc/ebzdRl8PAQKm1N5wfEO8bOjPfBI4pNGtDc5JK0b1
 sxgUn4nxs3gRmPHzeBSaLAtcWOEkqe6L3cvG2p9Yuz0tO97WshoiWUZ+eXn6cUJ2G05m
 rM2JVus3R11/QxnA8NrXcVdIc2cK8f25lVy2WdPJ9ZMPsy/aI+O9EDOh1Fio0vthH5Fh
 +E0A9RVeNMlN05NwtuLdULy6bv1RH9/d/u8f7qW88edrk7O9rKXzaYAoZIorOlLlqs9P
 5RWw==
X-Gm-Message-State: AOJu0YyErUyHBaU3hD3b+WYRwAo66vMiqhO5lKl6bU9MnFtjbfovG5xh
 kfSDTqulVdsEkGwBq5T6NnYv7Q==
X-Received: by 2002:a5d:58d4:0:b0:333:2fd2:8160 with SMTP id
 o20-20020a5d58d4000000b003332fd28160mr713978wrf.125.1702118830429; 
 Sat, 09 Dec 2023 02:47:10 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.54])
 by smtp.gmail.com with ESMTPSA id
 rd12-20020a170907a28c00b00a11b2677acbsm2049956ejc.163.2023.12.09.02.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 02:47:10 -0800 (PST)
Message-ID: <364000d5-433f-4356-823f-1a4be43a4c8d@linaro.org>
Date: Sat, 9 Dec 2023 11:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/45] Raspberry Pi 4B machine
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: iM2/mSguN+Do

Hi Sergey,

On 8/12/23 03:31, Sergey Kambalin wrote:
> Introducing Raspberry Pi 4B model.
> It contains new BCM2838 SoC, PCIE subsystem,
> RNG200, Thermal sensor and Genet network controller.
> 
> It can work with recent linux kernels 6.x.x.
> Two avocado tests was added to check that.
> 
> Unit tests has been made as read/write operations
> via mailbox properties.
> 
> Genet integration test is under development.
> 
> Every single commit
> 1) builds without errors
> 2) passes regression tests
> 3) passes style check*
> *the only exception is bcm2838-mbox-property-test.c file
> containing heavy macros usage which cause a lot of
> false-positives of checkpatch.pl.
> 
> I did my best to keep the commits less than 200 changes,
> but had to make some of them a bit more in order to
> keep their integrity.
> 
> This is v2 patchset with the most of v1 remarks fixed.
> I named it as 'v4' because of mistakes while attempts to send previous patchsets
> Please ignore all other v1...v3 patchsets except the very first one.

I really want to review your series, but I have been busy and
won't have time to look at it the next 2 weeks :/

Thanks Peter for reviewing the previous version :)

> Sergey Kambalin (45):
>    Split out common part of BCM283X classes
>    Split out common part of peripherals
>    Split out raspi machine common part
>    Introduce BCM2838 SoC
>    Add GIC-400 to BCM2838 SoC
>    Add BCM2838 GPIO stub
>    Implement BCM2838 GPIO functionality
>    Connect SD controller to BCM2838 GPIO
>    Add GPIO and SD to BCM2838 periph
>    Add BCM2838 checkpoint support
>    Introduce Raspberry PI 4 machine
>    Temporarily disable unimplemented rpi4b devices
>    Add memory region for BCM2837 RPiVid ASB
>    Add BCM2838 PCIE Root Complex
>    Add BCM2838 PCIE host
>    Enable BCM2838 PCIE
>    Add RNG200 skeleton
>    Add RNG200 RNG and RBG
>    Get rid of RNG200 timer
>    Implement BCM2838 thermal sensor
>    Add clock_isp stub
>    Add GENET stub
>    Add GENET register structs. Part 1
>    Add GENET register structs. Part 2
>    Add GENET register structs. Part 3
>    Add GENET register structs. Part 4
>    Add GENET register access macros
>    Implement GENET register ops
>    Implement GENET MDIO
>    Implement GENET TX path
>    Implement GENET RX path
>    Enable BCM2838 GENET controller
>    Connect RNG200, PCIE and GENET to GIC
>    Add Rpi4b boot tests
>    Add mailbox test stub
>    Add mailbox test constants
>    Add mailbox tests tags. Part 1
>    Add mailbox tests tags. Part 2
>    Add mailbox tests tags. Part 3
>    Add mailbox property tests. Part 1
>    Add mailbox property tests. Part 2
>    Add mailbox property tests. Part 3
>    Add missed BCM2835 properties
>    Append added properties to mailbox test
>    Add RPi4B to paspi4.rst

