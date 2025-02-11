Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp192233njb;
        Tue, 11 Feb 2025 01:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIKq18voTtMQyM8E4+svw/GhKiq0k3sYFi6EWJP7NWzIk237enR/MjivV3BR1FekDCN+CpHBujao4o3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGv7dcoKJLceZ38bElU5kY2Uv+tXmchNgiz+LMx5JtQrt3TM66jB0PeIfvdxHSFHXHSDrCq
X-Received: by 2002:a05:622a:4d8a:b0:471:83ac:98ba with SMTP id d75a77b69052e-471a0648e64mr40864551cf.5.1739265970638;
        Tue, 11 Feb 2025 01:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739265970; cv=none;
        d=google.com; s=arc-20240605;
        b=J3dN9bRlqrzRuGOxH2wGPgxDDKM9vtwrQO4gzchmd8tSFdZbgYvH0RJ956BsA1xwTh
         KAvOWyiYQtluqqeB/Q0zixsFe+ofSZollV6rrdokfA8+1PS57Nc3qXFFcl31Qd7r6U1K
         YLNZDdBSIKEZj5ejS2pDBp3bSOh3ZcQXx26eesofRReJtP7RGIuaDUWt/PGnhsFkfLsd
         KcGGF6tvwcoBW8qIFjEidqIx0U6XrpB77z97JnZE5JXATl/ke9dRnbeiNhSNOFPMnIqt
         Q49ui7Vo2Mr68p8FSq5Dk/yq4Ugq2itlCAGpeelHoDLbWuMIPgP1aTB8nxdepNAHWrfr
         8pWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t/vP1Y+kMo8kS2TrEex+VX8EYhsx5K4oxWryHizZVQE=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=X5UH1iTNCsN7Qq8OmNHA2ucZYEYK7PognkaqkJhyemGE33hlIPwSdsBLFO/hi4vvVV
         s+65g7nwTpTjTOGHXfQhLTJupolIG2nfXQ2cbbyUIzydIT9zQ50yKz9E12q6cmnDkGGD
         0iemPqv3hK3f33dnfsoZgEJiryNH6BQoTBVw6PG2giroZkgs3588RQ1cID0ehln7eGPX
         T3v7H3uPJLywBTcCvwsLpBR+HrgMoG6uEZseHIJRJMTXu0w3ir1KMYLYIvbgV74IpeRW
         XwYrLTGZmNnSSrhhCDot/3MvWoH5LjXT4w5LjtFmMs4UDaBGFSA9WDDESCLTafUNX0GD
         HOTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hH684VBD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4718c9555f5si46960961cf.91.2025.02.11.01.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hH684VBD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thmVE-0003IV-2d; Tue, 11 Feb 2025 04:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUw-0002UR-8o
 for qemu-devel@nongnu.org; Tue, 11 Feb 2025 04:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUr-00034S-AC
 for qemu-devel@nongnu.org; Tue, 11 Feb 2025 04:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/vP1Y+kMo8kS2TrEex+VX8EYhsx5K4oxWryHizZVQE=;
 b=hH684VBD3lVjY4jZl1H9chwv2yudct4wghzjyDnze37wpJ3G2+EUYs6wtzvAORGhtDVi8/
 axp91T6qeRUtSI61eIockaeBYl2PmpZRLoBHAZPaW9UHeOT+2jPcMXpk3jewHSp1P5F8xn
 CwTKytuzzEAJMdR1EIY3Mhr0E0vyEK4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-ZLkvnQxFOk6LhNQyu8WaGw-1; Tue,
 11 Feb 2025 04:23:53 -0500
X-MC-Unique: ZLkvnQxFOk6LhNQyu8WaGw-1
X-Mimecast-MFC-AGG-ID: ZLkvnQxFOk6LhNQyu8WaGw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6DBE01800268; Tue, 11 Feb 2025 09:23:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DB74F30001AB; Tue, 11 Feb 2025 09:23:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6FC761800610; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 14/23] hw/uefi: add trace-events
Date: Tue, 11 Feb 2025 10:23:12 +0100
Message-ID: <20250211092324.965440-15-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: TeDYilqOMzPG

Add trace events for debugging and trouble shooting.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/trace-events | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 hw/uefi/trace-events

diff --git a/hw/uefi/trace-events b/hw/uefi/trace-events
new file mode 100644
index 000000000000..3694712a946d
--- /dev/null
+++ b/hw/uefi/trace-events
@@ -0,0 +1,17 @@
+# device
+uefi_reg_read(uint64_t addr, unsigned size) "addr 0x%" PRIx64 ", size %u"
+uefi_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr 0x%" PRIx64 ", val 0x%" PRIx64 ", size %d"
+uefi_hard_reset(void) ""
+
+# generic uefi
+uefi_variable(const char *context, const char *name, uint64_t size, const char *uuid) "context %s, name %s, size %" PRIu64 ", uuid %s"
+uefi_status(const char *context, const char *name) "context %s, status %s"
+uefi_event(const char *name) "event %s"
+
+# variable protocol
+uefi_vars_proto_cmd(const char *cmd) "cmd %s"
+uefi_vars_security_violation(const char *reason) "reason %s"
+
+# variable policy protocol
+uefi_vars_policy_cmd(const char *cmd) "cmd %s"
+uefi_vars_policy_deny(const char *reason) "reason %s"
-- 
2.48.1

