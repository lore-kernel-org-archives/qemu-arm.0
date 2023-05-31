Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229469ejb;
        Wed, 31 May 2023 13:36:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vSR8Ftr4yd+OcUXuK9t2IZ0yPMwc+WtrkRjsptrnxLEda+2VAg+hU2CCrCChWiyeP3EhD
X-Received: by 2002:a05:620a:2786:b0:75b:23a0:d9e1 with SMTP id g6-20020a05620a278600b0075b23a0d9e1mr7373857qkp.55.1685565410952;
        Wed, 31 May 2023 13:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565410; cv=none;
        d=google.com; s=arc-20160816;
        b=KdnETI4KUGuaTd4S1hBMuF7vdyJeXQ93ZkiYeqw9uHYiju78nhdTCV3/FyZL0D4yNv
         XTuSUpFHr645uw0c5UG3fC5mcoWU3UMnVp045SiB2K1v0SZzrQcQFZ7zdHrMYOlRAuzb
         0Yd8EmqFRkbnby/xBhC4virHoPlpg5b2l/hfjUQuDJZ62Rh7FvFrYuzH+XzpZbRllCba
         pmuGObi/+437HIBMtaKEqvxOc7cJI1zWgXD76/jHo64dXrrCmkEn8gRD1hGrOYF7WHpI
         DMZ/zgvdS368NVGPMx4tRdK/6eumpShIGVNdE6BMr4+/iohzDPmfi2ATLq2GT3wP0DtC
         w4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bxI8oOMi+OTgw+TcZSVgrTxV90PbWEXNzhwY3LKFlJ0=;
        b=D2N65eY8dAOwL6/5sfDRu/iFZNhLa5wlXprYLvMvMqtL/vGBxjy60+qa777lqBtikY
         8gbWNb3mXifWyhMr0AVGQwoJ4bw/K3As92NfS/90iM0k54/T503env/rwgR+DAYBuhNm
         vGDUb+7BeSioNRDNKQzTtUiEXKkXWT4uHoZL3u2o+TFsEDh4+yWCLjyf6QOpIWu9FVqF
         EMZrmSPUHryxMw0FDpNO+qxnTNtzawXL9iyQT55O2ibdIW3R89ygcwOh1kd0OKqd2Wni
         m5IAFGYORf9VBJlEPvpTEzT51jJBVyyk1wwsN/gR3fZaTCghZJNTTunhmV/NrMBbioN4
         sDEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w14v5IeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv8-20020a056214262800b0062384949943si8554971qvb.376.2023.05.31.13.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w14v5IeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SYn-0007rj-Pz; Wed, 31 May 2023 16:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYn-0007rD-6T
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYl-0003Kg-JS
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-30ae61354fbso48125f8f.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565402; x=1688157402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bxI8oOMi+OTgw+TcZSVgrTxV90PbWEXNzhwY3LKFlJ0=;
 b=w14v5IeB4aFlnV+gVzbxiX9fKxJQ8doL0ZdQ8mTnyHdU2JtCi2MnUX4uQOYYvBL0jJ
 IT9n3wjpilxQHV4kEyy9+sP2PS+3P8QDqXKY3grBXysI11EWUs8LPWtwQYNTwtsB+jib
 ABzt8+prwsgGpHEdyAp357eecu7Ft8HiWX28vKmku0fBwADJFbu/Oatf1k11pEed5Fvf
 gwb/MG0xxb8dfSrqKeYECcQ7A73VBsiYTS+9SHzBlxt/7C7YAX9LAAo4Li4/xJewcoWj
 xRfBwh4gzCBB7vgx6Jj0a8dNLovuhZ1umr2cK57dqp/jJYgj4kDWJsdWCPIQn5V3UcOl
 hqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565402; x=1688157402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bxI8oOMi+OTgw+TcZSVgrTxV90PbWEXNzhwY3LKFlJ0=;
 b=H/+ke/621+M7A7cyu7jRIMDIfI3UI1UYrU269s2/X0WeykxSNVnz267f4LXgdWIKpY
 E2sRfjJmPXboE91/AO4GWDpwaZHapMw1gr/dXtrCWukv0IsuDDsuK62waS8+vZOERXnR
 aGMC5QrYtmrPz3UyhgD233S1fbzUiHofh59s+6R4YaknY/ul0OQnfjZQlkwTz4DDUyVm
 79pNmueltlqOXco87ay89GXRFDSF9lV5TsQMdyHj9DVIZy7EMdZgSv4IW1MzVzKBzE8E
 sjMZ6rlBYUPs5PyK/eetBLA6vFf1GDhwdPp9BXoYgQZVE3zeWMYIzDI1VNsD4u7a49rV
 mjmA==
X-Gm-Message-State: AC+VfDz2feKthL39q2QA67hF1ZnnV89FJC65yyiFlpPqMSbsgVUdcg/s
 6lB2mV81OsZ8x24UXC3aVA3aMTz/M8H8eB7jcUY=
X-Received: by 2002:a5d:65d2:0:b0:30a:bf2b:e03c with SMTP id
 e18-20020a5d65d2000000b0030abf2be03cmr162255wrw.23.1685565402265; 
 Wed, 31 May 2023 13:36:42 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003f42d8dd7d1sm25676262wml.7.2023.05.31.13.36.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/15] hw/timer/arm_timer: Extract arm_timer_reset()
Date: Wed, 31 May 2023 22:35:51 +0200
Message-Id: <20230531203559.29140-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: lE7yatuq1kCi

Extract arm_timer_reset() before converting this model to QOM/QDev
in few commits. This will become our DeviceReset handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 2cd8c99b4e..54318d0a57 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -172,13 +172,18 @@ static const VMStateDescription vmstate_arm_timer = {
     }
 };
 
+static void arm_timer_reset(ArmTimerState *s)
+{
+    s->control = TIMER_CTRL_IE;
+}
+
 static ArmTimerState *arm_timer_init(uint32_t freq)
 {
     ArmTimerState *s;
 
     s = g_new0(ArmTimerState, 1);
     s->freq = freq;
-    s->control = TIMER_CTRL_IE;
+    arm_timer_reset(s);
 
     s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
-- 
2.38.1

