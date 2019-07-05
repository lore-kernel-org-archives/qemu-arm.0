Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2898606wru;
        Fri, 5 Jul 2019 01:52:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyG8QSa7HnlY4Z3/0IB12Hwtig5+73XhS4Dmuh22rwR20YMINHcmRHc8kxot1iq20903GLS
X-Received: by 2002:a17:906:63c2:: with SMTP id u2mr2372625ejk.268.1562316746392;
        Fri, 05 Jul 2019 01:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562316746; cv=none;
        d=google.com; s=arc-20160816;
        b=B7v03DXiGMAhDKeHs7nCD4sQfUayNBv0+ILw9TVuzj0srp2U/MYoHUkZeyzFRz/tNE
         /eZ2asjTBdoy786j65MP6Yq6+ADPw5qJkf3A27XqOLkuAF6K/91W6hqxM+SGKFGM1tV9
         bSpASNkteKLUp1XRffUu+GDPF6EsjpkoQQPQdrZchBy4TeygofcHTnEaSNEXTX+KHNUg
         g0W8CyuH9ZW+BYMw8qlvbc87k2hZADuy/0dMBwVTtO4CAlbkOD4axdglRLeJGgBXMlzY
         NTjpx9b/WSmazNwNI6w8mR+qb66MEWG7OULpT66OXr+B0CboZn+0RdsrTzacWKyfwUIf
         mEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=mk4ycAxdx0O0XvVyW6e66hkGhmNaiymjWNoGqwtdors=;
        b=p2sm8QOh8I1SkIO8HFSJqXY+7uc3MdIvbakoGp2sioiuP9mkJmT1xFR3KdUKiuxJSa
         mirrxePgYkBpLNmoQb9jD729EA+cyQGkPanK3KEepOMXb95qVbyK5rqcajk1L8+yyTEa
         9IWMbFoPzLW4kl1m7ADE9bylEWUwPCzldQPyegzLeOX7qE+EjZxvHLXunMszNF+ZQFBn
         jxBGpxut8HF+dKorp6q4R16Nibf9lSHDmLGM+Q4+yZdObjpANOIBP9PCrFggpJBkeP1o
         baEeLia652vLeZF8/fch6yrqrMrPTF/Ci3++bbvRoS6eAgyT0oZEnCSk9W61xJq+YpvH
         uD7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pv18si5279472ejb.115.2019.07.05.01.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 01:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjJxB-0001Bn-Hf
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 04:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60947)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjJwk-00018M-9L
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 04:51:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjJwj-0004aU-5X
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 04:51:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hjJwi-0004Zv-VQ
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 04:51:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so6975055wmd.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2019 01:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mk4ycAxdx0O0XvVyW6e66hkGhmNaiymjWNoGqwtdors=;
 b=mQbcr9TAB8Bv5ijQXOJL1DLWfXEoa6XPipNDvE6vLbdDD1sH2+1Qk+5SnExarGY88b
 fquHEcbspaZtRz0u/gkeMOrm5IgprGNt4VQdYe1R/OZAG2oLqyS+sxCY3Wiv2beOYrd8
 9GajEWSiV4F7L2yRwPq6u5xAtEcALLFwKNYHTa5DDBPBQWbWf3UWsIHr7j2clK51BZ5/
 XHmLVxRBekFnrjZkqPlA+VP5CVBRJpXWt9dzo/fBFUWNTpLfX+YXMSEs1ybWkYQJjLJd
 DiWnFIk1h7ZFEtpYBejRN2MYEGWb3MwCMTIRyx51OSje1J94KUqYSHtM+B2320qFVCfj
 kzWQ==
X-Gm-Message-State: APjAAAVvsv80PkEvfuwa0nxQN0HZuFK0tcZIOaBYT6psR9bpm8bTsvfj
 Pf1EmFBJSF6jUyvZr8EFipgusA==
X-Received: by 2002:a1c:9696:: with SMTP id y144mr2398569wmd.73.1562316715449; 
 Fri, 05 Jul 2019 01:51:55 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id x20sm7612123wmc.1.2019.07.05.01.51.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 01:51:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190704142004.7150-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3bb189fa-8e47-acb0-89a2-9b5121c2269f@redhat.com>
Date: Fri, 5 Jul 2019 10:51:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190704142004.7150-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/arm/sbsa-ref: Remove
 unnecessary check for secure_sysmem == NULL
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
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GYVtbWZ3dYsa

On 7/4/19 4:20 PM, Peter Maydell wrote:
> In the virt machine, we support TrustZone being either present or
> absent, and so the code must deal with the secure_sysmem pointer
> possibly being NULL. In the sbsa-ref machine, TrustZone is always
> present, but some code and comments copied from virt still treat
> it as possibly not being present.
> 
> This causes Coverity to complain (CID 1407287) that we check
> secure_sysmem for being NULL after an unconditional dereference.
> Simplify the code so that instead of initializing the variable
> to NULL, unconditionally assigning it, and then testing it for NULL,
> we just initialize it correctly in the variable declaration and
> then assume it to be non-NULL. We also delete a comment which
> only applied to the non-TrustZone config.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not a bug as such, but we should put it in for 4.1 to
> keep Coverity happy.
> ---
>  hw/arm/sbsa-ref.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index ee53f0ff60d..6f315b79445 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -254,8 +254,6 @@ static void sbsa_flash_map(SBSAMachineState *sms,
>       * sysmem is the system memory space. secure_sysmem is the secure view
>       * of the system, and the first flash device should be made visible only
>       * there. The second flash device is visible to both secure and nonsecure.
> -     * If sysmem == secure_sysmem this means there is no separate Secure
> -     * address space and both flash devices are generally visible.
>       */
>      hwaddr flashsize = sbsa_ref_memmap[SBSA_FLASH].size / 2;
>      hwaddr flashbase = sbsa_ref_memmap[SBSA_FLASH].base;
> @@ -588,7 +586,7 @@ static void sbsa_ref_init(MachineState *machine)
>      SBSAMachineState *sms = SBSA_MACHINE(machine);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      MemoryRegion *sysmem = get_system_memory();
> -    MemoryRegion *secure_sysmem = NULL;
> +    MemoryRegion *secure_sysmem = g_new(MemoryRegion, 1);
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      bool firmware_loaded;
>      const CPUArchIdList *possible_cpus;
> @@ -612,13 +610,11 @@ static void sbsa_ref_init(MachineState *machine)
>       * containing the system memory at low priority; any secure-only
>       * devices go in at higher priority and take precedence.
>       */
> -    secure_sysmem = g_new(MemoryRegion, 1);
>      memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
>                         UINT64_MAX);
>      memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
>  
> -    firmware_loaded = sbsa_firmware_init(sms, sysmem,
> -                                         secure_sysmem ?: sysmem);
> +    firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
>  
>      if (machine->kernel_filename && firmware_loaded) {
>          error_report("sbsa-ref: No fw_cfg device on this machine, "
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
