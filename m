Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp468314lfy;
        Tue, 28 Jul 2020 03:40:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtWEP752B17uqfdrVw6IZWsTif0TyNikMbaaVxXFbbYJ/SOXMa2s0nZ6O6zHfRQCcbhuzU
X-Received: by 2002:a25:9012:: with SMTP id s18mr43231826ybl.86.1595932836182;
        Tue, 28 Jul 2020 03:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595932836; cv=none;
        d=google.com; s=arc-20160816;
        b=JWl13PAiieVL9ObqTJ9vGvKajvW56JGBVH1++2DIEavyfjuYzfTRq8WHnVVMyDG4p6
         nedz6iNaF/WeYR22jYmxv666YUWNpkZhTs0z1Quu27lSjaD+PqShMSkSKxcCACzW7yPP
         +UynLlIRCeNt3Crj+QFFQdLGY44EwzJqe8VAKNzLzrQEKcjC9vHjn1YqEkaKuyGKf0Fx
         jOfakTFvY/uHELjf08jp/pAnAPA43TbBLtLy61kfRhvWQ59LyncnWHmwR7Wa+rCDbT+K
         zd3OHbra2Fc8zRx81wYILZkTlmJT3BvxrSYCL1VfUx9s9Ns0FVrpTMVBfwk+Zx5+nZI+
         Vouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/bGogmBOowbkONqYneJGFJtVLrSbRoaKe0N7wLYTf/0=;
        b=fBBBmsHV/qqfrtOnU+BQEWn3hEXqe8bos3BlBoZfUk4i9A7U1IpkzdJyLv2ILgeCYe
         HfXBd4QtzUPDfAYHtTFh+hR7i8V5kVjk+xEaolJ4OhhGx+3qCJBLeuRg+EqgVo0ys4Xx
         UPC4i4nqVqXmADFlJGCVlbs/5urwTndDAZ2N16WigODKzOhEuGOyJyNKlGHv2ogRH1oQ
         vsJ1WX8rVBC9VvIXRcKRZNNYasCQ54/TfAnCaxGq4Vbh/jNykNX8qM5NfQxqTs8sBlK4
         OEzPF3i09Y9iPAdNS4w6SOzv52Yn4V5qbxf/WxbaQoMbwI7tkv2ETrbXNRR69NapRGL0
         KwMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OlJ6NVki;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si13590766ybc.125.2020.07.28.03.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 03:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OlJ6NVki;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0N2B-0000l0-It
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 06:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MzY-0004id-7S
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 06:37:52 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MzV-0002lZ-Jk
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 06:37:51 -0400
Received: by mail-wm1-x342.google.com with SMTP id 3so10748803wmi.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/bGogmBOowbkONqYneJGFJtVLrSbRoaKe0N7wLYTf/0=;
 b=OlJ6NVkiQSwExgifMKmYk67neBN1l31lN+qVJvlg4x8Vr7AUViAKA6o+p6NOn/B9/m
 MyWzGbFrFmekS3KGM+4MjNlZCnzAMW7BA8aYss9QCIwsGtSHPcqYdK+gqLWkBPowvjm+
 loBV/Q7oNxXmN4kGc2jUj4Ay4H09XUh0QceHmyZucwaXy8G3IKReqFXCLv0mrvWJubl+
 m4KAnnaUJPBbKHVfI2R6ZfNZaFxx0i1LeKAIeYCP+kwLFAKBWNiWC6vn2VOFXZMoKISM
 Sq7JceRC5Yec5VoZhuJMheoR42W6TKm9b2C37R6K8MiyHwsQTGYXoWSfMxiSIUGYFHuU
 EeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bGogmBOowbkONqYneJGFJtVLrSbRoaKe0N7wLYTf/0=;
 b=hifmL7FytJlHPvC3NPqLxRdRKZgl6yEAafiPHxH3MrHpuqaiMgI4W/VBvE39EgCVDB
 sEPEsXr6b16pPmTp0DFbvI4Qg80xOlVfQ5bidtScOGRnEbMCQ2cwGKvefJV2TVgE3keN
 oBdByuOeTdjQ6GdPdq9nbCkmB0zQ8+6dRrSsZhDfhCQ2Y7VsRVOWrKNz4SFtjm9iP1V6
 sH9k7hiHoek/DvEJOYS/EyIY8dau1zz9IWX8XMMgBpPAzzN1zXsK5RbwuwfXH7/1erv3
 JT5Om7lC0PugVI4sHqTADHuum/sXHVwZgIuODswHBTcE+IO4pc8jr3Xayu53s/1gm+Ns
 9hMA==
X-Gm-Message-State: AOAM531z2t89SkdpHfXpKmiVtQu4iWJbdik7KzAwuEO1WndEhwIX4p0Y
 36fzZ52WJx+jF6jz1Q8JBqYjfSo1pkyAxA==
X-Received: by 2002:a05:600c:21cd:: with SMTP id
 x13mr461600wmj.155.1595932667939; 
 Tue, 28 Jul 2020 03:37:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w16sm18634657wrg.95.2020.07.28.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:37:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1? 1/3] include/hw/irq.h: New function
 qemu_irq_is_connected()
Date: Tue, 28 Jul 2020 11:37:42 +0100
Message-Id: <20200728103744.6909-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200728103744.6909-1-peter.maydell@linaro.org>
References: <20200728103744.6909-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ColG/8UH8jE9

Mostly devices don't need to care whether one of their output
qemu_irq lines is connected, because functions like qemu_set_irq()
silently do nothing if there is nothing on the other end.  However
sometimes a device might want to implement default behaviour for the
case where the machine hasn't wired the line up to anywhere.

Provide a function qemu_irq_is_connected() that devices can use for
this purpose.  (The test is trivial but encapsulating it in a
function makes it easier to see where we're doing it in case we need
to change the implementation later.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/irq.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/hw/irq.h b/include/hw/irq.h
index 24ba0ece116..dc7abf199e3 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -55,4 +55,22 @@ qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
    on an existing vector of qemu_irq.  */
 void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n);
 
+/**
+ * qemu_irq_is_connected: Return true if IRQ line is wired up
+ *
+ * If a qemu_irq has a device on the other (receiving) end of it,
+ * return true; otherwise return false.
+ *
+ * Usually device models don't need to care whether the machine model
+ * has wired up their outbound qemu_irq lines, because functions like
+ * qemu_set_irq() silently do nothing if there is nothing on the other
+ * end of the line. However occasionally a device model will want to
+ * provide default behaviour if its output is left floating, and
+ * it can use this function to identify when that is the case.
+ */
+static inline bool qemu_irq_is_connected(qemu_irq irq)
+{
+    return irq != NULL;
+}
+
 #endif
-- 
2.20.1

