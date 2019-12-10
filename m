Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6061094lff;
        Tue, 10 Dec 2019 08:43:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXIP8Bwq284WW+gnKBKoJo/WtCEmGs7/rI1MBp+bjTNrpQw4mFcTvJse056u4VLVz0qX87
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr32481103qkg.27.1575996225811;
        Tue, 10 Dec 2019 08:43:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996225; cv=none;
        d=google.com; s=arc-20160816;
        b=Imz/8ka3RT+CNLkO63njbHssLeb/cIGcl9UVxWDp1rMrZ8t+uc7gYqt9DY0+0sTMsF
         W7hB8zhHvMveBbkpGVt4b0CS8xbIU5l0zf5SYtF6vwhrpl5vTyMeNzC4VuPHUnqCAXVl
         CraAdt96rM7N/50lQ8UL1MYzyCTbWaXHcGdop6W8Uo00F0oF1oaV7pfOVSttX4Wd8TRu
         ZzsVTvPr8cLC6FmFwqdumPoIy+3eU+htBUFV9PuVwi6/fZ4iqd2kEUqlBYwSaDpKaouB
         fdTDW7ACLL4Bw4QVQiELraGtfrcoF0czXRtlHIhw8hx+LMfvEcBQe0xKFjd9j6/eX+V5
         DUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WtaxfLDwEq+CPxRUbY/7JAvtoC2bGMlKZ7QdRWbKMnU=;
        b=lyK5kkQKiWiu76NdAqXQp7oOTTV0m/JWmAcu5h3FWvvRsAqSnENvOa9kPe5+nY2Up6
         GLiPYsz4RP6wwpJhLDE9FFEhLyPl59zUeeAJk8Chf6pWV/MM2KxWRQO+6bJbl1iSkmpK
         L/rDAwS3Ha2Oq4do/vBEOfzkC6XRKOKymgC66JYgh/w+tIDP0K9Kkm8xZEa2mfz/XoqP
         Vh++hEIt5OS1xvotKMVPjXk+rugV9oPnMYQBl+O/u8U6CeFRJwWovaRW3WuTPevwRD+h
         WCkViVOvb1z3VONQz6PGAuH4RFf/7amPqhy5nu+jGkDT03+uTgUSUvVlmJKnbZVP/ECh
         STFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aonj25m5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si2148504qkd.325.2019.12.10.08.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:43:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Aonj25m5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieibx-0002Fq-6p
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieibo-0002E2-C7
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:43:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieibn-00042R-3g
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:43:36 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37623)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieibm-000429-UH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:43:35 -0500
Received: by mail-wr1-x442.google.com with SMTP id w15so20958125wru.4
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WtaxfLDwEq+CPxRUbY/7JAvtoC2bGMlKZ7QdRWbKMnU=;
 b=Aonj25m5O3NG/3YcvFJ7MZMjqL8o4JwlSte53sfRkiPZx+v23ru9AtaLADs4js3iGV
 4MX7HKiQdzzpyYebZIgbHCkIvBrbNiObRbVj6g4cpmsqKvcJCFozuI+bTaMM+M4ZnrfH
 josRRWe4AelRKAVFN5Clv420QFrxzvr5TiXC/Ab8FR/Pnx0URxdbC0cAKMKSnXmSWmcN
 zrrDeMQuXCsJpGxf0P9buODS3QUfo+E7YRMIaLzUNrTBs626ZMqcU8fmzfN+qO52JRHw
 7htGYPYi+5gv3Tuw9edHiSG5EjX9lvBn+dhg6ZtHzZmB/TnA5P5g4cTFnH5R/lMyvjYY
 W7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WtaxfLDwEq+CPxRUbY/7JAvtoC2bGMlKZ7QdRWbKMnU=;
 b=fH2z+UgEEpfLteY1cjhh7Xsg3kMCyQhDf0m/11vdaLJkday2VB50oOcqldylZJ7rRs
 aCVzMYhRvIbJv1+YH1ZVTPMifibq7UbEmgW5KN6EfPBswW3gFx2avW+4TdefsBn7LHbu
 kSAFjVGo33GFJv8kCowwq+wT4r8ISecfuwc402ch8atROUEUJyqG1PUp9+i5S2cmH0kb
 yjj/tah4pGGtzozzhLOLoc/LtxeWDDyakKlMv7Oru5frl+Z477sfLGGqmYcrdN0m2Apf
 v0aSaGb9bsYszphFdF1+DoobcLewBDZ0fwZlV5GCO/jZm9zeLZgk251QC9ZqyiJSYTUL
 r2jw==
X-Gm-Message-State: APjAAAWhNwbQ332fhHQfNLeYb3C7KjExMtArBqz1wU8m3EGX6A7igh3E
 95bQVx3e8HqkCTMDg4TBUOGIbA==
X-Received: by 2002:a5d:6ac5:: with SMTP id u5mr4284808wrw.271.1575996213730; 
 Tue, 10 Dec 2019 08:43:33 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id n14sm3689719wmi.26.2019.12.10.08.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:43:33 -0800 (PST)
Date: Tue, 10 Dec 2019 17:43:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 07/20] virtio-iommu: Implement map/unmap
Message-ID: <20191210164328.GF277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-8-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-8-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-TUID: 5KP8bJoUWPhw

On Fri, Nov 22, 2019 at 07:29:30PM +0100, Eric Auger wrote:
> @@ -238,10 +244,35 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>      uint64_t virt_start = le64_to_cpu(req->virt_start);
>      uint64_t virt_end = le64_to_cpu(req->virt_end);
>      uint32_t flags = le32_to_cpu(req->flags);
> +    viommu_domain *domain;
> +    viommu_interval *interval;
> +    viommu_mapping *mapping;

Additional checks would be good. Most importantly we need to return
S_INVAL if we don't recognize a bit in flags (a MUST in the spec). It
might be good to check that addresses are aligned on the page granule as
well, and return S_RANGE if they aren't (a SHOULD in the spec), but I
don't care as much.

> +
> +    interval = g_malloc0(sizeof(*interval));
> +
> +    interval->low = virt_start;
> +    interval->high = virt_end;
> +
> +    domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
> +    if (!domain) {
> +        return VIRTIO_IOMMU_S_NOENT;

Leaks interval, I guess you could allocate it after this block.

Thanks,
Jean

> +    }
> +
> +    mapping = g_tree_lookup(domain->mappings, (gpointer)interval);
> +    if (mapping) {
> +        g_free(interval);
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
>  
>      trace_virtio_iommu_map(domain_id, virt_start, virt_end, phys_start, flags);
>  
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    mapping = g_malloc0(sizeof(*mapping));
> +    mapping->phys_addr = phys_start;
> +    mapping->flags = flags;
> +
> +    g_tree_insert(domain->mappings, interval, mapping);
> +
> +    return VIRTIO_IOMMU_S_OK;
