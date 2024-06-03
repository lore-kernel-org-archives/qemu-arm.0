Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2208198ejs;
        Mon, 3 Jun 2024 05:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwnBeZG06CSasihcClNMOhziWcd3VPTo+EKeylLKeEeRLxFbn2Zrlk178UUiD4uqETG5F7t0JRQR+e9YlYaO0gw2wmwX92
X-Google-Smtp-Source: AGHT+IHicPfxC01wCCgPyTq88GnbfwYrOD3gD1KrGS4HVg8/47trIbbC9IRL6i323IQQPbWp57E3
X-Received: by 2002:a05:620a:400a:b0:792:8dab:cc84 with SMTP id af79cd13be357-794f5c87f69mr1184807085a.38.1717418835078;
        Mon, 03 Jun 2024 05:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717418835; cv=none;
        d=google.com; s=arc-20160816;
        b=zFFU52791UnpYrY2MbMUb4l58T/Ht+DSbNWywrIX1ZnfMWjbZDLhQySmklTuSDfqSj
         1r2YPJ5gkbYB70lXQ2h2xtAQiyEh/8stVy30d9yb5c9zzKzau20KT04BdVaNhvTtvcCZ
         Fzm0U8gaYknoSd+7CbmiQE4vMlg5GKArJ+6CQw6BKaCro2pVA3gUo/2miLYYN6wtF1xc
         JW3E8MGRTH6VV3ngUAfnH90htVP/qqkt5pX0rxKDC/NJaOXiGtupEiXbcyGB3zqygIlH
         GBwsVRwTM7vUW0omSW6rOO+VUy2kQBDY2hGHLcFHHZvwQWgc+NlyUo2l2n6vO38rCvay
         Ymgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JUA0fyegu9ZB0F4X4CGTHMzAks3Tvy915F8Z/2yDD+k=;
        fh=qkNCunPYUWNbahC9e1gNASF6+bw6+Wa6cxn+oFvZi+k=;
        b=EaPZwCW24DIVoWIRkBFrVm9EfKpT8M57N3htAYql0+/WRDxmPo9WE9eq6IF4JOdrm4
         kkxvw9hVbneV5T3Owf0PH7JhwLDi7jTQ8JO/+W6Iu7rwqNhxrGhp1Vv7xHoXIccBiPFF
         BosgT344gyMAM9UqUvK27DX+SThMr7f1j97F1o1hAp+5Frnmh1RQzp3+QuYh24IEDIQv
         DB1yVxBc6A8UhZcR7htkijX50viztrp8Cczrc7N9aohlo2D2XNIwf5C1+g5fqUlWk8Pi
         Y1qWyT0enQMlXmU+juIZ16AXUcTuTfqhgR1KKFPnNdwOgQjuzqWRyHIYHTi9tThyBFzp
         /B7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRy9WQrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794f32bd63dsi904592485a.767.2024.06.03.05.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 05:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRy9WQrN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sE75h-0006mc-Mf; Mon, 03 Jun 2024 08:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sE75f-0006j5-CW
 for qemu-arm@nongnu.org; Mon, 03 Jun 2024 08:47:07 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sE75d-0000GX-M5
 for qemu-arm@nongnu.org; Mon, 03 Jun 2024 08:47:07 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a69024f2433so137729966b.2
 for <qemu-arm@nongnu.org>; Mon, 03 Jun 2024 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717418823; x=1718023623; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JUA0fyegu9ZB0F4X4CGTHMzAks3Tvy915F8Z/2yDD+k=;
 b=SRy9WQrNSq9ncXINxfGobrZMPQKphwky+uVjeYNLcrXjhAZxxUDaUsvgHEl+q/fRY7
 VWVu74AZNBc6AUzfDJrd8aHAqTdv9ECyw+YrE8hwmf5138UTqkyUusR5RBPj34qCrnxK
 GDwXUzRJ1Bdk2XGHWiYyFazd56/AokQgudIZ0sr4l0O54Q3DAhxqAK4sOvipkvZSP4iA
 0+udmx3zv4WQw/Y2Oxb5lprA78tbxv858xLs9bUnQcP9ohBTd145ivBhJSAHvOuNloBp
 pZjIuKlGgOqRsVGAf6lTuQIxiFWKgz6d6SsFzrf0odd3vEDo3+1C+KR5vRVuqmD9Ovjw
 LSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717418823; x=1718023623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUA0fyegu9ZB0F4X4CGTHMzAks3Tvy915F8Z/2yDD+k=;
 b=EIMWDa6WuZoFNb+xOsAKW8SNXv2gt2CWAxIefE4oEhQ2VKdFsfvYNt8uFPLtcSpOKg
 HziJqgbTZo7Fvtll9Knd+sYQJvh0b+qUvwMHHchRpBPYk4ikQo1tlo3NQR5nqYVjDJRR
 p3i2YPEi81V458lTEZDfjbj9LdTJaz8bxeEenTwe/gFuWATgFY+rWTQo/rkD9P83CJ1k
 eY5inxgoY5Wjd7Ca0MbHBy0aAlsx5+N3SSQo7kiU6DEmvmtI0bSIJdKEvJBRKEHf30tU
 1zsuSu1kxI5nljfLeAXK3YwgWhJxkU7RgaNIkwPfWc8mqcuOBp6ZxU7uNL3n1hTaArma
 fmoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVWJ78uyFmD6iFWA/uFjwAXVcb0oD5BZNfAG/jeWCjSJBNgzcQAA9/aK6/OkjRQNIDmp8c0Cd8C4NO3luOFgfz95gk
