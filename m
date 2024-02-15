Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp734866ejb;
        Thu, 15 Feb 2024 09:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcXrt8STVfglvHZI8COrNj6O7MfjQsfhSZq+O7HpIfY+7Xcrk5+n7YXAWEZAOl5gIGcR3ACcVaiD3pnquYhgMmlgG2qieV
X-Google-Smtp-Source: AGHT+IHyMU2XhESi88CA66jwbNa3z0/jAfXRFKrL0Mks9+vIgv91MmzvGOaFdUM6Vu3o+H26eXAG
X-Received: by 2002:a05:622a:118d:b0:42d:c8d9:808d with SMTP id m13-20020a05622a118d00b0042dc8d9808dmr3996061qtk.31.1708019926326;
        Thu, 15 Feb 2024 09:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019926; cv=none;
        d=google.com; s=arc-20160816;
        b=nouvOv3HR3D0Aaux2HondveSozS+2qHUd93qzAQvwPuVT9IEuv6MxWP8VGQ5igJBtn
         JrmEzx6Vx39fYuvjcb5vK/ak6RNfZSuFnzriFr573pK3Z1blyE32Xa6poPI/SRY3whJh
         Y5o5ynOipapIpnvecMYw2Fu6Gfm8lplcAwOJsO/uQnc+M9fjXpF1vn1KPddHBRaI1IV8
         2aUdsrNggQRSthTtFc+MYW45wbBd5AlbKkfGJcuLI78iliZehGxF8c0eZdMolzpgHZWs
         +yN73O21+K7+ADZjawshAYrev6uiZxz5CAxCs+jGZy+o6ZRCdq1C2ApHMmoTUi1eshdN
         n+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q3zPvVIMcLhE7BLwqgmHZIk2g3tz5ma+i24zz6Qyo/c=;
        fh=u+PFr8AuMNFpYwUddJoflMsmViE18aPAVFFMshr8I7U=;
        b=fAm/sit/jlesLdXCckt5z7p1ifgQChUmH057Pryz3UJP8SAn4riqxvv71iPS3gt6jy
         brAF7R8VEFMT/h11R5YeIBncVhwUFxicNrBsxTxjDyB59jckP8oGQ/cg8VpyBv5gz0pR
         allgTGAm3/ykw8xawtNHzFuY3eryxJY9zr9KrrvkjRp4Azd4CrTs+f8VrSxMMy+98oDu
         YVeCnY0u8Z/Vf9VqiyAGHjXMBP9pZ4r4+jy3FVi3dyXy1bD2f0525aC73Mv5c9B63WQK
         m0x0IviVILDlXoY9W8bz43LzZwxciRMNsKrzdsYqIrG4/mZKEJseTsel6abFEskSlwF4
         Wrxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W4QhkEQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020ac87511000000b0042bedf6ccdasi1732771qtq.16.2024.02.15.09.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W4QhkEQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag0J-0001zz-N7; Thu, 15 Feb 2024 12:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0G-0001p7-2m
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:58:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0D-0001Xh-QD
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:58:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4121954d4c0so5208355e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019908; x=1708624708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3zPvVIMcLhE7BLwqgmHZIk2g3tz5ma+i24zz6Qyo/c=;
 b=W4QhkEQxiPRlxEH5qhQ11n83Bcx417vXOO6suJ9noFNTocaJDAFJCQhhEJGiwoHlJh
 FV6dEfVf7kJCPZnapToNKBD4AKuhmuLsZ+roBexUB1KACZXvnug74YLphH9UYENgU4oy
 Pj9Ma8YvJiFXN0Aadt50LrPKokXw3VHRblbj7czalpZki0RUGR2rzCMYviao3oBbIKv0
 R9p4HNZbps4BhkJhsldt+FF/aqnlGFvCYmGjMuQj5NpR8UkCX8WFR5wjiZ7tS89qsXtx
 9W/vV6JK0MSznGpv14WQ1LhJVtNnm4NcVeo68LqW/TdTiQ+Txmod2igldmtEDnKjgnM0
 ozYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019908; x=1708624708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3zPvVIMcLhE7BLwqgmHZIk2g3tz5ma+i24zz6Qyo/c=;
 b=k7B5Eh6ueO8LWsuqIwYW+Fa/olJc1hsc06rLZAY5eXr2aAKMXilqdWrs1b9FgeXcOK
 FvFiA51WE+HO7Wg0CWjHWdQY9OpnsuLFnQWUwFarhfHGV/QIrD35cbD78A6E21dXY4LZ
 oi3c3JRUrdBitwKPIQtB3ETEcm59khf/6wuPyE5KsXU0poaqNKEIrsLuIG3J0BCaBOuo
 Mx/nuicHcOxL23RniYozr4QA3y2AE3s+HyWFZha95qm2rJXrBsIKT+coPqI0D2V6QyvJ
 uzVpJ1DCryV2FOHU4b6AfwGj8fIhuZrCCL9MWZr3VPQbNY5mF1WhAoOlSZbM2vXuqgHM
 0Naw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpJ1rCOY7j8Dte6ErFnese6lV/5Mn0oofTPMR3JyleSejUkC4mkOGgPpW6jT38M8AhTs5qRNX81PHXv7XSdwYBmI0K
X-Gm-Message-State: AOJu0Yw8AU6ZwfapfI15yOMv/+sn1fYFeZYa7YiGewzmDvFsm04+nyfN
 qUsbRG/S2s5VEU8gKdh6TP1Mr9Lp9rFUsg/1z/IyIZ8gQMLifrE5lFkdKpbSgn4=
X-Received: by 2002:a05:600c:358c:b0:411:e0cd:9916 with SMTP id
 p12-20020a05600c358c00b00411e0cd9916mr5451880wmq.0.1708019907978; 
 Thu, 15 Feb 2024 09:58:27 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b00410ab50f70fsm5602288wmj.15.2024.02.15.09.58.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:58:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 05/56] hw/misc/mips: Reduce itc_reconfigure() scope
Date: Thu, 15 Feb 2024 18:56:59 +0100
Message-ID: <20240215175752.82828-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: TQ28JWDr6ixk

Previous commit removed the MT*C0(SAAR) helpers which
were the only calls to itc_reconfigure() out of hw/,
we can reduce its scope and declare it statically.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-3-philmd@linaro.org>
---
 include/hw/misc/mips_itu.h | 2 --
 hw/misc/mips_itu.c         | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index 5caed6cc36..3a7330ac07 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -79,6 +79,4 @@ struct MIPSITUState {
 /* Get ITC Configuration Tag memory region. */
 MemoryRegion *mips_itu_get_tag_region(MIPSITUState *itu);
 
-void itc_reconfigure(struct MIPSITUState *tag);
-
 #endif /* MIPS_ITU_H */
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 37aea0e737..db1220f8e0 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -86,7 +86,7 @@ static uint64_t itc_tag_read(void *opaque, hwaddr addr, unsigned size)
     return tag->ITCAddressMap[index];
 }
 
-void itc_reconfigure(MIPSITUState *tag)
+static void itc_reconfigure(MIPSITUState *tag)
 {
     uint64_t *am = &tag->ITCAddressMap[0];
     MemoryRegion *mr = &tag->storage_io;
-- 
2.41.0

