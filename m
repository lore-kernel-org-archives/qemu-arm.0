Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp588319ejb;
        Tue, 31 Oct 2023 15:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjuzfBooIhRMoRPOGUqgLGOweZSWq9JXN7GHdHv/KhCMGTM0oYE3WHHOE02itMctvTNtHk
X-Received: by 2002:a05:620a:2456:b0:774:1e07:ea0d with SMTP id h22-20020a05620a245600b007741e07ea0dmr16023988qkn.44.1698790143764;
        Tue, 31 Oct 2023 15:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698790143; cv=none;
        d=google.com; s=arc-20160816;
        b=SIDoNKZFY5LrfjtsKzIMB7x27aBCCHcwOteoqA4JM+ya9Sk9XU/4WhlB+ZH7jVQkDy
         emq58TsjaKfeTYKPE8/NxiQaa1jBLcJ3+r5Ic9JtOh+MBJcDOcFkWJwA0ALAnkLHstVA
         ezHhlZR9hluP9nZV2NUKaT3KeiXrfs6ZEOXzMy/jZXK6NcKoFnKiSkn4GlA2ClQOCSYw
         F5yII5pAEy9bg6AkRn1mk6AzWgI0DEvnTZzoEQ60towZ5EggzlIi1jvsczlph69x8/oy
         HcLuOOf2UaPemG62qN9+NDG4DGodNEkqpWp68vJPRR01Hkcao20wRiVhvL3gp43ln8iY
         IsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=szRmH4mI1auJGFtVXIciKcFGknxwRbkeXSZ3Hrp7/rc=;
        fh=7kZDB/BEqRw3/IPfBhzatSppDyFrJanN45jfGknV4PU=;
        b=K9x8Vgs/U9AE7djZ0m8pZ/QjZm+RGoudfJivX9uAqNyB0vzy8nO21Zt1i75NWHE9kq
         gV2LcmzFc57qfFclRzk82Ov+bkZFZmei/vAiQdN+dOfm6rc0hp2+I+RmPzAUnhgVvqEL
         J/LMBKdYHpndCO898CoY0MYf9XSjBCB1pVf5nBBXsvCjK+a4eZ/Z19Tvl0rRP+BaJrHN
         CBBPY/dbs7dsPycKZ17rHAaQ52O7quOV5vEMmBsFYa6CMywBxKN2O88WkOrfNp+1sUxb
         L40J2a3uYJBxM7re3VpVd2odKKvknVIzFVn3P1tJ9ZFeFD1+vPfVbQbkoF6iFDvK++rp
         HjZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=lBU8S7Ve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05620a048800b0077055f2ec4dsi1816370qkr.250.2023.10.31.15.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 15:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=lBU8S7Ve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxwuw-0001vQ-86; Tue, 31 Oct 2023 18:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1qxwuv-0001ul-GR; Tue, 31 Oct 2023 18:08:57 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1qxwut-00067S-HE; Tue, 31 Oct 2023 18:08:57 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6d2de704f53so2954720a34.2; 
 Tue, 31 Oct 2023 15:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698790133; x=1699394933; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szRmH4mI1auJGFtVXIciKcFGknxwRbkeXSZ3Hrp7/rc=;
 b=lBU8S7VeMRAZPKTocSVf7RmlZmZxxd+CYxwEf5nX2RAzetS/x9DV80NbuSFSXXaiZk
 BV/Wmvc7mQ5Q5LCRjcIiCsTfB+XSjXXQ6G34ljKWpBTspOKFTtLInz5WkisuajTsjmyN
 pn9FoorLVGUWbkZsvQR3rOQrxJZg7XqtruqerFAooxQkeEXYq73FYFqEItAHgZh9KYk0
 D+gVyiNRPickDuTCjhnZO/wHwxEq9vAbuTHu2Mh5vSuLnDmuDGkoeNDZdyrqg61v5kiU
 HqZzPuNQytI37gV+1phoE2iYMOhPwsv6Ecgv1GsHHT7SFE3FruLyDMsgbkQWQoU70yy3
 JlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698790133; x=1699394933;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=szRmH4mI1auJGFtVXIciKcFGknxwRbkeXSZ3Hrp7/rc=;
 b=FozEjTqzldvv70ivpcT8+P3hLA90Boe86dg0Q/u/iijqNT6Fk4KcZmMsetZCFNH9Vm
 ASj2sxAAPkq8cQxe8SmMIlFPQnqTl4VvqZNppI0xi/QLNWZvlln3mpVQV2G31Jix6SSB
 F6Wab14ENVHxiwdC+T8GR6Tv59w06ZeNlVGqrFKKte5t1pBNaSo5tn1oijfMv8P2TEd5
 whgmGNNv4GZn2jS0N6x7TDpXIpllDGrw9jazhiXpuHWavPEarpyZNzsDlqfFFkfoECrJ
 36vH3kuJqPaowEzr/63eMsgMjKO4dTYZli1rc/LmI8vkAItwqgfmhUFz6nDKH1P4NJEL
 RH6A==
