Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1559360lfg;
        Fri, 12 Mar 2021 12:17:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTHvo9EL86qdWxZgRF8FgGBg7NDKIlrI1/RLHI2jGNq8zRpWayTYojf8kW2ai+Vfh7WAzj
X-Received: by 2002:a05:6e02:20c3:: with SMTP id 3mr3907864ilq.164.1615580251834;
        Fri, 12 Mar 2021 12:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615580251; cv=none;
        d=google.com; s=arc-20160816;
        b=n0Q7X1DHb8RXhtkdGinDbD6o5ADNBsUZMi3N9w0MFPimTS6DZW+t9lxGZ5LOB1qFlg
         3Gd0EXw1/pW8TdPImGD7q/LNigzJnB7THPc2ehe3ES9dgbkahcl/fYAmtmtiXK4J8hVg
         OBCj3EbD6X1EnDGJu8+u6f/Igkq/FeXzS0u0vQXyN2aDdQ9owPQSHeOH66iDRQUXqLgm
         pPkikRvf38nUASeB8BX8DI6EjvxrsPi2ovmsJuuDdLiovMFnHKbeIqvHOcV6Ecg8mYAE
         dg8pco8/iEuRu8y79SWE1S60qzBTCTNFQBI7AIiLwuFu9PGXa0EJ7j6YJWMuvPEfhgqm
         DWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yS8+PoMhmlh7BSkbzFpMfUgbU6xTm3ZLHXl8Y0wdstM=;
        b=pBprX79Opmr9Bkatrvnd/qCI+3st/JHfRVUOP5+SnKZQIvk/OssdCfdTKAGEpmjaEE
         52CpJyKd56kHpB/xo/Ify1JnOgmkgnRRqhQMbX6Tvl1rClIRSeEQWF/9Q+4DzC7Xnh7x
         7oiDG+2MbxF5zWYCzZP/4pBShjL1Qf86xM1EjpkGs/z1/4F36QxI4GSkT5IzLR3sQ0iC
         Jb6lPdA+IdLBQlPcngoqmv0hnMihLwrywrtvx7iNhTZHHCp7a6G3t9palbSA1buNzBbv
         oNsiftI26aKzy3yVrDb6+rREsg83Rw2yQ2Ft0SqRvxo/zHTQ1WSXjnkdvoMOPVNOIpta
         pcHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aLPiC0vY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si6226376iog.50.2021.03.12.12.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 12:17:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aLPiC0vY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKoDz-0000B8-3S
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 15:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKoDn-00006q-79; Fri, 12 Mar 2021 15:17:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKoDl-0001q5-7i; Fri, 12 Mar 2021 15:17:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so15882739wmd.5; 
 Fri, 12 Mar 2021 12:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yS8+PoMhmlh7BSkbzFpMfUgbU6xTm3ZLHXl8Y0wdstM=;
 b=aLPiC0vYG688CmJf0Ae0FXxzTdYgEgbOgwrvr8BEjyUCxouEEidgqLPsCteA5shzLR
 h+QqNwzxT42JaLF1/9qYLLL1Sw4LyRRkhZsAI/0K28+9o7d+Q9JmPcsSw5OYmy96gwye
 TvNZas7hqV7c9YjgdsXFybY6O5hpjRug7BpfXOOqHH9jx+tCJxw6o8CXap+yYhHzWOzT
 eTgim3kT0StzqOu9CiO61vPAQNgbvssQoiI1JWW16b/uMYvQkrcJn/0KhtJ0OY1WlNwG
 uzfP2BeaLxIoZkRuC+brdRy2sKVGccwTVHyJFdZehtIKVBPvmMiYPuNR7DTpUSU6Srwr
 UdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yS8+PoMhmlh7BSkbzFpMfUgbU6xTm3ZLHXl8Y0wdstM=;
 b=GlK7zf/iKuRYw3JbwCoIPYptMtmd2gLvqqUEWnc4hX4OfgrJhOSy2ixzYsLrSl9gly
 GgKY4zyJfQAh26W+vvwrvNDO4s2s1dQ3PoYufFyToQto8RzBLBpD+i0Bu39sddAS/Lb9
 aRRgY96TgKMY2JB3sAO3BFaeulFPYXgZHndxXAlvmYs+DQhuccvdKXO2Ee0OckNWp68a
 ojVJToen+psynE7TC9eDMZk+siHYzo+4J+Vg7VqiReW4IohjOB9/aDUuFfG7JMr2mure
 D1tB49iXMjZiu0iLVMbDnwlsyuJcvVDKvygEwN5XdkiOaUeJtGIFL17WSozv/8Wm7ENf
 LXdw==
X-Gm-Message-State: AOAM530ewONhupcUVza2SLOq3OpNTtLvPMpmmGpJvR2d/98mkfqr2yIn
 Bks/O/vYVo3Ofopi865dVUE=
X-Received: by 2002:a1c:7905:: with SMTP id l5mr14820678wme.181.1615580235238; 
 Fri, 12 Mar 2021 12:17:15 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u20sm10062302wru.6.2021.03.12.12.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 12:17:14 -0800 (PST)
