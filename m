Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp662589wri;
        Thu, 7 Nov 2019 00:56:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8NByjCNmRdHyjD34GCEjA3Fy7YjD4KWUnhBBhKc5HupKcNVruR7aUGanBAMia5eGFZqTH
X-Received: by 2002:aa7:d40b:: with SMTP id z11mr2289616edq.142.1573116990840;
        Thu, 07 Nov 2019 00:56:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573116990; cv=none;
        d=google.com; s=arc-20160816;
        b=scc7/2N4CjN5PmdklQ+WdslCP6OGfVwjipHD0WHvbL9YqjR2xtnWXSamkHhPaTGKZG
         10wmaMzYq21Rd6asYI3W7IrMHFVbZqqLhXHY0tjgiQ1aAiQMrjsgrP1hslqqc+wdXHLe
         s3Mjp7YhNzQVGtdvqHZHAYlCHxGkLEaLNwEYGcey9Yasx1G+ON4TqFMspg3ucCUQIbls
         aGK/78jspl96BlBBCk6D/i5grGRkXvzdCthDci8oQ6J2jyod504b+ks39RTt/kDQmDIe
         7Abj6WfbJ240wRO/rgXYcsV4rVbWmUHr7ICT287FGIEJBJvrOZdA3C9VzlpcTbbNihAt
         c9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=mN14RHBQTacGDmzpXA+VTGfCydp2qDZE5RujK0pXeOs=;
        b=G+km29Kj9ajN8o8YEiqY6pCleDEHvPYH82FhQ9QRJejaAdi0eSHDlUq6ymbIutcLKr
         Xs1VdkI0XOsp68Q+zoTMRqm0OJxy3rwTe4e6IkRMnyz+rWx/J3/n5bdFP5f24xnkoFrA
         VgBUiAsbOaUyewbDz9zxuzMpRKPthU+BfNQ6SowQLCA+uqT7RH5Zc9CVu2ebGvRZ89sy
         xBPaoivr7Q7pofKbVFCZhWtyZgHnO8CQGZNP5NOulzdS4kymobQ86Bi/FeA/UqLal37c
         OZYVFN+69smJGvb0bNdLB9B6UuKcIrRHL6UZqEWvIZyFfD+wHfxKyRB47A7NORPh/4Cg
         XpEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si1045086edi.445.2019.11.07.00.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 00:56:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSdae-0003dz-V2
	for alex.bennee@linaro.org; Thu, 07 Nov 2019 03:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iSdaQ-00036T-Cm
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 03:56:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iSdZr-0004Ik-UU
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 03:55:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42054)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iSdZr-00045O-JT
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 03:55:39 -0500
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C3F6368E6
 for <qemu-arm@nongnu.org>; Thu,  7 Nov 2019 08:55:37 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id c32so1733303qtb.14
 for <qemu-arm@nongnu.org>; Thu, 07 Nov 2019 00:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mN14RHBQTacGDmzpXA+VTGfCydp2qDZE5RujK0pXeOs=;
 b=LicvdVlDMztykPS//6viDI7/OXM+aMMQ+kx/eLBrh8ehxbyU9xTQzdFWI1dlDnwRs/
 itIbCyZnclgmvvbtswSYfbxrS9gDBZ29absa2aJ+lW8yujZUa77mCUo5ozEkqjh2UUGS
 Yt0dCWfwL6U0c8/QgMQ9g1ZY2G+YgkOk+LUOB3ZkBWVXYKZiQWWayHyGitoimObNq8vO
 KLhWntnAZHwEaQXAa4rRX3im4qpinRFr7BplS/QY4Iw0LSafsmYAsLI26qCzC2o4zm7U
 3XC/KeYkkWJBjzz9bMgo1/8cW5aZawM20GlzHI5/rUElFi+1y8hP/TlWjlP4LPl3tDBJ
 D2Ew==
X-Gm-Message-State: APjAAAVrjHm0WzK1kDvY4yS3oZVes/MPQBCcmpnmeQj8KHH8rHvFKV6p
 o1oi6GSnrRNbcV6hV/mjWd0AZ4Iuorf8tA9U47Ok5SgOu9nwKoAfYzM8NSSKNVGTMZ0QtTOo5sO
 WXsoNj4va6oqG
X-Received: by 2002:aed:2986:: with SMTP id o6mr2548405qtd.320.1573116936741; 
 Thu, 07 Nov 2019 00:55:36 -0800 (PST)
X-Received: by 2002:aed:2986:: with SMTP id o6mr2548383qtd.320.1573116936472; 
 Thu, 07 Nov 2019 00:55:36 -0800 (PST)
Received: from redhat.com (bzq-79-178-12-128.red.bezeqint.net. [79.178.12.128])
 by smtp.gmail.com with ESMTPSA id s21sm680319qkg.24.2019.11.07.00.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 00:55:35 -0800 (PST)
Date: Thu, 7 Nov 2019 03:55:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [RFC v2 02/14] standard-headers: import arm_sdei.h
Message-ID: <20191107035155-mutt-send-email-mst@kernel.org>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-3-guoheyi@huawei.com>
 <20191106185240.3f5e2c2a.cohuck@redhat.com>
 <059c6396-bbfb-2dd3-f7cc-7c64bc2d3ccb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <059c6396-bbfb-2dd3-f7cc-7c64bc2d3ccb@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hle3kFxWjnro

On Thu, Nov 07, 2019 at 09:40:49AM +0800, Guoheyi wrote:
> 
> 
> On 2019/11/7 1:52, Cornelia Huck wrote:
> > On Tue, 5 Nov 2019 17:10:44 +0800
> > Heyi Guo <guoheyi@huawei.com> wrote:
> > 
> > > Import Linux header file include/uapi/linux/arm_sdei.h from kernel v5.4-rc5.
> > > 
> > > This is to prepare for qemu SDEI emulation.
> > > 
> > > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: Dave Martin <Dave.Martin@arm.com>
> > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: James Morse <james.morse@arm.com>
> > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > > 
> > > Notes:
> > >      v2:
> > >      - Import arm_sdei.h by running update-linux-headers.sh
> > > 
> > >   include/standard-headers/linux/arm_sdei.h | 73 +++++++++++++++++++++++
> > >   1 file changed, 73 insertions(+)
> > >   create mode 100644 include/standard-headers/linux/arm_sdei.h
> > Just a remark that I find it a bit odd that that a header that looks
> > arm-specific is in the generic linux/ directory (already in the kernel,
> > I know.) Is this for sharing between arm and arm64, maybe?
> I don't think arm platforms will use this header. In section 4.1 of SDEI
> spec, it says " Both the client and dispatcher of SDEI must execute in
> AArch64 state."
> So shall we move it to include/standard-headers/asm-arm64/?
> 
> Thanks,
> HG


Yea, that's because it's used by drivers/firmware/arm_sdei.c, also flat
in the top level hierarchy. It's been like this historically.
If you want to do a small kernel project and reorganize
drivers/firmware/ according to the architecture,
then arm_sdei.h can move too.

Until that happens upstream let's just mirror what kernel does.

> > 
> > 
> > .
> > 
> 
