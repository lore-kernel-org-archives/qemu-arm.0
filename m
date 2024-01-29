Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp53153ejk;
        Mon, 29 Jan 2024 01:27:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJKKW9T2HeHt8BrWXvfX6XbIIedmZm0FPrJZOd4bv3CbtU5xqS84vDdyW2rWBw+pi8tk8G
X-Received: by 2002:a37:de02:0:b0:783:b6bd:b0da with SMTP id h2-20020a37de02000000b00783b6bdb0damr6634436qkj.39.1706520450699;
        Mon, 29 Jan 2024 01:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706520450; cv=none;
        d=google.com; s=arc-20160816;
        b=pyWWGN4F2GVvYX72+nIfwRmaEuwE8Kscg7Jlz83Omt0tteRjG26d3z0EnTTokZU/F4
         lRAJ9gB+8o3shzX9wfCaAqBfJJOQH2jGBAlMIdKfDjSHrH9N4NuKzDjEsMyOh0OuQSIS
         PWX+huIhf6w8tiuacxrSr0b1xbJgqkx4rwNmvDt6xRgPwDD2mrDbnd+hl5tnyrPs+oGC
         SNpAi03MAi1aJSgJ3L5hbcMx4/q12i8goLk72Tthavqm1hb4t4obJ//9WavyES5M2631
         a8KIbwXJVirL8M6Uvr9o3nBKq+gy6yQpCQNW/F/xiGuHdjK02WdXAX5DbOxZTYyi5Tgj
         tU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=K4rBKjYoq2OHKWxux/xqgcQp7u8QdtmguCttHiRkjus=;
        fh=3ZRMErIroDuSap2RszxyIRR0o2ptPsIX5p5j+kfsr4A=;
        b=uADz0Rgp9Y5hxWKRwUVXIalwPhnkwG+kR33lwCm/ov1f5n7VBol2LW+wQ4X48baLnS
         4zKSvJvMDiPpKyTJhhK/I/pZUxjh2+NCnBj5qiEYwV6A9r8/kCNwV55cobMiGRCyogaD
         ahfR6cjSrI2gk2DsGZs/GTidivNPHuozpKk71/96PKiVrLdEoz+s7qTzaLsIFDX+4+A9
         mHyWOlxRx0cQOaWv/mowhrvCRbNy5TPaBGXdR05TBrN0V3rLMu7sGfhtxZUIm9Xh5w+1
         qcg0XEBVvssYS6WPwZuuZRx+SgQ+Q1fNL1utDRHl9gRcdVz52LTnarr78YGESUKTLRrF
         7Nsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SKmuGPJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05621421c600b0068c4fad97b2si1503031qvh.189.2024.01.29.01.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 01:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SKmuGPJQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUNvC-0007Rp-Rz; Mon, 29 Jan 2024 04:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rUNv8-0007RJ-6k
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 04:27:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rUNv6-0007HE-2n
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 04:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706520429;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K4rBKjYoq2OHKWxux/xqgcQp7u8QdtmguCttHiRkjus=;
 b=SKmuGPJQtgNkhkzkydDqtf3vb0e9KlBatM9qMADnvddy/TnfFFODt34l7ctp0/kwp8LtFS
 hzukp2UmdGuGaCeICSvNDl4Wn1mlW5QkBkE70+bHROs8C8LB2oXEGgxPhA44Ht+XZwtKes
 NT2qldeDl+tFlZGNguv71BZcDCge1E0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-o4d7R8bMO4CMyjRykyzrZA-1; Mon, 29 Jan 2024 04:27:08 -0500
X-MC-Unique: o4d7R8bMO4CMyjRykyzrZA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-68c45d1a07dso14976376d6.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 01:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706520427; x=1707125227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K4rBKjYoq2OHKWxux/xqgcQp7u8QdtmguCttHiRkjus=;
 b=JHYlyG28jynsCZ9dU+JxG0RUwW2qaQtiMslRlw+OoS2ej2NJ6Cg2XDUC1D1Z3YLoUs
 UVImfD7QdThoJQ1ERM1TbuTQT6phAwX3/rCy5LBL3dQtc/AedVT7Kg7PMFvylwjzn+AL
 Kx45wUqYDwXgDlmR3/Id4WjwUCid/WY7YirWuC6mu14U+iACTr2yhDzNMNsdXcibP6aJ
 JuL0uH9fsvV5P4Ua5HSn/56Gzan9f7MEACLOaq8CoVWyDzPVrB88vnyXsd3X4HR3PzpA
 QIREN1huFOGvWsOzzi5/fQYPP4ji9UHxkFenL9JkJhTGukOmy5+4K/nSTUjppN/fN7+a
 JTOA==
X-Gm-Message-State: AOJu0YxMHL0fnSEF0N8vJE6sgsMIKsp+j62ECTLzcAp4eYPGbOrSdX1h
 dnkX4srpRTHI9fzZGOptsPmtFjOveSuUU84+Uhb35LhnvHkaNh8/pM+SXKZb04UyWxI0BHXgWpc
 njKFDoYFM9KXnY2YEe94R0irwkZn0zh+UVAN7113Y2v7fONvdJA==
X-Received: by 2002:ad4:5d6c:0:b0:685:a5d2:b4f2 with SMTP id
 fn12-20020ad45d6c000000b00685a5d2b4f2mr6857593qvb.1.1706520427620; 
 Mon, 29 Jan 2024 01:27:07 -0800 (PST)
X-Received: by 2002:ad4:5d6c:0:b0:685:a5d2:b4f2 with SMTP id
 fn12-20020ad45d6c000000b00685a5d2b4f2mr6857578qvb.1.1706520427407; 
 Mon, 29 Jan 2024 01:27:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 oj15-20020a056214440f00b0068c38fd4582sm2601504qvb.10.2024.01.29.01.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 01:27:06 -0800 (PST)
Message-ID: <ee99d75b-705e-4ba3-adac-f4798b0a0d6c@redhat.com>
Date: Mon, 29 Jan 2024 10:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Two minor fixes on virtio-iommu and smmu
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: jean-philippe@linaro.org, alex.williamson@redhat.com, clg@redhat.com,
 peterx@redhat.com, jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com
References: <20240125073706.339369-1-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240125073706.339369-1-zhenzhong.duan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.485,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7mHCbs8vjApk

Hi Zhenzhong,

On 1/25/24 08:37, Zhenzhong Duan wrote:
> Hi,
>
> PATCH1 fixes a potential issue with vfio devices when reboot to a
> different OS which set bus number differently from previous OS.
> I didn't reproduce the issue in reality, but it's still possible
> in theory. VTD doesn't have same issue as it use some verify logic
> to ensure right iommu MR is picked.
>
> PATCH2 does same thing for smmu.
>
> v2:
> - Remove redundant memset in realize (Cédric)
> - Add a patch for smmu (Eric)
> - Drop the patch to support PCI device alias for now, as it's tricky in
>   using two different IOMMU MRs and Eric already sent a smarter fix.

For the series:

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

>
>
> Thanks
> Zhenzhong
>
> Zhenzhong Duan (2):
>   virtio_iommu: Clear IOMMUPciBus pointer cache when system reset
>   smmu: Clear SMMUPciBus pointer cache when system reset
>
>  hw/arm/smmu-common.c     | 2 ++
>  hw/virtio/virtio-iommu.c | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>

