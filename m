Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1092455lfp;
        Thu, 16 Sep 2021 05:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygZbUChpe8s9UG++Wpwk7MDnH40v3hAqp4C2PYENURvJ0fIbIs0OB1SqyJ1eMA2xiTiEHW
X-Received: by 2002:ac8:4654:: with SMTP id f20mr4847358qto.386.1631796664896;
        Thu, 16 Sep 2021 05:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631796664; cv=none;
        d=google.com; s=arc-20160816;
        b=QXvFqlrTH0waHtFJP48ACHrYLndFiDpnURkCeOciJB22j+92MIroZl+UNL1xcN/Y1V
         sbT/6MM/diH0/u6lAWUHnaXPyxeTJShT0CCWJWwRrxNEU2xZL27ZXGqh/yTw+jEzBDs2
         icc8Xg952q4HdiOXd3qwesGDCy8KCvmMsQnirbCceYn5Yov58JkVJPdd01nH4Q2Tq0ie
         I9TNGJwZP28b/fSkqXp1pTV/GUDm0XJzXjJ8fMiuclgCCxGNgWpt+BcV1xb6b2oxAXop
         6xw1tw+56Fnj3v9c48M7K6RuCgT7b8XOZ35lE8tPO0GnY8kpsYZxS5lYPVF7TZLLU7gL
         tGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LLAO5ENOgWdaDWrFt1uFZvt4Uis2tSuoHxip8axgiGs=;
        b=kmohUx6sdBmXZgtaCQ8rQ9AofSqhldijVzDBTxwjWArHuP48nnTeIsD274d1U2Xra5
         im2ycPNtVOgOsTb5AEMvTUVr4O60mkF+ElGMH5IA5fM1ihW47Or5TOGR44QqNM/20oI5
         CJHNtgqb0HUinHK8fwa0zySI5usWJr1rWXWFeae/XE7z1Gr5gW0mTr8yNk8lydANi+ki
         afzWq6rc6emrRuSFec/bBCJUACSXkSZzdH0ZEO79l1j/EcI12XeK0jPxCuvroVgSl8b1
         TlR3F9z+2Vtrf4OX8m0FCaXqo+fByX42k08QlxOUaUB/QDDZyofLsy2HbG2s1Y6Q68pj
         etuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hyv8C7Mr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si1824545qvl.70.2021.09.16.05.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hyv8C7Mr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqr2-0005QX-Cq
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQqlR-0008DH-Ls
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQqlQ-00023o-2s
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631796315;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLAO5ENOgWdaDWrFt1uFZvt4Uis2tSuoHxip8axgiGs=;
 b=hyv8C7MrnNKc2DX4oQrNBCOASkR1WEo/Z1L4zmx5gbzXN3BZwGYzI3lbzsKjoPBft3W7O6
 rE51skShrUg6hK5ky7AijgafMhnFoZYnvk5d8sTaEGPWpdvuaZw6wljijMICN+1B614Adt
 oweuV9Eb/3XuO3zAjZSufO66ySQLcnk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-HQPPmEeNMAmf0vvPEBPYJw-1; Thu, 16 Sep 2021 08:45:13 -0400
X-MC-Unique: HQPPmEeNMAmf0vvPEBPYJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso2391499wra.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LLAO5ENOgWdaDWrFt1uFZvt4Uis2tSuoHxip8axgiGs=;
 b=KpjXH8kTz5uoEtCzu3wwo2sW88GHAhU9usItAE2fbOq6hXjWYJmAkO/kPC5FjZBWXD
 felLVTc53WPaBKuRv16zsVWivVAqCKU5gBdmeCqhDZnAtZxXmTrkHA9Xi1t3JBVsTa+9
 yvWdFYbEfqY0o2+gP5uJPEeYtev7GG7HtRMdi4MJtZN+cZOIf+oj371ONiqDDWh9HzPM
 GoqLGWYW352r2qxl+D2WNqwtpPKfoLSan1XTWbMMU3+8PNVkbIHTt/5Ewg7RkUHxg9X8
 3+dk1NBNTOV0faxETCVBvKk898tan9Db/PyjOfGVwwmSPe/BXdtmHXBw65TqgkCTWIuN
 bXAg==
X-Gm-Message-State: AOAM531H+pZUdOITYNAGW1FlInEh03uc7Z1kVVUzYz8w3yyLS9G/rvKO
 CL5H7vnqjOkD/IgxS7+XnUlHLvwU5n+jqGV6HbLYpnOCUsKz1PsiBkdJn6JfYZH5BrNzsmH8XQE
 H/AvB4N21xQT+bD4=
X-Received: by 2002:adf:b789:: with SMTP id s9mr5863626wre.315.1631796312768; 
 Thu, 16 Sep 2021 05:45:12 -0700 (PDT)
X-Received: by 2002:adf:b789:: with SMTP id s9mr5863611wre.315.1631796312639; 
 Thu, 16 Sep 2021 05:45:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q11sm7537382wmc.41.2021.09.16.05.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 05:45:12 -0700 (PDT)
Subject: Re: [PATCH v3 04/10] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4f7dd188-ada5-8750-8396-ff294f526c41@redhat.com>
Date: Thu, 16 Sep 2021 14:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914142004.2433568-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SIQQcn3Sk5Ux

Hi Jean,

On 9/14/21 4:19 PM, Jean-Philippe Brucker wrote:
> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
>
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f238766aa1..26069f943a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2471,6 +2471,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }
> +
>          vms->iommu = VIRT_IOMMU_VIRTIO;
>          vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>          create_virtio_iommu_dt_bindings(vms);

