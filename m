Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CC3C87FD3
	for <qemu-arm@archiver.kernel.org>; Wed,  6 Aug 2025 12:54:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujdeg-0003pU-KB; Wed, 06 Aug 2025 08:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ujdcY-00024o-8T
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 08:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ujdcV-0005eD-Dh
 for qemu-arm@nongnu.org; Wed, 06 Aug 2025 08:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754484709;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YuUqgpXkbfQmUNwcuuyFyjahQwng9IDgxtlUsAQd7ZA=;
 b=GEWkkqbCMuusSoftX75iI4Xi97VJM88xk90mARnXfxlVWAdpKPIAWg3qiJgFnyLXGyZAZg
 FinWicJxJoZC1a/71XAKKpEqvfxoAXFzz8oug78XV/iZNkd5ZXTvdmlYkYSJmtf679Djs3
 wU52zgXtL5PWfmMMzBd0LBUSGVN0bWU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-8MzpUuDIOQi2h5_qVGp_vg-1; Wed, 06 Aug 2025 08:51:46 -0400
X-MC-Unique: 8MzpUuDIOQi2h5_qVGp_vg-1
X-Mimecast-MFC-AGG-ID: 8MzpUuDIOQi2h5_qVGp_vg_1754484705
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b7891afb31so3524460f8f.2
 for <qemu-arm@nongnu.org>; Wed, 06 Aug 2025 05:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754484705; x=1755089505;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YuUqgpXkbfQmUNwcuuyFyjahQwng9IDgxtlUsAQd7ZA=;
 b=K8FcBzIiMmUZR6pASvjPsfcNJ82KY9Va8Zgla+qGdb7XrkzqQfvIYPl5OS/bc2E0ZX
 FLQ6yB6F9Xhb78ro6FsYaeNC2tGM2VWDsm+ovnS3YvLsEVIRaN4fHqaXKeyIY0YjozDy
 PXtDDcvDl3ZVoln1EAJIOpawl2P9RpcU8qJ6jlrmnfwwETuOioF4F96fail1xienUf2B
 0+JJxAUdCh0VxpC5Yo8/qK7/e69c2sAJlG1unt/Kx2rKh4OIFHrGtpyQW976Rxkw+oi5
 Eday0wfzT/AM8csu9vex+THeMm9746c6grFoA3AfRrzNeBNVLa2W0i/w8GPhAvDpHDIm
 Rn6w==
X-Gm-Message-State: AOJu0Yy9BtgU0AURF0XsuXU7n9Q7Uw0sEh9uF5IGDFPZk8Ft36h+JXux
 VGMFZatN01GzYXCDYC8YlhZtMarsC/QqXLa7HopF4GQRsqIY01Cs2tuxdDcLyb1XRDapycYUwxV
 HjslvRLtRTiTZvYgFwVsqYKjei4cPqyDHgLJmffj1xw4KeRpmW6LdLg==
X-Gm-Gg: ASbGncski1+7PzlFReEQ1X49CwnW22SFmwUho185nC0PFs6YkA3eposHiwKvsCEF00O
 8v5328Vt1oaVFdx49HGLUQJ9A1sdWX/bG16xX0JiPOXss4ca6xqxGgTccasuH3B5NAjnkqWVBLo
 FbhFal06xTbdmdmLyN84ODBVO194DScLlDlxcUph4Nxvz4CivaQHbt/40Wq6BasLRHjaKQoZ5kN
 M785FXeVWdXSfeEHiVr9svTFjZOKxcVpSB1wsZCfD0npTnx8hQ7rOM7JuJv0G5Qa8PLa/3UlzTT
 4YTIufRdPgI1avqaeTSJhVuZtlZ7IZv+PUZfsNoJQ611
X-Received: by 2002:a5d:64c7:0:b0:3b7:9350:44d4 with SMTP id
 ffacd0b85a97d-3b8f48cd130mr2023568f8f.11.1754484704924; 
 Wed, 06 Aug 2025 05:51:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oXlK9a92qIBV/Yb3ISOQjkWX+9UQFeAczkBCJm9a2F7YQEZppPlpCOvr4pgWURcW+VaPHA==
X-Received: by 2002:a5d:64c7:0:b0:3b7:9350:44d4 with SMTP id
 ffacd0b85a97d-3b8f48cd130mr2023546f8f.11.1754484704489; 
 Wed, 06 Aug 2025 05:51:44 -0700 (PDT)
Received: from [192.168.43.95] ([37.166.28.57])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c470102sm22785068f8f.53.2025.08.06.05.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 05:51:43 -0700 (PDT)
Message-ID: <22bb66b6-998c-4cb9-a16b-386ff88bb197@redhat.com>
Date: Wed, 6 Aug 2025 14:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.2 0/4] vfio: Remove 'vfio-platform'
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20250731121947.1346927-1-clg@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250731121947.1346927-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8RYPP4Tj3t_pB-c5K7pfEoRkgQPh7DZB6FipriqetNw_1754484705
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Cédric,

On 7/31/25 2:19 PM, Cédric Le Goater wrote:
> Hello, 
>
> The VFIO_PLATFORM device type has been deprecated in the QEMU 10.0
> timeframe. QEMU 10.2 is the time for removal.
>
> The last patch moves vfio-region.h under hw/vfio since it no longer
> needs to be a public VFIO interface.
"tout ça... pour ça!" as we say in french ;-)

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> Thanks,
>
> C.
>
>
> Cédric Le Goater (4):
>   vfio: Remove 'vfio-amd-xgbe' device
>   vfio: Remove 'vfio-calxeda-xgmac' device
>   vfio: Remove 'vfio-platform'
>   vfio: Move vfio-region.h under hw/vfio/
>
>  docs/about/deprecated.rst             |  25 -
>  docs/about/removed-features.rst       |  25 +
>  docs/devel/kconfig.rst                |   2 -
>  {include/hw => hw}/vfio/vfio-region.h |   0
>  include/hw/vfio/vfio-amd-xgbe.h       |  46 --
>  include/hw/vfio/vfio-calxeda-xgmac.h  |  43 --
>  include/hw/vfio/vfio-device.h         |   2 +-
>  include/hw/vfio/vfio-platform.h       |  78 ---
>  hw/arm/virt.c                         |   5 -
>  hw/core/sysbus-fdt.c                  | 383 --------------
>  hw/vfio/amd-xgbe.c                    |  61 ---
>  hw/vfio/calxeda-xgmac.c               |  61 ---
>  hw/vfio/platform.c                    | 716 --------------------------
>  hw/arm/Kconfig                        |   3 -
>  hw/vfio/Kconfig                       |  16 -
>  hw/vfio/meson.build                   |   3 -
>  hw/vfio/trace-events                  |  11 -
>  17 files changed, 26 insertions(+), 1454 deletions(-)
>  rename {include/hw => hw}/vfio/vfio-region.h (100%)
>  delete mode 100644 include/hw/vfio/vfio-amd-xgbe.h
>  delete mode 100644 include/hw/vfio/vfio-calxeda-xgmac.h
>  delete mode 100644 include/hw/vfio/vfio-platform.h
>  delete mode 100644 hw/vfio/amd-xgbe.c
>  delete mode 100644 hw/vfio/calxeda-xgmac.c
>  delete mode 100644 hw/vfio/platform.c
>


