Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA21C87FC9
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Jul 2025 19:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugq4P-0005j9-4K; Tue, 29 Jul 2025 15:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ugo1A-0002sg-0e
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 13:21:36 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ugo18-0001js-0k
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 13:21:35 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso6880473b3a.0
 for <qemu-arm@nongnu.org>; Tue, 29 Jul 2025 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753809691; x=1754414491; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o36SU+/RYcs46FtNHqIxijN8wE9mQm+I9M4/VJFNRoI=;
 b=V/onMolW9bMvtW+jzMOHNwqc4p+bejHq2blFSbyOcm//9/t7tthGUKa+3R66ilx+73
 d0kSomFCEvS7ejidaAhx+9+6J9eED49NQ+IWpO1Vqan1WuW0hEjlRbT3fuCIjFIPuwnj
 Zxxm+V/DkLYAETo05B90FItvcVSW/sxjRg9ugjYzQeVRaQuq34vuhb6I5aELebcUJJiB
 p1DmFaqjk52IdBdkdKOP0bKm75xy6SSzUjvx5WrbQuYd0B8tUKyPxhSHId8lDtlq33Uf
 v5feSv9EzCTTiQ/gWCErfXVJ/36MHz44Qz2XkQP69y151RsSFQvZxOH2jAlrgyw2UJzA
 gmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753809691; x=1754414491;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o36SU+/RYcs46FtNHqIxijN8wE9mQm+I9M4/VJFNRoI=;
 b=f8G8WzbyBT6N/qHkjlMQOyqNuXSlfPNpuXvrwtChvCQnEu3WZOWW5f5FQpL0RgBtbD
 GmSUJz01prgtmPbFdnvHMYBBHKqgaG7HubudWfu4Rl9SCv4c8TRYI45vPmBDbbgBfyjd
 nILX/e8/xHg/HKsSC7MoQRwPnCJRw5iRPEvk+/ovZJa6Sjtlz2tLS3vZynYykLzx5Arl
 CRjtQracdEQZFNKZKJ/oDpcyc7+kCqcr/OOR0LkbSR9L2rkymeGI0rYy0Ryt3o4ny36P
 /en6rr0hk3O4FQoA/oQweT24sSZHdvdIiXcvDOiogg7lPsraKfloHYrJUe770dsbFN9U
 PD8Q==
X-Gm-Message-State: AOJu0YwfjWOhyhKvqO8ba5Q3+Vu6ru1OpexFjiblxuZJy1hN1V2z82Bi
 8JT0ZjWq3jJTzLewpfH/h3Xrjd9hk1MHsKHd6NdI4O8+sIn7Woq25AZ/YiF4SgrIpjg=
X-Gm-Gg: ASbGncv7u0fTv/QG0m11eI3sVvVmmJaq6K1njDwu1ELOV0gRAxYb8COuGAm/3AySs/H
 1UUXWFb0XhCGwhwIFJGC8TxRjQ7Nm7fRXs46On8pLQcSesUlhQ00IXONZqzglj3+EEz3zbZJ0+1
 Hlbih99LuD6nSI1sf9Wzz2cBoT8fGV3gKtIzzNsVGIvT/b1P94K4VLLIZQ4zO6Y6Olo5X2XJmTc
 +B8ZxcqRsbWyUEFruAAgoRt2uuRrkIaTbLPRHHogQdm24xJ9yxIF5xi+ZLo9eMqJRoQ2j9rD+Ts
 GxnOozHHuQYfrsiGLHKgeual8exqKdn6cVpl63avEFXcme/mTTGGgTv7pdcj/Qj+Nlc1TQ6MqCv
 BOi8/secg6uS+w8sF0cU0SZGPlIkTjcRhXguS4Ri+z6mXcNxSwtraf+p1WtFJ0LnDw0lRZ+nFXu
 2mfg==
X-Google-Smtp-Source: AGHT+IFdcb0h4DkzNFFUajGH2uguiqxR1rddOR7PsqYQhVTcV6zxSK2V+xKJ4by02fSwsCepIPrz/A==
X-Received: by 2002:a05:6a20:6a10:b0:218:59b:b2f4 with SMTP id
 adf61e73a8af0-23dc0eb2b8bmr312783637.42.1753809691418; 
 Tue, 29 Jul 2025 10:21:31 -0700 (PDT)
Received: from [192.168.4.112] (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7642db46f00sm8306446b3a.109.2025.07.29.10.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 10:21:31 -0700 (PDT)
Message-ID: <c6265c03-1eda-4a5b-92b7-c70e2514b5c9@linaro.org>
Date: Tue, 29 Jul 2025 07:21:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 46/82] target/arm: Implement FEAT_CHK
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-47-richard.henderson@linaro.org>
 <9209927c-6c5f-4499-a3ef-1f4c70951ad0@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9209927c-6c5f-4499-a3ef-1f4c70951ad0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 7/29/25 06:01, Gustavo Romero wrote:
>> +static bool trans_CHKFEAT(DisasContext *s, arg_CHKFEAT *a)
>> +{
>> +    uint64_t feat_en = 0;
>> +
>> +    if (s->gcs_en) {
>> +        feat_en |= 1 << 0;
> 
> I understand that CHKFEAT is currently only tied to GCS but will cover more features
> in the future so we can keep feat_en |= 1 << 0 even if it could gate TCG andi directly
> on s->gcs_en and do andi with 0. ok.

Yep.

> 
> It's curious that this instruction is tied to x16, it seems easy to use any other
> general purpose register to query for the features.

That's because the instruction is allocated from HINT space, which means that it executes 
as a NOP on cpus that don't support FEAT_CHK.  The HINT space is limited, and it would be 
wastefull to allocate 32 such insns, one for each register.


r~

