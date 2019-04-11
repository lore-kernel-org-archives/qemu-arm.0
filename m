Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7331520wrx;
        Thu, 11 Apr 2019 08:42:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuImIF6sx3HW1VIn3F3l3BFTxlIWEYgGJ0CmhjCrbSR680ubUrTxE7ijq6Wwn5P75y6Dxv
X-Received: by 2002:a1c:67c1:: with SMTP id b184mr6876700wmc.12.1554997323846;
        Thu, 11 Apr 2019 08:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554997323; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9nR01u7ApSyXVqv/YXtLjj1LunSLCpPmL8KxS+bAfiDMbsxDAYthYSjk1qIqZskL1
         pLL6NS3QUWWdKppJ2DYStzVu4P9o0pyWHC9RZwCfTJLeMtQCIztNJ7XnKGtcMbnzWqEi
         MztuBZs5tRVv8ZvYkl0jDFvBGuu0ed6Nygme8MkFrL7wl1rCcQU5At3PkNUOdPrASVHU
         ah4ularxr7pQKZo7oCyr0+x1skYUd5V9gllFjpBuzh7xxBHi6sNujn+4zWxd3NRB5zhv
         al9oUxhC/7/aUHzEkOgmlqAuBxx3FC9ArSBLLt/fQ5Oc87AkYI7HvbqGuyUOVEPAtZ6G
         huDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JTtfixS6qBAl7tInZ3dcJ1/3iyn3CfPiVKIhOGBMOlo=;
        b=JOC9tSFWfYbk11e7XH6gmswM19+NQuGS+/kiOixddiPhclsP7/gJfQaXabOtaMokUt
         DRT9hxLy8gARzX1oZzdy19b6pGlTmguMmfejl8aKgWYzkalg1oO9jmABWRPqw63qd5xz
         qy13mQdeSk6FEomKxJvAKeS1RMCumnRINsV9owu3/kLZLJlqD7lK1T2zsNR5abKenMlM
         fDeGjqJEvIc8TE/b4sU20NVmdbdJ4tWYxDXYK0jCobMlpA1YNcwYBUGagfO0GUUFDCVb
         3S9+eTkgmbhJ+Fz0u4OB/BmzI61GHN4zvPVjG5H81kW0+spdPjY35EGVLZKfgiKpPxBk
         6Eyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=faJCIKtB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si3258021wmc.107.2019.04.11.08.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 08:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=faJCIKtB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEbpy-0002PK-TN
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 11:42:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEbiL-0004v1-D3
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 11:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEbiK-0004pM-G9
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 11:34:09 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEbiK-0004oY-52
	for qemu-devel@nongnu.org; Thu, 11 Apr 2019 11:34:08 -0400
Received: by mail-oi1-x241.google.com with SMTP id y84so5248942oia.12
	for <qemu-devel@nongnu.org>; Thu, 11 Apr 2019 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JTtfixS6qBAl7tInZ3dcJ1/3iyn3CfPiVKIhOGBMOlo=;
	b=faJCIKtBvR4Y2J+R8Oy/MGcGkh+w8kKvSEp6GZBXESL9VuZADoWLGlt2uxXg/mST+L
	zCwsDEEI2vGQ9kBo56Wwfmto+e3vX7YVTRX+UfAF9dYYboj1BYbWiSa+zMxOzwb3oiB6
	2mR+0E7WxCaSKxpHS9tsMMKcByFpcZIrOHcOUZ1cMcPIDbUP5g/vMCBkpDRRbHNN++NA
	8rfNKDU8k1DK7qkATobONjSN2HdE2wYyi/cTyXwBRQBiprAedm8NzZB6gwSDsEOp7rF3
	xFXVUjNqbeW9AgC2wZJPvqgevP7N/1PkWCE8R5Ff8Wa/t+6VZZKazZ88JmzL3URxbL+Y
	TN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JTtfixS6qBAl7tInZ3dcJ1/3iyn3CfPiVKIhOGBMOlo=;
	b=IvpyYe88xdxc0OSPQ1vpLuh8tUGbI5U5s89+1ctmP1cra7HmSqVxVpdDZzOUoqEgi7
	poSScAyw4Gz0elyiuJAsfdt+m6Pnqb3qHnPMNvtKSwuLIjRvNiR5LkfGADc/9ACWdJut
	j5FmFy+8vjjMBuvbLcxWGMK6poe6AeKO81xDpWAOZU64/pPGgq2ZlZhrCgjV2QiU0fYx
	SDyHy3bw9lYAaJNwxoC5xbrLEn1jFvqwDU3S0xKbTzSeYP0KEU7T2QEbbWat6aXI+ikx
	ZEScvkEzuAk/dynfSiyZR71ux997mpE6IKoauhga23lameBKhJ8W6ctYnZP0wVaYqB78
	zN2Q==
X-Gm-Message-State: APjAAAWif8EUHYu93eYcw6wlDohruLLpVZ3XqOGBQajLVAdx6FcQbxxD
	fo6/moA+PiIwCjvzXAlJRIgG4ArZ8/ivenx7TvrpkA==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr6993342oif.98.1554996847038; 
	Thu, 11 Apr 2019 08:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190409160219.19026-1-eric.auger@redhat.com>
	<20190410001640.GA25214@xz-x1>
In-Reply-To: <20190410001640.GA25214@xz-x1>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2019 16:33:55 +0100
Message-ID: <CAFEAcA9LZ21fkGsvw_0+Pro64-JP33qKim8aRNcPnzg9mt16CA@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for-4.1] hw/arm/smmuv3: Remove
 SMMUNotifierNode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pKXxGU313KO+

On Wed, 10 Apr 2019 at 01:16, Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Apr 09, 2019 at 06:02:19PM +0200, Eric Auger wrote:
> > The SMMUNotifierNode struct is not necessary and brings extra
> > complexity so let's remove it. We now directly track the SMMUDevices
> > which have registered IOMMU MR notifiers.
> >
> > This is inspired from the same transformation on intel-iommu
> > done in commit b4a4ba0d68f50f218ee3957b6638dbee32a5eeef
> > ("intel-iommu: remove IntelIOMMUNotifierNode")
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks; applied to target-arm.next for 4.1.

-- PMM
