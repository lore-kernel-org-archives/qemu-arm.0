Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3012899wrg;
        Fri, 24 May 2019 06:13:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/aq17YbnkNyYamdB3k7SUT8kT2e9aDrt1PczKHwYzdH2cpq60eslQcJEyh/0kH4zAU0Ta
X-Received: by 2002:ab0:45f1:: with SMTP id u104mr24957028uau.38.1558703638440;
        Fri, 24 May 2019 06:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558703638; cv=none;
        d=google.com; s=arc-20160816;
        b=VvBZhtLhJyaz3kcUACADz8hIBnRTCyGONyciJQtFaV6Gnf9EmgzBERkuzPknd5eQyz
         M5Edg3exXgWafi0wJki+iD8xHLn+yK0MB0DkIb+XQYO4SaBuydeqWYEFoOGuqyAxNYx6
         2wuEDlKaaQToE1GK9dlF2WHQ0sAj3pBBij2rZFbyUT2PUnMU5JUQeCmotO3UpQYATEsJ
         ntbJz5V8W4P2Wnws60DDE7wqKRf2qpLIK8TeSNAt98GmRFc2PcRcgdXfJrMMcryvhpZV
         OtZJ5TH3yMw8vuPBKxEIyxfE6M6KBVCZDpgDVnlMrl/d9/Mwuml663OZPjCdUstRIQ+R
         XTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=+b5UOSAlUR+hB3EqivhPNylQiolTiEORqjkuY+QlSLo=;
        b=XrlA7HvMupJ0Ytjz6Rp4XqW28Gh+tpt6e5ZBvFbvgOxGQrlImtCBzWls/pqPsc9kvG
         DMKHgn2mIgYAxBPmZKlphexti5rvyyhvWcMMe7qINqaMiIN/4fE1JiFTznUPFmLw3Qv/
         XyUJSiU2I+3zyFInIvgKQS6JdT9/73B0jdUhKNHp5BNYNWDyqbDECbNhni2bJFjIcqQd
         0ggdqVGNEyaCcRoLMisSgkJL7YxaTvGH2W3Tx0Ix47sCZDcNT0vrBkZYHXDCy9tpL3WR
         fWbVM51m2JqnWVMqakhPU5sGKxUhUgFVSVNtqf+lJIyuDO9+UPXBZlVMAc/N19SOzGIh
         1qsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si905756vsi.135.2019.05.24.06.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 06:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUA1F-0007mG-M3
	for alex.bennee@linaro.org; Fri, 24 May 2019 09:13:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hUA0u-0007kR-OH
	for qemu-arm@nongnu.org; Fri, 24 May 2019 09:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hUA0s-0003NI-J9
	for qemu-arm@nongnu.org; Fri, 24 May 2019 09:13:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hUA0r-0003Lk-98
	for qemu-arm@nongnu.org; Fri, 24 May 2019 09:13:33 -0400
Received: by mail-wm1-f67.google.com with SMTP id x64so9343076wmb.5
	for <qemu-arm@nongnu.org>; Fri, 24 May 2019 06:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+b5UOSAlUR+hB3EqivhPNylQiolTiEORqjkuY+QlSLo=;
	b=ppahecVGqp9Jvyq5G6K6cyyzR4ySWziShKsheTNbIliYdKQTrOVTy1O9J32br+2CJw
	0HKzKbwUokQEqLQE0CZotV5ni7Ex1ANNh9iyvsA+pEFM94CSLdzz4nhoM8cHGoKQo04v
	foWUNY1wXQC9/DYVgz2swi97PuoCTWXmNv5UKdBbbu8WRmwsoEe2MRPZ9AL/5TDUceHY
	M3azOUhF/bBjdXh1F/Hhxvm17LGzQtoDrJtSKfdYk8Avm4SWgf2akuxsQ343UKR2nhsg
	kci70IvxtEDD239pG+r5CCZwN8WJ0lnWpW4MLwckW1cwif3m+ItzQnwuRdsKho2n3d0P
	tzVg==
X-Gm-Message-State: APjAAAVq9kWbDopLcKyIzlsEphGRr/Oa6uKYcCwTHX9Q07ofpMhb25YC
	5yIlpb8mttl0OSoJhBKEgtXBdA==
X-Received: by 2002:a1c:35c9:: with SMTP id
	c192mr15305708wma.147.1558703610997; 
	Fri, 24 May 2019 06:13:30 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	z74sm14412362wmc.2.2019.05.24.06.13.30
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 06:13:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190524124248.28394-1-peter.maydell@linaro.org>
	<20190524124248.28394-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d5c49edf-f864-09ff-be9d-7072cfbb355b@redhat.com>
Date: Fri, 24 May 2019 15:13:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524124248.28394-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v2 1/2] hw/intc/arm_gicv3: Fix decoding of ID
 register range
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JAFbmm1k4k6X

On 5/24/19 2:42 PM, Peter Maydell wrote:
> The GIC ID registers cover an area 0x30 bytes in size
> (12 registers, 4 bytes each). We were incorrectly decoding
> only the first 0x20 bytes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_dist.c   | 4 ++--
>  hw/intc/arm_gicv3_redist.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index 53c55c57291..e6fe4905fd3 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -533,7 +533,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          }
>          return MEMTX_OK;
>      }
> -    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
> +    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
>          /* ID registers */
>          *data = gicv3_idreg(offset - GICD_IDREGS);
>          return MEMTX_OK;
> @@ -744,7 +744,7 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
>          gicd_write_irouter(s, attrs, irq, r);
>          return MEMTX_OK;
>      }
> -    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
> +    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
>      case GICD_TYPER:
>      case GICD_IIDR:
>          /* RO registers, ignore the write */
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 3b0ba6de1ab..8645220d618 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -233,7 +233,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>          }
>          *data = cs->gicr_nsacr;
>          return MEMTX_OK;
> -    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
> +    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
>          *data = gicv3_idreg(offset - GICR_IDREGS);
>          return MEMTX_OK;
>      default:
> @@ -363,7 +363,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          return MEMTX_OK;
>      case GICR_IIDR:
>      case GICR_TYPER:
> -    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
> +    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
>          /* RO registers, ignore the write */
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid guest write to RO register at offset "
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
