Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6064040lff;
        Tue, 10 Dec 2019 08:46:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwx7ADNxhl8bddM38b+GU0NOaXlzc6y15ur619vQ/bBqIOidcscDdcSqj7LsflmZhjvGK3D
X-Received: by 2002:a05:6214:11a8:: with SMTP id u8mr21901506qvv.16.1575996365412;
        Tue, 10 Dec 2019 08:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996365; cv=none;
        d=google.com; s=arc-20160816;
        b=LdjR6nVLVP25mFJh1uyfxLwte4dnccvFgRG5cDBlp/bMlBFi2Yy/gOWcQIIJ5HV7DF
         kdnZ6cZnv0t5y5Ey5RsOf0iQL4BDlXbWK9GgUpeFGmm2W2e5UgBfVbm8lY1MiZ6CH8Ge
         7y+XwT6jy3J4pg6O1qJGd65AMyt9qBMHdpjFVcgBbit3MGzk00sBDznKYa4LneaeJD/E
         VR9vFQOgjct+egAYwujl69KRXjjUM/lFmZY8jG3ORa+kiwe+NNtaGL7UM60o2UBIG6ZH
         YsNOPL8WVB5sse5+6kjg2ENhacyHZ3XvpbZDzdwI+2BVdf/u2fA7ongAhc/rpYGUjC6b
         DStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OlDxnhAEHtJOXMsOXwxoIBoY1rDQfYKSPVN/Ah8CeLg=;
        b=AijuSXAVPGW5DMJdFFtdnybyHG17Mx3hcZwOlCNIoWMYE0ZXMbhZXLV3kiJJ+R6b0N
         lBVnKLnK9bkMfMkpHNYnoF9X8XPmeLrdbrQvSJdHjQNiFnEmlEbWyas5p2qE2jYpeIjY
         wrkKWRks97DbBBKRLAtv3w96qkeXmhGTes1TdndSwEDnFMsbg8mybjPUJ3ebJEOAh7YX
         2N0a78Jps0HBbsvw/fJ9w7npzlFhaBH04/+N5IDOh6ZUeOUz39BI1Nv222nL9vuqluCn
         UIdTnsVTZnToMREoQk6/3JJoJ5gJP6Ca4VLe6Azh7Kj94hTDg9MMMoHQP99Dc83i5Hev
         6u/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RkPzgErk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v69si2100258qka.311.2019.12.10.08.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RkPzgErk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieieC-0003Zd-OS
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieicC-0002Wz-PS
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:44:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieicB-00049g-TF
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:44:00 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42588)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieicB-000493-21
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:43:59 -0500
Received: by mail-wr1-x442.google.com with SMTP id a15so20848733wrf.9
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OlDxnhAEHtJOXMsOXwxoIBoY1rDQfYKSPVN/Ah8CeLg=;
 b=RkPzgErkwNvg/N/hYOb/+LM+QfNVPmUrh3IP8BwGL0zrTPfNkmO2EO0kyyaLyChNaa
 h3YLcgaSanQYYTZ95dWV8+ARp4BU9NAtPuSf+qAxEiRCY3hcoxUF5mK83MKBvKk6wiYW
 XkNowoTadaAtMTwl/QA+kfd6AZ7AzG+bkhKXosFHLAG1gB125LZULfLJnC3CAe1VPJ7U
 CBWNvOcLj+RW2G0OO81aM4oyUynYOtuxudtyF3gzzliBK46nn1nyrjBVON3s5u0wSXHL
 KQZwUJ+599bcYCxpxOzh7PCPdTm9ETE0D/HxTuEII1Q5bX6aEy+qmiO15dggtf0JCsca
 N4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OlDxnhAEHtJOXMsOXwxoIBoY1rDQfYKSPVN/Ah8CeLg=;
 b=Fj6pIMnUhELGn5tfGp0xGv2AttnU4MU7Cf5icEH7NAkwljAs0JKDck0LYcyTBxwJXM
 ssiSBHwcyapjxjV0L3+cmJsL3YRPuVwvbctA68vAMOZOLGXPIAddC/urn8Sy/rqBXHIY
 ovcP5NvJtM5ZD7VRCMLBIT3DcL1eNpPvgD0cPvTTxGIBN/GnHwRonu2la6/7H7caZe6h
 LHRIaHKbw/8cCWbJQM3W2aU8W8Qn39gE0mGKam44um9I2E0mW35pemWvVZUHupYm42Bn
 68GA8p5oxBDHkhXmZvsdGPxnimlK6oWHZL6fzvudaZVKPvXHTVqDlBhUepfXvG8JIYTM
 fjDQ==
X-Gm-Message-State: APjAAAXdv7J9Cf+kAr7eBjDs/AilNbrArcygT7djs2qfFIATQlQ3dNkA
 jrk7gTa9ivhYaF4pIoEoODcwOg==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr4484684wrw.346.1575996237774; 
 Tue, 10 Dec 2019 08:43:57 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id y10sm3660456wmm.3.2019.12.10.08.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:43:57 -0800 (PST)
Date: Tue, 10 Dec 2019 17:43:52 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20191210164352.GG277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-9-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: otZpH0FRextr

On Fri, Nov 22, 2019 at 07:29:31PM +0100, Eric Auger wrote:
> This patch implements the translate callback
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
