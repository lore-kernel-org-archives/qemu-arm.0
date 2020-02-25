Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1094239lfg;
        Mon, 24 Feb 2020 19:17:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzfnpM3BshF/FT4cXr3UxWvU+dXdXz6hcM6Rq2Q+pfYfbCJfA6KlIqq0iAvX0OUgurQEFq
X-Received: by 2002:a37:5206:: with SMTP id g6mr5993593qkb.287.1582600676004;
        Mon, 24 Feb 2020 19:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600675; cv=none;
        d=google.com; s=arc-20160816;
        b=Jskq2nDBrrXtIPvrCk8lhfgGfrjI1zlHND1WSw/msjA2ddJDUrdmgFlz73zd2++1tl
         OnbutkIbFJLW9KRFSfKG7NTeKfonozp5mlvw/p0y8z62j1WxT5EnuxiN4a9bkQ1AGI50
         hMkaMCNuiQCMQbdXBHEGDbtaa7IdlJiEuyVlxWdNNg49KJvWvMpmRfTF9QIhMr0sYr2r
         4MnAleq/D1SAF+iRUCGb0fBOD7Tn0Z3zapr0WnK/T6I0850zH368dYm2gUqoYYsdfcd9
         HQ6ihoUs6CZi78oJowOIgzkEtZy0VXghZFoPtX8mrdtikQSEa2fPnz7Au87IH+DIVmkq
         knDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cBaaxhozLshJsb69EnjAMT4ZKGg0fEbNuWqD22FoXAI=;
        b=w7LimeUWM2IGzumKDVXWXH6waN49VRC5tr32K/GOMh/jHkMIgJRIs2bXxqDL1Bkjwa
         u1Wd3i1fNXeg+JjewCYvCe+d/paqfAHBEBVhkQvR9MVG8AdzPd1XG6pRbGEZo91vJauO
         E0s6jYBf+Kitjy0JDRz484KW7xoyf10AMGXrcaNF6rCT2ccre/gsESEda5lazMLePrE2
         1EgXdxFT9Ys8uS4Wf5X7rHN3CMR+SGgBVZzENg5pKfkXEPbAtDm3V5YwwVNGRhuKh862
         hU+ExVfLZmXPyBe91ZEVRS4iSXZvzoDVcXJeAvJplXAwjVWkbrip7uBXAy28n6QjSvru
         6zeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oxNB2KJI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p35si6709286qtf.231.2020.02.24.19.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oxNB2KJI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QjL-0007G7-EG
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfy-00030u-Bk
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 22:14:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfx-0005OU-E2
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 22:14:26 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qfx-0005O6-8g
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 22:14:25 -0500
Received: by mail-pl1-x641.google.com with SMTP id u3so566514plr.9
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 19:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBaaxhozLshJsb69EnjAMT4ZKGg0fEbNuWqD22FoXAI=;
 b=oxNB2KJI79BwkbL+siiJyfcFNRgnFH6UEFGgq5n1kGacdqlw5bXQjZIN1zgdjMY5Zn
 2/sN8dyIvGgOr55v2KfM31lq69vFKxqAtQt9DnG5OdYQwOI1/3yuxCx2Bb4TPKjS77Jj
 UvA7sZG+eVChGfv18JX3onXvzDK3dmB6bsbErXABvf+bp+YFk5EIn5sTyc9tIstZEYkE
 ZWD4CG83F+qhoKeEWHFbbrENXZREokSSFthzePNTSdMANuQ36Z8H01sssUrkj90gwyGG
 Wln6sr6P+D+gw+e90aD8oydyqEeRTzwvkExI3d+V04tzf2J/Q7M6MEEsigjZjxzEB+yl
 kFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cBaaxhozLshJsb69EnjAMT4ZKGg0fEbNuWqD22FoXAI=;
 b=b9Ci1kcYboa03Lqs1wWD/VVubxJnH+8qg4tblSVwt1ASj/Aw4W6JKf31H8oKiNebSm
 /H2r0wXjfR0PvN/4YEa2EVKNIDtBnxcAW60u7fsaCaBGLgDBcdEEJ7lVm7+yScvRqnam
 nxQtdHwgJ7PqA+ImDkxUWtWdiyUyy0qGHPCf7nzpps/i1Ezrde0olXoLeRyC61qLVU1w
 UrW58JuxvhYEOTgjaohLyvWQB9/3hNidqKhhthfWn6rwV0OCKZDfRCsmI8o7/O8ZhGer
 yJ4zC9V2+rcX8+/BHeSSSFKw22i8O7f3Lq3l674j3i42VMOp+pD+0xBl8oKU6oV+k+2I
 VtcA==
X-Gm-Message-State: APjAAAUu0Wj7YQUI2L67SsWSV/wrAstyRLseDy1w2JKb+j40M6eYlt7s
 6lBAPjO+OmcJvwsC8W/aWS4e7mt1XgI=
X-Received: by 2002:a17:90b:46c4:: with SMTP id
 jx4mr2660424pjb.32.1582600464025; 
 Mon, 24 Feb 2020 19:14:24 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/arm: Disable clean_data_tbi for system mode
Date: Mon, 24 Feb 2020 19:14:14 -0800
Message-Id: <20200225031414.15649-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ClBCF6sOzjJ6

We must include the tag in the FAR_ELx register when raising
an addressing exception.  Which means that we should not clear
out the tag during translation.

We cannot at present comply with this for user mode, so we
retain the clean_data_tbi function for the moment, though it
no longer does what it says on the tin for system mode.  This
function is to be replaced with MTE, so don't worry about the
slight misnaming.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 24c1fbd262..3c9c43926c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -228,7 +228,18 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
+    /*
+     * In order to get the correct value in the FAR_ELx register,
+     * we must present the memory subsystem with the "dirty" address
+     * including the TBI.  In system mode we can make this work via
+     * the TLB, dropping the TBI during translation.  But for user-only
+     * mode we don't have that option, and must remove the top byte now.
+     */
+#ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
+#else
+    tcg_gen_mov_i64(clean, addr);
+#endif
     return clean;
 }
 
-- 
2.20.1

