Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01219D5B85A
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Dec 2025 17:06:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVC1V-0002ss-Sx; Mon, 15 Dec 2025 12:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vVC1J-0002mV-9Y
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 12:06:03 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vVC1F-0006Nq-IL
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 12:06:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so24179575e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Dec 2025 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765818354; x=1766423154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dqEMUNpwCwHTOlA0/N2E0eE6wBHpfqJOJYF7Yrn5T4=;
 b=k3Y6BthuytoizW6KhtEKd6k2Ju36FRGSJjbNlXvb33dDsQbPkM7rfDx1/iVR3Eci7R
 1z6F6jgc/7riBZKYcC/U//Kbmsaz1Rx52SabcUAGli7CoXXXEfMcWwTCJUn6KZuzU7YO
 KDgDTFKCWWf5xKR9huh/TT9r4PHdb/3mWwmXyyGKzBIhMtdrnOxTzDm3gOPtnP4JJVBW
 SDPShfm4Bhu7OkoIiQIgqxAg8ruro3BcjeVKtwwUPScbr5dQZENPOCDWPdvKwAQ+zxAw
 /Y71xmuMHs/qdo5eAfuTG4+Ul9lI4mZxAhsVf2D3bRmotQV6pSpWFGIbkHaMdGqYHLkE
 i+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765818354; x=1766423154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dqEMUNpwCwHTOlA0/N2E0eE6wBHpfqJOJYF7Yrn5T4=;
 b=Tt1/vhoPejRMKA0BGNlNY/6ZTunZIxuxZYLIDRA5rjnwZuURMgr8iNyXj2asS7f9QK
 J71i/dfAwvUc5OTR+eZosk0AnOAXn/jyNyzrG9IdLhSvV3VIFA04nbq2BFe1taOp/Mij
 LR27NtAJ42AujhiEkLF14OPVcMlDivMAthRkd/2Qm+rEKKjz6c6E6SyL0IbYLZC7lAiC
 /3dMSHxF1ek1gRXS0Z9ilkxTx67fRJtE0MWL0dTSGpgALcSUQIeIlhxayb0KJWwy2RHc
 aZ9eE2GBftCr2RrYmgppzJowk5+MJBh524JfnWKorfRv3yE4TZpTZvUPTACBgbqAAd6q
 3eaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTQShIt4m6LsDXay5pVRzZ72U7cjKbZTqWnmO5Pq3kOwK5MJyLTxSZAe5KuqNp0kvkQIIqE2DCSQ==@nongnu.org
X-Gm-Message-State: AOJu0YxqHCqemtSUvN1xjfPEGvmFLfMu/BKdNaGWv1nx8m+Y7YONjlMC
 xJ69NIlMhkNfek1PrA16S4lccW5AwxPiAZABNqHtNwB5oSDgT2H+tibIZrc2CX9rJSI=
X-Gm-Gg: AY/fxX5HI6O7QWSSSGaMz3wh9RzbphrDAxVBvGrkLO7Supj4/O5yEg5825JFZaMdheg
 jA3WFKJz30j8pm5+2A1uzPl8UsCqu6DJQQ/KgLyio0iSb8oQ5uqcLqCuckJP2hWigvfu28h+84R
 M2MYXeeYsNjWzYxyHNlCESmc1rMCGLyaj0EC/fZKR+9ZiogPDkDecZHCNE36dl6DTgKm0hIavaY
 9s7OicloTDfpnWcRgvn2GuH9tcI6+Nv3KXl62dIOvQNnOFVt+0UqYP2cIE+Fy+q1WDmZ3ea92IK
 FtrNYs2LIFOHFUA/aPU+q2ilgc5m8hj0t9b95gywWVfxdp8zzCcR5gVl+punEHS3pJPYy1cvkY3
 E9itdLJVMm/7PgGE+qPzHxUsCVlC9af2wnHaiLcagoPTPocLF2UxvxrRQ85+fk3nkaPwDgp4VFB
 FIOgIRJuV6Tu+/7CAtwgbXuQ==
X-Google-Smtp-Source: AGHT+IHFXArWI2TH85/gV1oVeEQJcXaIHNpjqJT0RSVFh2ZuoDUlpWnqog15JV1E3++Bes9P0342SQ==
X-Received: by 2002:a05:600c:3ace:b0:46f:b32e:5094 with SMTP id
 5b1f17b1804b1-47a8f915c57mr96998455e9.32.1765818353701; 
 Mon, 15 Dec 2025 09:05:53 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a66b1fsm32290177f8f.9.2025.12.15.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 09:05:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 272685F856;
 Mon, 15 Dec 2025 17:05:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM PrimeCell and...)
