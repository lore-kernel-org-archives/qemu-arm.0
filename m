Received: by 10.28.91.67 with SMTP id p64csp1590914wmb;
        Thu, 8 Mar 2018 11:17:21 -0800 (PST)
X-Google-Smtp-Source: AG47ELvI+Yd5ZptMS28FmcKup1N0hdWO7zOY06EsGEb/0YSlvAjF12tnah54AJsP9i8OVEboUVnR
X-Received: by 10.13.248.195 with SMTP id i186mr18049820ywf.239.1520536641492;
        Thu, 08 Mar 2018 11:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520536641; cv=none;
        d=google.com; s=arc-20160816;
        b=bIUGm/T0iZFTRi+1KQG2cjjUHfss2tHEKR4dHuA7OxpuJmvG5N/xAskHAi5+lqwBcZ
         LSIjw96WCOX8KM3t4AOT8/PTS/+VRWQdFKvPS0gSwR9bRGrtD1LZzWc+TyHyIkuVzkBh
         CSCsZLH0q87Gzb5uWfrmhK8YDcn+Wj5qA+dMrudcu0ZtS6cPEgJoa4CMAzQ1xd3YRsd9
         prpxgs6m8pnVVu4Sxa6nqITxI9UQBqRmE+k2/irqk0rNpBrd83oyK37CEm3vXXyrKO7k
         bXUUtdUCzaiqu+w/+v9sDs/96H8IQQWOBl7FxYT/dTdaLAM1hqM9E6yByEb/yR34mdZW
         NyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wRWnhRnu/2FS+GOTC8pWg7hr+pGxW9FHfI8PLMV13zE=;
        b=lbXQQJYLaO77fp7B728B5cAzgIBFZVTwC9XIAJGKR1FUlmDZBxU9u5qnea6iAQQwpY
         kbljTSjLQ8iSP/53KCG5f4JvmeHsSzG39t1aWk08C2P2KECT3NXpzoOlSb8vtLlSzOrW
         VEZwrLD8qkgp2NKD14oxcledrS2c2nZ1ychHzTIW8jBLuA5kUSiWZDTgJYzn26Bt7RxC
         +VOc+TPRALInlmNv6uuZL0h/sCj4bYgP833KNcG6FIEHa2a+WCQvalyj0rzGf9v+uBMp
         Dhaj3DYI9YS/4FHJ87ac8rZ88R84+NN8SHbWDkENmfqpxMH8H48XRwnaNYqPt44LfluA
         5LkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwQ7IOW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si3522685ywf.235.2018.03.08.11.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Mar 2018 11:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwQ7IOW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eu12W-0003ST-Qn
	for alex.bennee@linaro.org; Thu, 08 Mar 2018 14:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eu0sn-0003lz-NE
	for qemu-devel@nongnu.org; Thu, 08 Mar 2018 14:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eu0sm-0004Bm-Sh
	for qemu-devel@nongnu.org; Thu, 08 Mar 2018 14:07:17 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eu0sm-0004BW-Nc
	for qemu-devel@nongnu.org; Thu, 08 Mar 2018 14:07:16 -0500
Received: by mail-oi0-x244.google.com with SMTP id c18so5152186oiy.9
	for <qemu-devel@nongnu.org>; Thu, 08 Mar 2018 11:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wRWnhRnu/2FS+GOTC8pWg7hr+pGxW9FHfI8PLMV13zE=;
	b=HwQ7IOW84iF6sTBgDlMdy5l9+z4cWXdN/7Bh2hkDoIEqv8bCOUb3vLQ0kYjKp9EdPF
	zb3Bh2TJSMn4SWHo+CMFu1Z1DSyKL8eVkagAoeyFEoQSX3W6voTZSrJcywkVcsKu40a3
	uEWCu0bAGJr+R3CrEgJ1mDKzoRwCYIwSM+iTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wRWnhRnu/2FS+GOTC8pWg7hr+pGxW9FHfI8PLMV13zE=;
	b=tfgzQAk3gpP6jh5UIYkXOILKZOVlOfRIoWqJB6P2w5HLs+GL9ufWYQVFCUlh3a7LvL
	Hq17MfhEQvipxL2Pe5mnn80SBMbWBHjsvbnPfmWpS97ylva2MsbFVeZJCkvQ5OUYCDIc
	KwCji5pETcMBLXiG6r1hqKsA/DBsoDGJnETBveS9Ug2Q0jB6yfE6D3vtwRSCxNDtKKO2
	PkNtwsMIPvBBcDPsIuh39AN+AJ3HLJfYkNUf4wmwXkJdZUn/BHdTT6njrN2q0tPZyUH/
	wmKMDZcsrfAQ/rVFzxmXMpG4M5fJCc+m8pDn9gDx9yWXEs+ecc7o4MTIcKTQGL7BccFP
	J2Jg==
X-Gm-Message-State: AElRT7H4pGAPyndp/Pe0ncH6uklDWBAvQ/DMIWsMgPXCYZBr8np/g7Rb
	CTj+foyQtkSkFkZPprFyjsn7xf4kJu28ZG37bwIw9A==
X-Received: by 10.202.61.198 with SMTP id k189mr17478988oia.252.1520536035996; 
	Thu, 08 Mar 2018 11:07:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 8 Mar 2018 11:06:55 -0800 (PST)
In-Reply-To: <1518893216-9983-11-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-11-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Mar 2018 19:06:55 +0000
Message-ID: <CAFEAcA8grbFO7E0yoci_dwr2xnH8ujS8cJnpNxGdz=JOged=Gw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH v9 10/14] hw/arm/smmuv3: Abort on vfio or
 vhost case
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M6zw+xmBFkZE

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment, the SMMUv3 does not support notification on
> TLB invalidation. So let's abort as soon as such notifier gets
> enabled.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 384393f..5efe933 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1074,12 +1074,23 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>      dc->realize = smmu_realize;
>  }
>
> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> +                                       IOMMUNotifierFlag old,
> +                                       IOMMUNotifierFlag new)
> +{
> +    if (old == IOMMU_NOTIFIER_NONE) {
> +        error_setg(&error_fatal,
> +                   "SMMUV3: vhost and vfio notifiers not yet supported");
> +    }
> +}

Is this triggerable by the guest, or by the user on the command
line, or only by a bug in the board or other QEMU code?

thanks
-- PMM
