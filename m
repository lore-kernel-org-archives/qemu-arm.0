Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp192230njb;
        Tue, 11 Feb 2025 01:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+mqi66QeZqpfX2lM1r6buj5Nsj2mJ7chqXQdWap0MPKgjZW6fHhiLywYjWctMZtFdEadNEtj1Ou8JTg==@linaro.org
X-Google-Smtp-Source: AGHT+IEXfRDObCjM2cngvg/JRIULMtwSwaWRiQS3Ef3Vg8mc8RS7N/Akbw0VGOTuYfpOInhR/bqK
X-Received: by 2002:a05:620a:240d:b0:7b6:6756:eefb with SMTP id af79cd13be357-7c047c4fc05mr2289507285a.14.1739265969880;
        Tue, 11 Feb 2025 01:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739265969; cv=none;
        d=google.com; s=arc-20240605;
        b=AywN7LzYP5Z3sau8tqYIqc4be6R4PIeZgqRZs4dCHYaX7yERInA3AICpPKQm0YsQQr
         YYTbyXyVrZqRNmYhEIW8QLMX3PXl1i3fX/f0JeyzA437+B6TTm/WKnzc+GfSTAoQlE50
         3ZjKKYAjx15EgAxjsbu8ERIsBr7gslDPp3kvlcRWgxugkcRxqT6NP5L3k/LynijXho1K
         jzvmlqbUR2uG6tGpvry6go8JQ/PMROjP9KpzZdEkhHVpGv3e74APgwwXjaWXqTS57rm2
         lcc5GeFEV0XytxpunBCXRXRQtuxhUJ0UgD5BZbsYc2oehK6mQyUD3nqw13X7efc68Waw
         ZjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TKdwZvyhf3AyL2aXgrlDVk8wuUKmsj3JfMm6+YqDKag=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=DGAwB2dy9anSnmf14dZJzAwy2AL27OvPxGLViM0WqOs8yeA4wb3ECt9yhK9SqqtmWc
         b40tYhnrw+f+RlJ/Wl49yOJldNwlVARgPj+UCfoxr4EkpEQw7zKP52pwv3O1KDjaeZ8D
         5FCvm9xNYuM2pBa+6bdQvMr3W8i0aAhZQ+R+nQTIJgGB/kA4mkykMyxIuQxcDMYYr0fQ
         bCsPGUECebxg6B/H6QrgVckMpVsZtXiLHMEBr+l9IL5OP10ByRMDRMdcAVc8nf8r77zr
         bvNHfYah3qHzzsVyNntc8mvL7FFHWcRWkU8SsZ+iLbK0wD/I1SF+4TYwF6jCrGsVMET1
         W1Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=boKpTV2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c06cf392ffsi26078085a.630.2025.02.11.01.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=boKpTV2O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thmV5-0002y7-Ow; Tue, 11 Feb 2025 04:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUt-0002OV-MF
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUr-00034x-Ap
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKdwZvyhf3AyL2aXgrlDVk8wuUKmsj3JfMm6+YqDKag=;
 b=boKpTV2Osz6qhvc9mrOHNdUF5OeUhngFPGocxAxWhKoYRrgzFasi2lLNGtDKagXL8HvFqf
 efTPwd7ltq73JrXue/zINv8eCMlhcCltgOyGqIwdtQ/0NmnP6vhFAYe3SLkbEb33VZIHv0
 ynnvDns57hliIqtMgV9EH+gLgDyAVsM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-Q3dBSuKgNX6o3gQZjYagpA-1; Tue,
 11 Feb 2025 04:23:56 -0500
X-MC-Unique: Q3dBSuKgNX6o3gQZjYagpA-1
X-Mimecast-MFC-AGG-ID: Q3dBSuKgNX6o3gQZjYagpA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AEDA3180098A; Tue, 11 Feb 2025 09:23:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 66A581800570; Tue, 11 Feb 2025 09:23:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 94D601800616; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
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
Subject: [PATCH v3 16/23] hw/uefi: add to meson
Date: Tue, 11 Feb 2025 10:23:14 +0100
Message-ID: <20250211092324.965440-17-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: oURGnsb8YuCR

Wire up uefi-vars in the build system.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/meson.build      |  1 +
 hw/uefi/meson.build | 18 ++++++++++++++++++
 meson.build         |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 hw/uefi/meson.build

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
new file mode 100644
index 000000000000..d280881f457a
--- /dev/null
+++ b/hw/uefi/meson.build
@@ -0,0 +1,18 @@
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
index 131b2225ab67..9202a35cdff1 100644
--- a/meson.build
+++ b/meson.build
@@ -3584,6 +3584,7 @@ if have_system
     'hw/ssi',
     'hw/timer',
     'hw/tpm',
+    'hw/uefi',
     'hw/ufs',
     'hw/usb',
     'hw/vfio',
-- 
2.48.1

