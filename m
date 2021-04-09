Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1794691lfr;
        Fri, 9 Apr 2021 13:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+CbjG5egC0suvyY6UN5ZhotwmvbBQmGVF8AIn/VAMEsm/Ah9GZjbo6YtL6zD33rbYMfkK
X-Received: by 2002:a92:d383:: with SMTP id o3mr12426987ilo.131.1617999513359;
        Fri, 09 Apr 2021 13:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617999513; cv=none;
        d=google.com; s=arc-20160816;
        b=mbdOL5G/GnWyWGQ0HtHi4OqmwnFlwB11E59yFPWgxi9T0pPLgMLgJWfHfZBCGRhUYx
         w9cQJ+1BfAGXt+BTCqhTKaveD+D1/bmvJTVz7xKdsF/er8QSfbKaYFyP/aLH88le66/9
         zq7qdVnFMqCrBZWW8rdYgnER2CVQNycmiAkypswchvllFLFpGPVW04uXKCp8NdhN+nA1
         hFikKqKOt+VATHdxA+LRpwjzfErQR/0yR/BRTyESH2JLP+BYpb3W1hizQaRSw61fRmP6
         8N+utmwhrfVGiwIbIoPjioLe7kyRdtwu71v2theqkHtiOZgTSGpbE6PdVD6yB/yMh54A
         5Qug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=nv+8xvdz3LSmpwi61uacfMflzrGYkLHq1FKAJV3U2w4=;
        b=x0RvirQMFj3rFe2l08eXLXALbSLhcWq1NEtxzOS7S9oQSYQAQo3FaMP20bOJL+FcsZ
         C9KGzSXhSiPWVEzZMViuqxveGD8PKfDCJ7dV8lFAIU9d7cEHlLJh4ABeVAvLTrbVQ35t
         fgWtbZSmFJE/W/eqU5+bSHAO+2ZkJ6OTszikMFu5aeynO4yxAtEiamBFY/zc3hX+SWFr
         hI7TnnyKajCKIUggeucOPpzwSVjz56xcRSGbbyW5oHYPiZYR1mFFuBhimR1iNvq/nUdS
         VBFDRFkmoUqz7trQ8PaP/B2PZf6WXM+5YbLJBc0AMQxdLC0abm2QIPF5J/SP4b0lfaXH
         WRLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=C8CbOhOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si3701141ilv.149.2021.04.09.13.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 13:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=C8CbOhOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUxaK-0001kw-LH
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 16:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vbVwYAcKCvQrajpqnackkcha.Ykimaiq-Zarahjkjcjq.knc@flex--venture.bounces.google.com>)
 id 1lUxWu-0008P7-O0
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:00 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:40835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vbVwYAcKCvQrajpqnackkcha.Ykimaiq-Zarahjkjcjq.knc@flex--venture.bounces.google.com>)
 id 1lUxWq-0000Ee-N0
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:00 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id w9so6548210ybw.7
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 13:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=nv+8xvdz3LSmpwi61uacfMflzrGYkLHq1FKAJV3U2w4=;
 b=C8CbOhOEOftJsnofUlLpxo5s+C8JQyjo2riZ+Z8CHEnG7HHPbkjDaVCtCULb22+WbI
 3YtV91mWDMwaLEhjn4PWiMrMOd1OmXwaB7tvcAv6Cl9LZnFNLHIoYam2rL4SMt9TaqeJ
 1nu0auieKOrrCPxzIkKdxxZfA7IqM6RO9+xTaKzUllml1s1/m2RvpUYhg2ShxNKLAz2g
 wzHv/ntEEEhFV99QgRTOTlDc6qLrex9M5sLVrRUKsLsEzcMnGjYqsYa+KyYg7yi1K+HZ
 ijhRRUsQRvlOaBPMJ3A08SjSXxOwCG1eOzhIsdFZ42gYt42bBGZOCtwrm1ei7NU+M2wA
 +Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=nv+8xvdz3LSmpwi61uacfMflzrGYkLHq1FKAJV3U2w4=;
 b=jJzBvj7r/u1cF0McO8noIMIN0Zow6TB/AM5ETS4qGXEFqcinRaLXL1vvYakECLmGel
 RkiVHYgKkByk2O9TY8nyZHx2ZyPWfhUvbjhXNYzO4xFTkXSN89mARKJmqcBWUSMpjnX/
 B9hDiH2XTr4unFoDftoiarEYmDSKBPnPMpxg8yLcFzp2aFePnmR0BV0ivHt/8zYAA2B/
 6D7iDNXaZIMvUPH8Ov9pNEVNA1x/YXUfjnT2oun8rtj1CObn2X8T2LucnYcl9ABWLMfh
 6RU2BQyxudy13uUmhssqV5F2wbrB74VMPTgq7V5ara3uCYBoFECKhiygoe6R917My772
 +Sqg==
X-Gm-Message-State: AOAM53156Ovh+95JtEb1pc+qOk9B1qbyk/7CBe0c2NAqkSf37v8YqE3V
 IgeaYDH+s2AYIM3JswUnqWk0XjAcXr2X
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:ec3:6619:183b:36d8])
 (user=venture job=sendgmr) by 2002:a25:907:: with SMTP id
 7mr20460523ybj.346.1617999293031; 
 Fri, 09 Apr 2021 13:14:53 -0700 (PDT)
Date: Fri,  9 Apr 2021 13:14:40 -0700
In-Reply-To: <20210409201443.111197-1-venture@google.com>
Message-Id: <20210409201443.111197-2-venture@google.com>
Mime-Version: 1.0
References: <20210409201443.111197-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v3 1/4] hw/i2c: name I2CNode list in I2CBus
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3vbVwYAcKCvQrajpqnackkcha.Ykimaiq-Zarahjkjcjq.knc@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OT9TgTG9MYWk

To enable passing the current_devs field as a parameter, we need to use
a named struct type.

Tested: BMC firmware with i2c devices booted to userspace.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 277dd9f2d6..1f7c268c86 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -58,9 +58,11 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
=20
+typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+
 struct I2CBus {
     BusState qbus;
-    QLIST_HEAD(, I2CNode) current_devs;
+    I2CNodeList current_devs;
     uint8_t saved_address;
     bool broadcast;
 };
--=20
2.31.1.295.g9ea45b61b8-goog

