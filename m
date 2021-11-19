Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2700743lfk;
        Fri, 19 Nov 2021 10:33:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu7W1qdNxnOS/dGpjRAStEPpOITdcYLjdt0WETUsHPcPh6331UuFZXtvXVi7gnllK6vpgD
X-Received: by 2002:a05:6a00:1242:b0:44c:2025:29e3 with SMTP id u2-20020a056a00124200b0044c202529e3mr25505853pfi.59.1637346785326;
        Fri, 19 Nov 2021 10:33:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637346785; cv=none;
        d=google.com; s=arc-20160816;
        b=T92l0TeRoMibQxo3S8PbXmdGHfch0SIOQcOdjbd6kvACU4ESwNQ7octdGvswMHtjhk
         9Eze5sISl2g2KCR++aQ3IhAoc4PXjA06vrrUE0B0jZodXU1zqet1jPgMss+pYnNjqldI
         XQlW80X9G7SPXxOlkXD2GBiheip9+whPOkSuHVSfNmPiDS3YUJ/WCCpE+rmeebXeGGcL
         8ZDFmxydwmLrx7dmRatlp+F5dnguBLUujENxgGsQq1PLIJFNzrYQ1bZm7+/lLpzUI/OR
         WFoXIjzsfJQOprhgR8zuU5xOx4tzfPTek39HxA0A6L9DcDCEaYVJjp4gnwWrTNkO4KeZ
         i5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=B+GQMwG10mbwdIIWMwu0ilfUEUoBg0jOybBvIrXEDjQ=;
        b=bByJZGDtixSJ6i7VVAdDge9xsIBIC9qjNEzk6zSkEjdTkN1VhnhFPM55S8UatgiytY
         p1M+VpsI8a4pGp3FLrsxls3qNjTpKD7ISK7CzTIdQ88RufPel/0rQaJsdRQOoREedQi6
         UfBNqUicTNvCz0Ka0frY5dd7jDtL6Um7jqa/Z+jOl1FbOAZZ4gForiBpP9/U0bNaon0J
         v6cwWYLgJPxa3JbJf2iHwo11dpWVioZyYkIVKGWk/juuiwea/h0Dzn6PD7wtNg4kirau
         XQSNu7dWzNUUUHlI228edDRVwQhnYD/VaGoXcx6RkySXnz0S1Of42vfICsP+tuYPPIw2
         xqMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hANP8MGu;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id j193si920889pge.401.2021.11.19.10.33.05;
        Fri, 19 Nov 2021 10:33:05 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hANP8MGu;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbhKSSgG (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 19 Nov 2021 13:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54247 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231841AbhKSSgF (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 19 Nov 2021 13:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637346783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B+GQMwG10mbwdIIWMwu0ilfUEUoBg0jOybBvIrXEDjQ=;
        b=hANP8MGuaLOviZukTTmSdxdSRT9HNjIRf84lXZRDqKWSYJd73n6Qc5hqqxGvl5Mc6YtRJE
        O6Vc7IatXO9xxfMafYdE8dtSWDrJPVRLFFDpC3Dzyf0+FEu4uLlyhsxJt/zNlBdLALBfxs
        M70n7y1g7cbMtxBwUxg7no3wnijvfuQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-IoM9-hPuNpWTUoaqJeAgEA-1; Fri, 19 Nov 2021 13:33:02 -0500
X-MC-Unique: IoM9-hPuNpWTUoaqJeAgEA-1
Received: by mail-ed1-f69.google.com with SMTP id v10-20020aa7d9ca000000b003e7bed57968so9141889eds.23
        for <kvm@vger.kernel.org>; Fri, 19 Nov 2021 10:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=B+GQMwG10mbwdIIWMwu0ilfUEUoBg0jOybBvIrXEDjQ=;
        b=vTgWIXfsy2X9oMZoWEQiAp7EHozLzFCVx3LXaDagu47Eir/l0HsfELUiv+9m+LLSWP
         jfJQjxX/frnz0KvSIuLBtC6ZIazydf1MLuCprwJkTkRwrsU5umVIeEIlri5pNWjb6ssw
         x7ODlaqWSWLP51ACx38tO8bf91SRofGOoYMW5CMwKiZuhECgsOid0r7i0iFc1EZLhHhr
         TC/VoRGK5Qxy/qg15ed6XM3zoA9k0YsGdjHD55MvsDUmljBEe9T0OzNWhSIjuQ17uy98
         iaDqo0gWB8xY1lKWeDJWGz1Sq89O5XozWMxFMARje+X4EKH/NpvfLwzCZnjiOha/5vkd
         t8gw==
X-Gm-Message-State: AOAM531lPb0L+idT2+iKSqpctNkpys1rkZHJWh6lyi4RmYytq6RJ2zR+
        SYvtYCIHrIF7rKGPJZXdxpeid/CF4ESdYClLyQyl8cr8mQNMaCxTfaME8e/B+GpFsuZ6V4NUzId
        s673ESALwRu13
X-Received: by 2002:a05:6402:4d5:: with SMTP id n21mr27235421edw.303.1637346780087;
        Fri, 19 Nov 2021 10:33:00 -0800 (PST)
X-Received: by 2002:a05:6402:4d5:: with SMTP id n21mr27235398edw.303.1637346779971;
        Fri, 19 Nov 2021 10:32:59 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id sa3sm251805ejc.113.2021.11.19.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 10:32:59 -0800 (PST)
Date:   Fri, 19 Nov 2021 19:32:57 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc:     kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
        kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v4 0/3] GIC ITS tests
Message-ID: <20211119183257.unj256xrobwbjvae@gator.home>
References: <20211119163710.974653-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211119163710.974653-1-alex.bennee@linaro.org>
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Vz96lwB48Rtp

Hi Alex,

Please CC me on the full series. I'm not always able to keep up
on the lists. I see there's another series too that you've
posted. I'll look next week.

Thanks,
drew

On Fri, Nov 19, 2021 at 04:37:07PM +0000, Alex Bennée wrote:
> Hi,
> 
> changes since v3:
> 
>   - dropped the pending LPI test altogether
> 
> Alex Bennée (3):
>   arm64: remove invalid check from its-trigger test
>   arm64: enable its-migration tests for TCG
>   arch-run: do not process ERRATA when running under TCG
> 
>  scripts/arch-run.bash |  4 +++-
>  arm/gic.c             | 28 ++++++++--------------------
>  arm/unittests.cfg     |  3 ---
>  3 files changed, 11 insertions(+), 24 deletions(-)
> 
> -- 
> 2.30.2
> 
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
