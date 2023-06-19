Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2718588ejt;
        Mon, 19 Jun 2023 02:54:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mIh912Dj81NHosw/iTNwLX15qMfYFMDxc3UixUifqg8+jmJYqVV0cOkOvlhZx1QaU11jK
X-Received: by 2002:ac8:5c91:0:b0:3f9:cb01:9dae with SMTP id r17-20020ac85c91000000b003f9cb019daemr10994269qta.50.1687168494983;
        Mon, 19 Jun 2023 02:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687168494; cv=none;
        d=google.com; s=arc-20160816;
        b=zkAb0JXccD3AgcFr37G4WOxL0rE15J4bOLzViejTNJS7QHMxqmu1mExBKAMFfANfz7
         sIYWyEzHdYP+sY9atSMSdAsuT6+HdcXwe7vWeynfdszWoZn/qdcQ3ihgNRaFqNpJrpGw
         unOCXpUEERmvy+2Uv4TFpZORxjQJr4Y5Q/NqrL6Z5CMPPD8lNKmEYEiyeLhBdKTKZAQt
         ZgJSSbqrAMLQwSnuziUtshZADwAjJH8rvE4gqHQJnJsh/PfBZCg8kNj8iWF61q4qrXP1
         FrjqsAIfBiZcg/hxUxE1al2O7s3xKQIJv9bzyYzF1mag4pR1JV+bFnRMu94BYqEcE7L4
         JWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bJC0ZOYLGGFywn0IevTM4EiGvprzqsGKkYPh8vZdReE=;
        b=wHfJf2pgn+SQowxEKwvfEYQn0SfKu/mEA1Jt5RVRUyXimXkQy+OGBA/0CyHokMLU2Z
         54JZsvdqn2eo3qkWk8jcP7h+jS7zyZvnpx1pqWXdFuG0IwJco2cfBymTt8JY0EFoN+Ct
         dBvVmfuX/3aEkWN2CXlBopzG5fFiZ3uPKWPzb/DBH/8jUuZPfdtuN5RkHPuK+wk2YpEz
         QmQT+Vo9QGfTWwjt7168+T1SSlFBaz0J0P32lgmS60Cc+fZcYgCDiZ5Gt+IA4HVQXUIW
         ofIvgfnzlRTmbQTi5gObt9A6llRK3tq1+euaNoLG0QBgJxGbnKvatRS1HK1pK7eF/9Vm
         OmHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0tKBBx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020ac857cd000000b003ff22859f9csi394426qta.381.2023.06.19.02.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 02:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0tKBBx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBBaO-0007eo-Ci; Mon, 19 Jun 2023 05:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBBaM-0007eO-W4
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:54:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBBaL-0001ko-66
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:54:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31129591288so1590168f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 02:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687168447; x=1689760447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJC0ZOYLGGFywn0IevTM4EiGvprzqsGKkYPh8vZdReE=;
 b=u0tKBBx+xTt6DgsgNST+/7XmY/agvl745Opy0/9ZI+mmQVBLHZJ48WLMNU7H6qLm4X
 gJXc36SxNXT9OarsMf3+Xm0Yh3gJ9Z9nX2cRQOnRvYobsC2sqaURXHkCfr2NET1gSsR3
 kQ+9Bhal4BU2CB1u04qL3a63fSpi8Pve973FGKE+ZsTALQpTcvAQQ9eMJXPO54UlVLpP
 bZtUdm9p7TzIZLNfiCbAeyinTHhHVARbOrB2HLhPm4U02s1cW5/Pq8Ac5MRn1ZM+t/FU
 UwDFlxILURgtXZPutTg0FrppEoRPtlif3C0XtaA6dPPglWP93DDgRHweLpS5aUNDNXqy
 vFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687168447; x=1689760447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJC0ZOYLGGFywn0IevTM4EiGvprzqsGKkYPh8vZdReE=;
 b=AsS10M4h6ipd55OIeX0J3+27iMzzlDHzbrGlWTKLKzfO0V9A652BorcyELXNiHizHi
 LtGtsIbTnAvWHlvAIEox2G+vNnHVOJuEYEbRaSI6Wx/bxlm3Sxu1fpApSWHGAdRiKL68
 Wi4ZtNwXacn6AvEid4oFn7aM4eiA+xXWfb1j1ueG+B2YoIkd4LVOj1X8f8zLWRYoYpKu
 NHNKe+acOqdU7vqyCOvoI1R56iJM66q1dyBWpoPo9586Cz3naSlEAQUB0Y7EG33oORlf
 yOcYc/jpkzkdPZILP2/7nV5Ud2Man7Ee92XNrhzaRlnUFWKlQ/s3dVmcSVNfY70+cD8q
 2xpQ==
X-Gm-Message-State: AC+VfDzGqSsA7CFQwOh0Zue52w4TQn8iNOpFCM41EkTE2Y7HDz9VpVnc
 oGSAQ40bW/ILMDMHL9WhfLD60Q==
X-Received: by 2002:adf:f00f:0:b0:311:1120:f298 with SMTP id
 j15-20020adff00f000000b003111120f298mr5658059wro.1.1687168447515; 
 Mon, 19 Jun 2023 02:54:07 -0700 (PDT)
Received: from [192.168.69.129] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 y3-20020a5d6203000000b003062c0ef959sm31037711wru.69.2023.06.19.02.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 02:54:07 -0700 (PDT)
Message-ID: <ece02116-0041-ca15-c958-eb989156d854@linaro.org>
Date: Mon, 19 Jun 2023 11:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] accel/tcg: Make probe_access() a generic TCG helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230619091901.51607-1-philmd@linaro.org>
 <20230619091901.51607-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619091901.51607-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: cHuNUp+m/kLD

On 6/19/23 11:19, Philippe Mathieu-Daudé wrote:
> +
> +void HELPER(probe_access)(CPUArchState *env, uint64_t ptr,
> +                          uint32_t access_type, uint32_t mmu_idx,
> +                          uint32_t size)
> +{
> +    uint32_t in_page = -((uint32_t)ptr | TARGET_PAGE_SIZE);
> +    uintptr_t ra = GETPC();
> +
> +    if (likely(size <= in_page)) {
> +        probe_access(env, ptr, size, access_type, mmu_idx, ra);
> +    } else {
> +        probe_access(env, ptr, in_page, access_type, mmu_idx, ra);
> +        probe_access(env, ptr + in_page, size - in_page,
> +                     access_type, mmu_idx, ra);
> +    }
> +}

This works if and only if size is <= TARGET_PAGE_SIZE.
This should probably have been documented for Arm, but
should definitely be documented for its new location.

It looks like this could be used for

hexagon: HELPER(probe_noshuf_load)
s390x/tcg/mem_helper.c:void HELPER(probe_write_access)

Although s390x is written to handle much larger SIZE, the maximum that it will ever issue 
is 16 * 16 = 256 for op_vstm.  But it also handles target-specific address wrap at the end 
of the address space, which the above does not.

So perhaps it's not worth moving this after all?


r~
