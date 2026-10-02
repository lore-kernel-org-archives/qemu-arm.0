Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125CACA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 18:57:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCiRK-0004vT-SW; Fri, 02 Oct 2026 14:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xCiRH-0004uS-VD
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 14:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@redhat.com>)
 id 1xCiRG-0006T1-FG
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 14:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790967417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=48REw7lvlectdgG1Lnb/yP9HHfswJk3EkSJ4NxO5j+U=;
 b=CrFGY0h2gn11LpogENTe3RnDfbkanEIxkgQqpEMsnidk8V1o4qVm9KPH+w1NLsEVN756uH
 Ebm3A+eXHc+YK1K4urSaQHygtWsBCoAYm9c8ldd9VZ+q4xiIxcyubzaYKDsBvUuykBT7QT
 UYSTUtNtCyeXDC5VuNuTAOP80tbhBNo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-LJpl6cc0M3e5z-XqvwmEKw-1; Fri, 02 Oct 2026 14:55:47 -0400
X-MC-Unique: LJpl6cc0M3e5z-XqvwmEKw-1
X-Mimecast-MFC-AGG-ID: LJpl6cc0M3e5z-XqvwmEKw_1790967346
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48af5a07314so113878f8f.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 11:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790967346; x=1791572146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=48REw7lvlectdgG1Lnb/yP9HHfswJk3EkSJ4NxO5j+U=;
 b=y4Y38yruj5T4+o3GzvfTWiTRMv2+OfIDZMQdfTmRnsckw904qR/WAbJbmCoU3ciq1j
 RsdrTj4g4cg/T/B/9oDg9MIApP8pkqiX4NzViR9uxaghXDsu2jXZNxWJjuXqENDOjyF+
 pE/BOpbcrXTt6oYtLbl2hdpYOpgIUNfIB7b+9Wnc3I+G6SNUPZkvyY17SXlq7c1lMvr2
 FDS+jzEr1uScl+YCrL40NJFi0MWORMYECwLlG+CMI0Xyy4+YsNzkK5IGowTBeS9Nf4hT
 7Yg8CPUIA3vBJ4blMqznl6BJNxfeVxtW1InvDLfOWzKFTzgXo+pZYA3lHfS4vjf26HNZ
 BBFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwfyEtnO9YTN++94wOOb62ktyaevsKxwSNfmCPiadjHNIE8S+7oPah9pTh+11481s7NTXmg4lp5Cg==@nongnu.org
X-Gm-Message-State: AFuF++mXMFkZeyNT6rC8mWvwLL0W6YjxBxoLkz183m27JD7l6riY5/Ku
 Fl0f68BxPjIB2uYysaueXZUnrNdXTdKFcpuL+MIrnjNjN8Jr101ixg2Sp5y+5bXxmdGuEy8MFNI
 XA/BR0ANUeSsfWfh3xFwa/W5DJyFOiVIYEKjz/Wbbx0wJIAYLi2yJvw==
X-Gm-Gg: AYBFou3pWQoj2L6MFyqfg8T56l4MSV7MHtdAEpD0FARV48xPIt0M52Ck+rz75zEZ7Mp
 0fIT4CUWnmjwvKtLT1NIOR2takrqqqTDJK+97yv3AEQWBtJ0fsx17Ez5EEzKh8qvH6fPCa780Rl
 hOlCUBgJKFShYlqJeeqFVCeDqRXiUTH3WmiPI1Lt1fadvrt48sTh6mbLJ+0/M26lSn0are+9U/K
 AjHwmlFa87dgM9q+NmfOlpDELta6c8DUp9relXLquIKGS94T/59M98o5MO2mSdip9uNPTMdWEnk
 wh9j97i44jJ91narNcO8tGULaobHD4cgvzFY6pf/HixmLhzh3MRw+RgntyKBKbWVQZqUeo0i6Q=
 =
X-Received: by 2002:a05:600c:1552:b0:49b:d03:8d3a with SMTP id
 5b1f17b1804b1-4a02755f84bmr64880205e9.11.1790967346032; 
 Fri, 02 Oct 2026 11:55:46 -0700 (PDT)
X-Received: by 2002:a05:600c:1552:b0:49b:d03:8d3a with SMTP id
 5b1f17b1804b1-4a02755f84bmr64879965e9.11.1790967345676; 
 Fri, 02 Oct 2026 11:55:45 -0700 (PDT)
Received: from x1.redhat.com ([37.103.72.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0280d924asm114636695e9.14.2026.10.02.11.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 11:55:45 -0700 (PDT)
From: Gustavo Romero <gromero@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	gromero@redhat.com
Cc: eric.auger@redhat.com,
	gshan@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH] MAINTAINERS: Update Gustavo's email address
Date: Fri,  2 Oct 2026 20:55:38 +0200
Message-ID: <20261002185538.1020233-1-gromero@redhat.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ILH3ee_DYqOM0D5Gxs5JHPBXC-vszsJ-28BvGAXQC4_1790967346
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gromero@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.336,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Update my email address to my current Red Hat address.

Signed-off-by: Gustavo Romero <gromero@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1312bbd1bd..c52493ede7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2279,7 +2279,7 @@ F: docs/specs/*pci*
 F: docs/system/sriov.rst
 
 ARM PCI Hotplug
-M: Gustavo Romero <gustavo.romero@linaro.org>
+M: Gustavo Romero <gromero@redhat.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: tests/functional/aarch64/test_hotplug_pci.py
@@ -3147,7 +3147,7 @@ F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
 ivshmem-flat
-M: Gustavo Romero <gustavo.romero@linaro.org>
+M: Gustavo Romero <gromero@redhat.com>
 S: Maintained
 F: hw/misc/ivshmem-flat.c
 F: include/hw/misc/ivshmem-flat.h
-- 
2.47.3


