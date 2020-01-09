Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1990331lff;
        Thu, 9 Jan 2020 03:16:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqycrqGu6FvIJ2f4Ippa696NnXUxjCiJscnJ6PykmqfRT7kwsl418ytGs9ZcdybtQHoc9R6P
X-Received: by 2002:a0c:c293:: with SMTP id b19mr599305qvi.144.1578568597032;
        Thu, 09 Jan 2020 03:16:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578568597; cv=none;
        d=google.com; s=arc-20160816;
        b=BP/ayJfMl9klArsF6nnw7O3cOcJD38+Z8PgAoK6jaQ+6fhU2pqWdeEkaOiVX0G0CbR
         0scphAuDCt0UuDygqOY9hZt2bIDadfKf41Bo/dx6jtpYStbwNEXtoE5c5kkraYHl1CjP
         bWL7xlfqJdmhkha88pka37aRYRcnbCq77OLnUW0FgWFVi0dQVJjKDvylJZC8HvMzRaB+
         RyoOCoUnJ018iWM41j0xTQxwjQFzn3ckREZCsa/YzTBRTrKjpJ/E9GdLGgJtU30bhnos
         dRJxxggG5ex4mpM0wLHA8/Bdjk7T+YZhTCqwiuPiA9lLDsPfJ0vZkc57ejnf3bPBg5Sn
         dj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pLeVCokKW+fOVWTgJDpb3D6qGp4EKoRi3k3tmToSbwc=;
        b=VFd9SpKusXrhGTlEoRDXTaq/K2E6+/x9cF5B4D5mnl7Q7CPI3BviFFy+EJ+ZfutJOb
         rNhhkWyW+WIzUJky0IcqMBUWupeBDgZTbeovAvAz4ChW+2J6dsgXc+9LIAiX162XyhnW
         5w2qXDAFTzHD8vljiaVrkbA0rl9LzBdL91ZgKVnZAuCsCoY+ZL6ohjeNV53oep+YqXrA
         GVd1sW7ZGUdda7x7IxPTNloicyM+Dxdy9wtq+RYHTZPmY/4tCk3JQdkUecvOJlV1Reo3
         E5XSYP7xhSXyiags4s3wVKncbpJi5veCOlq4afnQCVfQms1fl1nFg9EK2r9/QzK7qjdI
         FoJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pYv/C8ik";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si3090749qtg.254.2020.01.09.03.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 03:16:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pYv/C8ik";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipVno-00052n-FW
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 06:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57903)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ipVn8-0004sg-LX
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 06:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ipVn7-0000UN-5Y
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 06:15:54 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ipVn6-0000Ow-R6
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 06:15:53 -0500
Received: by mail-wm1-x342.google.com with SMTP id d139so1808187wmd.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2020 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pLeVCokKW+fOVWTgJDpb3D6qGp4EKoRi3k3tmToSbwc=;
 b=pYv/C8ikX34mJ+fA20ULSoqiTmuTQ4UaooXny4FGJQWvuY+zQPelkOalCkKH0Cu1rP
 uuYiomAPIe5z+RIhbeeSvhkzTiL1MIcGcD9ik2gtsV8R/Ou0WNEsatNhwhHGYA8Z1a3z
 fKkVnw9CTQlRFTOoSGpaMX4L4L3tozYVMG8AAFrz6tvNNCliqWMDBgy2lekxO8xNY5/A
 jp5CU8jsXIqXF/LpJt4bNkkCuOtOAJ6pW2WM31Vpr9lwa/0aPqynWGCvL3pPORGpwQxX
 4eUWBduxX5nKQKVmPAVZQluMDHHgVAg1trMH08X/gg38DWEh3d4LFSu2gnsamsC502i0
 JwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pLeVCokKW+fOVWTgJDpb3D6qGp4EKoRi3k3tmToSbwc=;
 b=YWz2kxT80trts6ZOatO9UL+FFivW+257ru1RtI3rxmDlhkkiuUQawqKPplTQNBAegk
 VHLxvCulEYmxFhncx5XLppgRl+KfICxKXTerpuykXt4SPplAjF6R+1bjKGBASQ8Rfk79
 ftucif9lnVXD5KIPIbzLZ8xb619VZcFG4DFN9/L84uafAFKh1sn0KNTzZafmDGZlil45
 SmTJidN/cWK6e2QZ7ftmO6w9kraVdrsO+kfArDhgh4Ow1M1bY/UXEsX3N0x6SsSicBsf
 l+kd2L8vjyZ7AtYcuo5HroT8Az9v3YEN/nBAGtTpC8gjqULza99GEH9JpOlNVTy/fVvu
 7cMg==
