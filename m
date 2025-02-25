Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp336889njg;
        Tue, 25 Feb 2025 08:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWF9UZNiLlVvO4/sjySs5oxVJkFCbDos8UDLtPXIS/uIsbB0w6qt+PS9g1GpFZMME5wQQQ5rtMmHTKcqA==@linaro.org
X-Google-Smtp-Source: AGHT+IFxNb3EYQUWEPY7XAMKhDJT1PokJsSH9Z00QHwCiQkJrEV+j6UuOuSz5Dq/Ayh3ZnvhaPCP
X-Received: by 2002:a05:6214:d87:b0:6dd:84b7:dd86 with SMTP id 6a1803df08f44-6e87abacfbfmr53628686d6.36.1740501277000;
        Tue, 25 Feb 2025 08:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501276; cv=none;
        d=google.com; s=arc-20240605;
        b=HcyMHUOPV4t2KOKmtYjXelmSYZ5fLNGHeaaFm2Q72Y/yiaAtxPsEUGtrSCkl+U3fgZ
         7mnmo6MkL5wqvCVySLBxyrw20zsaE4rAz7zGAT7cw3pDntBVq1Y/hMnhFr/otzW6uzAZ
         TwpDdEuJ94aYGqXZq0rsH6YvMhRGXpx15NdMdO09XMkPS0UGA9mLJrlPoSPfUS4fW/W4
         xNbNClcKa+w5qLUhh1cULT5VncKibv15tj5TeingEZiET9u1N5q69RzAHi9Z6uR5o3KA
         0BdVUYF+grCjDaWgytgD6blkNKkgjzFm/24ffACufuh3HS9kRUNPVAv1NdTh0WKiXMgu
         3yOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UfzJa85ik8HDMKewE83Gp4yd8DRMF01tRJCM6geVxi8=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=jA1gQoEOItjwEHr25PKgHKDKlpt7LarWKAJLnQPG7zxsMr98krp4NvElBHams+tOZ7
         CjqGyw8rgZ2OsTOIsE6o7RUwNY0N0cRihApWIeW2/70nfQz6LvTy7QiX0L5fWlyHIp3v
         NsktOT3jxOYDFaAEzPgS/X7KXYkbykogs4obltO6NKD83km9ylrzFUWb+CI1lheN/AHX
         H3pibPe/bVworOuKfdsUGKeIrW9euM0s1njdhuLWh1/bbagNneYPn0zt4BQ13c3kPZsr
         Q7M708nC64sXFcNDjCefK4SnDo2ZTTs2sTj6Rqc8PlPAsJucJMJgJS4hI88okUMHhrLl
         JPkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkLlcziZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0e1f84si19832846d6.313.2025.02.25.08.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:34:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BkLlcziZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmxqF-0001K1-V7; Tue, 25 Feb 2025 11:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpx-00015t-Ob
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpu-0006aJ-NH
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfzJa85ik8HDMKewE83Gp4yd8DRMF01tRJCM6geVxi8=;
 b=BkLlcziZY8Ov5Cw7Ss54+WE3tsTvVTq4TFIrD1c6W8vnkIXkqgkibLrNr5Ouatj8nHs7Bq
 hY814gBqd8uHThYMkMUSRuXwIxDutgNSobZ8HWmM4+byoNe2Oq113+FMgWJUdXmQnigCkN
 HfkZf7Gu49bm6XfJ8rFb/UJ3+IpgBaE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-mwsYUunENo61Oh9bY5lTkg-1; Tue,
 25 Feb 2025 11:31:06 -0500
X-MC-Unique: mwsYUunENo61Oh9bY5lTkg-1
X-Mimecast-MFC-AGG-ID: mwsYUunENo61Oh9bY5lTkg_1740501064
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 553841801A2E; Tue, 25 Feb 2025 16:31:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 78FDC1955BD4; Tue, 25 Feb 2025 16:31:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 975B1180078D; Tue, 25 Feb 2025 17:30:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 16/24] hw/uefi: add UEFI_VARS to Kconfig
Date: Tue, 25 Feb 2025 17:30:20 +0100
Message-ID: <20250225163031.1409078-17-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BzGu/So42JHX

Add UEFI_VARS config option, enable by default for x86_64 and aarch64.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/Kconfig      | 1 +
 hw/uefi/Kconfig | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 hw/uefi/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f7d..c4dfe2e7af7c 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -37,6 +37,7 @@ source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
 source tpm/Kconfig
+source uefi/Kconfig
 source ufs/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
new file mode 100644
index 000000000000..ca6c2bc46a96
--- /dev/null
+++ b/hw/uefi/Kconfig
@@ -0,0 +1,3 @@
+config UEFI_VARS
+	bool
+        default y if X86_64 || AARCH64
-- 
2.48.1

