Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6378641wrt;
        Mon, 21 Jan 2019 10:54:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4o7HtQv1Q4OX5qM79R+xj3eLF74Fl2ONcvfodQb165uqshQOKX6JuxvjOPpW7RWi1LktSZ
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr28260495wro.77.1548096887505;
        Mon, 21 Jan 2019 10:54:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548096887; cv=none;
        d=google.com; s=arc-20160816;
        b=g+BlUjXzPZ0n47MwL+y3K1jje18hsV6gC61WXyj3BzOl3mEu2o6XvtEkklcjgefvro
         aRUitm2GMAjIMgUT+ngOi1MjWLC5tMS/7NJ1Jhco6tTsOA9ZYVR5CCMnkoJtJoR8wpqg
         K6HHRP6dvPg3snfYPEBeOj8mF+fDMnXkMkHwi2RRR/iFX4fE9LwNJXG4EaZRbe6QnAKC
         YlXuCfrw28yBcznR8yD1OaFgO1a970QS8NVzxPH3mrJgu6km3c1bS7zvEtw2/kiAs4Cq
         po4wlC1bVGAau7ncDL0WzhtaBdXVhVSEA58eKL7W4zNgqkVB0yCfW3+nkkPmp+0DXLM+
         W8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=WmmMPknEg5hUgKMPxj3CIX2ru0eV6+lHEZhIc4wzqM8=;
        b=wcA/IMEQ4FRpqbNyhgKS55TFMk4MPFexuRp4PBs2mAYSgm31422aE2caT+4oekDQvE
         kBi9jyS4jxeZ3zjP0NbT4lu2mJlso0V2FNtrzAjS6B0+zbrtor/OaawTHDW9StYAAJrO
         qC7Xl73VrjHMEQQWR4nyTV6pzMUBubGEQeQXGWdbih35A5ztC+YNa8NfhXAJIdRhcYS3
         c1v2YQAG4oQPY7cGDUk9Wb0XncFPCNeziqkbC8sQCeIMLcNy/ZlahXthIQsB6+gYLI8r
         CGVbcjIuM4O60LTdwF8Uguu2CVyorhGB6ZeYWEMkhSlAQheTYCK2jFA7iQxMZ/VpNste
         ixdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kH4B50ds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si69693389wro.126.2019.01.21.10.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 10:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kH4B50ds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gleic-0003br-JT
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 13:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefQ-0000qw-0i
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefN-0002Yz-7b
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:27 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33432)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefN-0002WN-1X
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:25 -0500
Received: by mail-wr1-x444.google.com with SMTP id c14so24666047wrr.0
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WmmMPknEg5hUgKMPxj3CIX2ru0eV6+lHEZhIc4wzqM8=;
	b=kH4B50dshKqdlBEi6X0rMUGnH6egzwECFs6BSbOgtvrdRxemJY4HfY13l7SC5DYKHB
	7OER1cxXNm7G6ztPQKqunG7Hnzaum2GCAifUl3gx/wr9h0pVFo3Z/e+uYtRevlhvoVhU
	vn+oclbjsas45TKGbePHHNtXJbMLFnYIQNe6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WmmMPknEg5hUgKMPxj3CIX2ru0eV6+lHEZhIc4wzqM8=;
	b=jJyvvAh7fo8eDCG3ayWX89H/aY9WdU4hby9nl45zvRWg4CBLlpeUT95r+JwzdvyeIL
	/mW9sBye4YA6fD6PHWeCzfYExtJvCJv50l9gJOE08fDz3bOvHr7X3qo/iod1vvNA7NVA
	it4UKmZonpSN5KiMIIAXJ21Bs9xulYI6osVVpiEyAKVxTVb++XxXIqfF1N5TMn5/4lMb
	PGEm+z32x7+CNkwMlI+OZ7+NRurxItlLJWQizdZH4Z1x/w97Czo9U1p82FU3xMG5HCbw
	1vYWMQas+zHx3c9mhdGCY6A4geVFiyKZ0H4THSatbtz6vEOQvI0WOhjZ7sYVxcZ23Ubo
	R0xg==
X-Gm-Message-State: AJcUukdpDkY8Yc7yypQcfqK0wKUf+DcaS/WZGWEhi8j0jnR2CQjetjNC
	CJmlgG9+HneYZfSsoek7IPZNtJCTWunMcA==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr30472796wrf.206.1548096683696;
	Mon, 21 Jan 2019 10:51:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:50:58 +0000
Message-Id: <20190121185118.18550-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 03/23] armv7m: Pass through start-powered-off CPU
 property
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gqqs9AvZqnIl

Expose "start-powered-off" as a property of the ARMv7M container,
which we just pass through to the CPU object in the same way that we
do for "init-svtor" and "idau". (We want this for the SSE-200, which
powers up only the first CPU at reset and leaves the second powered
down.)

As with the other CPU properties here, we can't just use alias
properties, because the CPU QOM object is not created until armv7m
realize time.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h |  1 +
 hw/arm/armv7m.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 2ba24953b63..e96a98f8093 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -65,6 +65,7 @@ typedef struct ARMv7MState {
     Object *idau;
     uint32_t init_svtor;
     bool enable_bitband;
+    bool start_powered_off;
 } ARMv7MState;
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 0f2c8e066cf..adae11e76ed 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -182,6 +182,14 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (object_property_find(OBJECT(s->cpu), "start-powered-off", NULL)) {
+        object_property_set_bool(OBJECT(s->cpu), s->start_powered_off,
+                                 "start-powered-off", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
 
     /*
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
@@ -250,6 +258,8 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Object *),
     DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
+    DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
+                     false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1

