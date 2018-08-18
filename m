Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp773722wrd;
        Fri, 17 Aug 2018 17:39:08 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwHodRtnTdUlj/t35nwvVRnnFQ1FJ5u5x/YnFmmFHqEo2ISjQT6cesjtw7dgwTLj7QsQ25F
X-Received: by 2002:ae9:ed8f:: with SMTP id c137-v6mr32847977qkg.276.1534552748466;
        Fri, 17 Aug 2018 17:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534552748; cv=none;
        d=google.com; s=arc-20160816;
        b=EDgJEhg/4gPntBK0MeVdhkH1ZC9tHzBTVv7oYLzIQ0CQ6BvXOc6995KqwF2GgQxB8E
         yR/juzkoZdvumXGMtoRo5QXKJLAxkMfhArQBs8N4cmdnbZfrVC9PDl3gi6RFMXT1tB2B
         RMe3URZht00UkapU4G5lLdpMi2/xa56r/KUFApYfUcrxeWnyHM5fGGQd6LISrbmlHYHa
         iCs6+C+3luelYdDaoCrWQEgTkMmnBUc9K0OLx8IGsM6MxlS8rZupeu45BehDAX1GyANF
         Yrf4WKCYoE6mBLNWwoIH9z6AxpAgPQFgg/Zug3Y7ptvemF2uR2oluQ4aAEK/NfkSuY0c
         Asow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=rLsuh9jVVH+Mn0UoO+mOAFTeABMGhf+gbzUb1t0pfRk=;
        b=QddTds2rU9+YwWJmY7eWT4geyi4nk+2lkY1AzdpQESIAFdp1Wtbh/pKUw9FxruaDuh
         gRRAyrNxjoDBtRRzIiSVWR847SwK7jYmtF/bYLMuKE6f0A0ly4jklhwtQyoI9Xm3vm4V
         ikQcIVdy0VLje6fioZ3kLPKC9Ha4XUDBZTamA0R9HDtnWJ7mKfsY1tqT9+V0JyYau+bm
         tvgUSH3gfqxdccaUAhPiX0wxTruj1nem/im0PZWJQnFg+vnJuPjXYpsD4i70cndvLToB
         8UHS/Ded8FkWCiXC9IhqY/VATbQUd1aUkm4L7mCBwihIjtUaD3NbKTneU3DZ9cp61VHs
         DLFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nsqtuhZc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188-v6si1792784qkg.316.2018.08.17.17.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 17:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nsqtuhZc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqpGm-0006i6-0U
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 20:39:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpFP-00069e-Vl
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 20:37:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpFL-0002wx-72
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 20:37:43 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:41359)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqpFK-0002wL-M5; Fri, 17 Aug 2018 20:37:38 -0400
Received: by mail-vk0-x243.google.com with SMTP id j14-v6so19076vke.8;
	Fri, 17 Aug 2018 17:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rLsuh9jVVH+Mn0UoO+mOAFTeABMGhf+gbzUb1t0pfRk=;
	b=nsqtuhZcKdA+2QHQumL2Ru255J+7V05QtILhEF/9zU0aLUGjnmiIreQobAr4ItI/T6
	sMoIOOc/Qi/I3CZ6AZt7IEcGDlu9GrlHE5zOa4E5twoGoNUdC6lNPkIGXlC6qXi5FV+A
	fYUhRPyZQn8NRYbp5TEwaO/sWQk3bioqYL0jnnJIS3usKBCf6OZBFzG6AyXlUVx745sH
	8w7wWaMIpPoXyGgw3bag9hh2xSpR6wdI+GuGsmgT9OMH6/2SZF3zOtn21wOGF1R4+qAx
	R/l4rKwUslMxzxSOHozzvMZLDZtEGbiSs56XoBf5DHQTa1ovqqeiee2xNkyzaZylvVvW
	Hm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rLsuh9jVVH+Mn0UoO+mOAFTeABMGhf+gbzUb1t0pfRk=;
	b=ZzBT1KIQeqFAWnKWhwP2383ObHUpFFnCpHcIOEQbGxNChJNcRVavOq/S0I+POTU9J4
	s2rHyh3KcH62z2e+LhqLt/Z1B9qMjbJlOx5o+ktVmJXQuBTomVxaCBli/BTwsZLTN6Er
	zUJMb3UoKkS1iTU60hZ3xl3DB1ubC0WxGQ8Mmw++VWCmUEK3WRZ+UmW/EG9w2sXfTx7I
	lkhRK5boHXZd3z5aZs4nFsq79UeFLgr0ly2vhNPEMYstkt/W1JxLKE5TtK3f0mXatRCk
	K1GmvVg5kumQ1SD7LxQi8Dpyd3DW+RWnloKuTG4croEV2uZCMeItf/CHAhqw5D7Bk1cX
	XToA==
