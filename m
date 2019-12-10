Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6068547lff;
        Tue, 10 Dec 2019 08:49:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpZwD32ffiuwSFOsGEvddn4pdo1qoF8D10Gt91FwsbIErU6F2BQL+4+jmxX3kTlqBWXLTt
X-Received: by 2002:a9d:5885:: with SMTP id x5mr25416381otg.132.1575996590810;
        Tue, 10 Dec 2019 08:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996590; cv=none;
        d=google.com; s=arc-20160816;
        b=at0EUufz3cz58AnnXrMBfiJdB9AhctTo/AooL6ffkOXop6RmVUThE3BRXuXvsyNLHL
         sBdHFBPccilSi500pnvHx16yXFRx4aayJahWruVQJfsoOMrkd+CeV33tCTt20tP3EbkU
         +GKbml1Dq/Uh28SCLbAuJct2l47Bmqla4GQrT4hk82aowmgGw51slticfjuk+VzCQKT7
         19ZW6/8WsQDf32lsdNfb1ICPUKuSSqgYjOCC040aanBEwkvyI2O11nfvcm3UOPlKpElt
         Jh+SRdqC5DixlP8PTMgusdmQFInNhFXugfuvhWQ5EiILTWTGtuyizBSh/fj8T02Swwd8
         JL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=B1cDfx8s5f/9QR+mlmSpW12qDckt3D/lvXSVtrdKzq4=;
        b=gGsulvYvOWwVB5AQcpO10ycgtKAUxsieG8Q946GeVHU3FcVZU9Xzs550QMwEGoOcGN
         I8PCecmv0MBNTydm4/vQQMqNjS81r0M4pUtRM0fID/+Ah6hVrbyeKxYhjlorln9sq+Ha
         h/YhadAh7b9YRDsbxZjGaVhhW8XbccPTQJ6uwB48zrsS8KF32KS9pnBIhm8n09sxybBP
         9IXS412BakL8W1TPZaA9Iief96NRjUdBO779rfWewnAQ2/kszRTU8mciEaCPZYA/mzAy
         QQnI0pzkj8o2SPcvXIqDvA+nYgsZiw4POFRMJoHeEwasUghCxsOhyZiIFb3chPm4knzw
         kvug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjZh1j5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23si2422460otp.234.2019.12.10.08.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjZh1j5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiho-0007K4-Tq
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieigl-0006tg-Ls
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:48:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieigk-0005qE-K8
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:48:43 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44428)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieigk-0005pn-D7
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:48:42 -0500
Received: by mail-wr1-x442.google.com with SMTP id q10so20889114wrm.11
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B1cDfx8s5f/9QR+mlmSpW12qDckt3D/lvXSVtrdKzq4=;
 b=TjZh1j5u0sa58MCh/35yKK+h02dV1GjVfZe+pZwtrsCnoyLkP7xvCCCWrdv2R7YtBi
 r/nkuPds7iWxCZeOgtoT/asSpTkJr/raf6ErdGyZsDVrWA1CGpQoRNE4iiXjFlqQO71x
 jUof0258cALt89i/pRukTOHkweDwYQ0QaczoaCV8uxlRheK0+XBCo+gjda4JsH1oTywc
 tEBDwIhEPY8O8e9e8yiKtMHnTMh3P9QkiAQc3LryvfaPCLUKA/lVq5Zr4gJ6GxBaZOe2
 /dq/yJwVcoWOBcrTYnAC6c5U+/mh2S8KE8neWL/lDVbwdIJ9RoTFusvURtADhl2Wge9k
 90Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B1cDfx8s5f/9QR+mlmSpW12qDckt3D/lvXSVtrdKzq4=;
 b=MmfCGv3X+7zS4AeSYXFJ53NbsZl/OhkbGjdTDCyzhudCnZfNcusICy+FUe9t+Lmtf6
 1MfRghyLIRpwq2f1+CGFy209gXspPrP/WuLDGdA5RwqUf29tZFdykw5kuCTqly6l8POm
 E0Jb8AX6jSJy0biStoC3fApo89FLhWEzF5wbsIxUTQy37RsJCw6mwmKiAg70rGhJ3Rax
 8M+aRYw9UJCXpK9fhRJwh/P0b4R2eVbgiEsvCA1UZbmRMqfyNGSxNNRBeD4PayXp76Hd
 ssGpEFtLWYwEEdwRKaoaCp5YqIwcrgN+Z6eip6Stu8Lz8CwZAsxyseeuShPqJNbnh5Rt
 Maaw==
X-Gm-Message-State: APjAAAUwkQu1xjKFfQD6QeHWFEDU37/TluZIwaLV8O2xcxdIxZm04ZiC
 nDxZRNKtAoiFCqVHYx2QvFbaEw==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr4319211wrj.344.1575996521389; 
 Tue, 10 Dec 2019 08:48:41 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id o7sm3695579wmc.41.2019.12.10.08.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:48:40 -0800 (PST)
Date: Tue, 10 Dec 2019 17:48:36 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 17/20] hw/arm/virt-acpi-build: Add
 virtio-iommu node in IORT table
Message-ID: <20191210164836.GO277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-18-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-18-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-TUID: MZjjr2KHrpeA

On Fri, Nov 22, 2019 at 07:29:40PM +0100, Eric Auger wrote:
> This patch builds the virtio-iommu node in the ACPI IORT table.
> 
> The RID space of the root complex, which spans 0x0-0x10000
> maps to streamid space 0x0-0x10000 in the virtio-iommu which in
> turn maps to deviceid space 0x0-0x10000 in the ITS group.
> 
> The iommu RID is excluded as described in virtio-iommu
> specification.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Although VIOT changes the layout of the IORT node slightly, the
implementation should stay pretty much the same.
