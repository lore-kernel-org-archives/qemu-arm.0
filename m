Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97439njm;
        Tue, 4 Mar 2025 04:50:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOVdVe0qwu5laCROjp6SL+6jL3bi17RSMr0VQxykL+YezuJ3fuYPX6pqOfPgwfjdUDHA1DKA29d2mCNg==@linaro.org
X-Google-Smtp-Source: AGHT+IFH8gMeMpMjGwpUuNlRpSiVbi2F3/86UB4y+NZO/LhDxt13DAMx0xYqodKzYUAB+1s1NHfO
X-Received: by 2002:a05:620a:2b44:b0:7c3:ccf5:363e with SMTP id af79cd13be357-7c3ccf53affmr411980385a.13.1741092655777;
        Tue, 04 Mar 2025 04:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092655; cv=none;
        d=google.com; s=arc-20240605;
        b=bjTb4Ti56oM0Cor7Sklj3fbJn/p2wo9lC5T7vZPb8G8y6VbOs7yTi+g/+9pnx71c0v
         3oTka0zIcdPTVKLQVP070P4+CXSmw2KEZ7eIy1aWZHFpdRdCOSV8OjjwSd4WGxg+XK65
         8TtuPZaAlIzXcaIG5dzxzKfnZHnwuJG0Y8ZjAHi7947R8TG0Vn/JoTyXv8FvBZ7DFkkr
         y+YcKXVAuEFhZ+nJ28RsZLlVFX+4/fhz2v5csWz08gJLNcmdRXr6bYFIcbxa3Ziz87w8
         WaPW9Iy+aZkzxwJgxtv1ro3nBEiVF/p/RUHJt1FwSHFku26F1LlrLiF5PS4UkSBbfZIr
         J6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3qeXiKKN9mN2MvQuP0cwS67dllhWH2AESVU9x5DwHPk=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=WG8tlcjZJUeTRG/Ve+9htPFqO9dU+EmkdL5BLAtvUjKrz34nAimFiIknW59GmbExQX
         zEgqy4x3wLcLxsXxgD7b6ZZmkj23gPC6kDOY8TakWEqc7tkBXj7W3crCqHgillZO0SKN
         KVRmT6qjf/4dsUjVJL/Hdt+ntwvrnMNx1w7AkGxyQ8G38VG38xoSLhvoE1MJ5xPSIvUx
         LPiU9JSQAKlRrLQ21dBjVgB/GIWLMpeN1XcsIJ54/SM42UU6pAEsJlCHsmkzbxJ9S2WI
         TQzsOLvEdmDNdGev+UdzPcdujB2VVn0xY2b0/ZUgandf5zw4XqpPt/7HhGtWqxcqBBQk
         UqZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FinQ2VQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c397674b0esi1021554085a.529.2025.03.04.04.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:50:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FinQ2VQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRie-0005gW-Ms; Tue, 04 Mar 2025 07:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRho-0004ut-BE
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhm-0007JV-NY
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qeXiKKN9mN2MvQuP0cwS67dllhWH2AESVU9x5DwHPk=;
 b=FinQ2VQ5GEeDCavTMDDvv1C5VYfJ7bU5QXkaoqXeChrTyQlm4s8vv3tK5/6iFwlWHbR+/g
 RMRYyt/iwCNdmmmjODigLaZiOA4Xsh6nlaCZNh1+BsptZkBfsJoGj0vFhc3gbDo/tT5BMo
 2zbTXpklO8ph235z+gWLzU6ADDYvvYQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-No_hiDLhNKigmvXSDToysg-1; Tue,
 04 Mar 2025 07:48:47 -0500
X-MC-Unique: No_hiDLhNKigmvXSDToysg-1
X-Mimecast-MFC-AGG-ID: No_hiDLhNKigmvXSDToysg_1741092525
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A0ABF1954201; Tue,  4 Mar 2025 12:48:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A2001954B00; Tue,  4 Mar 2025 12:48:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 34E151800603; Tue, 04 Mar 2025 13:48:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 15/24] hw/uefi: add trace-events
Date: Tue,  4 Mar 2025 13:48:03 +0100
Message-ID: <20250304124815.591749-16-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EPle5Kdv2K0W

Add trace events for debugging and trouble shooting.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-16-kraxel@redhat.com>
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

