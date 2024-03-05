Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp375731ejc;
        Tue, 5 Mar 2024 08:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaTAJlkOWFuABIYcs9sdVHvRCbhYkPEKyAnOKnZCNWwyTWme1Z7d6eiA7OrzqwYJe3/CAoNokL74jVWIss9bfzWZJxxfFz
X-Google-Smtp-Source: AGHT+IF4bKnvFAPhClSnhLQSP1DzBvxGSIu7xXM7w8SWmcKytr+mTZrbLdFF4JjkJHhKuJwm59/o
X-Received: by 2002:a05:6122:36a0:b0:4c0:2d32:612f with SMTP id ec32-20020a05612236a000b004c02d32612fmr1913513vkb.15.1709654458033;
        Tue, 05 Mar 2024 08:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654458; cv=none;
        d=google.com; s=arc-20160816;
        b=vpVBTfWBpBz0DCU4/mTuaPLe4xn+9fgbi/GbrNVbQ7H8a3L5pjh2iILrlqzTVbCu99
         ypyTQMPMQs4lDRNpQhqZzB6wX6qSWuCDSrYzJ7q1x71KX7emsVBnd3D0IyFXjEXLy6oA
         LSCrMOUd1wBVDByvLJQ6FqJeqMSq+12JaQrFr4c83Y+BAtvgapCqMzWFWRMlF1oHhgNz
         SgnOLij4AyWtWotWKCqDXV6SPy3mYUHtRLkcDzZWrSRzu66np91f2MiTxYlK+d8wL17b
         1TzFTnYp0W+uDx1rs/zK6D1Q0AaQKT2PgLyFBkRhrsyUNZPfu8T8rVfeyCZ/eKvJN4uO
         fnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LdqoNsfOgM1ctpAktfMXnvxfqY5U6p7jYtgcELBrb3Y=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=ETmDzQdouMvvTKJqJKi1FBV5mqbB0gXN6TXnHm1s935OiGZWoYcDWYDIAwkIla94FW
         ZAVX9amhK/kUIEAg9siqY51QEYixjsojmLxieBNYD2ItgIFbD9caXKxRrG51dQnO3Z+P
         A5Y48SRNsQE/8AsvEQwXz62TQu9+XsGDtBc5iZ2HncOumazKDvWLI2k0AtqEthp9l1Ns
         qE0WUtnQfb2obgmA2e5utbVsbAIwwzQHDn5oomrACU9LZxSMirVmVLEbCPPv0sTDBJLR
         +DBpIg/J/hPaXrlb+BmcVeUIkQSeAkFbpWMo9xDCQ04eu3G/aDzY90Lu6+BiyFeUPg+D
         BrrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVrc7jwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3-20020ac5cd43000000b004cf75b3cebasi1703618vkm.172.2024.03.05.08.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KVrc7jwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhXBi-00073k-Sn; Tue, 05 Mar 2024 10:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBZ-0006A2-KB
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBW-0000hD-Af
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 10:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LdqoNsfOgM1ctpAktfMXnvxfqY5U6p7jYtgcELBrb3Y=;
 b=KVrc7jwRlEX4UKWy2CJKgg/yoMDXx9TcApPQ+fATgl+Pl+/CTyScHhZQuFB0zKEEYtyJnG
 XBGPYd6GPpdksiwyGjURqMPf1laRuDzyV7/rNaVrFq7FtXbxpaNOdXCBYACHI7qyaZcZSQ
 DaIeHkn6FEsbbtB9takqK7BngilY3U0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-wyXb7KV2MS-bx5supjNtNw-1; Tue, 05 Mar 2024 10:58:27 -0500
X-MC-Unique: wyXb7KV2MS-bx5supjNtNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C6C7101A586;
 Tue,  5 Mar 2024 15:58:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A80E17A97;
 Tue,  5 Mar 2024 15:58:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 20/20] tests: acpi: update expected SSDT.dimmpxm blob
Date: Tue,  5 Mar 2024 16:57:24 +0100
Message-Id: <20240305155724.2047069-21-imammedo@redhat.com>
In-Reply-To: <20240305155724.2047069-1-imammedo@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: UkXiVPXebzLn

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

