Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2779554lfm;
        Fri, 3 Jul 2020 13:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysMFTbKjUbLqkGkFxoal4WiN8ZiMmECD3//PeC/1aYRfPN/yUGAYx0o/DNcgFyNcMRozpr
X-Received: by 2002:a05:6902:6a9:: with SMTP id j9mr3192247ybt.52.1593807631021;
        Fri, 03 Jul 2020 13:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807631; cv=none;
        d=google.com; s=arc-20160816;
        b=g5dRRV4esrMEo+jK4ivbnzFg473t5o109DxyRjBQKEPoVZzCUjfWDPP/YsbXr6DFmc
         PDoEEM5NlKRLkEM9C00Qme7flBc3uuagM+KyunG92S9zwRik1Su0G2+E9D+PKkJqDVHD
         iaHQe9dWJE50m0clf1wTcwTUDUe+OVFYnJ4i/YgjwgsB6rZfYGp+1R2aujOODsTPTTaQ
         3DqCRcgznt2njcSTTwKoGcnUc2o5MQtsEFOlDO1jLVH3pBYUo7i8LC52flia2NYq53Kz
         BPxxhWgt9S8zHcmsAo8MsuKAKHATIUiZNSLE6wD185pbYHfVZxTmB4lBibqYZGAUC0Bx
         qVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2GuBHKsHLzYgL44H3B48TCEkY6HTfH/2zhKpEv9Zqyg=;
        b=ENnX+8fA+eazWQ7Pg14EYBI6EvdgZv9y0km2m6KLAIJ4wWDCpsveg4P4/0Fy08pXTF
         poCN5pRhsQMj7z9kMMuAvY5OHP4023uOhTqmqx2La0AzcRg4kC9oX+7mfLa2rQvu9YH9
         RcsutmVf+7kvoLnS9eNvitan4zQSnpLl/gVvtLlfMkTkFGd9PY9KIvEVzV829n/XWm8V
         2zPskd29BE5jYJomA6KdU9WyGJCxWJQWslIly4AwyMy4wLpbbkussKleS1bJEoLSCJo5
         iF7y+80aIGyLS0Bd9k4SVdUtiPHVFiMN5m246OpQsd4ETVeSS2CCdXs0kfURIhNfifsI
         50PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="a5/7931z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si15085483ybb.475.2020.07.03.13.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="a5/7931z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSAg-0001O8-AF
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9Y-0007s3-Ir; Fri, 03 Jul 2020 16:19:20 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9X-0001UV-2z; Fri, 03 Jul 2020 16:19:20 -0400
Received: by mail-wm1-x343.google.com with SMTP id 22so33116638wmg.1;
 Fri, 03 Jul 2020 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GuBHKsHLzYgL44H3B48TCEkY6HTfH/2zhKpEv9Zqyg=;
 b=a5/7931zoLIOmejcnQSbCxJ/FV/6F847W8EVKWF2xwspp1yytJMzwEU/ZOi7Dj3ZpJ
 UzejGkMwd8671ivvZwvAdASsQIfphrm8Ht76svE2LI/SlRlE4RMleueh4Krs0u7IEzk1
 UJCXBTxdSMpAUKqC/JgQ7TOoxyNWpLhWwy55DCxIFaZDOitKh18UTAMDsi8LtNS/DOyB
 qb8vf9/LVk6AR4vWuJ6UQI74VSG1GhhWAKweceiN3vU6Rlnm4/DGp7BWe9KPOzhQpCGR
 tQ+SlpuxPtyYnIzL31biUYuMnRXJFk7u64RsbqPCJ3nhl9Vypzx5huGwm9re/sUfiuL+
 V6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2GuBHKsHLzYgL44H3B48TCEkY6HTfH/2zhKpEv9Zqyg=;
 b=nDMqNHG6VoRixLsu1YyAPU0zO3V6QlXo2yABYQMoGzppG1RmyA8RbxUbfHzl2dfXY6
 xfwogfugkxEtR2psontzVJflMBoVz1KpMpDaHTeaw9jRDuF7kiI8FLn05pt2R0Jfdval
 f1AH3Jqu23hEpLurbVhlgmCx8gJHRx0mY+FZyvCyzt6/9iAIL/1EB6xE1m5tZ9N3emyA
 +RK+eTg9pNc/lpmOdd5PLZXwa86/dHpj90RX4PfHTN2Dl1PQbRkbXQokXxuBQ8LtOAAG
 3diUV8GRIDcQr5Mv6xoZe0RqZnTQlw1d2I2JcrDfedDzYKMN/DU2IrvtHlv1ILMVb9gJ
 fP5w==
X-Gm-Message-State: AOAM533vfV/uOzJVFxfx6ixwYgeoqmZAu0Zyj8I1rYEBCbXmqXlKlK9N
 X1u/k1Vnx71BSl7MuV71YNi4IZHOWF8=
X-Received: by 2002:a1c:3bc2:: with SMTP id i185mr38854306wma.33.1593807556772; 
 Fri, 03 Jul 2020 13:19:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 02/18] migration/vmstate: Introduce vmstate_no_state_to_migrate
Date: Fri,  3 Jul 2020 22:18:55 +0200
Message-Id: <20200703201911.26573-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i8oR+qd+Boj1

Introduce a special state to indicate when an object doesn't
have anything in its state to migrate.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/migration/vmstate.h | 1 +
 migration/vmstate.c         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index af7d80cd4e..0922bc8efa 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -195,6 +195,7 @@ struct VMStateDescription {
 };
 
 extern const VMStateDescription vmstate_dummy; /* Exclusively for linux-user */
+extern const VMStateDescription vmstate_no_state_to_migrate;
 
 extern const VMStateInfo vmstate_info_bool;
 
diff --git a/migration/vmstate.c b/migration/vmstate.c
index bafa890384..d640cafad3 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -20,6 +20,13 @@
 #include "trace.h"
 #include "qjson.h"
 
+const VMStateDescription vmstate_no_state_to_migrate = {
+    .name = "empty-state",
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
                                    void *opaque, QJSON *vmdesc);
 static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
-- 
2.21.3

