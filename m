Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp132133eja;
        Thu, 22 Feb 2024 01:40:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMuA/Cfnv/nQb/zeK/mqFTzqDzRYNwIG88qputptWpmXneUKnUZbzaOMiOuGTtPFKRgNUIGfjwrJGb68H+W9AEKLO2T9+H
X-Google-Smtp-Source: AGHT+IE8DKDk/cxrGCsGbeKP6haNTQl0eoysepplTGdo8liMsAd/1WfT5JaeCO/GGwcOVHWtV/vY
X-Received: by 2002:a05:622a:c8:b0:42e:56b2:e88d with SMTP id p8-20020a05622a00c800b0042e56b2e88dmr301053qtw.34.1708594849067;
        Thu, 22 Feb 2024 01:40:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708594849; cv=none;
        d=google.com; s=arc-20160816;
        b=fwRLMbypj8yNUHASGfaWtqmcmeLuyRbGhGXfy1wbqRHZ/L3xBzNY6Dc8Az/NRgE/qp
         KiHKLBIKCEE1Z1qr/7sD8kJfOsICfQbK8stFvq3vJTSaqnOZntPfyX6H8O/OEVskF++z
         hiKoFY7uIPwn4PF/zzjAQE19D3iU9Qf8xfbAM75uuR6VLdrMDZAFiNTJzHPmtB1AAMTm
         rycgVeS9v74FmCaAvYA6BK1J0IdxEzpeHNPD2n1A/KWgMGyM0ODw5SFchJnl7C/hZvPU
         QsaaSwk+h2TaNYfXsXJFU/oYbpN0BQ0IczCDl/d3A9nDD6fwcTDePw8d4oixG4KLEmld
         1v5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=0L2Bn+CV/F5awVH2G6ydF1u9zygS4ca27D4XR8vbJVg=;
        fh=AMHGmcu+fe9emwJ9QEd8Y5twQr71bPDY70t3qbmH5LA=;
        b=NdqmXUUKNtYX0tSQpBIsED39uMcWOScn2c/74LptbZzvZOR64EsIOw0gt4x4sTejJ/
         KPIlYXF6V9od7Blo3dEZMInhInNgZ3dVVcqjQz3tbJRrcDqIYWb+L6Gi+4IyWcuoULAx
         dLqMTKDJRPQxD7dTb5IqUavYYKnoUmzXoBZK2YVg+xbV3SLEL3kI9R9nTXh89Cc4xH+3
         BlK8aWkc+tfb/o5kizF6U2cd0+XSjI6fLXJaYiK7aapme2zg0Qpz1fBDSslxxGNtRa+4
         QBZx8er/EIFdbQ5G8O5knm9hoJLQOAlKsRQtA9eGwWWHVBe6hnbH6mAL/hBjLKWmZKsH
         VS/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=UUIcfSuK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020ac87216000000b0042df55ba7f7si11313169qtp.32.2024.02.22.01.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 01:40:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=UUIcfSuK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rd5Z2-0001am-TS; Thu, 22 Feb 2024 04:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd5Z1-0001aa-Rw; Thu, 22 Feb 2024 04:40:23 -0500
Received: from mgamail.intel.com ([198.175.65.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1rd5Z0-0004wz-CP; Thu, 22 Feb 2024 04:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708594823; x=1740130823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WMfjDfOaYdoWAGl+7j/dbKwh8zQImmdcruxGlBVuoyE=;
 b=UUIcfSuK8HBMxS8BI+I4owPoCkiYtTYP71tpeAKR20yOmj+K387v9vzH
 uL5BJ5F4sp4lS/1IzXdFa2WcLvm2Hq2aK9LDFQ6GMRQoXXC6Dpn6HR08O
 eUfZePtTOfh9Yht4gjEh30oOGjZ1zg7eN4cPGfg9w3hy5JtzXsOFD5c67
 FgSGQ/i2s593wP4h3RaCm62+76dM6kavy2/Nij9CuF4MTvauiM4RKJHhj
 HfrLtiHm3UnEvIgdTLHXnDMo2p9MX1lcfl/fA9hUvpmDWsmB0lvwPxOkZ
 VGsWQuKJAh3Tz3V0YgdtQgiHqcLSWIKV+X9IB3eZFbEyuF3kzb7ywqki+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2669308"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2669308"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 01:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5376817"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa009.jf.intel.com with ESMTP; 22 Feb 2024 01:40:15 -0800
Date: Thu, 22 Feb 2024 17:53:54 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 09/21] hw/usb: Inline usb_try_new()
Message-ID: <ZdcZstyZNB+xdasn@intel.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240216110313.17039-10-philmd@linaro.org>
Received-SPF: pass client-ip=198.175.65.19; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l5uQsc+MQRzm

On Fri, Feb 16, 2024 at 12:03:00PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Fri, 16 Feb 2024 12:03:00 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 09/21] hw/usb: Inline usb_try_new()
> X-Mailer: git-send-email 2.41.0
> 
> Inline the single use of usb_try_new().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/usb/bus.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

> 
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 59c39945dd..148224f06a 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -334,11 +334,6 @@ USBDevice *usb_new(const char *name)
>      return USB_DEVICE(qdev_new(name));
>  }
>  
> -static USBDevice *usb_try_new(const char *name)
> -{
> -    return USB_DEVICE(qdev_try_new(name));
> -}
> -
>  bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp)
>  {
>      return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
> @@ -447,7 +442,7 @@ void usb_claim_port(USBDevice *dev, Error **errp)
>      } else {
>          if (bus->nfree == 1 && strcmp(object_get_typename(OBJECT(dev)), "usb-hub") != 0) {
>              /* Create a new hub and chain it on */
> -            hub = usb_try_new("usb-hub");
> +            hub = USB_DEVICE(qdev_try_new("usb-hub"));
>              if (hub) {
>                  usb_realize_and_unref(hub, bus, NULL);
>              }
> -- 
> 2.41.0
> 
> 
