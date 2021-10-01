Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp2990523qvp;
        Fri, 1 Oct 2021 08:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7DERhWpMqMzP2XgonM3c66/6MOPIM46s2qw1L2cgccadCOoltkDU9sWLi5aEpSgHvEJn3
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr13411157qtp.2.1633102356420;
        Fri, 01 Oct 2021 08:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633102356; cv=none;
        d=google.com; s=arc-20160816;
        b=qe5DZRUqkoW8LH7MH9Vfh3KU1+NzIvB4bZqmfH2lXRVarR907MEk03x8/Yjjb1Yixk
         wYOiNqJj0MC3oO1880BjYiwGt+o3CdQu9O8krR5dqS9rZFUm4I0HTGgHWSdUquzQuwmH
         CSlBf9ayatjelSTcaqfZ10XzG63JTn80Pquu1QdWbQ+klxvkh0f8yRsnH/5R4nxY0OTj
         DkeYSdESUPiGjAJ7eNHLycNBAqRvsR0UWMdBid5zAbAVggjgJcoHkKBsXC7PjEnwHBzI
         cEMstrc8JmnrzpegGK9DWrg6aWrm5fRychRVgoS6TiD9iH6dopacil/oeki6hFZlWjFl
         0AQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=3L5gb9aE7S+CfMi+IpBC0FIGTs1KVQSPrK1gpdia9ao=;
        b=d1R5fO/OdEUYy2gCQHbSxMkX+Ty49z30yAPKjej0DQE0HnWYGrYSFPwlzjHQLmt1sj
         WePa4pTsRspEA89D3Wh/XUYdf1/b3MwhIt8Cp5fS9YuNqkCnBFwWFKoaXTIvmJjB2V7v
         IKCvAeGvHtrviuiQNiUtlnyW0DGWyXf07ghnPetIXA/jRIAmH8iy2otiOeuoh5RuO9tD
         0Vd5A1XIm9tdxJNKiiAHA0KWgEL/JB4ZocJgBAn4LgUDuW/CEKWy9UABgjO4tw/ikSaq
         bPNZxdKWnbpUKClMZIqypJ0MKCNKtL/AL9BL+egwwmZECaM8Hqjt/pcuYmyGFySViDqM
         BYUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cr1USAiU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si863768vse.167.2021.10.01.08.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 08:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cr1USAiU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWKWZ-0004pg-Sa
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 11:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKVR-0003yP-En
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:31:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWKVP-0005bd-Ku
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:31:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id a18so4019018wru.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3L5gb9aE7S+CfMi+IpBC0FIGTs1KVQSPrK1gpdia9ao=;
 b=cr1USAiULL3OiO65R1Fdd/+qqCLjmI/ZSHCq5jDpKtuyPDxXIVD3c7PeVWhnQU3pdD
 J8jz2xHLvtHzFO2FUAvDjVKgnawV9ew1N76O9FzO9d8u2HehP5Nci54enVC7TBuNqbGv
 xK/QAZMXGxSGNeJYSHwEnIBRu2MgMc9Ju2kQ4wlaiKHmVM2KTycTALcqYPds68Cf2HNO
 uMG5WiX7o154GBMvtWHWmvB+NWmOcACvXk6YgJEgekjLZbYCiZEbE8UUQJSdCKLLaS/H
 lseuk7o3RjKe3VPrk0oh+uZDyNqInW47SUahG2qaLGbFSYVoC0pLJ3HV01Tjd0AiSpno
 eshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3L5gb9aE7S+CfMi+IpBC0FIGTs1KVQSPrK1gpdia9ao=;
 b=LmCWv8JwwFqb9bLP3AQua7kS8d5XbxYZV1mIFez2qlWW44dc3jzgQOVSJjMVFKIw4W
 D+tKaGRyO+v7Pju7dlT0kNEXYOh+yvPxL27xoRZVIDbqwRhBgUN+OeFsig/qVYoFKsBo
 RhZpFn2wcECjE9WCGlITKkMkib0LJkQ8dATSVJGJzvjYJDMt10RwUhrC4uKjEXzKoGQV
 o8iXunR0TrA7FgunCnxdW+wNpNTE+KM4DJutlnAIYcktGrecD3C3fzCOnYgMrl8Sfgda
 R22YocFklq1wdvU1CK/ktgdi5fZQNUHWEpxfOe7YocCPUhxnkyP+rmCgVoVswT+a7gIS
 R9yQ==
X-Gm-Message-State: AOAM530Vb2uW7I9q9j9WasSp6ODE//k4/yhwown6j4JfxZUoaAntwcpP
 a5gVxeONuMSExp/tPC2ICmMyKQ==
X-Received: by 2002:adf:f486:: with SMTP id l6mr12600282wro.375.1633102280980; 
 Fri, 01 Oct 2021 08:31:20 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k17sm8236397wmj.0.2021.10.01.08.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:31:20 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:30:58 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 01/10] hw/acpi: Add VIOT table
Message-ID: <YVcpsgmtNIhY22qJ@myrica>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-2-jean-philippe@linaro.org>
 <20210920100609.301b6be2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920100609.301b6be2@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
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
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 382sA5BZ23gw

On Mon, Sep 20, 2021 at 10:06:09AM +0200, Igor Mammedov wrote:
> > +/*
> > + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> > + * endpoints.
> 
> We usually put a pointer to spec/revision and chapter in it
> that describes being implemented table, so reviewer would
> have a reference to compare code with. Otherwise I have no
> idea if implementation is correct or not.

The 6.5 ACPI specification isn't out yet unfortunately, so I can't put any
reference at the moment. I don't know when it will be published. The draft
specification is here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
But that's only temporary. I can make a note to add the pointers once the
spec is out.

The acpica implementation could also be used for cross-reference:
https://github.com/acpica/acpica/commit/fc4e33319c1ee08f20f5c44853dd8426643f6dfd

Thanks,
Jean

> 
> ex: build_hmat_mpda
> 
> the same applies to viot_host_bridges
> 
