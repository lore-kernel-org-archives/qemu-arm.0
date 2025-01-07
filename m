Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp240577njb;
        Tue, 7 Jan 2025 07:35:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTCd0FTu4IjnIZxMPoA+ZLLBPYX92jhj6r1Cvxr+4mESTtDv9k81QDviDiZCAGk6l6CMNaVMTljSlWPw==@linaro.org
X-Google-Smtp-Source: AGHT+IHLIMIRKIdE8lqf/W1tB9yS8ACZkl3wurb1ihfvEckZvPjXo79nSvS++LWz0NsY6ne0z0Ee
X-Received: by 2002:a05:6122:2383:b0:518:859e:87c0 with SMTP id 71dfb90a1353d-51b75d40f16mr42672748e0c.9.1736264102280;
        Tue, 07 Jan 2025 07:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264102; cv=none;
        d=google.com; s=arc-20240605;
        b=DpbZqPHeVAFvRjd/vr6gQu5AxJECIxD55trLfvmWgWvY9dj5aaQxNIedwyucdl9PaN
         Z0N+EclYOY22AuIO9fkioHUPxeo5UAE0mNAuE3CUHE+MKS1GFpSDb/uY60BgFSkCUzlA
         caWtNFhMutF85ZC564MJlo2dLrBo1yAH3FhWdbFoGUSmlM0fQFZ5NdhfjyPM0CCnghCI
         6eJ1M7lS1DAyLIoWGU0DSWZJOoXRB8g6+XpWleO3ucz4JZjACeYKZO3B3G2Juhs5MS54
         8CXzRdjRE11BFWLvwH5fYLf5bnw0jerfosvbiE3k92faqP5/SbH/RQFPcELViwsrHZe3
         PZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9AeNcEVQWo89Dm1WgbEXuyIA5BpKIMEbdxMGTfP9Eh0=;
        fh=2A4XrmpWSce8Hg7gb/jK7T/bzdECrSdzPXJ+gvyt/8c=;
        b=WguiPejpfcJXOX7C0AmehorgE6eZTaq6XX+EZZ7inlsCKxFQWazKV9v56Ttq1C4OJO
         7nIJjbRm011homxo1GNAaI/atSyobfHG8T3jZGqfksqfTlr0LAewA/5JAIQQJrHahwJL
         fSaMctoAyUpOj+OANjsa6egBOFRdLobHqfmQmYOgt5EFB1AUXFdKzialDPs4FNCeYU8U
         r/uW9g+0NiGlnyAaWYuenvdtsTdmWf29Ae13Pn9xpJOFVaRY9DBNav0wRgrHR6f4eVwa
         idDobgQEQ+9zI0NOGKg7Bp9H3W2SQFOx5xqBe/Oyy92YVzbNBOyo649MOr5HgMCg1Xwi
         LxgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sw8uhxTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51b68b83547si11629598e0c.17.2025.01.07.07.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:35:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sw8uhxTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVBb8-0003Gr-TG; Tue, 07 Jan 2025 10:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBb6-0003Ev-4D
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBb4-00057W-IC
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9AeNcEVQWo89Dm1WgbEXuyIA5BpKIMEbdxMGTfP9Eh0=;
 b=Sw8uhxTl/1Um5vTj19rJDNPCljERT0Igz7z7gRAs4cQmuNKUKiF4ODmCIiDctfMF7yIsM2
 rMGDEGU7yFPxCsHpnfftdGImBci2ClDULa+YRYy+Nnl3tJGiEks2JwLYiP3uVAYSgkdak8
 7yn9mSG2c3bGmEknEBxoVr4Vo5bDpjw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-8W-ZHYf8OI66Th3kFKVAgA-1; Tue,
 07 Jan 2025 10:34:20 -0500
X-MC-Unique: 8W-ZHYf8OI66Th3kFKVAgA-1
X-Mimecast-MFC-AGG-ID: 8W-ZHYf8OI66Th3kFKVAgA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CB9F11955BF4; Tue,  7 Jan 2025 15:34:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 792391955F43; Tue,  7 Jan 2025 15:34:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 644E018003BB; Tue, 07 Jan 2025 16:33:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 14/21] hw/uefi: add trace-events
Date: Tue,  7 Jan 2025 16:33:41 +0100
Message-ID: <20250107153353.1144978-15-kraxel@redhat.com>
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qQysdI4g0Wj7

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
2.47.1

