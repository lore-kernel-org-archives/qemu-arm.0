Received: by 10.223.134.117 with SMTP id 50csp12820385wrw;
        Thu, 4 Jan 2018 06:41:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBoth9V7LYoZsogLv55AqW/Alxe4njPRVwaGUOf5WN7veKg1HHniaJc0v9rKCPhWzjDVlDLLP
X-Received: by 10.129.56.2 with SMTP id f2mr4091602ywa.468.1515076906059;
        Thu, 04 Jan 2018 06:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515076906; cv=none;
        d=google.com; s=arc-20160816;
        b=ugx5r9YpUVITuTEjX/gviwMglmRuFyXHy3Wlbm0O3D01QJjWsjpz4ALPuX6M20lMti
         Bt8GkHrkVg9VgosV2LN7bvTeCZMfkZxsOEA7sbrw9qFKLFRzqxQCUm/Q6sPnNonptYsf
         UZzF8TQURcypzR3UUC9mHtAPPhKJpen6m0Slg65QvE1wXecxlt8mpBJISSnskKXm3Cig
         2rtJTo5yqXFBS/4QT/o0OQplb49sYlqXt7QWe98Z1UQVVXLLunIYTWYtfW2fGpgR+xvR
         aENilPSCUdFZ3XuHqHFetHuDa6ZZooSVcu1q9hLCMgJRdqMwcDkvw8HJBN019CiuN7Iq
         aWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=VckVE1NrM2CKq5LqdQMK+DG/tuT4iBPdy4x7DeuqZoY=;
        b=IUIYtlBPse904HZlO6W+6aaPeoNW2n50AZm/s2Db7gtgbmPscRLoPyi/G0HzoclRnX
         xJBesdE7E2Pg0rlOeiXWa4ZGrM9wiPJtzJ53OVHOstsM/UFPqiMLunfclHuGp4lilWaF
         rRZbGMaHM8GW3JhaX1qHClvNec2NDjRF5yRpft2SY+AJFxMP09cMHjfmjHbT2rhp5OmE
         AlyaSARczhSu3G04B51AXjwrbFaaoVuUYibDXcrpElmRfZSSinRdDrFSA+BeUaQ0Yf+7
         zVM/GRr+hAX+sPghuODVz1sp65DjYeJOOHnSA8Pkv5DUNqP/h1Gm2gYtd7KWcqiHYGZ5
         6bBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rnUJ2ykX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g203si730017ywe.421.2018.01.04.06.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:41:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rnUJ2ykX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6iH-00010y-Aw
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:41:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hn-0000iU-HP
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 09:41:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hj-00034O-SA
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 09:41:15 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:45318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hZ-0002mK-7w; Thu, 04 Jan 2018 09:41:01 -0500
Received: by mail-qk0-x244.google.com with SMTP id o126so2135327qke.12;
	Thu, 04 Jan 2018 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VckVE1NrM2CKq5LqdQMK+DG/tuT4iBPdy4x7DeuqZoY=;
	b=rnUJ2ykXMJtLHiX2tiAFHeLx5zwf8QBJssL+4Zp4aDwF4pD4hwY47LXlVW38dpKC+x
	8tkQmXh4enqS7nJHAMHdxaMnWnhK1k0WJXj2yfsU+We8HFFRFS627IxmjBZNvIML5V7R
	z4g+Z+rAgeF61iMnNOx0pe7pdC04ZoHBxQRWfcKSKf/LA9XTzhvvZKcnb8IDgfeQc1Vw
	SZ7KJjW3M0blWsuUiXxQJl4nnNQ8VwPB/xtAbY023sj8CbGEfCsBzT0XuqUVBeHLUunX
	ZwTmwEqKCSXxJG59f6W8e9uZlQsFeW7d9e9dM7/WlgOijQjZf77o0HhrDDgs0E9l34Et
	b9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VckVE1NrM2CKq5LqdQMK+DG/tuT4iBPdy4x7DeuqZoY=;
	b=l4kCT1f8KAOrTb02i7naF0MmIv6z48ZcvqkfUZnE4n6hIulA0JVuK+MB/SdX8mKTt4
	sM22SzHoFiT8E/xruBRPcUw9X6rgPobKA1yciBFaL+QGrVzvvz6U5SiLEj7rY85j+twU
	utRo/LJ1LuDyBaWOtVQclAPDugFw7e3UiequuaOAgqxiazMBsKqnnyTvpCTXwIv5g/2G
	/c0TD1MubyvAw4kMMH2JvfZC+A1AmOooI5DiX+bUEkZndEQhX7ZEn+hb5OX243GgdzsE
	KpOYGIj0/7TMOsIlq2Xsk/yLas73cV+3Us/NypQ334hiyPXWmVxPD8/njTr8VBnHyyAE
	7Q5g==
X-Gm-Message-State: AKGB3mKrXetFyP8XfpTz1R6WX+HMXOdl/vpKl3zghK+k5oN02+nL/Ia6
	Vmm+Y5qPNG5qhw5NfOrcVH8=
X-Received: by 10.55.128.196 with SMTP id b187mr6344263qkd.87.1515076860597;
	Thu, 04 Jan 2018 06:41:00 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:40:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>, Alexander Graf <agraf@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Thu,  4 Jan 2018 11:40:41 -0300
Message-Id: <20180104144046.30793-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [RFC PATCH 1/6] qom: introduce TypeInfo name aliases
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CVHw5ftutsg0

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qom/object.h |  3 +++
 qom/object.c         | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index dc73d59660..5d6e8795d4 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -428,6 +428,8 @@ struct Object
  * TypeInfo:
  * @name: The name of the type.
  * @parent: The name of the parent type.
+ * @aliases: A list of alias names for the type. This should point to a static
+ *   array that's terminated with a zero filled element.
  * @instance_size: The size of the object (derivative of #Object).  If
  *   @instance_size is 0, then the size of the object will be the size of the
  *   parent object.
@@ -468,6 +470,7 @@ struct TypeInfo
 {
     const char *name;
     const char *parent;
+    const char **aliases;
 
     size_t instance_size;
     void (*instance_init)(Object *obj);
diff --git a/qom/object.c b/qom/object.c
index c58c52d518..c532a8aa65 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -83,10 +83,15 @@ static GHashTable *type_table_get(void)
 
 static bool enumerating_types;
 
-static void type_table_add(TypeImpl *ti)
+static void type_table_add_with_key(TypeImpl *ti, const char *key_name)
 {
     assert(!enumerating_types);
-    g_hash_table_insert(type_table_get(), (void *)ti->name, ti);
+    g_hash_table_insert(type_table_get(), (void *)key_name, ti);
+}
+
+static void type_table_add(TypeImpl *ti)
+{
+    type_table_add_with_key(ti, ti->name);
 }
 
 static TypeImpl *type_table_lookup(const char *name)
@@ -137,6 +142,15 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
     ti = type_new(info);
 
     type_table_add(ti);
+
+    if (info->aliases) {
+        int i;
+
+        for (i = 0; info->aliases[i]; i++) {
+            type_table_add_with_key(ti, info->aliases[i]);
+        }
+    }
+
     return ti;
 }
 
-- 
2.15.1

