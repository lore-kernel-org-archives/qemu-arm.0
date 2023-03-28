Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2838050ejb;
        Tue, 28 Mar 2023 10:56:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350YARM5k+kQ2mZE6+HUt/t4TJMyCmsh6+NwqClD2ygd2s1uGjh567z0X3HSguYPHRCKuIrKa
X-Received: by 2002:a05:6214:e47:b0:5a3:fffa:f600 with SMTP id o7-20020a0562140e4700b005a3fffaf600mr22975968qvc.26.1680026199489;
        Tue, 28 Mar 2023 10:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680026199; cv=none;
        d=google.com; s=arc-20160816;
        b=m9fyHKP5+VNNbLyZCZ+wMbow6nxrNTb0/J9aJjqJnlF07Lo++fJ/peUhbJAx/+oz/N
         8SS7GYKpOMwCO1X+lrffpsbVHAC6xrOdTkxIhrmgfUltqjYpyiJw8LBWTvFPnnkh2IM4
         DMUptuKxFHtNrtMWb/D0bUzk60I9xtq72AvBAk5GMOeRofrg6tah+gCzPkkApY3ZWFrG
         NIdXy9OE4lBoGMb+3rT8gT9iGd9P3Kb21Ijb9NiXVLdfn9d2eoUcbel6na9Cj64d38hT
         Ar9zRT4AXdR9FN9gFdIZrW/58/HvxShS3J61CwZr45NQ2xhubhi2BhdVxaDMm40WwAnD
         RTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=t9XEIM7eHgqeHJ+Y9dPjhkmj1rViCNRDvqYiCMo+ED4=;
        b=D6b3EGd2Lrvc8rLrKpZ3hdy928woUinba2SwsaVerx4LbAQYoXozGUfx3BpFbmqf1a
         5qnYx07jkpef/7xzY4+VOne8NVwHsQIf5GlRndUrhpkm0pxzZhxClUGVxitBmq/NZD61
         itMv7/UO8S10vCL0/3gjXl74eN5d9NOoZ+WWhJitwGcjhgs8QppThtyenHPAKP/Fp0eg
         sMwP8aB5kWEVVmyjRJI/Lqknx+DvAIVKqpQTDrDNL5yFpbcQ9EY0cpQskqXkZBiyOjmR
         QTKbr6b7dncJncUzqMjPheQDggN+uFFryE85UymHjU25XwlDmQ1F/k9HvAgzeR+rsOgi
         cdnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UF0ZeKE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020ad44b33000000b005ab07d135e0si21225358qvw.46.2023.03.28.10.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 10:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UF0ZeKE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phDYQ-0003LA-LZ; Tue, 28 Mar 2023 13:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1phDYN-0003JR-O3; Tue, 28 Mar 2023 13:56:15 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1phDYL-00064V-To; Tue, 28 Mar 2023 13:56:15 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-17ec8963db8so13558142fac.8; 
 Tue, 28 Mar 2023 10:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680026172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t9XEIM7eHgqeHJ+Y9dPjhkmj1rViCNRDvqYiCMo+ED4=;
 b=UF0ZeKE3uQn5PBPFL/gI3KG9G1+zp8gJ4oN8JvFseBPmq+yYoJgcf5c7CLM+th1bWM
 FA6O396JMWIyPXyJnz9kOhs/dmhvYRZF+azBeaflWc0rB3eLFTblCx+T23rDL5FHHZCA
 Rwt4E1zEta3TiYn5PoXL20pi3dxs9u+pevHhHta060DFCXLUFztvAEQVKtKTOxlVvbl+
 QmmGxlhL2JkOMWl1xjiHANhISSg7suByLw5apyE6UG10cYbf7g7VrMJpdvezp+K1j2eC
 uwQP8ZaAp3C8SKkOAbPgf2AM3uMFMqG6CSAfqwwQbik/1v/4PuzU7vcAkCtxw98av2Gx
 08Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680026172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t9XEIM7eHgqeHJ+Y9dPjhkmj1rViCNRDvqYiCMo+ED4=;
 b=TFuSBu4qXIoCRu5+KDyeg2L5Q76FxvVgskx2Gz33A8SzrLCu2vW32iYCIQWzZV2oFh
 krMBjJV8sEzaQm/JH18WILdNjuS2XXyyA0Xq9gV74+YMNvs7B/JTg8Fn+lDSfA9ACkVx
 ZkYuLsV5nj+Z+1h9318JmcAPVXzXXRXNUjelz2dzALfPbyjRKYrdyukYQyN+6p/izGCX
 brrRWrPR5XzsouKBu1ASPbNYWVlCmq9wPBCqqtsVF9zEw9/FD641ayM+HJlGKmDDCpI4
 QLgNFZuPCFZl0ht4TEMry80Etur4Y1lxqHucC9FvLFYDaCyzERUzrm8ODvEpCtUg15Zs
 yDtw==
X-Gm-Message-State: AAQBX9ddn+BE9dpSpLuJnctDsn298yPJXuW3M261ptjJROVEzqW+mYb/
 wugYXfhicHmYlD8bUEfz1ZI=
X-Received: by 2002:a05:6870:414a:b0:17e:7d94:8b55 with SMTP id
 r10-20020a056870414a00b0017e7d948b55mr11378433oad.46.1680026171927; 
 Tue, 28 Mar 2023 10:56:11 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a9d6ac9000000b0069f153bb37asm8315284otq.62.2023.03.28.10.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:56:11 -0700 (PDT)
Message-ID: <dfac418a-1e8c-3db5-3e29-4c5724d3e7f3@gmail.com>
Date: Tue, 28 Mar 2023 14:56:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] hw/arm: do not free machine->fdt in arm_load_dtb()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230328165935.1512846-1-armbru@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230328165935.1512846-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CC14MgiY+XMN



On 3/28/23 13:59, Markus Armbruster wrote:
> At this moment, arm_load_dtb() can free machine->fdt when
> binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
> retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
> the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
> machine->fdt. And, in that case, the existing g_free(fdt) at the end of
> arm_load_dtb() will make machine->fdt point to an invalid memory region.
> 
> Since monitor command 'dumpdtb' was introduced a couple of releases
> ago, running it with any ARM machine that uses arm_load_dtb() will
> crash QEMU.
> 
> Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
> of freeing 'fdt', assign it back to ms->fdt.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
> Reported-by: Markus Armbruster <armbru@redhat.com>i
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/arm/boot.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 50e5141116..54f6a3e0b3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -689,7 +689,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>       qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
>                                          rom_ptr_for_as(as, addr, size));
>   
> -    g_free(fdt);
> +    if (fdt != ms->fdt) {
> +        g_free(ms->fdt);
> +        ms->fdt = fdt;
> +    }
>   
>       return size;
>   
