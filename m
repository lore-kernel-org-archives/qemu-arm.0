Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1332660ejc;
        Fri, 13 Oct 2023 00:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEUnbEsMyQM6Z/proRgCyv7MBZIHkFit8QaSmMOvDOwrbuztSMqYHoIxr8oG1dHVmrETua
X-Received: by 2002:ac8:7d13:0:b0:418:1a5c:dcb0 with SMTP id g19-20020ac87d13000000b004181a5cdcb0mr31228855qtb.6.1697183789930;
        Fri, 13 Oct 2023 00:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183789; cv=none;
        d=google.com; s=arc-20160816;
        b=09PCyc4EJMmBS2xtHtNgzdQSb4ZvYc2aAhmVRhrVcdhBLyASd2AcF/lSX33xuXEvmf
         YLP7aK328FdrS8Jm+VEia3yVox3Nm3JwYxB7Vig8uWnENTbrtBpE9YVALVhKqmIELQca
         WPENvVa60NUVclOysyZPu/nKHoF23Gfw4LCX4m3bHndLTMScN4Y+cjc5IZLIXdnDGHUC
         ie2/uzDlB/EUgznM5O+rdUVzKq7vVvm9nLL9/vy7sVFW3ogX4TJ4HjPF0Dz7OK/tjf7u
         Fd57+AI1ZeITHjEbsksKwDD7pB7nVGmEgQbg9e/lUG88UEcwvGaybt6RuIUkASt4LXul
         RArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ACmNUd64zxjCY/ANkaz/wSfLOgrw3On2aAMpHQJnPUA=;
        fh=AsXItCTRXGHT4f5eE845/gyvzbMt5ZyhMQeFf4XsPlk=;
        b=Vi3l/qVcnCU8HHJHgeIgZ/+Fy1FtB58wxRBIo1e24x/yA8M4c7HIWPAr4i25NmbuRM
         p2fPafZd6Iw7zu35gV5g1oqP90Zfba0TpglmJFRSIVo/zH1LS++NdY2qP1FePXASwk52
         MWx7gktD9ej7x+qIX6uvwBFF2IAebvJoOvuekOXIldbxYIYJio2Bkk/sfyNtZCP6jmMS
         qlar9VfithA6J4SBp9gqUC27NqBX/YbadDEQOF64Eh8CJN91dnZMnFKCC74VftEj7q32
         gb28xHqkit1s+enTkTwB9sfRQ0sq09TIb+cDRxf8YNCygn6CnEd1NRP0vYXh6ltHIFwq
         YDJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Haq/4cc9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05622a001100b0040ff099d956si830650qtw.670.2023.10.13.00.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Haq/4cc9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCwG-0004WU-2W; Fri, 13 Oct 2023 03:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwD-0004VU-Ih
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:50:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCvz-00049o-GB
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:50:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1106481f8f.1
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183404; x=1697788204; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACmNUd64zxjCY/ANkaz/wSfLOgrw3On2aAMpHQJnPUA=;
 b=Haq/4cc9Hdq8J/1SNfxJIoahg0eubA+mvQgNwnit+8JdUuIFiw3DDSxs3+/buUFW19
 cgghZli06gK4dlPMhnCI2wsGbdPE3zrTO4xKRSOViCIpyew9LgLm5cXFoBSOb2ezVugp
 6lOJ9ZcIZioiDQqMPVKyrTgpGPedJ2Qlo502L35bqWZ+qQPMMloAOICnCq4CvHdSoUwQ
 qaEW/TUWRK+Lv1eUtEBr5llRhWFvd/zT+zEXOQPXXYuQQOwmL3/5olJSR8G5lrLuzbyp
 8WCVO8VbJ//l/ZKcYutC3jrJh01xbCsKbPKriYy1kjdmZXn+Ykig4NPr+RVc3H7MP4hZ
 qwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183404; x=1697788204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ACmNUd64zxjCY/ANkaz/wSfLOgrw3On2aAMpHQJnPUA=;
 b=nEeJMs3JnKzwgkFUGVK7q3+U/OkAHNMgh+r1uusciAXoohNwuXWVS6AFunFnFpLGFj
 ATkvTiZtK5x64oMV6RfDzVuqWMdGJgebd2/7enssIxV4QRrwFqUvzys9gBT/TGBKZ+y0
 7rnHKqeSwL7ROArws7eveq5aJ9/jXe0HfOKuwpILSiiMXZmUbVOVxBrsKI2ftqqqpsVH
 JsdwUG0ZkWh01FvTMYpeaLs5i6QwID3DaJznJkGQFfdC3v9UVeBcjASu/uZ22g8YNOWM
 eRB+7MtZSk23y+owaSk3upaFz8C976qCz0m11O1IzUFE5AZmGv5Idx4GPGkuYkPCMCMv
 wVBw==
