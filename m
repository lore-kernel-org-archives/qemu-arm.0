Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E56C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:00:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj3EU-0007xo-C9; Mon, 04 Aug 2025 18:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3EL-0007rq-GG
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:00:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj3ED-0000S8-1h
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:00:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-24041a39005so24766525ad.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754344815; x=1754949615; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oi1O7Q3igp6bnzBL6BB5D6pyZZ0fQZAe1GRRfA9DyGs=;
 b=gMX5YilqrRHyp5T2kUPt4s/HgEM2UZV9anrMqgs4ieJ2KXs2eOtbC5jczrt5pOpIYa
 kPLW9/JwJ7pIxiLYNT9UEHneU1KaPh0AxVHpwTrViYRCVRScBii6uzII6zF0tUWjt5pa
 pU08UGyxcYoeeFxtYzy4xp4qedBdhejh+f+Cf375O3oNPINrEZ4GzcuK0gG7/aeoI4E9
 mscEipdwGXjHpM2FUht3yaerakTb8OK9gVNg/iEQvDK68trysDcbOjyE1hj0dLO76Umr
 WJEhvD6fm9Ial4BRV47vehkC+y1avbobV6J9V7439wvpIrchRdgatGxnqG0vr3Rv6Pl5
 q6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754344815; x=1754949615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oi1O7Q3igp6bnzBL6BB5D6pyZZ0fQZAe1GRRfA9DyGs=;
 b=nZ6C9i8bcML7t6QYQbL8ANDS9yjE7TY2vwN0Oy13FrgUy2wHo8zENit6zU1r44UwWK
 yGnuF5yKtE5CenLaFo/UKiRvGcV/p+y1qwUgWCFKt63mnzKGyWO3YqmeSJAVF9OMLGpd
 XxC5IzRBzHS4KRTqQxapdB8soq/7ZUsyZMBrg0qhhCd6z9vzH6kOQrUgiVPfU2tG1An1
 M/72DwYcXGjx0CD0nb8LlXEjpfAH3fEML9txaGi26GbpafltdWA4kv1BhgJcu1RaXJpk
 Nk6HiBh+gl5qFdG2uslYO2YsmkyCyy3nO8BnYt3+OsUj1dRF6A8ep9m/EMWqh+RgN6I7
 0/8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF5EzAkBy/+3T8YW7T/J2JmTw7F9B0eSCY2kOGQSaSK2TPH828YaSTGO22Bb0Tmki1ERnWT+yRHg==@nongnu.org
X-Gm-Message-State: AOJu0Yyof2vsw13F3GB2TWVC2zUqTGNvpAi8eaqu5CrD+M6UjqsFec7P
 JfIi6PXIsK+Fz6dFKWqQ8gKqTLtwtjXMasuS3aL0ITPfCoM3iJPywT5xvW4PpAH+FE8=
X-Gm-Gg: ASbGncvkPezp0Tu1HpvcXTwKqzLBBrZEjMZ5UV6b4AZ2/RetMylhU3rR1MCfdkjVMQ1
 fy2SHLa8J51s9Y0Vaja8w5nPOph7IvtWJjE42eUBykTk//VNysSEPu+4tn7/KvhGTI62Cyqp35z
 Vch7B5t1am54d61P6vQwVe8HKl1wZypiHxO8t/0IEUjOU7p5yBGKtehTyyWVqKvvn4Qa4b3/hi8
 MejnS9sKilLU47bEXWXQCidCiHQjVmOrhV5i97Y6EqJVereaWZ6I7Nv6mpwFLhN/VkNbegzeKj9
 rsbqASdOmds2EdqhFirhh2mvwk7RWm3Jx3o1hsoLjHSwsZRO+augQ7Utt/0o2WrAqxAs6B0GUdN
 qFIr2SzOygRLxyjPFOZjGRD+vbO0PyK4wAI0=
X-Google-Smtp-Source: AGHT+IH8P3WynBqRKJyl90mePv8MYP02GM/wLIKGDb5Z2XjANrt5tL5M53JXbq+4zRQJMwNTcb+11A==
X-Received: by 2002:a17:903:11d1:b0:21f:4649:fd49 with SMTP id
 d9443c01a7336-24247065be5mr178855455ad.49.1754344814910; 
 Mon, 04 Aug 2025 15:00:14 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e89769fasm116603175ad.107.2025.08.04.15.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:00:14 -0700 (PDT)
Message-ID: <9e8b4efa-7eee-4c17-817f-78822d0dc579@linaro.org>
Date: Mon, 4 Aug 2025 15:00:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] whpx: arm64: implement -cpu host
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Roman Bolshakov <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-16-mohamed@unpredictable.fr>
 <4182240b-59bf-4bb3-ba73-e5c4216608e4@linaro.org>
 <E5B6EDCE-D9C5-4F8F-9D26-86E153F6C6B0@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <E5B6EDCE-D9C5-4F8F-9D26-86E153F6C6B0@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x635.google.com
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

On 8/4/25 2:49 PM, Mohamed Mediouni wrote:
> 
> 
>> On 4. Aug 2025, at 23:27, Pierrick Bouvier <pierrick.bouvier@linaro.org> wrote:
>>
>> On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
>>> OpenProcessorKey and ReadRegU64 adapted from:
>>> https://github.com/FEX-Emu/FEX/blob/e6de17e72ef03aa88ba14fa0ec13163061608c74/Source/Windows/Common/CPUFeatures.cpp#L62
>>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>> ---
>>>   hw/arm/virt.c              |   2 +-
>>>   target/arm/cpu64.c         |  19 ++++---
>>>   target/arm/whpx/whpx-all.c | 107 +++++++++++++++++++++++++++++++++++++
>>>   target/arm/whpx_arm.h      |   1 +
>>>   4 files changed, 122 insertions(+), 7 deletions(-)
>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>
>> Additional question, what is missing for SVE/SME support?
> For SVE it’s mainly about the state save/restore part. And having good hardware for testing it too.
> 
> For SME, Hyper-V doesn’t support it yet, but done preventively so that it doesn’t suddenly get enabled once that happens. (and that scenario happened on macOS and promptly broke things)
> 

Thanks.
Worth adding it in comment next to deactivation part for next reader.

