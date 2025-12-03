Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385E1D15DAD
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 17:14:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQqPu-0000Ps-1y; Wed, 03 Dec 2025 12:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQqPs-0000P2-L6
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 12:13:24 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQqPq-0001JV-Nh
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 12:13:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso58445e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 Dec 2025 09:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764782001; x=1765386801; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6C9ysqUDQVzGy45xIfx0gc9NZQmRoBa63OxiTDJe7g=;
 b=CkPedYEBEA7JWJQYix9/EVQu1YSWssAHlkP6l8JGZoVzzKSeiUJpvfdJ60nbZ+R5rn
 dDMF3Syffri2QAl8iAV2/ai8os5GuH7g1b9z67uDrhu0ONeWjSphrVUfaW5TE96AP2jS
 UMNDTleBj2NvYImlv7MALrbx2EfLCt0ugCNiTR0a9siD9C1JTT63IWb9WGZxXkvpXdIa
 rNoVfcN7bdyO5UbOh7095UnNl9U0kMMRZ/Pte4BPQTrvH4uy7pw95TnAB0Z+v+8Up6XD
 zT4p9+THQhg+Avy7XcxVWwkYSqPSsXGOVqCU0enf1spMcDosWsmAruApNJLabxCohf7/
 xeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764782001; x=1765386801;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W6C9ysqUDQVzGy45xIfx0gc9NZQmRoBa63OxiTDJe7g=;
 b=hi6jeGvMRy+k5WvuMkoBsQSD3rY+6T0sG8o+EZuhxWn71Y9pwWA1Fu/enqZf8iqhjc
 Q9Z8XUl6bHhYf0jicM1EbeLLLD/1peGXdO3uwrRd1KIwhkdzuyvlfd8BZNuDdA9o/Jz0
 E2bgf/rhSjpLGNwvtHu7kZ+Sgo2dSe6YgXH8Bdbh9kW5Fo+R9Rw674zvd+1ZVlWtHe8w
 lw1dCZYN+bYSfiiEJMIZd8g2EJIFe0r8t5z/Ok78DPuXO0TA6RB545EZAj7Dk83vxZjL
 ofBHfFKLCQVmbJY2Rr2uPVxdMnG6QmCZivSBI+ckGvBHYOXW8tx5uVxULNRMqzdDUtkb
 kelg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5MB7HjBeCG0tK1et/qaa6IOp45Trk8OzGjXHCysWDRZLIogaQHHKbV9It4cajAkO0bHViK8rrhA==@nongnu.org
X-Gm-Message-State: AOJu0Yw41RK6CN/bnno1jvTCbZlt2oiG0rVGaMaMdv28Z8br9YCWUIYb
 g2Qu/xHw1SY//dbCWkxI2aeAbDAhP3ABiDSadFV7v0h1uNgHXpiPqiyQUZRcBesZACE=
X-Gm-Gg: ASbGncvM2O8Yfb+TkNF+Is1lH1lC5XlFHmLR4ciAJ7M4IUNRmddXJ9WdU8Rw6dlsmPt
 1eXSKdA4FoeYctd1yV014kUHKjK7ul2WYkfM50kGPyyWZlzH4RvnWob272qViS4E8Qk2npCmmrt
 SfijvxDPUfwaBsFF7pgz2YvPl+dPCjG3rb4ZVCThVtO9sJPVY/CHOuDpPE+bwfRm8sPHqS0ROlw
 KqW1bEUa7JZt+iMhyQ4zbk/G0tLl43kp53BcF6yUjMwohfGKOB3PIE01OScdOgdFh/oa93xJpuN
 b7kx8Xaam0Ym/m9ilTEl8uMbT83bAmE+NOvIsaCNzvirJxJCWEz2qCBDMpr7KRbujiEblAjx0+H
 7+wXLMZMRRHI//YPld5NNkz2HJOKmHWvwgy3uMWAiVAG3lDrWg49eqCd+NTeXTokEHkVh5cRX+K
 3CI6T5ky+AA3OlYrfonDxVO8B3eEORn8x/dWMUWMzf/WvjpJxg10dhVg==
X-Google-Smtp-Source: AGHT+IGEIGy5GbSBMX3HuNN6sLuXFkaDVpk2hWstCTOa/QqT2rCF537knkzqPXPbB0Ued7Ow72Gtaw==
X-Received: by 2002:a05:600c:1d18:b0:477:73e9:dc17 with SMTP id
 5b1f17b1804b1-4792af49dc5mr32037775e9.35.1764782000931; 
 Wed, 03 Dec 2025 09:13:20 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a7a3379sm60650035e9.8.2025.12.03.09.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 09:13:20 -0800 (PST)
Message-ID: <d1eb2bb1-3187-40ec-a3d4-0a61417644ff@linaro.org>
Date: Wed, 3 Dec 2025 18:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 v6 05/13] hw/nvram/fw_cfg: Propagate I/O
 MemoryRegion to fw_cfg_init_io_dma()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20251203060942.57851-1-philmd@linaro.org>
 <20251203060942.57851-6-philmd@linaro.org> <aTBZtv7SHRUGbidV@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aTBZtv7SHRUGbidV@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 3/12/25 16:39, Zhao Liu wrote:
> On Wed, Dec 03, 2025 at 07:09:33AM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Wed,  3 Dec 2025 07:09:33 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH-for-11.0 v6 05/13] hw/nvram/fw_cfg: Propagate I/O
>>   MemoryRegion to fw_cfg_init_io_dma()
>> X-Mailer: git-send-email 2.51.0
>>
>> To allow callers to use I/O MemoryRegion different than the
>> global get_system_io(), pass it as argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/nvram/fw_cfg.h | 4 ++--
>>   hw/i386/fw_cfg.c          | 3 ++-
>>   hw/i386/microvm.c         | 3 ++-
>>   hw/i386/pc.c              | 3 ++-
>>   hw/nvram/fw_cfg.c         | 5 ++---
>>   5 files changed, 10 insertions(+), 8 deletions(-)
> 
> ...
> 
>> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
>> index 94d22a232ac..69f04d74a15 100644
>> --- a/hw/i386/microvm.c
>> +++ b/hw/i386/microvm.c
>> @@ -289,6 +289,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>>       X86MachineState *x86ms = X86_MACHINE(mms);
>>       MemoryRegion *ram_below_4g, *ram_above_4g;
>>       MemoryRegion *system_memory = get_system_memory();
>> +    MemoryRegion *io_memory = get_system_io();
>>       FWCfgState *fw_cfg;
>>       ram_addr_t lowmem = 0xc0000000; /* 3G */
>>       int i;
>> @@ -319,7 +320,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>>           e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
>>       }
>>   
>> -    fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
>> +    fw_cfg = fw_cfg_init_io_dma(io_memory, FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
> 
> It seems here we can use get_system_io() directly :).

I tried to follow the function style (see local system_memory
declaration); I don't mind ;)

> 
> Otherwise,
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Thanks!

> 
>>                                   &address_space_memory);
>>   
>>       fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, machine->smp.cpus);


