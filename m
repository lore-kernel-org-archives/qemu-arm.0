Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp242665njb;
        Tue, 7 Jan 2025 07:37:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnk9MfiAmkHR6zdeYDvbvJJADZjHUdBK5AEaRdkP23dkf/wTo/D6tMh/awKCGr4h0iWrRQIXGblmQM6w==@linaro.org
X-Google-Smtp-Source: AGHT+IFliLKGkV0JExcgrh9BNTONAl6RNxK+CY4m6D/6RH2RSc2c0dFonOr1/1vjjnJ3NxedDFtb
X-Received: by 2002:a05:622a:cb:b0:467:62aa:c6d2 with SMTP id d75a77b69052e-46a4a8b87a7mr934592891cf.9.1736264275321;
        Tue, 07 Jan 2025 07:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264275; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/oo3Y8V3nAfn2RVaQfVa1nsIEt/8SwkV3jANpB/7EIQg6ekDKBnLQ5IR/rIkVaYKS
         NJwGOEFaglRTSftslbi/++921bvrFBNyMV99adSZ+XGG+4uW3YXVTDvYCTmpt4yVzbw1
         /BV3AaqWLqHky650wjPxrlFwDt5Biw9ePsAxUu/5aMqPq/rY0NpDA+6DW/a+mV6Z9I7F
         5xGYYa+P7GtTbqgVujn6R4ilYsJZ0aV4XW5HM60ty6elKvOBrpcxMtc07jFazazuAcO/
         WY0HXedaE4llpHrElOx2kmj4FTAxdyrT4ohQtg9ScWQmf8/UCeZYfEoMwXkK8Vp+hNYn
         Gl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PjBrYgOwtmo8qMJXJpTwd/TA0zSKEe5ftLA045b+r08=;
        fh=2A4XrmpWSce8Hg7gb/jK7T/bzdECrSdzPXJ+gvyt/8c=;
        b=W2862s061UFOTeVdXqPDyIInc3UJcXQCndQUmlMtWYb+UFxLLFczBJbju5r6ZpXUQy
         ltd8P7sYmcCILTv8XoTUzMHbwx8H2Y3fpCuPCgN1/1CYR4MqOQ/Zyilb+3qYTlwKfZ3b
         Rjyfysq4P5LBt4OswSE/mlna7udl/HdxxlPLC6jwLnmYTuKtmh2gN3RXjOxBuEBWB1aJ
         cVESKQ3oDyAtdj7nzGkiMOhS0rfAqP2MQvlnf3kmcctCDL4QEny9tRxNCck/wzyz+Vjt
         pcm3CtZJJMfALHWeRp5+w2WkoMT+vpb5V1urJzqpgUVscn7fiufAAZLY2hFboJ3k/Uyb
         e7YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NVIyDoKz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd7397si441973591cf.573.2025.01.07.07.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:37:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NVIyDoKz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVBbA-0003I9-6d; Tue, 07 Jan 2025 10:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBb8-0003Fs-8S
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBb6-000582-S8
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjBrYgOwtmo8qMJXJpTwd/TA0zSKEe5ftLA045b+r08=;
 b=NVIyDoKz4ftjQ3SOV5D9AU+XFh40pMlnqC4TNQmfU1OjHuEFy8WLBXY1Vd02UF/bV2/ZWb
 GT6PIuJHGKuBCmoPd7ENd9+R2hrzWGzam/HtRZo2HaEAYK2kRC/+2jTIwBKCf2X9FbL8QY
 BeIZN3Qzm2CYQBqmih5QvHEZKc/5zEo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-AA329mqQMX-hoWxKowrT9g-1; Tue,
 07 Jan 2025 10:34:20 -0500
X-MC-Unique: AA329mqQMX-hoWxKowrT9g-1
X-Mimecast-MFC-AGG-ID: AA329mqQMX-hoWxKowrT9g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DCC821955D5A; Tue,  7 Jan 2025 15:34:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9659E3000197; Tue,  7 Jan 2025 15:34:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7522B18003BD; Tue, 07 Jan 2025 16:33:54 +0100 (CET)
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
Subject: [PATCH v2 15/21] hw/uefi: add UEFI_VARS to Kconfig
Date: Tue,  7 Jan 2025 16:33:42 +0100
Message-ID: <20250107153353.1144978-16-kraxel@redhat.com>
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: pniXnOKDrxLz

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
2.47.1

