Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6073931lff;
        Tue, 10 Dec 2019 08:54:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3112mVAMuhCJS5vIsa6nV+5ULYEj7FqcW55b56goit1GygWd//is+lJgB+cKhpdttelrE
X-Received: by 2002:aca:ddc2:: with SMTP id u185mr4867889oig.174.1575996865321;
        Tue, 10 Dec 2019 08:54:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996865; cv=none;
        d=google.com; s=arc-20160816;
        b=YUbOhzrk9EzCKcdzWtU8vBlOUONfFmkHqBaOCk/5v/eWYa3LKGlk4pO9GCblIDp1MU
         IceGgLy38gzdSWoayoNQcxbMuducmCXTlSQ1pzvOpyR+V7paYIcTKweWkwmQEvCJ5BYF
         JFY1OA8YLEgd8gJmSfCBhT4f2SnGGJnYDsF2JMSXgYJcUj5LSqhkyM+ctJ9YaUOI9Jgj
         C/toCzCKZq9Kxs1E9Bux31HMeYqjha7bLeuqj38N/E7PYYuGAMJuz3bCOA+k/bOtrtUT
         anvUQvRCdF2IiRSL0thheFRYPTeD6PC4+bkAZzLLE1tTDl52D5cuSs34MezbD5fAQh9y
         YFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OlfjqJ3/LjH+g5cdCQ/k0akt9iUKtH6iUQLY+fs5ZCM=;
        b=AzTM5O+Tf9Z+4s9X0oXgFTf7VCZcsLEihJmxmguYKldMR+6GF3bfpObPQIEzWH+E9C
         fUkn95dWPbP47yiflht9K01DSbbqK4mTMTRNrEB7trSmkBf/NNYqnWvKAnGkgA0Vtdce
         7LseOvWHtf8x/TxQroUNaIzoZTevnWa72RG5qz8TJz2Jo8uOYzxSo3k3yodJ1qRxUDAK
         GNjOcq16UU4KW68imzUlXBrEE5D9Jw60N6Q/y4KC0F7gponnO/A0Sh6ZQ+f+aeHDOy1i
         o7Wv4J/bNDL2jMhs5UdPf2j8fWfkLcYHon5atc+JUWC6tBV/2rIOlA4FAwzBHXCTndL1
         vbtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qGezvISl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si2277292otj.282.2019.12.10.08.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:54:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qGezvISl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieimF-0003y6-Bi
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiid-0000AH-Ri
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiic-0006dg-P7
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:50:39 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieiic-0006dM-I3
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:50:38 -0500
Received: by mail-wr1-x441.google.com with SMTP id c9so20910135wrw.8
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OlfjqJ3/LjH+g5cdCQ/k0akt9iUKtH6iUQLY+fs5ZCM=;
 b=qGezvISlVmrWMXOA1mS735B4gad1o68cfJ+LwEuX+V7e9Ev0R/9siXzsfbfyApCFhK
 1c5UXBmu/OT1IRn2lzF9Ao6FnzmgAbRfjFglthbVYHBmvDoEc6b+UDgwe24L9OX5uvi+
 w+6galaekwHD0liVsafcK1mIZpzBnYsZrCbd3Lzp6rZlKxb3y0Av52pgMurWs2pkP684
 1mWNs//a1A5jEyP/THJACCanF4h1ZtxhcvLKGzouyufnyIxavZCmcMOF9Z6NkwC14k3G
 GACHLLra0EDvtO9pdbVknKaKZtlTl/qcHXYtSsSSu8tYHpGO9xPShjLujukG2cBKsGqs
 tLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OlfjqJ3/LjH+g5cdCQ/k0akt9iUKtH6iUQLY+fs5ZCM=;
 b=sdwxB5l5Ej46WdULqq8dHQ66ehMfyQUNRbe1P7wVXq1tMS92VPo0KLMQbkCIECaORl
 Oy4CTYFbDIre4QppS26dpgJrNz28bbn6f3UyO4Qi6A/mBkBzjZ9zDr8kECfuvKh3dm0a
 Z2VnKSSQiI+TqAhCqq6wtU7BuofFi+jKX/oBnoV9m9cYrYAIQehh+TkSdBQxMhg9ifxl
 sgJi5Jo/R/MY7r3CRukprZpaT1mJXBI4KlBEvqo4ShjFABJqBMn5nxo1Hjs6ohXDV1u7
 LkzVET2FfPjoBhlf4emLsDs8L3oxSsSE3DdkQQGAMxG8kj0G1NoF1eNOsah+VOq2VzGq
 PpQQ==
X-Gm-Message-State: APjAAAVgdBo5e/4Uu8jB6N7Gk8fnKJ8YSWS7nSxow4LMTeILBNYrbB4H
 p4ID7SHzx09Zyp49S48ZvMNXmA==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr4359722wrv.77.1575996637592;
 Tue, 10 Dec 2019 08:50:37 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id j12sm3978809wrw.54.2019.12.10.08.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:50:37 -0800 (PST)
Date: Tue, 10 Dec 2019 17:50:32 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 19/20] pc: Add support for virtio-iommu-pci
Message-ID: <20191210165032.GQ277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-20-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-20-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /8Q1/yNoCgY/

On Fri, Nov 22, 2019 at 07:29:42PM +0100, Eric Auger wrote:
> The virtio-iommu-pci is instantiated through the -device QEMU
> option. However if instantiated it also requires an IORT ACPI table
> to describe the ID mappings between the root complex and the iommu.
> 
> This patch adds the generation of the IORT table if the
> virtio-iommu-pci device is instantiated.
> 
> We also declare the [0xfee00000 - 0xfeefffff] MSI reserved region
> so that it gets bypassed by the IOMMU.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

It would be nice to factor the IORT code with arm, but this looks OK.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
