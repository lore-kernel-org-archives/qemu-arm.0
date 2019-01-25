Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp832882wrt;
        Fri, 25 Jan 2019 15:02:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7Kd/rd9sFzafILLSfbLfbQzNpKsek/IvVgm3JtuaIRm1Nh+yUXpgOTlv9HNeuQv1y4Md2S
X-Received: by 2002:adf:8001:: with SMTP id 1mr12691735wrk.23.1548457357693;
        Fri, 25 Jan 2019 15:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548457357; cv=none;
        d=google.com; s=arc-20160816;
        b=RZVXVk1KLEopZw274lWXFjDg5s3kHM+N3Q6sQg2EzaA0x8ux6DgOKMfISmBJDuLGF9
         EsF04iiJ2/eOAdOhOH82ypBih7TONfE9qCmiy9C+YM9pKwlF+wObyXD8gOS4UKHYfVeO
         +czz+HC7IZeTaVtT0sdvDQghvU8CJOGoQnHPPqdSMfDUhwAdmJbCnW2Cdv4TH7TZ1e3Q
         hvAIjN3T12+0PkQrwUtWlo4fscxzwwdN0njo5n6//vr5LLpXVkzLPHyWuVV+i/gEIv7U
         U1JMWzTNHualANCnvkYuUf2szbwY5r0B+NG2DLYjxbmLdm9AUgmHGvDdjefU1wMiTWnl
         2mCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fV40Bu8X3EucOIuP0sViYfsGhh9yvfDVOeEq1irD654=;
        b=bmdPFe1Ckv+DnVCwXKtLlO+RFcqbDSpmlcQxH94vJY5Mz+Bf9RzBBVPUDCoyzA5W4a
         eF4YaJ3bF2U1TJwTJSvlPZHYoFLNc3CrSrhlHHZ+h4xRwrBOh3ZbofvkUAezNZb7CUjf
         eBZZc79wUaNBtXqZla8wgpKcoZzsRVRBJU1Un5AWSw3NSAm04XYEmrVEo43W6jCJn7fB
         lUKHobxcOIHkQsjkwqsWovXJ/fbbBrBOKxK8UWYR7gzWutMlGXkYXmmKOhTUwksLPbtg
         LyLs6iMoE+ssdcIrd/xvggSecagjeGuNA/zX+7VQqBmKs/d4B+t/8Bs1XE1HZqEuybBB
         qgnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si72320143wrq.443.2019.01.25.15.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnAUe-00016y-Q3
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9M6-0001SH-4r
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 16:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <remi@remlab.net>) id 1gn9M5-00032S-99
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 16:49:42 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:42984
	helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <remi@remlab.net>)
	id 1gn9M4-0002wn-Tc; Fri, 25 Jan 2019 16:49:41 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
	by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7BE355FCE9;
	Fri, 25 Jan 2019 22:49:27 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Date: Fri, 25 Jan 2019 23:49:26 +0200
Message-Id: <20190125214926.3204-3-remi@remlab.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1648289.tQCHxfjYn9@basile.remlab.net>
References: <1648289.tQCHxfjYn9@basile.remlab.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-Mailman-Approved-At: Fri, 25 Jan 2019 18:02:18 -0500
Subject: [Qemu-arm] [PATCH 3/3] target/arm: fix decoding of B{,L}RA{A,B}
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zRzs7Md0zjsV

From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>

A flawed test lead to the instructions always being treated as
unallocated encodings.

Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4d28a27c3b..c550a3f013 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2036,7 +2036,7 @@ static void disas_uncond_b_reg(DisasContext *s, uin=
t32_t insn)
         if (!dc_isar_feature(aa64_pauth, s)) {
             goto do_unallocated;
         }
-        if (op3 !=3D 2 || op3 !=3D 3) {
+        if ((op3 & ~1) !=3D 2) {
             goto do_unallocated;
         }
         if (s->pauth_active) {
--=20
2.20.1

