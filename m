Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp192544njb;
        Tue, 11 Feb 2025 01:27:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX30tjtu0KTpMW65wPbLpYsaKUJlXv+Ony0N367uPQgKkzMFddJ9sUPV7xL2adhWSkK+0irjHuCSYd0Bw==@linaro.org
X-Google-Smtp-Source: AGHT+IEIK4Bvwc5t6BOnbKYsGO4f+S6IhhTC63mhc7v0T7kwf6sRf2qtezMecmJbyzEllJSAw4gt
X-Received: by 2002:a05:620a:4807:b0:7b6:ea67:72d0 with SMTP id af79cd13be357-7c068fa05f4mr402362485a.4.1739266023308;
        Tue, 11 Feb 2025 01:27:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739266023; cv=none;
        d=google.com; s=arc-20240605;
        b=PvI96SQrUWv0ld24vWZRX1bWHquAGoU1VC8bXEg31vNTeOBaBsEbDUvn5mpc+fB83x
         u3Qnb6SV8zyFEkSAKIGjQpWVnR4ndtrLU/DJLGInYTpCmq9j0hUUU3Li/KqxDqeK2+D1
         Muji65vEoJaUA6A8UqOgDQ4HkvNKm1QjJ5FWy7k/yhGJybXhVLYvf2WRLz3JqE4j5137
         iaeqTW99DzoiqB3+8Of9Mj+2y5+xGTDjudyT78P+tq3neIw68HnfpAS7PPuzwlTscLeE
         t8OmFaaDPH69g8ISe82zEBHjR5bD0C9aVA23qOV2X6hP8jTSFBl/bqzFjHsoxOmJMszb
         bSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UfzJa85ik8HDMKewE83Gp4yd8DRMF01tRJCM6geVxi8=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=VDlbj6tn5i92qKGM27dAaeg6QkpER817GOt2tFQUcPvR9BUZELVfByYpEm4Z1f0TdX
         arm5xlpa8aH7G9aQK5rH08lhq5wPIb5tGqqnhNXE0EJZF5nFxpMQXGc1+IA49dmlToGz
         g8N03LwPBzgQmdG5jt25g76w9G01xClOCUHuONEkYN1cSQaxqFM+5S1RxWLTzehIS58A
         YYP6CHGix2bKOVVNBs9BM0lQ2K43bxqyC5YAb9kQ9OCq+IY34yGLlyS7oZ/R3d0/Zq3u
         WuUDm/kNGldWaNnFtX9aeo3X0GSRfc2ZcJyYBsLeSzgiOj24jvzcP4fTUvGKDB4qu4nu
         vEPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ICra7dJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c054d7f6a5si594975185a.83.2025.02.11.01.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:27:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ICra7dJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thmV1-0002l6-5k; Tue, 11 Feb 2025 04:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUr-0002IY-LL
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUp-00034F-Si
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfzJa85ik8HDMKewE83Gp4yd8DRMF01tRJCM6geVxi8=;
 b=ICra7dJuGQsJzPmLtWSv+j0nhgqNZSxyEXl7itrVLQJBjE6ta7a1izU0TTRJfygYrWTD1h
 /mVMW1ofrOBw8V6rQf+cnWDNR1UqJ9TVkU6FlHStsa9pptaFgxjmwegM9W13q76P7WcbCJ
 ElqhmqMVi4aEsGmj1QXlHGSHCxoqSPg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-Ub--DrYqMbunoNQki3_hgg-1; Tue,
 11 Feb 2025 04:23:53 -0500
X-MC-Unique: Ub--DrYqMbunoNQki3_hgg-1
X-Mimecast-MFC-AGG-ID: Ub--DrYqMbunoNQki3_hgg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1049819560A0; Tue, 11 Feb 2025 09:23:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BE8851800358; Tue, 11 Feb 2025 09:23:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80AEC1800615; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
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
Subject: [PATCH v3 15/23] hw/uefi: add UEFI_VARS to Kconfig
Date: Tue, 11 Feb 2025 10:23:13 +0100
Message-ID: <20250211092324.965440-16-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: DjB89oCb9R9Z

Add UEFI_VARS config option, enable by default for x86_64 and aarch64.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/Kconfig      | 1 +
 hw/uefi/Kconfig | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 hw/uefi/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 1b4e9bb07f7d..c4dfe2e7af7c 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -37,6 +37,7 @@ source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
 source tpm/Kconfig
+source uefi/Kconfig
 source ufs/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
new file mode 100644
index 000000000000..ca6c2bc46a96
--- /dev/null
+++ b/hw/uefi/Kconfig
@@ -0,0 +1,3 @@
+config UEFI_VARS
+	bool
+        default y if X86_64 || AARCH64
-- 
2.48.1