X-Gm-Message-State: APjAAAXUys8rTu+MfkkvCVgn1ZMdyLR5oU6iQvk4NFd1x0Qw3IxKfxT9
 YFwPzkCG4TUqu06Gm/4Beb2dfQ==
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr4110182wma.84.1578568551518; 
 Thu, 09 Jan 2020 03:15:51 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id v83sm2561889wmg.16.2020.01.09.03.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 03:15:50 -0800 (PST)
Date: Thu, 9 Jan 2020 12:15:44 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20200109111544.GA940335@myrica>
References: <20191220162642.GA2626852@myrica> <20191220165100.GA3780@xz-x1>
 <20200106170634.GF2062@myrica> <20200106175850.GC219677@xz-x1>
 <20200107101024.GB832497@myrica>
 <aa5fa9e6-6efd-e1a3-96c6-d02ba8eab4c8@redhat.com>
 <20200109084700.GA934975@myrica>
 <0beb9d61-05b8-3152-e967-64413def6ab7@redhat.com>
 <20200109104032.GA937123@myrica>
 <bcb585ef-f617-e870-72a2-f4028682547b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcb585ef-f617-e870-72a2-f4028682547b@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
 quintela@redhat.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sGavDSXL1e71

On Thu, Jan 09, 2020 at 12:01:26PM +0100, Auger Eric wrote:
> Hi,
> 
> On 1/9/20 11:40 AM, Jean-Philippe Brucker wrote:
> > On Thu, Jan 09, 2020 at 09:58:49AM +0100, Auger Eric wrote:
> >>>> I share Peter's concern about having a different default policy than x86.
> >>>
> >>> Yes I'd say just align with whatever policy is already in place. Do you
> >>> think we could add a command-line option to let people disable
> >>> default-bypass, though?  That would be a convenient way to make the IOMMU
> >>> protection airtight for those who need it.
> >> Yes I could easily add a device option to disable the default bypass.
> >>
> >> Shall we change the meaning of the F_BYPASS feature then? If exposed by
> >> the device, the device does bypass by default, otherwise it doesn't.
> >> This would be controlled by the device option.
> > 
> > For a device that doesn't do bypass by default, the driver wouldn't have
> > the ability to enable bypass (feature bit not offered, not negotiable).
> > 
> >> The driver then could have means to overwrite this behavior once loaded?
> > 
> > Let's keep the bypass feature bit for this. If the bit is offered, the
> > driver chooses to enable or disable it. If the bit is not offered or not
> > negotiated, then the behavior is deny. If the bit is offered and
> > negotiated then the behavior is allow.
> > 
> > We can say that before features negotiation (latched at features register
> > write, I think, in practice?) the behavior is platform dependent. The
> > current wording about bypass intends to discourage unsafe choices but
> > makes a strong statement only about the device behavior after features
> > negotiation. 
> OK. May be worth adding in the spec later.
> 
> By the way what is the plan for the vote?

The ballot closed and the spec is accepted for virtio-v1.2-cs01, with the
condition that the stale statement about padding is removed
(https://lists.oasis-open.org/archives/virtio-dev/201911/msg00083.html)

Thanks,
Jean
