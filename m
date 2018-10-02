Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5268110wrt;
        Tue, 2 Oct 2018 09:39:37 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62QYsERe//3pKuQxcuatN3FssVmAB4RbTTiuYppOzARV19Fpd64eZyo8ZBrX28U4e2ljiNN
X-Received: by 2002:ac8:2e8c:: with SMTP id h12-v6mr11751591qta.135.1538498377512;
        Tue, 02 Oct 2018 09:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498377; cv=none;
        d=google.com; s=arc-20160816;
        b=EwkqB9pQCD/yUYO6cOJHqraDYU/jD3xpa98H8A0wApS/rwOpbicQBYx9MBpXXE/sOo
         XbtSQI5lEq0VlOi7wD6y6p55TorW5MghcJaYRekbGgsSw9663CV40ENe8nqDczRYrDCa
         arCaGw/nZ6HDKT/bCpAZiMDnWTnKV9+V3QSh61i98nA5VUlMBwDX0bsTZq8dpLt44Dpc
         lLPRnhigj7om9i5OjEiuN8dmMPA/ST/9M5WogOzZMuTdL/3ytl89xn4m0bogoFDUhqyu
         L6XN7Oc2FRgVyCVIIzfgCZVd801TmybYaC7L2ebf+35/AVOB9AgXFnlbTgljZmPYnojW
         vDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iLKh8aEwd8VWwHLeOK3E+Gx19VM0Ibscz1/I9o7+Kns=;
        b=0he+mBhc5TAl6JC2iMwEmkBWT9OKoDJ/7Hn7Wys31YqcayhSj1LUY56JVcPw/nCD/c
         8yKbWxuZFkX+TN5d7kgy1JbK/rnLgJtQcGDcjcEoNV3fQegO3HuZNZZt1QCmS9dJAikJ
         izF1CeY+Y1qD8UCEmewH5PTYEaX5CmJuDSGT72Z0g0X/SUb1cjeq1cnT0dwmUaWSXjVp
         L6wPaNeraZbkoGk/XGMsHxlonK1DeXl+FSebGg4ZJaCuNGcz06DmcDbJtGNtKAHS/XmV
         ySjaKO7PRgVB11HFlgkbuO8l84QlF5K1F3jqslVMqCNMGvozEyE5P0XSnGm4OuoxvaBH
         IxBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2-v6si867992qkd.14.2018.10.02.09.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Nhw-0001M8-Vs
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:39:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nef-0006hs-0P
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nee-00058D-4u
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 12:36:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Ned-00057W-T0; Tue, 02 Oct 2018 12:36:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7Nec-0007JB-Vn; Tue, 02 Oct 2018 17:36:10 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:54 +0100
Message-Id: <20181002163556.10279-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 11/13] target/arm: Add v8M stack checks for Thumb
 push/pop
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zY6qIFhziuxO

Add v8M stack checks for the 16-bit Thumb push/pop
encodings: STMDB, STMFD, LDM, LDMIA, LDMFD.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 65df8d6975c..ef64d2559de 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12251,7 +12251,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
             break;
         case 4: case 5: case 0xc: case 0xd:
-            /* push/pop */
+            /*
+             * 0b1011_x10x_xxxx_xxxx
+             *  - push/pop
+             */
             addr = load_reg(s, 13);
             if (insn & (1 << 8))
                 offset = 4;
@@ -12264,6 +12267,17 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             if ((insn & (1 << 11)) == 0) {
                 tcg_gen_addi_i32(addr, addr, -offset);
             }
+
+            if (s->v8m_stackcheck) {
+                /*
+                 * Here 'addr' is the lower of "old SP" and "new SP";
+                 * if this is a pop that starts below the limit and ends
+                 * above it, it is UNKNOWN whether the limit check triggers;
+                 * we choose to trigger.
+                 */
+                gen_helper_v8m_stackcheck(cpu_env, addr);
+            }
+
             for (i = 0; i < 8; i++) {
                 if (insn & (1 << i)) {
                     if (insn & (1 << 11)) {
-- 
2.19.0

