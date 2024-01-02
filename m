Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6659179dlb;
        Tue, 2 Jan 2024 08:05:11 -0800 (PST)
X-Received: by 2002:a5d:43ca:0:b0:336:76dc:4d30 with SMTP id v10-20020a5d43ca000000b0033676dc4d30mr9583551wrr.45.1704211511574;
        Tue, 02 Jan 2024 08:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211511; cv=none;
        d=google.com; s=arc-20160816;
        b=bu0H15ouLv6ZezDv9Q3QJQoWcq5KE7aNNaU3g0fYYHgZ1MiUfTu7FfMqXWloJwuDr6
         W9qCODKu2pM022G5IOtyRDvw4a8mAwMjqAiugvN65lvqt1ZtuK88VwMn8x5ByMBTld13
         6ucNbxHmEePvWpfA8HjAEEwZ6z6eBOLemzBXlvPeyhM3pdpVvUJw6Rke7C++gmTz5jMk
         izKXHl8aWE33vXF1JWC9IfrIxwso9bmiLT8EE2rMe3dk6q4fVXDB/5P2iWaK4XLYQSjW
         cADyju1cJoIVD5LloWjpa/8ybIu/HJqV5FDpYJZukLhenYW/d3wtDy6tlHAmi6aKdBEC
         pa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ufonMTH/Sl8kmFdoBgYSf3okj9N+8Wa+NSxI0KCId+c=;
        fh=Fbl4rt7vNadFyu+mhE5sPZ2m5GJmVL0UTbP+h3uuTlY=;
        b=UFXH6/0uCGnjguZfgq0b8T2/Br3+JBQUql0kJKoD1lCc3Gq3Urrc9w9GUTzEx4Jso4
         6ibMyfzZhiUwqNBjdZr57bHLxLohaAUnSrECK3L7m83La1Mc8YLzjclIa8DPEvgOtHBA
         o6Le7cGYBgpOKOCt1mn0zAFfvt/W17VzDubaAJoTbK7AN4E2h8Uw8eyKSCi3K0AncW12
         X1LWW/4eZ1OqyWD49MrCdfMhx9A++6IU+6B7TlaSN+6R7SkKAWTCy2NvnDKFendYRoDy
         sMndAbtmwWZ2Sq8VWPTPEWQvxhBBWm4ty/9/bnytIdLCwL91mGgyNIYw0NJIVUX1rKqI
         HyXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u5y32nfR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g3-20020a5d5543000000b003368d2e7296sor4936wrw.8.2024.01.02.08.05.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u5y32nfR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704211511; x=1704816311; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufonMTH/Sl8kmFdoBgYSf3okj9N+8Wa+NSxI0KCId+c=;
        b=u5y32nfRRFtgCbFiHS2uQkRmJNxt+1LeQt3AWRriy6oUGBrwbBZDJvpDms4qmG0N7U
         huVwYKVyguVOczrKvEvEpOfKEYyk+D8mFfqUliDD40ThYQNk83lkYSJ38gZcXWwW5zoH
         zYNY8fv93OSAmFZOs4qTO1I5UyH2oV2fzHYY/L4jaJtI2ulywj05OGVH2K8UKLqh3rGj
         +lORhXdLf4I0j6VJePrjPOzSHQ5OHqyjbVbjFpgAsqjo/G4SQNxJxKhOOveYHTh6nAoc
         5GOCOW2CDc1nMjxoGHJVMh+7LQ3pQR/CPt1I2tdipwsk5xmyncMW83ULiGx3XeLSWJ/V
         iHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211511; x=1704816311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufonMTH/Sl8kmFdoBgYSf3okj9N+8Wa+NSxI0KCId+c=;
        b=vj5N8Ai9SFDxOcTD5Nw9OB6w2VC8krF07QkfKd/f7wcwproRGSZt0Jaca5OiOoFvEM
         6bqnV2Q/p/LGhUM3LVPz4VcpN0mb5QIXxkj/I9aJFiHCD4S4p5GZWyZDUbVhOxTCm8Of
         LSA47BXGbZWQysSZCUd3ga4JNw2gLUpPFU1hoh4H38scZJ169C8cpobVn6MtLotTXyoi
         z+/BhjGj1Z08jcdW58wW3uM46yJdBs9kRBkbQLLmV0L2xV8ePYRFf9KwWz1Tx+C5k+yt
         6F5RZqAROhcPqsfJSyhOfeXrrZet/h5GaAvRwSbplRawdHxfaPN/9aeMaoEaCOzTRccL
         tmnA==
