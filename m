Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1385694ejb;
        Tue, 19 Mar 2024 08:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJnyVDNMmBF5qlsE/eXFetaHZy4iKKt9SGS6ZsPVqPAdNvdx6VQLXDWpKIbmyR18CkBSGu53cFV/e8VRcMSfltSiC5wNUe
X-Google-Smtp-Source: AGHT+IGWHK/EQq4OMZuUGNtyDoIviU2jHXs5D2aQ8nXR04Tt8rS0eMa2e2S5W+vfuXzOf85T5MoO
X-Received: by 2002:a05:620a:c06:b0:789:e887:f5b7 with SMTP id l6-20020a05620a0c0600b00789e887f5b7mr11519659qki.6.1710863399934;
        Tue, 19 Mar 2024 08:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863399; cv=none;
        d=google.com; s=arc-20160816;
        b=hlKEDwEBn8XhBpOeYIKeY7V+f0NmokR6wIvQcX1JCoiVbjfstMcqdInWVZe0iBT+La
         3BQ4bwHGHGQEVX3Fvtdiu/4slvQe9PFc75KKDSy2Q4P4IY8qrhxPg7OVEfOMTinpc51a
         YBzc/Bf79kO06mMOWSHCCBq9d/8OvcPIu+ZoYXYiGCHgEIHvFki2XFHcvtV8jICcztB+
         KE09NrA/VRafka5RwHhEgzU4ervcqRFl1aZk0Q1lgRY1ckqAVZCPRmbU4QhppBgd8Gvc
         HpuoI9COqvKax86iD3h9u1t6LWGWcWMrkUyeEgQZR/18rOqgzgYTWUBK+GB3gbWSByzc
         UFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EJDlH3IcOyAIPXzpINjBXtBvgS8Gcx3JXjLnmPdWxeM=;
        fh=sjqv2O794x7b1iZDrsl3em8mfzVu6MbVqIcxXMgae7E=;
        b=Xjw9gwhDiJXC21Wx66XhsbA+yd3ymtK1xzlPwJY4dLEN/oNrCyqAgoPIOmKXc0kcv+
         LzCRJ1sVL6OHperDtdMYDoIGwrC94W3H7yk/FpZKjrt9005C6IUTWup7tGNFYJ8D7QTC
         fU5G1UIfOnxtWY1mVqUXqoq0O7qbDwu4Edpmjk0x/TqwnmO16bHDWNmxdUhjDGVvuIpF
         lZMQZyic4BWspMWm/5EQXfa1xY5iLVa1dLV6mUcCxO+u/82l1d+AftrMIm0bX85bPbUR
         RGKtfz2zVfthg7K7EvaUTwXHeGNRmNIyf64drpT6DwU5kMu9WLlQiF0Ou4LM63koUstn
         YDzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hE8RTnq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020ae9e646000000b0078a06e6e13dsi3403555qkl.684.2024.03.19.08.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hE8RTnq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbf3-0002ss-5c; Tue, 19 Mar 2024 11:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeT-0001UF-HR
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeC-0005SO-RW
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:45:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41465864644so4586155e9.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863102; x=1711467902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJDlH3IcOyAIPXzpINjBXtBvgS8Gcx3JXjLnmPdWxeM=;
 b=hE8RTnq/ClWfhEVo2r5OHgqY/W+Lzq0pFD1B5JiE+JHTY5eNm+rck4WAceJlLf8/Yd
 D5E1RZ1SJNYM2njYFVnxWrirMCEUWRi8iunskkIYV2x9bXTkiCCtmvShuE4jvxcIRr+B
 Y5NPki0V+jrDim93T1ARAs2um1ZirzW7mUDgK2EcB7PzqeloLvMRqsw5+PuKHq2zMmh2
 ILHuNz27tvpLZ4YmVrvDMQ79FkvbiOCyJ+NRJ04jy9x3W1NEbRznPpEvCkRW3T7jUbMc
 WpWWFyYtwpjhS0Svxa0Yl1ZGps1lMj0nKfdATI1Pi4nwdxUryvtF5MFeHo4TgZE9gJf5
 G31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863102; x=1711467902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJDlH3IcOyAIPXzpINjBXtBvgS8Gcx3JXjLnmPdWxeM=;
 b=jmLv2IzNMpFf9q5MSsQNgIacsoPpn7m+iB8nuq14ctWWkqEQ0S9HulFp5c5gmcfxy9
 Nfzl8qsKf1L2RUXkpR9JOFk/xzwKln0ZWM6LZG7/fFo3+pm/u6NyF6p1Lr2NwFxaJRRF
 UqcQsoOr4aWYarpMdo09Wr2vopOJoCpx2Qau3XD5wyjHO57AapGrcGQSwVNX/whqi+Ql
 mSWt5s6sdTJeTTZzYBDrLFTeY2ritqvYzuL8Nn8nc/H+lfeM3tUCaqfDNZHM4GPMqcYJ
 ivv8Af1cT0fXPudKYXmwb/FyBmL+d35tBC6S4GACwlPCn5BsvZspigS/TMP4Re3GkdKI
 5hgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSLkM/7Na0oynS2C4Ab0foitSF7y6eHGzsO71/EmmMuXWv96ON7tl3tcYiECFC28LCjEWZdflvhdQHPf9RhN6HPGhR
X-Gm-Message-State: AOJu0Yzj7JNqfPjECwubcQ0NjyOFXRDdeCxIsOW1LSN+FYiq2u+BoSFZ
 ktqQwka4tRF81dnUwP1H/sWYARSfVLoZugLsSSiCV/mW3EWJqaHpqEyD6FP1Cts=
X-Received: by 2002:a05:600c:3503:b0:412:c285:1091 with SMTP id
 h3-20020a05600c350300b00412c2851091mr2952541wmq.7.1710863102010; 
 Tue, 19 Mar 2024 08:45:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 fl6-20020a05600c0b8600b00414692977c3sm426238wmb.14.2024.03.19.08.45.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:45:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH-for-9.1 21/27] target/s390x: Restrict TCG-specific declarations
Date: Tue, 19 Mar 2024 16:42:50 +0100
Message-ID: <20240319154258.71206-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: cl3/dePc6g3c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 825252d728..559c9f561d 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -398,10 +398,12 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3,
 
 
 /* translate.c */
+#ifdef CONFIG_TCG
 void s390x_translate_init(void);
 void s390x_restore_state_to_opc(CPUState *cs,
                                 const TranslationBlock *tb,
                                 const uint64_t *data);
+#endif /* CONFIG_TCG */
 
 /* sigp.c */
 int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3);
-- 
2.41.0

