Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2375291wrp;
        Mon, 23 Sep 2019 00:59:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeHqJCid39WrM9brfCErpAhpTjCjOe1aF+ZZ8vT/2x0DZ2tqxfGwjvxFPlT9OSeMRo3DEF
X-Received: by 2002:a17:906:ecf9:: with SMTP id qt25mr28612764ejb.249.1569225596783;
        Mon, 23 Sep 2019 00:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569225596; cv=none;
        d=google.com; s=arc-20160816;
        b=bBWRkiBo/rEvBWx+QJstygRhu4d2rUu64tbq7Rj6ixAc0up1E9kzNS5/GErVi4/DKR
         Ws+1/rvx2tkredFuAi9wnDF35/IGISkTHcLjJVYHnUZTyKMYQQHMhqXwh7V3oV718eaU
         I2FDnKB5QCag6GWPD2K5CL3QQvnUgnzq3rvxIjvTPydekq5xTNtT2mzB6VhrGafuK78p
         i20QFAQU1IHQJjlwULxu2RQiAGsomiZHg1iUp5Y5L4S8u5s15ESzsE1RM4e4JJhHnArc
         MnfIBcv35azXPd/lwlkWpMCnPL00I29iz0tOxpG73IYcOs2zlwUCo/tVvSI7GW/jQvXH
         ffXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=STs5zoSMg2ih7wnHezf5iWfAFg85hVUiEa5wtjeZ3/c=;
        b=NnXcPGqs/MbpEZQ//w9YS4OzgWHjUnT8lnBC3kVZaVdTEFRWPFd2yM+/mVVXYndJKn
         MieM7/3X7cCyyV/QwiNuMz0FCtfAz+Rk/CFOiH8DSaceq6UBfI6dNWC/hqxN+lHbvTaZ
         dFuyUzPpsIFzxHMlAjUMsOuTZ9AeEujZNu4PXgp03PMtJHemEIe0wDh4Pm2S3LfTgOjK
         NWzXf26tLzOWrzajfIRNKXu8L6sEd7MLn+MjqO4c5LZUIsIUapETyn+C3Ddw8x25veZm
         lxOeUs+s4n5PQLNVJGtiLR9vgJ7ZVIcDriS93XEJJstu8/SHLi8xbl2JPjwF377xtKHe
         379g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w55si6248996eda.15.2019.09.23.00.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 00:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCJGF-0007NV-OF
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 03:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iCJG4-0007NE-Rn
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 03:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iCJG3-0008QD-Sn
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 03:59:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43028)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iCJG3-0008PH-Nd
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 03:59:43 -0400
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1F8885538
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 07:59:42 +0000 (UTC)
Received: by mail-pf1-f198.google.com with SMTP id b13so413268pfp.6
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 00:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=STs5zoSMg2ih7wnHezf5iWfAFg85hVUiEa5wtjeZ3/c=;
 b=OX3hGrFXu+SXjLnrKZca/S1V5IV+m4kiQTsmO1s+1RyAbSj9OO99ABVCYlXUa2/6fH
 lJy07NK41F+U1KQPLKMFMNuwRcGS+JmlhMQK1bslTyBcP97WW2QUl2ahWrfCaHKSQVzJ
 GST5hbqRNf8oDnLrGvgQbDikYQR8z3dqhyFTkdpMRJeKpBVKMdGRo7brW9ptt/iclBUD
 R28iVtDh4UtFvIfgCmLUQIFW3+Q+CTh4BnU+qsgAJM6zy/Z8Z+wVOZHaPdb1QdZhpWN5
 8zo2WPfrd8aRyUS7I/PfrmkM8hSY4UPq+c6zdKAi08I2m0vQPToQzpf78UXLUQFEnnnO
 CbgA==
X-Gm-Message-State: APjAAAX4LFbshLjTU4SCCv4UeU221ljj4skg+PwLICDqi/+0nNzPRa8+
 HyD8vtQL0mXjYk4kOnoNzdm7w2eMYML4lPOSgNnij1IDBa8SKL3MD6iTf/Vs1c3zpOxasZJXrzj
 cHQJAqsqhlXzZ
X-Received: by 2002:a17:902:ba82:: with SMTP id
 k2mr29660411pls.293.1569225582238; 
 Mon, 23 Sep 2019 00:59:42 -0700 (PDT)
X-Received: by 2002:a17:902:ba82:: with SMTP id
 k2mr29660394pls.293.1569225582090; 
 Mon, 23 Sep 2019 00:59:42 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x68sm15170085pfd.183.2019.09.23.00.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 00:59:41 -0700 (PDT)
Date: Mon, 23 Sep 2019 15:59:30 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/2] memory: allow
 memory_region_register_iommu_notifier() to fail
Message-ID: <20190923075930.GB12806@xz-x1>
References: <20190923065552.10602-1-eric.auger@redhat.com>
 <20190923065552.10602-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923065552.10602-3-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, mst@redhat.com, aik@ozlabs.ru,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oVDQJx2nlf5O

On Mon, Sep 23, 2019 at 08:55:52AM +0200, Eric Auger wrote:
> Currently, when a notifier is attempted to be registered and its
> flags are not supported (especially the MAP one) by the IOMMU MR,
> we generally abruptly exit in the IOMMU code. The failure could be
> handled more nicely in the caller and especially in the VFIO code.
> 
> So let's allow memory_region_register_iommu_notifier() to fail as
> well as notify_flag_changed() callback.
> 
> All sites implementing the callback are updated. This patch does
> not yet remove the exit(1) in the amd_iommu code.
> 
> in SMMUv3 we turn the warning message into an error message saying
> that the assigned device would not work properly.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
