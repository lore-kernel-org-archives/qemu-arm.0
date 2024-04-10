Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp416605ejc;
        Wed, 10 Apr 2024 09:11:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW65Sdk0ny/37zTnDmD7DmQPVunhQ705iy5Eqxz/1VSBg7O1pTP7I7Vj3uOqXMCIrgkRvek5ZAgr3ADIFXAzb/0P1o9wwn2
X-Google-Smtp-Source: AGHT+IG3/KzUpjJnOZ/u83wJDiy1N+toIEzjInMW5aivgKLryr8DD6p+QRT+V7m0E25yvXe3s4kD
X-Received: by 2002:a05:622a:2c42:b0:434:fdec:e188 with SMTP id kl2-20020a05622a2c4200b00434fdece188mr2619648qtb.1.1712765493627;
        Wed, 10 Apr 2024 09:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712765493; cv=none;
        d=google.com; s=arc-20160816;
        b=x2/YHBtnQpl0Sa9cIIcPyL0MnC2Ne1lYqcEHOabFQLiu7Ne2MV62R0HJXcpuZfQZrf
         7pXEYrsqUjTEejG7kTxv3vP0mtX49x2fYyKuf+9mtvSHUOZrHjA0GUd1JFOOqhkA7X/N
         sWaYnJnf42KiseCxMeM9QdK+8sYpLjlnwNra2Pr/dHIpu5C0KostL5zTUZWMA3VHtTVY
         Kz27KtERLX6y6GZ7R403a8GVcR6IcS8Qu/HY/l2xia7g30PdsIx1RbLDTOmqpuMZXns7
         8uTw0OiUEMOR8YMxCIr+4mBVg7hl4irHQ2dmQUDznIJsvnugm7atE6MjJsBb9E1/jJNR
         lu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=urm+Npyj3/f/E1cmlvhojimXxZbt++WU9CB9v2xORc4=;
        fh=p0KuRmNWUG6K3ODk8d5T87x/+84scKn0vVknmqg1i2s=;
        b=MXYWrAL8A6l66q9+/tDYGT4HBJjxZmy2lQ1zqvV6oXk4Zu4BUV8zJh0gKTmSsQFkT5
         G/ehjI4NXQKqxfVH0o1u3MBLXjt9ab784ATwndfATFR3xYT3Tw9nVMMCCHFBxOwA8yOK
         8LJbzEmhBE9EN7UndI1rdWaQsKoejIPvY89+bp6/yJ3e+lP6YnHiE+F46TTumcykwXhV
         rlbq5zmTzvcl3bFG5epFkwZi6MC52gLJqq2eSgeoDhcW8LND7O83DcNib+84JCesJdFw
         +onZF4iV0XIljENTxPlaDAjs8St7aofxcdf6KGYx2+yJKtbRl2YuFkK2L4dDAOiJYgIE
         RXfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOOc6QyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v42-20020a05622a18aa00b0042edcfb1f28si9086243qtc.92.2024.04.10.09.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 09:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOOc6QyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruaUV-0001RW-91; Wed, 10 Apr 2024 12:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaTx-0000d3-PV
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 12:07:31 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaTf-0002kK-Q0
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 12:07:26 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e477db7fbso6642673a12.3
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712765230; x=1713370030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urm+Npyj3/f/E1cmlvhojimXxZbt++WU9CB9v2xORc4=;
 b=tOOc6QyIpBcgIP8g3gYoYZOb16yecid/rvj5ulN9defoMP3d8AC/czHMkyE6IPWErW
 zjbJCyALT9qxtj2dweeVHGRG/tKYE9ns1hHmbnNBGqlu0Ke012m/g/FOyvW8dQAxe7kF
 xAi70GYAXbJpOz366h5Kjgm10oLo5VrPYi3yw6hsjBNTm6R73HJTvt1HVaC51XZ27bfV
 O6kscC2e2Pid0h8K01Umx7ER/GU9RZJ5dS80wdO22jOLloMv2dQ3RfpFX8XQWCYO95cb
 Lil3ZpE/fHNa4MvsLfeqAQsEoBOQwf4fQxYR6k+cCDJCKbWaDG5ApD1Mza5z+sWN5F1L
 31Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712765230; x=1713370030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urm+Npyj3/f/E1cmlvhojimXxZbt++WU9CB9v2xORc4=;
 b=PTpjLKaIdFO7BpAe1/bvbsQ3OvB7DXC7Tn7k9pGBbtldzB5lef433NKpCBMIrMM/ZX
 6X1Gmijb1z4fBc3H3N6BsAcduMnHA89aQBljlOCtezNpwsjLZ/qSfSAwqQF49cRndQuF
 kVAXYPHRrUcfscVvwIyaoABwXX5z2N39XxTcddupO2u3+jYaPtnyVUx/SwmBDNlSSb9b
 ILUMqTF0iBMvTp4hyXG8m8iqwvFZqYBW6b/e59tUGG7LpxlHpEgrgaR3YEL1IpRY9ZAR
 1mGbwH0cNw9KH6Hi/z4dEMvNEF+6HpTDIBwmgeT+sKJLkuLH7uNkgktI4hi3BSrxgivI
 l6uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKdp+rJdrtcjO0LAIsaYY1kKnoor00igCAXxXdMR8KWLDSFi4sLu0vr9PNv69Sm9NEd8ySydsMDjQUkIgpvzrJI93P
