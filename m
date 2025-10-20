Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A9BCCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 23:03:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyuL-0005nz-PR; Mon, 20 Oct 2025 19:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyuK-0005nT-Fb
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:03:16 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vAyuI-0005vX-Ju
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 19:03:16 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7800ff158d5so4402611b3a.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 16:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761001393; x=1761606193; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6o+fgao+xR3zoHTFJffxoX24yvZBwmWhIFo4CHdugOM=;
 b=TOYaeynLkXyjPHtfCzC8LbvVWixtht/zKUoviY0qKT+yBADnYeOojtybDHoYnJT6IE
 yul/tTk8hPWFGFOSK06VkjDFcq233fLpPTfy9PhFf1xYfEcvhgf0KoXoRxRwq6YQ9Zwn
 7XKcZ/ZHLAZ5qAmpkBfQksAwDYXWe0KdC37fkk2evEg07GTdCQxoX0xS42Ou8BwDKHoT
 f5a0seBlL/9536nqSMu7ZspzZQbc7cuNr+QR1PR7gx5xfQAaKYfdZcv3LO3msTPtcoB5
 sTQjqCaJjXRDDxq3bmZcIvkn0bvbW4VUX0zuRZENrPHyLLAURujYO63JXoIa0YNEbR9F
 HR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761001393; x=1761606193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6o+fgao+xR3zoHTFJffxoX24yvZBwmWhIFo4CHdugOM=;
 b=OYcUnYdxKY5rSWto9fZ/u4H33MIS6MSVvqIrfVHC00K7UI54FEkDcdcGqd8bXZghnz
 s9ERpV8RYa/1FSlOaCKkV6y1aF01SeNSX6KZge9zsXPPeZlicCvYUQxyeXauTEa6PNXr
 h5f3MaLKE/jErwfL5A/lz88n3yf2jJnd/Ne9svX+y1+EITPYCS6ctdXwbBb8DfJYynQF
 A39d37a1+5HxC1aA/yMri1WH/NOvBldSmBaacQQXg0PAzTn+h0tzclfzuR+X7masCpoW
 bIzIml7Hdc1RfgR9iQXSxTJDo1167b3E+E+41EFBDPPW4xWQTteLAMsMWBR4fcJYpF1g
 XGEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXzqNkd+vIr98sABWN+OBAz0HHQddGbujYjR5LpqhQ4HNG1pEHxgeCm9yCbM3fkbj1apmIeYSOaQ==@nongnu.org
X-Gm-Message-State: AOJu0YzpguHTUJ7dmRUtf9ZqN5wrccIhevA2DZ4yBZCf8XB6GvNmtwXR
 2T9XjPlWQhUMu05O6BZdXH1cvO+juRR2YQCrWwFDPo4+XHYNzExqwCGO805pZFFE/Mg=
X-Gm-Gg: ASbGncs1hc6i8MIEoKh8ZmaFLy+c71HUJVOKOqPr2rO9hTY4SkhDmqluEVcfocg9WIf
 yzHvEWi4/DtZATdWdaMOjTKgsLnssL+LBlX4OPntRSIadywIjDoexw4rHma4BA7GJ4lGJVqezHn
 cKsXuo52HJtZSKKCmUnEnzXQ8uZeolPmy4+BattlJVKPB3uInwt7NnI3CF1TZt/CzsRHig8gTeA
 QN/cQOYhVjulILIoU6wlXDc2zUB838c7ZvhyKNV976jxf7w22IqFPiQpdx3zI98eTzBzAqSQyk8
 kOY3+OL1aJid5jHmQ8NLsbciB5FhKfiwy9sODfkWFziIsesh+X19djw9kN7gc5MJ7mMM+Hl1L1u
 ziT3nMIDwNRIs5xvASU2rjCfq8R8QsY+SQNlLfb67Ukh/uzggEbDyvM6/mVfjp21rUxw3LGbdTj
 oI9CFyUyRqWuU3lD6PSfpfd5bW
X-Google-Smtp-Source: AGHT+IGJZGStCCoVg5U1Vfh3jGGEEg7kmJ+akvU25mZyWwHHkVp0QSJCrdvEwDbanQOt2oyMPyr9NA==
X-Received: by 2002:a05:6a20:394c:b0:32b:6f9e:d62e with SMTP id
 adf61e73a8af0-334a85baeeemr18118061637.47.1761001393021; 
 Mon, 20 Oct 2025 16:03:13 -0700 (PDT)
Received: from [192.168.1.111] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a7664a228sm8553342a12.4.2025.10.20.16.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:03:12 -0700 (PDT)
Message-ID: <c4754279-8cc5-4e14-a2e9-215e9963de15@linaro.org>
Date: Mon, 20 Oct 2025 16:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/30] hw/boards: Extend DEFINE_MACHINE macro to cover
 more use cases
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020220941.65269-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251020220941.65269-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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

On 2025-10-20 15:09, Philippe Mathieu-Daudé wrote:
> From: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Add a more general DEFINE_MACHINE_EXTENDED macro and define simpler
> versions with less parameters based on that. This is inspired by how
> the OBJECT_DEFINE macros do this in a similar way to allow using the
> shortened definition in more complex cases too.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Message-ID: <d75c8bbed97650f1a4d2d675444582a240a335b4.1760798392.git.balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/boards.h | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