X-Gm-Message-State: AOJu0Yz8Rx7ybR0mOCOj9ZPlQ+49z6DKdZKLfbLkxT6uSBVnYR1Jk0wW
 Easv8zS1Fb0Dts5J2223zg==
X-Received: by 2002:a05:6830:348a:b0:6d3:a8b:b34 with SMTP id
 c10-20020a056830348a00b006d30a8b0b34mr4431288otu.5.1698790133260; 
 Tue, 31 Oct 2023 15:08:53 -0700 (PDT)
Received: from serve.minyard.net ([47.189.89.62])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056830269200b006b871010cb1sm31663otu.46.2023.10.31.15.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 15:08:52 -0700 (PDT)
Received: from mail.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:bec2:80c4:26f2:c650])
 by serve.minyard.net (Postfix) with ESMTPSA id 46569180053;
 Tue, 31 Oct 2023 22:08:52 +0000 (UTC)
Date: Tue, 31 Oct 2023 17:08:51 -0500
From: Corey Minyard <minyard@acm.org>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 5/6] hw/i2c/pm_smbus: Convert DPRINTF to trace events
Message-ID: <ZUF681AIr/RWaUAq@mail.minyard.net>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028122415.14869-6-shentey@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HWO8cZ1i1eqQ

On Sat, Oct 28, 2023 at 02:24:14PM +0200, Bernhard Beschow wrote:
> Let the trace messages slightly deviate from the function names
> ("smb" -> "smbus") being traced in order to avoid conflights with the SMB
> protocol.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Looks good to me.

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/pm_smbus.c   | 18 ++++--------------
>  hw/i2c/trace-events |  6 ++++++
>  2 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> index 4e1b8a5182..78e7c229a8 100644
> --- a/hw/i2c/pm_smbus.c
> +++ b/hw/i2c/pm_smbus.c
> @@ -23,6 +23,7 @@
>  #include "hw/i2c/pm_smbus.h"
>  #include "hw/i2c/smbus_master.h"
>  #include "migration/vmstate.h"
> +#include "trace.h"
>  
>  #define SMBHSTSTS       0x00
>  #define SMBHSTCNT       0x02
> @@ -64,15 +65,6 @@
>  #define AUX_BLK       (1 << 1)
>  #define AUX_MASK      0x3
>  
> -/*#define DEBUG*/
> -
> -#ifdef DEBUG
> -# define SMBUS_DPRINTF(format, ...)     printf(format, ## __VA_ARGS__)
> -#else
> -# define SMBUS_DPRINTF(format, ...)     do { } while (0)
> -#endif
> -
> -
>  static void smb_transaction(PMSMBus *s)
>  {
>      uint8_t prot = (s->smb_ctl >> 2) & 0x07;
> @@ -82,7 +74,7 @@ static void smb_transaction(PMSMBus *s)
>      I2CBus *bus = s->smbus;
>      int ret;
>  
> -    SMBUS_DPRINTF("SMBus trans addr=0x%02x prot=0x%02x\n", addr, prot);
> +    trace_smbus_transaction(addr, prot);
>      /* Transaction isn't exec if STS_DEV_ERR bit set */
>      if ((s->smb_stat & STS_DEV_ERR) != 0)  {
>          goto error;
> @@ -258,8 +250,7 @@ static void smb_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
>      PMSMBus *s = opaque;
>      uint8_t clear_byte_done;
>  
> -    SMBUS_DPRINTF("SMB writeb port=0x%04" HWADDR_PRIx
> -                  " val=0x%02" PRIx64 "\n", addr, val);
> +    trace_smbus_ioport_writeb(addr, val);
>      switch(addr) {
>      case SMBHSTSTS:
>          clear_byte_done = s->smb_stat & val & STS_BYTE_DONE;
> @@ -429,8 +420,7 @@ static uint64_t smb_ioport_readb(void *opaque, hwaddr addr, unsigned width)
>          val = 0;
>          break;
>      }
> -    SMBUS_DPRINTF("SMB readb port=0x%04" HWADDR_PRIx " val=0x%02x\n",
> -                  addr, val);
> +    trace_smbus_ioport_readb(addr, val);
>  
>      if (s->set_irq) {
>          s->set_irq(s, smb_irq_value(s));
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index d7b1e25858..6900e06eda 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -15,6 +15,12 @@ i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%0
>  i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>  i2c_ack(void) ""
>  
> +# pm_smbus.c
> +
> +smbus_ioport_readb(uint16_t addr, uint8_t data) "[0x%04" PRIx16 "] -> val=0x%02x"
> +smbus_ioport_writeb(uint16_t addr, uint8_t data) "[0x%04" PRIx16 "] <- val=0x%02x"
> +smbus_transaction(uint8_t addr, uint8_t prot) "addr=0x%02x prot=0x%02x"
> +
>  # allwinner_i2c.c
>  
>  allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t value) "read %s [0x%" PRIx64 "]: -> 0x%" PRIx64
> -- 
> 2.42.0
> 
> 
