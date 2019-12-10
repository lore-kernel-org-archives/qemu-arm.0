Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6062321lff;
        Tue, 10 Dec 2019 08:44:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVUR+dPST8H7EbpXRMyOV5mtETJz8Nf3R8usV3vMG0fBVby8iX0AZSH0MH+vR3ftuYio/f
X-Received: by 2002:a05:6830:1e37:: with SMTP id t23mr26767219otr.16.1575996287935;
        Tue, 10 Dec 2019 08:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996287; cv=none;
        d=google.com; s=arc-20160816;
        b=LsyBFKjGJdgGlGu86thZBSoQ+8ANmsR7HTpsomqmBCF2eLEOX2Ge8n4Ua5kqALYIrM
         hHZFzJsapUjUhYHnlxImqBTmRMETcpS61be5CsHckKl7I7eq9WlfnrOhKp2uTnEnONm+
         rst7mTPbQuf0Q9eziqDGAfF8ZPwHuch9lfOFxOKhlK02Q58LTDg5UzCEDbwgtqQBM2iZ
         95CI4nBeUZqaig5XtOTq2EuYwJBRB96a1aEn/vrRld5POoWL2/o6tP9FVultsv2vJnu9
         uroBV2c/GNsY/DiFRaN2T9ihNjc8lL7gOPQP9rfXPf5DA2J3oJ5n2368bzHJD0IQQYeT
         J6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Pc/HUtwzczF7hl6cnINcFfG6ZqHbQFHNh940PLCprkw=;
        b=jkTV1o+TWj55EzE+SDawJXSZNTRmGTmn4/BOY8jDIC9k3sQS48t9vDOhclYDOzdXHI
         Tg8FOtKUMQkrWq3lDbBqqZQ698QT3ydYXJYsJ6jUu90tJ9QwmgBwMcCf/N3lVisYxipD
         Q4jEuLIzGvJBpPctNKDRx0Rh4DqvYMB+jQylraI9Xj/TltnT8PaBTPMUEiSN4t0s05Ww
         LRX93ZrCWCh/yUWJaipjTiGGK2i20Fx2JzV2PyB5/Sx8T2ROQM89GNjK89qJ6yWJijYm
         WrA65Z88sSNtMIqKiY7o6vC8MTag8p8tgikc8FIaT9BSw9CA/OZyDispPvutGzY90wyr
         NjlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RnTss9rS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si2120897otp.212.2019.12.10.08.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RnTss9rS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieicw-0003G0-Sw
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieicm-0003Cw-3I
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:44:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieicl-0004MB-3d
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:44:36 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41048)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieick-0004Lk-Ts
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:44:35 -0500
Received: by mail-wr1-x443.google.com with SMTP id c9so20887576wrw.8
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pc/HUtwzczF7hl6cnINcFfG6ZqHbQFHNh940PLCprkw=;
 b=RnTss9rSbsavmfAYaoiMDwVIsdegSm3Pwy0/t5YimwPdG0Tv+LXOQAikrquQ1gH/L3
 t/vDKRUi3Jpds48e+qclxshkUJMTwRB0d2Z1wWKfo37Bk0KI+5eSNqMcvp0pK4DKbHEh
 nyuqJYgoAfQg01JLLSalT+YN/J/pBKerH2xedN+0pQF6Kn0s7vvu2vaPZYHOA6ZeGcxS
 4mzyygEJZSbZpsZ3NQXNV1PZdZRQ1QomUgc4zDAP3hRV4kTJauoI+7QJ79sjdIYSYzZA
 MMS3U5K+wmQTiC/pTOaPd3uE7PE0u9HFilKg6hdez/KP+HMU4KXkiZdd8WsF5MqPfT7s
 QWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pc/HUtwzczF7hl6cnINcFfG6ZqHbQFHNh940PLCprkw=;
 b=N9DHmie+2GifBVZ37d2hSlIJQePuavdgtLU0XzKLYHs5rD/M3YH6ZCCZHE2vXNuE8F
 8l5QMefhr59MspNvFHY6XYGiWCr1lRVPF+dTpYzBX2ymVwbmPWXQlRgFgR7LZNgFwmpW
 1Rk3QbjgWM/IbJkqUehqavKdUiL/U/6eztvgyBOjpTC0NeInsn2o/H7qkNr2Wh0XWNid
 6T/mwTeHbZo+1F8QV9M9BsAP3DlDlmsNc6eATdnBmp3Zjg5LIFYTOQ3HVYM8t/P14IJz
 AW0VHfQpK09jiE0Bq+6ZZY3+K7BEe+T2PbULdIQYNIZT3XiusTN4ovKSOaXf37+Fz9TB
 IMEA==
X-Gm-Message-State: APjAAAUXaqLeUEkLUKGZ44f/UIHBY4iXSabmKpkVT7GMtEa4/lNI25GU
 7idAGZ3y2pIBnyIivfHSW3I+KQ==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr4138784wrm.151.1575996273900; 
 Tue, 10 Dec 2019 08:44:33 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id x18sm3823630wrr.75.2019.12.10.08.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:44:33 -0800 (PST)
Date: Tue, 10 Dec 2019 17:44:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 09/20] virtio-iommu: Implement fault reporting
Message-ID: <20191210164428.GH277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-10-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-10-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-TUID: w02hLMLjYPfZ

On Fri, Nov 22, 2019 at 07:29:32PM +0100, Eric Auger wrote:
> @@ -443,6 +489,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      if (!ep) {
>          if (!bypass_allowed) {
>              error_report_once("%s sid=%d is not known!!", __func__, sid);
> +            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_UNKNOWN,
> +                                      0, sid, 0);

I guess we could report the faulting address as well, it can be useful for
diagnostics.

>          } else {
>              entry.perm = flag;
>          }
> @@ -455,6 +503,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                            "%s %02x:%02x.%01x not attached to any domain\n",
>                            __func__, PCI_BUS_NUM(sid),
>                            PCI_SLOT(sid), PCI_FUNC(sid));
> +            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_DOMAIN,
> +                                      0, sid, 0);

Here as well, especially since that error would get propagated by a linux
guest to the device driver

>          } else {
>              entry.perm = flag;
>          }
> @@ -468,16 +518,25 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s no mapping for 0x%"PRIx64" for sid=%d\n",
>                        __func__, addr, sid);
> +        virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
> +                                  0, sid, addr);

Flag VIRTIO_IOMMU_FAULT_F_ADDRESS denotes a valid address field

Thanks,
Jean
