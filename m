Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2371315njk;
        Mon, 27 Jan 2025 03:39:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYUVROgj+3jjLjBBvpKVSKu6NcC8dBx5pUGhu/39fF6fZyKeN3mVRkjCViNbf6AQKLXYeRJexVzEDD3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFMXerQgffxv3H4pkXH8XfBVGEQTh9qtuT20YEQaj2X6+O41tpgQEjIAiZWWewU//JSPp2+
X-Received: by 2002:a05:620a:440a:b0:7b6:672d:7fc7 with SMTP id af79cd13be357-7be6325fb8amr6599232285a.46.1737977992297;
        Mon, 27 Jan 2025 03:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737977992; cv=none;
        d=google.com; s=arc-20240605;
        b=Cb9MFaR6mOoVI1i1WIhuSft4zfgwSo5MZQkO8ITb4dukk25c45r3DbNWipo+jFILGg
         s+znzC3slyEYcir7LLDF6WUaworQAEx6HGXHIhpmHM+dSLhAPtyjjmm+gLYjKoTGJoiQ
         7rsHZpbSxvMtWt4c5bwNzw0ZOZEQYliI/3J+QV4LWpXI3TdxxZYKPRJ1r6iQ1IjLyfdm
         jU6sB9KA2pC2kREr32sVdP7ra4DzeQnVdnpADvp/VdhCjwOWyEWNmAiTiXZoqIf1nga8
         Z3tHOftylFAlKD5acz8M94kDF2099mHVDPAudd1gyygw7QtmdthON6tXsPYQicPajU/4
         vtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=onDlwj0ZIbN511qY5udeZ06adF9GhwMX2qPBrWPiGaQ=;
        fh=JYkiVvirhZ+jeSyRL7tKJsw+LMEAU7w3s/TdDiaG9CA=;
        b=YsDpLbiDvPb9/Oqf+mZo13srfO8PB/V9e29zbH/AsAsdW1LxO2qXIinAAJ2w4g/eXj
         bxJy+OECEpMfbWS125eEYrhGVrlL0XFc2Hkxg/rgK5/pHzu3q3MLrk87jl2rZoU9V52S
         RuYWkASoUsraoUPr149P05+dwDcjU1mARrCqsn0YVzBmLL9SBfS5cLHos9wY79hTMtav
         HYLx8qgj1NcUXkvOvnVSysoFQca8zjjhv6P50C6CzR1ZC4Vyc49iH3uGELDuHZOEVL5a
         lj+JYIiJBL8W0yCVj2C1+zG88LSp2fHSitkGE7SKeY7VglIBrBWfYgGQ6iwXwF1WRkwG
         jkiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6b9siCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aeebfc5si1074826985a.334.2025.01.27.03.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6b9siCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNS1-0005xi-Ki; Mon, 27 Jan 2025 06:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRz-0005vL-KU
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:43 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRy-0005Cp-4Y
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so3804954f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977921; x=1738582721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onDlwj0ZIbN511qY5udeZ06adF9GhwMX2qPBrWPiGaQ=;
 b=p6b9siCsSdJOD0MwZLjwtjfuvcA0MKgin2SR84iYUEUAKrEzHpCBcRfEEKR2nW/gDB
 MHxXjBTvPIN3ukrggddqtYPHAhZrK82xtxGfzft4+uihXBLbbzNw2mF+YlVpq/vTIZrm
 8KK3bPdNm4MH30Vxnat9IHxwHRRd10jdBiAraVSnFffo/9nixLreHN5TvaPDu2IWE+Vh
 wDZZ8B94xvS1Fj/104troNFIhpjmsRSwoCefMR2dsbJ7ur/rW4KD+C1w3K4c8uBAUlco
 s6IJBJ6O6WX/TNwMzaHMI1FzIsVWUemdnUSgqJcjHuLYi2pQ8Pez3L8twEXqN9tSPYbo
 uJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977921; x=1738582721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onDlwj0ZIbN511qY5udeZ06adF9GhwMX2qPBrWPiGaQ=;
 b=rZKL6Sr3YJqNr0BaGROI5kX0O2YSffJSk56wfNpMnfUd/daPprBcjiU1YWUJiyS772
 trKucJcM3x7u1vVbL032sk9DG5tpdDvJ+no/rXSueTUZE6YQLT5a2R4JJot6OezxWWsK
 7Q0DkYrT4uKcAN+iazOZcTW/Q1SmaTerzh0bDnd/p01lV/iCPGbqjsesHoAXWsuwVEsE
 ZQerM1SKWuLpXey7xgVucPArAP47mibI1SpdyvKGEEU7IMN9fsDNOIHE1H7a6GRyzY+C
 ijWSTfvNxj4BID+GRXI0kyP/JNh3jZDfZ7xlTuYassikvCCggH5+1FSo6NkPmi6ivl6G
 c2Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcrD0fXvOtm5kPmB1TfVDKsJdB5FNqRmAOhdIPsK+xJCW/lzqpb4cP36Au7OdUexeq192/BN9CUw==@nongnu.org
