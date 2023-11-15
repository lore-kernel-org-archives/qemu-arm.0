Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2840173ejc;
        Wed, 15 Nov 2023 07:14:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGajWNbqs6SMc0M39DcBQKAV8Kte6e9w5Mro71/p9/kUeyMsCQFPC77L2S1anr728+GWcXH
X-Received: by 2002:a05:6830:214:b0:6d3:16dc:8b50 with SMTP id em20-20020a056830021400b006d316dc8b50mr5593098otb.8.1700061283818;
        Wed, 15 Nov 2023 07:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061283; cv=none;
        d=google.com; s=arc-20160816;
        b=V9k7ZwkFIGiRbNwA6U+SLyypGCy8sM9UTQ+q0voIdF9m5oyBRiHa2KiSsqh+kOCNu0
         aXI54xWpGXvqh4mlxD/5VffMP+0sHMGSPDpfXVKRinWqFvUpO1xk9cifqKWnxVmxPhl6
         8Iz/tMWgZI/tUsMFVDJYPxR41ZYYmDNZnqD2ASj5+/B7G/meguuqqiWqAaKE4aN3+q5q
         tLIrVN2uKtBwR67yrScvTjNYUXfNTdj+KIg0v8v7+ddf2QEKK2fOJ1O1+izqp9BvGgnQ
         KOa7EzplQjplin8146KrC+FYrur4JSYs6i7Eqnud+MpD2Qn0i7j73B+nmdnCVGFE2GpQ
         7R6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mvz57nypLBDQ/+QsfcFsaqvqGEDsE2bN5O3W4skmzOA=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=dpypP4OkGADZdebji5bFWCChJBZmIt/JpsIP9dbL7qtJpGwV4qdhluLle8FDN9SP7A
         Ee0DfL8jVTXcS2LXKAFu9XaBFNFlZYoHKhGtP3sQsVsrj5ZAuLX8WWoZ20vI3hkz55HV
         oIBpGcxAU+cMqpfwrbDm91gw1xBGjmcbaUR1TB1L/DFkipT+VKhBk7BZo5SeJezUAr7a
         fp9wCwRV3lq3tXuwu5YY6gGKohkp3q+2Sw5BvDzdyk+UM0XN8FDV8NTu3nWK2gL0e8kR
         x0L1IFzgtTMAFguMEomOiNwHKo/dBjB7JPDd3wYBs+9i2+2QzOATkQ6tHzEhUuJegXz2
         L+Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrHdOrrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id er4-20020a056214190400b0064f68c194a6si8923349qvb.73.2023.11.15.07.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZrHdOrrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3HZz-0003zf-Fg; Wed, 15 Nov 2023 10:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZg-0003uH-VS
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZd-0003Gr-Qf
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mvz57nypLBDQ/+QsfcFsaqvqGEDsE2bN5O3W4skmzOA=;
 b=ZrHdOrrSvQGlE+9T1CUpJmEHLQH2qNescxrWXdzLfhD8uXI4fjnLuJbaSlQrL3xtvlhez/
 elaak5ee/u0WWR+seIXWOyFPG686WCIbAgLXZ3ubDR3atCh/VgZWnXtcDKDJj+twX3oTrb
 eeUVhTHp7yOWhW8Nv4a9Lgfilfg3K5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-3P_lBYQyPLmypK5yV3JDlQ-1; Wed, 15 Nov 2023 10:12:52 -0500
X-MC-Unique: 3P_lBYQyPLmypK5yV3JDlQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC02B185A788;
 Wed, 15 Nov 2023 15:12:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD4F9492BFD;
 Wed, 15 Nov 2023 15:12:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 15447180AC15; Wed, 15 Nov 2023 16:12:43 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 graf@amazon.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 11/16] hw/uefi: add to Kconfig
Date: Wed, 15 Nov 2023 16:12:33 +0100
Message-ID: <20231115151242.184645-12-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Xz8hr3GfZs2F

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/Kconfig      | 1 +
 hw/uefi/Kconfig | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 hw/uefi/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 9ca7b38c31f1..af41bd4e0b40 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -38,6 +38,7 @@ source smbios/Kconfig
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
2.41.0

