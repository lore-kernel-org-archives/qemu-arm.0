Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8284FCCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:37:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDi15-0007MY-Vs; Tue, 28 Oct 2025 07:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDi14-0007M3-Cs
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:37:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDi0z-0004qH-Mc
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:37:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo4826909f8f.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761651439; x=1762256239; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eIoJWjFxXvCJq6wPc9vwjKc8KbNm3ZfcumT2PgAGI5c=;
 b=hBlwH9nT23BdzOQ862D3tIowEeFREFrEE+3oi/y3gYt8t3XqK56HxsaTi6/zHv0wtz
 GG0vtCYU+5QZCdnmy/dIPrL/vbw3dZsEy1w207RFZRxCTLKbI8BF8RvwEvMLkbb37cPz
 UaSftXl0lpeJxmpTB/JiGWfNMK5ybAUabbCsl6QoSya1aoxL2h7Jnm3ax7RWiz5syRgw
 1Ri/9JX7EOc3+x7gZho9i5Tz2ah3r/OB30dhUhaufOmVFTQbc5BwxHBFnCAoVx65crWf
 RZlxoQyau50k/VSDD8VQTzVTgXH8Cdkk6OzxMPa0Wa0uIPx4CqM2pI1rJrU00g1MRt9A
 XHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761651439; x=1762256239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eIoJWjFxXvCJq6wPc9vwjKc8KbNm3ZfcumT2PgAGI5c=;
 b=hR/zZwVMqZtfTuDGqzQbyWvYmAuhB5uYFKTVLWlKylPDbQNzzAPtTDjWwRBIGcrrwH
 LefrbHF1G4tMV2eofKuwJhj8XlswnO1CUmsu2cRCzeCMoAtKKD38I5XVI9nL47Y2Huj4
 U/EBvLNzqx6SoFWCdrMkeEv3P0f33sywPaZM/SzL5asuC02YoUKtahkTS8CjP2ILDCE/
 Sq6mFAzQIEg3aU/hzA+T5nvtH+uFPdUj8tJplrN7kDgXTNKX4KJa+gc6OWKv/GsMUaMF
 tUaSePARZvhKAzYdq8c78gZO3pqf8sG1HOl/9OxJ9f8Flc79XJyz4NbjWKYNzIPnouc+
 B8NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0YWpjVCSQ3Rw3xBHvtucHObQwoTCcv6HnUoX6A0Qi57/ezMyVNAsMTI4FgE7j58DHJRyKpGl5tQ==@nongnu.org
X-Gm-Message-State: AOJu0YxfZm0EAtAyVbOsz4gnI0x+VD/uD9Zq/fm1OGkaBMdzl1TIzBPO
 3JkUrDN4p+o7DAjMSqXrT/lAp1BaAe7M/yiXY0Y7y1DA8LSe5iK3pZEPMhUwWwPDT78=
X-Gm-Gg: ASbGncuujkBkvx1xOpkxQ1vlPjYXVJhqPRYTiXmn6v58e4ZQfm5jSOiy0anQ0EalBdo
 NnGTrrtAkS1QeOkRv0YHTWBhi9p/AFp/2jN9/VwXyYdrUg1S3ktlQJL4CGUEdwIGOL6gfv+QfAA
 OUKgPemwWe2L8jlLZfJFBwUovZpzvFg273GQVRpeXIcq6yeE0v/p5LzxZGP/1E1BR3l0GGF3co1
 N+Ng497Td6nzSJjTnf5Zpdq63UMAtMlqp4XDjayfpBXwcjH4jju0BsWo6GJZyc+eWQrZFjuQazy
 FlaRYJf8tYLeBHzkp+V+88ECEZFi/tws0HrGduWbplzO9n/VeJhu9ITnuGK/yrQwrU9fIIHBybE
 /T6CRs5a+R283Y1DZ4RQIFDwOIe17ND+WV+9rP2M3nk1+5mSpEg4tRC4IzhFrhxu1g/h1b1I5pt
 0ubGTRyA5pGsxaPTPkI85CN9iPExROXdzBCUAaexYFJeEkgoFe
X-Google-Smtp-Source: AGHT+IE3Snl8zlSnPiGYj9/4JIFL4a6H2K7YElnBFPReLUtxrB84UnXHHwxdUdTCeofttPdmksiT9Q==
X-Received: by 2002:a05:6000:24c1:b0:3eb:c276:a347 with SMTP id
 ffacd0b85a97d-429a7df89ccmr2374125f8f.0.1761651439165; 
 Tue, 28 Oct 2025 04:37:19 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7d1sm20139099f8f.16.2025.10.28.04.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:37:18 -0700 (PDT)
Message-ID: <1e0ba551-67b0-4538-9291-2b94059c9dc4@linaro.org>
Date: Tue, 28 Oct 2025 12:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] hw/sysbus: Spring cleanups (part 1)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
References: <20251028080258.23309-1-philmd@linaro.org>
 <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
 <CAFEAcA-O_Ocyrc11Y5TNmtja0RdgGJqA=gUAX_ya6oSUVRnzEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-O_Ocyrc11Y5TNmtja0RdgGJqA=gUAX_ya6oSUVRnzEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 28/10/25 10:16, Peter Maydell wrote:
> On Tue, 28 Oct 2025 at 08:50, Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
>>
>> Hi
>>
>> On Tue, Oct 28, 2025 at 12:04 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> - Use proper SysBus accessors
>>>
>>> Since v1:
>>> - Reduce series
>>>
>>> Philippe Mathieu-Daudé (7):
>>>    hw/sysbus: Use memory_region_name()
>>>    hw/i386/microvm: Use proper SysBus accessors
>>>    hw/i386/ioapic: Use proper SysBus accessors
>>>    hw/timer/hpet: Use proper SysBus accessors
>>>    hw/acpi/cxl: Use proper SysBus accessors
>>>    hw/ppc/e500: Use proper SysBus accessors
>>>    hw/pci-bridge/pci_expander_bridge: Use proper SysBus accessors
>>>
>>
>> There are a bunch of compilation issues that I will let you address for v3.
>>
>> It looks like it should be possible to remove the "addr" field from
>> SysBusDevice.mmio. On the surface it looks redundante with
>> MemoryRegion.addr. I might be missing something.
> 
> Yes, I think they'll always be the same value. But
> MemoryRegion::addr is private data of MemoryRegion
> and there's no 'get' function provided; SysBus shouldn't
> be reaching inside an MR struct to look at its internals.
> 
> (There is a memory_region_set_address(), so we could
> I guess provide a memory_region_get_address() ?)

OK, thanks!

