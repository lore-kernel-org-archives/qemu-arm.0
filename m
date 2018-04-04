Received: by 10.28.71.155 with SMTP id m27csp4760806wmi;
        Wed, 4 Apr 2018 04:42:46 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48oYzy5/RWnigiHXvcdt1hZirv9ZY9TwXWgMTjk+qL2AZG8SFKDxHnyYOX7AJH7Fu4mFIN1
X-Received: by 10.55.116.71 with SMTP id p68mr23267516qkc.29.1522842166535;
        Wed, 04 Apr 2018 04:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522842166; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ6bB2NYoq/bsCavYqzAw/7nfdkvrIKknk4Yq48mDxnuVLdwDGAEqNfNGELCgLr7jJ
         GESz3be8YbFUmMv0ZO3+HOyNOO+MmkWthW7ZoBnQxR3dQo8ENDojf/vkilrcP9RC1kEp
         TebA37RY5gM4s2OjOcwVfquakanW0cKKQTMWBoE49QxBrTQX8HQXEecjuKBBKNm7N9hl
         oFL5g6nRuB7XQ2G9LtP9SuU1ImOEn6Qy5EA9bp6hulH3s2SDHwioZCFPFC0ckiYuVIiC
         p2rfdUj7qovTPOF9YpfmLvLUdevUBL68wXMn1UxYZi/xd4ArKx9P/7W0Vc/2gBWZG1Zy
         skzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ryKk5ZDFsddShs2WRbApzWZVPQuG0b/bD5kNIhkJgrc=;
        b=genvvZDl39hObjB2qnU1VrP3sIkZnaqMPr6rDvYk4ofEw04a1ByQsAdyW8ReRyHKiu
         XV1fFIVHbxkc0Mr3nE/yQXfHvC/IEQv9uf45zr/QY1kWrx154SEzdfZmj//HT3Qsv98E
         BPDgq2SgZPxOWAuuXcTMVt0Nq5eRtv/CjnSvBdIaxCF3TJkaPcmOj6NPnWdlFxbOrWSS
         DGW2Pwb8V3fr1aTXtFF6fqoZPrBVCi1NBZrheFupfFVuj8WCx7BKuNMoL7Kimy901iMr
         4invqgrsX+jf+SzpNDMjdhY418vEwwo0gpWYxkiQCGu1SY4mevx9Vu+6Xa/ZOeqdw4Ac
         PNvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B9RDyvoG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14si5838135qta.484.2018.04.04.04.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 04:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B9RDyvoG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3goQ-0000vY-3f
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 07:42:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3go9-0000vC-MR
	for qemu-devel@nongnu.org; Wed, 04 Apr 2018 07:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3go6-0007a3-IW
	for qemu-devel@nongnu.org; Wed, 04 Apr 2018 07:42:29 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36846)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3go6-0007Z4-DG; Wed, 04 Apr 2018 07:42:26 -0400
Received: by mail-qt0-x242.google.com with SMTP id w23so14608990qtn.3;
	Wed, 04 Apr 2018 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ryKk5ZDFsddShs2WRbApzWZVPQuG0b/bD5kNIhkJgrc=;
	b=B9RDyvoGCWJ7tnwKALLOyWZBXzHYor7dXghbjfN64ZW4OD6BSDlyycDbE6lV42MK9Q
	ZVmRO3sc9Dfmh7qXRrX+V3DA8SaglLcXBcx45gYwZfvM7Oc02jeimCRjf1hwE3aoeU6i
	bldWvvFgVOccWbLA43CgnhJPzZ0jyxT3GMGDDLeipjyJ4Xegconu64wG4g3xo1snSgYv
	IsH8dWrl4q8qg/APPO9t1klQGlea+xCqhZEyVphgQeUO+UYNC5T9D4M0anW/nDNBNN29
	LT2YgFeXm8CHGxBeI97mZrRKRZcRNdsLDMzrPVZwNB10VSV9Bjq7XPl+5xUkLQ1QpGhf
	crIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ryKk5ZDFsddShs2WRbApzWZVPQuG0b/bD5kNIhkJgrc=;
	b=n/1bODG51E0F6RT4dNpQoMhEmfqHJzKAnrMGLYhgFPW7Mk5Cl8K0Fbgh04pLThRKRP
	MZdsxSFY1FAOc33oC3cryhelf//l08G91D+Im2gSbSgPrVWrId5nP48oC/Z7ov9Jn4tu
	sqd7eQ6+Sk+thZam+xEpcy8bK6ZcCb3+TkmHKTqPFLLMfLJYSWe+gsGmhPUAaX/T6DwE
	8hPgdTiEUwYWCvHGKkRnoNzsuFgUm9Gmvwt7YTHJtP/mbPIbw44Un8P3KitdSWxskTxR
	/5stSoAA56e95QxxZjgBJ60xkPkKrGB+H7ezxRB4K/Iw1B8KC7ad5GD0r65uq6DNajKG
	HHww==
