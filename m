Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1944503ejb;
        Mon, 9 Oct 2023 05:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlgKhSOt4hT9/v9w8BnhJyr9FAfajD+RP4LS4NvcViuymgbB11vhaYrvCDlu3fp4vEe+gF
X-Received: by 2002:a05:6214:328d:b0:65d:1270:684a with SMTP id mu13-20020a056214328d00b0065d1270684amr14184386qvb.22.1696856285935;
        Mon, 09 Oct 2023 05:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696856285; cv=none;
        d=google.com; s=arc-20160816;
        b=i5Tsz6KYgnmJ/60oh9+UodaFr94KLKf5mE2eCsMqEc7r9qgr9hJxZfi4iQlxXlxRcL
         rpiRmdz2ks4blsD7DvgEajHEGStaDIyMvtGpoZFpDDUrpIlqTNDN78grAPkqgUbTIkDi
         716t+5tL4yZNq8Ns1+rDNVPIo7HNVqkL19/hbtZYoZaGxF7zCbVRdl1bBA9bSyMAMh83
         la8q9fdP6M/bAE1ej8lpnfD4RspWaMIXm6OcMe0B7Ui6jiWmfUyua50f1zkG7xhbkLqy
         9O82zqbPqtDN5u/rxvUhtGH5wYT2rHgo8B4QvBZqxl6HOx8vseHpzAtM9ZzS1SRXS0ze
         DTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=qo8iiOB+UxWwxastfmcSl9Amta4/SGZ9A5ncrD+jtHA=;
        fh=+chTJvTUqLF78uKUbEAKJmGOCM2cEddogRBMbJAdwq0=;
        b=Tu1LXnYCrkOZ0qexIv2zW+xRBZLLR9wYFiaHG677PZA9q3ZfQQnCoB9LVBefTOv51T
         qknP8t5Efu7QUhvLkTY7wU7PRwz8iAqQ3Q8PT9h4nf7H7P5kvpbJzrpEkPh9pZcoXs8b
         TMKzV2TGC+am/SaApgtWWM79oNmziCReZtx/SJXfdgFAi2YinacdQNoRgd9fcy8P/8p9
         9ISvQ7m/Mf49E3iZwMllkLt2vAinP6PgSGal/QRbrh5xnL5EGs7wXevAJllsHXpzmR9n
         uNSHAAO9i38eq2s+ny+CWiO+Kj2zGBPs4fwwfm+U7qDyjHm7/Kigui3byvCxmeNcU5Cs
         h0wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hUdCcNS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a291300b0077053731daesi6106366qkp.261.2023.10.09.05.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 05:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hUdCcNS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qppp6-0000Dt-GL; Mon, 09 Oct 2023 08:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qppp4-0000Co-NL
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 08:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qppp3-0001HP-78
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 08:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696856240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qo8iiOB+UxWwxastfmcSl9Amta4/SGZ9A5ncrD+jtHA=;
 b=hUdCcNS/9na3BurBtk7DtSJzT0OxZVhsVDg0C8Ier3uDdhhndDun0fpGreUlREsMRrykwS
 2GtD2yF7P2FyL8bnnzdVXuE+Wj0ZNYKWcUrnsahVx+/X+0A0jhWam/3uldZTKwc7lMK7VR
 bbGmrvHCbhXr5knsVk9gim5d3QCCLHQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-uGpAzhiwOCWW1TCbRFbGQQ-1; Mon, 09 Oct 2023 08:57:19 -0400
X-MC-Unique: uGpAzhiwOCWW1TCbRFbGQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40540179bcdso29261735e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 05:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696856238; x=1697461038;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qo8iiOB+UxWwxastfmcSl9Amta4/SGZ9A5ncrD+jtHA=;
 b=ocbKU7ItROo2F30G2qG7oZ5VilNK6EewPjwE56Ex9EhBhiEeDAry3j86jdXruHZ+9e
 C9RVyxU6w1tCiCl/eePczDIGQxMLgFmPEFvxLlo8jFF45kKFnmnfiKIfHGWzTSe8J/tU
 xzd9sfXXVfx2OC5tM2ABwaT3VleZUOK2VZGzjEB/71HPXYUSY23dvnuYcq0yv04JW3Ee
 YQEj2DDiynkkJRO73SNSHtHP2sbWPugxS2dftsnscg+t0+24HoC0UkXZh4Z7ZRHVq7jW
 l6rbdp09GJfg1HRF0bJBjYWyHCqmqLEIqFuI12rkzegvhWc1c85uSXOwjGJ8dk0nKNfv
 n3hA==