X-Gm-Message-State: AOUpUlHLCiIQZxUpb8bOq1YEuLO6Sj33TLlpzJbUDup22LbFDJaEz1Yl
	koocEGx+E0nTTUXxRQDlYJk=
X-Received: by 2002:a1f:8753:: with SMTP id
	j80-v6mr3918827vkd.120.1534552658061; 
	Fri, 17 Aug 2018 17:37:38 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm1292520vkd.11.2018.08.17.17.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 17:37:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <3fbb1f6d-8615-f540-d902-67ea9026777b@amsat.org>
Date: Fri, 17 Aug 2018 21:37:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 08/16] hw/misc/iotkit-secctl:
 Wire up registers for controlling MSCs
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7iarxQA14TOI

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The IoTKit does not have any Master Security Contollers itself,
> but it does provide registers in the secure privilege control
> block which allow control of MSCs in the external system.
> Add support for these registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-secctl.h | 14 +++++++
>  hw/misc/iotkit-secctl.c         | 73 +++++++++++++++++++++++++++++----
>  2 files changed, 79 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
> index 082c14c925e..1a193b306f1 100644
> --- a/include/hw/misc/iotkit-secctl.h
> +++ b/include/hw/misc/iotkit-secctl.h
> @@ -19,6 +19,7 @@
>   *  + named GPIO output "sec_resp_cfg" indicating whether blocked accesses
>   *    should RAZ/WI or bus error
>   *  + named GPIO output "nsc_cfg" whose value tracks the NSCCFG register value
> + *  + named GPIO output "msc_irq" for the combined IRQ line from the MSCs
>   * Controlling the 2 APB PPCs in the IoTKit:
>   *  + named GPIO outputs apb_ppc0_nonsec[0..2] and apb_ppc1_nonsec
>   *  + named GPIO outputs apb_ppc0_ap[0..2] and apb_ppc1_ap
> @@ -44,6 +45,11 @@
>   * Controlling each of the 16 expansion MPCs which a system using the IoTKit
>   * might provide:
>   *  + named GPIO inputs mpcexp_status[0..15]
> + * Controlling each of the 16 expansion MSCs which a system using the IoTKit
> + * might provide:
> + *  + named GPIO inputs mscexp_status[0..15]
> + *  + named GPIO outputs mscexp_clear[0..15]
> + *  + named GPIO outputs mscexp_ns[0..15]
>   */
>  
>  #ifndef IOTKIT_SECCTL_H
> @@ -62,6 +68,7 @@
>  #define IOTS_NUM_AHB_EXP_PPC 4
>  #define IOTS_NUM_EXP_MPC 16
>  #define IOTS_NUM_MPC 1
> +#define IOTS_NUM_EXP_MSC 16
>  
>  typedef struct IoTKitSecCtl IoTKitSecCtl;
>  
> @@ -103,6 +110,13 @@ struct IoTKitSecCtl {
>      uint32_t brginten;
>      uint32_t mpcintstatus;
>  
> +    uint32_t secmscintstat;
> +    uint32_t secmscinten;
> +    uint32_t nsmscexp;
> +    qemu_irq mscexp_clear[IOTS_NUM_EXP_MSC];
> +    qemu_irq mscexp_ns[IOTS_NUM_EXP_MSC];
> +    qemu_irq msc_irq;
> +
>      IoTKitSecCtlPPC apb[IOTS_NUM_APB_PPC];
>      IoTKitSecCtlPPC apbexp[IOTS_NUM_APB_EXP_PPC];
>      IoTKitSecCtlPPC ahbexp[IOTS_NUM_APB_EXP_PPC];
> diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
> index de4fd8e36d2..2222b3e147d 100644
> --- a/hw/misc/iotkit-secctl.c
> +++ b/hw/misc/iotkit-secctl.c
> @@ -190,12 +190,13 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
>          r = s->apbexp[offset_to_ppc_idx(offset)].sp;
>          break;
>      case A_SECMSCINTSTAT:
> +        r = s->secmscintstat;
> +        break;
>      case A_SECMSCINTEN:
> +        r = s->secmscinten;
> +        break;
>      case A_NSMSCEXP:
> -        qemu_log_mask(LOG_UNIMP,
> -                      "IoTKit SecCtl S block read: "
> -                      "unimplemented offset 0x%x\n", offset);
> -        r = 0;
> +        r = s->nsmscexp;
>          break;
>      case A_PID4:
>      case A_PID5:
> @@ -291,6 +292,23 @@ static void iotkit_secctl_ppc_update_irq_enable(IoTKitSecCtlPPC *ppc)
>      qemu_set_irq(ppc->irq_enable, extract32(value, ppc->irq_bit_offset, 1));
>  }
>  
> +static void iotkit_secctl_update_mscexp_irqs(qemu_irq *msc_irqs, uint32_t value)
> +{
> +    int i;
> +
> +    for (i = 0; i < IOTS_NUM_EXP_MSC; i++) {
> +        qemu_set_irq(msc_irqs[i], extract32(value, i + 16, 1));
> +    }
> +}
> +
> +static void iotkit_secctl_update_msc_irq(IoTKitSecCtl *s)
> +{
> +    /* Update the combined MSC IRQ, based on S_MSCEXP_STATUS and S_MSCEXP_EN */
> +    bool level = s->secmscintstat & s->secmscinten;
> +
> +    qemu_set_irq(s->msc_irq, level);
> +}
> +
>  static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
>                                           uint64_t value,
>                                           unsigned size, MemTxAttrs attrs)
> @@ -370,10 +388,15 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
>          iotkit_secctl_ppc_sp_write(ppc, value);
>          break;
>      case A_SECMSCINTCLR:
> +        iotkit_secctl_update_mscexp_irqs(s->mscexp_clear, value);
> +        break;
>      case A_SECMSCINTEN:
> -        qemu_log_mask(LOG_UNIMP,
> -                      "IoTKit SecCtl S block write: "
> -                      "unimplemented offset 0x%x\n", offset);