Subject: Re: [PATCH for-6.0 2/2] target/arm: Make M-profile VTOR loads on
 reset handle memory aliasing
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <20210312172939.695-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9bbdc90-51ca-8ba6-26d8-3db820193a15@amsat.org>
Date: Fri, 12 Mar 2021 21:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312172939.695-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u8sMmVrb06py

Hi Peter,

On 3/12/21 6:29 PM, Peter Maydell wrote:
> For Arm M-profile CPUs, on reset the CPU must load its initial PC and
> SP from a vector table in guest memory.  Because we can't guarantee
> reset ordering, we have to handle the possibility that the ROM blob
> loader's reset function has not yet run when the CPU resets, in which
> case the data in an ELF file specified by the user won't be in guest
> memory to be read yet.
> 
> We work around the reset ordering problem by checking whether the ROM
> blob loader has any data for the address where the vector table is,
> using rom_ptr().  Unfortunately this does not handle the possibility
> of memory aliasing.  For many M-profile boards, memory can be
> accessed via multiple possible physical addresses; if the board has
> the vector table at address X but the user's ELF file loads data via
> a different address Y which is an alias to the same underlying guest
> RAM then rom_ptr() will not find it.
> 
> Handle the possibility of aliasing by iterating through the whole
> FlatView of the CPU's address space checking for other mappings of
> the MemoryRegion corresponding to the location of the vector table.
> If we find any aliases we use rom_ptr() to see if the ROM blob loader
> has any data there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae04884408c..aac78ae6623 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -161,6 +161,72 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
>      assert(oldvalue == newvalue);
>  }
>  
> +#ifndef CONFIG_USER_ONLY
> +typedef struct FindRomCBData {
> +    size_t size; /* Amount of data we want from ROM, in bytes */
> +    MemoryRegion *mr; /* MR at the unaliased guest addr */
> +    hwaddr xlat; /* Offset of addr within mr */
> +    uint8_t *rom; /* Output: rom data pointer, if found */
> +} FindRomCBData;
> +
> +static int find_rom_cb(Int128 start, Int128 len, const MemoryRegion *mr,
> +                       hwaddr offset_in_region, void *opaque)

Return bool maybe?

> +{
> +    FindRomCBData *cbdata = opaque;
> +    hwaddr alias_addr;
> +
> +    if (mr != cbdata->mr) {
> +        return 0;
> +    }
> +
> +    alias_addr = int128_get64(start) + cbdata->xlat - offset_in_region;
> +    cbdata->rom = rom_ptr(alias_addr, cbdata->size);
> +    if (!cbdata->rom) {
> +        return 0;
> +    }
> +    /* Found a match, stop iterating */
> +    return 1;
> +}
> +
> +static uint8_t *find_rom_for_addr(AddressSpace *as, hwaddr addr, size_t size)
> +{
> +    /*
> +     * Find any ROM data for the given guest address range.  If there
> +     * is a ROM blob then return a pointer to the host memory
> +     * corresponding to 'addr'; otherwise return NULL.
> +     *
> +     * This is like rom_ptr(), except that it handles possible aliases
> +     * within the CPU's address space, so that we still find a ROM
> +     * blob even if it was loaded to an address that aliases addr
> +     * rather than to addr itself.
> +     */
> +    FlatView *fv;
> +    uint8_t *rom;
> +    hwaddr len_unused;
> +    FindRomCBData cbdata = {};
> +
> +    /* Easy case: there's data at the actual address */
> +    rom = rom_ptr(addr, size);
> +    if (rom) {
> +        return rom;
> +    }
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    fv = address_space_to_flatview(as);
> +    cbdata.mr = flatview_translate(fv, addr, &cbdata.xlat, &len_unused,
> +                                   false, MEMTXATTRS_UNSPECIFIED);
> +    if (!cbdata.mr) {
> +        /* Nothing at this address, so there can't be any aliasing */
> +        return NULL;
> +    }
> +
> +    cbdata.size = size;
> +    flatview_for_each_range(fv, find_rom_cb, &cbdata);
> +    return cbdata.rom;
> +}
> +#endif
> +
>  static void arm_cpu_reset(DeviceState *dev)
>  {
>      CPUState *s = CPU(dev);
> @@ -331,7 +397,7 @@ static void arm_cpu_reset(DeviceState *dev)
>  
>          /* Load the initial SP and PC from offset 0 and 4 in the vector table */
>          vecbase = env->v7m.vecbase[env->v7m.secure];
> -        rom = rom_ptr(vecbase, 8);
> +        rom = find_rom_for_addr(s->as, vecbase, 8);
>          if (rom) {
>              /* Address zero is covered by ROM which hasn't yet been
>               * copied into physical memory.
> 

Your solution seems generic, and the problem is not resticted
to Cortex-M:

$ git grep rom_ptr target
target/arm/cpu.c:334:        rom = rom_ptr(vecbase, 8);
target/rx/cpu.c:61:    resetvec = rom_ptr(0xfffffffc, 4);

Some thoughs:
- make find_rom_for_addr() generic ("hw/loader.h" again?)
- poison rom_ptr() under target/ to restrict it to hw/

Regards,

Phil.
