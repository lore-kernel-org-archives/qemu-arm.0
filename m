Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2095063njb;
        Mon, 10 Feb 2025 09:26:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhXxFT3bpGBOaDXNl518bb52B/ZX3BtKoJ9+ZjrJRvQbTAtZy91aU4Y+Bf1e4LBsqDwkl4tYgrHSfMfg==@linaro.org
X-Google-Smtp-Source: AGHT+IF2yKEz3NV6wf4QnqaHhX50TKHJ688uVoX/L4z6JnOnnrLv5oyPwDuupZ4nuQaO8W3hUENE
X-Received: by 2002:a05:620a:1b8a:b0:7c0:6680:771d with SMTP id af79cd13be357-7c068824580mr65791485a.42.1739208385321;
        Mon, 10 Feb 2025 09:26:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739208385; cv=none;
        d=google.com; s=arc-20240605;
        b=PGrv16obZ0kup3HxLOgkJSZLhW6227U/MdFD/z/GaQOobaMYSmRveZqh42oc0Cfipf
         UUzI/v3lAa4jxt0nqkN4MVxVcsBZVUi3yh/hPkG6SgK135DybguCBiElw0PkSH5RWP2l
         k17rwllvgOSjhd5eTGaTbBd6hNFl2Hs1XiyicpKFlSju10cNMs5IocteJZjwBV0bCgpf
         PW6tZGAST1X8pszcD/4RQNstz+GKE90Q0z87r0fyrn9JAzxmwCZJwj1rLMpo97q0RCii
         DXaDeaO+7tVvzNz3ZKqIfmaDV1Uw33MI+jnZT3P76p+UdD7CZb7BN8x+cHLR7j8cjnWv
         SgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:from:to:content-language:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mF8YE3Pa6J2CJnDbY7UDeutCiHkCAnV2beXLHAhUBTA=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=EChqh+IRWhGX1E5MjB6uacTjX/kWWcejetxX7AG+cObyTIXJJQ+QQ1JyuAS9WKBia4
         mOkhoad1zgRi0eAsRY9vE1Aj1PRGobOtRKRw4LAGZa+gLn3+Wau8WP0C4W0/cZu0LZ1z
         BMSXBoL/D57IHcQbz4d4P0OC3aDA48QWXlb3qj/XtWamtIWPxlYT3+fEInstmhcH8LO1
         lOr7kHbot4DZxKkAol1Be3N65DoDOOL8+uX3cJWnF+BKCHxfb5tHStcfPrVgMxanY1cb
         IxOxd6r++SAjXmNw3OfswZ4eDaRFBVuTOnVMxcUD0WpMmP40GjSYMoctoin7iGFgHjCF
         zHbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JmqTMtTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0619f821csi153293085a.412.2025.02.10.09.26.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 09:26:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=JmqTMtTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thXY5-0000aN-E9; Mon, 10 Feb 2025 12:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stu.grossman@gmail.com>)
 id 1thX32-0005VS-Av
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 11:54:18 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stu.grossman@gmail.com>)
 id 1thX2y-0007UV-Pm
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 11:54:14 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21f53ad05a0so52162865ad.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739206450; x=1739811250; darn=nongnu.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF8YE3Pa6J2CJnDbY7UDeutCiHkCAnV2beXLHAhUBTA=;
 b=JmqTMtTgcUDeANd0gkpADM20ZH1At1m/M9lN1xOPMoFLYLKt6qcIG4zUPFuXikYyMp
 8yFH7hdo9GtrfgrwpwwvXPFl5/ux9nLl4tL3cju538TQy2veomfRlUbdV+0dDTxac1xI
 dadttz3FAzgE06SWviKBfV54Fb9QKZ97xI8Rev6raCygaLuH/Gx5eGZk5wQC6lEwPUSE
 C92dAoiv/LD6ouwzucoo2ZR8LtYG/3eQARzY6N6dZQdZhJeWXBdkLy5GgaPxLEyloWK4
 Y7wqvedwFRojFslc0guNh0HVc3u65U3saSkva2r5RLVBH5XoZJu6U+7t8Y9DogZFFzZJ
 8Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739206450; x=1739811250;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mF8YE3Pa6J2CJnDbY7UDeutCiHkCAnV2beXLHAhUBTA=;
 b=v7Nd+Hxgw2FItP2pT14ucXBj3zcz9coT20/iv1HcO+RfWybLUFwsb/esqUPwgy/8rU
 AzqFLj7yje0arEqiA8Z3VGa8DoBmRvTlWAh9kvhKu/mg0W8/ZCpkBZfgCTBoLUEDLreZ
 KiCiBSNgTxXMSD7+7zaHM416Gk1oOjLty0e9LHyPh21zpHVEfz3dSTAWLPaA9Jc91Yc/
 g38i11uX6x0POwJn7IiKpqtj6KN2THIQB2H+Zrcb8K3T8xJpFGsmvKiBDBChL+H1wRQq
 iKYyI4Nm7JwOK/RPUrbfVflKPzb50p6snRCoPbp2odE+3oVxhXw6AlcE3nQQ7UVh/uG7
 4WfQ==
X-Gm-Message-State: AOJu0YxquQ4bfXQgiKaI5bZP39xttDIfJdIU7qrNBmDVKpBK/izdZv1D
 kkGqtZeIBWySzkggKxbZrS+4UIn4b+6Pyi4rKW7g/mkvZeby2DmWb+o4Kg==
