Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp8298400lfb;
        Thu, 30 Dec 2021 16:00:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYHDijt2AXhugqToycMYJNz0WN73QPU+GFZxY3KpRomlNHXqD28ebxcO4YRXuGqaKBoebR
X-Received: by 2002:a25:2c44:: with SMTP id s65mr27207290ybs.204.1640908844212;
        Thu, 30 Dec 2021 16:00:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640908844; cv=none;
        d=google.com; s=arc-20160816;
        b=mnwzIIObZxbquhpuvNyGPrF3qG5e630lK80rHz6E/qEeDH/zm6HjgYRhcgphYsxt+Y
         11FlsA/jY1mfJnXwT9nAnVkhY/jwqmYO54BrnWXExyIuVxWM4zZypUHbIUyypORWn/6T
         qN02NSnXV+fsBGFtsEW5vckokjIvOOImA2Rf6sDmV1IBEulI2Rd/hh5mSCfhWka03k9A
         pLUXrNZP9Zl2L6NESoKPwVUxJ4JI3FyNTPGTXnF4xK5I1gjNM7ZuAainIMTsnB+BznAa
         PW2wwDQItoz8+ONQIEwSJzjcraQxm/uUjeZdE4GaSgPNpT8jFxzrm2boFuJlEyui2itt
         Ra7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=T0aqbBO4A4CfthvoAFbzPMw5dZcVweXSodcj5CEqHvM=;
        b=yCbsera4PA/3GCC/bSfiSMNL4p8L3TiODf7bAHYrMlikw6Qd63nJohz0byczfQDvdc
         oP2+e2kgPO0dNw4baWWtMHyhgm+Y5YTovicrcf+wrt92Vrody3CK04xInOKOwulCku+W
         eK2re9o1BDflbcGyxVONde87SCgTKEiRIpD7e+CnQ+SH2azLqPWizDmIAwxB5oLLar8n
         UM+UGd3iuvE35lzga+4AHCsCN0vMseqUI+EJAjkUNOEkeVyyyX7ixFH4z4Aq+gLCudpA
         LcwJBXH8ermGScVTAzJjFveEPy5ktJQBCgc8Lp4uUyrzZ0qKqk9088SeAJgdH68rxAko
         Z+uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="H81/LMLk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si9241638ybn.313.2021.12.30.16.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Dec 2021 16:00:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="H81/LMLk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n35Lf-0002Jo-J8
	for alex.bennee@linaro.org; Thu, 30 Dec 2021 19:00:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35Kn-0001zU-Rg
 for qemu-arm@nongnu.org; Thu, 30 Dec 2021 18:59:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35Km-00088r-A3
 for qemu-arm@nongnu.org; Thu, 30 Dec 2021 18:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640908787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0aqbBO4A4CfthvoAFbzPMw5dZcVweXSodcj5CEqHvM=;
 b=H81/LMLkYG2DCrh+wyA0qxL+xYOEAcvOw3aSSiuDJO0koFFnzYzbGr9zqdJaN7TVQU3HPs
 joSeo7L7KVzTL4PCMpJzuun4tmn6eMwRAhibPCmrPTgEPZSAvYUkFrW6/lN3giY4j+7U4b
 E25EpWkhBb0dCzKi+TyAhCl72bfcGk4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-DwA-v61XOlaN6EuQw4agZA-1; Thu, 30 Dec 2021 18:59:46 -0500
