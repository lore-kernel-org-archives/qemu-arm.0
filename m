Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649793ejb;
        Fri, 31 Mar 2023 06:53:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set98QoWZq/XaKbl+/LNEAmb85/n/GQfkufmbKj1ErbSfH/stgn4QaK1GdJ0dcf1zOeF+UNMy
X-Received: by 2002:ac8:7f54:0:b0:3ba:1d8d:f6d0 with SMTP id g20-20020ac87f54000000b003ba1d8df6d0mr48714355qtk.23.1680270818762;
        Fri, 31 Mar 2023 06:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680270818; cv=none;
        d=google.com; s=arc-20160816;
        b=dC+4wx9qJhpUdDTGf0gVgt3RbbCoqEX4cpapXejOyOFYt7rjmMEf1DGc8Ky8g1N+ex
         fbpj3197H1gn67St/px/iDUgrtyjVMMR1e1PaolU45eZv1kvYYFbJZo9WXHQmy1UToaF
         OgpDtqGqGb5Le8il/YJEGfHUsTRTL3H/Pz+YDXI64fMBeAW4i/5pvjZqNScWk/dX6/qA
         j4qs5I2y792xyQIbTaRFnRKcfX72cZB0BcJnKxOIRWxAuR/JCHGg93+QHs+R03AHtQdY
         E2DADVUdNupKDCjas9UtfoWZMAqciv/C7k44SI99xqcBrWEPID3PjR7Mrp17TqIPHtv5
         19lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=CtV8cRC+a/Mtrp33Yw4BA0BtMpcape5i0D9Z5mDek+0=;
        b=T2UVGfktqMjDE9LKNV/708X3HNf1psvyoD6Zbx2nF6dgOAyNJ4MnEjKMdR1zC7KJvU
         zMj7bbzML2rAHfghlnO8ACpIH3+qpEEv5F9Wt2/as+IEn7TlNeNVSZkE3vYQYH+T+9f+
         lF7aI3aOmZhZPy6KacTSGejI73AFuEGCXodGjIW+c0eGBpwBPuZy5qARXfohDaetz0iP
         /apQkl1g2ZllDPQZv7vcWZQBbzb89Se0j08YYc5zmLggrwSP4W5hB4IHLfMeGOkpYa4d
         2iVd8n/h+eAg4jNUT+OUcx9GRwIxBS4e0IxqxexRL6gNDbBmPsTm8LzcRrDJKpeO6chm
         X+oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Q8UPOzzL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05622a198400b003e4e6bd47f7si1520345qtc.518.2023.03.31.06.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 06:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Q8UPOzzL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piFC9-0007G0-Vt; Fri, 31 Mar 2023 09:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFC8-0007F6-JH; Fri, 31 Mar 2023 09:53:32 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFC7-0005xS-3H; Fri, 31 Mar 2023 09:53:32 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-544787916d9so415427447b3.13; 
 Fri, 31 Mar 2023 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680270809; x=1682862809;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtV8cRC+a/Mtrp33Yw4BA0BtMpcape5i0D9Z5mDek+0=;
 b=Q8UPOzzLwKc0XeuZTVV0Oi+lDL7FvCMf+UYf5etNA3L8FECL/jnaWMHOYjrJ0fvTx2
 dZEGOPI0Oapr2o80HvHr187dERUOi4dJKUXozgzL3qV3n1x8R/wY+q6WZWHuBoZEZyJb
 46ujZQBPTRDImlmLd/mxeyllW42mLEakFqxjNUtKPRpXa4ud2fIIOE+CkpZvgei6W+RD
 2HhQzvmKCq61WxaXr0vCoQAg/zVbwmu39uRv5pW0la/iPpvvsvXdnQvmB/mUoO/IAWQ0
 uxX0iD9dbhfuETuOc3DQIirj8PKCw1St6eU1hu6B9pJPsz5dDZSghbBVcfZiZl85JCSe
 eWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680270809; x=1682862809;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CtV8cRC+a/Mtrp33Yw4BA0BtMpcape5i0D9Z5mDek+0=;
 b=SgPsG0zJTxZ93mx6ajwr1QO54OW6JU0bhIFx9/7tW95uiNRn8w1qYGcNOk5gZGEAqF
 MpdetE++tD85Rk4KHY/LHWyeL8FG/00+7avHUE1XSO3uaYXtW9LYCQLigS6Fi9fbZDCN
 APLLFmt9sWe9d3cAcZThqBoo+Gcw4ZD3+VRrPOxwX2T3P35vSwqHP9f7qyICTCBPsiG4
 bs06/ncvz4tGOgE17HYYNeL1xnfGLmx2p+G1+/Z5Smm+bx0+uvD0RKGzBOweaUN+hTfR
 kUM1raYP36oOcjXN775nJNINAa9AHt0YVeILSzmWgs4LvQyTZvZPsWumCP7+1Jsw6J43
 OAEA==
X-Gm-Message-State: AAQBX9eCLgsAlJ/ugVySas1wg6+Ob2QWWkVt5QxUEd+WFGLneKev/PdP
 XebuZu60owlpOMS41mtcHw==
X-Received: by 2002:a0d:f482:0:b0:544:9d1b:24cb with SMTP id
 d124-20020a0df482000000b005449d1b24cbmr21943480ywf.31.1680270809442; 
 Fri, 31 Mar 2023 06:53:29 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 l74-20020a81574d000000b005463f28ecc1sm534275ywb.98.2023.03.31.06.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 06:53:28 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id 4883E1800BB;
 Fri, 31 Mar 2023 13:53:28 +0000 (UTC)
Date: Fri, 31 Mar 2023 08:53:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Benjamin Streb <bstreb@google.com>
Subject: Re: [PATCH 5/7] hw/i2c: pmbus: add VCAP register
Message-ID: <ZCbl1zyypxoDsypl@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-6-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-6-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=tcminyard@gmail.com; helo=mail-yw1-x112e.google.com
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
X-TUID: 6RYA7MnStWvu

On Fri, Mar 31, 2023 at 12:07:54AM +0000, Titus Rwantare wrote:
> VCAP is a register for devices with energy storage capacitors.
> 
> Reviewed-by: Benjamin Streb <bstreb@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

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
> 2.40.0.423.gd6c402a77b-goog
> 
