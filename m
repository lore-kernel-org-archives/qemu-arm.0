Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2434959dyb;
        Mon, 23 Jun 2025 02:44:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXE5Bym9db+n2Eeo7p5f/d2kcmY94rAIbD6HF9OqLPNHQIupZNK3oTrToNci8/IRQ98uUfbYJSP3ku+iA==@linaro.org
X-Google-Smtp-Source: AGHT+IEO1gktnagIcXl+OjrTKeww1AlXrvHWdJtcPJbrK1Zcs762e0CKzbBsiEC9K6Wk3oNMLG3Q
X-Received: by 2002:ac8:7f10:0:b0:4a7:2f49:7626 with SMTP id d75a77b69052e-4a77a1f79b7mr170149731cf.7.1750671890897;
        Mon, 23 Jun 2025 02:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750671890; cv=none;
        d=google.com; s=arc-20240605;
        b=SlO6MyVUf/2FTWQmIgKUz62hGOw6y8f7DEkfxHiXAs0AXEKC1gEzSfD8aT4Eran+st
         MaCaZzYJdyt8qc6z7df0uThh3kWbjqUafruFE9JGTVOYnzZEWsf5v8fAT3BpcHbV9Buk
         4tlbm3KTVtj0uEDK/KIa/m9RuOnytzrnio2Io61vMtufxmV8mUWSbmJKuHjlmh8PwrUf
         XjY2N8oBVbU5kT1AEz6bw65v+JSKlHUtSlJp1uUb+2iu8tZnECcsDRiQsDy+Am37c7OK
         sK3XHbiuBqc5Azu61nZIAzLk40RojHb0bg7g+Yw4OHUJ2CVyA+5DcR5VIsuNvzi5KTxR
         pBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=Y/bSr2nb18L6nqVz0dyRdn/kwZP4O3g23uy/HPYz0gM=;
        fh=y6a9dndW+0CJHcvYdghYwLzdcwMeXoOVhEZ+ThybITY=;
        b=YQ0tOK2tYs9z5kIP3jbS6BnKsG1bTVpJTklhE7iQDA0NMrQV0EODRCKo7rJJQzC+S2
         7XNk5s+/MgeW6Z/XsHqICPtVtJ5HkrYyJtqGGgHWx1uYgb5g4B5okH3wW9T/J8ZoIZmi
         dCd2s/QrhEvk2WkWBRwQAyKZu6TLvp4O6lX/zFpbnZaFJCVbX79pV5bmhuAUjgt85wi9
         lfnadTJEzknFWa1KIbbsj1sSUT7fQyP+qN8vqupEJUyIx0+5bnC8hLi+3kp2bT/HVwCC
         JJRGMmW1xblYLcYPHhMDxmZgsfs+rMsNkuyAbYv3fY9ow9OeigYvSxo9WihRXw+B76ju
         ObDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a779e982a8si72423221cf.223.2025.06.23.02.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 02:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTdjJ-0006dG-Bq; Mon, 23 Jun 2025 05:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdjI-0006aG-2W; Mon, 23 Jun 2025 05:44:44 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdjA-0002iG-As; Mon, 23 Jun 2025 05:44:43 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQjlz2HPDz6HJc8;
 Mon, 23 Jun 2025 17:42:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 05ECF1402E9;
 Mon, 23 Jun 2025 17:44:34 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Jun 2025 11:44:25 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v5 08/11] qemu-options.hx: Document the arm-smmuv3 device
Date: Mon, 23 Jun 2025 10:42:27 +0100
Message-ID: <20250623094230.76084-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S7b6vOZ/WBFG

Now that arm,virt can have user-creatable smmuv3 devices, document it.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 qemu-options.hx | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7eb8e02b4b..7d1a12f7ef 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1226,6 +1226,13 @@ SRST
     ``aw-bits=val`` (val between 32 and 64, default depends on machine)
         This decides the address width of the IOVA address space.
 
+``-device arm-smmuv3,primary-bus=id``
+    This is only supported by ``-machine virt`` (ARM).
+
+    ``primary-bus=id``
+        Accepts either the default root complex (pcie.0) or a
+        pxb-pcie based root complex.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.34.1