Maybe:

           if (value & ~0xffff) {
               GUEST_ERROR(...)
           }

> +        s->secmscinten = value;
> +        iotkit_secctl_update_msc_irq(s);
> +        break;
> +    case A_NSMSCEXP:

Ditto.

> +        s->nsmscexp = value;
> +        iotkit_secctl_update_mscexp_irqs(s->mscexp_ns, value);
>          break;
>      case A_SECMPCINTSTATUS:
>      case A_SECPPCINTSTAT:
> @@ -381,7 +404,6 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
>      case A_BRGINTSTAT:
>      case A_AHBNSPPC0:
>      case A_AHBSPPPC0:
> -    case A_NSMSCEXP:
>      case A_PID4:
>      case A_PID5:
>      case A_PID6:
> @@ -588,6 +610,14 @@ static void iotkit_secctl_mpcexp_status(void *opaque, int n, int level)
>      s->mpcintstatus = deposit32(s->mpcintstatus, n + 16, 1, !!level);
>  }
>  
> +static void iotkit_secctl_mscexp_status(void *opaque, int n, int level)
> +{
> +    IoTKitSecCtl *s = IOTKIT_SECCTL(opaque);
> +
> +    s->secmscintstat = deposit32(s->secmscintstat, n + 16, 1, !!level);
> +    iotkit_secctl_update_msc_irq(s);
> +}
> +
>  static void iotkit_secctl_ppc_irqstatus(void *opaque, int n, int level)
>  {
>      IoTKitSecCtlPPC *ppc = opaque;
> @@ -660,6 +690,14 @@ static void iotkit_secctl_init(Object *obj)
>      qdev_init_gpio_in_named(dev, iotkit_secctl_mpcexp_status,
>                              "mpcexp_status", IOTS_NUM_EXP_MPC);
>  
> +    qdev_init_gpio_in_named(dev, iotkit_secctl_mscexp_status,
> +                            "mscexp_status", IOTS_NUM_EXP_MSC);
> +    qdev_init_gpio_out_named(dev, s->mscexp_clear, "mscexp_clear",
> +                             IOTS_NUM_EXP_MSC);
> +    qdev_init_gpio_out_named(dev, s->mscexp_ns, "mscexp_ns",
> +                             IOTS_NUM_EXP_MSC);
> +    qdev_init_gpio_out_named(dev, &s->msc_irq, "msc_irq", 1);
> +
>      memory_region_init_io(&s->s_regs, obj, &iotkit_secctl_s_ops,
>                            s, "iotkit-secctl-s-regs", 0x1000);
>      memory_region_init_io(&s->ns_regs, obj, &iotkit_secctl_ns_ops,
> @@ -690,6 +728,24 @@ static const VMStateDescription iotkit_secctl_mpcintstatus_vmstate = {
>      }
>  };
>  
> +static bool needed_always(void *opaque)
> +{
> +    return true;
> +}
> +
> +static const VMStateDescription iotkit_secctl_msc_vmstate = {
> +    .name = "iotkit-secctl/msc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = needed_always,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(secmscintstat, IoTKitSecCtl),
> +        VMSTATE_UINT32(secmscinten, IoTKitSecCtl),
> +        VMSTATE_UINT32(nsmscexp, IoTKitSecCtl),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription iotkit_secctl_vmstate = {
>      .name = "iotkit-secctl",
>      .version_id = 1,
> @@ -710,6 +766,7 @@ static const VMStateDescription iotkit_secctl_vmstate = {
>      },
>      .subsections = (const VMStateDescription*[]) {
>          &iotkit_secctl_mpcintstatus_vmstate,
> +        &iotkit_secctl_msc_vmstate,
>          NULL
>      },
>  };
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
