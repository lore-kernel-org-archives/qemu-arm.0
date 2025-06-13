Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2680780njc;
        Thu, 12 Jun 2025 17:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8EQNB8FZsRKESBD8iXtjuonqt2/jpoSGnUEP3Ow36IZccq4C15wKGEphVoaGTPVVft8/YBeqiolmPmA==@linaro.org
X-Google-Smtp-Source: AGHT+IFsToCFMFoWU+hwr0VDYKb4BS4fpLQdEtbxuVcXfx2FxCJrXJ6WnGhWAGCEDZBeF7hMTD4u
X-Received: by 2002:a05:622a:4a8a:b0:4a3:398d:825c with SMTP id d75a77b69052e-4a72ffab767mr18184291cf.48.1749773196735;
        Thu, 12 Jun 2025 17:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749773196; cv=none;
        d=google.com; s=arc-20240605;
        b=KBpkqSWmN3pPzGHGh3nQ//CnKpPJGN1y9m4JgRoqeBNlbcAvLBfrwBTrYGL/jeVUVf
         ABdrmYI8FbZbouxAEQLHTl3DeJflAKNRwJlyi43T75pgbDP3YEB34w2ihjUFXUvfLo1R
         pJAENFgSq7sZW++xoQWa8rY8AZ3ZAYtqxSWO39eb2sCstho6qdENy9TZxsrQ9vamReds
         N4QNIVWwIn83kdjRm5GP0LRh7MteNYrmlDhSeAHeWzBaIytNnX3kopYdCN/Mf06bLTmR
         7Ti7NmDXNxO25LMlbrnuqXlkfPltDv7wcQrba7HqxlMsFA7Ww7PCtMMVIBpCaSl7okAV
         BGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=bGxi0+b2ieHBb3xRNVEv/9JKjepFFVub1/UswMe9fwo=;
        fh=jmB336zVDilutUuU09TXLNZ6TFwRas8MQn/v9+Y+T0w=;
        b=NX/H56YhJkoNyEGoexIfteZ/yyFHT71uR1v0hq4nHjHNirCF6ep6ZQOXG0HFDCVoAp
         yLuUc61WpHzYkW6NxkmOPmev4fMOXlZqRwYFd6kb6EeUDsZo3UQqV/zYLa2RGztVI9zj
         knZoworh5lmNnltoFgOc+VQI7TKTDvCC1tsUksxa3M5BZHD1m/baTsjBhKpQ6rERE0ze
         cE0Ikj/ZwWIKrGaLvQfSIeQnSFVf+3ZJtLlYnnfedKq9noKKpYkzhnlo/US6CzgyHC0h
         +Uh52ulRFsSI0d6dtw8rBOu2uOZUb06tawAqu7xvWjWJVI/OgaPaCSqxcbRhqedGR8qW
         23JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3gjmOgRq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4e1440si17589061cf.446.2025.06.12.17.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 17:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3gjmOgRq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPrvJ-0006SR-Ho; Thu, 12 Jun 2025 20:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CmtLaAcKClc9DBAD275DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--komlodi.bounces.google.com>)
 id 1uPruI-0005rB-Ax
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:31 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CmtLaAcKClc9DBAD275DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--komlodi.bounces.google.com>)
 id 1uPruG-0000a3-L2
 for qemu-devel@nongnu.org; Thu, 12 Jun 2025 20:04:30 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2365ab89b52so5026945ad.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jun 2025 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749773066; x=1750377866; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bGxi0+b2ieHBb3xRNVEv/9JKjepFFVub1/UswMe9fwo=;
 b=3gjmOgRqwpEeQ4+ZUxnKZCXqdUCux0gW/uF15+pzQ2sZRZKloX/9Em65LU2yfijvTO
 +1yxpop18yOQHvq6/xQkNpNhiBjngrGGNhDPtpd8aO5mCfvP8tPcVUQmTt/R0VAlCWc4
 wGJQ9fwPYTMr/VXnlbjEV8u+cEYJD2Uar0ZDN7QMUPxSggTgOuhA60DFTE/3kOzYmM2q
 BIN/stQPRHNAn+3kmrKXlx8I+HgTd99hxafjMJvDGWI9GjczIltNA+JXA/yEfwU6Fj0R
 NvZfL7lOT8Zt1eZi6zbM72SRqCGxPrpySaAvOajY6EvbKn2+uXvuEkwYg6HQIsunOvPa
 9Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749773066; x=1750377866;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bGxi0+b2ieHBb3xRNVEv/9JKjepFFVub1/UswMe9fwo=;
 b=Fe3/yzSLAfI8OLbfb27g4Vbrtc+8JqY+zc4g6mg2J6GOCuZVidHQiLzzu821gQdxhu
 Dv70i+45d2WGnePnbLn2Inm2M7pIdeY5ZbIjBCPacjkrQASthfJpQPkz3TkVzoygZjV8
 0Ld1p4XNTiq/ddnfjcUWGeriAgMgtWWzz0qhSbcdg/8RAFETc2z8rVfn9zQWA0LeO0OI
 7AKhaStSkN8rLyUfEUnv0MelrjSA7yLeRstzVDh044LYWucb9PvJTTiCKcmPk4bMToAu
 v/T3qDu0+Kc2Cwxq8pBpaoLLSz9yiQQ25guyxabbp/wea11gDxgGEyEp+IuCaqxsMPDT
 9mIA==
