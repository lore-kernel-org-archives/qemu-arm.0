Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp244883lfa;
        Wed, 2 Jun 2021 05:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzutTHRP2vtkrP29VYK/rLGfSNtQtd/PhQUrQ3QHUZLsocOxyDG//4IvB+06/xYehTotdql
X-Received: by 2002:a17:906:a245:: with SMTP id bi5mr35069729ejb.316.1622636314699;
        Wed, 02 Jun 2021 05:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622636314; cv=none;
        d=google.com; s=arc-20160816;
        b=TU6Z8RqP/nmJDFGsnIkYaVrjyHUCYtWZmiICZf1On9bQdwvMWaCjvjTALBa5twlIJ/
         dEn4aqQI/uRVw2j70vZiQUIPWqlijZmpoM2JXVWtvOhEyRf/p2Nvo0Wr7BAQoZbS314t
         6vlMTe9wKPXVTCmkWVaQaGGLEP4lZZAarosQKoqF7l7uisoj3MlsmBhuSWiXBP/gEM2S
         S3IHvENPWZFah6d24AAlt5FT5WffXX5UH/4Hr5iu1YRcQk8gH3PPSgEol09ICYf8Ln5W
         Haozrs91CDsR1de9PwWL3bU4pYEcdkMvvgiCt4uFfZr9N2KPO9C+steW1sPCtBb8L1SR
         tXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from:dkim-signature;
        bh=qT/rEhDCwV24v94sG7Ykt0QbZ4SWYTSc0TjZg6wk47A=;
        b=dPQzIwsHsawEgMt7zFrOJNeBaS5cm+2fCpoBQfwundQnpCj3uvOVHU0jx4f8wLGxPM
         z5eb/lPQ9rMPPuLSJX5SJ70DL+E45rg7Du0ZBKDhtGs0TvTGDybZK3HWvUochMt+CHH7
         hckf9cbBQdbQyElhmuH2NEzSRt6xqQxbZqlNqtYpb47TIYJpbxivuGvrBcjAClqsknd6
         hIvoP6SFiMshlYa1Gk5sfqioQBu840vnG4GKFswO1vt0AfK8R3w5tzFBBHmdSCcUazlD
         9KszBsj9cjEf4AOP3uENd57rGKQVDaRoJCX/QUlZOiQQLQYsbpuJmXP/NCQzcAP5ujOL
         /3aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jJwM55kf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si1841572edy.189.2021.06.02.05.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 05:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jJwM55kf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loPpR-0000bJ-R0
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 08:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpH-0000Y4-R3
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 08:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1loPpE-0004VX-U2
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 08:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636297;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qT/rEhDCwV24v94sG7Ykt0QbZ4SWYTSc0TjZg6wk47A=;
 b=jJwM55kfkOC7tGThLY4r9HiU7nZhroa21YqPvfJcQ4FQwp1tOfUrsBqdsakjmo0NFszREc
 MjhmRX0t4NbKIXClq/ezpTfukyIPF6VItsSsFvTrGLBaUavtAkQOSKhL0q0RANiijdyjMf
 peg8nPEO6cr/jdXG8XGv4W39OPFpSFE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-gXWOfYiCMjGBDLfAgU9y6Q-1; Wed, 02 Jun 2021 08:18:16 -0400
X-MC-Unique: gXWOfYiCMjGBDLfAgU9y6Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 y129-20020a1c32870000b029016920cc7087so125108wmy.4
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 05:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:reply-to:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=qT/rEhDCwV24v94sG7Ykt0QbZ4SWYTSc0TjZg6wk47A=;
 b=odPPji7Zi6/RtQQrReCz59yZ2n79bjt1Y/ZHzHBs2/5WNnsf9snI+UxSHcHRyTfXhZ
 L9/FbcCuD4+G3RC2ZyxJr03zqK9kjrwVLMnk8YyisCPbBdwg6M1mhPVEe8kT9yYiFJMH
 pWZAPQr2WV1gPxWlLGNKZrWdo6TycH3szy89Z0DuEI7xHQ5suoCAdI/nQ0Yv73Sis8G8
 OQk3gLpYCAcgxkpduKCl88XMhNgZXiB/KRAg1OFQo4CWJBm6cVFVQi9aJ5Q67aY25p3Z
 Ps7dk9OWFiDZTPUpr9PUoATPIcj1ovtFbuM4ZkIVGLACv7xkWTeE/uKdb/6pOHnpp4n4
 OeVw==
X-Gm-Message-State: AOAM533DqkGf3n6dClD3DzY9D9WyjbPV9+EMEXy/tl2z70X8z2wiqu35
 FZSKw8iP/NomWMDzP8r/ga2QlS3+Z1A/Ent5wPK2XziTgHc9/1aNr9oB08UaHzeO8b9MyvSfEuY
 +SFGkSM0GvyTv
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4544593wmh.86.1622636294990; 
 Wed, 02 Jun 2021 05:18:14 -0700 (PDT)
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4544561wmh.86.1622636294724; 
 Wed, 02 Jun 2021 05:18:14 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q20sm8208740wrf.45.2021.06.02.05.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:18:14 -0700 (PDT)
From: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 2/8] hw/pxb: Add a bypass iommu property
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-3-git-send-email-wangxingang5@huawei.com>
Message-ID: <26a8b296-15fc-65d3-d343-06b4ac380ce4@redhat.com>
Date: Wed, 2 Jun 2021 14:18:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1621914605-14724-3-git-send-email-wangxingang5@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s4ZsBHgc1Eue

Hi Xingang,

On 5/25/21 5:49 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
>
> This add a bypass_iommu property for pci_expander_bridge.
> The property can be used as:
> qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true
>
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/pci-bridge/pci_expander_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index aedded1064..7112dc3062 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -57,6 +57,7 @@ struct PXBDev {
>  
>      uint8_t bus_nr;
>      uint16_t numa_node;
> +    bool bypass_iommu;
>  };
>  
>  static PXBDev *convert_to_pxb(PCIDevice *dev)
> @@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>      bus->map_irq = pxb_map_irq_fn;
>  
>      PCI_HOST_BRIDGE(ds)->bus = bus;
> +    PCI_HOST_BRIDGE(ds)->bypass_iommu = pxb->bypass_iommu;
>  
>      pxb_register_bus(dev, bus, &local_err);
>      if (local_err) {
> @@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
>      /* Note: 0 is not a legal PXB bus number. */
>      DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>      DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> +    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  