Subject: [RFC PATCH] hw/misc: make the tz-ppc-port names more useful
Date: Mon, 15 Dec 2025 17:05:48 +0000
Message-ID: <20251215170548.2594651-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The TrustZone peripheral protection controller (tz-ppc) sits between
peripherals and the main system. However this results in "info mtree"
looking at bit confusing, especially as the sequence numbers can
overlap and miss steps:

      0000000000000000-ffffffffffffffff (prio -2, i/o): system
        0000000000000000-00000000003fffff (prio 0, i/o): tz-mpc-upstream
        0000000000400000-00000000007fffff (prio 0, i/o): alias ssram-0-alias @tz-mpc-upstream 0000000000000000-00000000003fffff
        0000000028000000-00000000281fffff (prio 0, i/o): tz-mpc-upstream
        0000000028200000-00000000283fffff (prio 0, i/o): tz-mpc-upstream
        0000000040080000-0000000040080fff (prio 0, i/o): iotkit-secctl-ns-regs
        0000000040100000-0000000040100fff (prio 0, i/o): tz-ppc-port[1]
        0000000040101000-0000000040101fff (prio 0, i/o): tz-ppc-port[2]
        0000000040102000-0000000040102fff (prio 0, i/o): tz-ppc-port[3]
        0000000040103000-0000000040103fff (prio 0, i/o): tz-ppc-port[4]
        0000000040110000-0000000040110fff (prio 0, i/o): tz-ppc-port[0]
        0000000040111000-0000000040111fff (prio 0, i/o): tz-ppc-port[1]
        0000000040112000-0000000040112fff (prio 0, i/o): tz-ppc-port[2]
        0000000040113000-0000000040113fff (prio 0, i/o): tz-ppc-port[3]
        0000000040200000-0000000040200fff (prio 0, i/o): tz-ppc-port[5]
        0000000040201000-0000000040201fff (prio 0, i/o): tz-ppc-port[6]
        0000000040202000-0000000040202fff (prio 0, i/o): tz-ppc-port[7]
        0000000040203000-0000000040203fff (prio 0, i/o): tz-ppc-port[8]
        0000000040204000-0000000040204fff (prio 0, i/o): tz-ppc-port[9]
        0000000040205000-0000000040205fff (prio 0, i/o): tz-ppc-port[0]
        0000000040206000-0000000040206fff (prio 0, i/o): tz-ppc-port[1]
        0000000040207000-0000000040207fff (prio 0, i/o): tz-ppc-port[10]
        0000000040208000-0000000040208fff (prio 0, i/o): tz-ppc-port[11]
        0000000040209000-0000000040209fff (prio 0, i/o): tz-ppc-port[2]
        000000004020a000-000000004020afff (prio 0, i/o): tz-ppc-port[3]
        000000004020b000-000000004020bfff (prio 0, i/o): tz-ppc-port[4]
        000000004020c000-000000004020cfff (prio 0, i/o): tz-ppc-port[12]
        000000004020d000-000000004020dfff (prio 0, i/o): tz-ppc-port[13]
        0000000040300000-0000000040300fff (prio 0, i/o): tz-ppc-port[0]
        0000000040301000-0000000040301fff (prio 0, i/o): tz-ppc-port[1]
        0000000040302000-0000000040302fff (prio 0, i/o): tz-ppc-port[2]
        0000000041000000-000000004113ffff (prio 0, i/o): tz-ppc-port[0]
        0000000042000000-00000000420000ff (prio 0, i/o): tz-ppc-port[5]
        0000000048007000-0000000048007fff (prio -1000, i/o): FPGA NS PC
        0000000050080000-0000000050080fff (prio 0, i/o): iotkit-secctl-s-regs
        0000000058007000-0000000058007fff (prio 0, i/o): tz-ppc-port[0]
        0000000058008000-0000000058008fff (prio 0, i/o): tz-ppc-port[1]
        0000000058009000-0000000058009fff (prio 0, i/o): tz-ppc-port[2]
        0000000080000000-0000000080ffffff (prio 0, ram): mps.ram

