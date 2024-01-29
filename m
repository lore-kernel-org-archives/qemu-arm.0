Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp134814ejk;
        Mon, 29 Jan 2024 04:23:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYP33Z9/enLXDbf3hZiymOklF5+9oQ2ZYiF/DijkW2XUpFUCAn4FgeQC2MKBheniLr0NEf
X-Received: by 2002:ad4:4f50:0:b0:68c:43d6:82a0 with SMTP id eu16-20020ad44f50000000b0068c43d682a0mr3308263qvb.31.1706531035710;
        Mon, 29 Jan 2024 04:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706531035; cv=none;
        d=google.com; s=arc-20160816;
        b=VEcFFwwQx3/HsYGtwIWlGH9Lepl+kTNBUIXtZwaDKo+hK9wSMPWKd3YBi8twM+PrdP
         WI/0mPahUjQ1XU+ZpkaAALJQNVSBtypZkzj71YFaBnWG9l+Or8Byee/XqC30kzUrpsYW
         kPzMQJLfx9JFHvDZPojJHhzoj5lbSgRuXp6QRzQiSvS4+HF7JilcJStPE38/BAVg7fLk
         9fNOEpsTM1/XdV2svL7aKn7od7xIahixxYPITLXvsoqTPIMz2A46VlxMfrqOZkXuVY6L
         3xf01IpjYmYt0GZiakzv0hz3vtAJlHMo03EVYuUhd3PIV1/xk6r2kXwknIfAe0Pwoqi5
         puJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/Wg2tLs+wwWFAO0PWwUWdRnW42bI9re2kMkNBGePrvU=;
        fh=S/JqU5Olik9Z3Q5mE8mDn4bnKe7nRGom4RyWaoivRO4=;
        b=krcds7Mngy6xpR32HaH6vKSY22Ulg0YuoMm0TwZL+lnKIPuZB1KijLFeb2VwAwbPl7
         QpYTYfq6+p6h7uwflXKvkro8YDA3bedP4tavUlP69cTyI1GtqwZO+O4JIJ1JXvfd5krk
         1F+J5FkkUVB8nOP2OXi2JNZR66QU46SM59QqNX4flyVwliK4IIoq3QiINCoue+231kQ1
         hTYdKCaWFkgFCnMjwtQAG5+sPDqAE8tRWeHyE49T08S0ewSjfmxuXh8N8Ijc5NRZlQjg
         potgJjjGj5/WSCaOOo6kz8JrXv3/Jw3kl1fcbhYd8uWkTJjPZ/RkgVpRx2jMohM+WXeF
         uPLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KUBxLN88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a0562140c2b00b0068c3dbfc923si4889716qvd.429.2024.01.29.04.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 04:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KUBxLN88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUQfp-0002nw-GW; Mon, 29 Jan 2024 07:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rUQfm-0002nF-Qz
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 07:23:35 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rUQfk-00065t-QB
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 07:23:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ae3be1c37so839633f8f.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706531010; x=1707135810; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/Wg2tLs+wwWFAO0PWwUWdRnW42bI9re2kMkNBGePrvU=;
 b=KUBxLN88xv4WCuVgJxVKqu2jcLgKS57RWTCoz0i5ScXpWLfYn8WTYxoEHm6+j0rfpl
 t53Asy83R9VCb/buQCOXt+SA9zmi0UpkjzB5XCC8krm5Sav15jLoFGk30vOuJ0EvbE+A
 h3AeegM/tx/mdSMFOqkKSObRAJN2xR+ADo31UWHSsealOA47TJjiRN+WAfaR8jN8yuyG
 3JLh+2a8x3trXsiDHpxlmV73Se17o4mIRQ5t0EGjA7GiNGKSdG2q4hkm2Rwr2i2rKrH1
 0+IsgleqjTFF4Dls312xqz45UbUQ4/1+jdUdphBpYpnQdz7VK4TdnwFmEwvn42HE72hj
 Ey7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706531010; x=1707135810;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Wg2tLs+wwWFAO0PWwUWdRnW42bI9re2kMkNBGePrvU=;
 b=R4TNz/bJksvJrcO/8IRrtdRid5L3dzt2TZWfjLCiBQVVJPmg50996YY5sUaBXNCxfT
 pCDV3MGVhT6qSxzwlRXdyFQgTwAaPmkWT7T4ySY0o/eeIzAEbO9qrflP7bccd0zjaFVV
 QlrNDGRuw/LdXowEggwYltvNnVE4snBlJQTqbRe7X6m8RCtWa/ytcpIhpigMdukn/O1W
 Jg31Kwvh0eFtgfxmwNRicSJf9a9MYAapLg29mRaVGA6mDjhZltOGNQalASePJJc/OatB
 NWs61xbUQualoflaL7emk+lFv97JWtLLBrT/216IIOM4Y8BfS71LymYwwq1OBt0r4iwm
 OXqQ==
