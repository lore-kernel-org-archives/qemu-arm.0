Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp568580lfc;
        Tue, 19 Oct 2021 09:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMZ1wTU2A+tQxnvgKW1Y5LSq1PBoN10p28JvXdR167beBEb+i0zliYITaxbu6asOXLhtJI
X-Received: by 2002:a05:600c:1c97:: with SMTP id k23mr7125344wms.80.1634659474695;
        Tue, 19 Oct 2021 09:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634659474; cv=none;
        d=google.com; s=arc-20160816;
        b=MwnuHzS6im4Z5H6mHMfo7sABKeZdb75nBz9ROKrArH4wR6XLY6rYJS2lLMOv/Mwhkq
         yRMavzYP7aUN8CwdM2MPwNr/J412KRx6idG3my6PexxsmVDBqERolnRsNup7SLHdIHqi
         fZu93XTjVEm0kqq7sHJtaeUcc1de3nasoOprsnLaIXcft6JninBq05ouQ665MCdkADVp
         t9g4XfNGKuHYVjYZxzJEwdjCftNg782szCix0UhEJtRGCRX+/t3kBuUvEfhkZpgqkgqR
         NgiFVr2bJCtupxenks7lioqKhg0M+zxvjyzWSsVleVJgQ+pbHZjzN3VX1SYJzYNQSCFb
         GJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Bd3mCko/wmehSzzxAHDW8/kvbf1bZQus34gyS3yOJmE=;
        b=m5NDTH7yFiiqR3Oq5QQg1ylYOB1UrqAq8SROdekySSe50YzKFWbC5f/iWxXyVcqTZe
         4IuLpnLl1QhfxRNCwoCLSzU30rgV1ANuj+H8j5nU6t9cUwhHe2FIXK5ayUOB7XfzYp+u
         Y3L30KijWjh1j7rw4DcUHfNw5Jmvu68lYsELIDTpY17Rrq8Y06lyiGbKHowHQm4DYSg9
         uh9M0lX/1kl9RiU8a907UZ8mrTk9Zdq8+OSLWVrFySvECjTS0z+di16H7VlIjm+dB5xJ
         GZEDd6DnuwK4xVDS5MJCRnh0xA9RYJuSx45nt8u8SDTY+H+HiDTQlrm96lIlmzHkXCLQ
         QQew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJtER9Fz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21si35504048edc.591.2021.10.19.09.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Oct 2021 09:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJtER9Fz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcrbN-0000sk-OA
	for alex.bennee@linaro.org; Tue, 19 Oct 2021 12:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mcrDO-000399-40
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:39:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mcrDM-0003VW-Gq
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:39:45 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso3412436wmc.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bd3mCko/wmehSzzxAHDW8/kvbf1bZQus34gyS3yOJmE=;
 b=vJtER9Fzc/bODWlf2JRfL+frERF9CTxj2hVN0W6f5Ip+qU88pE62rrh9pMks4qBL8B
 +JW0BuhiUUZL6J0d9+gT/PP+uZ97MBi8ZUquVonigz/bnJvJkPHw4k3X42/xnHePJsLd
 25k5wtZ7J9wYv44dtWWv6I5O684HzoPtx/ODZuRnsL95YmyTR0aCB8iBNqZM+ShEVgYe
 lJPJAseeCXwml9dTVEfdcSyerwwD7x3dWBGKUjzP2DAlEzRVGuFlOTquLJM3sVU01yma
 c61YBlJDNOB71lm75Nv099gKp+dCEZuEbXsZd7nmNQIPiCmmORCcqf3zAikWgQsxuVcK
 F3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bd3mCko/wmehSzzxAHDW8/kvbf1bZQus34gyS3yOJmE=;
 b=tsLueSpzCGa707JaOTgtXCe0SttGz5Fl7EfHo8qog0+4ZnzDmLB3f9WMM6tvciUDHy
 Km+aOfBvbPaUyYvuAhQ+IqHzYojEU3mIIy8mOajeInZJHe7zeN1VjsRx9M/AMBqMV91P
 DncwZJsOY7PWkyY9/IxUDgC4NnX0oXBfwsyIPVDb8GkGeU9s435Bq82682urIQu/eGSH
 WtBTY+4tjgnDgpndsdGRt5dd58O04h/+JwmcS/dZY02fcWOGi2OBr5OH1GCHqhJbveUk
 5VmlL6x70qLg1d8fhcLKOnojIQM+WmQOuDYL3pNsGX11MATnbmrsvse1pYePHVvWaJmy
 +rvg==
X-Gm-Message-State: AOAM533Scnf6uhQUq0UiLg1tCesH5I3/sFyiotpbHMgzSwVmZpAzES0y
 NSrDkwpAs64hE2nlImj1thCpuA==
X-Received: by 2002:adf:a2d2:: with SMTP id t18mr29071958wra.115.1634657982243; 
 Tue, 19 Oct 2021 08:39:42 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x21sm2475986wmc.14.2021.10.19.08.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:39:41 -0700 (PDT)
Date: Tue, 19 Oct 2021 16:39:20 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <YW7mqILh/tYNH56L@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
 <YWBhEQxM4wRyZWzs@myrica>
 <20211018112402-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018112402-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VN4hNYlbgKa6

On Mon, Oct 18, 2021 at 11:25:05AM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 08, 2021 at 04:17:37PM +0100, Jean-Philippe Brucker wrote:
> > On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> > > Looks like this can not be applied yet because the bypass bit
> > > isn't in yet. what's up with that?
> > 
> > The boot-bypass bit isn't a hard dependency for this series, but it will
> > be needed for full support eventually. It will be delayed by spec and
> > Linux header changes
> > 
> > In the meantime we can work around the problem by having the boot disks
> > bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).
> > 
> > Thanks,
> > Jean
> 
> OK... how do we want to apply all this?
> If my tree I either need ack from an ARM maintainers, or
> post a partial patchset with just x86 bits.

Either works for me, with preference for keeping a single series
(otherwise I need to split patch 8, or add the tests later). I'll send v5
whole.

Thanks,
Jean
