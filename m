Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FAECD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 10:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMkgW-0002Ih-PA; Tue, 12 May 2026 06:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMkgV-0002DW-IE
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:49:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMkgT-0008N5-SI
 for qemu-arm@nongnu.org; Tue, 12 May 2026 06:49:55 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso49438825e9.3
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 03:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778582992; x=1779187792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w/rAUHy5Q47gybSESJJWoqR13PpzsY8CoUQJphBxxo8=;
 b=ORFk5XHRelXRXc0DwSSZ42/VfG2jcsl+VtMrSZpwyK733wbsJquBr/pV6ar2G+Vgp0
 PkguiL54bV+cGFX/3z5cPP/gtB5SxUoz65sscf3FecGB3EkOfp8Yd0eQlMqFdd+Rwfsb
 oQ3mpmlHrQxCuE/ikaD8TuMqiIdydgmVcbu/xhVJwfsNnHcj6W1+Jqv8dRnk3mf8kivr
 1B1wo61v5S7zop+9QTjLWtECKOcmIR9PIndSaRFNNVoJxjzzrAB4rjgGdhT9xbDKvzYw
 T9rTqXXzyEecUmTlfo8XxqVaOz1/GFyxi0NNMIm+PXeau9l1teWzVTBqblpJ8nxUN/uY
 0oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778582992; x=1779187792;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w/rAUHy5Q47gybSESJJWoqR13PpzsY8CoUQJphBxxo8=;
 b=h/eSs99csDTBQOApkSATX9DGNNsY5yYFpsa+KwPzbHg22SQvSIZsEVtPneOW9W53wd
 B1imNUI7o+hc9FdqIGkVahJHxnuVMV7kErLDaHOk4aNHCm9QZUMCDBP0Fch+BOCPYM+3
 CZir//NTEWtGKu8cWyOEgQLoTbz7OyIrIy5eh4t01e+yXM2pCwi9wogRmmkX8bWzvKO7
 c3fGVGbXf6AN2bCuDLv1rSAgSD1ju2DXhT6MrgnlMwIvFf2m7z4GpbiVEri+ITdaKyu5
 XNBoc18k+mSVNs5VgFXiMgD0j3M14YZ02eoBf7Y2Xg2E/1D9Cmz67GR5R1gofqwdXRcG
 ijyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tXYqJKyeRO9LNbFKOBw5+2ItaG0xUJyxj7SshqwaBlGKM9F//exdewVjzEHajDGcMVZFsjAKEww==@nongnu.org
X-Gm-Message-State: AOJu0YyVWcLMNRi69cLAwFDd2liZMBWUtEeE7rUgZAme2cP5ng++7p14
 nZMaflLgkC1HnlvzY1yJnCKKY7xhhs44UJKpRG4gZrABo7KGcGPL0q1xkU0b5e6kdZN/qsmGz2E
 /9D99fS8=
X-Gm-Gg: Acq92OGrEh3cTyILZ+q/HAqzQnHx2tbi3xzZMkaC8jZGmST/nQ9aMgf6FJXijXNgph6
 H6vHquvQTJ0ajcc+S+VF+r0wIF3o6CrmOCuN391c4miNvRnCtDHltWUBakkTPLAg6f9zrezjEY7
 5J+SPIhbFhQZmGpY3yHbtA3/2sVt/MxvIX495oT9Xl9AccDgS+uPrNvmd7VMHxL0+HSdSKfkqio
 bL43CibMvHU9NWw9WAoQ303SEqQ57RrqZXvKSRTVzREwulLDy6nnOaoSp4DDOhRMyKofaCBqG+o
 6pNlmdb/wUP20A6JIiniMnNQU6HW2SVFqO6qh5HaH4lQWbu1kZOCySu/b/eNNRKopV+pv5TqIYc
 R1Q8mqw8a/1Weh3GLg9MXbQJkf16odOsEwDk9fdBWTKzcQIfkPem0KO1e+yUfbWJNTwdseGI0mb
 3egsFc/umixrizdTQKU3EINhMbLiyaH6tACh3DiCOKUGehLyjpAs9t0hhVdX14KgkcDA==
X-Received: by 2002:a05:600c:37c6:b0:48e:7f22:d90 with SMTP id
 5b1f17b1804b1-48e7f7de432mr155431275e9.4.1778582992160; 
 Tue, 12 May 2026 03:49:52 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e62a2desm17111615e9.9.2026.05.12.03.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 03:49:51 -0700 (PDT)
Message-ID: <719b50e1-40e4-4e56-9837-9f205912bd18@linaro.org>
Date: Tue, 12 May 2026 12:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/intc/arm_gicv5: Avoid NULL dereference in trace
 line
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260512093856.3197700-1-peter.maydell@linaro.org>
 <20260512093856.3197700-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260512093856.3197700-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/5/26 11:38, Peter Maydell wrote:
> In the handling of writes to the IRS_SPI_RESAMPLER register,
> we call a trace function, passing it information about the SPI
> being resampled. However, spi could be NULL if the guest tried
> to resample a nonexistent SPI or one configured for a different
> domain. Move the trace statement inside the "if (spi)" block,
> as it's only interesting trace if we actually did a resample
> and potentially changed the state of the SPI.
> 
> CID: 1959593
> Fixes: 33185e1d64e ("hw/intc/arm_gicv5: Update SPI state for CLEAR/SET events")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

