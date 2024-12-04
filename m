Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp24423njb;
        Tue, 3 Dec 2024 23:43:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzTwujibJpQO9UQgPpHfI8O9hPrwAzpwDVPtYxgyM8dURHZW02URJtDzaEgKzyutdrOAomSnhhcfO2VA==@linaro.org
X-Google-Smtp-Source: AGHT+IEqs3WbhiVKHKHS3MM09jVxSS45SujK7D5ciD1LSA6DTTDTEOHB5KOB4INoH+r88SusV8cy
X-Received: by 2002:a05:620a:40d3:b0:7b6:72bc:df67 with SMTP id af79cd13be357-7b6a5d51bcdmr739971585a.1.1733298238536;
        Tue, 03 Dec 2024 23:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733298238; cv=none;
        d=google.com; s=arc-20240605;
        b=SsW7iZSyetgDT4VVZGt5bcY/SSpwkdOYR/ihoOEoXkSgEwiMasJtShNeGDylIJoJrF
         ztya4WYrdmdcig/4bcWBiKopqmmNAYS8bM5X/p3/1mCpWGOWK5GVl5rPDsIGIEuEHKyK
         JI2FQc16liQd2z+wqWLCFPjFZTcwtFWuZZxwd8M4bjXMXyN1s77tzqGLlPDZTu52eb08
         CKUNSmcNzkYNkUd0/i8/6NO82l5w+IxHxmAleTOWTOPmw2aCtCv7v3igwheahnYmSEK0
         arsi9QKZ9vuGdW7DKSDO43HG6v9fEC2sz80k2eRAieFA3WiM6Vh7zukBi5euvPPrwHF4
         ID/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=86D5w03GN46N4hQDaUq12ULG4qFYMYOyr19ho9PI6qM=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=DKqBWiJyQrsmVqIF6M/zi0kJz8QdH/O1plY8usOOWjV/SB/YG9HLo6HtIJl5TLvkur
         6hb8HV7JFNCfYrDk4bUgMEvKoYIQVJoGqqwrwKdIy6uT6JHmhCMtbQ89q+h1XT4sBFgI
         grVFa8FQaTsK5p/wEQqeNK/V3+ChctZ+VDbN2N4Svur0P4SHzQDauX0Z/tX/Qk+b2lwV
         yq1dAhS7aIDMpnJ+4lxFZuSMgIX+V2Vj2Z1zwNTj+jbTYqpOKLnqSpo1pI1vfdFthq78
         2gJvtx5iMVVx/cCpEZ7uCnobelIXc3i9NVJT8WNrIMdi+ozcQFdqrxLHjoplZ8QzQMH7
         KK9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cxXWcFIu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849cc8dfsi1505638285a.457.2024.12.03.23.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 23:43:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cxXWcFIu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIk2R-00040y-AG; Wed, 04 Dec 2024 02:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIk1x-0003mT-QG; Wed, 04 Dec 2024 02:42:43 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIk1u-0006Yq-Ks; Wed, 04 Dec 2024 02:42:40 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 88F2FA41C2F;
 Wed,  4 Dec 2024 07:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F2AC4AF0E;
 Wed,  4 Dec 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733298153;
 bh=0CyS+5uMH4bliw7AWJd+kEIWAWXpqKGP1aXYbGP2T70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cxXWcFIuBV+Uv+qb3yeN7e37cAaw4wxRTpUKKpdloMjvgg+jEPA0sVEQ6sFDuWcjE
 VxiH/ZVVsK0Logs1wRdr/QYITIwsWgY9Xb6nFjVk41NvjpncKmKM8gdVz/0oEKFhkO
 9STGetQjuSOlM6jwHeB+IoCNs7V+MX41ZD4H0BUpzKySAmSAl6J3b8Gy8CkJPP2yC1
 D/eBJ1GRdNeQqPVlfXyE44syuWDDgmjmxxrE4SLnZWB5KbtAzrSp7haX7ldWRNby2F
 BgWUTmyDz3NWnh6OcnDD0JNElqAwDDQcvUXw/UWVtA1JrSPWk3UPJTItg15RTj7CxG
 4gBRku+r/appA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tIk1n-00000004Kjc-1NTs; Wed, 04 Dec 2024 08:42:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 15/16] acpi/ghes: Change ghes fill logic to work with only
 one source
Date: Wed,  4 Dec 2024 08:41:23 +0100
Message-ID: <a633f129131a22e2aad6b1b9543b88867bf9d424.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: K0brCZkmMOGn

Extending to multiple sources require a BIOS pointer to the
beginning of the HEST table, which in turn requires a backward-compatible
code.

So, the current code supports only one source. Ensure that and simplify
the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a4453ee357bc..5efa50413af3 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -387,15 +387,13 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
      * As the current version supports only one source, the ack offset is
      * just sizeof(uint64_t).
      */
-    *read_ack_register_addr = ghes_addr +
-			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+    *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
-    uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
@@ -412,11 +410,9 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->hw_error_le);
-
-    start_addr += source_id * sizeof(uint64_t);
-
-    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
+    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
+    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                         &cper_addr, &read_ack_register_addr);
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
-- 
2.47.1

