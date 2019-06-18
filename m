Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3142751wrg;
        Mon, 17 Jun 2019 18:27:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwbNFbm1Y/tUNBwW5Mg+uodeg1IX7+urDdN/K979iEPHeXM120ceVn/1vu2RsvKxzySlQn
X-Received: by 2002:a17:906:3948:: with SMTP id g8mr66658842eje.168.1560821251725;
        Mon, 17 Jun 2019 18:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560821251; cv=none;
        d=google.com; s=arc-20160816;
        b=uSLeWtyWE4e3G483bolATVPUNMLJwcIdNAnu8EXdboD7qUU5izBPH0927AYHkvnTZg
         hSH/r0OE/tkRv7qjYuLpYoZV5j5AoMD8pWtBRk/TRA5+3op0pZPqOMWgYjaw4BJdFIzn
         Vxq9vLa2Yl3SwDe4bI14PKqmroME05d+pF98sArxqvsEbEhgYe+MpDO6fwLVH2z3hqtt
         pOrDXXrPInL6hVhgoAuwaR91NmqmiRXZ9l8q7FTLu/oYaz8sASk24uqK98WGFAt1rXeq
         uNxBsAxl54U/xQY/9RL/1JGtDVLCO74OQaVW8xXSWLx9ooSqawffyBMw2GkYy6Q0zR++
         QChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=AHXtKDFFOfrWy+/0QdH+yW+H88/c/r0mZVx+SFFI2p0=;
        b=AnTlRc3tIewdFBihJSHJSg7/fTx05PYNYjzL6fgHgmFXlP1879TO7cqL2U+fNs4r9q
         uxX9e3v42FZeXR0Qff7nHsywTfrTkRrAHcziRAmp/FbzQLHm95dpR/QKzoRMIAjMWZg0
         V4KCUpEv6XEB4TXtfBa8DheweQUANKvxazRaC56xL0ll/upfCBCAB6G0fe9UrMb5beoh
         YulQlajHZUnpV3+0DHDeA/67uKEhG6g8BEHkeoAUiNhznHg2U9ifelnZfrEBnHAjG/zu
         b8nUweMH7QnHPYKTPIzrLwIh1sXb0SdoaFLadHwlLGblyHk22crRO7tFsqLCrOzkbbew
         9Gng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k39si10144783ede.140.2019.06.17.18.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 18:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd2uI-0002pU-Dj
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 21:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39509)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hd2tf-0002mw-8j
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 21:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hd2ta-0001T2-SZ
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 21:26:48 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40181)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hd2ta-0001Eq-My
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 21:26:46 -0400
Received: by mail-qk1-f196.google.com with SMTP id c70so7501841qkg.7
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 18:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AHXtKDFFOfrWy+/0QdH+yW+H88/c/r0mZVx+SFFI2p0=;
 b=HIYf6qVQ0v2WbRbXb32wm7ZNLre2bxAHTaHz/86uWWB4p1CvHf5mcnfJKtFPTwdI1g
 SHn6HxBnihgfEGSRD6Jhk+/h3P6Gi1MXQx+ZbOrK3Xh9RQ8ttSACB4AXBtFU2OhIhaaS
 7nKyOPKG4y7mDJ7wnOTS2I9M1i/ju/aYiWnCnoLvBNPrv3GVvZRxutPmmlFuzsMHj8HL
 V4rPtwr1DFwow7xSVaOpEBa8sPr5fGcRUxOEe7MgSYHPWOBaIZeQfTso8KdQgEl0uQOE
 XG/vWgx+poq1E21zqUi349L6lLztMUmo1+wXPRodUz3jWitWSaQTpcLmXirrR/cdy7wT
 Osnw==
X-Gm-Message-State: APjAAAVKUMRV/vmALFaufBI2SAsvH3w5NGoNXaIlq8yJH8VzdGXz3yoV
 W6mhhGAZ0LtOdJwaajzTh0VB5w==
X-Received: by 2002:a37:be85:: with SMTP id
 o127mr80947201qkf.194.1560821195013; 
 Mon, 17 Jun 2019 18:26:35 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
 [100.0.197.103])
 by smtp.gmail.com with ESMTPSA id n18sm3316258qtr.28.2019.06.17.18.26.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 18:26:33 -0700 (PDT)
Date: Mon, 17 Jun 2019 21:26:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20190617212626-mutt-send-email-mst@kernel.org>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-4-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416013902.4941-4-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.196
Subject: Re: [Qemu-arm] [PATCH 3/5] pci: designware: Update MSI mapping
 unconditionally
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0IcZFgwr8cCI

On Mon, Apr 15, 2019 at 06:39:00PM -0700, Andrey Smirnov wrote:
> Expression to calculate update_msi_mapping in code handling writes to
> DESIGNWARE_PCIE_MSI_INTR0_ENABLE is missing an ! operator and should
> be:
> 
>     !!root->msi.intr[0].enable ^ !!val;
> 
> so that MSI mapping is updated when enabled transitions from either
> "none" -> "any" or "any" -> "none". Since that register shouldn't be
> written to very often, change the code to update MSI mapping
> unconditionally instead of trying to fix the update_msi_mapping logic.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/pci-host/designware.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 29ea313798..6affe823c0 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -296,16 +296,10 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>          root->msi.base |= (uint64_t)val << 32;
>          break;
>  
> -    case DESIGNWARE_PCIE_MSI_INTR0_ENABLE: {
> -        const bool update_msi_mapping = !root->msi.intr[0].enable ^ !!val;
> -
> +    case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
>          root->msi.intr[0].enable = val;
> -
> -        if (update_msi_mapping) {
> -            designware_pcie_root_update_msi_mapping(root);
> -        }
> +        designware_pcie_root_update_msi_mapping(root);
>          break;
> -    }
>  
>      case DESIGNWARE_PCIE_MSI_INTR0_MASK:
>          root->msi.intr[0].mask = val;
> -- 
> 2.20.1
