Received: by 10.223.150.237 with SMTP id u100csp477876wrb;
        Tue, 7 Nov 2017 12:47:03 -0800 (PST)
X-Google-Smtp-Source: ABhQp+T9wIjSQjeGKfj3dd8SJVyrKTIs4FQpKpLxFUSVmoWfKTjuGVtcjodZ72CwRNQDrEaRYK5P
X-Received: by 10.129.22.211 with SMTP id 202mr13512yww.73.1510087623501;
        Tue, 07 Nov 2017 12:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510087623; cv=none;
        d=google.com; s=arc-20160816;
        b=Hheo8/XFx5WzML3Rx5v7eIX/1ZUwltS/npok2wzJguSUCvl3X4OasNXeEwhBCtM5cQ
         3gTGV2GpVBDX7CSkDe7aBiynfgaP9slsdfX1Yfk5GksokQF1wiUgxZh6Htmth3dtC+5D
         uuikvhIgXmQv7QdM+w+YtjJ4BuUBjgKnnNZdlL7v3FgiNptYqQBuB7d53ErA5xdXr3nZ
         FNIbMsZ9pxcdgr350FaV9JkyrwqmGnloPuqFy8BKHme1mQOUjEdl2xiOOQ6YPHZfY6Kj
         JBy8FI03zTLp10VYd9xUWbdU7W8sTLoWTBDbdd6pCQrKytC8P63jXy7UWAsOwK9R74cZ
         B01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=iGGxapvVTp90Y/Z2cbOsEc8/E+sxnfOLNGOgfhIX+PI=;
        b=zXYbS4Is3SLJg8C1GiM9HWoHGNcjkUlObOfs7mdDRcwHOeXqM0K5ZwYeQMPMnPQkTc
         Jrp+w3QQDGI69ke76I+TmCA6PahDO6z2Y0eeklRDndZgyqyLEbesEzIVVzxgS+e47wNU
         Yjf+Zk+kqghMTumxooZlXInoX/ozLwZj2zQfQeaadA/PAe42YnI9MKqo6qDcT6XadOwi
         yPt+zn8+xF4hwSxAu7KIWFMW2pSw6scVLSiMzGsa9OsudQDF6UKVBmtCB6FdCtTNY3zj
         yXdnLfgj+wDQB/BFnwikGL/hEH77LHBk4ux4o5GncgCJRHERCuzaQMzggW7Xs+wIW+9R
         r+wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=SmmY59o+;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ccT0MHag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w20si486278ywj.578.2017.11.07.12.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 12:47:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=SmmY59o+;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ccT0MHag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCAlz-0006TF-0n
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 15:47:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eCAls-0006Sw-O9
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eCAlp-0002oS-J3
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:46:56 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50367)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eCAlp-0002hf-B4; Tue, 07 Nov 2017 15:46:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 88BA420622;
	Tue,  7 Nov 2017 15:46:51 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Tue, 07 Nov 2017 15:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=iGGxapvVTp90Y/Z2cbOsEc8/E+sxnfOLNGOgfhIX+PI=; b=SmmY5
	9o+/Eco/iyr+6LZ5e3ApvlsNdxKoCxzO33yvJCX2hWCe+XTCak0FsW6kSelMMama
	3RTooieqjHQ4Cea6G8tacdoDVE7EsUxVKA+DU0KRKfQ9vHWValu2Tfw3I5aZMWHC
	dbNAPAWUYsA0vIuude0Y/MAbpWd2e0GnmnZn6M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=iGGxapvVTp90Y/Z2cbOsEc8/E+sxn
	fOLNGOgfhIX+PI=; b=ccT0MHagY/buLJqBFR9KSF6IBZaleNDw0e/2uWphx13Vg
	hffiFZU39KreVl8sBf1Hh7RzMh5xjS5WIXRwz61L4oEMiAyb6y1vpXSd0EweKfDu
	5/z+hA86Q/c2M5LQ9Dury8Xu/SMkF9HR4tSk3i9CRsyFUB2XDM/WXUXOhm9dRcL3
	ubJPaFgYDM9dEEl+kpqI+dFiIYj+h3xVINXzGLpFbbyIUvRye8TvpA8CLWsBJo6h
	b/B3KrecVrEbZmPeNd5EVaHpH6rzAT8d/xr6PwGJzWhki7AeNMAUgggJKFwEDK5j
	UQNgwXjbEZLHgzcLGHDEYtrRZ9ovJ73VYjYcmaK8Q==
X-ME-Sender: <xms:uxsCWm9hu6_IzoN3q-hYm_11bpijIHSDgW-WmSXb_rvomulmauTN7A>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4C10B24108;
	Tue,  7 Nov 2017 15:46:51 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Tue,  7 Nov 2017 15:46:51 -0500
Message-Id: <1510087611-1851-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH] arm/translate-a64: mark path as unreachable to
 eliminate warning
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mPWuvAE9E/lL

Fixes the following warning when compiling with gcc 5.4.0 with -O1
optimizations and --enable-debug:

target/arm/translate-a64.c: In function ‘aarch64_tr_translate_insn’:
target/arm/translate-a64.c:2361:8: error: ‘post_index’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
     if (!post_index) {
        ^
target/arm/translate-a64.c:2307:10: note: ‘post_index’ was declared here
     bool post_index;
          ^
target/arm/translate-a64.c:2386:8: error: ‘writeback’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
     if (writeback) {
        ^
target/arm/translate-a64.c:2308:10: note: ‘writeback’ was declared here
     bool writeback;
          ^

Note that idx comes from selecting 2 bits, and therefore its value
can be at most 3.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index caca05a..625ef2d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2340,28 +2340,30 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     switch (idx) {
     case 0:
     case 2:
         post_index = false;
         writeback = false;
         break;
     case 1:
         post_index = true;
         writeback = true;
         break;
     case 3:
         post_index = false;
         writeback = true;
         break;
+    default:
+        g_assert_not_reached();
     }
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
     tcg_addr = read_cpu_reg_sp(s, rn, 1);
 
     if (!post_index) {
         tcg_gen_addi_i64(tcg_addr, tcg_addr, imm9);
     }
 
     if (is_vector) {
         if (is_store) {
             do_fp_st(s, rt, tcg_addr, size);
-- 
2.7.4

