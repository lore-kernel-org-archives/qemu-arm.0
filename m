Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1283264dlb;
        Tue, 18 Feb 2025 23:19:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEbc6dQeIm6j0WvovV/OT++1bJb1yqt3xoWk0IulFETRqrPSbZWyAaFbdLFy+nF9loSkKjPxyw15WRoA==@linaro.org
X-Google-Smtp-Source: AGHT+IGNe/ljzz80sw5C4yc/zb7MSAy1iefEFrjYhWNDg9BLtDaIaHztM0pK79OeRUVeXt+fWr1E
X-Received: by 2002:a05:620a:4050:b0:7c0:a531:fe30 with SMTP id af79cd13be357-7c0a5320030mr1340507285a.35.1739949562085;
        Tue, 18 Feb 2025 23:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949562; cv=none;
        d=google.com; s=arc-20240605;
        b=YNuBDjpttFC/G6/3U4Xf1+ErRdmX+SoFovUrDHR6Dmmii1UUEh8LcTlcBDN+q0UByG
         gJc5PyhDD/CaI12V4aBHC+/XPnQ81pKNflxaWp1gEzLmbHepSiRCgKHHFXlFrC3j9eu6
         d/GHSw7e2fFFU6a/R6ff5JzRijFGGfZPhN+caOMv+5vmCfApM/KnOZ2JubDvKVDcoc15
         97su7sNxz/LMQjWiDKVUYEbyCeI9/tihjDxDnjdNFyLabeO2/Zo3OqxJeyjMUdR6aGET
         FdS/RE1KGOelaV5xBj6CYlq5ea8CgnckYRs8g81EbO4Hw+8PBHBregfcfJB1jKmo27x9
         2HoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t/vP1Y+kMo8kS2TrEex+VX8EYhsx5K4oxWryHizZVQE=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=bn5uw0KO1vgl7fLAw7F2dI8AWjkTOEgkcWd7dJgvbOtkKwDhi4jXSrT5EQtRCUOjSY
         cApzjCGTNgLm3BCBmc21hZk76BtmhczcTyIrTyOAy3v3eun8kB2OSa/L4pkOIvZRYaTJ
         9fJ726EX07v1+lqGI9/kQqDsAmpNZxl3AXLbzKlNZ8IECYk4nuYnn/OcGuQrixI51/IM
         rTHKLan8HquXye9lQlAabHD+jAOURbbvphFGphl45XKrKkNVJSld8Vyvxz9CXxWX5ECw
         L9Bb2YEUsJbRD2jMNQ7phYP/i1BjgEHpm3vzHKr8C0EVnmckt+a7osOCCj872/uwjbAs
         Ol8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=STbmQ7BA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b68da788si107403285a.111.2025.02.18.23.19.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:19:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=STbmQ7BA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeL8-0006aY-OR; Wed, 19 Feb 2025 02:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIm-0002Yw-Rm
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIe-0005Jt-Fw
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/vP1Y+kMo8kS2TrEex+VX8EYhsx5K4oxWryHizZVQE=;
 b=STbmQ7BAhekxFUPCNSpyDcfjQSsXSuFOC2aR/wDWp9YBxQ1FWsp74+ScOdUQcDO8AAXoV/
 0UNGuuuti49bDh0Wo994LmP5N0wngLCUHM6wLer6akV+DE1iJprbapcVRTyg3Vume154hd
 iR4Dqg9nlNikTG2ap8QLMSEQIEEhkaE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-AoMnHrTDOaK4A35kA9zrKQ-1; Wed,
 19 Feb 2025 02:15:03 -0500
X-MC-Unique: AoMnHrTDOaK4A35kA9zrKQ-1
X-Mimecast-MFC-AGG-ID: AoMnHrTDOaK4A35kA9zrKQ_1739949301
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BF71F180087B; Wed, 19 Feb 2025 07:15:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7460F1800940; Wed, 19 Feb 2025 07:15:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F38D01801AB7; Wed, 19 Feb 2025 08:14:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 15/24] hw/uefi: add trace-events
Date: Wed, 19 Feb 2025 08:14:17 +0100
Message-ID: <20250219071431.50626-16-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: FGIgIVg6g5e2

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

