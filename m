Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1415816lfb;
        Fri, 20 Nov 2020 07:47:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgOlkYyWbTfkOdidsiSMxzm/GvOnIaDCnRguWeqy3+DJ1LX6uEED8CnXyNpW+t5vwvJf8a
X-Received: by 2002:a25:34d6:: with SMTP id b205mr20689510yba.220.1605887264590;
        Fri, 20 Nov 2020 07:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605887264; cv=none;
        d=google.com; s=arc-20160816;
        b=lse0P3lz9UQn5yxJYUJS++3H8arWKnZ80X9LmjLZ4kHdDBKMMk4MXLoLGOBkYPsZoh
         qHceXztztIVwM8yOIuM+mVFEA9MJs34aP9h71fYRJUmpmjkXCRK47fuetOq0Y2r3VkYK
         raWGxtZfILKm121l4Y+lyOA/Hu4ahoPQhtHfAMZbeIsuKah9fCkC5QhejFLYCH+pLYjl
         NT/dTN9lNvqckW5pLvkg7VbiStQXOz0N+5zbiBXxwosCYfnDsBLBxDCAVIrF9YvRhbQ4
         9i9aAQNEoE5khPSFGy4lKa0qjWIrp/fmOn4JC3p+APGK/VeP6H/GYXcb85lJbMu3wPWp
         JKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UpkRsLdC0nFsnY4IvJo9npjA5EZyqd941IdOyqgSONM=;
        b=1BH67gyByr87ErRIcwi7UtneaBuRFx+OKHYRAWRNF6JuFFaMt7rSSp85ARifnO7rMJ
         vbcZZeWqgvlWj2ykIuycA2amWepyES4GTvO+rlowlzLFth8JCK3KSPSY/MXT9AaaA+/p
         Wq8vjpr5kGfVS0zfRJUOo7NpPURVyjaHe89MNllf+5ZHuvIyyWfqnpFO95tTzT9c/TF5
         GpC1QeyLsn/1+TBQp3p/B3N2y3kb1vCtHsCU6wYM07PL/+s688ucqcYxnxASODdVN3GK
         DKpjKU61/SnxEl65cQx7F9+gtsH33uqCeYOA3EyKb0bvsoW1WNwUJhkHX/TzoPlpnTtI
         ZlrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eHr+aPIA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si2965647ybl.404.2020.11.20.07.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:47:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eHr+aPIA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8dT-0000Ap-TM
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8c9-0006vI-7W; Fri, 20 Nov 2020 10:46:21 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8c7-0002w2-Em; Fri, 20 Nov 2020 10:46:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c9so10766992wml.5;
 Fri, 20 Nov 2020 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UpkRsLdC0nFsnY4IvJo9npjA5EZyqd941IdOyqgSONM=;
 b=eHr+aPIAVFvCT9mm6UPRXTwgFIMqwDUlzQVgLiV6RJhuLL+ETRNgHs2UOUHN/ScDUY
 PlIC/4HLJMBvZiePKFze/jw1bE9Rla+esyA8uY4S8AXlNvR+W/kBuz9uXDF+lkL9Qh6R
 Zl0fWtERaqlWDKlB2of0ahLRX3o2rdPoYG2hxa5g9GHiKrq8cPqTDZBh37cbIYT99U30
 2EOlIA24C8kG0t4Mt87wVILT0gRT/cfv1Uut3jbVB6ZkzKap7USGs+fAaC1veWwh5KQK
 cybgac5ndujePWNYmvq77h5WyGRbTJ7oBpWNiTlJCOWeaNhgRE+wxrKxEAZ62FZ1I1Ut
 DbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UpkRsLdC0nFsnY4IvJo9npjA5EZyqd941IdOyqgSONM=;
 b=G3aRDCb+oMQ9KiP0JaPcd0HaurQMwIit/8SscEb62ltGKuP7+Fdda/7dsso03Q7kEX
 2vBAkwV+h7vb/N0Q0zLsJHVQXiyE4jowm6JXeDDiTqejsQobzirRgeXD0sZLdgGWacIX
 0HVhMJYz+524MIK/q57SN+h6h/ZIk2Cq40ZQxT2aylKOuHdmnsHkqrYZFEu4hNa0Uh4L
 Xr2P7Bja3mM9x5zP6UomBV7ZUgy9C2cZBjTtte/BmN2uY+SvCMBp19D5S9a7BLjaothN
 wDrW2WbbNtl+NzkkZEBypaWlZGyvz7vCj6Z4rvvESy1C0QxYgFi83CYETM8zefBlCzbD
 dFZQ==
X-Gm-Message-State: AOAM533ElMZdSbKeh+9a5PLaIxVuYx2PaWMwjXrv4rqjUYJ1kr96hkGY
 58qYiFUtNO4xwthxTdvJF9VW1w9FY64=
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr9981462wmc.184.1605887177463; 
 Fri, 20 Nov 2020 07:46:17 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a17sm5721779wra.61.2020.11.20.07.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:46:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 6/6] MAINTAINERS: Cover system/arm/sx1.rst with OMAP
 machines
Date: Fri, 20 Nov 2020 16:45:45 +0100
Message-Id: <20201120154545.2504625-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7nTxbC6ZTL7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 73020648a64..fbb068196a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1608,6 +1608,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/omap*
 F: include/hw/arm/omap.h
+F: docs/system/arm/sx1.rst
 
 IPack
 M: Alberto Garcia <berto@igalia.com>
-- 
2.26.2

