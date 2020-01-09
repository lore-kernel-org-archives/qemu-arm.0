Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1954209lff;
        Thu, 9 Jan 2020 02:40:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9YVUBK4qgzexo4H1dDexMQHSjCcLCGGkvR+p4FS1QsfHkJ/5z0LO0w62C3gvcyZ51z/be
X-Received: by 2002:a50:eacb:: with SMTP id u11mr10267470edp.181.1578566453670;
        Thu, 09 Jan 2020 02:40:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578566453; cv=none;
        d=google.com; s=arc-20160816;
        b=UKjQTs00FMwfXhx1Q4Rao9Wgv2swbBpm53CGkkpvxm3Ax/TEsr1FuENke/bgd7THY6
         DeaEBrIDLCU6jw7mEP3tcF5Zg/7LoRAFx4yvJFWcD6eLN2KpbIjeR7DCOV0HUc5XUXa4
         42XATm6lBZb5O00gTuWYPNocWyvk/yOq51aNc9vijYT1/JgDN4eUE6fMjMQjHg8jujQR
         1x0ZaNDI1l9vXHx3tOYLfeuosJnTSNtLEoIUf/CmGyPaEpGwqdiWPBlh5NAvZUfW77qc
         ab42v2iegl++UmQ/gk4FH8MFuISvHBy1ZlwSVNhhZXJEk4fBnSXiHHYLVbF/B9RBZLQB
         4W7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=j0VIeGAp1BrnGHM7FD0UC10bMu2XPsedlX8Zb3gIIJs=;
        b=ygI8yoyN97zyMBmwwIvOcLlVcCIXug/UfWFFlG6mRGTuDpFojuF49tDv9f/qrwhJ1R
         Qspufa33AuVrwVigsVc7jjXRwTI6mMqvQcTSsgnPSC2+Bq5v1JopxOdhSGeRYKdYRKWM
         04+cRRm0ndkiuwPNupBlilu0Z24bhHSVXefJxvqusg7RLzOJXABQFii0QAuvIaeX1YN9
         lq7T1bhE16hE3oEOfqNG5fokN/VJrOCYzOMnqy0y+J/djI8xsRLAg3Xc1VVom3/4LbgA
         8HzpSSUCPrEswmFjnm5YmFI5tVNfK9hKYqsT7+HfExKOncqudoWX3kH594bLgY0hEdwq
         NI+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zvksNLeu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si3955353edt.135.2020.01.09.02.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 02:40:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zvksNLeu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipVFE-0006vK-K7
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 05:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ipVF4-0006v1-OP
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 05:40:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ipVF3-0000Fl-7F
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 05:40:42 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54146)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ipVF2-0000BH-VJ
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 05:40:41 -0500
Received: by mail-wm1-x342.google.com with SMTP id m24so2329597wmc.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2020 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j0VIeGAp1BrnGHM7FD0UC10bMu2XPsedlX8Zb3gIIJs=;
 b=zvksNLeuJvnwYho66axt16D+BITBNZgNgXSacM7ISI4yHBDovfzxQuaZRTXrkbPDyp
 fOYgI62wKt1/inltNH5lLsZCl8L4msDYEVT0de9VcsnH9BpuOgDiM8iT4Vwn9+QAa1Iv
 KWaYpWyFyKzFouwDWIadPiNGS7oNPJftxDIGnHdGp8M4upaQjNe44TD82IpRnuuQG2af
 L8kPX33QYvlC76g2aDfpzV6ysyBWsQsEB4xjAdwfEuWdLJU+pwhHA+61iJb1gVcoAJqZ
 tY/WAoCkQj5rANyZW0eDxwP9ofFR9icTnDwgANvuiit3hLXGwoEDg2qnYzaptCAYCJzl
 zX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j0VIeGAp1BrnGHM7FD0UC10bMu2XPsedlX8Zb3gIIJs=;
 b=IZgdS8GW6tjDB1AgBu4S+u8aetQNDCoMvW7J8zbbr8k2QdEEs6E45jl7zzbtAQ96i3
 aDYYY0QZVBmFjFHcclKxV8zW/hP30dPL1Bf7nBVSzYSXxfG5qqZyscH39TYfZ88C+GX9
 1xUDXB7BjYl+F9wlWTHndgFFzA3RMA0fhCqbzLq/lbEb7tLC06Q8Nmt49XZO/0I8QOna
 MVgF/8XiuyCnzlWv1KSmSMRGC26vaHuuXjhVR8y/xcxfRmsqWgxisBk8saIK/Bsm6ts3
 uq9LxuJnQ5us0bHgMmrsIv7ECmqogEzR/o0Vkb7e0pP6/WD3epEs0Rf4wyouwf/GQLjJ
 TAFA==
X-Gm-Message-State: APjAAAWrQNgB7A+ew4DMwXcVxalkL+gvRLuVpbYZVUdHWcAFy8IufwEJ
 gspPmYqa1JIT1MaLPGAkIJ729g==
X-Received: by 2002:a05:600c:10cd:: with SMTP id
 l13mr4274474wmd.102.1578566439546; 
 Thu, 09 Jan 2020 02:40:39 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id 16sm2421082wmi.0.2020.01.09.02.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 02:40:38 -0800 (PST)
Date: Thu, 9 Jan 2020 11:40:32 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20200109104032.GA937123@myrica>
References: <20191219144936.GB50561@xz-x1>
 <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
 <20191220162642.GA2626852@myrica> <20191220165100.GA3780@xz-x1>
 <20200106170634.GF2062@myrica> <20200106175850.GC219677@xz-x1>
 <20200107101024.GB832497@myrica>
 <aa5fa9e6-6efd-e1a3-96c6-d02ba8eab4c8@redhat.com>
 <20200109084700.GA934975@myrica>
 <0beb9d61-05b8-3152-e967-64413def6ab7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0beb9d61-05b8-3152-e967-64413def6ab7@redhat.com>
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
X-TUID: 4Xz5AiWd3ZJm

On Thu, Jan 09, 2020 at 09:58:49AM +0100, Auger Eric wrote:
> >> I share Peter's concern about having a different default policy than x86.
> > 
> > Yes I'd say just align with whatever policy is already in place. Do you
> > think we could add a command-line option to let people disable
> > default-bypass, though?  That would be a convenient way to make the IOMMU
> > protection airtight for those who need it.
> Yes I could easily add a device option to disable the default bypass.
> 
> Shall we change the meaning of the F_BYPASS feature then? If exposed by
> the device, the device does bypass by default, otherwise it doesn't.
> This would be controlled by the device option.

For a device that doesn't do bypass by default, the driver wouldn't have
the ability to enable bypass (feature bit not offered, not negotiable).

> The driver then could have means to overwrite this behavior once loaded?

Let's keep the bypass feature bit for this. If the bit is offered, the
driver chooses to enable or disable it. If the bit is not offered or not
negotiated, then the behavior is deny. If the bit is offered and
negotiated then the behavior is allow.

We can say that before features negotiation (latched at features register
write, I think, in practice?) the behavior is platform dependent. The
current wording about bypass intends to discourage unsafe choices but
makes a strong statement only about the device behavior after features
negotiation. 

We could add a second feature bit specifically for the boot bypass
behavior. It wouldn't be useful to the OS (the driver doesn't have a
choice) but could present a bit in config space that allows a firmware to
disable boot-bypass in a way that is sticky across reset. So when the OS
resets the device after taking it over, it doesn't accidentally enable
bypass. I wouldn't bother though. If a FW/bootloader is able to support
virtio-iommu, the user might as well instantiate the device with the
default-deny option.

Thanks,
Jean

