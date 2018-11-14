Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5896509wrw;
        Wed, 14 Nov 2018 08:02:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5dCY1/wG8Xmlkv4+mnkQ36Q0mTkmCgqVZP3EsOgo8LU6DIyqKPGFMJb/1O1qpc7tKhBSaf3
X-Received: by 2002:aed:24c2:: with SMTP id u2mr2272425qtc.230.1542211328367;
        Wed, 14 Nov 2018 08:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542211328; cv=none;
        d=google.com; s=arc-20160816;
        b=yC99qm/g+EVTXeEqF2Q/Jd3HU3nl4dAioN699R0m1l+ET2MGNn0rEYv+GmJsdJ6B1q
         mclje0ckkzYuY8yIUwNM8D9u4A3yv4Brtpl1byU7t+U/hqgVidjB9oROpeZo0DA4k46X
         KkuXCy0L78HdTzmWHASuvjfLLNjS0CZF8VWfaKvC2Zte34Pz5P8oGZz1X7TzusrY1jNE
         sEqKEIpAJmMsmyjsWi6stvcXs9zmbEtEm/F+VHUk9AU4BtCOfPmTWT7NacH+fVxgLMOA
         eEEN1BFQFhy6/GAQL07ArJMd2DAWNK8/KILJ0aSG1jfqeCG4f9izdLHcD6WuseyInYqV
         yoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=SRoV1PaRezZdJ6ik+sgrVuVj02s1PxNs0I9OUrWCYiw=;
        b=op6vQJAQDhjrHItnjWxnMit1eSuA7aDGFxKgGOOf78++AS04BIrcSgRA1TaykDpcz0
         hwMt/PTwJkVt/vQ2zTpYCE39qr2c0Im/v5bDr/qorZRLA68UfBGSMEnqSU94AGjcNsHS
         xBZ8tAE3AROPXD/Bv85ilDrtZ5dfOyR9cZirTxYt0BEbB3di6/Wu1FnjlrF2K5xmZ95A
         Ln9RsCrystVVtNIaoL8RlyJGKFzUr1F0I4ZjqrKB6081IXT7jwQSyjAFLr5jZk/NMcuX
         ycW745C1P2oj2vRtYEWlExJ+Ycr2y8ff+OqL/sjXIemGkBy2owe0aoz4sIp232JuyjyG
         ZmkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si565955qkj.161.2018.11.14.08.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 08:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMxcF-0004Ny-Ek
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 11:02:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1gMxc0-0004Nk-UC
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:01:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1gMxbp-00066i-DV
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:01:46 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54742
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1gMxbn-00064z-09; Wed, 14 Nov 2018 11:01:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42D4F1596;
	Wed, 14 Nov 2018 08:01:38 -0800 (PST)
Received: from [10.1.196.78] (ostrya.cambridge.arm.com [10.1.196.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9812B3F5A0;
	Wed, 14 Nov 2018 08:01:36 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"mst@redhat.com" <mst@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
	<20181109112957.10067-12-eric.auger@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <e1ce4892-a405-6e0e-764d-965b18fc942d@arm.com>
Date: Wed, 14 Nov 2018 16:01:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181109112957.10067-12-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v8 11/18] virtio-iommu: Add an msi_bypass
 property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kBWXRL94NCG

On 09/11/2018 11:29, Eric Auger wrote:
> +static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
> +                                              uint8_t subtype,
> +                                              uint64_t start, uint64_t end)
> +{
> +    viommu_interval *interval;
> +    struct virtio_iommu_probe_resv_mem *reg;
> +
> +    interval = g_malloc0(sizeof(*interval));
> +    interval->low = start;
> +    interval->high = end;
> +
> +    reg = g_malloc0(sizeof(*reg));
> +    reg->subtype = subtype;
> +    reg->start = cpu_to_le64(start);
> +    reg->end = cpu_to_le64(end);
> +
> +    g_tree_insert(ep->reserved_regions, interval, reg);
> +}
> +
>  static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
>                                                    uint32_t ep_id)
>  {
> @@ -120,6 +142,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
>      ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
>                                              NULL, (GDestroyNotify)g_free,
>                                              (GDestroyNotify)g_free);
> +    if (s->msi_bypass) {
> +        virtio_iommu_register_resv_region(ep, VIRTIO_IOMMU_RESV_MEM_T_MSI,
> +                                          IOAPIC_RANGE_START,
> +                                          IOAPIC_RANGE_SIZE);

The last argument of register_resv_region is 'end' but you're passing a size

Thanks,
Jean
