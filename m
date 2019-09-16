Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3519753wrp;
        Sun, 15 Sep 2019 20:23:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYR91QHdgwaOx/e9L4MOwzbtmoTXh50769QxwhXGLF6qSevD9EDY7Da/nqn7oG8HwOv+eT
X-Received: by 2002:a17:906:3087:: with SMTP id 7mr17605895ejv.212.1568604230381;
        Sun, 15 Sep 2019 20:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568604230; cv=none;
        d=google.com; s=arc-20160816;
        b=eljxRmX6xgBNWcAIbX9owDcDkyRA9p/BH8Glgpq1g3XhI/MfU35VpURnwa43PvEI6u
         UoKAO0gE3VsZffhhQSttI26BYgU0D5pSZja7cKI8Q8ggc/+xxZtzl1/YJ3FGpXRO82/3
         Sx8cMAa/ObWimZxRBWcHWzLlxtc+vmtCdlLEac+LA5Ra/4mXHTViTu4PXLEtIHPO2TjG
         25WT0+uzyGQvuKdVRTgfRni2OfH19kCteFDofP+6teV3KkMJM67ITMPZGf06PBloxoGb
         GKSB2O3DcTR09+Q5HaU46l84T4eCRS/GwT0iWV4do8DqhprjlmeaP0WNGHTa3/1npANN
         fFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=2XDUy8E1GJifRRBWG0PiBc3aS6Rj85Jdad7JsonkhwQ=;
        b=KRMMOjRNMhMVyrj5Tn/2vkBeBe7YdXTKjtsvBIDPEdP0mJ+sC+eZSnyg/rVqLOm8DH
         B2nm3coXGHlfO0EOMGxHB+8Xs2vrUvcbVSjlrhAn2l+/Gf/n5h+mimlGP7gHA2Lry3nd
         7lA5UXXStwZRzE1RKQASXBTpn+BzEFnCH144n19XQpvvwVlXbT8mtn40Y7JAzonm6YJA
         QrT8Z+Zzc8hN1OBucuVO1K/Gc7uHucEN+gMASclPnnYzRfFTzgnvhIAE09qehkWIgPnk
         OhaFuN8kyj4ZP5zjZaaSGzR2eC9ANtJjrEuGpUbDgRF7QzeCSUy2bWOqxCGueRPUs7aW
         ujMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si13208236ejd.212.2019.09.15.20.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Sep 2019 20:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9hcD-0003lw-Ei
	for alex.bennee@linaro.org; Sun, 15 Sep 2019 23:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1i9hc5-0003lD-TF
 for qemu-arm@nongnu.org; Sun, 15 Sep 2019 23:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1i9hc3-0007D0-QO
 for qemu-arm@nongnu.org; Sun, 15 Sep 2019 23:23:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32802)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1i9hc3-0007CR-LN
 for qemu-arm@nongnu.org; Sun, 15 Sep 2019 23:23:39 -0400
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E0C58535D
 for <qemu-arm@nongnu.org>; Mon, 16 Sep 2019 03:23:38 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id p35so9493907pgl.9
 for <qemu-arm@nongnu.org>; Sun, 15 Sep 2019 20:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2XDUy8E1GJifRRBWG0PiBc3aS6Rj85Jdad7JsonkhwQ=;
 b=kAr92TGDJyMRiS34/xFiYGioyJcIN3KaHJQ49QD/NhK0l4tmyt0jSCe8EL1p25futB
 hGVr44RnhduVnymgeafeMR2OiF1v6rD+X8Zo+uxNPjnmKPWnVL8Lje93Skr1dyUX1m0Y
 SKoZSOV0CXm6U8iLdMOfOIBFBXcsKoKAFhf2j39EC4fPPCc6T/sWsRkQuLjO8xwyh4DC
 0ZDSGwQk1x0CjX2qBmfoQvox5xdlPMzoHeA52bt7lpAcjzZ9y6uUds39AszNN0V45EAV
 MZDS6KXj9A3SarfWmit3z+BCCc5geb/1a07y8Dcz7gFwkPmDGlXUp25JwE1NbYPM2L7c
 +32A==
X-Gm-Message-State: APjAAAUVhrEROYV3zCvEQM5hkkWyf0ktFAelpslTznc3HY+MqTP1gtYV
 odD4UoA7pE6PCLG217TZjIMYCnVE400Y3yvLFuxrlurz9w4Yr/YYnlDkrERcBbdKWWmQHTQu6Vy
 AsjtO2rIC2nMX
X-Received: by 2002:a65:47c1:: with SMTP id f1mr52945666pgs.169.1568604217767; 
 Sun, 15 Sep 2019 20:23:37 -0700 (PDT)
X-Received: by 2002:a65:47c1:: with SMTP id f1mr52945648pgs.169.1568604217469; 
 Sun, 15 Sep 2019 20:23:37 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r186sm32283212pfr.40.2019.09.15.20.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 20:23:36 -0700 (PDT)
Date: Mon, 16 Sep 2019 11:23:27 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190916032326.GC14232@xz-x1>
References: <20190913083615.14719-1-eric.auger@redhat.com>
 <20190913083615.14719-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190913083615.14719-2-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v1 1/6] memory: allow
 memory_region_register_iommu_notifier() to fail
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+1k4zyp1Pi1

On Fri, Sep 13, 2019 at 10:36:10AM +0200, Eric Auger wrote:
> Currently, when a notifier is attempted to be registered and its
> flags are not supported (especially the MAP one) by the IOMMU MR,
> we generally abruptly exit in the IOMMU code. The failure could be
> handled more nicely in the caller and especially in the VFIO code.
> 
> So let's allow memory_region_register_iommu_notifier() to fail as
> well as notify_flag_changed() callback.
> 
> All sites implementing the callback are updated. This patch does
> not yet remove the exit(1) in the intel_iommu and amd_iommu code.

The idea looks sane to me, though how about using "Error **" instead
of returning int (or, both)?  Just like the majority of rest of QEMU.

Regards,

-- 
Peter Xu
