Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6659084dlb;
        Tue, 2 Jan 2024 08:05:05 -0800 (PST)
X-Received: by 2002:adf:fc88:0:b0:336:8abb:c24f with SMTP id g8-20020adffc88000000b003368abbc24fmr8490290wrr.4.1704211505048;
        Tue, 02 Jan 2024 08:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211505; cv=none;
        d=google.com; s=arc-20160816;
        b=U8RbRZpMTZ1G9aC9iFeYI5aNChKv3bIpPhM6/Q7ycWoSnKyc5p7tz9tAzWlqqY4Zxc
         BddL7UWtK554I89pem8hTAj1hh1crD0jX72ROr4luyDAhiBd7iBGsSEhvXDoRfSouvwm
         4DSfJqht59PchTR2+raW++ORkQDT7c1a6a4A0g/M5Yn2XF62+z2j0/boN0lEQl7wXKIP
         e1rSvhfZy8pmKvvzxPpRrOurXBW/O14aJJuYFIOoEHtuDv+hDcLDUbR+sRIf9yHykKRV
         Y/e16HASfDW+GVtDOm70wZG38oM+Y9aXbjWroHIqX9GQICdI2JadNLzfMP7MiRc2ALMY
         tOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TVl3cttQKDPPU7GqDBLczNEA1v4uR7uW39llQJlVRbI=;
        fh=Fbl4rt7vNadFyu+mhE5sPZ2m5GJmVL0UTbP+h3uuTlY=;
        b=t5DF5vRovY9OleCsW+YcIVKsQvWJ816Zkd9+lU0MC9rXPZP3nns9INAn557LhIhj7S
         4XgqWHahCKznFdSQY5Iwt9EtSNpEH7xkW6gVhskUinZJUdjar/9Ppzpc0791y3BLnuvn
         LhQmLZPfbfuKatlONDp47BdlVHW53uvayqOMge8uQXnb/1fest85sm30ELRC7wOHHiD9
         FBp9rNvwLbkENn3IYwPF65CyNO7AdLxle6QvenOheQ09Knt5MVzBJq2QB/yYXkvVtJd3
         0OI/ugMCgSlzM8+btT83c251rqz4CXn49N+nUfhpG4nTtU39g2dQLTauJkyndBf0Atyw
         QwdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1amK02r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t8-20020adfe448000000b003367449011asor5018944wrm.2.2024.01.02.08.05.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:05:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c1amK02r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704211504; x=1704816304; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVl3cttQKDPPU7GqDBLczNEA1v4uR7uW39llQJlVRbI=;
        b=c1amK02rEOoRfTLxjHTyldHwqLfa5jYeB8ME6329WpCj4HTnfgyjXke6/qmxL2a1A7
         OSUHsuPumNu5XB7VTtzpm9Rn+BbSu79ieR/JxCr0jd1RkNBzVzUXuqIKZ2djNgb2fy/M
         S8t2V9kOcOr6VHkc3RdjBb7j6ri5hDtXsYvtRZjB7lEbo3/aG9ptrfAjS9ruzj0rp34o
         WQcF7xUXrh0cLsLfZVXQ87T5LRZyBh1MG0EC2QQOcnI02+eJeJUZyLmVBJaymwf7cV/e
         orNEiRfBnp2G6iZVb0XrzpKHccG0P+hhb9hpfS9rMEGAuKZuXnrm2j1vmIZTkAbO94Mx
         ZvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211504; x=1704816304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVl3cttQKDPPU7GqDBLczNEA1v4uR7uW39llQJlVRbI=;
        b=BRe7S7urC9rTCxSx1AWxbOBw8MBVfIMB5AW7SKmmybJimHXC7gunzkL1S3lUXKqMs4
         GYz9J0pGUNTm7m4/efb5BXwPB8caeQLnjyP2m2o3QyW9nz3f3ogvyGW02CCDpFo0leEL
         LPmpXmX53gF3N3UqU+7BjLRvA4ZwuqwPuZrp+uaojOnBun8dx+/wdbTgNNohXaNwsnt/
         39gSZxCpz8TLF1KfgBS5RHQ/RDEIHkU1t7Q8n336VcJ/M6dW+FBZXJOX28Xo9SCSpuoK
         TfrFcMPbrwv80Cb+tgU4JxBKPEDXrcdwYunftgSHdbNOQZ9bgk+EIkZyW3IkpEO4oz7Z
         JhWw==
X-Gm-Message-State: AOJu0YzUfzyJcDjGBFhJArfW3vf9ooXPpLsjuq1ITLZPpoOSHeAVo45Z
	Mpn/MdMxQgVezUIwDJrDD5ux/TUZvu9TiNUh
X-Google-Smtp-Source: AGHT+IH+Obc3ne7AAB3LoQIBsTVjLSH2urrV19UtpdDS4OFzucuPmDYGorqkMdUbkefjSu8sXVfrDQ==
X-Received: by 2002:a05:600c:4713:b0:40d:734e:665d with SMTP id v19-20020a05600c471300b0040d734e665dmr3139136wmo.41.1704211504678;
        Tue, 02 Jan 2024 08:05:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0040c11fbe581sm45314295wmq.27.2024.01.02.08.05.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Jan 2024 08:05:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Luc Michel <luc.michel@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Frederic Konrad <fkonrad@amd.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 1/5] qdev-properties: Add qdev_property_del_static()
Date: Tue,  2 Jan 2024 17:04:50 +0100
Message-ID: <20240102160455.68612-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240102160455.68612-1-philmd@linaro.org>
References: <20240102160455.68612-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Bg5DWFYxkoXs

We can add properties with qdev_property_add_static().
Add qdev_property_del_static() to delete them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/qdev-properties.h | 2 ++
 hw/core/qdev-properties.c    | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 09aa04ca1e..0e1930177e 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -225,6 +225,8 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
  */
 void qdev_property_add_static(DeviceState *dev, Property *prop);
 
+void qdev_property_del_static(DeviceState *dev, Property *prop);
+
 /**
  * qdev_alias_all_properties: Create aliases on source for all target properties
  * @target: Device which has properties to be aliased
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 7d6fa726fd..0c17a5de82 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -994,6 +994,13 @@ void qdev_property_add_static(DeviceState *dev, Property *prop)
     }
 }
 
+void qdev_property_del_static(DeviceState *dev, Property *prop)
+{
+    Object *obj = OBJECT(dev);
+
+    object_property_del(obj, prop->name);
+}
+
 static void qdev_class_add_property(DeviceClass *klass, const char *name,
                                     Property *prop)
 {
-- 
2.41.0
