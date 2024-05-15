Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp683836ejl;
        Wed, 15 May 2024 07:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuBCZt2uDwV+68+m5jHAH2VFdrG8u6MwYjIR0fl6bJWU7thb9rhQ+Nf7ruBdVFjyRXfFWM33hZBlalVB5YxMwFARTxAJbn
X-Google-Smtp-Source: AGHT+IGneq9k9J/R4NIUls8jAspgq/mReMMngZBiR3xE8vliJAXaSJkMGq94Up7jdaLCMBnwMDpq
X-Received: by 2002:a0c:f6c4:0:b0:6a3:58a1:1e24 with SMTP id 6a1803df08f44-6a358a129b7mr24098816d6.25.1715782686722;
        Wed, 15 May 2024 07:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715782686; cv=none;
        d=google.com; s=arc-20160816;
        b=ZkTdTdjLfDlGFqp7Ne1cj8d1rB/HSfvvfJCnGWwqayeMTNcOTqXd6cbGbRWeylp97J
         0xR3yz/AQjp8qTiSEHkcJqRXBpGwpXLH+tJmIEjmAM4no6+sHit5llyXsKQZSCptAVk1
         nzPk1vMmL/Dj41s/Uy5PbgU76efhOVCuoinq5fi1Rw6jTw/cPGKd0lz2+dw8HWN4ZYNm
         OLprlyoqeDHWjnVDj2MYxvj3Ffl1VRJ8JnUgpLnt0q0ZzPITzEmNRIOpIsd4i6c1zcGw
         ozfDGEWsIlbVKaLkEuQj1v3oI/l6ICOLREA0MuD8IpcXoNkbzJVwSwRjawvjCQVU1BlT
         /5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RNE/jXp6GiXETKwqHemMdMmdIUBy45oCg12YyvDwuO0=;
        fh=dv7M3Vyx/D9iF5hjzj0SFl7wXFXIDctWrq9i0V0YiQI=;
        b=AFcxF0KwsYvHdI1uBIQNbCtPkTW6F9sWh9dEPT08p9V3JraORg26IEj7YR4PqywEL2
         bP5zjuVUD8cK/wy54tUC0fL9j82LQGcBg4Zek5GLB2mdw7xrVlqhhOOcNoe/ACdnxIoj
         IgEqZmARtKyaNTBY2JkqQr7jhVMAgsYHuQj0qsEw3Ep+HuAfTmmkSc8F2QcoInOhHrGM
         INOSoredDUAkgE7pXgQiaMUvz3obLp2+d3MLWOzyWDdncP45f6JVvadSAZYOS7suoSc1
         kP0ygKqAoT1bwYv+F61z0YmmVxFYsYsrdLEKPTx4uOHWtwR8zKqLtFGgl2QgxaAR3zNA
         fO8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cs2Lk+ju;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f30710fsi148603126d6.591.2024.05.15.07.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 07:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cs2Lk+ju;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s7FRG-0004gG-61; Wed, 15 May 2024 10:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7FR1-0004b3-IZ
 for qemu-devel@nongnu.org; Wed, 15 May 2024 10:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7FQt-0005sq-Kt
 for qemu-devel@nongnu.org; Wed, 15 May 2024 10:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715782594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNE/jXp6GiXETKwqHemMdMmdIUBy45oCg12YyvDwuO0=;
 b=cs2Lk+juVa9OB+ECwmRUYyIIlAZkL3AhzPNqkBXujOGVQrVEx9UWI9dgQwDlSOIEXByINM
 PdnPM1GWOHqVb1LCchwZqCdVs/TtI4J+DhQB+pzEg8OAPmyECO3EItMiFNKC0EldaYV2mz
 yrV4pag+ssCngQttOln8CEmd8U1UjZc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-65jl5_7fOSqvrTjaqnCN0g-1; Wed,
 15 May 2024 10:16:17 -0400
X-MC-Unique: 65jl5_7fOSqvrTjaqnCN0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F2AF29AC00C;
 Wed, 15 May 2024 14:16:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB0ECC15BB9;
 Wed, 15 May 2024 14:16:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 3/5] hw/boards: add machine_check_version()
Date: Wed, 15 May 2024 18:15:54 +0400
Message-ID: <20240515141557.1277999-4-marcandre.lureau@redhat.com>
In-Reply-To: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: T9ct88mJpTsH

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add optional major/minor version fields to the MachineClass, and a
helper to check if the current machine version is >= (major, minor).

This function can be used to check for extra migration fields, instead
of relying on structure version which are typically associated to a
machine version via compatibility properties.

Notes:
- undefined version is considered latest
- a few machines have a micro version, I don't think it's necessary to
  have here at this point
- there is already a less formal char *hw_version, but it is only used
  for legacy code (< 2.5)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/boards.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2fa800f11a..b36a363fb7 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -248,6 +248,8 @@ struct MachineClass {
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
+    unsigned int major;
+    unsigned int minor;
 
     void (*init)(MachineState *state);
     void (*reset)(MachineState *state, ShutdownCause reason);
@@ -306,6 +308,18 @@ struct MachineClass {
     ram_addr_t (*fixup_ram_size)(ram_addr_t size);
 };
 
+static inline bool machine_check_version(int major, int minor)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+
+    /* unversioned is latest */
+    if (mc->major == 0 && mc->minor == 0) {
+        return true;
+    }
+
+    return mc->major > major || (mc->major == major && mc->minor >= minor);
+}
+
 /**
  * DeviceMemoryState:
  * @base: address in guest physical address space where the memory
-- 
2.41.0.28.gd7d8841f67