X-Gm-Message-State: ALQs6tDUjdxHVnhqSntTpmwUInx2s2S8coLbUuKzEQ631W5ntXyln/gz
	b31ysRjumFq4jGxrmv5hA2g=
X-Received: by 10.200.41.237 with SMTP id 42mr26388129qtt.159.1522842145670;
	Wed, 04 Apr 2018 04:42:25 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	f17sm3521447qkm.60.2018.04.04.04.42.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 04:42:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6431180d-fcaa-6a9c-de22-5ded33433be8@amsat.org>
Date: Wed, 4 Apr 2018 08:42:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180319161556.16446-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH for-2.12 1/2] hw/sd/bcm2835_sdhost: Add
 tracepoints
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pekka Enberg <penberg@iki.fi>, Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fha0OkIUnKNf

Hi Peter,

On 03/19/2018 01:15 PM, Peter Maydell wrote:
> Add some tracepoints to the bcm2835_sdhost driver, to assist
> debugging.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/sd/bcm2835_sdhost.c | 10 ++++++++++
>  hw/sd/trace-events     |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> index f7f4e656df..79f3c5ceeb 100644
> --- a/hw/sd/bcm2835_sdhost.c
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -15,6 +15,7 @@
>  #include "qemu/log.h"
>  #include "sysemu/blockdev.h"
>  #include "hw/sd/bcm2835_sdhost.h"
> +#include "trace.h"
>  
>  #define TYPE_BCM2835_SDHOST_BUS "bcm2835-sdhost-bus"
>  #define BCM2835_SDHOST_BUS(obj) \
> @@ -99,6 +100,7 @@ static void bcm2835_sdhost_update_irq(BCM2835SDHostState *s)
>  {
>      uint32_t irq = s->status &
>          (SDHSTS_BUSY_IRPT | SDHSTS_BLOCK_IRPT | SDHSTS_SDIO_IRPT);
> +    trace_bcm2835_sdhost_update_irq(irq);
>      qemu_set_irq(s->irq, !!irq);
>  }
>  
> @@ -211,6 +213,7 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
>  
>          s->edm &= ~0xf;
>          s->edm |= SDEDM_FSM_DATAMODE;
> +        trace_bcm2835_sdhost_edm_change("datacnt 0", s->edm);
>  
>          if (s->config & SDHCFG_DATA_IRPT_EN) {
>              s->status |= SDHSTS_SDIO_IRPT;
> @@ -229,6 +232,7 @@ static void bcm2835_sdhost_fifo_run(BCM2835SDHostState *s)
>  
>      s->edm &= ~(0x1f << 4);
>      s->edm |= ((s->fifo_len & 0x1f) << 4);
> +    trace_bcm2835_sdhost_edm_change("fifo run", s->edm);
>  }
>  
>  static uint64_t bcm2835_sdhost_read(void *opaque, hwaddr offset,
> @@ -280,6 +284,8 @@ static uint64_t bcm2835_sdhost_read(void *opaque, hwaddr offset,
>          break;
>      }
>  
> +    trace_bcm2835_sdhost_read(offset, res, size);
> +
>      return res;
>  }
>  
> @@ -288,6 +294,8 @@ static void bcm2835_sdhost_write(void *opaque, hwaddr offset,
>  {
>      BCM2835SDHostState *s = (BCM2835SDHostState *)opaque;
>  
> +    trace_bcm2835_sdhost_write(offset, value, size);
> +
>      switch (offset) {
>      case SDCMD:
>          s->cmd = value;
> @@ -314,6 +322,7 @@ static void bcm2835_sdhost_write(void *opaque, hwaddr offset,
>              value &= ~0xf;
>          }
>          s->edm = value;
> +        trace_bcm2835_sdhost_edm_change("guest register write", s->edm);
>          break;
>      case SDHCFG:
>          s->config = value;
> @@ -390,6 +399,7 @@ static void bcm2835_sdhost_reset(DeviceState *dev)
>      s->cmd = 0;
>      s->cmdarg = 0;
>      s->edm = 0x0000c60f;
> +    trace_bcm2835_sdhost_edm_change("device reset", s->edm);
>      s->config = 0;
>      s->hbct = 0;
>      s->hblc = 0;
> diff --git a/hw/sd/trace-events b/hw/sd/trace-events
> index 2059ace61f..bfd1d62efc 100644
> --- a/hw/sd/trace-events
> +++ b/hw/sd/trace-events
> @@ -1,5 +1,11 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>  
> +# hw/sd/bcm2835_sdhost.c
> +bcm2835_sdhost_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +bcm2835_sdhost_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"

Can you use the more explicit "size_t" and "%zu" please?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +bcm2835_sdhost_edm_change(const char *why, uint32_t edm) "(%s) EDM now 0x%x"
> +bcm2835_sdhost_update_irq(uint32_t irq) "IRQ bits 0x%x\n"
> +
>  # hw/sd/core.c
>  sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg, uint8_t crc) "@%s CMD%02d arg 0x%08x crc 0x%02x"
>  sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
> 
