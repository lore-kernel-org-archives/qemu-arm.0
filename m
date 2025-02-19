Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1283671dlb;
        Tue, 18 Feb 2025 23:20:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4/4PBxmPb6dcW5fQgudJdSMK1FT1ukAblUghG11zc5WljucMgCZLqIkp9sJw9/zI3H7b5tqGdH2NbHw==@linaro.org
X-Google-Smtp-Source: AGHT+IHXI8PfF5By3f2vs5hXK3pMIFrwdkp/Naj2kN8DkiSnWZf9aqLZ7GDvZaLkjvFi3QDXy76p
X-Received: by 2002:a05:620a:2688:b0:7c0:add8:173f with SMTP id af79cd13be357-7c0add82d8emr726316985a.20.1739949634089;
        Tue, 18 Feb 2025 23:20:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949634; cv=none;
        d=google.com; s=arc-20240605;
        b=Kl/x+KMWjijAa1F+srzhYaKT81mAqFQfVxLpRJg2IEUx9L6dGoC/gFqj/ynD+itHPf
         l2ABgdAbG6b2i5BwEggJx2zppF0SHTfzkm8yMnObtG4oaYbs/WZ4s63/4N1ghfm902hK
         RV6MejSjlgHa1fMIos46qswFrCt0xDPPJ5tuNAJzuk8gFhxFR3pgHCQwjjusTajRrd8z
         CWEVn5+f8yco5sjKy68ovt2fEpRK56ZNCDRqXk5yadrpje5XS5IuBYQFT2XC3cUi/m1q
         58pFGl6YIubbU489FY3BHVKlUJfGfahfcn8kXXZSfbEan+xv+8ItKuMk+f+evZuwbl8O
         eekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cw0MCn/bdftRyx7vMeZDf4MxvrJxP+D6Cvej/zzLwKM=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=KwTrM2jEsHdXPw6nqFrE17N0SYOmsd9dXTTmTvQq032MQ0VZf2nZnVlaPQkxSy4o3d
         zkb4J4HXBWW06UHF9KroTdrH9EZQG23mbsx+pbh8v2u+jVVRs3/ki+FQPtRIZ4eaOMMf
         PT49RNMHLDuINjdDeQmmdrD12B7sO5g/kA6TsUKruJ3e+ss6bj3gX1eOl9jlETRsukdG
         Yu/TOqbhI3QEgJtc+Xh7OsWuo1wSA5Swge9IxayaooIjkFXMZKwWjIqGjSyEW9+MXtEr
         PD7KXcbuXtQq+Jgfb1k4iAi4EmPu4YEfTw0/3uqtJnDC2nqsGuljzEOJ/tRmIGNTCKXs
         wgxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JtC9kdog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c09bee50d6si563076985a.10.2025.02.18.23.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:20:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JtC9kdog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeKW-0005dh-1X; Wed, 19 Feb 2025 02:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIu-0002gI-OS
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIo-0005K1-Nx
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cw0MCn/bdftRyx7vMeZDf4MxvrJxP+D6Cvej/zzLwKM=;
 b=JtC9kdogBvOHAdc1+liqKDOwpxmG1qH2UQ463b6RwQq8PRVWWJ2QXkmWcGIfob8BsgvARt
 rVKPaL2JcqIaBwXwviOdYf634NsrOnxKSZMwpO3AMm1rgkfKMtHHLJzuKIZ4rAucwTEG7m
 6gUy8oG1CqacrVER9nZ6NMSQO9iRfko=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-4zkB_LkyMeG-QjtBN7zy9A-1; Wed,
 19 Feb 2025 02:15:07 -0500
X-MC-Unique: 4zkB_LkyMeG-QjtBN7zy9A-1
X-Mimecast-MFC-AGG-ID: 4zkB_LkyMeG-QjtBN7zy9A_1739949305
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 820E31800982; Wed, 19 Feb 2025 07:15:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 599AD1955BCB; Wed, 19 Feb 2025 07:15:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2796F1801ABF; Wed, 19 Feb 2025 08:14:33 +0100 (CET)
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
Subject: [PATCH v4 17/24] hw/uefi: add to meson
Date: Wed, 19 Feb 2025 08:14:19 +0100
Message-ID: <20250219071431.50626-18-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
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
X-TUID: aCNKQ0TCyH9e

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
index 8ed10b6624e7..6512dcb16c9d 100644
--- a/meson.build
+++ b/meson.build
@@ -3590,6 +3590,7 @@ if have_system
     'hw/ssi',
     'hw/timer',
     'hw/tpm',
+    'hw/uefi',
     'hw/ufs',
     'hw/usb',
     'hw/vfio',
-- 
2.48.1

