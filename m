Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2867510njb;
        Mon, 9 Dec 2024 12:37:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbESlbgBecH30jpPIqAAbBsjTQUTEiVP51bPnwaOC4By2oucpiJo9vy6VtjDj5DdZK/TU70xUXhU2FtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFHcOTX8mV2fCO5kv0KCrFJL51T0yxUInymb8dLpJEU8odRuKeru19oGxwzBKwrkXboLwFB
X-Received: by 2002:a05:620a:3187:b0:7b6:6ffc:e96f with SMTP id af79cd13be357-7b6bcac222fmr2270879285a.13.1733776656767;
        Mon, 09 Dec 2024 12:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776656; cv=none;
        d=google.com; s=arc-20240605;
        b=g88BViax70+u4GAxF7iwcZwCOCcfGpPCESEN6TQFvpEBaGytbBtrkqzLOnkN/rPhj4
         cY0tXawwyMB8NOmL3A+/Y79qHoOHWP0uh5DxMDnssoVtpKHx1fnwn838xAA23p9dQmZi
         VUiGRWdHwg0W5gRjxeDy73k1JdVnn9MzFDM4VqeWPQvzwRfYTQkMlqpgpG9KUVm8B+qn
         BV5rbIXgr9JGb8xLnnoqHJizDxlx6igxy8LVZAhGDYn0o73zHbzAnEx/tM9Ar/EckfD/
         N0J0pOkDugEtLVZZsfmPhFu7AWkmSulKGgj3xnod3jRlQTaGZ+KSNda1myapKTquEYm3
         5RuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=krA8fyL06OMuWhugQwkTM4Lyyjdxb/hlEgT8wYfNtek=;
        fh=6X5+Az5rLKEaWB8AZ2YIcyRA3A3w5RoyntCVlkoUdfE=;
        b=T8yIBHsD121tNQ/7B79YbFO5RqI/JvuK4MxzfKKHWxhEAaVfvO2n7wqZg7PC9RKFoJ
         SLSrdIA5dgtL1qLiqhRStyMro9LqQbtqTK7i4/CbRBDN5B7o5Qq/3qQ0xrSFyNKZ4suy
         wUGuyqXpOCMljCtNcgGud/18VCSCXQ9OMdK58pYvTBspoyRPgDIQFF3ydf2PV5jFWiL/
         eqAHp0DUF9E7kXWD1fkjBWAH8hIkIkwwI+Gx3qEHhsjEhjOWtk3giqwxnvujD8DHUx6N
         dnNt5cxk+ij8tFOUHZ0LzwAL0vZQLjBczop4ynJS4WMYQq9yMZTwj5nZGQTVKDCpg3dY
         cwsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DkUsGM+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d33a913bsi458172385a.118.2024.12.09.12.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DkUsGM+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKkVS-0006Ny-KH; Mon, 09 Dec 2024 15:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkVB-0006Gk-Dm
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:09 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV9-0003F5-VJ
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:09 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa67af4dc60so282399466b.2
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776627; x=1734381427;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krA8fyL06OMuWhugQwkTM4Lyyjdxb/hlEgT8wYfNtek=;
 b=DkUsGM+KIIwkBxED9MqBqpJHwgDBcD6lkysQ8SbbbwolQElrnW3/7Zzyhz+CfULahK
 n3RHaFywC/Cl+OAlKteWSRlmkiQaXWa7rxOVJ2YqNAPVQVXhZYayBNa64QnaKWx6EKMC
 /qHShBzTzcBmpICw1sm3RU2iP+0aDyMFouSEacD+Bl3a2Ra5HPXrjtsn5ilXfPr4cT8Y
 Jz9hvjZNXKb9DhSxKnCr3pHsQIdIB5EyrJiGDVEdHcGxVPoKjXqzF6OXz1H1Bl/34ODG
 HHk4cGidKyf/lv6K6IUXe1C1wOnPDjm5RmBNU2DBsECZW2FbsH1COgWQgGLoE0VlSw65
 6r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776627; x=1734381427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krA8fyL06OMuWhugQwkTM4Lyyjdxb/hlEgT8wYfNtek=;
 b=f/TjbwExRkvy5W2RxkH3V8eBol0WVS1ANBr6nPiV6ZzjQRds6/dSowbbRMs6KT4HMJ
 Jvt47UvtNAxLr6/CZIbQeW2zlswprkML8WDpI1XUKdDC1sit4OAxDikcPcALOybjJtbF
 whywk6Q3Uzv5/8XfHKOYg3uwJEDQ785TMzV8x470Q+Q9yxCaUnB5VMRZBP0gaLkBHjlg
 fEpuMUkbbn+IFYvGgT1/zWDYLx/6kmSR+sHNXq/kE4zOkJjv9//FQyGrJWScGTmO6Rsk
 /YNgqBm+KrlHhCn+HtJuY22eQ5Upqi5LzmzDTZI1U05J4EB+7CZaeAJW2jPPmDY0tiYs
 EC3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsAb9TPp1tJIYYsbH6rPB9D4N/vSLqzFNNu3gRWJ0lWpRaj09e5ddh5GSkqcIctAeG77Q1qDLq2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwUgbGJ1sUWDJLJpzo3Ki/tNbcTsZpcO/KVise+Lu/xkHg+jU70
 3VRunaFn6h4S54CXcS+AvOX4hJKlkJBSlYescXfZ3Z8MeMMJ9ff0enZyq8Y0ZQ==
X-Gm-Gg: ASbGnct0hOMnbar9GTHSWOopMmOO2bHRinLB2p55iC1ILO8tL3JaBUf+e9qZCk6GQD3
 iAaAn6yvO6Z+9p578841mXzojUDmwiSoqii1ueSwCgG/VCilPEKZQdBSLpeHqBO2jwohPEsOpa8
 dLALRg952gqK2IummumziaWzmLMQYVTTWBdEWWMwepSFpmLKkrpBE5pYiKIq4t7jZZMdQCJhVvt
 7R2DbO2+xa5mF1WF3dPb88sA1YHbDawiecp+xbjC8tTbLTxXB8qAKbhboBE8gQDS7aPrE/Y+T/f
 LNQqJfFXsXgBXO6NSOzEXWTcBfM1CA==
X-Received: by 2002:a17:907:9554:b0:aa6:7d82:5414 with SMTP id
 a640c23a62f3a-aa67d825937mr591543966b.30.1733776626628; 
 Mon, 09 Dec 2024 12:37:06 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:37:05 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 08/11] i386/hvf: Variable type fixup in decoder
Date: Mon,  9 Dec 2024 21:36:26 +0100
Message-Id: <20241209203629.74436-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241209203629.74436-1-phil@philjordan.eu>
References: <20241209203629.74436-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::635;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: kfPRnq3AoXm0

From: Phil Dennis-Jordan <phil@philjordan.eu>

decode_bytes reads 1, 2, 4, or 8 bytes at a time. The destination
variable should therefore be a uint64_t, not a target_ulong.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 target/i386/hvf/x86_decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 79dfc30408..6c7cfc820f 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -61,8 +61,8 @@ uint64_t sign(uint64_t val, int size)
 static inline uint64_t decode_bytes(CPUX86State *env, struct x86_decode *decode,
                                     int size)
 {
-    target_ulong val = 0;
-    
+    uint64_t val = 0;
+
     switch (size) {
     case 1:
     case 2:
-- 
2.39.3 (Apple Git-146)

