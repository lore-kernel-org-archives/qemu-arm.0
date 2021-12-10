Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1550909lfk;
        Fri, 10 Dec 2021 09:09:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwki9eMYJ4tvA32xMBjUZmKK0zuPnEk7qqlJlNsCP5tLAbuFv5J+rQp/6oRQPyrfKAlwUFd
X-Received: by 2002:ac8:5a51:: with SMTP id o17mr28824490qta.180.1639156198020;
        Fri, 10 Dec 2021 09:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639156198; cv=none;
        d=google.com; s=arc-20160816;
        b=Z69VexIRdUaDhx0X8bHJ4BMSb+spa6FoHgv3Jx0Po8mnejc/fFrf5v8kuhI1ZBtHGl
         sg9F9H3nPyAqHmrkxw2bAKnoKv52r809uxX8y9G4piMf0PkVZZZDaWvLkfgNmKBIdZsP
         IQ5mLKi9DLS3/MgFn6v+XoV+nnQmckINiOKRhbgLx0mXCWs0ZuTskPn4ClQZSWvcysTQ
         CcAXGU/brDUvyeuL/y1lUhn4OydhbudIKjsys61JriZ7lHSzpSFsOwxqiFL37+OoDg0+
         I9c1QnDHsmWxYbhnwjIuvBUyc8w84HHcJ2gr9u7Ta5gK1F1Zug9Oqqs2UrBtJaqTRk4N
         cGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eT4rNPLFVR6cVRrKRWEc6vQ7I4D2oIIXC1EjnaeFLfw=;
        b=ko4FkUgYQ/jvQ6w5Pc1P7a504uZMYkachdYP2qUq85WzWB1Wdoxw92Vn6Q+CBEoPTb
         xFbT/vrbZkH+b1rtEu4Tw7YxzFokyzCjOgVtpwmVXNvGXkoxpjGUKhjsztbH4nI5Z+BH
         8FX3qpqOK8RKcdFMJA4byFRk4WsQs4cHUw0tKMW68yFR7biqa5PAwC3FMFhvGAFWJSV6
         P0tH4YQ0cYK+bRh6gGYeVDjjvR9snCZQFHdw2rqSfXPYIevEMCw954SVhzyWBNIgdAm7
         WPHyOABzSDw0rvPG/7zIQckH90qIHvzsZ8E4qIwo5aIwVuhI3r1w+XT1/IAYzVfJXczn
         09Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m6VTRGLI;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si4505887qko.519.2021.12.10.09.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:09:58 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m6VTRGLI;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjPB-0004Sm-DO
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:09:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0005qn-Fg
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:07 -0500
Received: from [2a00:1450:4864:20::52f] (port=42749
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLM-0006Sf-EX
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:06 -0500
Received: by mail-ed1-x52f.google.com with SMTP id r11so31359832edd.9
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT4rNPLFVR6cVRrKRWEc6vQ7I4D2oIIXC1EjnaeFLfw=;
 b=m6VTRGLIYPWf6T4kpr0Z9k52Xt/DXBOo27KioYt4qyJ+8XLPC1xYpJi32ElZv2Zvky
 v5eJPMl+NbMVg55KCd851NYpmsWNLXyJvXZ4SQ4uuoGEGYcO1idzPZxi1zPzi/JXadiZ
 pMbek/sDtyaLMX+nTl9qwHDo4f4n1uPPsmWN2OJM2j6BnNJYO3TG6brfeIgZvIcbfa9u
 1+omUoyqxk4n8LLOkaGxxxGdUr2l/v6BuwTnvhy+Bqfyy/VQsJeFjoBsmNLhyj9Qd6mX
 L95xU0N1YzOVoNsVo0gl6QrhDBLeaxQfsSeuapbnFnfmuDJF1dVbSNoZeeO1Mb4C9yQc
 TJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT4rNPLFVR6cVRrKRWEc6vQ7I4D2oIIXC1EjnaeFLfw=;
 b=TrKDSyys2M9ixj3djY9N+Ixf7yQIxAERTaGSsrurw0a/14LBZK69alEkk9k/wtUKz6
 /SY10JVxWfuRFQvJVJwePPaaQOC/7jz+ROzOmYGAPiU0/JqpLIJD3iktEMaKvp7w5iH9
 esbT5SaHj6RkYIcvB+1NZM8+0xLkRDDtf5smXxGAcdAHl3px49FCjD07odjXS+BopkNY
 /u1Kn2P2IteqTsmxTGw6yfMx74SD3cPHZzUr2MklD4fS99QsYBB0EaHURU+fZ8zh7av6
 gFlUxcHzoNJKKoje9rBhVlafgsiLxe+kyyw1TVoMyrfpJ7xWs7bfmoOmf+OFHnik9DNZ
 7lUw==
X-Gm-Message-State: AOAM53003zBm7DDjV0HU3ilGgyu6aofE0NuhhN+jnerxoraVSJVorL6R
 U+v5rFiUVdwIIn3EyAvwM1vr7g==
X-Received: by 2002:a17:906:9253:: with SMTP id
 c19mr26201996ejx.63.1639155958151; 
 Fri, 10 Dec 2021 09:05:58 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:57 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 3/8] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Fri, 10 Dec 2021 17:04:11 +0000
Message-Id: <20211210170415.583179-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXrQnT8t1A0l

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 53941e4aac..608a0a78f0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2494,6 +2494,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         hwaddr db_start = 0, db_end = 0;
         char *resv_prop_str;
 
+        if (vms->iommu != VIRT_IOMMU_NONE) {
+            error_setg(errp, "virt machine does not support multiple IOMMUs");
+            return;
+        }
+
         switch (vms->msi_controller) {
         case VIRT_MSI_CTRL_NONE:
             return;
-- 
2.34.1

