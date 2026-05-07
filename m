Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DA4CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 17:36:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL2eH-0005Em-NS; Thu, 07 May 2026 13:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL2eH-0005EL-3M
 for qemu-arm@nongnu.org; Thu, 07 May 2026 13:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wL2eF-0006Sd-Ay
 for qemu-arm@nongnu.org; Thu, 07 May 2026 13:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778175390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFfb8ukSxjrvab437Ml3VXB4JIB0eoMU0nLv+cfuzAI=;
 b=VnVx3giX6bBC6Ha0CLFkLWXQxzAdLw+8/xNyKAPCTCi4r3GvEnRcj9uNxBz/+zwuMQSZCM
 inr6XF/+ILu1i4ZH1r/HdbpeIMYGQgo6xvFEU4vyfvcrLr3zs0x00iIr517ZyPkBQVIcE5
 tpIZGwutggRJB6AVDD6bJ+Gx0A02QJs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-OeaFbHj8NjOiP3KgMWb-Pg-1; Thu, 07 May 2026 13:36:29 -0400
X-MC-Unique: OeaFbHj8NjOiP3KgMWb-Pg-1
X-Mimecast-MFC-AGG-ID: OeaFbHj8NjOiP3KgMWb-Pg_1778175388
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48d046fac74so6330075e9.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 10:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778175388; x=1778780188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFfb8ukSxjrvab437Ml3VXB4JIB0eoMU0nLv+cfuzAI=;
 b=iZGKNvbN2XiSFbfoI3Ggy/KIZDPwBx+5D81/exwzyIjjOIWOMbBoUs+qrwlgvJkJkf
 8TF/FVwnhRQn13dk80WsKhgSxHXHrHTmVwRxuiK3LX4ZISe/mL2pzW+fML446MV0G1z4
 UjL9ga8uM76LUnZX/fGKjOD3bRf41QEWacr6l7KbMX/fnrAQKZ0SCpEBBQZDSFIiVZI4
 nik14mvv3quF9YKeYoHYlm0GsbmUjSlW0P24Nfeyq/dHPmFAEV9Bu4WVPYD1oiXsCZsT
 QvB/au0N1ALP8YfzCNYXplKSbU+fnYBpJedpsdDzcS8dozB7otNqOFe2a9dddXZ5w75f
 ZiSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mQ1+oZawtUNHY75WP8PwEONiM7uhxMuMFqHFbfDU2Hyw2WE77aSxb69x5E215bAkZX48+G8QPbA==@nongnu.org
X-Gm-Message-State: AOJu0Yy97tZKKGQafYOSbRkmkSmp82rDVXQyAdDq5aRoNEqKeV8X2LEC
 uxbcDpncB1PkFzEy6Gn3m2P5xOOqEhhQbEySSdRtzqkH9LoeXfUvtNpKXTE6D+3b6lxYBnPNlrY
 cGXiQJYs2grMl2UZtHDUIJ3ixrV0jhn2scMUToPQFM35hnMipMmzjPA==
X-Gm-Gg: AeBDiescTmNK3Cs4hmwP9kg4j57BKhb1nq6RtFAG0ntsEZ3CXf9/LvX6pIaYRfDFc1g
 TW7csWG2yx+bXqLYvmgOOr9NcESrcB9CqxIGlgr3KqKkwUMhohHfMAo08R7cM11T/V7kq4xZNrw
 EEoj77+sbQkaWzi3Ac/QQH0v0nGwpMvDUucTrlUi0f2zu4TYm2T4D/x2pk9Q/IytgRJ6aA5Vq4v
 ILFSiR5kt8nd0I4QlLtzPOu8P0Log0E0Px7Q32/Bj953gxRYl7GYVSiRdnD8QdCDbdow+ANJ2gB
 YCjV8m3yr71pI83T1kziQnxSEUDojoIZwFYAoJM17cwgvdmVfC+2Wh2lQsAKQe+P0bEtx/HodCI
 Ggt6O4WEdz/iXtnmh3C70In9mkw5uQPPiK60jKU+D/adKSAcnU7gYDhz1ae1r0/syj2+O6w==