X-Gm-Message-State: AOJu0Yw1DUJaNnVuV2YO5KOwW0XUeLzNL3jjlWNNpIJUutfm2XZL0m0s
 he7j51aK9KSLFh1Dw4giT9JQZd/ps7Le5a4YU8pcf/q6yf7UTvz1g+HlwyAkQSM=
X-Gm-Gg: ASbGncsXQSprofJQZz9Ji0gjXXFw4EH5iCmPxGnzVxBQHogXmPYe/4Uc7k6MohUAse4
 Mprdss/niXoOZXNMhseKfAMo086fGGGB8o3bseuG+uhbxcB1oQ4wX3EsWml6T+Nzp5DH5uhcw6V
 p8nqjsP6iY86M7TSwwI/LkA/99jsS1l7qnQRPqsNH1t37Y9XxmCfPcrExKauPA6+98bsopW4j+M
 FWbg6vkRA5kF6s9mJpPlWduYcX72sUPVWQKQcPvx3YgKahZAvN+0uz/W2bD1VMokKO2N36InJ29
 fqJOCiEMhkb0UzTZIxyxIMFODVOeVZsjJRYXq/vSHPqbmek9dZEQV1k=
X-Received: by 2002:a5d:440e:0:b0:385:faaa:9d1d with SMTP id
 ffacd0b85a97d-38bf58e8751mr31668234f8f.35.1737977920723; 
 Mon, 27 Jan 2025 03:38:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1baf65sm11004842f8f.64.2025.01.27.03.38.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] hw/loader: Clarify local variable name in
 load_elf_ram_sym()
Date: Mon, 27 Jan 2025 12:38:21 +0100
Message-ID: <20250127113824.50177-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: b6uti+M9yBVa

load_elf_ram_sym() compares target_data_order versus
host data_order. Rename 'data_order' -> 'host_data_order'
to ease code review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/loader.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index ead10fb6cb5..fc2e8f91267 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -443,7 +443,7 @@ ssize_t load_elf_ram_sym(const char *filename,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
 {
-    int fd, data_order, target_data_order, must_swab;
+    int fd, host_data_order, target_data_order, must_swab;
     ssize_t ret = ELF_LOAD_FAILED;
     uint8_t e_ident[EI_NIDENT];
 
@@ -462,11 +462,11 @@ ssize_t load_elf_ram_sym(const char *filename,
         goto fail;
     }
 #if HOST_BIG_ENDIAN
-    data_order = ELFDATA2MSB;
+    host_data_order = ELFDATA2MSB;
 #else
-    data_order = ELFDATA2LSB;
+    host_data_order = ELFDATA2LSB;
 #endif
-    must_swab = data_order != e_ident[EI_DATA];
+    must_swab = host_data_order != e_ident[EI_DATA];
     if (big_endian) {
         target_data_order = ELFDATA2MSB;
     } else {
-- 
2.47.1

