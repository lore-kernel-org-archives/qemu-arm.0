Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2680977njc;
        Thu, 12 Jun 2025 17:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/UGffKvRMbleQ9bHKG8jnygDqouCs97KDlh8S8ki4vez81GN3zbNWMeTmpNXslIqDWFv0uujjMbB/7A==@linaro.org
X-Google-Smtp-Source: AGHT+IF4E5yRC/DaKK/3g+LKBCCkhNB40AnLqVFRPz92XZ5r0Kwvu7XNeN2A2m/75o4YOpzTx7s9
X-Received: by 2002:ad4:5be5:0:b0:6fa:fe02:81ff with SMTP id 6a1803df08f44-6fb3e58ae7bmr13724296d6.3.1749773224397;
        Thu, 12 Jun 2025 17:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773224; cv=none;
        d=google.com; s=arc-20240605;
        b=lYCQcpw3l0jSw11m2bsd7lEjoEPZeoBPI7lz9Cz9mlC8jyI5SoSkTAz05BGkJNGE8V
         OKCe1dRXx0DH8yI+y6X/niYrwGrMXEhf50bisQt+e6LdzSVPociEKS+V78wuVOsQ85qk
         HPYcQ7dcTmeflH8RjrATJkL0+e/83WukIq/XJL0dj+Tl+Wt0lMqSd3OBC5DOdjv4zGgy
         i24r2aFbvgNniT+/puvi/Os3Ivwgnk8yVQtMmthnLlLHU6xbU73kSaoScX0o20exH+5e
         hk7R2lWS6wTBWaCmM8yAT5F6NrmLvvH8Nf6a2Xim0qK3FfmMfbI3nOKqhJlu5dqmc/3z
         IBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=+3D32wRripWDGh37R/51W0a4xFipOjv3ijoy2qH+SOM=;
        fh=1b6F2JOO+lGG64QddKi9UPiY2aOM6XvoBH2yuEmOp3U=;
        b=hya+GovyQv4D+zpiivK+hdw4vHKw2nTBSSNvCE2MyXhfDfigdffEb8qxyWT3CVcLto
         HX2jf5Kcg1aIhy4nT1D2xfdlxkU0Vd5DidTYS/lRZtHMPgDB7IiWm5/R0aXfGE2ZY4dK
         0GGfKfem9CBKdjeoBbLIffMWXcD46PT9vds9vcZ1d/01s0gEf+NvprYDQfZNS/upCcJz
         FiA4S2OXqc3J8ZHSk7YpEhkc6gyxS7tDpo4rUzC3GDk8X4+pEwdlvHNiO27bKemIC84M
         c0KwmmgPiWld+uk4weSfX4AHkwZknDJWkLcuFqRtQ7NoSpYNc0rdM/QgyugSPgTGKNjV
         4diQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=U9+wVJUn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a730da3785si4662501cf.524.2025.06.12.17.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=U9+wVJUn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPruR-0005s0-ID; Thu, 12 Jun 2025 20:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BGtLaAcKCFE37547w1z77z4x.v759x5D-tA5676z6D.7Az@flex--komlodi.bounces.google.com>)
 id 1uPruC-0005os-Gj
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:24 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BGtLaAcKCFE37547w1z77z4x.v759x5D-tA5676z6D.7Az@flex--komlodi.bounces.google.com>)
 id 1uPruB-0000Y2-25
 for qemu-arm@nongnu.org; Thu, 12 Jun 2025 20:04:24 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b2c00e965d0so938007a12.2
 for <qemu-arm@nongnu.org>; Thu, 12 Jun 2025 17:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773061; x=1750377861; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+3D32wRripWDGh37R/51W0a4xFipOjv3ijoy2qH+SOM=;
 b=U9+wVJUn3EXHBhrOR7Qsxnmy9VL3KdOa8UCfJB0Btl16YxtcT9n4keRXA2BQ7ImlDQ
 WI84BvyvpQmw3ywtsmyvYDRLzxCiMMiTLWJp+7FCqobSJ26XkZ+VzgSFN7JqzV5e2wZw
 S1qFqmufdFpoKy8EgJpDxq/IYE934yILnlJLSx7OOfYVFwhmFpy1udfZoABr30RGaB9g
 l/l9Rlb0UX1fM9IJlWb17WsU3R9i2sLI7I1kvC8fBeyk0uEZ7qDh3Y0wAP/WOQa+Pxie
 sz2eKEVrA4saEEdmu+VcA3ApRWCs++cirKF6gHWDwz6tuyfnd2M5N0vlsHU8qh5Vz3t8
 56FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773061; x=1750377861;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3D32wRripWDGh37R/51W0a4xFipOjv3ijoy2qH+SOM=;
 b=k1P7jkwob6uNYPYoyYrwBrLO1TZVo+rCanad+D/eACaRJkn5veo8z7kajvlYx3eVVM
 4V0QfTXtCP9laJaBA5LM8Qho7Hva+4li1L0tvYdnEcR5f7AtUQya0UTQMvmtby8dgjnn
 dI+3cmtbBOEovvuKyhok6JZKAOT/qwd15jz0B7Jkbk+jcPmrW1SfK2d+mxSu5p/CcDzI
 RwStUAtyybQu52/03OPaLO7ZtmjR86HlvQbHV2ipkT/ILlcv+LP5lTJ969PGvWKNqtpr
 rUxeHtVLry7YxthiBbEokxr3J98SMvNvumfeTV5fA7NrflpZXiq9gmnd8aFj7CUuHh5t
 Q2YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr8+1o+uSEKtDrFYIu7sBOgXJRhujDuEJN8A7mk7EtLUGINiBa8MF6a6A04hCpY2lK51RK42lebg==@nongnu.org