X-Gm-Message-State: AOJu0YxjJptFzEL+EqOxPxFFIr+F2s98wNwpdnfIslQlA1VqrEv0CIzR
 LFQ4zW1Jknz8tDSVTfCCKj0PGtpk1nuHWJfUkJ8=
X-Received: by 2002:a5d:6b4b:0:b0:323:1ded:311f with SMTP id
 x11-20020a5d6b4b000000b003231ded311fmr18960161wrw.25.1697183404434; 
 Fri, 13 Oct 2023 00:50:04 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:03 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [RFC PATCH 09/78] hw/acpi/aml-build.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:13 +0300
Message-Id: <7cd146bcd384f4e11754b2983008b385f80343d9.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: n6WTBOZf+52I

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/acpi/aml-build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index af66bde0f5..b0cf0c6073 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -292,56 +292,55 @@ static void
 build_prepend_package_length(GArray *package, unsigned length, bool incl_self)
 {
     uint8_t byte;
     unsigned length_bytes;
 
     if (length + 1 < (1 << PACKAGE_LENGTH_1BYTE_SHIFT)) {
         length_bytes = 1;
     } else if (length + 2 < (1 << PACKAGE_LENGTH_3BYTE_SHIFT)) {
         length_bytes = 2;
     } else if (length + 3 < (1 << PACKAGE_LENGTH_4BYTE_SHIFT)) {
         length_bytes = 3;
     } else {
         length_bytes = 4;
     }
 
     /*
      * NamedField uses PkgLength encoding but it doesn't include length
      * of PkgLength itself.
      */
     if (incl_self) {
         /*
          * PkgLength is the length of the inclusive length of the data
          * and PkgLength's length itself when used for terms with
          * explicit length.
          */
         length += length_bytes;
     }
 
     switch (length_bytes) {
     case 1:
         byte = length;
         build_prepend_byte(package, byte);
         return;
     case 4:
         byte = length >> PACKAGE_LENGTH_4BYTE_SHIFT;
         build_prepend_byte(package, byte);
         length &= (1 << PACKAGE_LENGTH_4BYTE_SHIFT) - 1;
-        /* fall through */
+        fallthrough;
     case 3:
         byte = length >> PACKAGE_LENGTH_3BYTE_SHIFT;
         build_prepend_byte(package, byte);
         length &= (1 << PACKAGE_LENGTH_3BYTE_SHIFT) - 1;
-        /* fall through */
+        fallthrough;
     case 2:
         byte = length >> PACKAGE_LENGTH_2BYTE_SHIFT;
         build_prepend_byte(package, byte);
         length &= (1 << PACKAGE_LENGTH_2BYTE_SHIFT) - 1;
-        /* fall through */
     }
     /*
      * Most significant two bits of byte zero indicate how many following bytes
      * are in PkgLength encoding.
      */
     byte = ((length_bytes - 1) << PACKAGE_LENGTH_1BYTE_SHIFT) | length;
     build_prepend_byte(package, byte);
 }
@@ -508,37 +507,38 @@ static void build_buffer(GArray *array, uint8_t op)
 void aml_append(Aml *parent_ctx, Aml *child)
 {
     GArray *buf = build_alloc_array();
     build_append_array(buf, child->buf);
 
     switch (child->block_flags) {
     case AML_OPCODE:
         build_append_byte(parent_ctx->buf, child->op);
         break;
     case AML_EXT_PACKAGE:
         build_extop_package(buf, child->op);
         break;
     case AML_PACKAGE:
         build_package(buf, child->op);
         break;
     case AML_RES_TEMPLATE:
         build_append_byte(buf, 0x79); /* EndTag */
         /*
          * checksum operations are treated as succeeded if checksum
          * field is zero. [ACPI Spec 1.0b, 6.4.2.8 End Tag]
          */
         build_append_byte(buf, 0);
         /* fall through, to pack resources in buffer */
+        fallthrough;
     case AML_BUFFER:
         build_buffer(buf, child->op);
         break;
     case AML_NO_OPCODE:
         break;
     default:
         assert(0);
         break;
     }
     build_append_array(parent_ctx->buf, buf);
     build_free_array(buf);
 }
 
 /* ACPI 1.0b: 16.2.5.1 Namespace Modifier Objects Encoding: DefScope */
-- 
2.39.2

