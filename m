Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3795409lfc;
        Thu, 14 Oct 2021 01:21:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRM+5vl35/VzeWq1E8BL3mhnq62g/XV4P7eRZPbf+juweQvb5sI3yC4RvKbxAeB7hpuudr
X-Received: by 2002:a25:517:: with SMTP id 23mr4901012ybf.496.1634199718056;
        Thu, 14 Oct 2021 01:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634199718; cv=none;
        d=google.com; s=arc-20160816;
        b=yAJ8RCzYYlp/1yvNzvTrGsRxAs8Dn8WsdhiSKgqhjFu/1y1n86IHJKhayza2snZL9w
         fvalVG4gwbrHo+TDc/IPjra/7IYNN0sAOJBozjMmqLD2yYfkpk5WLf3MKQf6qoXjFgky
         L7v+EmJH4YarM27PpduVcfKtEioc6xrMPfGQ7FW21li0DQ/5CHiBmCsFyTksHCY7iLcs
         R2eg/psjJIZPDS4hZGgkC+fbD/RsM+O0i7MWvHVZTaqU0mXqeh7iraG+XguoZG6/LL1j
         24KZMWq9ZcIbJRzlhPRMXtmytiCcZvXJ0zDkrCKPCvBW5mhHVAPzuwVrsCTsvmhfeRf/
         HUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Hi8TpwTjEDkvRVDGnWNh4yso/u8iJxd8dYzJaRvQYUg=;
        b=I2rATgWj9I8pngpnw92hpkdeeqeks/tObmqCcU8BRlw4fxd2xCvB6W1keiqkiDadKJ
         Hw0GmIJBgE7h+nC010xBckeUuYbv3nY92tVscuNTnhUydmukNfmnzoIbMZVhIfdIq/Wv
         T3+AZRS6FhJKuAcir3Vfmk9FqaW67Oz9AXIuukZ1o1svGDH7RbDFUHB4MiuBSX191cf2
         cHyzwXIlj1CSfYsWJhPOO06VCfBeBtCKtDrSMTmAqOTZt8tMBuBKGMzoTRaCuEd4Bkei
         xM1UlrtU/3/Y8BKsuCnY4F34GJbnMQnb9x24Xo8301mNOvLe/GetPaDTVWGdGDqVkoHb
         zkAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WiOHmQnC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si2454830ybk.6.2021.10.14.01.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 01:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WiOHmQnC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mavzx-0004HS-Ck
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 04:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mavzj-0004Dp-Hb
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 04:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mavzh-00067k-0x
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 04:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634199699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hi8TpwTjEDkvRVDGnWNh4yso/u8iJxd8dYzJaRvQYUg=;
 b=WiOHmQnCz/BDhsOby/J5uEkZklIF4/qPY5GaiO9MKIEXgIQNpxiJIXiofpWDhkJrNRm87B
 C72zx19BNQ9WHasNT/5F/jMI+5V0zNmK/CkLzqaGo2eKg88Dq5x03hHOpbFkffIalOqJ7D
 d4lWG+pYe/l9u9kE6kBEphfHCRzDNwk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Fv8vNQr_OMCAu3BMx7QCHg-1; Thu, 14 Oct 2021 04:21:38 -0400
X-MC-Unique: Fv8vNQr_OMCAu3BMx7QCHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 f1-20020a5d64c1000000b001611832aefeso3941046wri.17
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 01:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Hi8TpwTjEDkvRVDGnWNh4yso/u8iJxd8dYzJaRvQYUg=;
 b=ZVsLWM4z+W1tt/iP2ZcM3AcLlmi/76cpusipHF1CH6c3oTBxhoLzvahVlCy/RJN0E1
 6/BLE7J+d+oZdkx1wS0rT6+VWX+/jeN+HIrdl6ZIICGRcyzMhOiubatNItpOhz+BBUTA
 hyDPpGAsPmQjK1vB5Wk1xIKgwoUvUxW5wxj5JG3ICrGD64OLmpkusF5J4FAW/mBpFFfN
 3s2DoM5rgQUm5TeOCkoBgkutHrGctjc/EveDI9dTifHAD7f0C8UYp2VpfvVZpD+CAN3v
 7+br8cwWM/JS8xQy4ebde29Aih0tSDVZl3El/dKPfYwOfzF5cPdD9QsCo48iprj/VQx5
 fkDA==
X-Gm-Message-State: AOAM5330/tSOKozVq6Xa31HuDZATKkXip4oFKJLIDCP5Kmp6jkom9UyE
 Ru4ckPkApRmHxcfqaHZ1omzegHdjQnVu8pQvqcXJOUk+GwK6jav4LJ90n0zH4L3HncscywNV/2c
 DVqTm2WRpkADs
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr4824387wry.273.1634199696750; 
 Thu, 14 Oct 2021 01:21:36 -0700 (PDT)
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr4824365wry.273.1634199696510; 
 Thu, 14 Oct 2021 01:21:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p17sm1752309wro.34.2021.10.14.01.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 01:21:36 -0700 (PDT)
Subject: Re: [PATCH v2] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211013195010.737789-1-eric.auger@redhat.com>
 <07db071b-acd6-67e9-efc1-fdb215fcc2e6@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ef26cc8f-9121-e245-a0ac-ae159d191bef@redhat.com>
Date: Thu, 14 Oct 2021 10:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <07db071b-acd6-67e9-efc1-fdb215fcc2e6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGA5Tv7A7Dc2

Hi Thomas,

On 10/14/21 7:58 AM, Thomas Huth wrote:
> On 13/10/2021 21.50, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
> ...
>> +/**
>> + * send_map - Send a map command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + * @phys_start: base physical address
>> + * @flags: mapping flags
>> + */
>> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                    uint32_t domain, uint64_t virt_start, uint64_t
>> virt_end,
>> +                    uint64_t phys_start, uint32_t flags)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_map req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_MAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +    req.phys_start = phys_start;
>> +    req.flags = flags;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    memread(wr_addr, buffer, wr_size);
>
> qtest_memread() please.

My apologies, I forgot those qtest_memread() comment and the char
buffer[64] replacement too :-(
>
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/**
>> + * send_unmap - Send an unmap command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + */
>> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                      uint32_t domain, uint64_t virt_start, uint64_t
>> virt_end)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_unmap req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    memread(wr_addr, buffer, wr_size);
>
> qtest_memread() please.
>
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>
> With the two memread()s changed into qtest_memread()s:
>
> Acked-by: Thomas Huth <thuth@redhat.com>
Thank you for your patience!

Eric

