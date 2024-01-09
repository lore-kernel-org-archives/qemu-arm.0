Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp571941ejs;
        Tue, 9 Jan 2024 10:45:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFtC8zXmcsXyOWF4knPF3pq21PUlvrqU/b1+Gq+q457d1KrMNbkjhItOnGmbrNzwA7vWeD
X-Received: by 2002:a81:4809:0:b0:5f4:ec56:b9b4 with SMTP id v9-20020a814809000000b005f4ec56b9b4mr4371180ywa.16.1704825954882;
        Tue, 09 Jan 2024 10:45:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704825954; cv=none;
        d=google.com; s=arc-20160816;
        b=tzhp4T0DTz2lGxYuD9izKQMNPV0AckNc6UrliS0ffRkcLNc8qEG48/wDfAghnug+80
         M8cVSp8De+MqUM05moxseRWNE0+RDgS3fkdYvQ+fN4pt7FKypPLwM4NtXNv36Z2hotmj
         dsaG0tq9LwQmBZFRIiXBgCHRCwmZ0ElqB6En40xtrGx8p/9C/q2wyD7f78eb9u2zPfjy
         mQ2BzgyhMq3jn5mhNsv/tPIzpWvncn9kSHwBAGPIacNRS9OSzyQwwAeaGE7TQ/nEle+/
         1aypHkYr+nd9oFrjqjZ0upRrHjyZIEFsN/p6Bo9a6P2SGPkYq2IsvGLQtzOUAGzuh2ZZ
         iGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ELjILOJ3Dic5OkXH5mWkJMfQFUKyGiS4SIscUw0pVkE=;
        fh=FYinamK0fv9erUSglU+1CQCoKP7f/Ju7+qA8HNUDanY=;
        b=oOePiQ/Y81BEFu5ikxyOXg/BQjD9iBg2BDuyK/fNk74W/dQkVZ5FH7wt9+5L3zi5Pq
         FNHEkq0xJLAQz250ptkDHAPCS3uxg8V15/doTwFDfimzuFtRdr1DmYVawneXgpFnPCLG
         1o1teb3pJaMMZjz4J/g3iKwBdzzz8Mp0mgtqwiar9ek+jJYDxNAjj7hgXlYAaaUbuVaW
         XWM/mnSAVFqOiOp8VxG+DfkIfmhwDY8Pd8bUasG6qzv96qhbNReh+t1sNVaZ20SfsHFx
         k9GbfRMhXknlm/5VwDsGdUtQZcvbwsBSDUiMudteP2s5ohZjGPw4SGCzSf+TS7qmDQpv
         eIfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=DVYTUKfx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a138900b004239fd7fc33si2537883qtk.751.2024.01.09.10.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 10:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=DVYTUKfx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rNH6W-000080-4m; Tue, 09 Jan 2024 13:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rNH6M-0008WG-AI; Tue, 09 Jan 2024 13:45:26 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rNH6F-0002Wn-Qb; Tue, 09 Jan 2024 13:45:24 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 0725280024;
 Tue,  9 Jan 2024 19:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1704825913; bh=0TINWY8HRlOV+mR0MYQncm2cL7XA3W+i5PPcGq//eIg=;
 h=From:To:Cc:Subject:Date;
 b=DVYTUKfxGhD1L0vgohE86GZiFC/NAMl9r3lePHihJyY2fUE/Ig3K8+c3qXFygAvH7
 4jKhRrAS1KIvTSe6Oeg0geqgTrvqf3jS+hQgNi3CQhKx4FrE87vYxKV3m0xORZEkK3
 kwNAQWdf5f3VdeYggko9qSriYQZVdUT4N8HsVDmIgLg29hoMKqwWF4sHzsGMSVhA7F
 U3aIHdxQun+P56r6Mdujp9wm5Ev+hwAIzbT5bM4nIi5zam/oovtp5+tqtirjNNEcXa
 8qltIgQJZKeLDtgdgOjYzLpZ7L21MuzCqvOydrlDFOaXONgbqlVhNoR84DvOLghFnu
 RtEy6X8SZ/RfQ==
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH] hw/timer: fix systick trace message
Date: Tue,  9 Jan 2024 19:45:08 +0100
Message-ID: <20240109184508.3189599-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DK+8cVjelOCb

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Fixes: ff68dacbc786 ("armv7m: Split systick out from NVIC")
---
 hw/timer/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 3eccef83858..8145e18e3da 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -35,7 +35,7 @@ aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From 0x%" PRI
 
 # armv7m_systick.c
 systick_reload(void) "systick reload"
-systick_timer_tick(void) "systick reload"
+systick_timer_tick(void) "systick tick"
 systick_read(uint64_t addr, uint32_t value, unsigned size) "systick read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 systick_write(uint64_t addr, uint32_t value, unsigned size) "systick write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 
-- 
2.42.0