X-Gm-Message-State: AOJu0Yyu8fHJKkCw030jS2bNu/t1SzTI34JHMORyaWg9cZL8AjelHdQw
	Hj2AI0WyE8A8JYnFw9hqFHYdEsFyWNDqA21O
X-Google-Smtp-Source: AGHT+IEfenUzNg89P4j1gidzONQnhOe9H3bTMyqqyOK78NSJs8PafFY6IIv5Fgxey5SLF3EwUAq+cw==
X-Received: by 2002:a05:600c:520c:b0:40d:8a04:a134 with SMTP id fb12-20020a05600c520c00b0040d8a04a134mr934490wmb.79.1704211511039;
        Tue, 02 Jan 2024 08:05:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id bg29-20020a05600c3c9d00b0040d6d755c90sm19136952wmb.42.2024.01.02.08.05.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Jan 2024 08:05:10 -0800 (PST)
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
Subject: [RFC PATCH 2/5] qdev-properties: Add OptionalBool QAPI type
Date: Tue,  2 Jan 2024 17:04:51 +0100
Message-ID: <20240102160455.68612-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240102160455.68612-1-philmd@linaro.org>
References: <20240102160455.68612-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t0cK5Oi82jBE

To be able to distinct whether a boolean qdev property
has been set or not, add the DEFINE_PROP_BOOL_NODEFAULT()
qdev macro based on the tri-state OptionalBool QAPI type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/common.json             | 16 ++++++++++++++++
 include/hw/qdev-properties.h |  5 +++++
 hw/core/qdev-properties.c    | 10 ++++++++++
 3 files changed, 31 insertions(+)

diff --git a/qapi/common.json b/qapi/common.json
index 6fed9cde1a..884c143e2a 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -207,3 +207,19 @@
 ##
 { 'struct': 'HumanReadableText',
   'data': { 'human-readable-text': 'str' } }
+
+##
+# @OptionalBool:
+#
+# An enumeration of three options: true, false, and unset
+#
+# @unset: Unset (default)
+#
+# @false: False
+#
+# @true: True
+#
+# Since: 9.0
+##
+{ 'enum': 'OptionalBool',
+  'data': [ 'false', 'true', 'unset' ] }
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0e1930177e..8cf95da2c3 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -49,6 +49,7 @@ struct PropertyInfo {
 extern const PropertyInfo qdev_prop_bit;
 extern const PropertyInfo qdev_prop_bit64;
 extern const PropertyInfo qdev_prop_bool;
+extern const PropertyInfo qdev_prop_bool_unset;
 extern const PropertyInfo qdev_prop_enum;
 extern const PropertyInfo qdev_prop_uint8;
 extern const PropertyInfo qdev_prop_uint16;
@@ -105,6 +106,10 @@ extern const PropertyInfo qdev_prop_link;
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
+#define DEFINE_PROP_BOOL_NODEFAULT(_name, _state, _field) \
+    DEFINE_PROP_SIGNED(_name, _state, _field, OPTIONAL_BOOL_UNSET, \
+                        qdev_prop_bool_unset, OptionalBool)
+
 /**
  * The DEFINE_PROP_UINT64_CHECKMASK macro checks a user-supplied value
  * against corresponding bitmask, rejects the value if it violates.
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 0c17a5de82..1bec8ee679 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -260,6 +260,16 @@ const PropertyInfo qdev_prop_bool = {
     .set_default_value = set_default_value_bool,
 };
 
+/* --- optional bool --- */
+
+const PropertyInfo qdev_prop_bool_unset = {
+    .name  = "OptionalBool",
+    .enum_table  = &OptionalBool_lookup,
+    .get   = qdev_propinfo_get_enum,
+    .set   = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
+
 /* --- 8bit integer --- */
 
 static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
-- 
2.41.0
