Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp586203lfb;
        Wed, 20 May 2020 06:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy56nvVbji+9QPdgWR5yRw7mBfrMNvffkHY9AmK0VDmKESbJtjMxYz2LI+7rBBLcaChnWtM
X-Received: by 2002:a37:5804:: with SMTP id m4mr4494448qkb.109.1589981721814;
        Wed, 20 May 2020 06:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981721; cv=none;
        d=google.com; s=arc-20160816;
        b=wWzx2b7OviRQieA6AhFB+Rj+Jgc+el+C7E534JSD5q6Uj+FjRSO/d1Ae+J6sB39JaB
         cwoZExSl/BpIVViu7V4dlpEZfjCG72+Ai7DD0MhggZ1hw79jXy79pkEBCAb8xDlws9K3
         38KQDJLDDch7e9Cw9+tVdDGuocg7qRQTFzI7LBhrnniw2wcpDlCHuPjKBMmwIWvuVSkJ
         FS7wZ3ygiwl2LnRDmPO/X6+mFIgSr1bG2A28s7EwUyf9zppB34MpAc5xq9ycQMlfp3x2
         zqhLa+uuMkaPJ2t+orc6ZnWnPmLBGtH8wOwHGXYUuPsruEPf36/eeByY/yjNFkqzJWtY
         hy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lgWD20Dwrfzi0M+n4zA1V+F+krFEkXE7HFGsucmCRek=;
        b=mulveFmdjtoBDxlxiODRzkrzqhdgdE69rsoRYJbN9UEBIa+3XxIrZdlD14s11XX14L
         4/kXYwZtJ/2W4LpOxo3Ooop3sj62OnuDfj9gsDJUZSCDcas1Jr+Gf2i/MLbFKloNZHBv
         frcqV4v18zwLB8uvXjfrqN4pXvDSeQ8H3S/c9qSnWbQ7YxFzS/r2FthRRU3XwOqB+b+r
         BcdHGWbgvRx1Pl5ftUl3Vi9ep0Ji4mYZEGMl2q9QO1zVHrWuEIilxYkb03AO1ZZaR7px
         NsiGy+8lpPNgW/h9wurTJq0b8Etjrd5jewYs2JrbA35dCg6+TymR7kLSIteSWcmFO35A
         DPBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EUX4oRi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si1557712qvy.201.2020.05.20.06.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="EUX4oRi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOsT-0007aJ-8A
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOrj-0006QM-Pj
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:34:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57827
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOri-0003Ii-Uh
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgWD20Dwrfzi0M+n4zA1V+F+krFEkXE7HFGsucmCRek=;
 b=EUX4oRi/U6TqA2+esE8egZ/Ll8GRKsUTohvZjCQom8DPH7ffjSnoctmSsVW16FnZaFQRdB
 cJwE8Oao+iYTM0dcL3wB7VJQDxa3wSo6nIEWgFFzFbHax8lNKj1kSla7c7D6mCn9JFJKND
 WM1GeYkxi6Y/3GWck51rpGobAeVZ4X0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-De3K5e52O_-NkP9j--177w-1; Wed, 20 May 2020 09:34:32 -0400
X-MC-Unique: De3K5e52O_-NkP9j--177w-1
Received: by mail-wr1-f71.google.com with SMTP id i9so1433846wrx.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2020 06:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lgWD20Dwrfzi0M+n4zA1V+F+krFEkXE7HFGsucmCRek=;
 b=Bo7A+FAqDhqraMqRLQrvcslSg1x8y47xR2LGDx3m3V41UaiW75krAKA3I0LOevX1K0
 alQcwQ0ngcGVAMcOE5Tw3QcolwaclO8ZMnc+EUD/HwrH2QmARJUjm40yZLn1+4CYjkOL
 jLWGBARCj8J6kLaRH8QF0EFDI+I+v1jKWcxeUd5uExEZVyAs2Flq7k4HO4IyZjp1tACD
 QCn4aVo29rqUXA3pVpI1uzTMiz+ceiZe9ljvBRZ3zqviLbRopLCUrpOJfec657TfSwO8
 KAUA+4ZdstbHGb3ngfsc7MpPNiJWrmWVwWw/xlznasUbtmNMpY3mgmF/VCbcFPCCAbb5
 nFiw==
X-Gm-Message-State: AOAM530rUntC8T6TvGRwYpQQPGZsYuGmIJTJ+kYpGQjmGXp6V823B2gQ
 8wRw+ekb1Eh4Opxndk7z5EV/Sb5+2HKELSXB2m/tIZJW/eAIcmrbKn0r0f1vYz5DswsT1/j5ibJ
 Q20VsV1pLgTQT
X-Received: by 2002:a1c:5502:: with SMTP id j2mr5007045wmb.56.1589981671183;
 Wed, 20 May 2020 06:34:31 -0700 (PDT)
X-Received: by 2002:a1c:5502:: with SMTP id j2mr5007022wmb.56.1589981670946;
 Wed, 20 May 2020 06:34:30 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q5sm3043277wra.36.2020.05.20.06.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:34:30 -0700 (PDT)
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <83ebdc64-f049-9c0d-7d7b-243233705cda@redhat.com>
Date: Wed, 20 May 2020 15:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-15-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xn5wsioEvytL

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> Looks like the logiv was copied over from q35.

Typo 'logiv' -> 'logic'.

> 
> q35 does this for backward compatibility, there is no reason to do this
> on microvm though.  So split @ 2G unconditionally.

Yes please!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/i386/microvm.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 867d3d652145..b8f0d3283758 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -170,23 +170,9 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>       MemoryRegion *ram_below_4g, *ram_above_4g;
>       MemoryRegion *system_memory = get_system_memory();
>       FWCfgState *fw_cfg;
> -    ram_addr_t lowmem;
> +    ram_addr_t lowmem = 0x80000000; /* 2G */
>       int i;
>   
> -    /*
> -     * Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> -     * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> -     * also known as MMCFG).
> -     * If it doesn't, we need to split it in chunks below and above 4G.
> -     * In any case, try to make sure that guest addresses aligned at
> -     * 1G boundaries get mapped to host addresses aligned at 1G boundaries.
> -     */
> -    if (machine->ram_size >= 0xb0000000) {
> -        lowmem = 0x80000000;
> -    } else {
> -        lowmem = 0xb0000000;
> -    }
> -
>       /*
>        * Handle the machine opt max-ram-below-4g.  It is basically doing
>        * min(qemu limit, user limit).
> 

