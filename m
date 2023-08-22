Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp68083ejb;
        Tue, 22 Aug 2023 10:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP1sOvwJs8Lg6q4FCuoGdWk5wZtgarEqUi++Av5QMRYGxIVLtPHZu3ehvkSy0ynTixB210
X-Received: by 2002:a05:620a:103a:b0:76c:af3e:3c14 with SMTP id a26-20020a05620a103a00b0076caf3e3c14mr9340160qkk.71.1692723609270;
        Tue, 22 Aug 2023 10:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692723609; cv=none;
        d=google.com; s=arc-20160816;
        b=okVBajIWwYMmNVHjs4UAjXPhqdLnMxViXFw27aqnNfIdkICVZG3uDoDxrzfPNd+iia
         49a4fdLJYbx6iNpdzAvDwcVKgqL5oiv1DCjA1xgv/7Sqf7UreikDdh3sCCs2cKZsKdqs
         VzVVxdCg0cvrFS1tIxA4cZ0N3d19Lss8PXb0hSEl+DNw/i7hexBzBZ9AaCreOb4WNrdQ
         GJNAwLl9CcieWJil8SDGnVIfGZrjQT5T8ZD7RZGItQdyxqwKlHy48FGdXN01Gg6NGwYQ
         95d4mdfMHk3w4pcxtEx87we/t2GT4UX+e+X+UkfSH+KinqOUoGSpBFdDcKlk6jA0+KNN
         en1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d5EiyOtjkFWhEXmiGZr2TZhRa6ZUbgBpd7EpYLC+TAA=;
        fh=Nm/YuZ1JM4/kTJMP811600i/2wseoO698SHefoqD5nc=;
        b=l6mo7wbT4qUSHNNcwZBAM8EmzCaaHeosG7xJZHt28Mu1p6sBSU+fhkY7B4WPImle4x
         Qr6B8/JTjb52dMrJ0BU0cFe1YGA7zTpOn69hvVIoBGWXF0zEN7L3YLPsxrDuscujMwLF
         Se3JFD/9ZF6k+PKdPs/geTQuhbTpV1qSwNWR2GgnHSZqWDKfaS50iCw8hwVAAml8Yv82
         pjBOLJKy+gLGU/50rrbCMe3GX7K6qpw1UeBuKbf9GV2EERC8cef4wkpCJmzzOdjVkg8l
         aNWSd2ebqxPwVOQ04YHr4xeRzoXDcoGrt0dwbP6xICPHQ9dEIblD459eYXrT0IFqRU9a
         7vKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VPzUTKNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs14-20020a05620a470e00b0076da7964f3fsi3063557qkb.286.2023.08.22.10.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 10:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VPzUTKNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYUjH-00066t-WF; Tue, 22 Aug 2023 12:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYUjG-00065D-Nk
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 12:59:42 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYUjE-0001gm-Hs
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 12:59:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31c615eb6feso748410f8f.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692723579; x=1693328379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d5EiyOtjkFWhEXmiGZr2TZhRa6ZUbgBpd7EpYLC+TAA=;
 b=VPzUTKNfBWfGS0WRi8vhpOFf3PfpG3maRNIc8zfMJ+kyJBj1v7mM9DaUVgXIgoQVJ1
 CXZ2LzxGS+Ho5+NljxydLuls+lWFciKeBWpldLMkUr86Nb8kBqYgQsLHsjUppHPIG48C
 stcNY+z2Tv/grtOWmY8udHV0UWlQEcX6S2x9l+4bV7GXwkPLsWwh0eHZuAjejDvXm5NC
 W36kMCflXLz4FSzu3aX6kMiFhlQ26X/jxz5IONJZ53mfkCFrelTG1SX+McFVwbSzppTI
 l052QfqFYQ/7upTBiYZVM04QafY2j3+9r6Wr3A37NMK2aoPkpMR2MT6cgwfap61YaOzH
 CLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692723579; x=1693328379;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d5EiyOtjkFWhEXmiGZr2TZhRa6ZUbgBpd7EpYLC+TAA=;
 b=bx25w2ZTbiEcaD7DaNO6sqU57VZNtITEaljCZFA1Jt3UzpW6na/p+1dWJJOPT5p49i
 HBa0qvPEGIX08pgJDUsvw/5rKDwgIDtDa+8J+33S0aZLtusP1Ty+lRBZzu4hKwtepAxU
 ziqGCjjRjIf1N1BZv9RpFPxM2yo8J8h4JurCUePDUiHQXg22XBvQVBgNKLXWGPcYxLX2
 o/25jdt60MqZi1shFfyN07WDJiadEa7lFjdlQOI4mwghXgAhxP/ILqAz6WhKEX3KKSPs
 xkdXMcM7it+giXkqAaIkcgiEgX6MVO7aGaVAedc0UnYqxveMAyALN0O/H41i11jiBjqf
 kiaA==
X-Gm-Message-State: AOJu0YxhsOZr5yS2KibnbdvEWmjHSFXVaoxTFkYQQN0aK3guItYByZ2y
 mMCRv8eq/JnH7GMAv/3Wq70fDg==
X-Received: by 2002:a5d:65c5:0:b0:319:7c07:87bf with SMTP id
 e5-20020a5d65c5000000b003197c0787bfmr8333644wrw.53.1692723578856; 
 Tue, 22 Aug 2023 09:59:38 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 c3-20020adfe703000000b0031773a8e5c4sm16353831wrm.37.2023.08.22.09.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 09:59:38 -0700 (PDT)
Message-ID: <0e9b1e40-801f-c7cb-97f6-e75a98bd9545@linaro.org>
Date: Tue, 22 Aug 2023 18:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 12/12] target/mips: Use generic hrev32_tl() in WSBH opcode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822125752.55328-2-philmd@linaro.org>
 <14386aa6-8e00-8792-ba7d-9d93c3c35baf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <14386aa6-8e00-8792-ba7d-9d93c3c35baf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: rz3e3YPfRLG3

On 22/8/23 17:42, Richard Henderson wrote:
> On 8/22/23 05:57, Philippe Mathieu-Daudé wrote:
>> -        {
>> -            TCGv t1 = tcg_temp_new();
>> -            TCGv t2 = tcg_constant_tl(0x00FF00FF);
>> -
>> -            tcg_gen_shri_tl(t1, t0, 8);
>> -            tcg_gen_and_tl(t1, t1, t2);
>> -            tcg_gen_and_tl(t0, t0, t2);
>> -            tcg_gen_shli_tl(t0, t0, 8);
>> -            tcg_gen_or_tl(t0, t0, t1);
>> -            tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
>> -        }
>> +        tcg_gen_hrev32_tl(t0, t0);
>> +        tcg_gen_ext32s_tl(cpu_gpr[rd], t0);
> 
> Ah, you did want tcg_gen_bswap16x2_tl(dst, src, TCG_BSWAP_OS).

Got it (per your reply to the cover).

> 
> 
> r~