X-MC-Unique: DwA-v61XOlaN6EuQw4agZA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so10918282edc.2
 for <qemu-arm@nongnu.org>; Thu, 30 Dec 2021 15:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0aqbBO4A4CfthvoAFbzPMw5dZcVweXSodcj5CEqHvM=;
 b=qqX4GWmZs1tbflItBJn7/weThaEjlw+hfHxAqXl3MdR64TjbOVsE2Ugow30qDngXTp
 SiOwdL3CP7IpjI/vIuLP9YiN6toj/5YCmzYe8yVG8mf/WGGuxrDRDysFm/TK/woaIgoo
 iMBByMGWxW80CWpgeSaOX5IDsC1/Mab2u2ehHfqZ161g1bU5M0xgvtYJaGaRObOa0ytu
 9MnFZ5C2+WpOTYKuOWsIjZk0iZVO+QcgWpiJZv/ddWyZyNgzV8pHi8kkHjiBHZXX3dTa
 PncrBS1XMiWf5OmhwQpIRdDoxc9hje2zRZW/Jqti7ViDbr2yyTLB3yNkDBd2xyaPqJTn
 UsiQ==
X-Gm-Message-State: AOAM530TRBKCky/amEcruFboXjOAMctQdp+QiiaUFbBgRX7b7iH8Rx+T
 pOTyPsEnnR9/nedxQkWbuCIrW0m/9J74EQ5+PvbcNe9/sHzqIvlu1k3fkmrWFtKmoYKgfMp6XtG
 DBS4AkuLECvUH
X-Received: by 2002:a17:906:c14a:: with SMTP id
 dp10mr28295741ejc.294.1640908779756; 
 Thu, 30 Dec 2021 15:59:39 -0800 (PST)
X-Received: by 2002:a17:906:c14a:: with SMTP id
 dp10mr28295697ejc.294.1640908779508; 
 Thu, 30 Dec 2021 15:59:39 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id cf27sm4447444edb.74.2021.12.30.15.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 15:59:39 -0800 (PST)
Message-ID: <7e18cc6a-ad77-0134-90b4-2b6294a45e02@redhat.com>
Date: Fri, 31 Dec 2021 00:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 14/23] dma: Let dma_buf_read() / dma_buf_write()
 propagate MemTxResult
To: qemu-devel@nongnu.org
References: <20211223115554.3155328-1-philmd@redhat.com>
 <20211223115554.3155328-15-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211223115554.3155328-15-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a+Y6w71JB7qo

On 12/23/21 12:55, Philippe Mathieu-Daudé wrote:
> Since the previous commit, dma_buf_rw() returns a MemTxResult
> type. Do not discard it, return it to the caller.
> 
> Since both dma_buf_read/dma_buf_write functions were previously
> returning the QEMUSGList size not consumed, add an extra argument
> where the unconsummed size can be stored.
> 
> Update the few callers.
> 
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h  |  6 ++++--
>  hw/ide/ahci.c         |  8 ++++----
>  hw/nvme/ctrl.c        |  4 ++--
>  hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------
>  hw/scsi/scsi-bus.c    |  4 ++--
>  softmmu/dma-helpers.c | 18 ++++++----------
>  6 files changed, 52 insertions(+), 36 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index fd8f16003dd..d11c1d794f9 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -302,8 +302,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
>  BlockAIOCB *dma_blk_write(BlockBackend *blk,
>                            QEMUSGList *sg, uint64_t offset, uint32_t align,
>                            BlockCompletionFunc *cb, void *opaque);
> -uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> -uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
> +                         QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
> +                          QEMUSGList *sg, MemTxAttrs attrs);
>  

This fails on 32-bit host when passing a size_t variable as residp
argument. I'll work a "clean" fix later. Meanwhile discarding this
patch.

> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index b0be1564797..498303157e9 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -321,22 +321,16 @@ static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
>      return res;
>  }
>  
> -uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
> +MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
> +                         QEMUSGList *sg, MemTxAttrs attrs)
>  {
> -    uint64_t resid;
> -
> -    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
> -
> -    return resid;
> +    return dma_buf_rw(ptr, len, residp, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
>  }
>  
> -uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
> +MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
> +                          QEMUSGList *sg, MemTxAttrs attrs)
>  {
> -    uint64_t resid;
> -
> -    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
> -
> -    return resid;
> +    return dma_buf_rw(ptr, len, residp, sg, DMA_DIRECTION_TO_DEVICE, attrs);
>  }
>  
>  void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,

