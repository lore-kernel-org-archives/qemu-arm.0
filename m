Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2970392ejb;
        Wed, 25 Oct 2023 12:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5AB1C0OeuFwOCkd6zfYYL2OetN1SKaGwTTim5ivPmcH0ES5dpciz3LnK7hPab1teongAa
X-Received: by 2002:a05:620a:44cd:b0:772:6400:f111 with SMTP id y13-20020a05620a44cd00b007726400f111mr18865941qkp.47.1698261282815;
        Wed, 25 Oct 2023 12:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261282; cv=none;
        d=google.com; s=arc-20160816;
        b=ys4TrwcgbS9MYxlDusm9GJl9yoj/WCwwbdzccC8VwwyuAvtz2IYAJqsPgidp+RJJJu
         lJNM/sIkSXXNkBzrN9Bhfsuo2RR/BY4F6q6Iv5TTIaYcDIGEsYHmgWwKIkliZZoys524
         d+KAaLTLO64SP3lHKsou8q6KyNZ9latBhplEI6VFBr7EKtm5EeCGryU0QDPX5Ussj0HX
         IzcV3bBanuNcv0QmNPVI2uY9w5zxdx25V12Nh69Cyb5LS0u7V7nqC41zUzllItX11Tkp
         +OU0BueTWqtGL0vXmW1Aa4kvEDaUNIVv84kgGCxDMU1/q+2IPYQ2ccnN1bYCAQM61B+/
         JStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jm7z9T8PI3TaN5Ibcu8ZAR34M0vHVjaqargdypAD7v0=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=H5KxXP3ufC9aYjE/+HL3PCbfHKeszI1STIxG9JkgV9Wd+pezF/qo431vIA84abArIZ
         NZsxvc4OoLVOGc7KtiMEMoM8hMlAbx0gAEMd9YUdrr054uwTAlI47sUjIL1+kaBPT8Z1
         hRc7AXeKbvngUFrh91LaVp+OwxSvY3VBW3aLclEL498P7WRsw5vsKJ2UEREWrs+j4H79
         IfxdGtyKM0Yd7PiwLQB/KkvzPbApJZXipi7Atx80LH10kiAFP0leyl+fCWMLEx57C7/I
         mdpZVqSPPBWf8/k89SOHdaP235R9G1mpmViLVIifLDvFFUb5+Q0bJxnw3MUgPUV7Yish
         ekiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D8YA2xnh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05620a24d000b0077596c392f6si4944320qkn.630.2023.10.25.12.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D8YA2xnh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvjGW-00071S-9Q; Wed, 25 Oct 2023 15:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGU-0006xv-Ia
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGS-0000hf-QX
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698261000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jm7z9T8PI3TaN5Ibcu8ZAR34M0vHVjaqargdypAD7v0=;
 b=D8YA2xnhOrUdSNDFuipYV6Pkr7cpfVoFoYbXSFmnI1+118dDOS/n6mRPCoG8WLlFpFmJ6q
 l1XtIedkzPk8s3/gIWt4VYa/LKU2OPYb9vlBv9/PIATlg0sh6Ts2Fg7UbskHHmzCt+DooV
 yJ4u39HXNLlcyOaDONLkHaluESH/7nA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-qcJNj_ZwO8WwqpHjmewZUQ-1; Wed,
 25 Oct 2023 15:09:56 -0400
X-MC-Unique: qcJNj_ZwO8WwqpHjmewZUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49BBC38062B1;
 Wed, 25 Oct 2023 19:09:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0D25027;
 Wed, 25 Oct 2023 19:09:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 22/23] hw/display: make ATI_VGA depend on PIXMAN
Date: Wed, 25 Oct 2023 23:08:16 +0400
Message-ID: <20231025190818.3278423-23-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Q3E9XeWjWSA8

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 configs/devices/mips64el-softmmu/default.mak | 2 +-
 hw/display/Kconfig                           | 2 +-
 hw/display/meson.build                       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/devices/mips64el-softmmu/default.mak
index d5188f7ea5..8d85607571 100644
--- a/configs/devices/mips64el-softmmu/default.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -3,7 +3,7 @@
 include ../mips-softmmu/common.mak
 CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
-CONFIG_ATI_VGA=y
+# CONFIG_ATI_VGA=n
 CONFIG_RTL8139_PCI=y
 CONFIG_JAZZ=y
 CONFIG_VT82C686=y
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 1aafe1923d..4d8a6c4af8 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -125,7 +125,7 @@ config DPCD
 config ATI_VGA
     bool
     default y if PCI_DEVICES
-    depends on PCI
+    depends on PCI && PIXMAN
     select VGA
     select BITBANG_I2C
     select DDC
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 9c06aaee20..344dfe3d8c 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -62,7 +62,7 @@ system_ss.add(when: 'CONFIG_XLNX_DISPLAYPORT', if_true: files('xlnx_dp.c'))
 
 system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
+system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_dbg.c'), pixman])
 
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
-- 
2.41.0

