Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2840594ejc;
        Wed, 15 Nov 2023 07:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrL6WrcZw1wmdOgPKepWmMhW6U1L5vlbvzRBTocfNVUo1xUZUKXcN2xKnDfuHKu3hTsJxl
X-Received: by 2002:a05:6870:d1c2:b0:1ea:14eb:b741 with SMTP id b2-20020a056870d1c200b001ea14ebb741mr17864686oac.54.1700061316276;
        Wed, 15 Nov 2023 07:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061316; cv=none;
        d=google.com; s=arc-20160816;
        b=Ax+UeSww5p4LX7d4eQIp5CUgYkv9Bw9ttdcvGdJYZiu6L78FtnbO9Btr5mmo54dJks
         s2+xRl6zhWG73plmi61LUu2LAOwKASRof+Z1mceAGuwvwolMsm8v0QhWdGsnNTJycBr7
         Tou3ShXwtnDxKhND6mkMZfUXTBcujEbYLIAK0Onp9NABLTM8SOy02S93BIyt8ZtUAMX3
         QTEmxzpo4uG/SiRXTy/ZCJarEcZoy5WYNxIuFLElLiy2qmuoPpNPrCDg1CHeSc8gP3yl
         s+rhphmfDN0eeeg0DVnVSzakfq4I4y74pnrPukNWslibO8V8bGnSV4WzhfhMQYKhriVr
         t0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hIbm++C+/v32sZ2utAtYfgJotW1TcWNFmHf2MawvouM=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=jMTEqXCtxeytu/SF7LKa4lLVmYQSviOhbR4PuJfsHV5gGazvLwO4RAsezCX6TlkCPH
         Vyp5l8SlT/xecMTcONVfYfIYKy13g5tzg7GwF9y2GDSrYd8aTLcrt3gEkJIdWC2ZoaCl
         /O8+jnzNmcWdoSK9PsA5YB2Y1l8zlPEKnF0HkGqVhM1rxj93z/DdKCQoWPTVtqXVAXco
         Znf2wRa2u429DyW5ZZHgfuQhp3NJz8SZ3ZZa7+1VbqfOFbCeONXi477vtiQ9osgc5/Gi
         z1yj0TmyzjEbl8Ia4BcGv00tfIxuKnf0KTpAUnGxdSK1b2KHD+u3uln5qV7PItdcL4mY
         9C1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQgO2G67;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq26-20020a05622a1c1a00b00421c3b9dbe9si9125690qtb.208.2023.11.15.07.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:15:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQgO2G67;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3HaD-00044f-Ic; Wed, 15 Nov 2023 10:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZn-0003vn-TV
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZg-0003Gp-GY
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIbm++C+/v32sZ2utAtYfgJotW1TcWNFmHf2MawvouM=;
 b=gQgO2G67r/UlkF3zxk3BNB9c4EEwp3dhGw/hzOOe9lXbBCPsVhOKV3V6YeQ7BsPgkmhBg2
 XSKtl83xiJySntiyF1u65cM9UwluXwR55FcFOrYeeV1fYijfeymexsHM7B2zK5UTfzTw5A
 sFLwggPs6bYPtwlZJGtXXfOP2RhApvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-CYTXo24rNuuAQlace7NRww-1; Wed, 15 Nov 2023 10:12:52 -0500
X-MC-Unique: CYTXo24rNuuAQlace7NRww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6C7B185A781;
 Wed, 15 Nov 2023 15:12:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A4B240C6EB9;
 Wed, 15 Nov 2023 15:12:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 05B9A180AC14; Wed, 15 Nov 2023 16:12:43 +0100 (CET)
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
Subject: [PATCH 10/16] hw/uefi: add trace-events
Date: Wed, 15 Nov 2023 16:12:32 +0100
Message-ID: <20231115151242.184645-11-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=216.145.221.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: L6Ng1jg4seX1

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/trace-events | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 hw/uefi/trace-events

diff --git a/hw/uefi/trace-events b/hw/uefi/trace-events
new file mode 100644
index 000000000000..baeda81bbe12
--- /dev/null
+++ b/hw/uefi/trace-events
@@ -0,0 +1,16 @@
+# device
+uefi_reg_read(uint64_t addr, unsigned size) "addr 0x%lx, size %d"
+uefi_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr 0x%lx, val 0x%lx, size %d"
+uefi_hard_reset(void) ""
+
+# generic uefi
+uefi_variable(const char *context, const char *name, uint64_t size, const char *uuid) "context %s, name %s, size %ld, uuid %s"
+uefi_status(const char *context, const char *name) "context %s, status %s"
+uefi_event(const char *name) "event %s"
+
+# variable protocol
+uefi_vars_proto_cmd(const char *cmd) "cmd %s"
+
+# variable policy protocol
+uefi_vars_policy_cmd(const char *cmd) "cmd %s"
+uefi_vars_policy_deny(const char *reason) "reason %s"
-- 
2.41.0

