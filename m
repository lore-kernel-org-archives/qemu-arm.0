Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3787119lfq;
        Tue, 12 Jan 2021 10:36:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw04DQp7pPWHUj6kzCmoCWk9laQoRO+ITECM+dnpKb3Ihh3z0BxIX96dx6Op+oVuCeO1cGb
X-Received: by 2002:a25:7452:: with SMTP id p79mr1078538ybc.23.1610476612615;
        Tue, 12 Jan 2021 10:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610476612; cv=none;
        d=google.com; s=arc-20160816;
        b=aHWT0IwXA5wfIZbyUwwjfu8xAcCg5LK/8mkbeXZDBWcmWtGkmTFliEcECM9ShuRh4W
         kGXfsEYP/UDSODvTb0EchRRmDI2TMgYu0B4PNKjDcLUA4+ft9BR3QDuh198RyGosFVo1
         SU2rfQr+1VOUs41K3ys3U71bnP009MY7XL1N1GFo2aQieG7lyoQyptBqNjkyrXlBTZs1
         1Sf9ysyUYmfNndH2PZaoSkjudXEFx4pvPTQW1XtgfO9iPtm7/MKNxe3HoLUz4fsVMOSr
         JE+eXytq+tA+b6Gt5MVRURZZB7yvdsnd8L+iI2osD5unMlL6wwsPyzUX0GHXTLiUw1tc
         HLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=R0MM0ZvXm81S3gxFhlsST007qT204dpEehr2O4ofqxQ=;
        b=kgJMthahI8OBZ19MP21zfM52P6yddGh2a+CqJRaWW6gG+I6Lsj+D/bsSWAtqYnr9Og
         cgC5dofhRVb61a0Doh1dUsSJI2tVPVTQ4MQ1A2uIsYLksT8cFheOE5C8gY0jOUOGXty9
         GV0xuykij/fiMlY2Pr5VCGDWkHXE3v5QsV0EdqfKqAO98AtJvDuePKbvoGmVHV/dax22
         E0f0wks7ziD/Dra/BukbaX4Bx0XJIxRozd/7bB/Vh/9pxRooOpne9KXya8+ag4uI9kLM
         wnigYklJkMIqSTCOu3EC+t7FWG4D3ZrsjqGvMlbKi/opvBB95egHQ9dfGzjdZw5KVVXg
         Yh/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KjFZd81u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j188si3316581ybj.484.2021.01.12.10.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 10:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KjFZd81u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzOXD-0001Na-TM
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 13:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWW-0001Kt-Ka; Tue, 12 Jan 2021 13:36:08 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWV-0007Ma-4N; Tue, 12 Jan 2021 13:36:08 -0500
Received: by mail-ed1-x529.google.com with SMTP id h16so3452689edt.7;
 Tue, 12 Jan 2021 10:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0MM0ZvXm81S3gxFhlsST007qT204dpEehr2O4ofqxQ=;
 b=KjFZd81utKeR/XF08XMBeTVS9v7vUehzuq1k00/ZDOdHUVHbexNITTyQzD8t9rnSLI
 RU3252frLzqIYQB3voniiNW+NJfI7NA+68e3c+ZcpPtOaPF1ZIZmJnFc5EreipzHs0KN
 AS3PvI/ukfRcgkE9gWQrBOQxMVr0+QCOJq295MUREv8TEqcc8FeKat9gvYfYffg+jmW8
 t/sBZJ6GcEvlTZlr2J34IO1VJ+OwAoxpGa2MKlHTfGy5nngPsbyBncpSzC/qZnm4BlUr
 9fWVahkQ+b3s2mPXWn8Ck5TNSd8IP4euMjv8w47TNvIkKtPUTWWALx2fTOvk1jftc3TY
 tA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R0MM0ZvXm81S3gxFhlsST007qT204dpEehr2O4ofqxQ=;
 b=MbdwDwYPma1NPjjv1qggLE2fL6BjmwJDSYHAN6+WLXmztJXuUUMt+gmidvrBWPMEH2
 GGEH4U8u7MH2Z+jLlQF3C8gmJKEZxzk7uF1at75EMqcE9uvJNT23zzj5L5wE1zb1s6ZN
 mTxv/nkxZx884ythKHvMo59to1n79u0RknBLAGpI0YXOXLnHotsC9oyxSiH/7O9JS+kv
 VJ3rCXobWswvGIT7o3hNcL7eEZt8HlDS+TviksPIThlkcKP67AQKUUvyGDOD0YVivWry
 Yaed8Yl+XA5Xa+QTV+UxF+gGvpTSxIvNdGfEWgBRLTwixOnD4dyM0c2e3uFtgVpp7R/H
 uLDQ==
X-Gm-Message-State: AOAM532M9Mj2VVCcW0chPhy55vY3tfFUePPwun1LKBG7/qzk1zN3RlKs
 +FUtszERGJtRaMAJXjJrMEcJaxmF77Q=
X-Received: by 2002:a50:8a90:: with SMTP id j16mr364550edj.334.1610476565506; 
 Tue, 12 Jan 2021 10:36:05 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id bo20sm1862004edb.1.2021.01.12.10.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:36:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 04/11] hw/ssi: imx_spi: Reduce 'change_mask' variable
 scope
Date: Tue, 12 Jan 2021 19:35:22 +0100
Message-Id: <20210112183529.2011863-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SC8wwXk16QPI

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/imx_spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 35ab33c0511..bcc535f2893 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -303,7 +303,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMXSPIState *s = opaque;
     uint32_t index = offset >> 2;
-    uint32_t change_mask;
 
     if (index >=  ECSPI_MAX) {
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
@@ -313,7 +312,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_imx_spi_write(index, imx_spi_reg_name(index), value);
 
-    change_mask = s->regs[index] ^ value;
 
     switch (index) {
     case ECSPI_RXDATA:
@@ -357,6 +355,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         }
 
         if (imx_spi_channel_is_master(s)) {
+            uint32_t change_mask = s->regs[index] ^ value;
             int i;
 
             /* We are in master mode */
-- 
2.26.2

