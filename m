Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp376409ejc;
        Tue, 5 Mar 2024 08:01:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6dbRmrbDj+5jg4Cj9vI6eUyRUWCjr/V9VvSrpuPCzWGj1O9I/Hdu01pgNUFm6rCWAp5/bWV+oewCwG+4jW0YJ9EcJQWsf
X-Google-Smtp-Source: AGHT+IFkfEz9N9FN8r0I5NsfF9/2E8/w5La9WUqm5PuvFhAgnLRPdmQqu3wAAh838lTKdPUhckF7
X-Received: by 2002:a67:ead6:0:b0:471:e3a6:9697 with SMTP id s22-20020a67ead6000000b00471e3a69697mr1464586vso.16.1709654497057;
        Tue, 05 Mar 2024 08:01:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709654497; cv=none;
        d=google.com; s=arc-20160816;
        b=Zdg2T+yhUI8Uy+dQH5jD2M1L+RdXwWTf58rJzqZgNxkNQSD8opnOzhWM+YdevsXw+1
         SaO27gmHJtcVBcMVkE1gTHj6gRvbqsN9Ftb9iUrG0H8lt10EmHMY/T0+wNaRieaK2Vc3
         gRvkrfQT0m5/nau8aKuxPGZei0u5HilCe1O4bDfBx+3YatDc1GxEGc+V4hhblYYMjdXI
         iIHfzEZMSDyl2uWy8G3cUhSZotPk1KYotPWy7oB0ldxcfcJe7qp4crQj4Y+9nGyt1EWh
         EfehfcN4s54PC+EYKwhJuvnmKoZiC6nR3fcCAujcTSFqW2u9G7J7nX8tgrq8bxth4Kk9
         EXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xGBdN98EbM85CURfIlXoCrdzCsGepPpc91s/goea7SI=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=agpCe6Zsu77YGk4afcp9vcJLdyueuihg1CTmC+lgrZp6TBSoRjg6Hce1C/jorE7U5j
         b0+7v91Hu45CtrhZ0R/p2r0A+rMzWUkeoJq733edcAnduV7cyWVFPvM5bkm9rKCrrVkx
         wVb24iJ3NoH3LfhrAiOny8C2BUih17zMrOUOZfb+RvIkV92hJXorYnSFyodlu7E7b2QM
         2vqCwyOuSQ5zGu6mdia1wd97C+5c39HJJf6fbZMZGXxpid9UQ9NceGvhdavzWov8kk9e
         of29G60BpKA1dJMHPs7+pUcpKHeu2235ZPAyJ/BJYxZuZZnVEbiG7Sftp3hIAnfKA2AR
         xEMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hheftpnn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id il2-20020a0561025f4200b0046d249c0ca7si1459487vsb.294.2024.03.05.08.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 08:01:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hheftpnn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhXBo-0007SM-3x; Tue, 05 Mar 2024 10:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBZ-00069A-9f
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rhXBU-0000fa-KH
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 10:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709654306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGBdN98EbM85CURfIlXoCrdzCsGepPpc91s/goea7SI=;
 b=hheftpnnBc+92IPCLHqoU4x2/bMTte2Y3+QUNTX1epQgqKuXEQHJ2H5vC+z2PHlLtSOQAG
 wP6TxORGp6cotjKwuMDnYMRX5xvzmEqtZT4ZJrD7zMcq+HUYHAurVAz90/n11NN54l4vg7
 5oIH3XOQhm6HzJqb3wH6Jcwx3fzccHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-d-BX8WqhPyef6LE14xY5iA-1; Tue, 05 Mar 2024 10:58:22 -0500
X-MC-Unique: d-BX8WqhPyef6LE14xY5iA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AC12185A783;
 Tue,  5 Mar 2024 15:58:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C76317A97;
 Tue,  5 Mar 2024 15:58:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH v2 18/20] tests: acpi/smbios: whitelist expected blobs
Date: Tue,  5 Mar 2024 16:57:22 +0100
Message-Id: <20240305155724.2047069-19-imammedo@redhat.com>
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
X-TUID: 6ndWdZsJq8h/

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

