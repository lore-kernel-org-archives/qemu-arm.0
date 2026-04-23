Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1ABFDEE52
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 22:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG2dW-0001OQ-2O; Thu, 23 Apr 2026 18:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG2dT-0001NT-At
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 18:35:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG2dR-0004aq-1K
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 18:35:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2b2503753efso73125985ad.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776983699; x=1777588499; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6NiFZcaqLf5kzrt3369joPX9QrLDlvn7xZaRpzE+u9I=;
 b=hMrFuwZOy2AkwKO8L1sHIpguFIYchIuLLhOVcYk6OSWVAfyEdgX2CJjLkmSw+0GPDC
 W8uPWM17vADyA4b2i1b/RI1QIyr+ofP1ih9GHnub9B4gbZxKKAbIv7M77vIwREpkACck
 tAhdQetNeuhI8cEGW3iuJNY7Eir/MerBZUtpy6vM8GNN6jqYmTC1uT1eWPywR9WM6U2G
 kAfI1pUnK38n1SVVAbQ+XVrLB2D5dRaIxOTs8Bby9nKfmYYchUJarjc6wuLeq01JD2RF
 HUXPQmD3D5YmyG8j3OCRIeQmQZ+gbCQxwuuGwct1vnUVvQwbSGQxONdJCsNQmp1sNqQc
 xtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776983699; x=1777588499;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NiFZcaqLf5kzrt3369joPX9QrLDlvn7xZaRpzE+u9I=;
 b=ejfc9Mj2zpzTmvWwcC+UXCfwdUR+x665lLN50yE699eguSwylz6fctWaRg4plYJQAV
 uDR4QKPlfIdWqr1ENXUBk2F02itqYCTmrvwh6sTuFaIx39xC62xaZbyk5MRPbIyfrkkX
 zR5w/yij1h41k5zuWVCCzESmnIHj3oLc4/PgpsOxMk6Zp1F7E42Qsp8TQEJ6+I0oBeZx
 CNPi0Bf0e8zvgkJI/vbaSerA6xBMlb5gXsNeN8f82wdwKJxI925mgv2urejc5e0KL+4f
 rh7r47EZVO6iwr5qzl7oFvAwVgqekrFOBUnJ+r+7eshCYjOi99sWxdok3ng/cPZf+G27
 stXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j83/iRchRmw3UUVMayYbUXBpLx7Nbaju8T2+Kk0cRXDcEN1Qsjk9cduQRa+YButRA8JXKlXlO6g==@nongnu.org
X-Gm-Message-State: AOJu0YxTh7SllcLCf82D2Bpm7lSgXwxgmlzKcB2BLCqgie+XtqFepnGH
 pnWixFw3z8ticetD9y6mQsfmzg2CmMHTXl3CUzzq9rrVazWael7Zityh8odP/IJ6PRE=
X-Gm-Gg: AeBDiesNo+EiLtFs9fAObqNHB1mIH8ZEQ88u31dXS+ATRBE1HdJ60z/zPmRhUhEIg9X
 OEkzgAk8ZK8ZYKmqHGlVPFNreTHX+0DakIqs+zw3lHQtJdvFMVRH9AmA+w9OK0boPYAVJNo0Abz
 dOobRlKRalG1L9/CbWJKsGKKgd9FCrqh7K1AoqDX+iusKxUsXAoSc+ntcOVzOEgMyHsWLnAed41
 DyD+1iMc08t6RKUYrC4d0SVXmmI1P0Zsnmditx1QpbwPhartzVnsc+GhWW/Xdm6eDCavjfedXKU
 cuUbHEeR9/26Y2y19c3y/W4CBftOplPVLTC5XSo6mkwBJXfrOGdDEFmlBI3TAfcy3c3g6VpNRfj
 Tl0hGVFhcN7nJJ3NEICNcDXMxmQqQ4tgVOp4qppihwg1Y5pjLlw6sqvQP7W1/cdrZQt79OSrcfA
 XFY3jMkCyxBLq9A12ldAQ5oVugbcGnQeoI8Qf1+A9cXKc7H9rNHQ==
X-Received: by 2002:a17:902:ce0c:b0:2b7:88f9:9c3d with SMTP id
 d9443c01a7336-2b788f9a2bcmr148120205ad.12.1776983698546; 
 Thu, 23 Apr 2026 15:34:58 -0700 (PDT)
Received: from [192.168.1.134] ([110.239.0.232])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fa9ff729sm255218135ad.15.2026.04.23.15.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 15:34:58 -0700 (PDT)
Message-ID: <0f4e46f8-ab06-4d1c-bfe6-6ba89a94ee60@linaro.org>
Date: Fri, 24 Apr 2026 08:34:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] accel/hvf: Enforce host alignment when calling
 hv_vm_protect()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Mads Ynddal
 <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>
References: <20260423170229.64655-1-philmd@linaro.org>
 <20260423170229.64655-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260423170229.64655-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 4/24/26 03:02, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/hvf-all.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index 5f357c6d198..82cb3717750 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -56,6 +56,8 @@ static void do_hv_vm_protect(hwaddr start, size_t size,
>       intptr_t page_mask = qemu_real_host_page_mask();
>       hv_return_t ret;
>   
> +    start &= qemu_real_host_page_mask();
> +    size = REAL_HOST_PAGE_ALIGN(size);

We have read the page mask into a local variable.
Use that instead of reading it twice more.

Also, the existing uses of page_mask are to assert what you're now enforcing.  So, you can 
remove those asserts.

r~

>       trace_hvf_vm_protect(start, size, flags,
>                            flags & HV_MEMORY_READ  ? 'R' : '-',
>                            flags & HV_MEMORY_WRITE ? 'W' : '-',


