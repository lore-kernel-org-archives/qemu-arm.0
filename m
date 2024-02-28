Received: by 2002:a17:906:6c8c:b0:a44:c09:7745 with SMTP id s12csp32003ejr;
        Wed, 28 Feb 2024 12:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHcbDp2mZ1H79t0wqImH4kQ3gONdjWmTd/C2jjeWPSFXolVLZIm2EDEULDdjJDn10FmnkdWvvhcT6RQGh3QjEccwVRcAz6
X-Google-Smtp-Source: AGHT+IFdgFWwNSWzFfGmY/+Y9UFSh+AwUjPDxFt9HFzn5Ohxnr8yJi/NdyjzJbNxPJr/APYAFXV8
X-Received: by 2002:a05:6358:5690:b0:179:c8c:98db with SMTP id o16-20020a056358569000b001790c8c98dbmr434039rwf.18.1709152683454;
        Wed, 28 Feb 2024 12:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709152683; cv=none;
        d=google.com; s=arc-20160816;
        b=wknC2M0+q+fZamCqwGjJ+V3NYo8YWtY0FjljUHwwG14Cv22Ylna4qTCYWH71pR4pyT
         hxiedhgsnoTsCh8Bq7TpfzRQNaPwLkhjIMUa/kP8bb2CXzONWfDZOcS6P5twtBOHnO8i
         vNuC7GzJI1b955xqGzQnTFmVz3fsYF87oxg4Gf++pohQb71PAFWz60YcbLOP4X1GEBRm
         lywYxjJh26vEPDczWFN/SH+4/uDjL/5IWgQRf7pQw0J6EqY4yvSiyLQqyR8AA8FPCSht
         YuE2PL5QSVG9P5Q5bXq+nvNVNE7TD4cMFWfPz3TH3TzeArYqWDrbb4G/TqTGVzqgLMzQ
         eA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=734VRFAtk9Y4gpXSq/ySW6oX2l2zgK2V0Of4TOS5X38=;
        fh=f4F7eQXbMYBBbw7UJgpeHZSgJl71WW2HUrTpmFwa+WU=;
        b=BMIUC4Or2VDtS2qDNyD/d6+PPl4B9iYtBoZ0hJjpwmXz5Lr+vrz32hlK5SVZ1zdH1M
         lUbS0W37csQIHeuovxk1dx6ZI3Q97v+0fWVPAOLU0JThbD2EW5J1nPw2/z4qY4eVOYJP
         mrsBKfxERsvPY8CqXyB+e+SX1erhDB50yICbkzytomeFkkgohAgKLDuphWlFVQbY79xR
         jDtDSBHHRTeYCvXOu0dbx2f4vBcOh8H/Hna9zmhteOVb3PxtqNTS0+xm/PjVhBFhLVzn
         15YF4pU7fgJ4K3OYPj7dHw4sGfe4qUrQOKXzRGt1lOL6g/iVnx0WXQLuTttfuxXHqrPP
         8vZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adUr1iu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020ad45742000000b0069037cb47e9si305626qvx.441.2024.02.28.12.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 12:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adUr1iu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfQgZ-0000qX-Fu; Wed, 28 Feb 2024 15:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfQgY-0000Y0-0W
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 15:37:50 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfQgT-0003e3-CK
 for qemu-arm@nongnu.org; Wed, 28 Feb 2024 15:37:49 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6e48a8304a7so87750a34.0
 for <qemu-arm@nongnu.org>; Wed, 28 Feb 2024 12:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709152663; x=1709757463; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=734VRFAtk9Y4gpXSq/ySW6oX2l2zgK2V0Of4TOS5X38=;
 b=adUr1iu81N0xUIBrNBeR6ASOsIbbn8N79SUaqc8X97dwVX8QNHGpDKX89pHQlukXRK
 Lp9jR4qlUtN5S2u6c+u9Q7vP9JO78BSRUe1PniStrzv9pf37eXT6a1N+UDUHCpdptCZv
 IE97YUlLXhPfqmxGtzzzR1gA3tpEoGuUCUKNO+9WYJzQWhgkzbufablKAYSj14wmUNDT
 XzIk2rq1qSsT7lcvkdWtctveMsxnuSdUMPMZ/E7OFULqWHJFEOTg30xLXR39a1kBJLTq
 h4tX383Ha2syoTf+vWoAFeBvUYjooKIsOKIqLD8nOUrzTp0jNrBndJH1acUGX3tJMsH9
 wg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709152663; x=1709757463;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=734VRFAtk9Y4gpXSq/ySW6oX2l2zgK2V0Of4TOS5X38=;
 b=qen6kHB0AQtyWFuaVpgENHhGacCVeazGCzcqixFO4hxfLoekmYXYw1gtwK29oZWz0/
 RPzmKTiBrp01dG+0BdVyzScaA3+4NCL9uTkiubK5a4LKzb3jO+vKU/NKlPiXNGus0WJr
 IAw4I5srKwbNCvvIUAjYh8a1DDoXDhn4+pU4KE0EcFXte8f1LJKtIoEcNha7y/IGy4y0
 g6TKXrxe/VIqJjExF3lxKUu20lSX8ZEgXtJkXbP6djS5cNkp7bsLpWu3rsGsI4Tv1On9
 9pH91HuCSGsQDje/xGwF2NTHD/iy9iXd4qDQKmym7vWe6Z7Wzu8spFkSa6JWAZsk5BIW
 /QCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4pFwodRcKbveeard8AEkhd4x64knOINzugkzkHBf/sNTd+h9RkgAtC3wLZ91aFg2l7HMjtK+pX+Vp/xc0UscyD3kD
