Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2569048wrs;
        Mon, 19 Aug 2019 05:08:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOLOUyz57o6r90cM4WP5MJl01lkmX9nWBKX4adAPsjG24nbbjjwu1AFA8522lA5j+H0EPv
X-Received: by 2002:a17:907:207a:: with SMTP id qp26mr20631311ejb.12.1566216519844;
        Mon, 19 Aug 2019 05:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566216519; cv=none;
        d=google.com; s=arc-20160816;
        b=txezFk3MvipNm0IrFXvURBEYXdXxiEBBME375Lgg3mWMGYYhIl8aiejUjEckbyIJRW
         td6pBvUo5fT6HvDR4bw3ufV6qkzFOiGUuFsmzw47ifJ5mA6NpAnXCnT9lcBrMcWiJdlx
         OFG0ouXecs93pUwwgdAg11PnE3Ss0nzK4W8MCAUsnlSJdyUYdyd67noKhHIH9+sdy0ug
         f7KATr93T5tOQMzHr+cEFh25s6jE9UqVDiqlXHEAOpcJ1tjf953oPaqcS1sugdCizXVL
         g/4/a9irINotMHGNvzoCOPkPCZsF38JWw3F7w0r5/c/eYYXxJjJHvCx/JyINsQUlUdaP
         8+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=WAswI7IvJsamoUX+PIF1wVLMxOBTG1uRKswJMWAJkx8=;
        b=0a+lyXNs1pYw3MdS4is42rkMUHA8bz8u6O8bEJjgDYRgnN05+rlz9s7ZccOaURADt2
         EveZJMQaXhe0CK63L7Vd+uhJnlK8XHREYL9OUYOwWJi0eOEsusObfiVzjTSUFcHew8Wa
         vH58WiLnSC8En8/MkJErHf0e8cSww4rWspUfqsw8XjUH4V77lfjYlFy7ZEgvPw8MFw/+
         bOqsDn7eiOurXP1/7Kb6fbafdENDxLqj90yCUh9wTCkGy5k8FTmIO49jT0uZhiSz5oZL
         LC/QW0hEfdwNeGiB+jMI20gVq5qpwD/QStgntqXLvc6giL25Iiy6t/ucrP7BfDH7Ue60
         D75Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si8227291edb.241.2019.08.19.05.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 05:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzgSk-0000eQ-UP
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 08:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hzgSd-0000e1-3d
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:08:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hzgSb-0001gw-RD
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:08:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51046)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hzgSb-0001fS-IT
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:08:29 -0400
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 98FA37E425
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 12:08:28 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id v4so1906492plp.23
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 05:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WAswI7IvJsamoUX+PIF1wVLMxOBTG1uRKswJMWAJkx8=;
 b=mrGa/BEKlFGnocDechhmo7Mrks+nFrCHLJGs8pg8O27Y8E6oHgrbR81ZePYk8H0+L9
 ddPq+bCSt2+CUv4EuasPgHUKJcrC7AGR88xILOFOcEUKWX4azizYuQ1lVOHz3E/9mRn2
 waO9j6/uXfeSFxglKfJ/FeDMOjv9/tEkVshuND4vrBQgLpeFgMGMXgcLwLL0KTE7bxwM
 8M3DF9Yt3hHsY8YgGc/YLbooLzecdFbYd+lUTC237vJae4C1HmtofKup35rI4JS3HkJp
 VJ8dIFbk6XZO4t7O7C9zRr6R4OJOY5l/VscE2kANww81j+aulfpIGNO81nC3WarLTubJ
 wAog==
X-Gm-Message-State: APjAAAXpMYx2jXtyp2GtdJoLZGhjVq5BO69WS/iF9tUal2Fr+cOugicc
 zYMEoABt9QrdELOtB0qAwJs3TXFuonQ+zkuuvDju9yMkmhRjcohaOguqY4MbD025XusxPR8dU8y
 J8ONvX7N7FX6G
X-Received: by 2002:a65:6552:: with SMTP id a18mr20080139pgw.208.1566216508081; 
 Mon, 19 Aug 2019 05:08:28 -0700 (PDT)
X-Received: by 2002:a65:6552:: with SMTP id a18mr20080071pgw.208.1566216507259; 
 Mon, 19 Aug 2019 05:08:27 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id u74sm18616232pjb.26.2019.08.19.05.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 05:08:26 -0700 (PDT)
Date: Mon, 19 Aug 2019 20:08:15 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190819120815.GD13560@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-11-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-11-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 10/15] virtio-iommu: Implement
 probe request
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sBdk3OhQnhiT

On Tue, Jul 30, 2019 at 07:21:32PM +0200, Eric Auger wrote:

[...]

> +/* Fill the properties[] buffer with properties of type @type */
> +static int virtio_iommu_fill_property(int type,
> +                                      viommu_property_buffer *bufstate)
> +{
> +    int ret = -ENOSPC;
> +
> +    if (bufstate->filled + sizeof(struct virtio_iommu_probe_property)
> +            >= VIOMMU_PROBE_SIZE) {
> +        /* no space left for the header */
> +        bufstate->error = true;
> +        goto out;
> +    }
> +
> +    switch (type) {
> +    case VIRTIO_IOMMU_PROBE_T_NONE:
> +        ret = virtio_iommu_fill_none_prop(bufstate);
> +        break;
> +    case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
> +    {
> +        viommu_endpoint *ep = bufstate->endpoint;
> +
> +        g_tree_foreach(ep->reserved_regions,
> +                       virtio_iommu_fill_resv_mem_prop,
> +                       bufstate);
> +        if (!bufstate->error) {
> +            ret = 0;
> +        }
> +        break;
> +    }
> +    default:
> +        ret = -ENOENT;
> +        break;
> +    }
> +out:
> +    if (ret) {
> +        error_report("%s property of type=%d could not be filled (%d),"
> +                     " remaining size = 0x%lx",
> +                     __func__, type, ret, bufstate->filled);

Nit: If this can really be triggered then we might still change it to
error_report_once()?  If it's not (which it seems to), maybe assert
directly?

Other than that it looks good to me:

Reviewed-by: Peter Xu <peterx@redhat.com>

Regards,

-- 
Peter Xu
