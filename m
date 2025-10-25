Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54811CCF9E3
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 17:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vChed-00069V-CR; Sat, 25 Oct 2025 13:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vChec-00066z-AP
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:02:10 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vChea-0001F4-Lw
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:02:10 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b6d2f5c0e8eso648718066b.3
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761411727; x=1762016527; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QBxCjpGnr58h8AVd77L7obVcKp22ebEt8elSoiTkfv4=;
 b=ezffxBjkfa1zj5fOhg6zVlODQuGSSaBo7PFzUk1guEPacXgzmospHNJ/cQygoZ6831
 +R1ympDZFFPa5S1ZOw7Ox8Vtzev5nWddahiUPwNKMvTm9q24/4HizCyP4yXxmX6449T1
 TROYCfdEVDSf0h/HlGMZlws+V0rokwQRoDJftsuX4+Jfb3H1NhFyPGaBcpBelOcNBJBO
 XNptpU/Jw4VCvX/uBR5rUEOjRkmYTOMCc7TSOxwp3fptTPjUiwsOnvvy6uTqdPpcxt3A
 OzilHZU8bh4GX+lF4BwTmmZC1WQZG2hTbMnCi2c3WdafQ24kd6ayzH12Tqn3Wg1NkoWi
 sUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761411727; x=1762016527;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QBxCjpGnr58h8AVd77L7obVcKp22ebEt8elSoiTkfv4=;
 b=I/P5418Q827n6LPdFVRY4yjeFZF0n3/X/HIhL9/AEz7Ewtt9BORO6I8/Kog+Q0bzjA
 m8nAHoSoD1ffO9VfdmtwMbeq2sdNY5HReu5eyE+WueeAXNV5X2wI2ebA/eWUgMHrJidr
 NUQb+g1ZzTmCflV3hCStm+s3euPkBi8sR5Ndaj/WPn01c3czEtWOHZoZMxihYGWkKLrl
 gaQTQaHEYtZa/ThmTc3MHcidRvSMoXls6sd9Dw1+Bj1YVRn/5s18zmS376t1Zpx1G7IF
 +9C0Xehb4mbJ4CD5I4pDE5gbsz012VDU0F7LMGnUmXUh7sU+TaeRA0wZpHFDfmKjV9QA
 Pujg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2kP/UbnVJQVouiYuR2LRZrfEs7AqnwQBAuzkOFj3+YYbgcNAIk4YYUOt7Kjf3zXnNgLoNC+BJPQ==@nongnu.org
X-Gm-Message-State: AOJu0YzbwrbWiVNJqRR/8fJ+2X88nGjRHI6fIlF5XVUT6SLFUrdJBDTB
 5artMYio65P5L8S388LJQWIHP53f/P5NnEtVEZa7pw3jKlDO59ogbWl7WQu2q/GSdPg=
X-Gm-Gg: ASbGnctRbRPnJnJ1BWkGPaEOwMYTnTFYeZPqvCeOtFYN6DczlRHJexHMbZ2yRjhoiib
 slJS2w6KywLQTui+5IlLReWFAWwUElT/YxItTRrfxMy2c8cHN3jChfEu5/sddMMrILKGPaG+KnW
 kOFK4VLjJEFjTPBu/lWRgjksBwa5C8AQ96eLGY5Y63W3bXOel6cnpQCWAlQFijx8puLxVa29V60
 Y+e40m3/O6q4d5WXPT0/ttkI5/KsYDyaaQU+l52crmbF84Wda9t/Z1thayHoy5gzliT/2JGKjwM
 Kzm0OcNjgx6tq/U3ppSNKu5haJ+zwL0GTGdz1Bmmin+36a7D+WuU8rTGaH5+3u9ijQ77KTzhOMv
 28BtjXMvLFpqJycsZ9bgp/hoBBdeXAODG9NSUP0NEqBnxBZLQrWE8wpgl+10jXpweZIsh62Ti4t
 CcM18diSd57KwTlVPjU4aO8q3aD45laITOYBt7O+8OIheE5z2JyBIdsvvRdS4HUQs=
X-Google-Smtp-Source: AGHT+IF3XkvxeSfA4A75UEk/cUxJjiwMnj3tEh42vzbwDzUmywwANfKhJ4oE074kJryoLdIal9tVEQ==
X-Received: by 2002:a17:907:3f0d:b0:b49:5103:c0b4 with SMTP id
 a640c23a62f3a-b6d51c4bf45mr1294436266b.56.1761411726913; 
 Sat, 25 Oct 2025 10:02:06 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541fc31sm243637966b.60.2025.10.25.10.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 10:02:06 -0700 (PDT)
Message-ID: <71f7c067-0aa6-466c-93ad-243013b56a44@linaro.org>
Date: Sat, 25 Oct 2025 19:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/58] target/arm/hvf: Check hv_vcpus_exit() returned
 value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf
 <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023114638.5667-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023114638.5667-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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

On 10/23/25 13:45, Philippe Mathieu-Daudé wrote:
> hv_vcpus_exit() returns a hv_return_t enum type (defined
> in <Hypervisor/hv_error.h>). Assert we succeeded, as we
> are not ready to handle any error path.
> 
> Suggested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Mads Ynddal<mads@ynddal.dk>
> ---
>   target/arm/hvf/hvf.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