X-Gm-Message-State: AOJu0YxKDT4tFOryR2C/rr1afMtJQ/wGTYBmACNH/TYSXO9UbVPTavXx
 reTcX7gXNcWXSVeV4is6PAPpa1dWqmLXFFCLZv/oC8ytGIphYE6efQidsU7wIro=
X-Received: by 2002:a17:906:118d:b0:a51:913c:1c83 with SMTP id
 n13-20020a170906118d00b00a51913c1c83mr1864645eja.58.1712765230578; 
 Wed, 10 Apr 2024 09:07:10 -0700 (PDT)
Received: from m1x-phil.lan (arl95-h02-176-184-34-173.dsl.sta.abo.bbox.fr.
 [176.184.34.173]) by smtp.gmail.com with ESMTPSA id
 k7-20020a170906680700b00a51e5813f4fsm2662622ejr.19.2024.04.10.09.07.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Apr 2024 09:07:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 09/12] hw/scsi/scsi-disk: Use qemu_hexdump_line() to avoid
 sprintf()
Date: Wed, 10 Apr 2024 18:06:10 +0200
Message-ID: <20240410160614.90627-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240410160614.90627-1-philmd@linaro.org>
References: <20240410160614.90627-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DMU0ed0lYKBd

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Use qemu_hexdump_line() to avoid sprintf() calls, silencing:

  [105/169] Compiling C object libcommon.fa.p/hw_scsi_scsi-disk.c.o
  hw/scsi/scsi-disk.c:2659:14: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
        p += sprintf(p, " 0x%02x", buf[i]);
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-disk.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 4bd7af9d0c..4f914df5c2 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2648,16 +2648,12 @@ static const SCSIReqOps *const scsi_disk_reqops_dispatch[256] = {
 
 static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
 {
-    int i;
     int len = scsi_cdb_length(buf);
-    char *line_buffer, *p;
+    char *line_buffer;
 
     assert(len > 0 && len <= 16);
-    line_buffer = g_malloc(len * 5 + 1);
 
-    for (i = 0, p = line_buffer; i < len; i++) {
-        p += sprintf(p, " 0x%02x", buf[i]);
-    }
+    line_buffer = qemu_hexdump_line(buf, 0, len, false);
     trace_scsi_disk_new_request(lun, tag, line_buffer);
 
     g_free(line_buffer);
-- 
2.41.0

