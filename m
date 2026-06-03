Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E50CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 06:15:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUesk-0001Zp-KD; Wed, 03 Jun 2026 02:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wUesi-0001Ye-Mm
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 02:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wUesh-0001YN-3q
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 02:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780467308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zccXtAWB8UPN48DJU9mIQZiKPbVR+iNHeUU+BbcJqrY=;
 b=ESzWf1rPf2SGOysVM2ud96PF3D/k87xYRhXkmw6L8toAUlHJx4p5h6uyNjn4WWsloeQJiD
 TC39767i7v5TKIb03tOMNI7U8wyOXN1x4vDfIlZ9VRiaGm9jkqqO+T28LzMBZlru3xwraO
 5m4H7iURJoj0Z1IZaZnuvsRqFlK52bI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-ugx0xCy-OF63Em_2QXSfAA-1; Wed, 03 Jun 2026 02:15:07 -0400
X-MC-Unique: ugx0xCy-OF63Em_2QXSfAA-1
X-Mimecast-MFC-AGG-ID: ugx0xCy-OF63Em_2QXSfAA_1780467306
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b71db390so2306235e9.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 23:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780467306; x=1781072106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zccXtAWB8UPN48DJU9mIQZiKPbVR+iNHeUU+BbcJqrY=;
 b=gLGy4jEN5cP8qz1oQFomHLatTpdhk8hkKv0137AF4gXGv+rwsoh52HpvAGJIc+Cvai
 Ryiz3oVpiQLSh/vEviMDeXjUK/HMwBoorsamFOHnEg8xY/YDhw/EpCVVAhBEx3KitEcv
 CcMbWPX30OEU+fJJypyT7y1S32jA8SkRxYX1c+DJCxSCHj0OcT62NyHOGjcL/yb/wJxG
 JRKCB1krTI8DAtyTNx6RNSiVf1su4xp/dM/Zgw+zImsIHCngxnnK7WSVxxlbCvYupLYu
 FXUIEYcADyjqLb4Si5oxsDt5HXZTQEtEPts71D9QXMeZOCc1S+fPR6pUGIosp6UtsK3f
 nuHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ92Sern12gJmYcf9vfpMTLAOSAahBSxEcH1BMtvg+oU+WvdbjdoBBqSOBavpYNKiPXdm3Z3gUmk+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwB49/GkQMA+Xi9b8ToGzlZhKUcOrEEzT5dT1jsModR5S3h7xrS
 mb99dzpop9/SxC+qPHa/namgHHPZPbGuSbobWPpUNqRvGCmrvixF0NpS5xfscVsEsaHZ4pXa84j
 kimEU3XzyjdSNyTEvnmOgeK7cItK+AI6wDrnZJHs4UKoYhP+RDWQC0w==
X-Gm-Gg: Acq92OEoam+dUP3PqJTlRCe5Y5xU7Xnio2Tk0mir6aIsmzqIJ6uODHx8rrUwQaVxuVq
 YoYm57OWlXuroP32ygo+qbTyeoqTBxd7fjJtvbOkHoqanKsFPsarazIZUrtOAN8bvWFnwtLrVqM
 7JNwVcJJy0g4fYrYUk+ZPndXIHmtSi9JFnzxNj3+RanVdrasdnoCSLcbPOZ4O0eS2UE/CDoq0tQ
 Iwisey7a90xtIss1wff2nBk1d0SqMQUtVD5jI+lIT9IKgM95w++w6ZKZkfilJBSFz6VFXcBt8v0
 Uydpvv34CqIIUqwHB6hfyjQ8uQ8RG1rce7M0dmvMDYmq4TfX13gTf6CJR+pkvFAoxEN6fqom5Up
 knzYMQ12IpvabwMygbTERPwLJ1XMWQC1NwsJFuy3BL3lwYPd8q13Bmg==
X-Received: by 2002:a05:600c:c163:b0:490:b5d0:598e with SMTP id
 5b1f17b1804b1-490b5fe9575mr28740915e9.21.1780467306093; 
 Tue, 02 Jun 2026 23:15:06 -0700 (PDT)
X-Received: by 2002:a05:600c:c163:b0:490:b5d0:598e with SMTP id
 5b1f17b1804b1-490b5fe9575mr28740345e9.21.1780467305636; 
 Tue, 02 Jun 2026 23:15:05 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b616fdffsm30662945e9.8.2026.06.02.23.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 23:15:05 -0700 (PDT)
Date: Wed, 3 Jun 2026 02:15:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 philmd@linaro.org, zhao1.liu@intel.com, rad@semihalf.com,
 leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 07/21] arm: sbsa_gwdt: fixup default "clock-frequency"
Message-ID: <20260603021313-mutt-send-email-mst@kernel.org>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-8-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260303092532.2410177-8-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QByWIoBiTfKMx1ayGl4hs8wuVW1QSi3CasUlTJGMEEY_1780467306
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Mar 03, 2026 at 10:25:18AM +0100, Igor Mammedov wrote:
> Comment about keeping legacy freq, is wrong to begin with
> (should be 62.5MHz), but that value also doesn't make
> sense anymore as the watchdog is used only by un-versioned
> SBSA board and the later has hard-coded it to 1GHz.
> 
> Other potential user (arm/virt) also has system clock at 1GHz.
> 
> Drop misleading comment about legacy and set default to 1GHz
> to match both boards.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>


if I take this in isolation then make check seems to fail
on qemu:qtest-arm/aspeed_smc-test.

follow up patches fix it, but I think it has to be reordered
to avoid breaking bisect.



> ---
>  hw/watchdog/sbsa_gwdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index 7ade5c6f18..b739a3ce3c 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -264,11 +264,10 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
>  static const Property wdt_sbsa_gwdt_props[] = {
>      /*
>       * Timer frequency in Hz. This must match the frequency used by
> -     * the CPU's generic timer. Default 62.5Hz matches QEMU's legacy
> -     * CPU timer frequency default.
> +     * the CPU's generic timer.
>       */
>      DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
> -                       62500000),
> +                       1000000000),
>  };
>  
>  static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
> -- 
> 2.47.3


