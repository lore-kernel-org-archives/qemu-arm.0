Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8048636lff;
        Thu, 16 Jan 2020 00:06:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6CHrfjf2zWF1uHT8w5yDPhFSXF97G+eGmljrvzYMzfoC36gBkMzTsb8AUnQDiy+eLlqRU
X-Received: by 2002:aca:f305:: with SMTP id r5mr3255467oih.174.1579161986060;
        Thu, 16 Jan 2020 00:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579161986; cv=none;
        d=google.com; s=arc-20160816;
        b=NVA0No5gTKiNSOtYDOe+wT2GbDHbZ2SWwLaaZ+hk1GFB68+lmxARMAGEs4vGAbJShb
         P33AgGPOc7u1J6HMX81/Cqhhn/gV1VlF0VjxsqgCxedJcJ1c2ySZlC04tzwTGo/bLGCt
         LDPF1yGdEHOuWxt0YfRG1w//eVwX8/6iaTP7o3MEego42L2JT5qqrXI1+9kcQBSPyirp
         Ar30d5OM7irXQB2BoqvG+myWT6XYCDqEQts355XYUf652a6HrWn5vPzrP1YXlFccNmYm
         L0Lk7QfV3cdZbQ7hcbYM7V2Q80FKrjyWCTA3Gx3Y3mFOH7Si/xYH+Y97GisjL/gVoulL
         mHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=T6hutKtjaQ1lNx4PJ3aLb67/cBy7jWlVyp/OF4XcnLo=;
        b=O57iCsKg4+LHfLhav14PbljqLaU87xWebCOGef7YYl1FEMnynVBJoxLVNk8ts3wtYb
         ssB22g8vHuE2WiD0OZUsUBPIdo0/jfzcZ4WQPIviiFMBMi5QcXeMOhXG549HHtEnsIKd
         ONdW6YrpGSPp4uUPqvQQXh/8aJr7MLxkAdH2ZYOQcAp+iepelYbmf32hlSKIfQeUjZrw
         8jHuSRLN+88cgn4O3K9hG0UhfwL02v+BdqaK6cbr1cxlyRfeBY3/6I0773f2xUiOXvIB
         AY+S/HmmLBnPb+9CISBIH93woxkbl2wbCPNojzT6wwqydf5vOyWJvkhJ/Os1/sBLOPDl
         S/7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PUDuyi0l;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h139si9826925oib.85.2020.01.16.00.06.25;
        Thu, 16 Jan 2020 00:06:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PUDuyi0l;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgAPIGZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 16 Jan 2020 03:06:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41264 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726082AbgAPIGY (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 16 Jan 2020 03:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579161983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T6hutKtjaQ1lNx4PJ3aLb67/cBy7jWlVyp/OF4XcnLo=;
        b=PUDuyi0lXrKtbT6WBYpooyUgCwTW7BX9Of8BcX8x24O4SPVncl8jpq7YFd+RcdZoJ7LD8C
        eSdzcNMQPExVe42quMABNRklrmP2S+egnFDUU03E4QwPPOI17Nmb8hBdDHPOioZPDZPtOq
        bDNgxlvbCMhP0lo1S193qhnwt119s5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-CiYYQcitPImWik046IWKbw-1; Thu, 16 Jan 2020 03:06:18 -0500
X-MC-Unique: CiYYQcitPImWik046IWKbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAA35800D55;
        Thu, 16 Jan 2020 08:06:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB1C5DA70;
        Thu, 16 Jan 2020 08:06:11 +0000 (UTC)
Date:   Thu, 16 Jan 2020 09:06:09 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Auger Eric <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 13/16] arm/arm64: ITS: INT functional
 tests
Message-ID: <20200116080609.thwiyi36rttnezxd@kamzik.brq.redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-14-eric.auger@redhat.com>
 <20200113181701.jit3ywxoifduipew@kamzik.brq.redhat.com>
 <1c046216-b873-a4c1-4a7a-374f10947d59@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c046216-b873-a4c1-4a7a-374f10947d59@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gc4LUHlWIVac

On Wed, Jan 15, 2020 at 06:11:23PM +0100, Auger Eric wrote:
> >> +static int its_prerequisites(int nb_cpus)
> >> +{
> >> +	int cpu;
> >> +
> >> +	if (!gicv3_its_base()) {
> >> +		report_skip("No ITS, skip ...");
> >> +		return -1;
> >> +	}
> >> +
> >> +	if (nr_cpus < 4) {
> >> +		report_skip("Test requires at least %d vcpus", nb_cpus);
> >> +		return -1;
> > 
> > We have nr_cpu_check() in arm/gic.c that does a report_abort for this
> > case. Is there a reason to do report_skip instead of report_abort?
> Why should we mandate 4 vcpus?

I don't know. It's your test :-) afaict if there aren't 4 vcpus then you
skip this test and exit, which is the same thing as report_abort'ing.
If you intend to run multiple tests and only want to skip a few when there
aren't enough vcpus, then I agree report_skip makes some sense.

On a related note, so far I've always tried to write tests that require
more than one vcpu to be testable with only two, but then test even more
if more are provided. Do you really need four for this test?

Thanks,
drew