X-Gm-Message-State: AOJu0YwnnMRSX65l9w90eBIGPSsZRnXFRkKJJpNXRysbi0nxiXXOYeGl
 fvVK/iNiyO289+9cJqqsihXFLITRZH5x9AvVmwj+bI5G6yovGARYo5qqQOQu/sORcoC8uvFnrWa
 3
X-Received: by 2002:a17:907:9483:b0:a68:f6b7:1fe3 with SMTP id
 a640c23a62f3a-a68f6b7227emr317583566b.43.1717418823250; 
 Mon, 03 Jun 2024 05:47:03 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.241])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67ea586910sm483102866b.113.2024.06.03.05.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 05:47:02 -0700 (PDT)
Message-ID: <7687c5ee-2ad2-4c72-8754-5e84083dd484@linaro.org>
Date: Mon, 3 Jun 2024 14:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/dma/xlnx_dpdma: Read descriptor into buffer, not into
 pointer-to-buffer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandra Diupina <adiupina@astralinux.ru>
References: <20240531124628.476938-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240531124628.476938-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nxW3ujhFuI0Z

On 31/5/24 14:46, Peter Maydell wrote:
> In fdf029762f501 we factored out the handling of reading and writing
> DMA descriptors from guest memory.  Unfortunately we accidentally
> made the descriptor-read read the descriptor into the address of the
> buffer rather than into the buffer, because we didn't notice we
> needed to update the arguments to the dma_memory_read() call. Before
> the refactoring, "&desc" is the address of a local struct DPDMADescriptor
> variable in xlnx_dpdma_start_operation(), which is the correct target
> for the guest-memory-read. But after the refactoring 'desc' is the
> "DPDMADescriptor *desc" argument to the new function, and so it is
> already an address.
> 
> This bug is an overrun of a stack variable, since a pointer is at
> most 8 bytes long and we try to read 64 bytes, as well as being
> incorrect behaviour.
> 
> Pass 'desc' rather than '&desc' as the dma_memory_read() argument
> to fix this.
> 
> (The same bug is not present in xlnx_dpdma_write_descriptor(),
> because there we are writing the descriptor from a local struct
> variable "DPDMADescriptor tmp_desc" and so passing &tmp_desc to
> dma_memory_write() is correct.)
> 
> Spotted by Coverity: CID 1546649
> 
> Fixes: fdf029762f50101 ("xlnx_dpdma: fix descriptor endianness bug")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/dma/xlnx_dpdma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, patch queued via hw-misc (except if you rather your arm tree).