X-Received: by 2002:a05:600c:b8a:b0:48a:5333:811e with SMTP id
 5b1f17b1804b1-48e51f2f91cmr140833115e9.15.1778175387817; 
 Thu, 07 May 2026 10:36:27 -0700 (PDT)
X-Received: by 2002:a05:600c:b8a:b0:48a:5333:811e with SMTP id
 5b1f17b1804b1-48e51f2f91cmr140832705e9.15.1778175387337; 
 Thu, 07 May 2026 10:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538b6e9bsm232490925e9.10.2026.05.07.10.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 10:36:26 -0700 (PDT)
Message-ID: <ff92645d-4501-4881-8ca2-47299968f0ca@redhat.com>
Date: Thu, 7 May 2026 19:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/31] hw/arm/smmuv3-accel: Enforce viommu association
 when CMDQV is active
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhenzhong.duan@intel.com,
 kjaju@nvidia.com, phrdina@redhat.com
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-31-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260415105552.622421-31-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z4Mr3pFvh2H8uGPLYSolX4AbrQNwrzhoTt7W-ngc2Dk_1778175388
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 4/15/26 12:55 PM, Shameer Kolothum wrote:
> When CMDQV is active, the first cold-plugged VFIO device establishes the
> viommu to host SMMUv3 association. Block its hot-unplug to preserve this
> association and the guest's boot time CMDQV configuration.
>
> Also abort at machine_done if cmdqv=on is requested but no cold-plugged
> VFIO device was present to initialize it.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.h |  1 +
>  hw/arm/smmuv3-accel.c | 12 ++++++++++++
>  hw/arm/smmuv3.c       |  6 ++++++
>  3 files changed, 19 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 3ed94ed05c..c4441d5b3f 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -65,6 +65,7 @@ typedef struct SMMUv3AccelDevice {
>      IOMMUFDVdev *vdev;
>      QLIST_ENTRY(SMMUv3AccelDevice) next;
>      SMMUv3AccelState *s_accel;
> +    Error *unplug_blocker; /* set when CMDQV is active to block hot-unplug */
>  } SMMUv3AccelDevice;
>  
>  bool smmuv3_accel_init(SMMUv3State *s, Error **errp);
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index a58815ded2..f381702a08 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -754,6 +754,18 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
>          return false;
>      }
>  
> +    /*
> +     * CMDQV is active: block hot-unplug of the device that established the
> +     * viommu association. Removing it would cause the vIOMMU to host SMMUv3
> +     * association be changed via device hot-plug.
> +     */
> +    if (s->s_accel->cmdqv_ops) {
> +        PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
> +        error_setg(&accel_dev->unplug_blocker,
> +                   "CMDQV is active: removing the device that established the "
> +                   "viommu association would break the guest CMDQV");
It is something that is planned to be fixed later on?

can you provide more details about the nature of the breakage

Thanks

Eric
> +        qdev_add_unplug_blocker(DEVICE(pdev), accel_dev->unplug_blocker);
> +    }
>  done:
>      accel_dev->idev = idev;
>      accel_dev->s_accel = s->s_accel;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 1d6fdd776c..c9ff6298f5 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2020,6 +2020,12 @@ static void smmuv3_machine_done(Notifier *notifier, void *data)
>                       "at least one cold-plugged VFIO device");
>          exit(1);
>      }
> +
> +    if (s->cmdqv == ON_OFF_AUTO_ON && !accel->cmdqv) {
> +        error_report("arm-smmuv3 cmdqv=on requires at least one cold-plugged "
> +                     "VFIO device");
> +        exit(1);
> +    }
>  }
>  
>  static void smmu_realize(DeviceState *d, Error **errp)