X-Gm-Message-State: AOJu0YxXCkfXTTQB/3ygo1l+l/Kiq11BjqTIEtK64xiLbZJxMXLxvLyT
 CByDjvPv8WEGVp6Q7puB8Z0lwHT7WSFfHHX3VuXrsx7TScU47I4Fx08E6ejFubU=
X-Received: by 2002:a9d:69ce:0:b0:6e4:94a5:980f with SMTP id
 v14-20020a9d69ce000000b006e494a5980fmr11826oto.23.1709152662762; 
 Wed, 28 Feb 2024 12:37:42 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 t124-20020a628182000000b006e52ce4ee2fsm127203pfd.20.2024.02.28.12.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 12:37:42 -0800 (PST)
Message-ID: <4675310d-8c66-4c06-81d2-28c36fcbbdbb@linaro.org>
Date: Wed, 28 Feb 2024 10:37:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 02/22] target/arm: Add PSTATE.ALLINT
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240228092946.1768728-1-ruanjinjie@huawei.com>
 <20240228092946.1768728-3-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240228092946.1768728-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
X-TUID: yDUULefoPLVo

On 2/27/24 23:29, Jinjie Ruan via wrote:
> When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
> ELx, with or without superpriority is masked.
> 
> As Richard suggested, place ALLINT bit in PSTATE in env->pstate.
> 
> With the change to pstate_read/write, exception entry
> and return are automatically handled.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v4:
> - Keep PSTATE.ALLINT in env->pstate but not env->allint.
> - Update the commit message.
> v3:
> - Remove ALLINT dump in aarch64_cpu_dump_state().
> - Update the commit message.
> ---
>   target/arm/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 63f31e0d98..d6c3f8a935 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -224,6 +224,7 @@ typedef struct CPUArchState {
>        *    semantics as for AArch32, as described in the comments on each field)
>        *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
>        *  DAIF (exception masks) are kept in env->daif
> +     *  ALLINT (all IRQ or FIQ interrupts masks) are kept in env->pstate

No need for this comment addition, because it is covered by...

>        *  BTYPE is kept in env->btype
>        *  SM and ZA are kept in env->svcr
>        *  all other bits are stored in their correct places in env->pstate

... this existing line.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
