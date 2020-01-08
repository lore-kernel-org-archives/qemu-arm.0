Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp927120lff;
        Wed, 8 Jan 2020 08:08:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxU4URCoRGvAEVfct4wyZFMLuiYu7Fsral6JCfSgfPg0ugqV5sPPbLtmHA3Aty0siwjwcym
X-Received: by 2002:ac8:53cb:: with SMTP id c11mr4119846qtq.14.1578499687433;
        Wed, 08 Jan 2020 08:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578499687; cv=none;
        d=google.com; s=arc-20160816;
        b=E0stNU9ztXe//tT7ndYR8LjH/Gerev1Up5d76j4yKRnQnxWV1y1ZN4v+fwGLexf1Cx
         mFqwd1SB2mf1TTPEeVc+pErNeojsS9iZq8wxGV40u7R7LUod1HoMM0mWPTdUemLtFku2
         jXJWLPyghBFOAckIb5nWr5nSWkHkER0NHi+26FDb3KJi9rJWwgwlYv3dDjk5j8JMBepX
         WRqOQUQkiiOH0Jr66S+8vOsqZIiMDSIy53UBAU5TAcUwmDDm66z7jT8hF+7DVIuPESk2
         FdCEc7IX3299vVH8TjELgnqk9pSGafVZV9Wp3Bx45z7PE8qo/AOUEE45FLbk8HaQ/0dy
         KLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8+XZdxA5J3xM/TsvgYS+li+7Iz97MabCeTEKFtPgaDw=;
        b=Wthz5bLcFS1LhGg9mgdnGjGSif9eCa3dCnHKiyjR3e8o59QC+uleJO6XEguHrWKfww
         DyOP7piw9QUTmJ1Hzce9CLLgXcMIutiRFZAoqv0QEQj8LZEr4X8oh28fhdX2Ru/AmUBP
         8QI1Wv1/c0xwmgnjgZeqgR2WphjHCRS36K6nT1H9PADqavS1wNsUd98fqi7UjuaBWFXC
         g+qnKOlZL3ao3maTimIPPR44FeJBEFuQ0CWyzjmyRLPsF4rOIZOkfz5ZUxXR52uK0tSz
         ZH00vPdwB1PQ1gY9PqXnSQBuK2qzar3aTPabsgxnzzXOrS9Y53dLS1yrAeDTuB7gUoQ1
         BvAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 25si1928359qky.171.2020.01.08.08.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:08:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipDsL-000468-RZ
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnY-0005zj-AW
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:03:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnX-00025A-2M
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:03:08 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:46689)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnK-0001tl-Lk; Wed, 08 Jan 2020 11:02:54 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5mWp-1jmd0O4C7v-017F6e; Wed, 08 Jan 2020 17:02:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] arm/translate-a64: fix uninitialized variable warning
Date: Wed,  8 Jan 2020 17:02:32 +0100
Message-Id: <20200108160233.991134-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EHnKO7J//24FrZUg1j5EIhq7KWvRVTiEIll+WUa35nyi5IL7Tzh
 ePKu/lTxyjEGo2CJgXrXlBESFDb4nLEwOexjcPUoLntfZ65SYP/HxOsb3KOu92ZrSUlkPiA
 h/G+s05PwjTZjcDlVxEffhkdpwxYipDYsQ9a0ECbdAEQyXAY/R78dTx/qog3VB3u7n+2ovH
 3FvNgcWftBwkIAsAFRcFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kp8Eg0YxKM4=:Ez7+Vo4nmSWoZpQ1sfoR1j
 TlLb05P6sWZj1pWDrDa8ZoMsiWLK2QlImCTTpgmhcZE4924VP1DfouXPx0YGMYoJhmZB/NZO8
 XqEhHNLHB9J+tcB+KO/SwRu9YaF2u94o61/HuhhZgSnSyH3NtVrz1zXGiH6Km/tJOdO6U9NjU
 OwMWx+RhF0L+itcsPbeRp/+HjnNwFXtOIOyH79VyaJJawDmC2ivHrDzQmYqFp1HcM6L4Y4pbQ
 +wQftz0gT0xXcmvjQO1BOwxcrOMmbkF6Vn4H//1vYJdPq1dliHFEyxSTSeyitZZvRMXp3eA1O
 EWm12TFCI8TloyA4jdTLlbSYS0LUn3DpzlmOkOWP9dtIiL2Z6SkxPXcDefvCCiNAsj5kMW6dG
 9SeAJWYyJqgNX5iNoC0V01mJjW4AmzDLLdVPrZwHJQCLf0dPWuzafzJMh7N9tTvNvMVdp8+2C
 cAkczGi8eTaGc+f2+hdlheaU8WKfYhPNMID1lBKyFQvnaKjwdrh2zilJbqk19CvJrhhpHRMeW
 rqWfuigEIv+5PFLIuPsB3Tfi+9++mkWgdfC4QeMNchlABu4x+ZKnsRZiBlhViNVWs5YXweH7G
 IqFX2NQO8nEQjRuF74zh+8TNey+YPGVw4O5BpxfGuiA9YPiZphfrwcd0r6uQBs4waJcZ1hDnI
 rSKHQpkSyQa/qZ5jFOgl3ijCxt4il2mspnhVXE4MwlHQ3S+7tLsVvkOv5e/e8Ohsi7wtV7sky
 iyK2gMG7K7Q9cmp5+NW+4A7I/a2hiO2TC3qhctSIHG4/Gngmcr4+Pf7rlSITF+lnuMt1/tF1K
 vY6dfgOR9C8YjQFCcZp/85JhrrAgFNH3gZv3CM/HtRA3EI/gqVeXpHtWS4Q1jtDehrSo7AycH
 5ykwqdja1wAGXaQtpn/5IskW0HuvHtgqBRFegV0Pw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QFeZUO9/QzEi

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    if (!feature) {

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200108023915.52288-1-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/arm/translate-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe62958..63a3d2668710 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13585,6 +13585,8 @@ static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
             feature = dc_isar_feature(aa64_sha3, s);
             genfn = NULL;
             break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         switch (opcode) {
-- 
2.24.1

