Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A8CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 12:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRqbF-0003ND-Va; Tue, 26 May 2026 08:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRqb9-0003MR-PD
 for qemu-arm@nongnu.org; Tue, 26 May 2026 08:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRqb3-0002Vs-O8
 for qemu-arm@nongnu.org; Tue, 26 May 2026 08:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779797358;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXhTGw/A5HoRuwnkWDJyKdHL4LFbkdXRpKilsyV9mJY=;
 b=Q8cL9lr506gDrHpc/GpXL3UCNnAfvGiJGuSAEpw0Lk4WRtA4ZMFYSWckwil09JGUt0v8OW
 MJEi9mEuIBe4rmkGTgY/P++TiauZKqilG2ysja44tJa6pxFI1iZyLUac/0Fh3TP0TYu/WC
 6baVbSZhmptUJ+8cf9JJ/EUbZckyVuc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-plBOZiDiO52iozdXC-UYgQ-1; Tue, 26 May 2026 08:09:17 -0400
X-MC-Unique: plBOZiDiO52iozdXC-UYgQ-1
X-Mimecast-MFC-AGG-ID: plBOZiDiO52iozdXC-UYgQ_1779797356
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49045243094so59462055e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 05:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779797356; x=1780402156;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXhTGw/A5HoRuwnkWDJyKdHL4LFbkdXRpKilsyV9mJY=;
 b=VUlwoWUdyrouPq7adQOQ9yAJxIFB1KocfludtMdy1JqIxAN+pF60pPlZhIOGoSsFVV
 /suis/ss2EtiW2fdsQ0KAYmIVkErcoSmt4B9OHV2Ds+QGXHGU3ZeZOLeC9jDkgVUfgvZ
 J/O6I+b6+jCid+9Ivb8B++JsHmAoix76rD6n2jkWcPXYdvQv93YCwMiYHhQ7etlu99Ni
 2IfG6FeO3M3cYKNAA3+k2TLWVBW69Kzu6DiiLaYZAUlmkjF+2mtjaB3JijCptZyNrFwV
 7ABisZteKmLAwpi4Nh1nN6SzitoenLedSoRDGL2VtOCkLynRaKBg8wnfG1LG3mjZga8E
 xZxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AEPQ6MljLIn6eplps7eAGQXLSfKPSQ2BaDBj9KG0HrtBUzOaSbKr5OlEk32nV2sCYCmoMrnRYBQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2Uu+Jw8/VdgczF7u+71xMqpRbVLbmliFL0u9X6IVf0Ta0M/sT
 YYsbaHdh+k+29HdGl2PrEvtPEawlf6oKKZWb1BFJR3SmVhn4b5kuCcJWM1b6eW1tMxhbsmBFFSk
 bGfCq8qA3euV4A3tOWmCT5WwO4o4hwI4l8ADrL/719YoOU2Y8L1mJdA==
X-Gm-Gg: Acq92OEgg7+jR+AcW5vK/fx7rCPEnNXs5kZeZtMi/lBXLH0hmx3umO8+O+Pz+pxSLWU
 xDuq8GXZYNkjC7t2kn9SWg5g3wQ8tojnruhaJCxw933z8lwUV1mDr0mjxyM3/D3Zr6tza43jHMh
 +tNy0LLmwl+bQcDSlTkdvdwuwS/kci8MBcJg+ppal8NFV1rom5wGbgPMzbVr53Zg71f1C8j/SnR
 AqJlYxjjmH5Cn8rHIKhWvUbu1wI35y1LwgrtHfnejm9lO1fOd+Epz33YzPgND6aZmrTqCP5lumc
 MRBO7EUi/8CCXaE9K+tck11ATDuuXYXJIdhC6cqBM2MIowEYx+xxXR/L/HH9CEPmycnB5IjmGjp
 uSyYFkiEznnM3X9He0vKWPy2b5f6FHJuJZXq8N5hF2cD934V4l0s19BUbRTLhGNRCdgqJyQ==
X-Received: by 2002:a05:600c:c4ab:b0:485:4eaf:eb53 with SMTP id
 5b1f17b1804b1-490426d0740mr310905735e9.19.1779797355925; 
 Tue, 26 May 2026 05:09:15 -0700 (PDT)
X-Received: by 2002:a05:600c:c4ab:b0:485:4eaf:eb53 with SMTP id
 5b1f17b1804b1-490426d0740mr310905265e9.19.1779797355521; 
 Tue, 26 May 2026 05:09:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526ca21sm316148395e9.3.2026.05.26.05.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 05:09:14 -0700 (PDT)
Message-ID: <ff0c7dda-5694-4635-a75c-5ae6b83623c5@redhat.com>
Date: Tue, 26 May 2026 14:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 31/32] hw/arm/smmuv3-accel: Enforce viommu association
 when CMDQV is active
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-32-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-32-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4OjNA5lmOAHp-e1o_A-dqeY0dbt9AiEwC1wT0o7jmxY_1779797356
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/19/26 12:37 PM, Shameer Kolothum wrote:
> When CMDQV is active, the first cold-plugged VFIO device establishes the
> viommu to host SMMUv3 association. Block its hot-unplug to preserve this
> association and the guest's boot time CMDQV configuration.
>
> Also abort at machine_done if cmdqv=on is requested but no cold-plugged
> VFIO device was present to initialize it.

To me this is still missing the "why", something along what you put in
https://lore.kernel.org/all/IA0PR12MB755515924AD70A273B7879A1AB3D2@IA0PR12MB7555.namprd12.prod.outlook.com/

Thanks

Eric
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.h |  1 +
>  hw/arm/smmuv3-accel.c | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 8cf35c2936..4d05eb100a 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -85,6 +85,7 @@ typedef struct SMMUv3AccelDevice {
>      IOMMUFDVdev *vdev;
>      QLIST_ENTRY(SMMUv3AccelDevice) next;
>      SMMUv3AccelState *s_accel;
> +    Error *unplug_blocker; /* set when CMDQV is active to block hot-unplug */
>  } SMMUv3AccelDevice;
>  
>  bool smmuv3_accel_init(SMMUv3State *s, Error **errp);
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index dbb50d1795..03575808b3 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -761,6 +761,18 @@ static bool smmuv3_accel_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
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
> +        qdev_add_unplug_blocker(DEVICE(pdev), accel_dev->unplug_blocker);
> +    }
>  done:
>      accel_dev->hiodi = hiodi;
>      accel_dev->s_accel = s->s_accel;
> @@ -1088,6 +1100,12 @@ static void smmuv3_machine_done(Notifier *notifier, void *data)
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
>  bool smmuv3_accel_init(SMMUv3State *s, Error **errp)


