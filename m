Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3428946lfm;
        Sat, 4 Jul 2020 08:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqkj36GJ1OlNBOn7qqG2283LoA+Av6YKO+MgteGRVq4JjcnM90uOYqEAQMAuY4Xew+uIKf
X-Received: by 2002:a25:7c45:: with SMTP id x66mr67828271ybc.325.1593877757407;
        Sat, 04 Jul 2020 08:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877757; cv=none;
        d=google.com; s=arc-20160816;
        b=bzXwM0XlmlLLtnT1LtBqmbRCz95PRY0GovxRAnSnw9uCnLDQT9p0AuC2yTqWg/6iJU
         t7a5HdpVHwaimsTvWMQ7YQizCKivI0ZZzmVfm8Lj7HEuq0D1FwIbjLfup8A9qkpWnH5p
         5k5krUaVTeX6Eb2n8d/3oeCfle+1wazXQQdHwdyejq2etMB9JHke2iiOwhLNghpy5vF/
         VKMxuevHo/NaZFMC6hWLCB4WuPbG313IyuIKFvNJ1VLJRXCUYzcQysHW4dHgRlLBRKHK
         o9ylkAf3SPbloWXou1Ljthkj4vNMl7E1TPtJ7hieTQ+yTKZvbY/5i57X5sixKXtcmYEQ
         efpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
        b=vHo+efdNBqlnaXoUTMnBbSW09/bMP+VNR9YmdpWjNdfGbwNSxa19lLcAybUSnbRVCs
         9Zlsmq43iZqsR8+jKq2xGaWk0z6qag/gD6mnVnfb2BkLB7WAAJH2oowWS2H5oDIqwIM1
         8GW7WnSRfMEYiOQBs4Dgqx5OQKFgfZpxy6IekUWB05gJWXiDAkMx7kzi1YYvSEYRqZV2
         ZqiwB+H5Xwtwa8tSw+CrM5BCjfk2+qq5futi6awis7j8rf7jeY5VjuUCWbLPBgjh7zjk
         Ip2IG4yrMhBHfgiUt+gUAMqcxE4xo1N8yK33yQWVHWcjyG9gzmNEom7PNCdR8tvnCayb
         /Zkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N3NUQlT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si23022004ybt.63.2020.07.04.08.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N3NUQlT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkPk-0002Mc-Mm
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHH-0002Vh-Of
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47334
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHE-0007x9-KI
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=N3NUQlT6CSKAMEo4aIjUeXQff06mVUTNr2OMIO2oiJzp7p0KrrF10rhZeGguyDPqk+yr3p
 PIQ6hTratQrGn2n6sWD3h19P/bWWEZUbokO5kkw3H0ECAqHRw+7d9q1QBA8J9bGit0rjPK
 rg+u9HsO+lwtq2ZDtE81Xeseu26h5Pw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-7iQH0CCjOumxTJN0LCqAIg-1; Sat, 04 Jul 2020 11:40:17 -0400
X-MC-Unique: 7iQH0CCjOumxTJN0LCqAIg-1
Received: by mail-wr1-f72.google.com with SMTP id b14so36078672wrp.0
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=TUSNET1DqL3G3ye2eslDXkswAcmzh4BI0qYcQizJtSIDpqQzeaPDXq5zyRnp3rG/HJ
 lhkHVwxgvKJJ7FoFN941tlw0JMY+iSPKIsCCz05eQSr9PYfxcu2J92QxbU4vTyNO3sAv
 A6fGk+cPMmOBODdHoosTRWZhiQd72/Uz1dFG/sEgqZUtvb9iPW2BvlESa91A2Tews7le
 ad1vQUXBXyhFZBqngNKZXK4ezAIug4AwuMP6+0NAYyphZ2unIKenuyFaAl26l2qASNUa
 dPxvw+Hx88Qyn/0tPNTPwE2q7JyBaZ4q4To5z9XeyIFsQt1L/epBkw54MeAy1vYoX/3H
 dULg==
X-Gm-Message-State: AOAM532G5O+VwQvQiZxt/fEfLYxNVp6xnTdnv4btd6Cp79EA5H2ic5aw
 geNwlEJ+e0xIZ2YQkqkiXHIflrBpqS+wCDHxjY3AY0lpcpa1zipfgh42c5SBkWubCnYuLtH7hb2
 meI9JafJGs6u4
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr44081249wrn.179.1593877216701; 
 Sat, 04 Jul 2020 08:40:16 -0700 (PDT)
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr44081217wrn.179.1593877216543; 
 Sat, 04 Jul 2020 08:40:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id a123sm8262680wmd.28.2020.07.04.08.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 12/23] hw/dma/soc_dma: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:57 +0200
Message-Id: <20200704153908.12118-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WxUVxaRflzKW

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/soc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 3a430057f5..22fd8c38b0 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
+#include "hw/qdev-deprecated.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
@@ -242,6 +243,8 @@ struct soc_dma_s *soc_dma_init(int n)
     int i;
     struct dma_s *s = g_malloc0(sizeof(*s) + n * sizeof(*s->ch));
 
+    qdev_warn_deprecated_function_used();
+
     s->chnum = n;
     s->soc.ch = s->ch;
     for (i = 0; i < n; i ++) {
-- 
2.21.3

