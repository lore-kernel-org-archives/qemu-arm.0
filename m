Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6063470lff;
        Tue, 10 Dec 2019 08:45:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6y5CMpgwSF3O9Fl7S7O+RHeGyKVM+rxdQSXK+etBghZyXWRG7sYGD35IEMLbUHhV3i5T1
X-Received: by 2002:ac8:43ce:: with SMTP id w14mr1147009qtn.256.1575996340229;
        Tue, 10 Dec 2019 08:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996340; cv=none;
        d=google.com; s=arc-20160816;
        b=ni6QsNFiYKLP2vC3x8LPvb7nFH6X6LV6ubtWmJjV6qeh55NsK0J9MkZjRrzIsCL0OU
         8+IbA7trt6vvNpwNEUelvyMlsAbn8839m/ofGaZCvy6plIzMO1euJ8NcjXdXba0jF8Np
         YOz14pHtwdFotcDa3Ax5ktihvJSsMOHwod0UXhyXocnOZGh0cG+lhxzXvMbjWsbGmp0u
         eRb5emq+7v8oDuIhgpJPpi2OYzn7vadDfa3IxYg1aAOkkcYqTwZZ6a0H11KSRfF+t4Ki
         kY3Hv4oMs3QhQjSJ0IKxgaF5epHnKbl21I7vS2aMcoqjmTfAsHJnMGKz0kvcSrYxH2ic
         VZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=g9cCMZtEkM7Y7AHaz9CHJEQ5Bqx3hepUjwcskldSK3k=;
        b=UhoxktEbRarC8kZaaBPJkAgWMGXF3T9neO8nq4esz0ifYEQxmoAgoiBfWqaBgagWYM
         AKpx+E6uxa0wXz1HhY4jJVinoBaZ1MsPEd9FbRDASwmvmNMKw2mhXj9WaQqQumPe0Huz
         lMqQ+nPsy33Ng/rs9qovuL9IxD5f7Oxus6uEvTI/dk4qRgkE7BDxMZs4ceeivpLXQQIX
         qHXVkBAqFfml4x+FTZV1Y8Cj6a6eJwclHle7WQQ7xclMUeaiqZ+WYD5DkykoOuLgwTkK
         Y58tX60PeCNRdB7YZXfmO2ujrngQFWuJpRHbbVyHjvo80F0W1cOLghWQMs9ERALe7CDD
         aRAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DwlGZP8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si2076010qvw.27.2019.12.10.08.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:45:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DwlGZP8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieidn-0003xd-6D
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieidC-0003t0-UM
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:45:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieidB-0004XH-Ut
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:45:02 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieidB-0004Wq-OV
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:45:01 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so20914308wrr.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g9cCMZtEkM7Y7AHaz9CHJEQ5Bqx3hepUjwcskldSK3k=;
 b=DwlGZP8+EpwQOTeJoLtucByNvZ9UpL03GK829rihVuEGOLULBNz27gCFJi/Y9asyhA
 /yagQyBTIKXfYCsif4YPCvJbeLoOViM5nGXhqxXYlgmTYkhnTJv5RJ/Tm+M7uQsAlBdz
 3pZyBSiQXfNRschF5jx2eAS19+lA3YNorgni/IIgCVFtGxsy01bK+19MfpLQpDlKMcrC
 GUisdoMI78UK5NWmssIS0hibeg8OIweSne2qOi/aywIcas+FK1bE1xob0FsOeLAv1BsG
 /6nI6fMq/NzZQJUmr07aa0CPG5rrmuzUBnkk0tBxYOdW6vd5x4frEWqvWAlA2Li5cwGb
 Xqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g9cCMZtEkM7Y7AHaz9CHJEQ5Bqx3hepUjwcskldSK3k=;
 b=KkWcCeF8+Ty/jSR6T4PyDOWxE1Q2EiqL7GzvRkhcuT+VfLbUZr/aooYOi3g8cZAibv
 LsHMLZ7Hma7/hu0dT637kf8hpmz2ABw8/xK5oMw5OmG4CggQnYY+oYpGwsBTo6ZmClyh
 Cr7XaPEbTAU86qbE4lqczcovDUuc9S79prWyibU0sIGKXjdGrpRWiIUr01r5EmD0OtE4
 aV6YtdaJJW3EiTbPOdEeRyXlwYCk9BEdpjK39klBABckaAJXot2Saffzl4SqKEYtB//n
 p1F5H6IpbfpTDu8Ac1h/QEZYsPZ8DawqJLR5i9YJR1poeBt6VNtxqxMG+x1sNBLmfNDm
 PcwQ==
X-Gm-Message-State: APjAAAULVdB+mKoCkgAoKK2IeKnaF8cHrFLafFq1F4U34rRLAL0GsK8o
 UIznZgo8NPFoX76s8sieW+X2bA==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr4392337wrs.92.1575996300824;
 Tue, 10 Dec 2019 08:45:00 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id p10sm3682392wmi.15.2019.12.10.08.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:45:00 -0800 (PST)
Date: Tue, 10 Dec 2019 17:44:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 10/20] virtio-iommu-pci: Add virtio iommu pci
 support
Message-ID: <20191210164455.GI277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-11-eric.auger@redhat.com>
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
X-TUID: tMfv+jKWZ6jl

On Fri, Nov 22, 2019 at 07:29:33PM +0100, Eric Auger wrote:
> This patch adds virtio-iommu-pci, which is the pci proxy for
> the virtio-iommu device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
