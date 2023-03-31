Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp648651ejb;
        Fri, 31 Mar 2023 06:51:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z3qv9M/Ao0zjXSaeH/uanBK/9bpHvn4MtZTomEQ1i42oOTMpypZVfqGGecxxMiPp42OZFY
X-Received: by 2002:a05:6214:5194:b0:5c1:b4f6:57ee with SMTP id kl20-20020a056214519400b005c1b4f657eemr36529697qvb.28.1680270691207;
        Fri, 31 Mar 2023 06:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680270691; cv=none;
        d=google.com; s=arc-20160816;
        b=xGwrk7kksE8DM71CvULkZKzr7RMR5B25KQ/g8wWAwUtS013eWID6J0+KDYWAhER3jP
         uJlgkjQvaFb7l/0J07xn2/mnnP5QpxR0wORVVZuxdzRI2v8nPH3PhGjBkEu1w7WsZXvE
         eBqq7uH45OAAx7n7VJ5CvxntQocb/Z1WiTKOZNxz/80CiYJs5+CkDgQ++27ZJMG8BLkQ
         r2/XFnxCbZxS9mS4evqSAbfF/JvzoJNihF7tIXSvspejdVFVEB7IKy6ZTzuw2bk4OJGZ
         kJBsJ83OVH/I08mKsA62SkTCXOzTnHG+yvH6t1g+ay05DC2E6n+haTcN49fxy5L2yn6Z
         M22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=D5dcSQeCM3vIMs1GqZNc67z2JlfWzP6tTS9ULkS+O1g=;
        b=R2S26AC3XaBfq4OMYeHoy6w5RB6MxN4+OxnfByWhnqrjtuOJ7ODSpJ4Re0Z8JRNicT
         7OnV0//c02o7Ypl/bHyaoNe7/uzz+pX7S9jGJTVgLVEx33tpVQOz7AeZqWam+c/oL/8P
         NcIwVSnKYiYwcxvnk1VIR80v0tyjbsvairUCjdBdGV0Njd49laPzh43OfWY/li+6w0T1
         bcmwYFHpQmsfYI46kNvnWjjLO/JWuSJXVdu/nx9wjpYx1Y1qmGlLZTDljaem/tXIWpAz
         ARquvMMwFaVd5MBq+5oxP79RomDx4Ig4M0fFgVrkMJufICXYB/H0uQmOylXforBQKxBv
         RZwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SMRZLITL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw11-20020a0562140f0b00b0053779d55561si1515522qvb.107.2023.03.31.06.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 06:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=SMRZLITL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piFA3-0005kf-F6; Fri, 31 Mar 2023 09:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFA2-0005kR-Rj; Fri, 31 Mar 2023 09:51:22 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFA0-0005W7-Tk; Fri, 31 Mar 2023 09:51:22 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5456249756bso415821087b3.5; 
 Fri, 31 Mar 2023 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680270679; x=1682862679;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5dcSQeCM3vIMs1GqZNc67z2JlfWzP6tTS9ULkS+O1g=;
 b=SMRZLITLESOEftlWe/18PotuACrfVn7M4QFbWBVOm/Jx9GgD9fA1IJBrbw5G6KE44+
 k9gFDfP1iRBRfRFRCzjTToTg7rHZYT/nQXoGQ09ERRlY8F9S72F7VZQvfCokLnL7RtKs
 481VR/MhWfGDGb4sTDmJTyiu7EeLPo4Ycc8jrEUXmsMYZPVi+JB2Ut+8H8EYoa2PSTc9
 guoxFCeUVDgTS8R0oxDntCkxe/6RnL/I/LZ8RRis3L0iGF+ffAb9cx1Z7xvAopsbYYWZ
 zQCbdi3rWrZffvntI7YPDOUFDtYMxwtH+aXVnoTNx54Y9LWaMN+RlBU5UK5OpsabeNUG
 G1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680270679; x=1682862679;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D5dcSQeCM3vIMs1GqZNc67z2JlfWzP6tTS9ULkS+O1g=;
 b=UmJVclX8VD/DEDfpe6w5XkME7Cf1P4mlTs55vVMIqG0JF/MXkbkOc7ua5aeVFAmScM
 rNisIZh+4WM4Ud2RWOu9bi8hMO0M4y5o0d8ElcPvp7qVuubF+glMH5hIvRjqwNDCjgQe
 tjm7r5HcLrzi9Fdi6E6mL+hwpAZPrXJ9NCibvA8aX2Cb3idQuEXiluYe09kPrB7Z7N37
 4R+QTjVxtd67uXaxcCVH/p6rvRtU8MNIsiSjuhbzJWv2Hn9oBUV9hdV/CRCf+ZmXfagm
 62G9z15bitmpfM7N12gJWa33S+ge6HCSoze9YpvDLDe4H8EzDQvC3jgBNIzXvi/4+vPx
 ByGA==
