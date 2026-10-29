Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460A606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CrzGvwDU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMP3y-0007x6-5B; Thu, 29 Oct 2026 08:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP3v-0007w4-Kq
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:16:55 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP3u-0000KR-3Y
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:16:55 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-84e513874f8so1407614a34.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276212; x=1793881012; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZPVoRRQW31QcGBoaDxD2pNzqDiP18AbjFYKGQ230ABo=;
 b=CrzGvwDUELsLfclrrcQHe+hrirs1B7XlB/7/DDLwWbJz2rq2lG6DeojmlPieAbpks3
 c4EA9ZpVp7iLspp1hDxe462kMpXMPCrx/oPj3/XjCebA45TCD9qDzayC6MM7sPlmPwGq
 w7rwVoTVq6bo2FpXRXfKomWJH6x5Ri7P37ZJ7BZMD03Yl+XGZjqPLHPYQwh443cEHcnq
 U15kq0xptpC04z3vs6A4jgyj3b/ZCN5U5cMefVVSZu2rcl70dpInTqGn3zpAckiMUjhv
 vSUHE4RrDaPdZOxlS9kmsQUxthxptCten62AyiOBmjWRAeu3h3RRZFaVeOW09yUvY5Nz
 u2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276212; x=1793881012;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZPVoRRQW31QcGBoaDxD2pNzqDiP18AbjFYKGQ230ABo=;
 b=qrZuJoIWXu3lwJricHLhNl9Qli9uaUD5iKAHZzyCn98TYOSYfZOCOSIpSsoVR/bOHL
 eURYx3e2cmnO0Zg6FW5oR5LwgYBIfffYTE6bbkSSjUVjDuYdnFfnVq2te5VQ48HoQVmz
 OJNGt7lZa5wcREvVlIT6/wBzx0YXwGzEsltK9yGxcGQlB8/qRyrLPUmhopN1XBHBc2o6
 A/2OaKtR+qbYWGI/eRGXhH7gKn+vu9EP5dVtIkX3yijAOy35Avr0oxupv4L/YxPumK+s
 Q6ckYfyK23EfPtWOdrDGYxf1lmZ00c10QaI4mtxrWzG2VmVTeVIcK9BFd1GrZCB9a3zP
 iEsg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxOjLcMrvLBbu9FYbApeIsLolbPgyLiqxvxGhosB9JXnRiTpC+dz4ozLrRV6k8frDRgzwUbphvrlw==@nongnu.org
X-Gm-Message-State: AFq9FYK+a/940e45hvAnv+xYBfh/SZY7Gw46LQ3us3qAesnTlNcFuhry
 MCEi73cdEApmZ2txwjSFoBcLwbIeIG1w/X7c6OQA80wJJ+GcDTGLpBpV9SJCYPVVdBs=
X-Gm-Gg: AYBFou2zPGJ0A/2I/hJqdipPTbsUsUlbXGp9mHCNyXQySwTiZ8vzzIDTgGUcIJnEYMW
 Ncg+17u4XK5H0H11x2kMWjB4xK3BSvXCo5JuEeIabGmIuHI7df1uMPSGdDP7JcvNxKc2M35el0y
 qtOP3UVsnLCbMiEqNwSvO1RuXBJa8sJKDListCFqlRj1iiOSp4lp9NozEq7zR4eQ/OPkB+emSdC
 RxJUEqiwxyq9hluSiewU3c5BufK3sElGOFkY1KxB4yt4z9JlqiyKs3wugu2flsTlE86Mud9Aynk
 diJPLOS1G5j5GKLA0yvbYq8kqgsbBRTU1g4DgUtZGn/Q7jo2Y7mBOLEbgSKWRNV9ERmJ3wcw96X
 pOPu6zyUto+0DqEhq4mKXUqT32BneINz1qbkW2QYhzTs1zRav3MQxlYo9YLPJ+LzzsKtJ7V6dBP
 hDaKaOk6y35yVpihDBE4s+FY+Nck8S/ezjc3vFfKE6nhu78YgcqyZOrm/n9YyB+7becJwcYBMq6
 MNgVG5OZMQsB0mB/5za9tFvhw63m4LdEVaGRN0gWaVNU4/67s6wi5f07U7CXI5JFra7e7RK5iLC
 CDQpdzS/avppPDPsmNaATRNXXvcFGFPgDPh1q+6TiYyK
X-Received: by 2002:a05:6830:449e:b0:80c:d30f:97b with SMTP id
 46e09a7af769-85abeab270cmr4328710a34.28.1793276212436; 
 Thu, 29 Oct 2026 05:16:52 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85b1f4368f3sm5117821a34.7.2026.10.29.05.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:16:52 -0700 (PDT)
Message-ID: <afb512a3-a151-4a67-965a-cdae1f919b3c@linaro.org>
Date: Thu, 29 Oct 2026 07:16:50 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] tcg/riscv64: Factor encode_vi_raw() out of
 encode_vi()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-2-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> Move the OPIVI field layout into encode_vi_raw(), keeping the
> simm5 check in encode_vi(). The next commit adds a uimm5 variant
> for the vector shift instructions. No functional change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

