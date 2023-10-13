Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333068ejc;
        Fri, 13 Oct 2023 00:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp3j1RjOVwwpUnGe2lqc7zu2FRtJPAYBE9rJObxqzgnXsyu+aybvKwDRzcL0z+iWOqOZfd
X-Received: by 2002:a05:620a:2215:b0:775:95c0:af5b with SMTP id m21-20020a05620a221500b0077595c0af5bmr21582343qkh.73.1697183873208;
        Fri, 13 Oct 2023 00:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183873; cv=none;
        d=google.com; s=arc-20160816;
        b=nR2B3BzLz8hY85texf58OC/QZxF9pQrvmfafxWmh9mQE3jkBcQJaPDgTLwCkcnHLno
         /sRWQELsq3t1S0XlU0k5wKBPIG+t2UWUOuFJ5WwspT5EOhLmN/dWP8xwXWaJbOtLp9Zq
         CgCWKEYsuNQt7s97/boEUKkHvtrVrkKCqC9hfTzLDLbGSD5IE7gX0Fx09YfL+0Rj3ghB
         0oW8UYY5VEiqcA6aqu0jRitvrzAzIdptXdwDhSgunOEYI/5ktSJ4tmCAtTErHqEeNABz
         gAZFzf3Sf+56OJmL7wLqmOKXPjE2Oq5mEjdrmlFuaf1lCE1z3z52rcdY2OELfW+Bwfzc
         doRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZujHeHq70xM9MPj8kQG27kLbICCwKFbj8+Ro2luQ6VY=;
        fh=kfRnWevg1jmrjhuthwC6N5D7aCsTzqsHSTkyAiKxMc4=;
        b=VJNMWAYf0LBPev/yf82HFnsuUQmf4fKr4goJ0qeQGT+Rx1wryDZLinCXcT/1HZTfVM
         lg4/kFQuspE7pee8J2lpZvD0kncr62J4V6jQmog853bJ9dGINl/Xn1DaW54tRAAP7UAZ
         EZMBUqYhiAonBx2sncIjxWx9xdPQPMCPKFkcQWp8EUh0T8kJ7UGXPUf6HpbaYC4okdgB
         T4b/FjjFW1zALkQmHSTxuAtS7r7lf5H+YGnWIVLmSjAG5AqM3TFE6NWjb0K5QcGNda8X
         6fQqvRYzihkoQ25a9gNwveOPiyYgo396uKRMrEFeBxeU2WlDoVkBEjzkonwWEhrpGyfH
         /jLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mDxEdh4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05620a24cb00b0076ca9dc9770si839658qkn.661.2023.10.13.00.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mDxEdh4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCyW-0003tZ-Hs; Fri, 13 Oct 2023 03:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxh-0000DR-Ez
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:57 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxR-0005Bb-LC
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:57 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so2640667a12.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183500; x=1697788300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZujHeHq70xM9MPj8kQG27kLbICCwKFbj8+Ro2luQ6VY=;
 b=mDxEdh4dfYE7uqecmq5SCTkEPwgklVuH9i5yVqnK9g5+jhkaxh2Sp4CbekUhbQj2ZN
 sK6zQCsZRVbfLH6Ukwu0AkkVyoa5DPs2I4flMi0gPOgLzyH+2Sow1BXBkXoatbxQGEz3
 KABrqpCLxPhFgFCh1YTEDgpETUQMCCxAzGgtLVRk619fSP7X+bsXPgsVetC6O5VL/ND5
 5PKX6xwxrGHgBpzRJfbbCm2EEdFWg/9nJzg6BHj5dhJyTUqT8ideCcvCKq9eJ8I9d36d
 m2hGn+uIJzseqRXmMruJFCNolXyL2Wut9lKmljXNTDtB0PlDjcc/1DNxo1Kvo8T0pY9o
 ePSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183500; x=1697788300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZujHeHq70xM9MPj8kQG27kLbICCwKFbj8+Ro2luQ6VY=;
 b=UZ0kBcRi0ma56PU9yiHsLXcCav5g1q9S7WIxEYjl25v4YRG93ozZX/uzphc5KtrgmL
 GmNcCHXjrLTnKMAILBR4Gc3Nxw0HCL4cwo0gDSgNtM55YHKO3WUP48AVJmOmK3YnATWn
 hCSJmCfsDldBnrvs7bjNZGfogs/LTb9kebdieLvAiLkhC2kl5DNbV4GxTOeU756cdUQN
 RilVOLpRJjXBYpNz4EWOioP33YXhZ/qm6j76RIhhE+jeM1xAapCGW7EkIeZhU5EDwt7v
 dwxrIuROi1FwFRBdFhI11GWeIvf5eyJ8qOpbbXTp6ZR7d/8aMxrjcKmRURY7hYk4H4lU
 lcqw==
X-Gm-Message-State: AOJu0YyS1HJi+0JokEODXNoJms14yLqor9MR+SCkEgqDd6Uyxo4Pzr5P
 6U0LPTDgUmrOGIycw9qelajjhA==
X-Received: by 2002:a17:906:9c1:b0:9ae:5aa4:9fa with SMTP id
 r1-20020a17090609c100b009ae5aa409famr23419439eje.42.1697183500151; 
 Fri, 13 Oct 2023 00:51:40 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:39 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [RFC PATCH 48/78] contrib/vhost-user-scsi: add fallthrough
 pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:03 +0300
Message-Id: <f5ba45aeb80d3f41af2a5e2c87e8b212a7435670.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rrhHD2KNL5if

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 9ef61cf5a7..71076f579b 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -109,14 +109,15 @@ static struct scsi_task *scsi_task_new(int cdb_len, uint8_t *cdb, int dir,
 static int get_cdb_len(uint8_t *cdb)
 {
     assert(cdb);
 
     switch (cdb[0] >> 5) {
     case 0: return 6;
-    case 1: /* fall through */
+    case 1:
+            fallthrough;
     case 2: return 10;
     case 4: return 16;
     case 5: return 12;
     }
     g_warning("Unable to determine cdb len (0x%02hhX)", (uint8_t)(cdb[0] >> 5));
     return -1;
 }
-- 
2.39.2

