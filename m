Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1158226wrp;
        Wed, 4 Sep 2019 13:21:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO5aoh0HtkzESAdYKE736Yy5sMMFW4zKSYMj7bzwFEIoMBc8AEe3WNVy/TDvI10YVtaWaO
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr16586995ejd.120.1567628501901;
        Wed, 04 Sep 2019 13:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628501; cv=none;
        d=google.com; s=arc-20160816;
        b=Lfp40jHHeDv+NiLoUNgA2zN1+xNWJBcrM95vvm0O5pD+Ms1Z8QPDWpbB1RDfuls5yV
         cKny3n1cO0SfggDfYg2nwN2FBrBv1pVtZQ6+5tD5bhaGzjgndhMUZPNAeNngg9BiR5nS
         +TsNh7vJTGjGDET3CJCxjDQvwMYiYvxPH1kLkyJOJ3cv7fDt0ivrDyfqUi78o+qBW0vM
         qu91H/h941wj66TftikvHWxBaC+uMMIXagGYXGZzLABf9mTOdO8/7O4k02W6eMQ/NM74
         9GmU/oDfBwPnk5us2JJPWDAVfuTD7/BS/mJKfj5o+C/DFyUO2KeNE1igrYruJzA3wx2s
         sH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=RL68ZjIe5eYQCwpJOU1fJcxAoSZgrEZ6K/Zv64QpDaE=;
        b=OryB+OFuy366T8NvlMtnaUpX3cwQyUinUZhzWPYqfjZopPfer1fyYj+WLdbfS7Hfo9
         dggXG7SBpDCrg9skGoMydBApx72U1naqtkNBVTAibFIbIHr8OzOvENRSjzS5iQwqQr6O
         dtqpl0SFKNV7sZjf0E81BVZBzMlm6+bH5lOqsQH5Ar+qo1HM7jO/PiLI7BGwnTloE3rI
         er7mpS24HoZCEwqQeFPnrdNcli5yzCO5jNFhMgv6okDHq8UCiOXpanAJ+bOMqxTwQRze
         kvhNcQLHp36lteeS8eTa5OEbZRQ3/e/5xfhLlVbN0UFzylHGO4bamqJNzHi/Jh8qyX5t
         IMYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lTWfIa2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f45si8980422eda.345.2019.09.04.13.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lTWfIa2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bme-0007IH-6Z
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0t-0005Ub-C0
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0r-00037x-5S
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:18 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36133)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0n-00033C-7E
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:15 -0400
Received: by mail-pl1-x641.google.com with SMTP id f19so8870plr.3
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RL68ZjIe5eYQCwpJOU1fJcxAoSZgrEZ6K/Zv64QpDaE=;
 b=lTWfIa2pWo2pbpDe4pKDm6+5ng3WPcvQoomnpn10Z5+lnjJSvGRsjZZLg7k3yIZQ8O
 uSEQeU8szEGbE2vnejP1A3nN0obosyYzhaUqazOMa4ty3TXXFBAH24Tk8NXy0BmHSqhp
 S74Ic3fKz5gXaDGfPEh94FZtDdL9oZjV2STV5YJGVcDpokqw463lUAI9WjqqeDVhe1Ii
 XNezTwdbDr98Mb+vAFSgu+QTgPvJyK0O2RSnjCC2sOC7EcQkvUnfk+9TZwKK/U0VPTzX
 trRrBujBNBtBWV0MIO4EQ7aQPrah0V6lH8yqYPqdRV0ceHDnXuPyGx0IPDkkDtocMJ8Y
 Wppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RL68ZjIe5eYQCwpJOU1fJcxAoSZgrEZ6K/Zv64QpDaE=;
 b=U+I/bDyVGsjhcLzu9WsWFed6btGuK3T9cAfG5KQG9QerJLrAB/LxKNT3pT4Ex7xUj5
 SWoW7sKEM6GOY+IG992G26XbMz0DIGwJSvVFifeYNt59GE/KBWraRQh6mc+DBflY/QJ3
 eg4jR8JN/tSghXG3UvZNquHF6va2zKfTtIkYclYKvAKyzwP7WdlDzaBnkYlqn3BLq0BG
 MSPKlfItGfRBylhleW/frdaWfu64Rq4P5hVFYX11Qfrr8wDBEP7AwTKXeS1VySR9cUjA
 hZh5jI3i/khkUgs/H74bmnLNYwQYpImHDywuHSanuaar7/ctVwBksVfngX5BL9TQhPqf
 pl5g==
X-Gm-Message-State: APjAAAUmqxM8o95w0edDmOy0SsDngC/u31H9GPfJz0vqdgEbFBbiFdve
 zJPQBrvOS+7nI7hLsI4SoLsvJw==
X-Received: by 2002:a17:902:6842:: with SMTP id
 f2mr43503402pln.39.1567625531017; 
 Wed, 04 Sep 2019 12:32:11 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:45 -0700
Message-Id: <20190904193059.26202-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v4 55/69] target/arm: Convert T16 adjust sp
 (immediate)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KS7u1C+Avbq8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 15 ++-------------
 target/arm/t16.decode  |  9 +++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 73c8863134..8399a2c1f6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10765,19 +10765,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         /* misc */
         op = (insn >> 8) & 0xf;
         switch (op) {
-        case 0:
-            /*
-             * 0b1011_0000_xxxx_xxxx
-             *  - ADD (SP plus immediate)
-             *  - SUB (SP minus immediate)
-             */
-            tmp = load_reg(s, 13);
-            val = (insn & 0x7f) * 4;
-            if (insn & (1 << 7))
-                val = -(int32_t)val;
-            tcg_gen_addi_i32(tmp, tmp, val);
-            store_sp_checked(s, tmp);
-            break;
+        case 0: /* add/sub (sp, immediate), in decodetree */
+            goto illegal_op;
 
         case 2: /* sign/zero extend.  */
             ARCH(6);
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 5a570484e3..b425b86795 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -156,6 +156,15 @@ ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
 CMP_xrri        0100 0101 . .... ...            @addsub_2h s=1
 MOV_rxri        0100 0110 . .... ...            @addsub_2h s=0
 
+# Adjust SP (immediate)
+
+%imm7_0x4       0:7 !function=times_4
+@addsub_sp_i    .... .... . ....... \
+                &s_rri_rot s=0 rd=13 rn=13 rot=0 imm=%imm7_0x4
+
+ADD_rri         1011 0000 0 .......             @addsub_sp_i
+SUB_rri         1011 0000 1 .......             @addsub_sp_i
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1

