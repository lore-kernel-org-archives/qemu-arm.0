Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7093053wrw;
        Thu, 15 Nov 2018 06:48:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5ePFckcgk3IiBysQD8sAFp/VlkF9h18wrmW732/EjVcp6b/HFU6xlmR1lep1X20qGcqHlIU
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr6260435qke.89.1542293311416;
        Thu, 15 Nov 2018 06:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542293311; cv=none;
        d=google.com; s=arc-20160816;
        b=ux1TAfYTM3GDyeO6+xETRRkSfkRiA2qxkwL1EKSmUmgaE5G2c9UrLIPuN8AOiAJ756
         uZ+HQtqhDQbP/l+5Z9Yh0gkpFNy1Vo+JUFkRvahyGZOKvb1zj41rRGvdQmI579IR4QoO
         zP04eqR5Ls6LERknwCKZixIMe2TIEtHUy6td3vVyy4boFUCzMTKRtLbS6J1U5cHFdDeJ
         tn3fecduwUNXxLziYGOicCqISIuS4w9H5hr0rCRX8BjGiLOfwk/mCTPOOz8mrDMlbYkV
         ZUF2WRRXLriDeL86Nr020VuuvpvEe3bV4ly49KJ0zoeuSXJyvcfDAvmj7R8daEoRDIKe
         Psfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=J4BzmoUP7g/6weqJETOAxG1H459IaG9P65DoUK+cWiQ=;
        b=iOp+8TjxOsGj/pCeZTH9YfLGAGGdmNLrVYI9aecKrKJBlDkeLfvm5q32ORt7Eo2grd
         Aq48AsmFgwvNdPzLIc7Z0VWPsvsi9GnRCqB7jw1wf38izWB4eAx+ymjodsdidDC4Eg7P
         3cmK4oYhHiDzId7XApgzCIFCIsueFGt+JFh0d5I77XMChDLy7wgmBsMOkERROz4dDmxI
         tbsI8PuaD7/h1izcwFSxmZb8z48tSTtZtR3Yy9Hf7DA3RTDzMXsiprKoFpmwFmcMWHzU
         f8ehhPpIOnfkexnFAI3mzkr7dN4oEZjgzkihR44gn4QtYBD3F6vui7foZiq/J5YS6dwj
         zmfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5si836915qvo.132.2018.11.15.06.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:48:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNIwY-0000K6-15
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:48:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNIwF-0000I7-0A
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:48:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNIwA-00061Q-23
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:48:10 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45462)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gNIw9-0005zJ-9V
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:48:05 -0500
Received: by mail-wr1-f67.google.com with SMTP id k15-v6so21466929wre.12
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 06:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J4BzmoUP7g/6weqJETOAxG1H459IaG9P65DoUK+cWiQ=;
	b=WWT+VbFHZBZsqbCZR0w9bvDoGjn5V1q9J68XENqUDYNNwVi9I3M1fQIwhpWINdZZFp
	FqFpBx6iCEkjyJW2skKAEuu+EA9Aqo9DEnCyb+6zRHp4IcAvMHyj0jZMOaOavsE9na8h
	2sp9hojyNCz5rnNp6jGht6930J2SB5uhm+izKhq0/CDxdz0VZdTg/ys/F3D6G8QukBRK
	mg4uyBs17acHoz+cugGcsfEqYLLWy8VqqPEFFmubDijYH96WAMahB1QeUiTqjrkZcDGs
	lEbKHPa8jdc+MZ/8+8G1rnb3kzX7qB4k36IPza6qmpk39Lczg3sUSQqPco/AeGuYhk1i
	z4Mg==
X-Gm-Message-State: AGRZ1gK+QrV4qBVb3Ys/UOwOYOH3wB9cHkO+sAP3WRqs90XA1QpeHs/F
	IysYAqbF/4WunpUVuLK1A5w0Jw==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr6051805wrp.242.1542293282330; 
	Thu, 15 Nov 2018 06:48:02 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	c188-v6sm15657036wma.39.2018.11.15.06.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 06:48:01 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181115143535.5885-1-peter.maydell@linaro.org>
	<20181115143535.5885-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9a28fd5b-7f43-562d-0bd5-f493f9bc88c1@redhat.com>
Date: Thu, 15 Nov 2018 15:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115143535.5885-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1 2/2] hw/block/onenand:
 use qemu_log_mask() for reporting
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
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CGNzmNSOrVat

On 15/11/18 15:35, Peter Maydell wrote:
> Update the onenand device to use qemu_log_mask() for reporting
> guest errors and unimplemented features, rather than plain
> fprintf() and hw_error().
> 
> (We leave the hw_error() in onenand_reset(), as that is
> triggered by a failure to read the underlying block device
> for the bootRAM, not by guest action.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   hw/block/onenand.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/block/onenand.c b/hw/block/onenand.c
> index 49ef68c9b14..2b48609776d 100644
> --- a/hw/block/onenand.c
> +++ b/hw/block/onenand.c
> @@ -28,6 +28,7 @@
>   #include "exec/memory.h"
>   #include "hw/sysbus.h"
>   #include "qemu/error-report.h"
> +#include "qemu/log.h"
>   
>   /* 11 for 2kB-page OneNAND ("2nd generation") and 10 for 1kB-page chips */
>   #define PAGE_SHIFT	11
> @@ -594,8 +595,8 @@ static void onenand_command(OneNANDState *s)
>       default:
>           s->status |= ONEN_ERR_CMD;
>           s->intstatus |= ONEN_INT;
> -        fprintf(stderr, "%s: unknown OneNAND command %x\n",
> -                        __func__, s->command);
> +        qemu_log_mask(LOG_GUEST_ERROR, "unknown OneNAND command %x\n",
> +                      s->command);
>       }
>   
>       onenand_intr_update(s);
> @@ -657,12 +658,13 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
>       case 0xff02:	/* ECC Result of spare area data */
>       case 0xff03:	/* ECC Result of main area data */
>       case 0xff04:	/* ECC Result of spare area data */
> -        hw_error("%s: implement ECC\n", __func__);
> +        qemu_log_mask(LOG_UNIMP,
> +                      "onenand: ECC result registers unimplemented\n");
>           return 0x0000;
>       }
>   
> -    fprintf(stderr, "%s: unknown OneNAND register %x\n",
> -                    __func__, offset);
> +    qemu_log_mask(LOG_GUEST_ERROR, "read of unknown OneNAND register 0x%x\n",
> +                  offset);
>       return 0;
>   }
>   
> @@ -706,8 +708,9 @@ static void onenand_write(void *opaque, hwaddr addr,
>               break;
>   
>           default:
> -            fprintf(stderr, "%s: unknown OneNAND boot command %"PRIx64"\n",
> -                            __func__, value);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "unknown OneNAND boot command %" PRIx64 "\n",
> +                          value);
>           }
>           break;
>   
> @@ -757,8 +760,9 @@ static void onenand_write(void *opaque, hwaddr addr,
>           break;
>   
>       default:
> -        fprintf(stderr, "%s: unknown OneNAND register %x\n",
> -                        __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "write to unknown OneNAND register 0x%x\n",
> +                      offset);
>       }
>   }
>   
> 
