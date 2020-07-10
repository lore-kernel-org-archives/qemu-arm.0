Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp516994lfm;
        Fri, 10 Jul 2020 02:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBExfS0nX6OSGs1/o+V0GpcAkoM6sR4+1mnF8LDnP+RnvMspHICWudXqPBnlaVkrTLAAYk
X-Received: by 2002:a25:ba81:: with SMTP id s1mr113175482ybg.386.1594374250318;
        Fri, 10 Jul 2020 02:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594374250; cv=none;
        d=google.com; s=arc-20160816;
        b=G/rJn/s4LzKbOqdsqoeQssOOA4ujcF27B0NeJgrdkdNlcvSIM5qv1cnJeCg5zJ0wYf
         qn7vkFt3Qafk8+EJQI6dL6J1Pp3CegYAZxwD6dmLcU4eHWNmaBIIWhLaQsjI2NeBFIyb
         TKcIqqSlzn/qTfkOIwvlIScs/F3damYBBcdjbhmgrz+ckP9o9Kb9rIALm87wsdWnc1fn
         R9DYC7DM676eV0JJ96yAK5oMwFNQKR9yG78U9poMpst0rQbDYZe1k6zQkLfCREEPbHHD
         7+2ktE6igV+mgoWhkCQaMkIYcPNyvwqVdzJZRJNXRi39c7Gi3kFd+M9rMuBhMkz88Goi
         Nh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :ironport-sdr:dkim-signature;
        bh=KmIaDsXak1iznfxBK4or6BcOqWhG35pVsIvNAHYyi7w=;
        b=ZAp7+vmRIncc8EsWRtiMNQ6W3t3ka/ex+V8XkrkbQwYLFC5FbkotO1piLZITwRGAU2
         iVeK5eMsrmjA/QfQzszY0VCgrbzgcphmew12FZUimhe06S0d0ybjwkbh9mjde+PVdkYC
         oVsR9SzAOPoe6hHWuKyMxCItU2xw4mpxZPU5orh8RzVWCAqUFBKUFRfeJjgg3sd1fqiQ
         ojcds9yR7oJHHBMLd8yT9tct/NFF6A+anHslfVy34YDEpi3XxzVkJnUEYJADhVQZtvQu
         /Aze3Cxe+urIcVslI48J1noXdWvZ9s8wIzStrk1hA5VlymXKR7iQZcE5FCZFZxed55Qd
         Q1zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@citrix.com header.s=securemail header.b=hs7wP5tM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si4875165ybr.419.2020.07.10.02.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@citrix.com header.s=securemail header.b=hs7wP5tM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=citrix.com
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtpZh-0007kj-No
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1jtpYj-00074h-Rm; Fri, 10 Jul 2020 05:43:09 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:55874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1jtpYh-00068D-QQ; Fri, 10 Jul 2020 05:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594374187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mcEnGQBnXTd1RLnLonZEx+mtjAJJblCyHAcPNAUo/T4=;
 b=hs7wP5tMyZsnwRJWJ0wadrOXe5Kx6MIxMoCWLQlvkTnNVZwenPOPXTfM
 LGCP6NtYa3lMgwqZ7mRvQoN0KF5UwEceyfJZZ1GIH1Fwzz4KYA2wgTyQ7
 ogQ5CEdEiekwTauznzRuYoslFMZAh6tHMUAAKvSBV7aWacNaGwL+x9Wx4 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: klkkQCPZF/2lpFEaKDnP1aeddPQj8eqM+iFMfRwi6qM+PM4yt6j3i+ZxlazgddodfHj75g+aXD
 q0PB44Snst7XKcwA2ohDJORIuePrQA56Diaik+7uZehvJH9+DokKynuvyw5tznPTMC6OkWcDAV
 z8Rc6bBCvcP9iJkwpIh2aIiOpthLafteUC8jDGV8yzBGwYEQw/xB+kPrpmzaxWePf5Xjux0Nwk
 UrVh2GfPJ/af2BFmbbkpbiiaqpKTyC6gk907Z+GMMmWqpiT62QlnR22ldtzOJ1uEjFrRH5h/4v
 +ck=
X-SBRS: 2.7
X-MesageID: 22385309
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,335,1589256000"; d="scan'208";a="22385309"
Date: Fri, 10 Jul 2020 10:42:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] acpi: Fix access to PM1 control and status registers
Message-ID: <20200710094258.GF2030@perard.uk.xensource.com>
References: <20200701110549.148522-1-anthony.perard@citrix.com>
 <20200701075914-mutt-send-email-mst@kernel.org>
 <20200701124836.GD2030@perard.uk.xensource.com>
 <20200702063310-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200702063310-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 05:43:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, pbonzini@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ECy8Xu8/5iG

On Thu, Jul 02, 2020 at 07:12:08AM -0400, Michael S. Tsirkin wrote:
> memory: align to min access size
> 
> If impl.min_access_size > valid.min_access_size access callbacks
> can get a misaligned access as size is increased.
> They don't expect that, let's fix it in the memory core.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ---
> 
> 
> diff --git a/memory.c b/memory.c
> index 9200b20130..ea489ce405 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      }
>  
>      /* FIXME: support unaligned access? */
> +    addr &= ~(access_size_min - 1);
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
>      if (memory_region_big_endian(mr)) {

I've tried this (and .impl.min_access_size=2) but that wasn't enough.

In the guest, I did `inb(base_addr + 1)`, but I've got back the value as
if `inb(base_addr)` was run.

The device emulation read callbacks did get addr=0 width=2, so that's
fine, but the result returned to the guest wasn't shifted. Same thing
for write access, the write value isn't shifted, so a write to the
second byte would be written to the first.

Thanks,

-- 
Anthony PERARD
