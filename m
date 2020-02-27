Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4455089lfg;
        Thu, 27 Feb 2020 05:31:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKHnYA0QEZ5n2BEynGcc/uPj2ai4Nf5Wwj6fc5nik/3VZ7TRWg371qhXR+jYgHq0rOOZN/
X-Received: by 2002:a0c:ecc6:: with SMTP id o6mr5262174qvq.220.1582810316561;
        Thu, 27 Feb 2020 05:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582810316; cv=none;
        d=google.com; s=arc-20160816;
        b=JchkETiBZ6LmJ9hx5vnDa/v35LZ7gkRPryfOCwGUNImrW0C/7vd9R9xvlHp77NSu+q
         AgyHtZCI7trpydkXmHQpqBayr1h4rWBH+02Q/bg6/GOB7VQ9Z2YE6M4a3XioqFfS/Chn
         PoLiYc3eAFz1mwI28kwTXEEeLvDeaVhXHTT7ourhm03zjdDuTWq1Vopa4IBo38nC9m5y
         oL3sUWgL4xoFr/IOajpJ7VkzjgpcFXhp2HwroLAWYGOcUcY7gEBe25DNFhsmtj42LMkh
         CaXymxwt2lJHtQB8DFTMj7dANM3zgjz6YqUm0XGf+bQaAp0NZFPHb5IC0n2byhcOs9IL
         p/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zhtu/CiTrf8+XY7umgJTohHMTw/mnHbl8+T315nQ0Ss=;
        b=xzdPScw+Bh7z1Elo4JCh6T82XoMIaTuw8KQi5XivlQqFcMKdHEig9bm05sd6LGv0G/
         yJIJgQfrmWIziKH7ijKWgscJCWRQ1FoOTTBxbIMuiN7y2KJ3dtPVECJmKwrwZGBp7Dd3
         g0BeV4oXLaa0XGFZE2c9PZF9/JNLn2OFKfNGTcBp/bL0nhKKKBuChJtKNCBEqqqJ7Hp7
         YIqAiJwHLXpphofR5i7JaOd1nocUho+dDdnGCciKiOkjDolbZWq9FHSHZW2bwdr7iuwH
         B1E5BfOAMw+3dJGO7saxoTRnN/vO3NhhU9XTst7AVKXp24H5hx11f7667ThEnUw5hFOH
         fZPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M8iV+GY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si1126900qvp.104.2020.02.27.05.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 05:31:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M8iV+GY0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7JGd-00052d-RM
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 08:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7JGF-0004yN-Ki
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:31:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7JGE-0006gn-GY
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:31:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57652
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7JGE-0006ge-C2
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582810290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhtu/CiTrf8+XY7umgJTohHMTw/mnHbl8+T315nQ0Ss=;
 b=M8iV+GY0paun8Dxhgn7zOhrt0OZLByYa5idpezeLVYqPxhRXaFH0WyJZhHHIbjF+CcA2lM
 BFRqn0Hsr2whV96lL0W3EN7otP5jyHsUEfADjKBMi0fqmuV0XpObf0M32i08U1vbOuJOIP
 KoKPIHEuOp/y2d+alhb10TVrK0vJ8rg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-trh04voZPFGdQV0SMVssqQ-1; Thu, 27 Feb 2020 08:31:28 -0500
X-MC-Unique: trh04voZPFGdQV0SMVssqQ-1
Received: by mail-wm1-f72.google.com with SMTP id o24so704122wmh.0
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 05:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhtu/CiTrf8+XY7umgJTohHMTw/mnHbl8+T315nQ0Ss=;
 b=cua1+2nOnVR4XqJRvJAIrPqqRFRkjlSCr6JVIxD0/aqmWnREvNWS4Qwo0WCruZzwVv
 x9AWrZDCiMtk/jgFzSzmCy2NLmc6af+QWqvofHg6YjLQ5H72cpwdTyuUR4EwDuDeJ07m
 2KVRddi7UrpH9Yvg68Mq5qJk0bV5E8hkTHZwem/jbZ6+oDjqhhebOzkQ4L/fmgh8ba2x
 o9VvkAS/9Cfv1Xpk+RO5Lr0iEWyrQExqdr8ZHBaybiLEbeFwJG2jh9SH2fOKaiZaBoVL
 bYo/RXmbC4Z4sj8C2N9UCem3EUcQqd8LDiE4PzMrbb70Ok+MgvkITKR4uThvfsFgVkEM
 A6Gg==
X-Gm-Message-State: APjAAAVWQZDnWZECnLrC88gh2Wilq7fJMyUs/A6KMeaQ2b7xEoBTVz6N
 gI29fUhmUmOGm4fm37nidKCYo/GZa9nSC3W9VuibfyAs0DwpitgqtYNVupeyC3dHjtrSjh8/m/4
 XiMdz4Y0yPdcF
X-Received: by 2002:a5d:628e:: with SMTP id k14mr4706066wru.425.1582810287166; 
 Thu, 27 Feb 2020 05:31:27 -0800 (PST)
X-Received: by 2002:a5d:628e:: with SMTP id k14mr4705994wru.425.1582810285986; 
 Thu, 27 Feb 2020 05:31:25 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id a7sm7189589wmj.12.2020.02.27.05.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 05:31:24 -0800 (PST)
Subject: Re: [PATCH v2 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
To: Stephanos Ioannidis <root@stephanos.io>,
 Alistair Francis <alistair@alistair23.me>
References: <20200227115005.66349-1-root@stephanos.io>
 <20200227115005.66349-3-root@stephanos.io>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <88ad7129-9654-088d-6569-066949973a86@redhat.com>
Date: Thu, 27 Feb 2020 14:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227115005.66349-3-root@stephanos.io>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JZhUp+L6reHV

Hi Stephanos,

On 2/27/20 12:51 PM, Stephanos Ioannidis wrote:
> The ARMv7-M CPU reset handler, which loads the initial SP and PC
> register values from the vector table, is currently executed before
> the ROM reset handler (rom_reset), and this causes the devices that
> alias low memory region (e.g. STM32F405 that aliases the flash memory
> located at 0x8000000 to 0x0) to load an invalid reset vector of 0 when
> the kernel image is linked to be loaded at the high memory address.

So we have armv7m_load_kernel -> load_elf_as -> rom_add_blob_fixed_as -> 
rom_add_blob -> rom_insert.

arm_cpu_reset is called before rom_reset, rom_ptr is NULL, we call 
initial_pc = ldl_phys(cpu_as) from an empty flash.

Then later rom_reset -> address_space_write_rom.

I think Alistair and myself use the 'loader' device with Cortex-M boards 
and never hit this problem.

> 
> For instance, it is norm for the STM32F405 firmware ELF image to have
> the text and rodata sections linked at 0x8000000, as this facilitates
> proper image loading by the firmware burning utility, and the processor
> can execute in place from the high flash memory address region as well.
> 
> In order to resolve this issue, this commit downgrades the ARMCPU reset
> handler invocation priority level to -1 such that it is always executed
> after the ROM reset handler, which has a priority level of 0.
> 
> Signed-off-by: Stephanos Ioannidis <root@stephanos.io>
> ---
>   hw/arm/armv7m.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 7531b97ccd..8b7c4b12a6 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -352,7 +352,8 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>        * way A-profile does it. Note that this means that every M profile
>        * board must call this function!
>        */
> -    qemu_register_reset(armv7m_reset, cpu);
> +    qemu_register_reset_with_priority(
> +        QEMU_RESET_PRIORITY_LEVEL(-1), armv7m_reset, cpu);
>   }
>   
>   static Property bitband_properties[] = {
> 

