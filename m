Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5937978lfy;
        Mon, 3 Aug 2020 03:58:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSYf2PDZ43I2ti0XQe5MBlQgr9FSv0g5zN0u1WZ9AQ5I9eDo7TM8mpxs1o9o6h5KigBAmC
X-Received: by 2002:a25:257:: with SMTP id 84mr23532588ybc.259.1596452311225;
        Mon, 03 Aug 2020 03:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596452311; cv=none;
        d=google.com; s=arc-20160816;
        b=AtA1twO/5lmQ9klojFkabMoe0CxxjAVM5StbVmFXTbBCvYdWiZif+LqAFuzJpm2vL1
         Awq1hY/TggsCwE+gsrA28o49nVon7xS4jZ72u54I5PNkgyX06KngI4/OkkLNZTG6bXH+
         /BvfzSkORBMUPzbWlnbHBtecqx4f5u2a6/1Ro6EsAsDUNnCX7PF6c0d67tdr03t3q85T
         CgQVLZKIf30Tn6lfjVG+FMBV0n9MU+r0xZtba4OxWScFfCa82fssfFxGIPJVYldGpgv1
         zxMeTi7c4TvDuiJaCMqrIwl2JaZaw5Zv8UtCqjSlj6DF3OHRfFWeuWpP65varNLmH7rp
         8Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QRLqvjPZM5QRNmLQDr+tXQzUft3WjflEMoWeAB3UDPs=;
        b=BmWUBAsqd0kN6OmwK9SaUrrK1ggQK66Uo9KWQJ4H53wQpTSlkEDZa1xKvI5+A/jtoD
         khCeYshTgyPmJ2SsBYXaj2+sllLzuPJK0HR864T5IsRXRz4nCpGg8+NVv+L7YPyoiNUM
         XwnmbLbBcMXTFDkiKNMuCEa3qx6D1gf/X1Ez+bvMI6+caJVbHtZOCPMsdsP8hcbQAnwM
         g9j02lznT28QdLk+nfI1ngFnvXjx2eaQWhJuJGgakB7bWpCl8qaKI8m71zO1ZkMbGpwJ
         16ZLcCtPvnfRTxlp4Vf4t6l0EcOrWYcmPt3HO66mxFRM7B9NiZdeXdGuRlmyfmF9/18K
         sMhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YDofVzda;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si14728118ybi.305.2020.08.03.03.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 03:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YDofVzda;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YAo-0004FM-GL
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 06:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9K-0002WB-1u; Mon, 03 Aug 2020 06:56:58 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9I-00027E-JG; Mon, 03 Aug 2020 06:56:57 -0400
Received: by mail-wm1-x343.google.com with SMTP id x5so13929680wmi.2;
 Mon, 03 Aug 2020 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRLqvjPZM5QRNmLQDr+tXQzUft3WjflEMoWeAB3UDPs=;
 b=YDofVzda85ykr9fEJEFK62BXHj0/IjkOZ8OHZt2reET5+RD7ncQT8JApdFDmsKKlA5
 4cq4MupOP+lV+rmLY0PNugvyCt1WxIhuN34XbBM9SDqT6fKXx8eRTZXyqO61SLErJpwo
 HnNZTNqvfmf9x0CGZs2KA17Txq8fxZeaWUue2Xm3Leb8AGzCDBuhuKtK+UDAK8uNGAwX
 MHfYZvZLLgnH+pun9QBdGEVT5AqSkN8su9TodvfBdRzB3ekTFu7K6TXS7ZMYREmTXyvf
 uXtTzPysqsvz7EzsfOMTY+qAFGGbEIaaGaNUa56BSz1sJIWoxTRsT6ZSmKI2w9SjDGr0
 3h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QRLqvjPZM5QRNmLQDr+tXQzUft3WjflEMoWeAB3UDPs=;
 b=DCUV8I6H6frMMvqNA52j/zHQ40xgbfDPZCHkZO4wF6+ifM4aAU1dGzZcKfk/9g11e5
 /FoIxq2O4EqT6tFJbP3OVK6u+D9tZ3/NOI668iQloxG6Hvc1jyGkJDsye8ZwanNrJY9H
 iCfb2EKG4r8UmpOpkanCzY6OfOUu0FGCLkWcC7YcNjtc1ZNJyAufILiweGPhYZmlRTou
 6zlWIQiX/IBHLJydH8PiZcWeLWHP0G3CxbBMR165PcTwibKmGnhYlp7edkGZyNgOzTPU
 aTyXOmggyC37DNzzdelV3P0i/AgR4Qe9VK7jnfbSLUvZyCplvgzkiSNcXMyZQmiGlVPa
 XRYw==
X-Gm-Message-State: AOAM530t/JPzkZi3xBPKdKf0hg1vt88zB27tG7lEb1l/0FdlGjEkwwJO
 ORWGSf9dof9Y3iKdXBWcUnR503d+
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr4931821wma.111.1596452214171; 
 Mon, 03 Aug 2020 03:56:54 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z11sm23103477wrw.93.2020.08.03.03.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 03:56:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1? 3/4] hw/qdev-clock: Uninline qdev_connect_clock_in()
Date: Mon,  3 Aug 2020 12:56:46 +0200
Message-Id: <20200803105647.22223-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
References: <20200803105647.22223-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Czsquw/h+FVs

We want to assert the device is not realized. To avoid overloading
this header including "hw/qdev-core.h", uninline the function first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-clock.h | 6 +-----
 hw/core/qdev-clock.c    | 5 +++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index a340f65ff9..a897f7c9d0 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -71,11 +71,7 @@ Clock *qdev_get_clock_out(DeviceState *dev, const char *name);
  * Set the source clock of input clock @name of device @dev to @source.
  * @source period update will be propagated to @name clock.
  */
-static inline void qdev_connect_clock_in(DeviceState *dev, const char *name,
-                                         Clock *source)
-{
-    clock_set_source(qdev_get_clock_in(dev, name), source);
-}
+void qdev_connect_clock_in(DeviceState *dev, const char *name, Clock *source);
 
 /**
  * qdev_alias_clock:
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index 5cc1e82e51..f139b68b88 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -183,3 +183,8 @@ Clock *qdev_alias_clock(DeviceState *dev, const char *name,
 
     return ncl->clock;
 }
+
+void qdev_connect_clock_in(DeviceState *dev, const char *name, Clock *source)
+{
+    clock_set_source(qdev_get_clock_in(dev, name), source);
+}
-- 
2.21.3

