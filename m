Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2110052wrg;
        Fri, 17 May 2019 10:41:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylly9F8SPQSU4Dmgl4xuaC0VApGKlimzqPeeKjBH2CUxB8KCV9RrfXySK3FVtHp/lH4sMe
X-Received: by 2002:a50:b854:: with SMTP id k20mr58449381ede.224.1558114893987;
        Fri, 17 May 2019 10:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558114893; cv=none;
        d=google.com; s=arc-20160816;
        b=YbRzmI7LNDClDAFxsZRfxPj68vqSbP8VJ1n0obhxADrRCgoHZXvzQ/2zX/9i4InYLR
         uRHauRMtLP1Oz60zMgq3CNuIZTxNTwzWp6XB9U+Wem3rUqFDrUlzx0f66kjznKSQ9S+B
         LAOcgtQjWzePSiRQ4X9bsHkDxfcRlHbUSatpP2rgWVcfyCxSBcSZIwkFXNK+mFO72dqE
         gGTStyGJre2mh3nprq58aWK222ilwVZbfy2ysdv1dwUddf2XygNENXkuzuqUZU79h2By
         KoR5KzZ1O2lnl6KRQmNsNDsc0My7RNAX3eMRB8V8q3FAw7TTD1l5MCQyb7Dx7sV47c36
         Zwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=K1PYSu9pA1oky++yuIlXAuhJhMUCXE5jcIih2/bVKYA=;
        b=S8MEvs6x4BQ7u9EGgs1Wx1dRpfl15Y/EkQGywKNtA5HIUnyXD3L+QN5DmuSgvFIoRw
         tTV0hFLooDWnegJ53iKnTOiXVwYWsKeNF2BNLrrn08mEF9kvncZpH2GE9TURo4OfwnNc
         O1FdB6aFihU9Y7CBrvIIW9rsUhiDn/WdT49O0+kIsxc3M4VB5mNvkTIleoiNuMb61zpG
         k6b9feD61TWw8zNr/sd1lc3uNgNo6M+7pAu7QPWkECpiBVMdjpdymyXv4IpNz1jF9zrA
         hJ9NJZaqLuTClHTxH5T2o5p6h1KzcCyX0y/fqVznHhIVY9KMYfPrtBbQg/yUglcEbtVI
         /FzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UFWTOmBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si6250160ejw.43.2019.05.17.10.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 10:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UFWTOmBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRgrN-00089a-35
	for alex.bennee@linaro.org; Fri, 17 May 2019 13:41:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqq-0007tM-R5
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqp-0003AB-4W
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:41:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRgqn-000318-ID
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:40:58 -0400
Received: by mail-wm1-x343.google.com with SMTP id f204so7721157wme.0
	for <qemu-arm@nongnu.org>; Fri, 17 May 2019 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K1PYSu9pA1oky++yuIlXAuhJhMUCXE5jcIih2/bVKYA=;
	b=UFWTOmBijaNUh7m6PjBYAFkE6uvTOMBUJoUJXqPtQAsh8TiBQAYe1r+YOSqtM7YRu0
	RfEfVh2gnfa7vF3Xc9sq+AqVci7jkeTeZ3GFLqIrn9syFpaG3Ug7d8TPxvZWz4lhA9k8
	YgdGaW/7BWK0THVAqneWXtGATuiLY5JhKSb1E/Ty3qxhsXpWimI5jyxxUJxa00Nq2+9d
	6cTEjoZTfl7kAOahNt35HWDmlkg3QQLN49MmiLj2bU+3gvUoqM0ZKiNveybanWsnRM8y
	L1AsU8C+gj77EwRME7rDty/G3QG5MSpRFQ0UxNqWQ9EvNRp5oU66jemXazAUEgKB7Cel
	BHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K1PYSu9pA1oky++yuIlXAuhJhMUCXE5jcIih2/bVKYA=;
	b=BkzqBuLH/dj2AOOYuVBlpHxzvmJAVwBodb7Kgz32QSeQsiH66IqgDjlNh0h9Z2inT+
	GvCsQKCWjKtSigfG+u1+h2iD3tGpycQEhL42rbCSHsjKUwK3GwfVukujsAJ0jQW70Zdb
	+jE1BSUKzNyK4dnTKtRqn8lKMG8vTnrY6wlJ9PwAo/RF35T9tDjq574qSgflt4ic+2ZN
	JOB7raLGT19YwBCNpJvFq6rQEp/4LWws59wiywq1xuxraAGr19T1K7294iI3a+aMWfJ/
	8sSXzWaYYGvwY9dsgj0plIyOh1KyfJfWo1xHbbeChJ9FzNjZ/4C/Bd9IuL0/BVtdxf3q
	4bVA==
X-Gm-Message-State: APjAAAURehw+nWIppS2BJK2/UTZKhUy3INGAPjDr98CKK9nIAxa4MBOO
	7t2LrUy1IzrCdW27eUx5DsHT1Xcibs8=
X-Received: by 2002:a05:600c:2116:: with SMTP id
	u22mr3033642wml.58.1558114852224; 
	Fri, 17 May 2019 10:40:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y18sm5418641wmd.29.2019.05.17.10.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 10:40:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:40:45 +0100
Message-Id: <20190517174046.11146-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517174046.11146-1-peter.maydell@linaro.org>
References: <20190517174046.11146-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH 3/4] hw/arm/armv7m: Forward "vfp" and "dsp"
 properties to CPU
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XBrRDGKUVEoI

Create "vfp" and "dsp" properties on the armv7m container object
which will be forwarded to its CPU object, so that SoCs can
configure whether the CPU has these features.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h |  4 ++++
 hw/arm/armv7m.c         | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index e96a98f8093..d2c74d3872a 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -43,6 +43,8 @@ typedef struct {
  *   devices will be automatically layered on top of this view.)
  * + Property "idau": IDAU interface (forwarded to CPU object)
  * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
+ * + Property "vfp": enable VFP (forwarded to CPU object)
+ * + Property "dsp": enable DSP (forwarded to CPU object)
  * + Property "enable-bitband": expose bitbanded IO
  */
 typedef struct ARMv7MState {
@@ -66,6 +68,8 @@ typedef struct ARMv7MState {
     uint32_t init_svtor;
     bool enable_bitband;
     bool start_powered_off;
+    bool vfp;
+    bool dsp;
 } ARMv7MState;
 
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index c4b2a9a1f5c..7caf9bd3364 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -190,6 +190,22 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (object_property_find(OBJECT(s->cpu), "vfp", NULL)) {
+        object_property_set_bool(OBJECT(s->cpu), s->vfp,
+                                 "vfp", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+    if (object_property_find(OBJECT(s->cpu), "dsp", NULL)) {
+        object_property_set_bool(OBJECT(s->cpu), s->dsp,
+                                 "dsp", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
 
     /*
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
@@ -260,6 +276,8 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
                      false),
+    DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
+    DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1

