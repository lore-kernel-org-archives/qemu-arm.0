Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2111703ejb;
        Mon, 13 May 2024 04:27:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+6ilqsC+6iNSo3GwwdkvrlOWroMK1q1nWo3jJDMcnC7tbdAZrDdk6umUz7NG76tqb8/Og6Pj81OaWMZO+uKU6i6CYN6l7
X-Google-Smtp-Source: AGHT+IGOV+xZ3BJtueDKtdEVslbIyUBPpy1EWrEFCgr5w6gpjL/709FFvPSzIE1h+IQ9F6EcQJ9i
X-Received: by 2002:aca:2b1a:0:b0:3c9:6a5b:51cf with SMTP id 5614622812f47-3c997021a7amr9783014b6e.9.1715599649618;
        Mon, 13 May 2024 04:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715599649; cv=none;
        d=google.com; s=arc-20160816;
        b=EPGNqZkqaeQk21KBE0Mz8PjboVqrIflJ1gm0QrxUXnpoOYy2f5k6b+HZPaOd3RcjPW
         sCMObYxtDBP9D1dUnLI9IJC9FFvGDISwVXcC3D09RvQ+RQvXZEWTczxrWpHNIJEszGD7
         oXD/T7KIy6ikxD2guH4l8Hojkj4isSHVJiLWNl2x+NeFv+NKDS/1swWpoZWze/CMOBxw
         MqvfpvwG2uPNjdzqAdA2Cur+ihOCp9KI3RtdLcQBH8XRZ5aTRj0lQYEuRdOPzXV2djkG
         na7u6AXCZaT9uApnNRoWUjNwJxExzCnrfAZucmy7zdmeIOCTLvdH70djg50WXyw7mgmg
         Ufig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/G7MfgzCcN0jtEglp0t6kBbppY8sZFYe8E6d/jwHYcg=;
        fh=VnyU28Z1OwheHC6xdGW6JJgI7EY8IX8G5jLdxe7bIDg=;
        b=qve7OYbsR9DkGLxC4cAl4xnXuiLIhBsz4vS7hyT7IlOX2Enfu38mufvRy73zBweSno
         dRTds8pKmokEhOSC0W+AEza1gAl2hKeQtHQtC+hKM4olNF99/Z6CMNq7GxksTynz0hdX
         szHF3q7zTOz7l/QU/OVUt6oUMVpIUQocHlQVwAaE11/f2vrGs3vVASEL0tCob/NGEPPB
         gfPRsINxg5WffxbSIocjjTjFrcbDVbp2qRRB6qn/DF/eeve0sa59Lz29Gdc+jGnNaU51
         aWVqMmY+vQ/kpk3H2W22fEJ5QMe+7olnZ3rWos4PND7cK7R2fKUmEgfkrk2WaLLqNWZc
         15Kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DfDgY65C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792d7a867adsi408591685a.434.2024.05.13.04.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 04:27:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DfDgY65C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6Tpg-0000UN-SR; Mon, 13 May 2024 07:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Tpd-0000TS-9I
 for qemu-arm@nongnu.org; Mon, 13 May 2024 07:27:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Tpa-00008w-Vw
 for qemu-arm@nongnu.org; Mon, 13 May 2024 07:27:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34e040ed031so3226331f8f.0
 for <qemu-arm@nongnu.org>; Mon, 13 May 2024 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715599617; x=1716204417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/G7MfgzCcN0jtEglp0t6kBbppY8sZFYe8E6d/jwHYcg=;
 b=DfDgY65CkKaOX+Cpy8Eikx6rhzf/S9sY1ZJY9EuB+hmYAfGFX0wLckwm6y/aR6y6PW
 9O0sAZUfVyJkrYKrj7CDArEaBOT4UN9tik5wWS/3LLCpAEb+wJN2ucNIFQXrH9AaBUm+
 HakPhTMvv3RX2qVB+RCSFVbt5qlQUqWXLZ/EfV9hUjyBgAowH5P11hZ70N8XnFB/RPEC
 5/L34AZ5N+Knl3OC7vSTbz+4QUfyOhVP/zBAm2lFUjFXwlwZVtQu6UzHl92ULiHGhCUX
 eqU2PNe85tOusHPRTKq+8tnzLoTfuAEwhi+2aXLc6V6Y3BQbluO1cN5md/0jPJAD816w
 /Tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715599617; x=1716204417;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/G7MfgzCcN0jtEglp0t6kBbppY8sZFYe8E6d/jwHYcg=;
 b=Fp1vpI2MmX3Rmt7l+bBmBIXZoW6DbPfwGaJiZm+63jQ/E8jBzdM8mvhOmFXwjrrbts
 e7+5v2r7vOuETNQSj0Z/RteZrhF2EsZjmZbfKq/Y6RQqmtMqIwrAT7gk973IRs0KlCvR
 BNdL978G7sC77Ct4Hj9qwMyTJ+GBiRdHZPub0CsQPPtwxeVxrMmUjDlPL/DnS+rHh6wG
 CRT2+TYv+SnoiMBwjULRo7CMA3Y973L0g0N3/hQnHjhRUW4JNwCQKz0aQhx6LvqN0qd+
 agvYDx5B9AWcRZGbbkA46bEa4uIGGnHpkp6oAJzWMYT7hAaDLxEVibrSh0hfzNf6lOOy
 2o0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN+A7nhIWimOykYkS1gV4b65kcRhrYUn1gva0ahZhNJkWZ9tfF+bgUPp8Nu+PWygJW+W2ixamPt70qW9hT4RyHYLxN
X-Gm-Message-State: AOJu0YxB9K7dVs313UpvKHlbnW1h7oRw5kEKOJOdihJ4ODbgwCpxBysd
 /wxauoHChRo6sz5vaRZ64hFsQHvR8iBNXLv4al4MIYzgCuQ8YIgVZctE0sXgIek=
X-Received: by 2002:adf:fa4d:0:b0:34f:fd71:9af with SMTP id
 ffacd0b85a97d-3504a73edbfmr6780716f8f.39.1715599617085; 
 Mon, 13 May 2024 04:26:57 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351b79e8e6bsm3274119f8f.65.2024.05.13.04.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 04:26:56 -0700 (PDT)
Message-ID: <93836d9f-56b7-464e-84a2-a101ca78e360@linaro.org>
Date: Mon, 13 May 2024 13:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/rtc/ds1338: Trace send and receive operations
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org
References: <20240513101108.5237-1-shentey@gmail.com>
 <20240513101108.5237-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240513101108.5237-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: PbBDCS83YxV+

On 13/5/24 12:11, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/rtc/ds1338.c     | 6 ++++++
>   hw/rtc/trace-events | 4 ++++
>   2 files changed, 10 insertions(+)


> @@ -134,6 +138,8 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
>   {
>       DS1338State *s = DS1338(i2c);
>   
> +    trace_ds1338_send(s->ptr, data);


> --- a/hw/rtc/trace-events
> +++ b/hw/rtc/trace-events
> @@ -22,6 +22,10 @@ pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
>   aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
>   aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
>   
> +# ds1338.c
> +ds1338_recv(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] -> 0x%02" PRIx8
> +ds1338_send(uint32_t addr, uint8_t value) "[0x%" PRIx32 "] <- 0x%02" PRIx8

DS1338State::ptr is signed, although being an offset, odd. Using
unsigned in traces seems better anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

