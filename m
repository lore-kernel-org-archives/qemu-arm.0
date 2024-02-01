Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp81362ejb;
        Thu, 1 Feb 2024 00:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRE53q2kdvoY/8N9zdPJgNqU8ta/sxNYcgLHfqEoBk5MlMJDCiJfO8h9qmyMp6CUIk+B2z
X-Received: by 2002:ac8:578d:0:b0:42b:f5f2:e51a with SMTP id v13-20020ac8578d000000b0042bf5f2e51amr1108516qta.1.1706776076765;
        Thu, 01 Feb 2024 00:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776076; cv=none;
        d=google.com; s=arc-20160816;
        b=YxbUw6qqIM1ZAox/5gQwYc2bR/uxTKlfDi5kjfmf5ZwV4ZF3TppCMjVgbA6FjKNd2C
         /655ATqyTmOjNBZsQ9CknNVCNiAXOfp74nU9Yqr+g2LOQzJUB2h+R4QDFMBe0ZqwIvPY
         Vv5Jx9MZNQV4bIuAlLuTn77P3lyHtjievHeZK/Bqzwx3Bk4uAT1KJvUOal6TMteaSSas
         lhBbfyMfs3tknQzAzM9MvyOPfkhIOB4SsHyRKCIOJ3sGxLHCpn6wJM0RFqXFaq1+E7Im
         N737paiztMI9WC/xO/DXwHgrtJlzGX36JSKsBI1fsGSvik3XcrrCKFSPF8x6OsPlhSRl
         d7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=1xFOKoyViCynflcPTxEr3N5J0E8aq3T7eZIHwIU8IqU=;
        fh=FQ3HxwH9XAvvogNyoKYnpQwZZHqJwqi94AZVsuWuuRo=;
        b=SukLWZzpKTQi8ddq0Xc+eS3SKVUv3XaS8eKz7739FqN0Yx22Zs+5Lzdz2yTjniGQKp
         qMhgdpOptYsR5Qo4lpz+6ll4hSFu9uYZXOj4kcoMp3y4X2e6/BlrjGBW27CE/zgOVWSz
         yBNC3qHgPzbs0c8jhUTpLaiiQsF3y23Iw/VFoT6pgFPgcks6J+KgezRq9YeqaKk+ZR9Y
         wPnUHkEQKbwGH75qGlWXcfjiLWALnrrVlH9RGjisIM5ugBW3XX2PDsb5sDnWdWy+p5H5
         uvzmA5Syfc3WoHkFSiBQ+blK9gfDfdTMbs5Mif9h9Rn9mfVOkWLu0EC/kiOnKtt6mV3A
         xMYw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Oi+ZnvYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
X-Forwarded-Encrypted: i=0; AJvYcCXnuHyBu8bNCJH9EiqLG5NfAPx3wj06OQ7JJToHtAeELZoWbsYdsULoV+YpnWKjbEDHdGJU+2GG0inmbYHswaJJW8o5oDQQ
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05622a024a00b0042bf934f6b0si146553qtx.59.2024.02.01.00.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Oi+ZnvYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSPx-0005Lp-7a; Thu, 01 Feb 2024 03:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPp-0005G2-87; Thu, 01 Feb 2024 03:27:21 -0500
Received: from mgamail.intel.com ([134.134.136.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rVSPn-0005Dg-DH; Thu, 01 Feb 2024 03:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706776039; x=1738312039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cw0XwMQ7P8HJWvfLE6CEEEsJ06d31lg0BwhS5QXI9TU=;
 b=Oi+ZnvYuxqajGv70GnCnL5pjcuZW3tot6ZTkH61Gnh4GuYiZiceOOh2P
 n7dUk/DAIJ7ENU1P1GJFSCW5UDG7SgyvC6aOiUQxWuUH3KNbTb5XeFAXB
 PP/5GCFWt3hEbO1Qf+Gevprsg2aE8yPkevb5p7pYilFRwqgRbn3jcZeyg
 O/0HS1jwzX8xNm4SlGrI/i1sbb2QON9MpjtYaOZB6roegCWEEsrSTpX5h
 wSntUaKzevPUbakvzc+XPI4ZjbrPi7TftZwD7lu5LwJJLNpyQFkmPnH/R
 xPGafA6L6aPj0aTmZXF5aDk5seDxBA2W4oxx7g41qLzK1c8M2Nf7zCwm/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468077692"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468077692"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 00:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4348372"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa003.fm.intel.com with ESMTP; 01 Feb 2024 00:27:04 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 0/4] Consolidate the use of device_class_set_parent_realize()
Date: Thu,  1 Feb 2024 16:40:23 +0800
Message-Id: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-TUID: NJeg7yMmhkyP

From: Zhao Liu <zhao1.liu@intel.com>

Hi list,

Now we already have the device_class_set_parent_realize() to set
parent realize(), thus clean up the places where that helper was
forgotten.

Regards,
Zhao
---
Zhao Liu (4):
  hw/isa/vt82c686: Consolidate the use of
    device_class_set_parent_realize()
  hw/isa/pc87312: Consolidate the use of
    device_class_set_parent_realize()
  hw/intc/s390_flic: Consolidate the use of
    device_class_set_parent_realize()
  hw/arm/smmuv3: Consolidate the use of
    device_class_set_parent_realize()

 hw/arm/smmuv3.c         | 4 ++--
 hw/intc/s390_flic_kvm.c | 5 +++--
 hw/isa/pc87312.c        | 4 ++--
 hw/isa/vt82c686.c       | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.34.1