So as a quality of life feature lets expose the name of the underlying
region so we get something more useful:

    0000000000000000-ffffffffffffffff (prio -2, i/o): system
      0000000000000000-00000000003fffff (prio 0, i/o): tz-mpc-upstream
      0000000000400000-00000000007fffff (prio 0, i/o): alias ssram-0-alias @tz-mpc-upstream 0000000000000000-00000000003fffff
      0000000028000000-00000000281fffff (prio 0, i/o): tz-mpc-upstream
      0000000028200000-00000000283fffff (prio 0, i/o): tz-mpc-upstream
      0000000040080000-0000000040080fff (prio 0, i/o): iotkit-secctl-ns-regs
      0000000040100000-0000000040100fff (prio 0, i/o): tz-ppc-port[gpio0]
      0000000040101000-0000000040101fff (prio 0, i/o): tz-ppc-port[gpio1]
      0000000040102000-0000000040102fff (prio 0, i/o): tz-ppc-port[gpio2]
      0000000040103000-0000000040103fff (prio 0, i/o): tz-ppc-port[gpio3]
      0000000040110000-0000000040110fff (prio 0, i/o): tz-ppc-port[pl080]
      0000000040111000-0000000040111fff (prio 0, i/o): tz-ppc-port[pl080]
      0000000040112000-0000000040112fff (prio 0, i/o): tz-ppc-port[pl080]
      0000000040113000-0000000040113fff (prio 0, i/o): tz-ppc-port[pl080]
      0000000040200000-0000000040200fff (prio 0, i/o): tz-ppc-port[uart]
      0000000040201000-0000000040201fff (prio 0, i/o): tz-ppc-port[uart]
      0000000040202000-0000000040202fff (prio 0, i/o): tz-ppc-port[uart]
      0000000040203000-0000000040203fff (prio 0, i/o): tz-ppc-port[uart]
      0000000040204000-0000000040204fff (prio 0, i/o): tz-ppc-port[uart]
      0000000040205000-0000000040205fff (prio 0, i/o): tz-ppc-port[pl022]
      0000000040206000-0000000040206fff (prio 0, i/o): tz-ppc-port[pl022]
      0000000040207000-0000000040207fff (prio 0, i/o): tz-ppc-port[arm_sbcon_i2c]
      0000000040208000-0000000040208fff (prio 0, i/o): tz-ppc-port[arm_sbcon_i2c]
      0000000040209000-0000000040209fff (prio 0, i/o): tz-ppc-port[pl022]
      000000004020a000-000000004020afff (prio 0, i/o): tz-ppc-port[pl022]
      000000004020b000-000000004020bfff (prio 0, i/o): tz-ppc-port[pl022]
      000000004020c000-000000004020cfff (prio 0, i/o): tz-ppc-port[arm_sbcon_i2c]
      000000004020d000-000000004020dfff (prio 0, i/o): tz-ppc-port[arm_sbcon_i2c]
      0000000040300000-0000000040300fff (prio 0, i/o): tz-ppc-port[mps2-scc]
      0000000040301000-0000000040301fff (prio 0, i/o): tz-ppc-port[i2s-audio]
      0000000040302000-0000000040302fff (prio 0, i/o): tz-ppc-port[mps2-fpgaio]
      0000000041000000-000000004113ffff (prio 0, i/o): tz-ppc-port[gfx]
      0000000042000000-00000000420000ff (prio 0, i/o): tz-ppc-port[lan9118-mmio]
      0000000048007000-0000000048007fff (prio -1000, i/o): FPGA NS PC
      0000000050080000-0000000050080fff (prio 0, i/o): iotkit-secctl-s-regs
      0000000058007000-0000000058007fff (prio 0, i/o): tz-ppc-port[tz-mpc-regs]
      0000000058008000-0000000058008fff (prio 0, i/o): tz-ppc-port[tz-mpc-regs]
      0000000058009000-0000000058009fff (prio 0, i/o): tz-ppc-port[tz-mpc-regs]
      0000000080000000-0000000080ffffff (prio 0, ram): mps.ram

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jim MacArthur <jim.macarthur@linaro.org>
---
 hw/misc/tz-ppc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index e4235a846d4..fd305f9f62f 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -273,7 +273,7 @@ static void tz_ppc_realize(DeviceState *dev, Error **errp)
             continue;
         }
 
-        name = g_strdup_printf("tz-ppc-port[%d]", i);
+        name = g_strdup_printf("tz-ppc-port[%s]", memory_region_name(port->downstream));
 
         port->ppc = s;
         address_space_init(&port->downstream_as, port->downstream, name);
-- 
2.47.3