X-Gm-Message-State: AAQBX9dUJWrjhplC2eWdlaQI+BJtWVimiEvJqtawW+rDUOspE+JHM9/r
 cIGuyo+G8WV3GwrTXdMYtA==
X-Received: by 2002:a0d:d415:0:b0:545:62d7:6fac with SMTP id
 w21-20020a0dd415000000b0054562d76facmr23745456ywd.10.1680270679355; 
 Fri, 31 Mar 2023 06:51:19 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a81ec0b000000b0054640a352f2sm534566ywm.20.2023.03.31.06.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 06:51:18 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id D79EE1800BB;
 Fri, 31 Mar 2023 13:51:17 +0000 (UTC)
Date: Fri, 31 Mar 2023 08:51:16 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Stephen Longfield <slongfield@google.com>
Subject: Re: [PATCH 3/7] hw/i2c: pmbus: add fan support
Message-ID: <ZCblVOZMVIKSG2M/@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-4-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-4-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=tcminyard@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: TLYtCLHKzuHl

On Fri, Mar 31, 2023 at 12:07:52AM +0000, Titus Rwantare wrote:
> PMBus devices may integrate fans whose operation is configurable
> over PMBus. This commit allows the driver to read and write the
> fan control registers but does not model the operation of fans.
> 
> Reviewed-by: Stephen Longfield <slongfield@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/pmbus_device.c         | 176 ++++++++++++++++++++++++++++++++++
>  include/hw/i2c/pmbus_device.h |   1 +
>  2 files changed, 177 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 02647769cd..bb42e410b4 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -490,6 +490,54 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>  
> +    case PMBUS_FAN_CONFIG_1_2:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].fan_config_1_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_1:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_1);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_2:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_CONFIG_3_4:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].fan_config_3_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_3:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_3);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_4:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].fan_command_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
>          if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
>              pmbus_send16(pmdev, pmdev->pages[index].vout_ov_fault_limit);
> @@ -800,6 +848,22 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
>          break;
>  
> +    case PMBUS_STATUS_FANS_1_2:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_1_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_STATUS_FANS_3_4:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_3_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
>          if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
>              pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
> @@ -872,6 +936,54 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>  
> +    case PMBUS_READ_FAN_SPEED_1:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_1);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FAN_SPEED_2:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_2);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FAN_SPEED_3:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_3);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FAN_SPEED_4:          /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_fan_speed_4);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_DUTY_CYCLE:           /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_duty_cycle);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
> +    case PMBUS_READ_FREQUENCY:            /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_frequency);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_READ_POUT:                 /* Read-Only word */
>          if (pmdev->pages[index].page_flags & PB_HAS_POUT) {
>              pmbus_send16(pmdev, pmdev->pages[index].read_pout);
> @@ -1295,6 +1407,54 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
>          }
>          break;
>  
> +    case PMBUS_FAN_CONFIG_1_2:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_config_1_2 = pmbus_receive8(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_1:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_1 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_2:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_2 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_CONFIG_3_4:            /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_config_3_4 = pmbus_receive8(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_3:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_3 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_FAN_COMMAND_4:             /* R/W word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmdev->pages[index].fan_command_4 = pmbus_receive16(pmdev);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
>      case PMBUS_VOUT_OV_FAULT_LIMIT:       /* R/W word */
>          if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
>              pmdev->pages[index].vout_ov_fault_limit = pmbus_receive16(pmdev);
> @@ -1600,6 +1760,22 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
>          pmdev->pages[index].status_mfr_specific = pmbus_receive8(pmdev);
>          break;
>  
> +    case PMBUS_STATUS_FANS_1_2:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_1_2);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
> +    case PMBUS_STATUS_FANS_3_4:           /* R/W byte */
> +        if (pmdev->pages[index].page_flags & PB_HAS_FAN) {
> +            pmbus_send8(pmdev, pmdev->pages[index].status_fans_3_4);
> +        } else {
> +            goto passthrough;
> +        }
> +        break;
> +
>      case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
>      case PMBUS_CAPABILITY:                /* Read-Only byte */
>      case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 2e95164aa1..ad431bdc7c 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -258,6 +258,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
>  #define PB_HAS_TEMP2               BIT_ULL(41)
>  #define PB_HAS_TEMP3               BIT_ULL(42)
>  #define PB_HAS_TEMP_RATING         BIT_ULL(43)
> +#define PB_HAS_FAN                 BIT_ULL(44)
>  #define PB_HAS_MFR_INFO            BIT_ULL(50)
>  #define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
>  
> -- 
> 2.40.0.423.gd6c402a77b-goog
> 
