Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84547CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:31:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jG9-00063W-Ov; Thu, 25 Sep 2025 06:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jG5-0005kn-Po
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:31:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jFx-0003KH-0J
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:31:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ef166e625aso674898f8f.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796272; x=1759401072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GK0K3he9kAiZsqI6DwImOP7y3yjIf6254h5fsANVsWM=;
 b=NAurQ5TliTAHJw+G0fYxO/3yw4a1GQEsomL8hTNICVw/QgX4//N4anKFxM/E7ZMxxV
 BsixrVVhqudfl2jCjzOkW5DStrMSgufdK8zVFigaznrv8Uyk5KsQgFED500DXItNdGOl
 btJzvpl1lGj3lLPoOM8NQtdVZ3+5CdTSUU7kVBTB8v2BvvHJeaLGpeOQAobZzrYf65Xj
 T88IpdMshijrLzCdK8zGdDgulcJRuoYqFV0FU6FrGT7hMBVNEIGFD8j6aOyfdfuk+QIx
 sqIXP5RxqSH5x8ijEzvhWd6CrpViNI0GqHwRYfI0CqBmaHzRYFnzKQqDEVwpxxoVCfGq
 OgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796272; x=1759401072;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GK0K3he9kAiZsqI6DwImOP7y3yjIf6254h5fsANVsWM=;
 b=SvAwW5OK6IMCZ/CpLY1WbQFJFfa93QYLJR2ZnRw92GnLY0Zn2eIWU403UlHO57irrH
 ciTyTm3mvy8OgTArmaU0QAep3fhJYssrG3ERxa5+weudfYxqd7TMmCDFodXuFOD4bbVh
 J6n7GuCaMSk25QSKNXnMOi5jlbdSBDqgLLZVjpNXlaaMaWs5m5awvnAdRySFsjlxz3Bx
 j57ZQ+jW0fLzWyBicS/eEUjkDPqhsEy9bqNZVxw+H0OT/aHetq6YVdASHSX9K0pPXis/
 plftuPY8iU+8c2xnOl85NWJ7dm1d6jxzEQiix3ybvi3SdG8P1uRHJCUESFnXZ6teUsuW
 81nw==
X-Gm-Message-State: AOJu0YzmtQjv61U0I/1OIsqtcDGq9iTOoXhqOyANnACQcdlCYPm5v/di
 ka7Ulle/JA1ut4QiAWNM5t+nVd5bJjvZa/TSod85ddoKo6YX7+KkmFOoI4fiu/Xo5VY=
X-Gm-Gg: ASbGncsCOMHwHBbs6umTfyPV78RCnZYkHp3L8leOPCaqxy0TorgSR0YJrW53Nhk/2Lg
 e+/qUxrE4cg35kjzCuvsDWiIxtrQqtIFd4bzGVMv7UIQz+Xl8ByDKTS1/368veQb0ygYZ+YeUmG
 oNIzPG89xWzDYAOESu02AvNhkXpACE4eereoexjK38jmWfgihWWRu8GXSa8oD0VM4RgP28WboPm
 hpvaRx8zmsAslS/uryhlYwls3Uuk+NSbhnco9Luz30C7qv2rBcIRIFgypgYOcJemjTolVo6/97F
 KCXVFnF/ZQ6plDeCAY/bmcWjUEVoSxJc6HrcPLHg05vUpJjRlAGS5ZEhnv7KiroP6GvhLSEpzIE
 1ZuMPsM60cTXFGiV0mwRRyPPPZg67vPU16JeKxezZPPrQ/Jwh64AIiGMj0sfygY96piwCXmUIV8
 O8
X-Google-Smtp-Source: AGHT+IH3Rsf4OX4bWm8lnyMggpZw7n7GrWr8F0BXsD9FOphgi0IhsmC7pfX5ZO4LHT1k1nDJOHcJMA==
X-Received: by 2002:a05:6000:2381:b0:3ee:1461:166c with SMTP id
 ffacd0b85a97d-40e497c34b8mr2791456f8f.5.1758796272399; 
 Thu, 25 Sep 2025 03:31:12 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb72fb711sm2484562f8f.11.2025.09.25.03.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:31:11 -0700 (PDT)
Message-ID: <cd8a94b5-8aac-44af-a989-10b795434140@linaro.org>
Date: Thu, 25 Sep 2025 12:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/36] target/arm/hvf: Add KVMID_TO_HVF, HVF_TO_KVMID
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Conversion between KVM system registers ids and the HVF system
> register ids is trivial.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

