Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5669975lfp;
        Tue, 5 Oct 2021 23:35:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX6NBAS+i0/RwtRnXBSU3VuQenGn75zsAigGcnCsuoSsr/+3d9wiNp9Ba5+Inn6tR2W7SJ
X-Received: by 2002:a05:6902:102d:: with SMTP id x13mr1874437ybt.369.1633502154312;
        Tue, 05 Oct 2021 23:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633502154; cv=none;
        d=google.com; s=arc-20160816;
        b=CcAC875j6yhMal1Y+FIEu983mTSEpKWg1tK1E6xxE77S16+LgxqYIPYm7vRDrUsipe
         o32ISXzyGWj73N36s3Bv1jr2o5uySEo5xbBuAKV7FgyYHnDbrr75xe2cY78Y52ayNj0M
         Ltq+Mne332C6RubSU0qhnnCRW1+a0XHFMJRBCnW5FoW4Uu8Gn9R7m2OHrw3GT1tUT3/f
         5u0DhaEecDOtdd10KSx2tKPn+5r+gZz8NTuSdEAscU0KOKUMsGDcmzYO0zl+zHW9BZlx
         xKcTuZVZ6hKYSk8mUTZVqlzIgxgiUvEH5n2QSbmaNrg/vYyZ06sct9O1hPBvIESHfoSK
         z9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=86qsO2U3rknZWIAdtZEjnGQ+SFzyDz2O3N/nqARV2BI=;
        b=ZGDY4xSXpolIXFh04FLibqwxXXztfk7kzVhPC173z7O3Qq3SEqKD1qVKKNMVMRRQO2
         lcQ8Fjq+743SExI/0rcdK3UR66Fl1x4DKLbKNVvY7qw0cS+k2UFVbDuOouY3NgwvC+vV
         EdqNT9WEQyKMohfX4gyQlE3AJl+U++zwPCHk6x1/6OmrP5sAn+KYD42DeWi2h4iVvVkV
         6gNGvYHQHqgOypjZoXS4ZuZjszYQE7nNL4FgwGuIqqOGZj6v+B7eUymcJplhl/hTt89L
         MbyBLAQRewo+VRquzd75qMWiWfEGRfGcTRtJQGcb1tsh7qESg29KJX8LSUmJL1/cob1o
         8Q4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VPd9M6F2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s68si22919208ybs.181.2021.10.05.23.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 23:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VPd9M6F2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY0Wv-00059C-LN
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 02:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0WL-00058i-NR
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 02:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0WH-0002Zd-5F
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 02:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633502107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86qsO2U3rknZWIAdtZEjnGQ+SFzyDz2O3N/nqARV2BI=;
 b=VPd9M6F2BKbhS/XJum/0QCoB8Osk4EgRKxn3eB4at9d67YNyZNvpe3BlwJ/9Dlj2AwId9o
 /Kcm66WXE4h51Go0cXdUXO3uU4JNCYeHHoBmCGNN4Vquu3BuGw+rHL1F2rKZHC/XJnGLge
 txiRKBVi+0hbaCzmnqHRPFiDbDTyYH4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-OGTE-MHsMc-bEx_9k4VM3A-1; Wed, 06 Oct 2021 02:35:06 -0400
X-MC-Unique: OGTE-MHsMc-bEx_9k4VM3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso1160012wrb.4
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 23:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86qsO2U3rknZWIAdtZEjnGQ+SFzyDz2O3N/nqARV2BI=;
 b=Ax5cd+WebVDaXRe6ePBolNNuRUvZFiF7TlEN9l1+izVocrGgatfEdOC3nLoBY44kGK
 Rs4PQuWHTzt7d5tQwzrOXhmgimskNQkfsZIL40M+wet2Op4+ISRQ7t0riH2tAsm9CMdO
 7m8vsUozqWFZnd+EOABBRCu3Lx8aI/Oj5dz3L6qe8Li21JG6yi2DaYwz642rzg3TGzCK
 pJjYeZxVY/exwYyv5WR1MLPLlCn7jwa6Imq/7jYV/b4nmcPupUfFhAHKMaPp871FW1/h
 Qgp1g3GnRTwr42GAWPbvVA2NMnoIrF3vJTVA7X6vBWItPuSDXS/XY2fCOiskyoVKabu9
 pB0A==
X-Gm-Message-State: AOAM533EhLgERYRIZ6y06pTGw8ypOJIySVygaY7GHlauZ55/3V9Lk410
 +/PlDv6KX8kofKoHxtYVdk1wx/gkwWm/H2KGIvaBhPk51iY/NwpqX19EobufiNtWVVjgTB4DZ/a
 QFUAeKUQm9iTV
X-Received: by 2002:a1c:c906:: with SMTP id f6mr8174234wmb.136.1633502105291; 
 Tue, 05 Oct 2021 23:35:05 -0700 (PDT)
X-Received: by 2002:a1c:c906:: with SMTP id f6mr8174198wmb.136.1633502104997; 
 Tue, 05 Oct 2021 23:35:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a17sm4056648wmj.48.2021.10.05.23.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 23:35:04 -0700 (PDT)
Date: Wed, 6 Oct 2021 08:35:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 04/11] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
Message-ID: <20211006083503.758d7d6a@redhat.com>
In-Reply-To: <20211001173358.863017-5-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-5-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tp59p8UvxMKZ

On Fri,  1 Oct 2021 18:33:52 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
> 
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56e8fc7059..36f0261ef4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2441,6 +2441,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          hwaddr db_start = 0, db_end = 0;
>          char *resv_prop_str;
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }
> +
>          switch (vms->msi_controller) {
>          case VIRT_MSI_CTRL_NONE:
>              return;

