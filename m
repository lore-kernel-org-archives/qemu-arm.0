Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp350763lft;
        Fri, 24 Jun 2022 07:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tiJH0GKtW9ihKXwFsg/zrt4c59ncswAFXhyICFsegpb3NbAaZGYqmzOXMv24zrZQP3OWw+
X-Received: by 2002:ac8:5a05:0:b0:305:1fb4:f55c with SMTP id n5-20020ac85a05000000b003051fb4f55cmr13189017qta.388.1656079783548;
        Fri, 24 Jun 2022 07:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079783; cv=none;
        d=google.com; s=arc-20160816;
        b=IGmmAxFolWL5GvfRUDNtvUCxXWeZBMH9ndadImy6K9I7uJz4aMaiO7KXLZp16EHgU1
         G4K6hINEBTv++p0Cm0iifkPswreVfE8VJCGuZibCb+298GdtoFpN4FxhqCxAF4f/bI10
         IOwi9Bt/Y3srFdH9hJCg9J+WQ9TwqQnEkAn5YBqSUFnsA6bmDfySdqq8dUESDWhjnA1l
         lxKNvtbysCKqJmX2G2Cq27lkofkxpjGwcKU30SmeiuxzDPkVQvXy7IdPL56PIDV+3VGe
         SLtvKpn3qVOMh5/34lfIlLJeOBpGyvYNlYdy4o1FIx03nywcQCiu22pH4GOqwb6TUUP3
         IOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LwyoZBVsYzQeSm/McZkS4IHxvxDWIUKEHGFPER2PilQ=;
        b=1Emt85im8ul2DcWOafefYx98zMQAhm059XXNoSjoS8SWqvTjr1UxLZOGeKIkb1kGj/
         d6dwzw8UitKHYiSHGLxFDWTf913IjHT9mrk2JemgsSfNNataVfnX/d98KapbBxAVreQb
         xA64KE/Q8E+sPMWhsQ35Qnx2AMDWDzcqNlKUlKejg3TjFLlPbofS360On3maN9uBW4Su
         GFfwh+8bwFZxK4shh72fiewhkOjIvBCqmzty1L4EjXtaNecAPTdEdvkTOARZFdAZ/2Kq
         JxKEtf0oC76yeSuvqYvv6Q96TuzOKBleOmSDfZUk8Z5Wtk7e2aJciXzJs6VbK02d1TqL
         j+xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=xtMo8w2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020ac86103000000b00306c6e7b241si1928248qtm.667.2022.06.24.07.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:09:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=xtMo8w2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k0F-0004hh-2S
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb2-0002n2-59; Fri, 24 Jun 2022 09:43:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb0-0005JB-ML; Fri, 24 Jun 2022 09:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LwyoZBVsYzQeSm/McZkS4IHxvxDWIUKEHGFPER2PilQ=; b=xtMo8w2jwlXOONGWBiJ99pElPM
 n66+2ZRFb/XXZuYLeGVCwZ7s8lJJh5kTWjPWER5sGHQ+3KtLJGT+jXCGiw4nAg3F0EI3V2lFt855F
 d+hmVjOYj1s5tO3maXFU+hvY79J0F76v2Q5dIEiRlM8SrWpJydVAmPsY8qA4/BNzZ08uo9qtR6NUS
 8gqu3RSvMx505eFIlwSAXz40O+e1My6abDUVKljAWNl4hV/qvqgj6XRYo6HvDZXOdvy/oTmDzYPj0
 fPF3ytAKOS7MNKxtKVZhkclfkEqGFW8r+a+8LH6VZMPMCgcRlf6+Zo4/TO7jjEVPzpjI5Ag1A3RLw
 gpLHQ0yyjyaixijGKDZS/rK+GJcl04ZBo5bOIjkUBzrmjfU3VKRMlNPrCWw9o1S79/4XxAqqzrbAK
 USq08tKiHSwlARuHcbLAyQu+Prz+zWsu7cqhv4zgiqgwlzAv0aMuQQBXoFiXYrwvQ04MeaEHrLs/H
 UqwaJQ8/zPxQigYDbjL0TL3E1j76bcwYkvTM/OpUc/6c42IjPXwIVjbsqkyQuPitnsfFOca3VbCxQ
 t/d0hr1mDXh6JtVretAagrtURVtvzeJJCUleUIW8kfR8bHKtX44rNJVFLbYcNt+d5685dxvROQDFs
 smrtrh4zCoF6XYQ841rKepyVYTHiRnj4jKmjLs94g=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZM-00037t-VI; Fri, 24 Jun 2022 14:42:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:46 +0100
Message-Id: <20220624134109.881989-32-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 31/54] ps2: make ps2_raise_irq() function static
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lVLn2S5IMQnc

This function is no longer used outside of ps2.c and so can be declared static.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/ps2.c         | 2 +-
 include/hw/input/ps2.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 9c046ac500..24c9853d37 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -172,7 +172,7 @@ void ps2_queue_noirq(PS2State *s, int b)
     q->count++;
 }
 
-void ps2_raise_irq(PS2State *s)
+static void ps2_raise_irq(PS2State *s)
 {
     s->update_irq(s->update_arg, 1);
 }
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 4be27de316..410ec66baf 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -102,7 +102,6 @@ void ps2_write_mouse(PS2MouseState *s, int val);
 void ps2_write_keyboard(PS2KbdState *s, int val);
 uint32_t ps2_read_data(PS2State *s);
 void ps2_queue_noirq(PS2State *s, int b);
-void ps2_raise_irq(PS2State *s);
 void ps2_queue(PS2State *s, int b);
 void ps2_queue_2(PS2State *s, int b1, int b2);
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3);
-- 
2.30.2

