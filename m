Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp973410njk;
        Fri, 24 Jan 2025 09:40:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrBYTCWVq1vhUZ8TelWwiRnSzXDYIa5ciOFbZ0Yo6w4mYd6m2cZiIAGasbzoYxly1pyvJppI/YMdrbaw==@linaro.org
X-Google-Smtp-Source: AGHT+IFpxb1WndcABWWCNrsyPGUZ8x6H4K06bDRGsLbzGGcKiSqyJuQaINAw1Mhs9WaiaDoNW4ac
X-Received: by 2002:ad4:5c63:0:b0:6d8:9ef6:5b10 with SMTP id 6a1803df08f44-6e1b21b7b3amr527180306d6.23.1737740445118;
        Fri, 24 Jan 2025 09:40:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737740445; cv=none;
        d=google.com; s=arc-20240605;
        b=N6Jas02fq4w9V0yRvOyJRqTa3ZU6KbkcpAU1rLVZnsYcXk8ZoCn+P9w5Cg96oBRQKX
         TTtsRdbo5p6Vf4udtMR4sS9YzehoxC+qN7STouReVjd1c0wPEVwQcsB7uDjrmLam8PbA
         qfnzx3Uy0ajYUlCdwfLGrHvLI37ks+3FiKhVXoB4WaJDkIyN05J0LfRrJHR2CkwPXDV5
         ED4loYiydqPtOoTh3xkD6ZzEAnCAs0oWsZ9l9hb7SP884/RiJFVSTSG4nWFs1eeeNnh2
         kKiMqiEw+BHr5PxERs39Y+eDhF93iF+/ISZC/hFv+8H9x0W3v4aa8gTUnEdOhUKeXSH5
         xbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=whu1tYPX1DIKsEnegp1oH1/XFqeOkSpePtst4qKd65c=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=N6RsdjVqxH7XVS9zFECL+89Yf6PoNqvLTyHO+yb1NXFqEgIgY+n0XjB+FEkIOjAt4c
         Y0W5AMvUfXFtmH5/Cii0ql6/bcxqVfk2BrVLHvdC7A0PjBdN1Ejw7eax312LkDch+0Qg
         kXv1E4j1MVJIXTZyVsmvGLuOwu60pYbvYMGylrrvUdmxFmnfMzbF1LsAJdnvLSV6bB5K
         C0g/qGupIHWFLW5k+/FhYAFGESqvb41fFSMNTgOd05TqS9P1SmZcqWyaMuxn6zuiQbWq
         xfJfUmD55mK+4rgK4vWJ7mHTu4CX12418HBQgOGktX6GR+Zep81CRtH11wUYm/n7vrF1
         zsmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUSOScLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b67bd9si30796551cf.226.2025.01.24.09.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:40:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUSOScLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNfG-0003Zc-DV; Fri, 24 Jan 2025 12:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNfB-0003X9-8x
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:40:13 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNf9-0002oM-8g
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:40:12 -0500
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6dd1b895541so47015536d6.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740410; x=1738345210; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=whu1tYPX1DIKsEnegp1oH1/XFqeOkSpePtst4qKd65c=;
 b=iUSOScLxsS9vdff47pKFjOPMwA2V0zrYo/1KVaTNtOTjT/g8Af1h9/jP1Au2BSmopZ
 LQ+666hCUYzdqs8TYmt5M00UERvXVQIOsGEuxTArQ2ibwFALFhFyzefCAkEoe9OGTQNy
 o9b/3yfqHWpFdi0JKFeuUHSDuSmpm0/NfhiKcBdQ8Z/rgb/ZxvUnDKowWjx4rFu0MsI8
 gSZPIH1/PofipD/8saYyiPwaS6bS2RFypwlELqBqfCuuDaQOReTKdnr0DlOUbPodvLlM
 fPh0sU4qnKZi+RiCJUuLR0/pSi6xwHdA7h27VBs05ztsbY5mpM6U/t3GDN+TFKzG1A7A
 kEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740410; x=1738345210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=whu1tYPX1DIKsEnegp1oH1/XFqeOkSpePtst4qKd65c=;
 b=l/hgyxu9qHNF1KdAo/D6HH0R7BdKpkDgmaSomhzq9Q98lQannSEnaot4tW6DR8LQlR
 foeyoyqwUM9nuyD4kl2zUjf6gT6THqdb5vRC1n8MHsqYzcto0/mjoTG6s1xi/D1VyquK
 wp69af0YvxXUIOf8x7GLk26go7sntYv79UNmlWTMVzzvqLq/uL1pdNA278re2suqurEj
 rYM5MN09davd1gU+OSxQsdp5s9Rmt0Icz23I99sNnNFKYC/K2x/9N41qhKGHVgbQJO9z
 B6iyveGvpeWW5Z8Ep4QCTeSPC8V19tht27XxcnCsMSf/RxzYFZEwK9NMffeTURV1y2iA
 Y8fg==
X-Gm-Message-State: AOJu0Yz4k98qLxXrumiBj6PtcRv2T6p6Wsvx4Yoh+AJ61xV+243eLNCw
 8lJrDbWHW3Q2EQsiBGO9rvoja2MaiZ8QMWS9PweyJ/pIEQwzzp7Vbj01hjD5u04=
X-Gm-Gg: ASbGncusqabiXOT9FOqjNwf+/WgA+dQhnW4cRTgX8UTWfcGj0Ajgd82A9HUYtZt0+SO
 3uASJi9pa4Xm4/jBoXYRJTlolary5GFmWpksi0xmLUgE1ffOy247GIBfRF+CxzK72JXpusiiJIt
 Z4dSDaCgPkmIUkarXOzkn1tcBIaSqktQw9/fPMXvRAVuCzGmBHS/OqEv8YcRna3IfIW0xdnefOk
 71Qi4NYobGvBmExW/E0LcE/Tluw0K2836zSeZI/Eg8adUHL95nZhnOnqf9psPzB9uXlo/L4MZas
 oEekIwn8DU/Lfb0NMx5OHuJiLCnyMMTddwbsw1AFUwXOmYltcDRNRSdd7ojMN6RtgQ==
X-Received: by 2002:a05:6214:29ea:b0:6d8:932a:eaa3 with SMTP id
 6a1803df08f44-6e1b216ef63mr483487356d6.3.1737740409823; 
 Fri, 24 Jan 2025 09:40:09 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2058c2164sm10442886d6.99.2025.01.24.09.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:40:09 -0800 (PST)
Message-ID: <038f15ee-73bd-4b44-87e7-fc3086562814@linaro.org>
Date: Fri, 24 Jan 2025 09:40:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/28] cpus: Remove CPUClass::has_work() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-29-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-29-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
X-TUID: ahqOapMEDFk/

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
> index 7b16bda2250..7f287984aa6 100644
> --- a/hw/core/cpu-system.c
> +++ b/hw/core/cpu-system.c
> @@ -25,12 +25,8 @@
>   
>   bool cpu_has_work(CPUState *cpu)
>   {
> -    if (cpu->cc->sysemu_ops->has_work) {
> -        return cpu->cc->sysemu_ops->has_work(cpu);
> -    }
> -
> -    g_assert(cpu->cc->has_work);
> -    return cpu->cc->has_work(cpu);
> +    g_assert(cpu->cc->sysemu_ops->has_work);
> +    return cpu->cc->sysemu_ops->has_work(cpu);

Let's assert this once at startup, much like we do in tcg_exec_realizefn for TCGCPUOps.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
