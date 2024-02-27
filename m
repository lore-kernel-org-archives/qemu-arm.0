Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2757151ejf;
        Tue, 27 Feb 2024 07:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcn/EHbQSfxeFzMH8M8d3aDksGVag4vEyRFAeMHJwlVyGBjOk/+2mtLUYGumoC3pxaCQeOQuf/f3ExjzWDTuEqQ+DCfvmM
X-Google-Smtp-Source: AGHT+IGnxabj+kYCF3rEXaAn/xIfZGGdDkcpaaVx9oDsPXZwJjA7VhGt6p33UMJexJfv0woM3JQx
X-Received: by 2002:ac8:7d12:0:b0:42e:5f70:f17a with SMTP id g18-20020ac87d12000000b0042e5f70f17amr13200120qtb.11.1709049126423;
        Tue, 27 Feb 2024 07:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709049126; cv=none;
        d=google.com; s=arc-20160816;
        b=OM0rJGXW/5i3Hzn+/BRKRy7Kx5Vfiw6U2y5IMe4jWX+Dz96ReSwN0Dhra8LyFn8tLD
         Xj2UGQd7Ug+4HFlsGLvE2tCJ+Wfm5mxE3z0S9Ipfpzui8Uly9AQzKKnhxBXxfO1yFhO0
         6JhwlotYy6xEH0hnV3cX2OCbxi6qofEPWMmH1RPCgUM0KP9RdK1b1Mty2S+V24XY8I7R
         0G6PERt9jAqwHJQEWDXTY6JB63d3sKRkLjNou6jD7dragfwsiUEh051MvGA5euo6LBFf
         nmTkXjequ1zicqpvs3ZVtZvumNgGF968F9HnMkxBw6xc8SjtmFiyaYTVuzlT5jPUuyi5
         O8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xGBdN98EbM85CURfIlXoCrdzCsGepPpc91s/goea7SI=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=p6S7G+vuqUhieV+qC69bDnKuNesoRZigjdcMNeJzACh4cVIpMM6iNGIkXktxudbt9l
         7Y5QgPv/Cml49vclpBTRN0yckaipsVl50Z9+fsHp3LozgrK996xg11igOdSA6IcO6nvu
         F8QbBA9GFihzxaFm4XOjVhBMw4/B0n54/p8YR6n1kP3xNMKeB/ZSsOBlbhnn8F2+gcQE
         82XzuILRzZI6qhp5c8+vrVTSyFW02KuUFKZv9+27H4ndGCYRP46ouaXfFcqb46kgYtAW
         nSJrCVkjJ8gmFN9/nkkoX/QPBleNHOP04YU75/WkYKjWIN/mZspr5g2IX0UDozQ/CX/2
         cVVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y7FIBosX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020ac8554f000000b0042e695ae483si7681482qtr.454.2024.02.27.07.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y7FIBosX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rezhT-0006hG-M9; Tue, 27 Feb 2024 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhN-00061z-91
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhI-0008Vo-3M
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 10:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGBdN98EbM85CURfIlXoCrdzCsGepPpc91s/goea7SI=;
 b=Y7FIBosXaC6t2wTiWJG105h/bLs491y8r6yTBJOCJFsYjwBFCmtdGspBJc8f+16/ldTV5p
 spHfTqvUAKGHVjzKNkXSvJC/6ezZAZuOBipFh2VypMwjvPqyOwGQ6YCyZLaAx94+yp7FhY
 v3811tYUJ46DZRy6MWQVI502roNKDEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-iUIUqxdQNu6NQhlBezYCoA-1; Tue, 27 Feb 2024 10:48:43 -0500
X-MC-Unique: iUIUqxdQNu6NQhlBezYCoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B21985A58C;
 Tue, 27 Feb 2024 15:48:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68372166AE4;
 Tue, 27 Feb 2024 15:48:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 17/19] tests: acpi/smbios: whitelist expected blobs
Date: Tue, 27 Feb 2024 16:47:47 +0100
Message-Id: <20240227154749.1818189-18-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 6OrostyaYJYn

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..81148a604f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/SSDT.dimmpxm",
-- 
2.39.3

