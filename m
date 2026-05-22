Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBADCD5BAC
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 19:50:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQVsr-0004RB-8L; Fri, 22 May 2026 15:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQVsd-0004Mb-JS
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:50:01 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQVsb-0000Pc-Mb
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:49:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-835c98b659eso6592045b3a.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 12:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779479396; x=1780084196; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IU2Z/7Mtw1iAPnCRPkdDT6nCxsp+1JhA++ESgoadG5E=;
 b=qIUf7Z+95g1DxXzk0uvtMx7OGkWwqYbOA0oT7D7a2ri31RH3WrY8v9naICRXTeCrMp
 TzQSIrJkZ6Zpnjm4aUgQzA7f6Yio+pfyV7TJOAQnWrbQiEpoA91emGkvUBbTzADzFFOV
 F2xMKz98nNdvgpMlIzERG/AxKS8XHiP0j5N+/cqRZL8mUVZAAB0Ebwo6y/4/vKPhkUlF
 yMo7wVgUIO1ecOeFfiytbJAEY+tP6FyAvTReZePcai54JcJDqHwAxFLAcCT33dlwjp7K
 uBM57VcBb/k6CfCXagmiDRRNJXGSM5cHDxdAYPqhmomP5Zo5Q3Hb7d6Xoy+yH7fRawz3
 kiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779479396; x=1780084196;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU2Z/7Mtw1iAPnCRPkdDT6nCxsp+1JhA++ESgoadG5E=;
 b=UtblK/s3lPYiVgzusvMDY/rFUzU+1kVNcEf3hYDVEw+CQOQsrSUTfSD3oINGilypYF
 3akhJ2Cv8FTdUH93NFmd0GDoI6H805pN0YdPPFRIosEi5tIeuGilPf3HR8fN9I7HT+vz
 LuyaNyV/QkupLxj/36ebS/fkaWQHTBi4ZA9TWderyKL32GghZN8eGWZP3jSnVbr/JOac
 TkCdmopYjLfLYsyrWx/f3Mv84U/+mwMB5tR0s98wJm2RaqUg+GphRncR6QPxQ0kK8nRg
 B8oSuuQSQcas502vYDwLRpXeSfDo+ZH/Z1z+lLBta2wZ0YK5/dysHn8FUb3mGT74LGmE
 oSlg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j6GYJ5cr5Fg5qQRNQLcI9Sn9h94VjLlXHqhRXL0DlpOGIwh2e4GhVRWLOYTJb+9BN3G4XJEvjPA==@nongnu.org
X-Gm-Message-State: AOJu0Yz/nshgs1qfReVFuANMPLtfC0IWXdKd6urFlqsKePeqmZ+cdR+p
 P/H6J57YRudNeU/js5CaDBvuUSJkhL5GUMXWhmfAz5Fg59ZiTU9n8jhNaicCOwrQvZQ=
X-Gm-Gg: Acq92OEWhkC+Kemvi7zUpcH2ophqg+q6xHwgqxDpFf8hgOg6cMNJbK9RG2gpvb1D8dK
 vlReG1oQQ/z72gIOot2U+R4U730GwCQzHA6VZ33Bbkl8a9p7XS1bri0HYP6n3Zr2i27DwJke8oa
 Ojl8BgYjicMiVqORAV7FW5pxdBt/YVLryZlTepoDXYdCQd5XH/6mL8HjHGBCbPqLJTGAtDPXfp1
 jW9FHp3VptGZoH4Yy6pBVoTG9PHKKEwLVmE3+fWeC8USeFwEK0nQmlDkW4ts6pGEy8emNU0zV+P
 lvP2SfduM4cgpekWoF7YC+9G85JEM7RK7dNXPVyXwnvZHfoVzC9NXFuyiyz/o5uGCOtwOPdioFY
 XTnyIJfGj9o1e2Cz/S/fzsMQfDOi2Jry5QTUQ5ZRGR3YOlOnOAHcMjKig+Hget1kBmVxnuRL5NL
 6Xst5H+wMp4i1KTx0e0cAYAucEjBM71K/SiU+cbkBpRuI/yKiH/q0=
X-Received: by 2002:a05:6a00:a8c:b0:82f:2a78:6302 with SMTP id
 d2e1a72fcca58-8415f32dbdamr5154810b3a.26.1779479395589; 
 Fri, 22 May 2026 12:49:55 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84165003369sm3065340b3a.57.2026.05.22.12.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 12:49:55 -0700 (PDT)
Message-ID: <b9bc5136-41e9-4f21-8410-f53b6df3a763@linaro.org>
Date: Fri, 22 May 2026 12:49:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/64] target/arm: Set e4m3_nan_is_snan
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-24-richard.henderson@linaro.org>
 <CAFEAcA-KvaC0BVDFm6WPaGRLwHYVxF8UnPUa6SLK7utYJc8RXA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-KvaC0BVDFm6WPaGRLwHYVxF8UnPUa6SLK7utYJc8RXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/21/26 08:12, Peter Maydell wrote:
> /*
>   * Fully initialize an fp_status to the usual Arm
>   * behaviours. If you want the AH=1 choices you can
>   * call arm_set_ah_fp_behaviours() afterwards.
>   */
> arm_init_fp_status(float_status *s);
> 
> and have the implementation be
>     *s = (float_status){};
>     arm_set_default_fp_behaviours(s);
>     set_float_e4m3_nan_is_snan(true, s);
>     /* We want 0 for all other settings */
> 
> ?
> 
> Then reset can do
>      for (int i = 0; i < FPST_COUNT; i++) {
>          arm_init_fp_status(&env->vfp.fp_status[i]);
>      }
>      set_flush_to_zero(1, &env->vfp.fp_status[FPST_STD]);
>      set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_STD]);
>      set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD]);
>      set_default_nan_mode(1, &env->vfp.fp_status[FPST_STD_F16]);
>      set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA]);
>      set_default_nan_mode(1, &env->vfp.fp_status[FPST_ZA_F16]);
>      arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH]);
>      set_flush_to_zero(1, &env->vfp.fp_status[FPST_AH]);
>      set_flush_inputs_to_zero(1, &env->vfp.fp_status[FPST_AH]);
>      arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH_F16]);

I've created arm_init_fp_status, local to cpu.c, and which incorporates this mess too.  I 
think it's a bit clearer to read.

Setting the e4m3 knob happens in arm_init_fp_status in a separate patch.

> and the code we want to add for fp8 can init its local
> fp_status by calling arm_init_fp_status.

I wonder about that.  I'm happy to keep copying so far...


r~

