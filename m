Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp803023ejb;
        Thu, 19 Oct 2023 14:25:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDdbqY7VvAunjI0LzZrgyKdE0KAM7tLOiBLXKDj1K1SqGi8Ql6iKjKxES1cmWATm3Qz0vG
X-Received: by 2002:ad4:5e87:0:b0:66d:11fd:c9c2 with SMTP id jl7-20020ad45e87000000b0066d11fdc9c2mr176660qvb.17.1697750746579;
        Thu, 19 Oct 2023 14:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750746; cv=none;
        d=google.com; s=arc-20160816;
        b=TuGMjKsjLZweoaykVVWN6jtSsdPPO3vMU0k2iFiv/tCYalizFN9b/5VUE/CcjEkwkn
         XXOmUMyUZRicHWvvOI+VCwmoPyT5iZlX4R/YYZIwFG/EIua3u7MWnDXFWgUCqZEJy4zd
         SLSWIpofDkz0QRPJfFnIPE+HC9XdqZ/Rt7YbhuhARSpPbyWjsQJOpp7+EsFXglUqAvZC
         d2mB2p7CqOoav4Zo1z7zWrcDvlPJZFes1sNTar4Agk0rfMyYikg107WO1K0Z7+X7ZGbV
         knU02PFUU0kD0mYhc95yPYRC+rT38BLCRG3kdoy8m6MzbXZLxNI0C3sW8Vk/Is2KtUcW
         o5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Si0DsDiy36BQtzeYXOqgI06tIdtT+TQj4MXOqeI0hyk=;
        fh=wZYal/ivpRKvF/E6SivtRtSL0RGJ4WoI12dNkYUDco4=;
        b=sIr0dPZfg6bHmRCscuzKIaB7fNGklquHvmRTBlSv0dKWGdfQk3UvdanShcIuv42Mng
         HFTRR52UTevTTKetYZRzDmvPayOj6UsCoqRy4vcd+K893W0BepDN8/NaInjEGeWtTuze
         UwXpYwcuI+gzCCCRRQFJOJ5WxyvFleMLEziphHTCWRNgs8OymOxuuv6++qDXiIgsAick
         R+iY3eSb3EJgUF6TI/+wFgF5hufPVigqs2aokAxLOmmly4ZcVBeDr6zssJKZTqU2/0U2
         I3jfOdQaHhvXDYy7bD+s7tfSjzG/EI+ye43LA2f7KexnneU+3+dtyCHkwcyUPExOOKGt
         rusA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kIM5z9uH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020ac87c4f000000b0041cbb79ad6dsi250052qtv.768.2023.10.19.14.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kIM5z9uH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaRl-0000lV-UE; Thu, 19 Oct 2023 17:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRk-0000cR-CR
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRZ-0005bP-2Z
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso111604f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750436; x=1698355236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Si0DsDiy36BQtzeYXOqgI06tIdtT+TQj4MXOqeI0hyk=;
 b=kIM5z9uH+FFeJPRWS4gQyanyoY0XCbVJ0EEHAsI0lT5UlTbH2faIkbM4Ld0USmnhZm
 bO47wukreg3HlPGALSgA23rkRaRNC5ggaLtzaqZBYGpBK5pizz6sx0vbmCppQtaW5DhY
 0VkTfBrPSciTVibfJcylciRXotwYZM4NHWegoTyizUuoReN2/AKhiRcA2rIYKXKVNm0E
 lPGIehXo0X2/AuzBmhaDuA74kjK0cNYdQYPkrz3iQ4r6F5balBLAly7xG+aLlyiTMe4S
 KXJKR2f+A+ydWGxI5QPH2IE6Jlng446cGNqJ8eocVrs+K0tLFkOsjcoi3vRGFaeEmXTN
 itbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750436; x=1698355236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Si0DsDiy36BQtzeYXOqgI06tIdtT+TQj4MXOqeI0hyk=;
 b=X6RJwt1uTw2UW4rtRpilxVHZ5v5SeP6heavb61HX+RzhTyBFfzP/Adc0Wnp1yj9uXF
 Z7HVwjqlceeIOW1i9TJ32hQrj38zZb4JHD8d8SKojw3NvVrDF83hsy9y/amF956vlKcC
 VQwDzgoCZaDYIgfY0vSQJyWkCyMkFKWnREmEDVg1ep/1zvC8PtmgQttWkzwKJ8JDtFrt
 IFPJro929X4iEH0xe8oPAqoIEymjqr6yEm9jGq88d7sgbnS/n17pYb5Q2AafoOKV7Z0V
 vMMSpaFKULL9TiFneOEzO7zkLPZLU7+v6uVrrQSKbRwswP+5gMIfQgOi7csbCdeGC6YS
 Q95g==
X-Gm-Message-State: AOJu0YyOhLv4lMvP9Tp3YxXuQqAOaz7SadtYDDPY04PKcRSDKyndCCVD
 YX3Wfoa+TgWkiLnid4HZRKTxDw==
X-Received: by 2002:adf:f190:0:b0:317:50b7:2ce3 with SMTP id
 h16-20020adff190000000b0031750b72ce3mr2485494wro.51.1697750435854; 
 Thu, 19 Oct 2023 14:20:35 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a5d68d1000000b0032d687fd9d0sm228826wrw.19.2023.10.19.14.20.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 21/46] hw/s390x: Clean up global variable shadowing in
 quiesce_powerdown_req()
Date: Thu, 19 Oct 2023 23:17:46 +0200
Message-ID: <20231019211814.30576-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: gpqITu0Igsez

Fix:

  hw/s390x/sclpquiesce.c:90:22: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      QuiesceNotifier *qn = container_of(n, QuiesceNotifier, notifier);
                       ^
  hw/s390x/sclpquiesce.c:86:3: note: previous declaration is here
  } qn;
    ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20231010115048.11856-7-philmd@linaro.org>
---
 hw/s390x/sclpquiesce.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/sclpquiesce.c b/hw/s390x/sclpquiesce.c
index ce07b16884..a641089929 100644
--- a/hw/s390x/sclpquiesce.c
+++ b/hw/s390x/sclpquiesce.c
@@ -78,12 +78,10 @@ static const VMStateDescription vmstate_sclpquiesce = {
      }
 };
 
-typedef struct QuiesceNotifier QuiesceNotifier;
-
-static struct QuiesceNotifier {
+typedef struct QuiesceNotifier {
     Notifier notifier;
     SCLPEvent *event;
-} qn;
+} QuiesceNotifier;
 
 static void quiesce_powerdown_req(Notifier *n, void *opaque)
 {
@@ -97,6 +95,8 @@ static void quiesce_powerdown_req(Notifier *n, void *opaque)
 
 static int quiesce_init(SCLPEvent *event)
 {
+    static QuiesceNotifier qn;
+
     qn.notifier.notify = quiesce_powerdown_req;
     qn.event = event;
 
-- 
2.41.0

