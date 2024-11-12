Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7223946njc;
        Tue, 12 Nov 2024 02:16:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCViX2E4qeHrFwvcoxtsn92nRRlhQONBZ8YJzgUfcN/bEQOimQd1DiYwIUuTgyNDRB1DvLBD+TURgXRM4A==@linaro.org
X-Google-Smtp-Source: AGHT+IE0nXEjh5dQ93UkaPqYLPMNsO4xfW4ucm5V5SbumOgMN6uxEL81qhcyAfzb6W6nt7Lkcdmh
X-Received: by 2002:a05:620a:25cc:b0:7af:c856:820 with SMTP id af79cd13be357-7b331f20ca9mr1901448885a.46.1731406568942;
        Tue, 12 Nov 2024 02:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731406568; cv=none;
        d=google.com; s=arc-20240605;
        b=KzW56rGuxe/OY6TCIt0uP6QpaLsPlr84N8xW/9EJQYxSl0bI9xbV01aWR0oNE+roqf
         ry0NXozOvuTkQH5LnqWWyxrrnVKtTIGEP4xE61mA6wqR2YOZ5hq5IUcZFWJxMgWKM/YW
         /wTl0kWwmQbQBlcSbIeagsgiQLT1DwnrAKDzGijKS5HC010ODj0UY7WY7WAqtIwa2y+R
         mqw9HDJ2aTVBT3TSDzvPY35uryR25WsdFgghMtAJJPOmViA3qXzKxaocJvO+wycWjrak
         obHRLEBfvEl0vlLJySnAt8N1Gi6FqJIqWha8bODQYM2YcyZvnNiiB+neFHXRonijB7k0
         btnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6FNie3Ty9Izt05vIOei3Ior1IhUzI8RXvGahsaMzAZs=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=Fv+Hhrf4chT44LdJzhpwcRWffoDxS+2jFy/42q+J1UQ5GV25KgstqhcBL5YVYIM1Bh
         qUpH6BtlxmUy/pNOOVBtbRP+O9eynhMxgkKIhK4fQH81KKRJzh7mTNJaIwi5uCzdI2fM
         vjoFLNo8UBoF3pTCB8RBGvImmPnXwiCJrRb86m4NYmdHHH/gbSlpD64nk9mfipsyj7hD
         31cI3ikU57N8Btjxg+yN7w19F1eoiAAigxrwNBo8SLRQt3OnrcvI4h8NqoYbjYXAJsSx
         JJFMOik9BGxjdJszdFZOTo6B37QbA0q4QMB7I0n3tH7FBaV8mz0HT76QYgQZxUwICoFw
         1R4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="GfJp4/p3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad2f594si1273337485a.690.2024.11.12.02.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 02:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="GfJp4/p3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAnvx-0004j5-Vj; Tue, 12 Nov 2024 05:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvi-0004Z9-9Z; Tue, 12 Nov 2024 05:15:26 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvf-0008RD-Nu; Tue, 12 Nov 2024 05:15:26 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8424B5C55AF;
 Tue, 12 Nov 2024 10:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23B6C4AF0B;
 Tue, 12 Nov 2024 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731406510;
 bh=PcRTyEBS2+gRvLkAqL7u8VMaelZPeW1sVQkkas/F7JU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GfJp4/p3hDEss1h1HXWd3tBq1cpFA4DvpWFUPjfLP4tMPrmNwmJ4HkX+UIAqQuS0O
 jd2ibRVFm9c5VaVIrfM3+oK1KxXh2IBeIR7BnXw6XCtVKKC7+ZJF/+Dq61vUcGwRTq
 BoQnDVYbgRh7VSI8y9qcWmJoelpEXpCQ7NmIRQlYqdHHCA8peMJm2/a9W6G1pp5p51
 RmvbstP82u77Xab/C8U4a2PUgGzR0TiQI3hCcFtbER17ggZ4NCqczO92uthCAk8D6/
 qo6FrNCRpqFBXOozQkn+lJKzs88vmQOHb/cILExZigZ9vnhqkxCTIw2lCxmHSPPTUI
 sHQoukylxE6bw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tAnvP-00000000Jd6-0wk8; Tue, 12 Nov 2024 11:15:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Tue, 12 Nov 2024 11:14:54 +0100
Message-ID: <f8dcc9e65bd6a348f2448ceaf2ccbd624d388043.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: zklYLXCPQDhY

Make error handling within ghes_record_cper_errors() consistent,
i.e. instead abort just print a error in case ghes GED is not found.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 1dbcbefbc2ee..e15a411b47e1 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -377,7 +377,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
-    g_assert(acpi_ged_state);
+    if (!acpi_ged_state) {
+        error_setg(errp, "Can't find ACPI_GED object");
+        return;
+    }
     ags = &acpi_ged_state->ghes_state;
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
-- 
2.47.0

