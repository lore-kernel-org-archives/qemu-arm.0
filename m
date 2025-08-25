Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE0FCA0FE1
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 09:57:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqTwJ-00067d-Nn; Mon, 25 Aug 2025 05:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqTw3-00063a-9V
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 05:56:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqTvx-00026J-RL
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 05:56:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1b001f55so22044165e9.0
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 02:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756115763; x=1756720563; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DtPysv0q8plRMP+uuaG7xvmK7HEMKFlASd4qR6lUwg4=;
 b=Vh5CXMbcfLy1kmYwFrrbe0iRmuIFD7qb6tKOjR5D51ppZCKInMsNYLgSObhNwVjaQu
 jAGDlDuy6HgrWsHhihzz3sjqa1Sv/3Idx6QKz7EUSmpXOpaIl1MuQYLTUkUbza00obXe
 rxlH6uzC5f+H5s0XayXMi9J5B2BNBFnAbVcwQ4O3AUJrEGkqoJcQ84TsTCTHCZimH1S0
 Qw9keCyqy3goV6KqmHAdQPXq4rKjiuYaWkiFzD0UczIiH467ymG9ST227Vn0fS35baKL
 ejIdT8Lwp9JSVXplkZD7KGcPxNd34Zv2LK26OFznmWJN6eggfkN1KDr7UVD5GRKCizLd
 Z72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756115763; x=1756720563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DtPysv0q8plRMP+uuaG7xvmK7HEMKFlASd4qR6lUwg4=;
 b=PGuA/2eJCxPpEGK6pFCAxxbjHMRiWIV6bt+avzsMgDne91cOLi0zeA0Gq+CxVkCgiE
 EmRH4uXHq+AXy+Pwl+O+obXvaY7KEPmoECU+UDSGyrFXOwDao6wj901svhtVPmzC+eQC
 xksxRBhXqVv71MKdyJnjG5kZGPa6u+zMFvwPBOqY0Wjz0urGkaqqQHf77CEF56xLocrV
 Hmg7gxCNy/ryoDRsLIRKea7czUGycTv0WMUIY8qDHxSPHhs297Efh5J5EvQgEnaEbcaX
 Kp5z6slyn+bFYeWK51wB2s7aqqqFxFY3UZT3jZs+rHpuwdrXo8v9LwoXXhruzVzy7nIh
 IeSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM298ohxmURA8xbhEgqHqcpnjcvSapbd3iSNxN8PMwJGCZkspvIm02uNL+L3ncW/+6rWIbokfg+A==@nongnu.org
X-Gm-Message-State: AOJu0YwXodhmpli8BBwDLfK18DnKnf6jy+OR2n2qeIBkPXtp8VmYq4P6
 Owwdj7m72/BBnGuo/ZrU3HavozDNuENOZyMaMyt2dfBgEzfwsd+mAYqJTvpbeGxIcQw=
X-Gm-Gg: ASbGncs5BpS8pNZ1nvmO4HBVYtufkBMIQgDyXmieiGIAzSMiJiOz0eBXh52Sdk8MQCW
 eJ9uP6e/CdXEWvH3+SeocNwrIaHA2GNlk6FCX4YkBlDQA3sNgwJPKStLLvK5LuGxd/5ePn6R3fu
 khFBJNqDyk2FkdhxPSMbjEwHA8ME/2FK5vsHfCcSOA/IFDFJYse5mc0MYUz7fpUwMCQQxfUZpnY
 Xoxb5KXI/HZLrZhUWzcvSzZywgSmGy7WvPZZFshS3K6WqH2/2LORMAEDKM9JPmtfbYD0CsI3cWb
 cJZo+ng3UG3kydWAQt5Mi1GYhMpMF9/b4xqVVSFyxu7x4ZAukO2dgSUs+PjL5sDAyv7ZkxUDxho
 MQ7C07Q6T57F4zCiQm4E1+bRt3M9GvNMydaCUFKyNXR6upCuPwpnocn2ilrHZ+USQEw==
X-Google-Smtp-Source: AGHT+IFII4uz9bHKRVMU/jqk/Ik1xyv1FNOwKxKjbIfzqXS6ferhx9aYm6vJ1OcwtxUTA8WX5oiUAQ==
X-Received: by 2002:a05:600c:1d87:b0:45b:5ff4:2f8f with SMTP id
 5b1f17b1804b1-45b5ff43124mr24307765e9.4.1756115762660; 
 Mon, 25 Aug 2025 02:56:02 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b5757453fsm101240695e9.14.2025.08.25.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:56:02 -0700 (PDT)
Message-ID: <eb4da435-2b16-4421-a192-612a33524897@linaro.org>
Date: Mon, 25 Aug 2025 11:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] single-binary: compile once semihosting
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <7c026d43-04b4-4615-8478-639393b640c2@linaro.org>
 <e7ea76f9-b66c-4656-b8b6-4d0ff0dfee35@linaro.org>
 <33849bb7-07a8-4a04-b142-ebfe5d286332@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <33849bb7-07a8-4a04-b142-ebfe5d286332@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 22/8/25 16:57, Pierrick Bouvier wrote:
> On 2025-08-22 07:56, Philippe Mathieu-Daudé wrote:
>> On 22/8/25 16:31, Pierrick Bouvier wrote:
>>> On 2025-08-04 11:39, Pierrick Bouvier wrote:
>>>> This series compiles once semihosting files in system mode.
>>>> The most complicated file was semihosting/arm-compat-semi.c, which was
>>>> carefully
>>>> cleaned in easy to understand steps.


>>> Ping on this series.
>>> I'll be out next week, but it should be ready to be pulled once the
>>> trunk reopens.
>>
>> Modulo the comment on patch #9, the series is fully reviewed.

Sorry, this was a comment for the maintainer, hoping he'd update the
comment while queuing the series, not asking you to respin another one.

Next time I'll be more verbose with such comments.

> I'll send a v4 with this, thanks.

We should be super good now ;)