X-Gm-Gg: ASbGncsOdW2QQkr8xfO9ru/snBjKJnNvYEvL+OPtzoYHGqyYxpDcOVKiBROFRB79ATb
 d8gfVXN+XIRajzgQufTr5SCTL+TDfmSzML1nAFaQiLBOz6CCc1Q3hrT296L1T3/sfPjPi6EzAQu
 0p3nI4a2wQyYh6+ltm1VlSc6uRxEMAc/HG4pSXwIDyAKhQYLRfIZa5+i0H90SJIm9UXzSudZYNV
 44XdTjW2zZXsKBil9Ss3+BKGqbbOJzEXU/6ruSjBRX0fwDK9oMKql4ORsov/qTBnHHKFsSxAbw6
 iBurPiplpA5fUPAGmlNDefjMCrSiKeJl4N2gcLFIt8o+kgtQFWd3vcJMsVhHkmCbY8C3c8M=
X-Received: by 2002:a05:6a20:918b:b0:1e0:d1c3:97d1 with SMTP id
 adf61e73a8af0-1ee49f59cc0mr829106637.29.1739206450202; 
 Mon, 10 Feb 2025 08:54:10 -0800 (PST)
Received: from [0.0.0.0] (107-142-35-146.lightspeed.sntcca.sbcglobal.net.
 [107.142.35.146]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-730964e7866sm1508254b3a.56.2025.02.10.08.54.09
 for <qemu-arm@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:54:09 -0800 (PST)
Message-ID: <6866d6b6-24af-4743-8407-26ae2998dd21@gmail.com>
Date: Mon, 10 Feb 2025 08:54:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: qemu-arm@nongnu.org
From: Stu Grossman <stu.grossman@gmail.com>
Subject: ldrd implementation issue?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=stu.grossman@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Feb 2025 12:26:04 -0500
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
X-TUID: Pz2LympzBXPt

I've been getting SIGBUS cores with a bunch of user apps running under 
linux 5.15 and qemu-system-aarch64.  These happen to be 32 bit (T32?) 
programs.

All of the cores point at the following instruction:

	ldrd r2,r3,[r2]

where r2 points at four bytes prior to the end of a page.  Eg: 0x10ffc.

The bug appears to be that we get a page fault between the accesses for 
each word.  Prior to the fault, the first register is updated.  Later, 
after the fault is serviced, the instruction is restarted with the index 
register containing the word loaded prior to the fault, which is 
probably not the desired address, resulting in a coredump.

So the conditions for the problem are:

	- the index register must be one of the registers being loaded.
	- the index register must point at a uint64_t that spans a page
	  boundary.

I understand that the uint64_t spanning a page boundary may not be 
allowed by the arm 32 bit API.  However, the ldrd instruction definition 
allows for four byte alignment.

Note that ldm may have similar issues if the index is one of the 
registers being loaded and the words cross a page boundary.

The fix is to defer the register stores till after both words have been 
read from memory.

Here is my fix:

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 9ee761fc64..78ad0ed186 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -5006,7 +5006,7 @@ static bool op_store_rr(DisasContext *s, 
arg_ldst_rr *a,
  static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
  {
      int mem_idx = get_mem_index(s);
-    TCGv_i32 addr, tmp;
+    TCGv_i32 addr, tmp1, tmp2;

      if (!ENABLE_ARCH_5TE) {
          return false;
@@ -5017,15 +5017,16 @@ static bool trans_LDRD_rr(DisasContext *s, 
arg_ldst_rr *a)
      }
      addr = op_addr_rr_pre(s, a);

-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, a->rt, tmp);
+    tmp1 = tcg_temp_new_i32();
+    gen_aa32_ld_i32(s, tmp1, addr, mem_idx, MO_UL | MO_ALIGN);

      tcg_gen_addi_i32(addr, addr, 4);

-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, a->rt + 1, tmp);
+    tmp2 = tcg_temp_new_i32();
+    gen_aa32_ld_i32(s, tmp2, addr, mem_idx, MO_UL | MO_ALIGN);
+
+    store_reg(s, a->rt, tmp1);
+    store_reg(s, a->rt + 1, tmp2);

      /* LDRD w/ base writeback is undefined if the registers overlap.  */
      op_addr_rr_post(s, a, addr, -4);
@@ -5153,19 +5154,20 @@ static bool op_store_ri(DisasContext *s, 
arg_ldst_ri *a,
  static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
  {
      int mem_idx = get_mem_index(s);
-    TCGv_i32 addr, tmp;
+    TCGv_i32 addr, tmp1, tmp2;

      addr = op_addr_ri_pre(s, a);

-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, a->rt, tmp);
+    tmp1 = tcg_temp_new_i32();
+    gen_aa32_ld_i32(s, tmp1, addr, mem_idx, MO_UL | MO_ALIGN);

      tcg_gen_addi_i32(addr, addr, 4);

-    tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
-    store_reg(s, rt2, tmp);
+    tmp2 = tcg_temp_new_i32();
+    gen_aa32_ld_i32(s, tmp2, addr, mem_idx, MO_UL | MO_ALIGN);
+
+    store_reg(s, a->rt, tmp1);
+    store_reg(s, rt2, tmp2);

      /* LDRD w/ base writeback is undefined if the registers overlap.  */
      op_addr_ri_post(s, a, addr, -4);

		Stu

