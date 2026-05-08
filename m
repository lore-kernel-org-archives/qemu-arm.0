Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C7CD3436
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 07:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLG6p-0007HR-IL; Fri, 08 May 2026 03:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLG6l-0007Gy-Qn
 for qemu-arm@nongnu.org; Fri, 08 May 2026 03:58:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLG6j-0004Mm-9j
 for qemu-arm@nongnu.org; Fri, 08 May 2026 03:58:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so20152775e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778227127; x=1778831927; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cL85ZpwJPDNm/wyL6w34ALJiy8RLWq1D49yEYjKqMl8=;
 b=gGC8/BnW92OniPaUG68yjybBXxl/FWQHW9TkWTK58df7/4OK5BGCRCinDpc2UtZufy
 3Lx05gj61SY2dDXujqiwV97SrcBSoaFyGeFslD64cKHswHdBtlNuHnswmz8ETll/cxZQ
 1Gucc8CbL8I7xi5a71tpcMQHmE5tMXK74lN+k4BUEDdlp4dCFqfNujAgIU52/bL/sY1l
 WbzM3UW3wyB1oBb4KBMPA8QUkwWEuex+u54m5kM2cg4wE4zGLIZtrX+i2Oz/MMoCfc9t
 naXfL9p8lnZwFxbPGAPRyz6K+LvSzD9L2dDSQj5PDJyhgzvq/UW8RC+NQ7YB584hxp58
 MwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227127; x=1778831927;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cL85ZpwJPDNm/wyL6w34ALJiy8RLWq1D49yEYjKqMl8=;
 b=F2kz5A0wG884GFhtLKxuyu8coAzev/pM8BjNdAG3853DJbnoLR4zdIgyMaSxMRCh+Z
 puN9rmlV0CRTKWSruGFGxLYlcBhZTkdpw0P38PwFCrESG9Q92wJ20jo2+qapdFjQk2Y6
 cKk3VfMbDgZQolhc1JZDNPZh4Tl4HDrnlMSPC47cb0SSPSmdvj6KFFkvHrSxks6wnaeF
 orrtB1nx8l7fqtmGC0dJG0vBUOln56ZTJPzlKeVznoLC1YY2Sylf+qY6vH1z8QR1GbMh
 hPbvKxCU51HMhXVJGCUB4bc6+BIgidHjozkxqYhh/H6D2EPB54fzBkqGzcjPgE6n92GT
 pJmw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ln5S567VYiOI5tYMNgM86fT5mAT9zV0I6+Up/QV5GYzWXvKVqd/h8rFOGyVOFfZIGGnRmIXDuKg==@nongnu.org
X-Gm-Message-State: AOJu0YxKTCVwvQs9aqYzTPgbNbtBPYtI3M8DxHqkEHXy36Hdw20ZpF1G
 TcTWxaZ/4Cfb41BhwjOFMYjQPp8whlGQ+6xFILVlk4F4bDoyJagvDtOb0sv9b9fDBXQ=
X-Gm-Gg: AeBDievJYsWmGLMZEuZa04fBl7FQK4GDMSdb6DoW+oD5S/HYqLA6cItaUSRXHGqz9eU
 HfDMZe1ZANbzjMEDlnujmIZFZgCHPQ7zAgj5cYQx51I3LXrrbGSS/RuyFqhmC0VLFciqr/Cu7v7
 VedgsqBR+AivqPcrTYtGceKeiyzxLEE4oovMTiB3p8FyW42ZnshBxSK5C2Z5PM/e55XulBiO5Jb
 mmM40PPLhz15fG60ddqN8sKRo5PL0Ljfs9yaqk6gz+szMdloQuiSISNljCR1X/6E8evttMWX7GS
 AlesYY+uc9qT9AtUCTKmujGpUuCw6ndFmgziqjwz0bRVHfn9NZkfhF/ApGfAaEtNfXi7psn8Z/7
 cAhq/6bel7El5X/Nbaf5p3oxuLy7XGlUNVWjjfcTYJQrh2GuzMFZ+iXt0wMnr/MU446cUiTfgTD
 8IzODeOsI37/BXM2lUGj/NlHq85VYusWKDDdSjrzFssvVS3paFwuvbGXuQNr5dL+Y9
X-Received: by 2002:a05:600d:6:b0:48a:52ee:5776 with SMTP id
 5b1f17b1804b1-48e51f28ef2mr136820005e9.11.1778227127325; 
 Fri, 08 May 2026 00:58:47 -0700 (PDT)
Received: from [192.168.0.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a68ebsm2339074f8f.1.2026.05.08.00.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 00:58:46 -0700 (PDT)
Message-ID: <c45c1333-7af7-441e-bf44-2ee280c0b60d@linaro.org>
Date: Fri, 8 May 2026 09:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] tests/functional/test_hotplug_pci.py: Require TCG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260507194728.2034696-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 7/5/26 21:47, Peter Maydell wrote:
> The hotplug test asks for the cortex-a57 CPU type, so it will
> fail on an AArch64 system using KVM where TCG is not compiled
> into QEMU and the default accelerator is KVM:
> 
>     Output: qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> 
> Restrict it to the TCG accelerator.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/test_hotplug_pci.py | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

