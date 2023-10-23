Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1544887ejb;
        Mon, 23 Oct 2023 11:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHObX+0Qwyzz71okF4NmaNi/1yuq1xkZpYKWN2/L1hNa59ILgvGP7mOkWyTxYpOov4HK6mN
X-Received: by 2002:a05:6214:2249:b0:66d:1b3c:ad6 with SMTP id c9-20020a056214224900b0066d1b3c0ad6mr15913198qvc.38.1698084676752;
        Mon, 23 Oct 2023 11:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698084676; cv=none;
        d=google.com; s=arc-20160816;
        b=aV+IB1ySeiS7OeEkLOVbux51iKP+KaTaFVpyGJr0UapSfyaZ0b19NX6erfFEhqc5Xc
         7YM2WimHRdfG9HBTH6TERibagZDPUENPSCdBX0auF/54HRQOlcw7PyaXTAkEcl5SAobF
         rcJNilsaelJTDO8AY+ElPFf4iLMGHKTaD0plA2J8qjEgi1Q1yMXDecN1bGqX7kz4z+Yj
         b1Ddwdwt4/GSXJufAvnyf+XJ692ZZWYR7if8dkh4H2nOG5S9zWjYfW5AJn4uj3h4bdqt
         gr8IoOT/pwkZShu6FUqkORnegvTJXV77eTemwQdyvtRnroGOrsH2ZHZ6JZvNTPho7+sA
         RR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=X8ppsMvh/1xNcNQO771azU3b29zpBvKMbcZRVkj/3Zw=;
        fh=k71FLX2qHMD7V0TJawrNtsKu23zO0weMyceGJ4f0Rrw=;
        b=p+1D5olC5etPr89AHZt7cDuyiZIRUNw5dpKW7/PriXAzo2QEaSMgB342MUB7pTD6YC
         K9DrAnVZiYS9DIx6vUcrrMES7x+dxtOvxSgEgrTDks5cfVhcaMDQ+kn7Q+mmCTdMVquM
         A+r1XQZp3v1CZilr2suCcWHmRJiCUQiuwLetL/aXf3rxricnjoT1Y1nrbbhhVTZBE4lJ
         8gHwpkGBD4iDe2qVb53N9qH1ckxY53YmtyxbflL4IE3wpr5JPC/8aqiz5zSzGGue0CqE
         9WYSWGg0OZVPMOPYMFlwUUrBX7ZYfCaDJ4/Lxf16CtbMtKqK5ZktXa1bgE5kx0y3klvR
         MVHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1KbHF9DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3-20020ad451c3000000b0065b1160dbb6si5790633qvq.440.2023.10.23.11.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 11:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1KbHF9DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quzMX-0005Qs-EU; Mon, 23 Oct 2023 14:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xLY2ZQYKCD0shstrqfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--titusr.bounces.google.com>)
 id 1quzMV-0005Ps-Q0
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 14:09:11 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xLY2ZQYKCD0shstrqfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--titusr.bounces.google.com>)
 id 1quzMU-000704-7P
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 14:09:11 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a90d6ab944so39271207b3.2
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698084548; x=1698689348; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=X8ppsMvh/1xNcNQO771azU3b29zpBvKMbcZRVkj/3Zw=;
 b=1KbHF9DCw6uQoXWT41IMraAkueuAzp4C25/48q1LyzLuZn36Fd6PMmvjZwGfkt2mnq
 4oSPy0VDW5cyTZVX8B940SoQdNqrBLxDvMyhG37GUlBAAFM1BbilTzAvDfqBaA/zg0uU
 8BrjMEj2HR3iZJbOCn5PhTjIEREUpjh5b0bb6+HCX+XCixaRwad8PQYWBq6hOiTRHtJ9
 PLz/Ms6CuhvTf1ivV/x5Qb2y1DjGA5QRtvkhGWJehUIZLdn3Yf5nDFp5GZY0pU7WCS9E
 XChJFdcAGQjkltgYq6Q57H9YQRPmqxXdYm8hxkUwKVfubfvjxpgs6Xb7fGLEHOWcmlDF
 hXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698084548; x=1698689348;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X8ppsMvh/1xNcNQO771azU3b29zpBvKMbcZRVkj/3Zw=;
 b=fL0DsS+bTlTvnwyEQhpBv1y8OshVZT5bGCwCZM/kX9khXJjFIMUu9pnHq1N9Vo0+sJ
 eE9xjqOJxtaE8RF4BU517ucYHNVJgtA1UedOEcRhRTLk2HYhngqAd6aXwRAv1J963a/X
 fS03JmlZv4H7k3gCl7TkW1KAoCp8ACkmpwT0/I2yiQZ7gRlqLeP3mggxIdE5GcNIA7qK
 lDs3OZjoR/UQwu18PmSAeyoq3Dx8EJ4ICg3l1C72G1RYuwgKCZzrkwbUP1wpvAfpn9xE
 lye97I/udyGtZS93Egas+UJE4T1OktjoXih7TU+BZvi+YzwZarDIcP7ae6nVGla22OOZ
 kGUw==
X-Gm-Message-State: AOJu0Yzy9SYQgEA0Q4yfpY12sK/FC1lY17ng6nWnAlX5HtK8ZZOSP2Tt
 r7L/8sB+WHUgJw19Qj1DEJPcYC173fS/iDslX0bJTKCiHus+iZ2aVSDWSqADb0/2hxcK/tAOHuq
 qSvlZnFRdEX4aVMqTN7d9N4r9uIvNg6V+rTqj3e07U2sX99Vxp/K0PGTWKA==
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a0d:dfc3:0:b0:5a8:28e5:ca68 with SMTP id
 i186-20020a0ddfc3000000b005a828e5ca68mr224325ywe.5.1698084548530; Mon, 23 Oct
 2023 11:09:08 -0700 (PDT)
Date: Mon, 23 Oct 2023 18:08:36 +0000
In-Reply-To: <20231023180837.91785-1-titusr@google.com>
Mime-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231023180837.91785-8-titusr@google.com>
Subject: [PATCH v3 7/8] hw/i2c: pmbus: immediately clear faults on request
From: Titus Rwantare <titusr@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 philmd@linaro.org
Cc: Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3xLY2ZQYKCD0shstrqfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: y7/ayucUuPOc

The probing process of the generic pmbus driver generates
faults to determine if functions are available. These faults
were not always cleared resulting in probe failures.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 3bce39e84e..481e158380 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1244,6 +1244,11 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
     pmdev->in_buf = buf;
 
     pmdev->code = buf[0]; /* PMBus command code */
+
+    if (pmdev->code == PMBUS_CLEAR_FAULTS) {
+        pmbus_clear_faults(pmdev);
+    }
+
     if (len == 1) { /* Single length writes are command codes only */
         return 0;
     }
-- 
2.42.0.758.gaed0368e0e-goog

