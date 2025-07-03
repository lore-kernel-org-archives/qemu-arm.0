Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505997dyc;
        Thu, 3 Jul 2025 05:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXblFr06AIzeLOwS87TokdviVqeY6fXsSr8v0ngDe1i5U3iXa1NBZl7xhfkUWxA/fIoqiEW5tfu6Uxljg==@linaro.org
X-Google-Smtp-Source: AGHT+IElMMajCUCoC2fBjVw1WTorQJhpWazcVSa0iXK/Yk/0NdX7QUroF/JMzAVt4ZktRTB11gu8
X-Received: by 2002:a05:6214:c21:b0:6fb:4da2:967c with SMTP id 6a1803df08f44-702b1b7321cmr101848696d6.32.1751546367461;
        Thu, 03 Jul 2025 05:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546367; cv=none;
        d=google.com; s=arc-20240605;
        b=iJ+Ki3VoyG3Wy/ZrU7iBpu1bspY9M+4x/Oo22V+7Ds64MCfJuMTNkzwSPy0PV41ape
         7xPXQpci2ZrsZukmY2CUJFqWvCDSNMqEOOvOgoEoA2TQAkAIAg7wp8Zzi0WNkag4Co48
         g6WGEUd3iU88jHDnGKohDM8mRk5N/U2BIvvHet9t/Z+NjbUDbq8nJa+G/fxFCKPKlc9i
         kxm4yS0PgSg/urnogQztkmYgKoDPrc15hLCvg+CnxlAKy813PjBO6ftrF+Td0e/Rdq8g
         VL53ebZPrQtiGazFrtRVo9fQFZv+2rXc/xYFdBIgWx5eQB0TbZRd6nhfSqMjLJgvKLQm
         ekmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ygV87S2dsgtc2njtsuKJl/dqXurPzUNwHztllmOt+EI=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=LwZqGD7euPeuAUWFA/IAR4D+zQ3UW44com6yb384ZOfIbeiGJwJ35wEgMnQ1lVPRRo
         qyvm+m+SdP3hK81tf04eL8Jop8+wsJPNiXIQ3MxF3EZiKCTg6WUur6MR9W1m3RFhy6Zn
         O7WZZCkGEnuEl8HPRiuKUGpGhT6S0rYc9rthQMAFgLRuUAq6VH1vXkYWSAkJe63FOZLG
         epmtkQLi73440pTBvyT0aAQ15ZaVEfHBk2FALQfv42KNSGEv8be3liC74l3AtNtvxj3M
         kThrZWHBZdixMmSHj9R5ZQtbTT6bXNIPbm7wK+cR6W0i69ubz5e07ja8BBI1lmZ+1b5c
         fS8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJfVXAhh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77287710si175285736d6.8.2025.07.03.05.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BJfVXAhh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygV87S2dsgtc2njtsuKJl/dqXurPzUNwHztllmOt+EI=;
	b=BJfVXAhhDEevdABMiN04Ye+oH9pMuXNiB71l/uslQeALo3gDR1d9mrCsK8Hrd5hQH+G7D5
	KI1xDhGV2PocdrAXtS1cEDgznS4FTnddU035HHspF2SUsn0MI5FBbkBJKV0YQZ1wWzsVXp
	OQQ4i4p8P1OUB/8X6DyebFG1V2vTcMg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-6XitAmLWP46S3Cn6jqhvdA-1; Thu,
 03 Jul 2025 08:39:23 -0400
X-MC-Unique: 6XitAmLWP46S3Cn6jqhvdA-1
X-Mimecast-MFC-AGG-ID: 6XitAmLWP46S3Cn6jqhvdA_1751546362
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04C2E18089B6;
	Thu,  3 Jul 2025 12:39:22 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 29617180045B;
	Thu,  3 Jul 2025 12:39:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 20/36] tests/qtest/bios-tables-test: Prepare for changes in the arm virt DSDT table
Date: Thu,  3 Jul 2025 14:35:20 +0200
Message-ID: <20250703123728.414386-21-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: gGBMzo/XxUU7

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit adds DSDT blobs to the whilelist in the prospect to
allow changes in the arm virt DSDT method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..023fbc6059 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
+"tests/data/acpi/aarch64/virt/DSDT.viot",
-- 
2.49.0