X-Gm-Message-State: AOJu0YyEM3tRxVs4NXHXk9oljcoKWJqhNEkg7KS8E595Fo0fHgWyWl3U
 yn70lYcVKnXGr9dY1bO7cs9SvM9/3iy7OnYFZw4Ml8Pc+qnwUm1g+p5Y/pdAeJpQxYIjsgFgOhC
 NXeFsX80n/odb
X-Received: by 2002:a05:600c:259:b0:401:b204:3b8d with SMTP id
 25-20020a05600c025900b00401b2043b8dmr14588370wmj.27.1696856238017; 
 Mon, 09 Oct 2023 05:57:18 -0700 (PDT)
X-Received: by 2002:a05:600c:259:b0:401:b204:3b8d with SMTP id
 25-20020a05600c025900b00401b2043b8dmr14588346wmj.27.1696856237574; 
 Mon, 09 Oct 2023 05:57:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548?
 (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de.
 [2003:cb:c733:6400:ae10:4bb7:9712:8548])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4b0f000000b00325aca09ad1sm9665801wrq.24.2023.10.09.05.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 05:57:16 -0700 (PDT)
Message-ID: <10a2b2f6-a52f-a8cd-83cc-8f3b71cbf7f7@redhat.com>
Date: Mon, 9 Oct 2023 14:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] qom: Link multiple numa nodes to device using a
 new object
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, ankita@nvidia.com
Cc: jgg@nvidia.com, alex.williamson@redhat.com, clg@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, ani@anisinha.ca,
 berrange@redhat.com, eduardo@habkost.net, imammedo@redhat.com,
 mst@redhat.com, eblake@redhat.com, armbru@redhat.com, gshan@redhat.com,
 aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
 dnigam@nvidia.com, udhoke@nvidia.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-4-ankita@nvidia.com>
 <20231009133048.00003535@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20231009133048.00003535@Huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I57ikxVqefHC

On 09.10.23 14:30, Jonathan Cameron wrote:
> On Sun, 8 Oct 2023 01:47:40 +0530
> <ankita@nvidia.com> wrote:
> 
>> From: Ankit Agrawal <ankita@nvidia.com>
>>
>> NVIDIA GPU's support MIG (Mult-Instance GPUs) feature [1], which allows
>> partitioning of the GPU device resources (including device memory) into
>> several (upto 8) isolated instances. Each of the partitioned memory needs
>> a dedicated NUMA node to operate. The partitions are not fixed and they
>> can be created/deleted at runtime.
>>
>> Unfortunately Linux OS does not provide a means to dynamically create/destroy
>> NUMA nodes and such feature implementation is not expected to be trivial. The
>> nodes that OS discovers at the boot time while parsing SRAT remains fixed. So
>> we utilize the GI Affinity structures that allows association between nodes
>> and devices. Multiple GI structures per BDF is possible, allowing creation of
>> multiple nodes by exposing unique PXM in each of these structures.
>>
>> Introducing a new nvidia-acpi-generic-initiator object, which inherits from
>> the generic acpi-generic-initiator object to allow a BDF to be associated with
>> more than 1 nodes.
>>
>> An admin can provide the range of nodes using numa-node-start and
>> numa-node-count and link it to a device by providing its id. The following
>> sample creates 8 nodes and link them to the device dev0:
>>
>>          -numa node,nodeid=2 \
>>          -numa node,nodeid=3 \
>>          -numa node,nodeid=4 \
>>          -numa node,nodeid=5 \
>>          -numa node,nodeid=6 \
>>          -numa node,nodeid=7 \
>>          -numa node,nodeid=8 \
>>          -numa node,nodeid=9 \
>>          -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
>>          -object nvidia-acpi-generic-initiator,id=gi0,device=dev0,numa-node-start=2,numa-node-count=8 \
> 
> If you go this way, use an array of references to the numa nodes instead of a start and number.
> There is no obvious reason why they should be contiguous that I can see.

Right, a uint16List should do.


-- 
Cheers,

David / dhildenb

