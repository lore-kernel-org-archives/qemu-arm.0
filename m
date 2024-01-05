Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp798027ejo;
        Fri, 5 Jan 2024 07:55:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg878eF5/deVifpeK2ruL1iZiBkEufW1OL+Js8P8pnPpAqpzcOcvyLAxjXrbzTi7gstR2X
X-Received: by 2002:a05:6808:1242:b0:3bc:ba:edb with SMTP id o2-20020a056808124200b003bc00ba0edbmr2626747oiv.113.1704470136470;
        Fri, 05 Jan 2024 07:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470136; cv=none;
        d=google.com; s=arc-20160816;
        b=VL8+jkhY07f0lE/AZ/S/FWGTkiA9bUC41musM3qM3hEQffrDEy7rrp3WLMiZtRKsCx
         Ocw5rBKQPqHzdFlYUNWZxUqAFoWD+MfXbJDYupinxEltH0e/jgOyAcdUifhKdgh/RcYa
         A8ELUGNCdlfV9cAfT9NitF50H9r7P3E8rw4qxUq8M9fH3LH3GzYshr0FOdqk6HeqGOAJ
         cG+EM7szxwszIxaezQl4v6E8SdCyIqdC2fYx8tfJE+ZTP1tYZu8qq293WjeltuS1H6R0
         E3NgD5RTEHa1jJeSFR8xCt7CYI0prWwXcmi7F7CQd/YKCRJpFzsI4F7B6WnyL5ihyqh1
         CIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XEzWZCwZQ+htA+jgYj3rjLFf9tHBeYLo9LMvIOXJj6w=;
        fh=Tgok5Ja1XKXjD8fYA4+PGzfwRqVevtjAFIk/7/EPOqk=;
        b=DHfQe5hUD1KGafx7mepPwxk1wYttgDYG+UGVhUliUzKMDvczWAPJjBIWMPA6e4F4dp
         Ejr7VVS+tsQS5SaC6Fps70SJYBUhB4o1i6pdTssoJFVM1THQ9k3+20jZdduMHAfJLaef
         Y0muLb0qcKBO7YGmA8PaJMEHPAwut2coNNwvbZ5JJCqX7pJYGWdYyctsvlQcG63YGcE+
         3HqCta5sRwVlrvoGDik7tdlCFnpRlrNCOOLd2ZGA9b2ypi0pESg0S6pERRJfmRVKwhpw
         WMi/UCT3hF4V1Jd/TamtEIW2hyvDLg4y0ExqYNjLMElMa+huez2bnQseYvvB7WMF07ZA
         5wyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nCXK817t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020a0c9a41000000b00680c9b13a9asi1964593qvd.557.2024.01.05.07.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nCXK817t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmQx-0001fN-VP; Fri, 05 Jan 2024 10:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPp-0005YB-UY
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:47:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPg-000449-CX
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:47:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e3a67ca9fso3855415e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469629; x=1705074429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XEzWZCwZQ+htA+jgYj3rjLFf9tHBeYLo9LMvIOXJj6w=;
 b=nCXK817td/VnpUirjMpwSpCEYNUAYudv11qv9iNTOD7o68idIefMi81ju6uJ/gBNNQ
 qO+Aqq4ShJk7vh4MIfDQabsrn5Nv2Cxa+RBMTzZtZwAJvMOqgbd76jcr4Gyo7TGnopiP
 YKRkwriNpcIQW7RuKO1tLzBY9OFF5ftIeqgAUfVsWTFpyG430WBDUDoXzwVJ3+OzA2IP
 QnzqWnax+VuwrCJozRhB9zorZ2/94jgvaOINaHaQyZ2vn+r0qSvTfDkeEdhHIY2WvMur
 DEa25eVMa1pbXNcI2nwyUdp1+5ZbKKw81WFnRpS4C4B2XIRlQk6rKmn4W4ZQUQdStk0t
 nHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469629; x=1705074429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XEzWZCwZQ+htA+jgYj3rjLFf9tHBeYLo9LMvIOXJj6w=;
 b=qb5m7O2c1ug1nLhQL35ekKDJby5TNZVhClQi955zMjIkRVhJ8Pew217u1LG0tHPZ6f
 chgbKmb1JaCjcev7PKwqb5yBydUjG86M4ZbTlckPNK4LBdt+4pAY2XbHbs1mub5DQR2d
 CHs3CdNfDNlTgBB35Fl3rzdexwkrBZ/ZlO7tsCGkjp8CpWreUU6M4rigUGr9Hn4zy0Lp
 IYGhZSLWLtnyia08e9sq5pAfFjTaxn1+LbY3ZMZ6RkDFt2WduG5Ep/0h5cag8mHK7RzD
 +OnkDdRI/ULnfOmUDGlIZZg63qc2ngTT1xYnA4RP6qk+66m2fquoGKY50Xr2EB1Aiqvj
 yUZQ==
X-Gm-Message-State: AOJu0YwytYrETflfxb8Vt8PcaLMqpNrbEJxq7pTd/EMBszy+rKUyDw4u
 mFrZ0+Ru790Gc5BPFkx1yQhWUl2soFIJRpdL/FQTMwLFUr8=
X-Received: by 2002:a1c:790b:0:b0:40d:79ec:bb4f with SMTP id
 l11-20020a1c790b000000b0040d79ecbb4fmr1232048wme.26.1704469629159; 
 Fri, 05 Jan 2024 07:47:09 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d410f000000b00336e43e8e57sm1612761wrp.58.2024.01.05.07.47.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 36/71] hw/cpu/cluster: Cleanup unused included header in
 cluster.c
Date: Fri,  5 Jan 2024 16:42:29 +0100
Message-ID: <20240105154307.21385-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: PU6dgb+xO4Fe

From: Zhao Liu <zhao1.liu@intel.com>

Remove unused header (qemu/module.h and qemu/cutils.h) in cluster.c,
and reorder the remaining header files (except qemu/osdep.h) in
alphabetical order.

Tested by "./configure" and then "make".

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231127145611.925817-3-zhao1.liu@linux.intel.com>
---
 hw/cpu/cluster.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index e444b7c29d..61289a840d 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -19,12 +19,11 @@
  */
 
 #include "qemu/osdep.h"
+
+#include "hw/core/cpu.h"
 #include "hw/cpu/cluster.h"
 #include "hw/qdev-properties.h"
-#include "hw/core/cpu.h"
 #include "qapi/error.h"
-#include "qemu/module.h"
-#include "qemu/cutils.h"
 
 static Property cpu_cluster_properties[] = {
     DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
-- 
2.41.0

