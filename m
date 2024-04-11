Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp854232ejc;
        Thu, 11 Apr 2024 03:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXksxZKSIA3qJh35te7B6mmADUgpt3mXwhBbCztFxUQ+QMvltvD0OPMzkiPsLxQ+LST2SvIQCl+fS99Xto/8U8fA75NMK8Q
X-Google-Smtp-Source: AGHT+IF+Vec/86VjdJjup7+saVrfjHwf7L2GGD+zPmFTTlfoDyFxQ/f5U5Sbt/lC3csDDrqdHqkt
X-Received: by 2002:ae9:f446:0:b0:78d:6150:fc16 with SMTP id z6-20020ae9f446000000b0078d6150fc16mr4731560qkl.33.1712830670967;
        Thu, 11 Apr 2024 03:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830670; cv=none;
        d=google.com; s=arc-20160816;
        b=CP68fyLsfMUar3OMRpscstIVxhx2M1cUSdNGxY4N10p+k4PK9fNpgA/QHjZFSaegn5
         qsCRCzA6LmWJFm0jQwUfeeYRvLcMxYv72uhZqX/0Lg3dFIcz5arncr5OQaWV9mpED4K0
         RdX16XpKvi+lOsdeelZOllJ0dGWrXQncfvN7ZxYcc04wzMoSl1Lrz15GmopJRsdsjf8K
         9SEhDwJIeDqoStDFcG9a//a38uZ9oZlX6mVzFhMe5jJD4vsGBddcoRQEkqaRj2yDWBa/
         T9Wj6PkQUyitwCMriT+novWpiIFFvcBMC20WJ33+D1CVg2tQqqWlhSWqUWyYIXXbLvNZ
         W0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=urm+Npyj3/f/E1cmlvhojimXxZbt++WU9CB9v2xORc4=;
        fh=uTBiEhTzp1kNucHHGCAS5oGgSgyR51XnqsaO8y3FJzk=;
        b=sAD4XvfOjKyofPX5PafeboNnt/0MjdnB21ENbA4BIXvVRTY6KLsMx7VZyVIpMtOs5V
         jysyCeuVwLFsLO1Cg0tTb/+E0/eQzgeNEnDvdnxIf3eb8xpIk3mvLlBH2UWfLk3Iwu+a
         iRwIHL75fMPs5sGp/k707IQMb2qeI4fa49Wv4nhltAcqNcXWlC6oEsKAgsW8Nc75NdOs
         R48J8q3BPFA53nEmJGWPdj80eb6CCTPdXL7c4HkkMhJhWux/TTcDXfjLWxRhwNsI5ERU
         7XolSCDr+AEZ4GvFZVb5+NksD7OVTspKs0qTyGxNiwqAswJqDsAVD6/vvSQXN+oTQ29X
         PFrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSBc6wG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t27-20020a05620a0b1b00b0078d6cab4f55si1216336qkg.571.2024.04.11.03.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OSBc6wG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurUy-0006KE-CW; Thu, 11 Apr 2024 06:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurUM-0005Mg-Gt
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:17:06 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurUH-0007bB-CP
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:17:01 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d700beb60bso123181311fa.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830614; x=1713435414; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urm+Npyj3/f/E1cmlvhojimXxZbt++WU9CB9v2xORc4=;
 b=OSBc6wG+2rBkcpRghqTREESEvkDIHxU1tiW/aopm0NA7XmJngLRzAOe6LpUUKgrLVU
 ruuGvQbRRl2zRHczezhHm1a1ncYO6IB1D/U3OMvxdygk6SBCL3D9LvtSACmuj/DFF5d6
 qxs+EhjitLV+NfXTjS2+Ra7MX91wYwTe4aqerPZeuPXGlNvEju3eZ0sqb03Qm8vF0tAi
 PLplMIXcntOsJpZNuzJrhuP6YguSjGggNrQL7ZILHAz25rn1vav7OqHgkTn8ggh/elck
 U3Xu/lU20+0Lxr4+KB8gFCrhgqtZI4hc7BqSjIWh5rPgWEO+zFKAxtGtpvD4DAxDdgAM
 NRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830614; x=1713435414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urm+Npyj3/f/E1cmlvhojimXxZbt++WU9CB9v2xORc4=;
 b=BJOluMO2QMzykmo4shH9lxLgcVBhmT8aLGT+oHa+6QHkSIdbQo9C1fif7WY2jb086Z
 JgO0leyOiNldxDRaOoyzChvjHokD0NH9WDfJy2+hsuETFNCPMVy+OHUhlafrrfs0CnBN
 +paHUwwcwlK3bUpQUyvSn4vhnZjCtqfnd4Q9U8TgExgkyIpxviY6YsefNGfG6CSz2iC2
 z7ySqDxXaud9tvpdd18NDVeW1NeJ1NfKpua+rnc5gsgqOCfUhCkz7eLJuzKilUhGvl3Q
 cqP0xUl2wl/5uswh9kYwK/QS1+x3Z/3Hyw8ZNgzpxjRpUML1oTK/zbuSk6OtaXwgADRk
 fgNA==
X-Gm-Message-State: AOJu0Yw3qboQi1D3H7Cx1UvLt9zFlwd4MDukW/+dlbYu9Nmc99ogEGXD
 6M2lhN4U2QHuRciLdAAqAUCkzYtPmoJpAhd1ep05DzopXyzPx7U4LjaDxJrGHuo=
X-Received: by 2002:a2e:9317:0:b0:2d8:5fe6:820d with SMTP id
 e23-20020a2e9317000000b002d85fe6820dmr4355192ljh.11.1712830613862; 
 Thu, 11 Apr 2024 03:16:53 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b0041665b6e111sm5064848wmb.12.2024.04.11.03.16.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 10/13] hw/scsi/scsi-disk: Use qemu_hexdump_line() to avoid
 sprintf()
Date: Thu, 11 Apr 2024 12:15:46 +0200
Message-ID: <20240411101550.99392-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sMkezbtZc6am

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Use qemu_hexdump_line() to avoid sprintf() calls, silencing:

  [105/169] Compiling C object libcommon.fa.p/hw_scsi_scsi-disk.c.o
  hw/scsi/scsi-disk.c:2659:14: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
        p += sprintf(p, " 0x%02x", buf[i]);
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-disk.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 4bd7af9d0c..4f914df5c2 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2648,16 +2648,12 @@ static const SCSIReqOps *const scsi_disk_reqops_dispatch[256] = {
 
 static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
 {
-    int i;
     int len = scsi_cdb_length(buf);
-    char *line_buffer, *p;
+    char *line_buffer;
 
     assert(len > 0 && len <= 16);
-    line_buffer = g_malloc(len * 5 + 1);
 
-    for (i = 0, p = line_buffer; i < len; i++) {
-        p += sprintf(p, " 0x%02x", buf[i]);
-    }
+    line_buffer = qemu_hexdump_line(buf, 0, len, false);
     trace_scsi_disk_new_request(lun, tag, line_buffer);
 
     g_free(line_buffer);
-- 
2.41.0

