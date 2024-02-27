Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2757078ejf;
        Tue, 27 Feb 2024 07:51:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTSSToBRKiN3j8kCwuuRbJXG98C7I92gwUawGDeRyz4QrFlxdZEln9UfQTYS7eV88BenzZRELaDwkjjPI8xn845cZ+yXeV
X-Google-Smtp-Source: AGHT+IHx+5AN4DBGwLZzN697OUen17FUrla1TeaFHw47DpYEhjXT+L4nQD2fpyA55QynPyACeIVY
X-Received: by 2002:a05:6870:e30a:b0:21f:d443:890f with SMTP id z10-20020a056870e30a00b0021fd443890fmr9862474oad.59.1709049114538;
        Tue, 27 Feb 2024 07:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709049114; cv=none;
        d=google.com; s=arc-20160816;
        b=UqU+mz/T915aMyBzrV0kFnMMGOaM9FLzV2UQiaPR87Uq85wKu6kQxq4MFDyiNvYvbs
         OsLV9phrWi8EXr+tSbpPyXd3P9pvCKMFBwl0T10IORMmjIBXEYMHLTsMvMvT1qe4HCzT
         yr7/BTOfgbfmLKE36IHkbB6iAE6xo4ApQqVJr1i5zKyGGiaWwWxDVq17+JlHKe+vZo+D
         0+SVKfu0VK9hmvdMikCHseSVj91y+9vUTQI+LAia56ibX5P+lRWwkIuBTtHIMZf2BA9L
         y1eip/z8gModb0hm4pn61zCw5RXbDudjMt85tF05rwgQ5Md2wNFoKuyYaHzZffUDmIaR
         9B6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LdqoNsfOgM1ctpAktfMXnvxfqY5U6p7jYtgcELBrb3Y=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=ZQ2hak3ZpnDxSBXD/zXzFknLIbB8+FQNcptqa3Yw9B1AJWbRK5zTyPCQm11y43Mvss
         hMHDy/R2gGSyOzltP/RmpYfQAgWmyo+nbrxkbjImDW9AK59Tzap/mPMHnq3JA5Lpe2tr
         hEh0j9bbZnZ6iHAhB1YklOGtTrm3Z/6uyGqFN6nEteLH9pROjY+LauNtC+7mxibueRfp
         FWtPxKLiy8w+ODuWA2tA7sHBkjoQrSrsdiYMK4Fei6Tc8koeKQj6J1lxErn9TtvzGTvy
         /9HX2irrTdMLnWLqTDbVmBLvZiaXoOMrXPlA3oRkbyPncOxWbgwj4W3IFjSL1jzhWLo9
         W7UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/LeLcC5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wh3-20020a05620a56c300b0078773829b67si7461668qkn.142.2024.02.27.07.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:51:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I/LeLcC5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezhU-0006mo-C3; Tue, 27 Feb 2024 10:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhS-0006Xi-B0
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhQ-00008U-R0
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdqoNsfOgM1ctpAktfMXnvxfqY5U6p7jYtgcELBrb3Y=;
 b=I/LeLcC5X/5ZmVtoQgfzAWAEjW+M8Qd/e2Jmyjj1EMeane/Ze41s4CnG9XFxsXeC7rVNkV
 673Cgjc8iRMi2MKD+t+Pt9UZVy4KB1KP6BVf0mAM05rVTFl2xVCnD3Liy1gVr0VvNCQRoC
 /ssGd1e8G77z6xdsELfqeEQFhc4QHBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-C8X0XaQzPRaLYfnDkEoVTQ-1; Tue, 27 Feb 2024 10:48:49 -0500
X-MC-Unique: C8X0XaQzPRaLYfnDkEoVTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF63D84ACA4;
 Tue, 27 Feb 2024 15:48:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B3042166B33;
 Tue, 27 Feb 2024 15:48:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 19/19] tests: acpi: update expected SSDT.dimmpxm blob
Date: Tue, 27 Feb 2024 16:47:49 +0100
Message-Id: <20240227154749.1818189-20-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TQM5XN/3S8c7

address shift is caused by switch to 32-bit SMBIOS entry point
which has slightly different size from 64-bit one and happens
to trigger a bit different memory layout.

Expected diff:

-    Name (MEMA, 0x07FFE000)
+    Name (MEMA, 0x07FFF000)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 1815 -> 1815 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 81148a604f..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/SSDT.dimmpxm",
diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 70f133412f5e0aa128ab210245a8de7304eeb843..9ea4e0d0ceaa8a5cbd706afb6d49de853fafe654 100644
GIT binary patch
delta 23
ecmbQvH=U0wIM^jboSlJzam_|9E_UV*|JeaVTLvQl

delta 23
ecmbQvH=U0wIM^jboSlJzanD9BE_UVz|JeaVy9Ofw

-- 
2.39.3

