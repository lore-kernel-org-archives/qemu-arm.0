Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5896518wrw;
        Wed, 14 Nov 2018 08:02:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5d0Rqlr6I4lG0N2kxRKhzLqt1Od1g0pDWlYh30vJ1OyFqAGjiW7UTVokxEUSARWnIRE37bY
X-Received: by 2002:a0c:f9c3:: with SMTP id j3mr2458993qvo.107.1542211328717;
        Wed, 14 Nov 2018 08:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542211328; cv=none;
        d=google.com; s=arc-20160816;
        b=g56gIG3vsFkpswxk7KGc0hR194j+6dusOeDkebN6ZHsFVfBkRPqG1ZRFu5Mvl6x1Zt
         NeN69Oak6xOXppkicuAdiOAjINQIBf4p9njdA7zBNBeuaJLWLUl9cfyuX9e8sEUncVZO
         csNCz5hR8QNUkelLb5VRnGAhZcB3GpK7O5Ezecm9awpSHdGVZf7/HiXmDm3H0Hchw98D
         OFAS/5/QX5/SrWxytNfOpwGS+betF445ypK8CGxvcbDw1M23O+Ji0Fy8TbirlKJr1uNl
         utNtFF363ViZdjuFcZ6E/gfV2ZES7rekDdl+ameMgjJGNUYbkwlv048NcVCL6hbKqTf0
         aHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=LfniGVb91z95qY6rJbCH7FOulOTG2Zey90peeKjNBaw=;
        b=PavofK+XSej7U/VmMT0Lu+tbtEDatiyfAKFVaDA4et/Biz7N18YNiGKigLLz3wNaBy
         C/uU/biU2gYPeJpnIX0n7jZ7V++DtTsvrb6B7CaKsRT0X0TL6rxgpJvwIUQI7DBSku+g
         jueA0AlPVRWvKjvN6hTIrwHN6fZl4T0Fq9zyiTByLNKiCzG9QJ8PS2DzG2j+//BYTJVh
         3252KphBIk9Q60TF1gVg9xMMAcrd4ihUzvNXuynb8qnVwBvW0+i8v0CknRgbhlLNNd56
         iOie3uTIQeELDnpN0R+05JTGmCL+P+Ybuee3/sLuj+5dqPXforGNUenELDUxdyJ0UuOZ
         ixyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si6512732qkk.237.2018.11.14.08.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 08:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMxcF-0004O5-Rh
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 11:02:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1gMxc0-0004Nl-Ul
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:01:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1gMxbm-000659-SI
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:01:47 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:54726
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1gMxbm-0005k5-BD; Wed, 14 Nov 2018 11:01:38 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC6D980D;
	Wed, 14 Nov 2018 08:01:24 -0800 (PST)
Received: from [10.1.196.78] (ostrya.cambridge.arm.com [10.1.196.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BBE23F5A0;
	Wed, 14 Nov 2018 08:01:22 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"mst@redhat.com" <mst@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
	<20181109112957.10067-11-eric.auger@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <993a3856-1192-4c05-8f81-68d68e421b20@arm.com>
Date: Wed, 14 Nov 2018 16:01:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181109112957.10067-11-eric.auger@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v8 10/18] virtio-iommu: Implement probe request
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
X-TUID: O7Z38lSr8aPJ

Hi Eric,

A few issues creeped in when the resv_mem structure changed

On 09/11/2018 11:29, Eric Auger wrote:
> +#define SUPPORTED_PROBE_PROPERTIES (\
> +    VIRTIO_IOMMU_PROBE_T_NONE | \
> +    VIRTIO_IOMMU_PROBE_T_RESV_MEM)

You might be missing "1 <<" here, since the properties types are normal
values

[...]
> +/**
> + * virtio_iommu_fill_resv_mem_prop - Add a RESV_MEM probe
> + * property into the probe request buffer
> + *
> + * @key: interval handle
> + * @value: handle to the reserved memory region
> + * @data: handle to the probe request buffer state
> + */
> +static gboolean virtio_iommu_fill_resv_mem_prop(gpointer key,
> +                                                gpointer value,
> +                                                gpointer data)
> +{
> +    struct virtio_iommu_probe_resv_mem *resv =
> +        (struct virtio_iommu_probe_resv_mem *)value;
> +    struct virtio_iommu_probe_property *prop;
> +    struct virtio_iommu_probe_resv_mem *current;
> +    viommu_property_buffer *bufstate = (viommu_property_buffer *)data;
> +    size_t size = sizeof(*resv), total_size;
> +    uint8_t *prop_value;
> +
> +    total_size = size + sizeof(*prop);

size already contains sizeof(*prop)

> +
> +    if (bufstate->filled + total_size >= VIOMMU_PROBE_SIZE) {
> +        bufstate->error = true;
> +        /* get the traversal stopped by returning true */
> +        return true;
> +    }
> +    prop = (struct virtio_iommu_probe_property *)
> +                (bufstate->start + bufstate->filled);
> +    prop->type = cpu_to_le16(VIRTIO_IOMMU_PROBE_T_RESV_MEM) &
> +                    VIRTIO_IOMMU_PROBE_T_MASK;
> +    prop->length = cpu_to_le16(size);

Should be size-4

> +
> +    prop_value = (uint8_t *)prop + 4;
> +    current = (struct virtio_iommu_probe_resv_mem *)prop_value;
> +    *current = *resv;

*resv includes the property header, but *current doesn't, so the resv
property is corrupted.

Thanks,
Jean
