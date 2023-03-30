Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp49624ejb;
        Thu, 30 Mar 2023 09:25:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set+fgeIwb3LyzhU1o+KBXY3HBxzAr8TJSFRLv8vR+FJlkqbasiiqw7xXWx0JY7lLJA5nTbRJ
X-Received: by 2002:a05:622a:c6:b0:3b6:3995:2ec2 with SMTP id p6-20020a05622a00c600b003b639952ec2mr40671280qtw.19.1680193527996;
        Thu, 30 Mar 2023 09:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680193527; cv=none;
        d=google.com; s=arc-20160816;
        b=WtXAOEGpAVtMoqEo+1reOtmj3N7+NF2XF6KleTCmOsXAef+AG425oLnGVxwkmdGMoz
         j/IHhfo6mE18qz83Pjt0nHlqlHxBfCmbyM5AX1PZziIyjiOFXV7q9bKeoZ1zOd6Sd5Ld
         qP7PQ6RHwmD+P/8OgQJOGiQIPXw2MJC/yKnLzizXpsSoPPGSPz4E8Zzpwy6VxcdZRzaP
         zreFQdQ321W/pwGdzY+ISxTDT8dySvcWaSWepXJ8CeiQXILs5rDOrHq70J27fRoRHO8I
         9gOcXtatSrc/RPPu4dYQKGycZpwYhNLckni7DOivlevAE0dsCf2z7a2i/kjRlPT8LCGZ
         mjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=KYqVwm5X+F3IIOazONHIx/zvKC4zrCAtBCdcrkWudCY=;
        b=ctsoxScpf+PtcQszOz9eT2TGUDKZnacyZqr3i5nzIAKgE+Ka3MW+hZ2XZ/RxGTz7jD
         2ZZldoKcpAowNx5r8zS+8tuWE8W6qcm4C86ehR2oCNQJxI6/aBe3lgb5XfpAAGzsfcBe
         qD9oLQgkuqbP9bsnkUOREa9IIHkMmTsnItFPAeXigM/eeLGCjUQVFy8AJFLjA8T/gei9
         tLq0eJJTq66Yf06PikpoGgSOqrQdKkwyjgUsk2rfn9BnWQ4u+oRlfgObQJZcc14HBYCO
         NKhTIwoniJTfUOc2ctkapYXPKapsiSPtPKS8CdQEejndMQiR/osNVlf/KI6xzOtOySX7
         7CIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="Xh/AmC6Z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15-20020a05622a028f00b003e3897a67d7si15867074qtw.706.2023.03.30.09.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 09:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="Xh/AmC6Z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phv5L-0006kw-5K; Thu, 30 Mar 2023 12:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv5I-0006kR-On; Thu, 30 Mar 2023 12:25:08 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv5H-0002VS-7K; Thu, 30 Mar 2023 12:25:08 -0400
Received: by mail-qv1-xf35.google.com with SMTP id q88so14342314qvq.13;
 Thu, 30 Mar 2023 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680193506; x=1682785506;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYqVwm5X+F3IIOazONHIx/zvKC4zrCAtBCdcrkWudCY=;
 b=Xh/AmC6Zc5pfuNXNDxR3ZRf0sPgEcd0arSbd/Eui22m4QLOzSD32C7UGT1aWr0FEPj
 WukBZkpLubzHZB8akAbrGxGMXP8bi17MwMcNMNCR+LnxiQS0j5tmXl9WfRUT/6NcyxhQ
 FX0X9u2ZXMonUDIgfsuljbp89by62hU1CIoNsj2Gh/25MolhH7MJqJtIEPNi+aExJs1Q
 JAxKxhuqgSwOTYY9Ti4BKp7OJEeGy5WyJkkA/nqgL48+QEhkFjqAu7ETiJKAZPmu/Pd2
 gCplJMew7j0StIIx3A0AOUJzjr8H+9w4fosTEKeW08da4Qv/W0FeFuCbw2Ehx7LRpRk4
 gnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193506; x=1682785506;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KYqVwm5X+F3IIOazONHIx/zvKC4zrCAtBCdcrkWudCY=;
 b=5j5qEn4EYQL8Hpmf2i3R98s5xNliBJzIycJ06FM7JSk+shBxCBe/k6wUx3sZlISJdc
 nokuVyzwYmGdjjOZr3LXsDoh1pSSRsv0Ix8Em/H8tzGminewUegdv4iVgzpMiViAl0Iu
 9IAtiFlxRkJ1cH5OhIEzTIZMZWOxVXT1aDw73IPUb+GrDX/oU8mYpidIKWMAOj8tg6gJ
 2paV2U+p1/XSgiatAuJ8DpcI0O+aUDwHe4UNBjbV2KvyjegPo70DVdWykYDu1xP0va/t
 jjUaG3FDaUDb0/qusZkKYBAL4EBYVgeuAiZrYh43IkYVNY5wVqvb3aH3K9oi4/ehY1sH
 olLw==
X-Gm-Message-State: AAQBX9cG7H1Fbi22UynKrtg+kgmaFtihXyGLtFBkShd4u7FPMckUp4oz
 VfYsvnY9DZUjDY83fKz0Gg==
X-Received: by 2002:a05:6214:d8a:b0:5a2:6074:6cfa with SMTP id
 e10-20020a0562140d8a00b005a260746cfamr33782798qve.38.1680193505647; 
 Thu, 30 Mar 2023 09:25:05 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 n135-20020a37408d000000b007429ee9482dsm623164qka.134.2023.03.30.09.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:25:05 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:92e9:7a86:2720:254b])
 by serve.minyard.net (Postfix) with ESMTPSA id 25BBB1800BB;
 Thu, 30 Mar 2023 16:25:04 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:25:03 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Benjamin Streb <bstreb@google.com>
Subject: Re: [PATCH 5/5] hw/i2c: pmbus: add VCAP register
Message-ID: <ZCW338O56ttuInTi@minyard.net>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-6-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322175513.1550412-6-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x8fisz2n1kd2

On Wed, Mar 22, 2023 at 05:55:13PM +0000, Titus Rwantare wrote:
> VCAP is a register for devices with energy storage capacitors.

Acked-by: Corey MInyard <cminyard@mvista.com>

> 
> Reviewed-by: Benjamin Streb <bstreb@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/i2c/pmbus_device.c         | 8 ++++++++
>  include/hw/i2c/pmbus_device.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 18e629eaac..ef0314a913 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -903,6 +903,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>          }
>          break;
>  
> +    case PMBUS_READ_VCAP:                 /* Read-Only word */
> +        if (pmdev->pages[index].page_flags & PB_HAS_VCAP) {
> +            pmbus_send16(pmdev, pmdev->pages[index].read_vcap);
> +        } else {
> +            goto passthough;
> +        }
> +        break;
> +
>      case PMBUS_READ_VOUT:                 /* Read-Only word */
>          if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
>              pmbus_send16(pmdev, pmdev->pages[index].read_vout);
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index ad431bdc7c..f195c11384 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -243,6 +243,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
>  #define PB_HAS_VIN_RATING          BIT_ULL(13)
>  #define PB_HAS_VOUT_RATING         BIT_ULL(14)
>  #define PB_HAS_VOUT_MODE           BIT_ULL(15)
> +#define PB_HAS_VCAP                BIT_ULL(16)
>  #define PB_HAS_IOUT                BIT_ULL(21)
>  #define PB_HAS_IIN                 BIT_ULL(22)
>  #define PB_HAS_IOUT_RATING         BIT_ULL(23)
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 