X-Gm-Message-State: AOJu0YyG3lbfPwlckOc3BeYXKfAbT/wfX25bJST311VAxWwlzww7M8Vs
 Fy+BQ6oh1lyf/j9/15ZUjlcMcnntuzot1afBaRJtbzaLFoBK+4y5OsKI3jMlZwY=
X-Received: by 2002:a05:6000:1561:b0:33a:edc9:8e32 with SMTP id
 1-20020a056000156100b0033aedc98e32mr2193420wrz.26.1706531010564; 
 Mon, 29 Jan 2024 04:23:30 -0800 (PST)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 ce6-20020a5d5e06000000b0033af3a43e91sm1271833wrb.46.2024.01.29.04.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 04:23:30 -0800 (PST)
Date: Mon, 29 Jan 2024 12:23:32 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
Message-ID: <20240129122332.GA909471@myrica>
References: <20240123181753.413961-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123181753.413961-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5Hiq7Bg5h6z2

Hi Eric,

On Tue, Jan 23, 2024 at 07:15:54PM +0100, Eric Auger wrote:
> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
> protected with a virtio-iommu is assigned to an x86 guest. On x86
> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
> whereas the virtio-iommu exposes a 64b input address space by default.
> Hence the guest may try to use the full 64b space and DMA MAP
> failures may be encountered. To work around this issue we endeavoured
> to pass usable host IOVA regions (excluding the out of range space) from
> VFIO to the virtio-iommu device so that the virtio-iommu driver can
> query those latter during the probe request and let the guest iommu
> kernel subsystem carve them out.
> 
> However if there are several devices in the same iommu group,
> only the reserved regions of the first one are taken into
> account by the iommu subsystem of the guest. This generally
> works on baremetal because devices are not going to
> expose different reserved regions. However in our case, this
> may prevent from taking into account the host iommu geometry.
> 
> So the simplest solution to this problem looks to introduce an
> input address width option, aw-bits, which matches what is
> done on the intel-iommu. By default, from now on it is set
> to 39 bits with pc_q35 and 64b with arm virt.

Doesn't Arm have the same problem?  The TTB0 page tables limit what can be
mapped to 48-bit, or 52-bit when SMMU_IDR5.VAX==1 and granule is 64kB.
A Linux host driver could configure smaller VA sizes:
* SMMUv2 limits the VA to SMMU_IDR2.UBS (upstream bus size) which
  can go as low as 32-bit (I'm assuming we don't care about 32-bit hosts).
* SMMUv3 currently limits the VA to CONFIG_ARM64_VA_BITS, which
  could be as low as 36 bits (but realistically 39, since 36 depends on
  16kB pages and CONFIG_EXPERT).

But 64-bit definitely can't work for VFIO, and I suppose isn't useful for
virtual devices, so maybe 39 is also a reasonable default on Arm.

Thanks,
Jean

> This replaces the
> previous default value of 64b. So we need to introduce a compat
> for pc_q35 machines older than 9.0 to behave similarly.
