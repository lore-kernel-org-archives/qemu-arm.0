Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6693BC83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 11:54:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueY3K-0002YE-7u; Wed, 23 Jul 2025 07:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ueY3F-0002IQ-Qo
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 07:54:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ueY3B-0003pf-Hi
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 07:54:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so4682099f8f.2
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753271658; x=1753876458; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F5UYc63R13I0sB8gTeo4oXt3OJ3GV8nT4O74lNv6kpk=;
 b=CuDtv8gLDp3Xt6sid1gEqb9lf5P+CyrKyRKLnCyncVUa+Qz6VC3b1dUsm55xG7+EJE
 60GE6ZddKVj5n2Gsujebp0GTkz731+2Uu7Uo6EH05IOzzSiZU+ZC4gXIw3Elh507yI6C
 p1qhIcx3jKia5oI7egj0FSv6fO5i+uNazgvrzVgSZhkhBiJ2nATHULZeNAqM6dCsAHbc
 N4IJqMSD81KzwKjphWxv9c+Umvx0/kvmU7dbfyHgTrHvGUe/kh259odPCwI1ILS9/NUa
 Qw2Cj0juGpX9Rnw1Qm61XBu+b/kc9ljqby7uk70d5bJnr7FLgJzkVjIOhJO+5Zm114AS
 OTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753271658; x=1753876458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F5UYc63R13I0sB8gTeo4oXt3OJ3GV8nT4O74lNv6kpk=;
 b=f75zJ1WdlkaTHp5tO58GUKGL5fxKgrlRUJTtrFXS5Iz5qlRUNq2utuIpCc+6IcY6rj
 KGZGmB2cvD6kcmA489XiW90bPUOzKD14jQL3yQOLGwdNYE3YAGiNPVNFEHFnFcpHdST0
 nsdAaiGIYSGOoN0h2tZpq8yEBrjXfXFveRaTpttBxyt1WHOBjiKkdxD6M8z3C1u4CL9c
 H13KYaCoAy3jqNgbZaGyOgF3T4Baf2F8+u1ItWEgeiAd/dpJkCYKSoMT9Lhw8G9GP4cG
 Or3ErqQkftW7fNLWZWOp5kmTNhuMa0xai5B0P4Q+poUn2mWyTinHIHurrmNDqfzZGM3Z
 a7dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOoGcb6avv7cpE40y6+FSRha0lbX46YrY1vWkmQGp7o1JOIQXc1bB34rDubIJESdIeGjEs6xFfdA==@nongnu.org
X-Gm-Message-State: AOJu0YxrGqlqKpKOYmi6PJBpUCX9R+gC4l8EocKyYw32EVabLY/YG9OG
 ZyPIql0e9cZxoQjjJhdmWIUbH98Hptoyvnt9NPzv26c06tmTm4muiFQ9i6DMwCT5+nk=
X-Gm-Gg: ASbGncsrz3RfCqBTon3i/4nBfa5s4oxJ6cKL2iPRMLjEyvNV6UkhZRe907jeLHYwSs4
 D5Zo10aZ1WDyldKEilLZ7OOXFhC31I/2b6IhXQERPSCGhN+TsXb2LEze+q5AOsrlVGJFxAjjMss
 Cpj7h0232JJ/3sX740sZ+EbkLQ0WVLx65QrnoOw42gBUQ3dsS6FtdZ9MigCRAKa7P4pcVL2LG+U
 stJ7beyO+kW8uuHf8cFeGASL4CuEMqkYFhJ2aoXMvg9tFB3rr1f3kb7xX8hagP1tkgy8z9mnWpr
 PdPkmdzBuE3LKwb0rheAqHqlTLtbXwi9J+y1K5KSJBYf8PNUhDVtd/fUBGuhf9TJwqSI5d/6WWS
 BorVJXirO692JcQWphnwG1G7bPXAS5TZNSqAAPC4lQKLEAVsoBbZ0m9gKudOLhCf6YIsbAJmYrv
 86x1Oc0A==
X-Google-Smtp-Source: AGHT+IGwOaP8SmdEP7ecmG77ADFCHnid9q77WuZNuuzN/3/fLElZr1moowBIkbq3LgFmVkBGKMdnow==
X-Received: by 2002:a5d:584a:0:b0:3b3:9cc4:21ce with SMTP id
 ffacd0b85a97d-3b768f07c8amr2054389f8f.50.1753271657788; 
 Wed, 23 Jul 2025 04:54:17 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458693e2ddesm21292615e9.29.2025.07.23.04.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 04:54:17 -0700 (PDT)
Message-ID: <78f613a6-dd60-4f76-bbb4-8ba4fb91a7a2@linaro.org>
Date: Wed, 23 Jul 2025 13:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] target/arm: Added support for SME register
 exposure to GDB
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20250722201404.2368507-1-vacha.bhavsar@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250722201404.2368507-1-vacha.bhavsar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Cc'ing Gustavo.

On 22/7/25 22:14, Vacha Bhavsar wrote:
> The QEMU GDB stub does not expose the ZA storage SME register to GDB via
> the remote serial protocol, which can be a useful functionality to debug SME
> code. To provide this functionality in Aarch64 target, this patch registers the
> SME register set with the GDB stub. To do so, this patch implements the
> aarch64_gdb_get_sme_reg() and aarch64_gdb_set_sme_reg() functions to
> specify how to get and set the SME registers, and the
> arm_gen_dynamic_smereg_feature() function to generate the target
> description in XML format to indicate the target architecture supports SME.
> Finally, this patch includes a dyn_smereg_feature structure to hold this
> GDB XML description of the SME registers for each CPU.
> 
> Furthermore, this patch series increases the value of MAX_PACKET_LENGTH
> to allow for remote GDB debugging of the ZA register when the vector
> length is maximal.
> 
> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> 
> Vacha Bhavsar (2):
>    target/arm: Increase MAX_PACKET_LENGTH for SME ZA remote gdb debugging
>    target/arm: Added support for SME register exposure to GDB
> 


