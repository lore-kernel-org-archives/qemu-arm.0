Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp336166njg;
        Tue, 25 Feb 2025 08:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLqpNR9M9jUajXs+TCOdAF+8PnLO8vPoeWUbu+qO2EXkFJDJY7lQ9VbeAs9a7cN1btkrK8fKtfXyT9gw==@linaro.org
X-Google-Smtp-Source: AGHT+IHYipvStN4AReG3GvOFKpyQb7nZE4MPQHaVpO7X5h5HthG4Boh5nkTNGgQ5voBgJYMay1AX
X-Received: by 2002:a05:620a:2491:b0:7c0:7d34:6a7b with SMTP id af79cd13be357-7c247f2540emr1189285a.19.1740501207113;
        Tue, 25 Feb 2025 08:33:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501207; cv=none;
        d=google.com; s=arc-20240605;
        b=j0RI74tBohhz4PvFDaC/l33zEhTTJ9i1BIKWjJZdJ5ew7GfrjWKUGNpUV22vN855sB
         09THmlwQ9ZRcF8zk1yZm1ZJYv7wCeoYyY0b6HtCQHa5sGzLuoSIf25tinokMQkZ3Q0bK
         /UZ3L0z+LCogPg3/zbm5HMRbksnQ0YdjlpIWlHW74AvFgLA0aCOEsaQgsRImbOaaE3Qi
         TdQY0p4O/5RzEL3VAl70gWkPp0d7GCaA8ea4T3MmQ9OBHIuxbF2CerTjIRAjWPW8wc4x
         x6myub97m6YBRy6PhA3/9eBLaPDj59gWV1jKSMBRaVxufzRq+rckiS8arrQ/vt16acFD
         E2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JFDFFq7t9RmvQAE+ehbygh7tcsYjypsCt2/aBZx2p4Y=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=L4jsIpVe6rBuRkMpeAYpXZ0gIfz3C6eTi3xv10x3ljSmKACzabXuRPZ+uoDlchBK72
         C0jpfonr2gOqKfRrNBDB8nHv8xtMqKX6RstpUSbTPLVDakCWCfj8YivGiD+k39I1DLEO
         hey0ASxDRVFPkih2dULfIyxpALeqwJg5wzwqF9SnJXb/XpRnPTLcza9C2vuywghhn/Fg
         LpH2c0DmxmiCxxulHO10McgANf8eZsk8SzTSYEVEeeJB1N+BnUdwJb2BaSkIQPAvIMsy
         B1uiltRvF8heyGvmR4c6ks+BeP/EW0xsj/1JA8oBN9arkwxUEzn47qyt6E5DQItxpD49
         7HIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SIrgErvC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2c52b2si200116585a.218.2025.02.25.08.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:33:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SIrgErvC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmxqF-0001Jl-T0; Tue, 25 Feb 2025 11:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpz-00016L-Ly
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpx-0006az-Ne
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFDFFq7t9RmvQAE+ehbygh7tcsYjypsCt2/aBZx2p4Y=;
 b=SIrgErvCBWFaSrU6zG2fkUqycosTmH4UVmGXQcWI4BYHbzLIsX/E4cFRcYu/iSOqdcBRQR
 q53IUZH6fQszsIbg4mtkDIuhFnCFYQIhLiGafXG5gTuRfofQNW6hzEBB+I2loR1YZTn5M+
 Kzu5NXBd9JpeTX/Yb/Wgl7pR73+0bjE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-Cukkvr9MPpiOm8Mhm4hxFQ-1; Tue,
 25 Feb 2025 11:31:09 -0500
X-MC-Unique: Cukkvr9MPpiOm8Mhm4hxFQ-1
X-Mimecast-MFC-AGG-ID: Cukkvr9MPpiOm8Mhm4hxFQ_1740501065
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 459AC18E6952; Tue, 25 Feb 2025 16:31:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED36A300018D; Tue, 25 Feb 2025 16:31:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB9B61800792; Tue, 25 Feb 2025 17:30:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 17/24] hw/uefi: add to meson
Date: Tue, 25 Feb 2025 17:30:21 +0100
Message-ID: <20250225163031.1409078-18-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8iL+rxro75FJ

Wire up uefi-vars in the build system.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/meson.build      |  1 +
 hw/uefi/meson.build | 19 +++++++++++++++++++
 meson.build         |  1 +
 3 files changed, 21 insertions(+)

diff --git a/hw/meson.build b/hw/meson.build
index b827c82c5d7b..138f5d59e178 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -35,6 +35,7 @@ subdir('smbios')
 subdir('ssi')
 subdir('timer')
 subdir('tpm')
+subdir('uefi')
 subdir('ufs')
 subdir('usb')
 subdir('vfio')
diff --git a/hw/uefi/meson.build b/hw/uefi/meson.build
index a8b168941255..e63708aa164f 100644
--- a/hw/uefi/meson.build
+++ b/hw/uefi/meson.build
@@ -1 +1,20 @@
 system_ss.add(files('hardware-info.c'))
+
+uefi_vars_ss = ss.source_set()
+if (config_all_devices.has_key('CONFIG_UEFI_VARS'))
+  uefi_vars_ss.add(files('var-service-core.c',
+                         'var-service-json.c',
+                         'var-service-vars.c',
+                         'var-service-auth.c',
+                         'var-service-guid.c',
+                         'var-service-utils.c',
+                         'var-service-policy.c'))
+  uefi_vars_ss.add(when: gnutls,
+                   if_true: files('var-service-pkcs7.c'),
+                   if_false: files('var-service-pkcs7-stub.c'))
+  uefi_vars_ss.add(files('var-service-siglist.c'))
+endif
+
+modules += { 'hw-uefi' : {
+    'vars'     : uefi_vars_ss,
+}}
diff --git a/meson.build b/meson.build
index 0ee79c664d39..3f998249d97e 100644
--- a/meson.build
+++ b/meson.build
@@ -3596,6 +3596,7 @@ if have_system
     'hw/ssi',
     'hw/timer',
     'hw/tpm',
+    'hw/uefi',
     'hw/ufs',
     'hw/usb',
     'hw/vfio',
-- 
2.48.1

