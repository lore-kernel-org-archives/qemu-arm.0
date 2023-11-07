Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp625621ejv;
        Tue, 7 Nov 2023 14:26:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGS7SUesNIrAFeKUkiy05IX8G90T5XsUk7jfi++QNj/vmBEhViyjrWZ7pZcegXFlPR1xEnS
X-Received: by 2002:a05:622a:1744:b0:41e:245a:2cfc with SMTP id l4-20020a05622a174400b0041e245a2cfcmr245051qtk.50.1699395978280;
        Tue, 07 Nov 2023 14:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699395978; cv=none;
        d=google.com; s=arc-20160816;
        b=TzwaJfnNFyWRw3nFEEpOEFRQxYYL02/kXb4b4oNHwMokNKh3lWiI3ikmED0qEh0gua
         H3qhsH0CQbNzYsBIFTCZcJzvzL2TKvxoUr+sgqumaQfp7NYPzsrxAAB+l6OHSMyXbvDO
         EtSRrteYadoJ0xDretZ6lN33rzWSBiGIE/YfyaZl8S6rjC/fMyR+1RDjEBsHePGc2w3a
         X/iPpfq071HydMHnmGVhaKW5J8hhKOfU7M63M2UZDPsv9Hc8LX1O308B3I4nO38i0lBg
         HHidBgeJP3bvS8GsUacgmXYh1KAfxcc+WHavoALxUH3J5KsdSXyLc8KsP2YTdCCOpS8G
         r8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=i8BZbHHgDz5jztDu9QnWXeAir+idmimc5mAg0ZJ0HNY=;
        fh=wPP7SnAygldt1W8pzjzzxJOl0EL7nbOEkCj77zv3jMs=;
        b=xX/2zhWwkc4sLN3DbJN7CW8VdSxKfw6efdoC1urR2280GYAhx0HjIN3sLo+c5Z52qy
         ExBh8MMys1xti/7GlADKqJEDJ2MfriAyXESqNxQvVkwupeCnZbO1xKk9PSrYu6L8c7dz
         hWdVLBcyEwOaZYa7qrHRy4UB5m+dmT/eXcXfL5+7Yc+Am9MrUjEr0cxg+5TNrW8JHEPh
         q4KYW1MeKng88+bqMwLm58Qvlo6s5yhy2KN2Ri3eAVUKvXSQ1Rn18PY1j4Ea6BBD1VeQ
         81nNCAiipKH/2BcAchFYQIXs4VwbjtbfoOYJRl4Pb0tfS7NMjgdEAeMGVsMwg41uCyc1
         1koQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VvAzkGYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05622a065200b0041eae06bef8si520694qtb.496.2023.11.07.14.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 14:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VvAzkGYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0UW2-0007uo-K3; Tue, 07 Nov 2023 17:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r0UVm-0007tZ-Am
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 17:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r0UVk-0006ko-Pu
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 17:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699395927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i8BZbHHgDz5jztDu9QnWXeAir+idmimc5mAg0ZJ0HNY=;
 b=VvAzkGYLz56ATZebKykZLXknz/Mn1jr+MpoYvQowVByluQkyrAzRo0Ik9iigEU046MbUn3
 5BK3108itDB9QpUF6CeA4mkGZSt1A9Ior1Vr4RjCUqPT5wSe0vpx0VZUVA4yLiza2tRDyX
 jWR8F42N/casEydyjBZPjQL9Cgo4tAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-aLg3Kb3sN76IZzvLMCaPsw-1; Tue, 07 Nov 2023 17:25:26 -0500
X-MC-Unique: aLg3Kb3sN76IZzvLMCaPsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32f8371247fso3121466f8f.2
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 14:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699395925; x=1700000725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i8BZbHHgDz5jztDu9QnWXeAir+idmimc5mAg0ZJ0HNY=;
 b=eY3eL9079sfn5ickj3kIypGkpmpYxaQNB4vwtkKLEsUY44UYg0v8sfp2sYiP6ioZzb
 f2rHBjgMVIfKkx3qP+NCsROLUejM2nLcR20kxGL5fU6Okx+Z8IMKbwhwqVJbZZJJrJvc
 hJWs/PpEJRcHhnJEGSTyzXAw2bGbgVRwvfkkRROLpuVq19sbVplmLnst4+sdWXxlNsA3
 f5p8IEZ9hF1rC1u1swVRZziwCIvKaLc+5bz4MJ+LbJncXt1b5qAyx/yfX0TKVkz46cY2
 9uogATAxTzhJkW2rKdcLBvamETMSXjuczCNatvOOMHn7qE3sDFz1PTfdmspuUYeJPK9p
 HWhw==
X-Gm-Message-State: AOJu0YxqG0CL0N01e1pgp8+SuoKqxTPbheiH2iQ3WqBtILGCuxqQLLHU
 eSgB/4EGzJ5l5KhQy/6CRAIANW9jac31mDufx9pwGB9cpu+XoFH96bztZvWeVVef0VT5bC6pxL6
 9d/iDpBzOa0ai
X-Received: by 2002:a5d:5281:0:b0:32f:a5af:99ca with SMTP id
 c1-20020a5d5281000000b0032fa5af99camr60948wrv.69.1699395925061; 
 Tue, 07 Nov 2023 14:25:25 -0800 (PST)
X-Received: by 2002:a5d:5281:0:b0:32f:a5af:99ca with SMTP id
 c1-20020a5d5281000000b0032fa5af99camr60921wrv.69.1699395924767; 
 Tue, 07 Nov 2023 14:25:24 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f4:206a:ec71:ae4a:c04f:d4f2])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4011000000b0032da87e32e2sm3412999wrp.4.2023.11.07.14.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:25:23 -0800 (PST)
Date: Tue, 7 Nov 2023 17:25:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, alex.williamson@redhat.com, clg@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, ani@anisinha.ca,
 berrange@redhat.com, eduardo@habkost.net, imammedo@redhat.com,
 eblake@redhat.com, armbru@redhat.com, david@redhat.com,
 gshan@redhat.com, Jonathan.Cameron@huawei.com, aniketa@nvidia.com,
 cjia@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 vsethi@nvidia.com, acurrid@nvidia.com, dnigam@nvidia.com,
 udhoke@nvidia.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20231107172318-mutt-send-email-mst@kernel.org>
References: <20231107190039.19434-1-ankita@nvidia.com>
 <20231107190039.19434-3-ankita@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231107190039.19434-3-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H/5b0whTgIRp

On Wed, Nov 08, 2023 at 12:30:39AM +0530, ankita@nvidia.com wrote:
> +        for (l = gi->nodelist; l; l = l->next) {
> +            PCIDeviceHandle dev_handle = {0};
> +            PCIDevice *pci_dev = PCI_DEVICE(o);
> +            dev_handle.bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
> +                                                       pci_dev->devfn);
> +            build_srat_generic_pci_initiator_affinity(table_data,
> +                                                      l->value, &dev_handle);
> +        }
> +    }

if you never initialize segment then I don't see why have it.
It's just the bdf, just pass that as parameter no need for a struct.

-- 
MST

