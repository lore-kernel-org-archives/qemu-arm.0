Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2036049wrp;
        Thu, 19 Sep 2019 23:37:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJMF5Om/sRjsw/8IoVBZyFHqapY5oiNoGNAOTT8fLjtULuwvKSd6miKBcf4u16QQeDrOY7
X-Received: by 2002:a50:ac03:: with SMTP id v3mr20402017edc.113.1568961470938;
        Thu, 19 Sep 2019 23:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568961470; cv=none;
        d=google.com; s=arc-20160816;
        b=pKWYAozr18XPwNcz+Qs5yZ/pRavHBRWLQ2Ptc71iW48Xq/CUu3i+keEihofbL8SLYQ
         BN+NDjmpHgVB5JjQbLY0JV2DAsCF6eT9soBbKcStz/eLwQ1uCA9m9lUIpo6HuEW+RYM5
         tSP6D4R402q4RYuhs4j+LwN19D5lq6AYgCzHvMNyW3BhxuIRh4+OEDBWPp9tbArvrbNk
         bt9iyRi9lP6i66ligySoI6nf3q3ZMvBdD6+tDUh8UlT57rW0eABWfM+wCNL6O2SATrKb
         MtmvmEwYkClCNbYcTXizhbV58PM3YDSbuuWsBa6UgfRNYc7XHoyORj3Ri3hmEBgRc8h+
         c8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=63eRVRiPaHYQAoA4Qw85V6AzIpWXz87aoXIxFk5UGjM=;
        b=0DlYXqzZaFy2aXoa+ogQB2B+nl31UTDGGfBiC8jblhy4AlSbzfMigzkbHuRwPR59Vn
         mSGXa6B7F0QoBsngz1ZW2edto1TcqVOvfeDRxVxfSs8xvatxb+SmljD8HR4Fs8RHSCdG
         P7DgU6WjwCVkAQcuvG4i5Lp2kgJv6ZGPqFygualnXjF3pjtr106nKF4R4fz4qNjqebbt
         dcZAPHhL292KOmyBLC3ctLfKThYXj9HzBcmhottyOtfB8AYe8qPq6TGoj/CwSU35lEQT
         L8AdGfPnRpUcn/pTpWJnclEr68M+CLLA/TxT+cSLS/zPXtw5zneAZ8dLt3nkEWjgt/QT
         pmbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si833867edi.22.2019.09.19.23.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 23:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBCYA-0005O6-00
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 02:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iBCUA-0000dO-Cp
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 02:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iBCDg-0002Cf-RQ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 02:16:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47644)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iBCDg-0002Bx-K5
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 02:16:40 -0400
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61C4E4E919
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 06:16:39 +0000 (UTC)
Received: by mail-pf1-f198.google.com with SMTP id f2so3956164pfk.13
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 23:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=63eRVRiPaHYQAoA4Qw85V6AzIpWXz87aoXIxFk5UGjM=;
 b=ZQlifqMJvlXqJp2DOLFRbqrfZgGE7yxqN3eYdodMoSd0/jBqvTvirFS1ybX64DpZdx
 tbKv+411vfYj9wMmWNEj09wzOJbH3q5+brTEcChpc7oITZHq6D0YNsmlPe0zUvvOXvoL
 ytXgaSzFbgfHXYYy5alwVTFnWRf12UWFEG+ltiW+dRq9SqqGxAPyf+bRP/rFMXQkrSv7
 LrS9VgcHkBLbpmxpX9Kb/Uq1XO7spf2pOF7o79fY5QWNaz4JlKHfASNXn5xpXJ9rR3id
 EL7g7g2za0nfrZkgAOVpNFcw02+3777akjwOs469vDl+e8eS6Y5FLQe6XxiVMG+q0PNE
 VVOg==
X-Gm-Message-State: APjAAAVx9PlGu/VaBc/WFkG/yRsAunLxaPqgCf80xtWeGQqIsanKCiCO
 q3tBGE6Bxl16cUsFHxNq/MCLRUVbUoWjoDo3S6nOL+0VgI6qPg1sfHm/ujnQIjzmvTl3pCqKHm+
 egeR2PnGLhnJ7tHk=
X-Received: by 2002:a17:90a:28c5:: with SMTP id
 f63mr2693192pjd.67.1568960198693; 
 Thu, 19 Sep 2019 23:16:38 -0700 (PDT)
X-Received: by 2002:a17:90a:28c5:: with SMTP id
 f63mr2693166pjd.67.1568960198416; 
 Thu, 19 Sep 2019 23:16:38 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v8sm1517528pje.6.2019.09.19.23.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 23:16:37 -0700 (PDT)
Date: Fri, 20 Sep 2019 14:16:28 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/5] Allow memory_region_register_iommu_notifier() to
 fail
Message-ID: <20190920061628.GD12858@xz-x1>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PbcbnZFvtS+a

On Thu, Sep 19, 2019 at 02:18:40PM +0200, Eric Auger wrote:
> This series allows the memory_region_register_iommu_notifier()
> to fail. As of now, when a MAP notifier is attempted to be
> registered along with SMMUv3, Intel iommu without caching mode
> or AMD IOMMU, we exit in the IOMMU MR notify_flag_changed()
> callback. In case of VFIO assigned device hotplug, this could be
> handled more nicely directly within the VFIO code, simply rejecting
> the hotplug without exiting. This is what the series achieves
> by handling the memory_region_register_iommu_notifier() returned
> value.

Could I ask what's the code path for ARM when the hot plug failed?  Is
that vfio_realize() then vfio_connect_container() will fail with this?

    if (container->error) {
        ret = container->error;
        error_setg_errno(errp, -ret,
                         "memory listener initialization failed for container");
        goto listener_release_exit;
    }

If so, I would again suggest you to use Error** in patch 1.  IMHO we
can let vfio_listener_region_add() to be the first one to use the
Error** so that instead of this:

    /*
     * On the initfn path, store the first error in the container so we
     * can gracefully fail.  Runtime, there's not much we can do other
     * than throw a hardware error.
     */
    if (!container->initialized) {
        if (!container->error) {
            container->error = ret;
        }
    } else {
        hw_error("vfio: DMA mapping failed, unable to continue");
    }

We can also cache the Error** into container and return to user if the
user is using QMP which should be better than the int number (or
again, maybe return both errors?).  IIUC error_report() will not work
for QMP.

Regards,

-- 
Peter Xu