X-Gm-Message-State: AOJu0YzzBw9qnEjI1tDkyC+rS64cPdoObJaV+Wv9/AXpMhWbdHX9WkFG
 DCPFVfXjRIfggjCkMii9K7aK0548Zrl2NbzN00vgWZEFxqxtKzveXsag6NszLsIq86ldEluuYoz
 KtnGRh42aBg==
X-Received: from pgah7.prod.google.com ([2002:a05:6a02:4e87:b0:b2e:b684:1f9e])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a25:b0:218:96ad:720d
 with SMTP id adf61e73a8af0-21facbba984mr1179219637.1.1749773060836; Thu, 12
 Jun 2025 17:04:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:03:58 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-7-komlodi@google.com>
Subject: [PATCH 06/19] hw/i3c/dw-i3c: Add more reset values
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3BGtLaAcKCFE37547w1z77z4x.v759x5D-tA5676z6D.7Az@flex--komlodi.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: Yogwd5IWkXpA

Adds reset values for the new registers added.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/dw-i3c.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/i3c/dw-i3c.c b/hw/i3c/dw-i3c.c
index b252903ea4..845fbd5efd 100644
--- a/hw/i3c/dw-i3c.c
+++ b/hw/i3c/dw-i3c.c
@@ -285,14 +285,32 @@ REG32(DEVICE_ADDR_TABLE_LOC1, 0x280)
     FIELD(DEVICE_ADDR_TABLE_LOC1, LEGACY_I2C_DEVICE, 31, 1)
 
 static const uint32_t dw_i3c_resets[DW_I3C_NR_REGS] = {
-    [R_HW_CAPABILITY]               = 0x000e00bf,
+    /* Target mode is not supported, don't advertise it for now. */
+    [R_HW_CAPABILITY]               = 0x000e00b9,
     [R_QUEUE_THLD_CTRL]             = 0x01000101,
+    [R_DATA_BUFFER_THLD_CTRL]       = 0x01010100,
+    [R_SLV_EVENT_CTRL]              = 0x0000000b,
+    [R_QUEUE_STATUS_LEVEL]          = 0x00000002,
+    [R_DATA_BUFFER_STATUS_LEVEL]    = 0x00000010,
+    [R_PRESENT_STATE]               = 0x00000003,
     [R_I3C_VER_ID]                  = 0x3130302a,
     [R_I3C_VER_TYPE]                = 0x6c633033,
     [R_DEVICE_ADDR_TABLE_POINTER]   = 0x00080280,
     [R_DEV_CHAR_TABLE_POINTER]      = 0x00020200,
+    [R_SLV_CHAR_CTRL]               = 0x00010000,
     [A_VENDOR_SPECIFIC_REG_POINTER] = 0x000000b0,
     [R_SLV_MAX_LEN]                 = 0x00ff00ff,
+    [R_SLV_TSX_SYMBL_TIMING]        = 0x0000003f,
+    [R_SCL_I3C_OD_TIMING]           = 0x000a0010,
+    [R_SCL_I3C_PP_TIMING]           = 0x000a000a,
+    [R_SCL_I2C_FM_TIMING]           = 0x00100010,
+    [R_SCL_I2C_FMP_TIMING]          = 0x00100010,
+    [R_SCL_EXT_LCNT_TIMING]         = 0x20202020,
+    [R_SCL_EXT_TERMN_LCNT_TIMING]   = 0x00300000,
+    [R_BUS_FREE_TIMING]             = 0x00200020,
+    [R_BUS_IDLE_TIMING]             = 0x00000020,
+    [R_EXTENDED_CAPABILITY]         = 0x00000239,
+    [R_SLAVE_CONFIG]                = 0x00000023,
 };
 
 static uint64_t dw_i3c_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

