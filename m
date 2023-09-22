Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1398712ejm;
        Fri, 22 Sep 2023 08:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPwnyXxFApOepAG31YDNLFjKi7tmUXaNwhxguZDvZ47j6hmmv7kV/eO7BMBS3mowPSU6jk
X-Received: by 2002:a05:6870:304c:b0:1d7:1323:5ffb with SMTP id u12-20020a056870304c00b001d713235ffbmr9524611oau.54.1695396622991;
        Fri, 22 Sep 2023 08:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695396622; cv=none;
        d=google.com; s=arc-20160816;
        b=dTJhNu9wPywodED/QOSA6NVid6++OXQRqg/I6sBXfcNajmkex0CSn+QvampadA3UBt
         6JadKluD5Ew4Vi/H0Ocgv7VvuBp3y6gYCXOHz7fGopk+Krp1spn+7OmnSk8jzY+FHJQu
         2vloKplDSfOkFljn7fCCVjOFgd7AQYO9y4/RQwcnDvzY0sD9hn0esjA3dHkrl77EwkG0
         Ai50NxnSi1Wydjj67WnS/KovNSFchSGLqNd1xuAwr5czK4bC1A5VbFcnQkcV+fuJeEKE
         8rOs9x9bBtIqyWeahZcWTC/Gmlc8EBkHVu2sLwSvxrY7cMquXbcsP9FTkzJFsgreq5Ld
         FS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NVF3Nkth4giVKdzfl1RSEmEQYi2EYDdx4MRHrnjWkQ0=;
        fh=uVBMvYrx+X7m1lFjfWwA+UgXnF+hI4+JyNcPtFqOEwM=;
        b=PQpIzusKlPQJhzW9+px60qv9ij7il6AoFNzNzEYZb2z1TQl0Nci3fPt2/9hiN+B4vJ
         Wt5cYGiAhQoyE0A81+zG678zWIC1z48/VH97wdnyPANjLWbJ31wpXmcykbak4zPkBCLe
         F+/KUg/zkK14Xw7yZ6ThWYUjbQJCaaRk/bPl7+sALdngbs2wxTUL4P3s78+UsIbvqrH9
         eZJfEqmhYrNbMw8WZiPdA4ue1A1G0qI2KsfdwBSEeeK6xYoiWF9QiNBMYvqLdQTGzQEJ
         CL79OOWMIy6ryse2ICX6Dw+7+K2zMKiyaFB7UKGTXqCZaPAGdl4Pcu6s4hbWjFGOggez
         0RtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k0/YzH35";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pr12-20020a056214140c00b00657a0cc6353si2368554qvb.180.2023.09.22.08.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k0/YzH35";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qji6a-0005PO-MC; Fri, 22 Sep 2023 11:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6P-0005KU-FA
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 11:29:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6I-00007V-Fb
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 11:29:55 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4051fea48a8so26024285e9.2
 for <qemu-devel@nongnu.org>; Fri, 22 Sep 2023 08:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695396589; x=1696001389; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVF3Nkth4giVKdzfl1RSEmEQYi2EYDdx4MRHrnjWkQ0=;
 b=k0/YzH35ghikYlIiEdjrT7N2qCzplHzm7VQX4yYnxYrUbofTpH2HsuqDumFKcnxEh7
 6aLhiECsfpTspaU/qJa1cKz+F8jLSZBgpcW0dfmjaJOTF+xiN7aGHs6iiwqHggjuJrAq
 Tu/l9C6KPj1pn9C4vmO0OYubPbPn4U7KZi/OTW3Z2iPHvyMFK0HVgcCXuHAi8suAYer1
 NJVVXsShH9xBhwtgg88WnMZRx7UNmciTPprY8aE4frRA1UUAD2frmbV2eTWZLQyw7R1T
 aY4sqLnUtNe9iZBKADck9+CczcBk5jkyTHAYLll2mDUKBMsrMXnclTSXO9bNlyTNTQsX
 se2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695396589; x=1696001389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVF3Nkth4giVKdzfl1RSEmEQYi2EYDdx4MRHrnjWkQ0=;
 b=dJNMhTNcsTk9vwtXnfJTnajy03/RB+58zG7YohlPgBQ0PFdMM+0w0qudtooaYrh9L7
 AD0XdrSiwk9/1nAnDOhrInWJojN12REdBU6g0/rtG3t7xtzv+GI1MLYEcuR1lNHgXZHm
 WgE4Lf95QxO9oZhJOMbsx0+NK634pHCAch/Gc6+Ego3FzYa2A2hwohzkYvNmepv0uggd
 UAnKH/wvOOKCFamO6+9k0/zk/w6TuqzgF8SkxnlqVBo54QrqIya/o0wrtf4Knn5TWmVH
 FVwMUC4AP4SXAHFBbE8RVm3wWw96kSQgvqktnfTNB+4Pszu1oPQPbalt+8WSgZNf2HF3
 fk6A==
X-Gm-Message-State: AOJu0Yy1DTukDRFmw5XkbSHxdlYyF+ntnqSDe41akhemT1P+pdMVd8XQ
 zFRYmAfaHH9toiUrptR6HznYDpbYD/yHOF4JZmI=
X-Received: by 2002:a05:600c:2206:b0:403:ca21:6348 with SMTP id
 z6-20020a05600c220600b00403ca216348mr8025091wml.18.1695396589133; 
 Fri, 22 Sep 2023 08:29:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c171600b00405442edc69sm777137wmn.14.2023.09.22.08.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 08:29:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 2/4] hw/misc/arm_sysctl.c: Avoid shadowing local variable
Date: Fri, 22 Sep 2023 16:29:42 +0100
Message-Id: <20230922152944.3583438-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922152944.3583438-1-peter.maydell@linaro.org>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: w1KtFS9AVoWS

Avoid shadowing a local variable in arm_sysctl_write():

../../hw/misc/arm_sysctl.c: In function ‘arm_sysctl_write’:
../../hw/misc/arm_sysctl.c:537:26: warning: declaration of ‘val’ shadows a parameter [-Wshadow=local]
  537 |                 uint32_t val;
      |                          ^~~
../../hw/misc/arm_sysctl.c:388:39: note: shadowed declaration is here
  388 |                              uint64_t val, unsigned size)
      |                              ~~~~~~~~~^~~

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/arm_sysctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 42d46938543..3e4f4b05244 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -534,12 +534,12 @@ static void arm_sysctl_write(void *opaque, hwaddr offset,
                     s->sys_cfgstat |= 2;        /* error */
                 }
             } else {
-                uint32_t val;
+                uint32_t data;
                 if (!vexpress_cfgctrl_read(s, dcc, function, site, position,
-                                           device, &val)) {
+                                           device, &data)) {
                     s->sys_cfgstat |= 2;        /* error */
                 } else {
-                    s->sys_cfgdata = val;
+                    s->sys_cfgdata = data;
                 }
             }
         }
-- 
2.34.1

