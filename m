Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3701140lfc;
        Wed, 13 Oct 2021 22:58:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BSHxsEXF+P/0CCua1USthZ/+jJdnIBsaXLsJbl+e0dqoR30LfE+arkfCAhI5gunir2hQ
X-Received: by 2002:a25:69c7:: with SMTP id e190mr3828927ybc.334.1634191113277;
        Wed, 13 Oct 2021 22:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634191113; cv=none;
        d=google.com; s=arc-20160816;
        b=FTS61QDKmEkY9hxHbGF+ilnBkTLnGH/m2VwsJFE0I/8bs1kH/8shxeEZipLBIceFPE
         i1PU3Tpj51fvBtuceb9yeQeTSKGr/XcIxcpTmBdDnfcoeBhAUC0gmq+wtnXKG7mUXnKr
         Scz/ozECck4E3p3oaCQPP6RFKpNjR9+2TxwZn7bzJEcsAWmBhDOvMp/56V/V6ee44/h8
         hza+0e46/0+DQTgWbizCm5y+qBVkkl7wbH6i35RXYZDmjspGSI24h4+najF5azE7dO+y
         JE66hEaYYXumQir96C+p4GtE/TjrUcMFl4W6akh1hiLZXHNP6iKS/JvVnjrIxJyYY6e5
         0UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HzkIiR5FQ/aqJ3LyIalinX4bRK8N14Qb6Ny1bn45zCQ=;
        b=J1kWdnxSDKAluAuRcN1CfcRcjdYWh9Jm/S7pipA8xtKTMoqnMSpm6dGQBjIboteh5Y
         dnL40B+X/zqLoNbreCzzNJbdLhajqgxLFXLZYrJISzZo6KGvkrDDAuuMbzzPRAqYa2+x
         +9HZhbz9rjlMWkgZXkcmvBeMCFjgpLmRJT540MfFkiWagDPauz7Wh6IQfkEWyl6ZPG+N
         gbdoRFlVgstBKvF0RKpgdkQcTbD15QiYTTCMOFirDVdOI69pKjefQrbYEURpD60ialRG
         9cD/ZP6aNgWH8UWSbT9ZDHAYKK46qkwKVXy4iE5G+OyzvzXtaQwKgjggk+nQbApnpsf/
         L8xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hFEdR8nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si1828377yba.293.2021.10.13.22.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 22:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hFEdR8nh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1matlA-0005lP-I5
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 01:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1matku-0005kE-Dz
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 01:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1matks-0002ec-EA
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 01:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634191093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzkIiR5FQ/aqJ3LyIalinX4bRK8N14Qb6Ny1bn45zCQ=;
 b=hFEdR8nh7sr37cehnBVnkZnLhusk9BFHTLwwi5IKDtNOLlqF6eC8scUdSd3KfmtfGYxj7a
 3b9R0RmvIhvkOo9MfvZH5mYGaCxOmiW6MD7R/anTs34XTemDhjAP6E0GxDV85kHZnQW/Hv
 I1rJXgfgGB11d5MD7PdrEl8eoozNl0s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-7yJU1Sn2NgOJrh75KbXSMg-1; Thu, 14 Oct 2021 01:58:12 -0400
X-MC-Unique: 7yJU1Sn2NgOJrh75KbXSMg-1
Received: by mail-wr1-f72.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso3710783wrg.1
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 22:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HzkIiR5FQ/aqJ3LyIalinX4bRK8N14Qb6Ny1bn45zCQ=;
 b=XqzagJUBuXBjANOYbiS2rJU3lCg4PjpXhY7xxdUkdDqkgAF22PlhW9V2kJvg33CvIq
 5ANVbBgoXoR+VdBrfRg5NnfFVbWxAjTPlHtKBFiYr4/0kgHjT5IedUuY0mqv+6D8VaxQ
 z/V0ECDbBKxwWcTIA2+s5YJKe/IkCx1YwOyu0J26R2MBGuED/VOtk64rV4mmrOz4KWq7
 62JTe9KYzNIhcZP/9ZqbmTdU+DeJpf1s5dOFdyEIAlAQjx2E3X6pL4h7hUXH8/zIlXsf
 wKBNWJXXfqzQwkzQjmd3SyUy6aBFDwiYzDr+wFXO6LLxF8LygC/Ln2NdKjFagdgptMOo
 d0gA==
X-Gm-Message-State: AOAM531QR+v+rEGD1lWYEP7yeQpLApAqiXlWXNtWycP8RKL5g2fpDp95
 rn3ZMZ2hJiDc7KfWN8FeF6WtqrWLq3z5PtbOY1sejQ8+7d1rb4DxNLShmCoTga8dNjNG3trpc1t
 H6K5uqmdZBHIv
X-Received: by 2002:adf:979a:: with SMTP id s26mr4366416wrb.2.1634191091355;
 Wed, 13 Oct 2021 22:58:11 -0700 (PDT)
X-Received: by 2002:adf:979a:: with SMTP id s26mr4366396wrb.2.1634191091172;
 Wed, 13 Oct 2021 22:58:11 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h22sm1344062wmq.42.2021.10.13.22.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 22:58:10 -0700 (PDT)
Subject: Re: [PATCH v2] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211013195010.737789-1-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <07db071b-acd6-67e9-efc1-fdb215fcc2e6@redhat.com>
Date: Thu, 14 Oct 2021 07:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013195010.737789-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yXBKMetUOJYq

On 13/10/2021 21.50, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
...
> +/**
> + * send_map - Send a map command to the device
> + * @domain: domain the new binding is attached to
> + * @virt_start: iova start
> + * @virt_end: iova end
> + * @phys_start: base physical address
> + * @flags: mapping flags
> + */
> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                    uint32_t domain, uint64_t virt_start, uint64_t virt_end,
> +                    uint64_t phys_start, uint32_t flags)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_map req;
> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    char buffer[64];
> +    int ret;
> +
> +    req.head.type = VIRTIO_IOMMU_T_MAP;
> +    req.domain = domain;
> +    req.virt_start = virt_start;
> +    req.virt_end = virt_end;
> +    req.phys_start = phys_start;
> +    req.flags = flags;
> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    memread(wr_addr, buffer, wr_size);

qtest_memread() please.

> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}
> +
> +/**
> + * send_unmap - Send an unmap command to the device
> + * @domain: domain the new binding is attached to
> + * @virt_start: iova start
> + * @virt_end: iova end
> + */
> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                      uint32_t domain, uint64_t virt_start, uint64_t virt_end)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_unmap req;
> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    char buffer[64];
> +    int ret;
> +
> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
> +    req.domain = domain;
> +    req.virt_start = virt_start;
> +    req.virt_end = virt_end;
> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    memread(wr_addr, buffer, wr_size);

qtest_memread() please.

> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}

With the two memread()s changed into qtest_memread()s:

Acked-by: Thomas Huth <thuth@redhat.com>

