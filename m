Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp352156dyb;
        Tue, 24 Jun 2025 10:54:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKJZPw4RlpJrL2eVuNQp6559wAmKzo3mkgLUUOzMhh8dsHMn2yibuoUA3r9oWt+brtwBZdIyzVHmjbdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHUbSb+D+F2B+SqdRDuSXHu4ARGquux0iGMKtJ/8zd8rfCTD30iONQl0McHwR1XhSEkaIX
X-Received: by 2002:ac8:7d8c:0:b0:4a5:8b39:626b with SMTP id d75a77b69052e-4a7c07d0997mr4034051cf.27.1750787678732;
        Tue, 24 Jun 2025 10:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750787678; cv=none;
        d=google.com; s=arc-20240605;
        b=f1zrfLsyKSDt/6sb+iSVlcn4Mkte9id9fOF7lZ6yog0JAG/ebVMLTHjNBfGt+bYg9a
         uyNQcvc/MJAwFLaOmTh2iiiWAVPXtiUoqO+ZcjUjB3CjI46P868wdmj0GdgwT6N6eHFD
         1918pxIYHHJitxCSKTTm+H6xI/86KeHYf460GKUK7dXZ9eFuuy0GECVw5mnM362assbi
         g8lCd2LICG1kOb2as09Bw75n8QHI/w3uIu8zpz4oCfd6mW5jepWzZoMnSiSzfm+jrX4Q
         NCBiXs1q1S9o5H+yIbYO38t7U7ZM9xWjpVAMSZjFbePXfAuDadoToMdDRhrgGQ8TRGn9
         Egaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vjQjGRGJYV8oj6C9qlehHQhV+zZF7SSfzV2GNkxSF1U=;
        fh=HgScNWUKrsiSAZjMwzmJSLCIQSpPo0VqsG8Pr9G5dWY=;
        b=TVhgvN9Xf2CKEGppzFbQNybSxK187qXdF539po5sZVoiiChdefKeMUvPs/R52GP5TM
         dMY7ZgRNoS0yU1THccJf6j0bYqkLykXT+cjX0U8hY9zjcxN44R6xuik3jvsJilZwZrwi
         gQIZ2hfHtQjWpnE9Zmws3V08OJj7h5NebwzX84bSpaodN55veaS02vxX13zFcD010PuN
         KUJKRFCsJWUtUK7rMuyc9Elqc8iGQrhrxGZMkDcMN99PkiD1I64lq2FkINvIcgFytLJB
         CJwRVAyxvaAgc/MPdDjBb5ZzhqE+eQ3EZT0qCxSy+3jNS73YmiiJw6Qw5YjAi02VvCYK
         nj3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a79de8d589si53889361cf.494.2025.06.24.10.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 10:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uU7ps-0002t8-7s; Tue, 24 Jun 2025 13:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhej@vps-ovh.mhejs.net>)
 id 1uU7pm-0002rx-Pr; Tue, 24 Jun 2025 13:53:26 -0400
Received: from vps-ovh.mhejs.net ([145.239.82.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhej@vps-ovh.mhejs.net>)
 id 1uU7pk-0002ic-J2; Tue, 24 Jun 2025 13:53:26 -0400
Received: from MUA
 by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <mhej@vps-ovh.mhejs.net>)
 id 1uU7pW-00000005WmG-12EG; Tue, 24 Jun 2025 19:53:10 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Avihai Horon <avihaih@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/3] VFIO multifd device state transfer patches for QEMU 10.1
Date: Tue, 24 Jun 2025 19:51:55 +0200
Message-ID: <cover.1750787338.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.239.82.108;
 envelope-from=mhej@vps-ovh.mhejs.net; helo=vps-ovh.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
X-TUID: AD8MXn1Y+9Ph

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

When VFIO multifd device state transfer support was merged in QEMU 10.0
some of patches were separated for the future QEMU release after the
spring cleanup.

Since QEMU 10.1 code freeze is getting closer let's have them reviewed
now.

The most important patch from this patch set is the one adding
"x-migration-load-config-after-iter" VFIO property since it is a
correctness fix for an ARM64 platform idiosyncrasy with respect
to VFIO load dependency on interrupt controller being loaded first.

I've also CCed the ARM maintainer and qemu-arm as suggested previously
by Cédric.

Maciej S. Szmigiero (3):
  vfio/migration: Max in-flight VFIO device state buffer count limit
  vfio/migration: Add x-migration-load-config-after-iter VFIO property
  vfio/migration: Add also max in-flight VFIO device state buffers size
    limit

 docs/devel/migration/vfio.rst     |  21 +++++
 hw/core/machine.c                 |   1 +
 hw/vfio/migration-multifd.c       | 125 +++++++++++++++++++++++++++++-
 hw/vfio/migration-multifd.h       |   3 +
 hw/vfio/migration.c               |  10 ++-
 hw/vfio/pci.c                     |  27 +++++++
 hw/vfio/vfio-migration-internal.h |   1 +
 include/hw/vfio/vfio-device.h     |   3 +
 8 files changed, 188 insertions(+), 3 deletions(-)

