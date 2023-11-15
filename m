Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2840441ejc;
        Wed, 15 Nov 2023 07:15:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1oqsZhPKJPWYAUfFHv/bzYq9QGUyOgQ4i8QddxnpqHbD41ElQh+SalzwfUk1lxqzTSYK1
X-Received: by 2002:a05:6214:765:b0:670:b0a2:42b5 with SMTP id f5-20020a056214076500b00670b0a242b5mr10491962qvz.0.1700061305024;
        Wed, 15 Nov 2023 07:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061305; cv=none;
        d=google.com; s=arc-20160816;
        b=TgcD4uYFuQUhxX4KJODVOYDhQhoGrWKV68Crs+Yesrj/kjwIx799qDI8E8fSK9kkA5
         h/M2WUL3+542qNM150HfGwMt2fof9SB5WLoKw5rD58x/6I8uuRfrpNQJA/to7vXfvM7m
         19ssToLrNJaggFDek7/R7Q8WrfEz4L+OkgKA9HHQLX+/Xn7uU9j9xe/LIPRlzlDlxRJ4
         eqdqOsH/WUyBEgbU1+T0fqoG+xiS2c6PffL2V01Jj49HLg1DSnZVqWeDsCDWGsm/f4dY
         rx9yml2vab3fdEtjpz8vQ+6JMWMKXrlgrvM/HlG/VeYd2lsoIvQgNguRI8LDXtKzxWLg
         VDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tiEJE+Ys10pWSvv5g9XeF7QdmFajodaIfZtmNudSs4k=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=Ogy1cstqZH/QYyn781McIsYlFfxe/psleHvi73CdgVkstlGeYXQ3dRIX4MuGiA7S2w
         VoRmKz5HBZqgHNGMBPsHiace/++hoXg4SwazrsKOZtPIrK+Ut7OZzOA+7pj2tezhL3AB
         lrp+PkFT45cYny5FmYFwJKZG4gisre2iGDfIWS7/iQm/UHe5sZ38dSVpSupXs2CwcNi1
         1iHu05fVe6FukYFyL/3UF0esYMX/8LGVAO319PmxUn177dOjkCgAFpBvKGGAntOn5zPo
         RPOMD/NPFZjKVuGm2QInz1Z6b6zgBUaeNiVlwA5LUAb8XTG47UKqyYatF7BsGH2IH7n0
         Wa7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZ9+w3Qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020ad453c6000000b0066ceeacae81si9324105qvv.536.2023.11.15.07.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZ9+w3Qe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Ha6-00040Y-By; Wed, 15 Nov 2023 10:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZi-0003uP-G5
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZe-0003Gg-Hv
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tiEJE+Ys10pWSvv5g9XeF7QdmFajodaIfZtmNudSs4k=;
 b=GZ9+w3Qeoz6V+k/TwebxwtRwJZJUiNa8HLwk1K0IgoYuQEa8DnuMSDeiSU7RiNllOweki8
 YKZWLzrgl0oeaBBDSRbNUnM+nUoHxzADut3EZuUbBJk6uHfCw5MuwP4spPAaRd/Cgs5Bwr
 XBOb6rXMywOx25cEJi1fCyHBjdCwTH0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-6u0jpoymMJ2_0REl60w02g-1; Wed,
 15 Nov 2023 10:12:53 -0500
X-MC-Unique: 6u0jpoymMJ2_0REl60w02g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3787E3810D25;
 Wed, 15 Nov 2023 15:12:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36141C060AE;
 Wed, 15 Nov 2023 15:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 27E83180AC17; Wed, 15 Nov 2023 16:12:43 +0100 (CET)
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
Subject: [PATCH 12/16] hw/uefi: add to meson
Date: Wed, 15 Nov 2023 16:12:34 +0100
Message-ID: <20231115151242.184645-13-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: T2g3R/nI1O/K

Wire up uefi-vars in the build system.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/meson.build      |  1 +
 hw/uefi/meson.build | 12 ++++++++++++
 meson.build         |  1 +
 3 files changed, 14 insertions(+)
 create mode 100644 hw/uefi/meson.build

diff --git a/hw/meson.build b/hw/meson.build
index f01fac4617c9..f8a7e4a2d8db 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -37,6 +37,7 @@ subdir('smbios')
 subdir('ssi')
 subdir('timer')
 subdir('tpm')
+subdir('uefi')
 subdir('ufs')
 subdir('usb')
 subdir('vfio')
diff --git a/hw/uefi/meson.build b/hw/uefi/meson.build
new file mode 100644
index 000000000000..b620297320d0
--- /dev/null
+++ b/hw/uefi/meson.build
@@ -0,0 +1,12 @@
+uefi_vars_ss = ss.source_set()
+uefi_vars_ss.add(when: 'CONFIG_UEFI_VARS',
+                 if_true: files('var-service-core.c',
+                                'var-service-json.c',
+                                'var-service-vars.c',
+                                'var-service-auth.c',
+                                'var-service-guid.c',
+                                'var-service-policy.c'))
+
+modules += { 'hw-uefi' : {
+    'vars'     : uefi_vars_ss,
+}}
diff --git a/meson.build b/meson.build
index dcef8b1e7911..05a60631a81f 100644
--- a/meson.build
+++ b/meson.build
@@ -3290,6 +3290,7 @@ if have_system
     'hw/ssi',
     'hw/timer',
     'hw/tpm',
+    'hw/uefi',
     'hw/ufs',
     'hw/usb',
     'hw/vfio',
-- 
2.41.0

