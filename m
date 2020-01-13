Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4590829lff;
        Mon, 13 Jan 2020 12:23:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqycg+Ic4kOzsZZewKYeA60b9v6r5K3STRJEA/xCu2NzqLGqh4bfCoSHtxbcivchK8lPYQj4
X-Received: by 2002:a0c:b5cd:: with SMTP id o13mr13436764qvf.47.1578947000697;
        Mon, 13 Jan 2020 12:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578947000; cv=none;
        d=google.com; s=arc-20160816;
        b=WA06hrNbNFI7jtKJixFfbvexmadu5VBqV/V+6tm4lQjsdqDOqXxFxVmQ3F0DfLxmSv
         V/nevQ0zL8zQk0t4GBH197AWGyz2Jkk604e9oVG6SCONHRlrR2Ki1+1m6+0KyePRYSqy
         6wGVcn5aaAc2KzAoqTMOfguUBmiBQCO93uzkp0ddieYe/niNpczYef2HvqHRSeC7J/9E
         Zd0YGsGdlJY+JOI+w1jvbznQNCuMeqmeUuQqkIQ/rHetTTo9jeOAtykbTWxw1Ip1fha3
         6UFdLjaw9lPKfTrAwOXtbQ4/B2BgJhYNaKT3u2xWatiR/gyqwiRvrYKDMYenaHFoTeZf
         6TYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=PJyFnWgz0nf7Cg6OaS6TNSwYEJ2gLStF2/lXnbBHvao=;
        b=KGpY09j2znHiCQ9ca7xCUNwKNBcs/1xSm5c/W2Pi4VddWHqjEf3HfJSQ+0VU9WXn9z
         Rimblufqwro7B+wQxzXaAairVMXtomWFjvEOD3nQWCsSrtA8pmYAPeBe7yOEUzEwHcIg
         OELrjLPJyjvBaBsS+atKWDY1NS1tiEQM0x0xSiJwAAAmP/VZviA+Z8l6LsuHUnYvaURw
         vZ4qZQx6EfoxSPRfJUTo3kQ19Ofkbqz+2Z8OLA4/OXW1qV7x65BKIntDnh1NhB7Mghhj
         +0/C56yYH8a7sRlci6G3LZ4B9tuRUjPNLgYAlTKblomd+FsyoJHW3gQnzEt5D5TGop+B
         LhSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="asuh/X1O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si7296636qti.25.2020.01.13.12.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 12:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="asuh/X1O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir6F5-00038R-UK
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 15:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ir6Ev-00033p-4O
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 15:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ir6Es-0007ja-MI
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 15:23:07 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27780
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ir6Es-0007ho-F4
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 15:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578946985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJyFnWgz0nf7Cg6OaS6TNSwYEJ2gLStF2/lXnbBHvao=;
 b=asuh/X1OxlQWsUkTQ73ixLt8tOw5Ol0AKSQ/EjHmSZjhJmdwJMWK8N2dxd6aBc5U3VDvWL
 Yh1x20UcZJ+mInO83KFs3D6pWMRPAImlttE7cWgLAAyFkZ6V5HqWh4w8kKdcz3lU0swycq
 vtXFmUJFdQ9PN3mw5r/rr9250hDfF3s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-W8xSyb2CM6-kAK7Yg8TEwg-1; Mon, 13 Jan 2020 15:23:03 -0500
Received: by mail-qk1-f199.google.com with SMTP id a6so6692537qkl.7
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 12:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=25vembt0SSWCmatgReqPJR12Kdh7gxUqpVgSdunfnW8=;
 b=cTzUpGP/IngykwkGcn01t/L4cHEJR/0Znj91nSnVy1Rccf8ig13mwoU5pAD5tcszQ3
 w4S+FnuYjF13rGbdgM/QNY1xeGH7+WfeOkgI5EnfwqsRmm3qAdd7GY3fZ2hpDRoZ3zd5
 O7RGXMBgrbvaO1YptYai/JH/Rar2sIxZ0OpNilWNmCjMSCdB/fymPFq5lXUMVQ58ttlq
 SEhFH2B6wwxUPH4CM+eta7dtH4ApUzx0YywVwHT2xI3gbqx8Z4UvOAOMAPsJvPH+WXQs
 xjHNpra3XXH2RgTo07Sy0xU7vvNn3xUcXQiTK1nL4jfYMhDpN4hzS3BAX4DL4C4WXwN7
 S7ag==
X-Gm-Message-State: APjAAAX6Mrd3yXQ+yyk68KXzWNjY/r/HTM7jU4JL7rIgMYPFMudEoiAf
 QtRp2KvP7c1uYQqyrwG7qbEihPntQ/gdIi/XpI1zAEjwH3wUI2sHt5E+m7ybGhW+t3igW1PMaRu
 lmJ5ZKvtbVrPx
X-Received: by 2002:a37:4dc4:: with SMTP id
 a187mr18337169qkb.436.1578946983254; 
 Mon, 13 Jan 2020 12:23:03 -0800 (PST)
X-Received: by 2002:a37:4dc4:: with SMTP id
 a187mr18337152qkb.436.1578946983038; 
 Mon, 13 Jan 2020 12:23:03 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id i90sm6294954qtd.49.2020.01.13.12.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 12:23:02 -0800 (PST)
Date: Mon, 13 Jan 2020 15:23:01 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 05/13] virtio-iommu: Endpoint and domains structs and
 helpers
Message-ID: <20200113202301.GD201624@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-6-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-6-eric.auger@redhat.com>
X-MC-Unique: W8xSyb2CM6-kAK7Yg8TEwg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U9B4GpSWQCQL

On Thu, Jan 09, 2020 at 03:43:11PM +0100, Eric Auger wrote:

[...]

> +VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t =
ep_id);
> +VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t =
ep_id)

Is the extra definition trying to workaround the compiler
warning/error?

I'm not sure whether it's only me who prefer this, but again I'd
really perfer we move the function into the caller patch, add "static"
as needed altogether, even if that patch can be big.

> +{
> +    VirtIOIOMMUEndpoint *ep;
> +
> +    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
> +    if (ep) {
> +        return ep;
> +    }
> +    if (!virtio_iommu_mr(s, ep_id)) {

Could I ask when this will trigger?

> +        return NULL;
> +    }
> +    ep =3D g_malloc0(sizeof(*ep));
> +    ep->id =3D ep_id;
> +    trace_virtio_iommu_get_endpoint(ep_id);
> +    g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
> +    return ep;
> +}

Thanks,

--=20
Peter Xu