X-Gm-Message-State: AOJu0Yxv+4CDoWbMMioERQin5EYk9hg/4sP79YOzAMr0NAaai/2CzS6/
 wpTiUS8FGlsVzuKe4WQIOx7FIv/McWXNDqFtWjbWOCl0X2T23oG6e4JAWzZPas9+koo2c0UH1Ll
 goIbEI+I2ppw42LXWprx4o/wolOwmyE2cql8gEz+TMm7JCm0b/duI+XmOa54AppS7/kpRwlRN3G
 DaXN/gPs7HoU2hCUCuSGWPbUZDPn4O0m8stt0D9Had
X-Received: from pgb23.prod.google.com ([2002:a05:6a02:3417:b0:b2c:4d40:79b9])
 (user=komlodi job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f689:b0:235:ea0d:ae21
 with SMTP id d9443c01a7336-2365dc09ad7mr14535485ad.35.1749773066491; Thu, 12
 Jun 2025 17:04:26 -0700 (PDT)
Date: Fri, 13 Jun 2025 00:04:02 +0000
In-Reply-To: <20250613000411.1516521-1-komlodi@google.com>
Mime-Version: 1.0
References: <20250613000411.1516521-1-komlodi@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613000411.1516521-11-komlodi@google.com>
Subject: [PATCH 10/19] hw/i3c/dw-i3c: Use 32 bits on MMIO writes
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, clg@kaod.org, 
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.com, 
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3CmtLaAcKClc9DBAD275DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hM1AQKOAIvXk

The registers are only 32 bits wide, so we should cast the 64-bit value
passed in to only be 32 bits wide.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i3c/dw-i3c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i3c/dw-i3c.c b/hw/i3c/dw-i3c.c
index bf51c00935..ecd79aba8c 100644
--- a/hw/i3c/dw-i3c.c
+++ b/hw/i3c/dw-i3c.c
@@ -380,10 +380,11 @@ static void dw_i3c_write(void *opaque, hwaddr offset, uint64_t value,
 {
     DWI3C *s = DW_I3C(opaque);
     uint32_t addr = offset >> 2;
+    uint32_t val32 = (uint32_t)value;
 
     trace_dw_i3c_write(s->id, offset, value);
 
-    value &= ~dw_i3c_ro[addr];
+    val32 &= ~dw_i3c_ro[addr];
     switch (addr) {
     case R_HW_CAPABILITY:
     case R_RESPONSE_QUEUE_PORT:
@@ -409,7 +410,7 @@ static void dw_i3c_write(void *opaque, hwaddr offset, uint64_t value,
     case R_RESET_CTRL:
         break;
     default:
-        s->regs[addr] = value;
+        s->regs[addr] = val32;
         break;
     }
 }
-- 
2.50.0.rc1.591.g9c95f17f64-goog

