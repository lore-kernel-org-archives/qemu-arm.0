Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A74CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:53:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENEa-0007qC-BV; Wed, 07 Oct 2026 04:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEJ61-0002RQ-HA
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:17:56 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEJ5p-0008Io-Bv
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:17:32 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5bb7c8f6501so777687e87.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791346643; x=1791951443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=07cFrgUM6cjvx6tpFpm8bpJgkAMQMVUlJURJV9H4y9I=;
 b=ceChdIb+kcGOsxTGDKvMxp4xMBW3Knm4/LNbh23p96/yulpZwzCQ9x9ACpaNaCpp2h
 cOWg1IQA5F6iTc9Y0GJJniub8nxpt9Zuifwl4TrVsg+O7OD4JaRcPiAgUGVoak4C+Iax
 xdUkvtepDARhyZC2OWTnrtzyku1jeSaoXkcwgcsqHtI3Wcq+ZsZH0dkVCOT/I6nD3bnw
 2xxurUU+f1Y3halBjsD/u/i7H0JvaubMqk94GJOWXtjM1SaW0yBR485jWOFbRoZ/TamN
 EU04KxsqMVlbHWxOMsr2g/xCWx/GVJmBQxORpnZCqx5SEiNhS52TmKQacAPuqv1ny2Va
 tWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791346643; x=1791951443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=07cFrgUM6cjvx6tpFpm8bpJgkAMQMVUlJURJV9H4y9I=;
 b=EHEhTiHqN//I7b9xv2RlRw0eLd00KZr0Lkg8JxT2r2ALPSSEiH1qGp6CZ0s3oZYC+4
 0GQm9yGuD9L2kkP4KHDThEXbLgmKaYZmrtqWQU0YTPSdGi7fcY/QKrqXONyDdeYKgwdl
 zVduK1G/vcvsHSO2qCP3iwawTrF3SyUXqBE2rY8JD9XIUnNP3eqcGfNJSJ48R5ZPr4po
 L0GgQcDKJsFGtu2uIzs6gk7Bz8AZ8QJ5gIUXcTKplEBmQZka7oGNBLSa46fRgRSlGgtN
 dI4wRhfjkID9vU83aQb+PR9H8hZo4mrw2OEPV1k/s6/YrO3n7zaslTGQ/Kf5yLjwq15V
 GaXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy37NYQGow7sGpwfqpG1dEl0U9Gj8+gXBhgYqKIGSlKpsx1g68wz1l+jOaU91+EL2jdci6R6z/Yxg==@nongnu.org
X-Gm-Message-State: AFq9FYJuhrH74oBboYxQlE4u8f1R1N+Ww5DqBe5s4Uu9ZESbGWVd35Lq
 xbp+53CRm/Mu/m0r/qV23OSEm5K62PS+EZCB+XwN8xqfS/D8eN98GCCq3QUQUQ==
X-Gm-Gg: AYBFou0EpaCZ8bwMpEOH85bDdpmDKS0iiw5BdQSAB23ar7xrJpQxgF7W5CS/dTI3uP8
 YAhcuTrGgHw/HNGHd0u9mRk7DYFLql8MBMo300S6FKUaWbvDzTfQNNlDIq/7pPC2/L1HM4Ecw4G
 aJsNq/vW3FQPrgKgDXeAl+3IGRmqEuOwzygQxs2jY+Ocd4FwNNXfewB4Cv1j7aSU2pEKfDHdyDj
 JawXRf3nZuhIG+65RqCoI6L46EHAOAIjTakmC1HMAg/dqDRBLeukuGIq7Rjeir7MP2s+UqFYsRR
 H9zUkbDo/ykeZal0cK2M8tKMpoq6HdxVKPQfePEog6fp4G0ktqzMWnBBuK5uJeEr8WY3h7HhRaO
 ftiRSs2N0fihVbVSo81M/9D1HarsQePGtE5d4iuQQE3+T6DiFBzl1weqxKc9gK72pgPAyx+DRKA
 WiFxA0Dzyphi9VSDGgM0RBgWEeV8kEAiRW+MdzwGauZ3rxVTIi1lipKZlCnSnSCGWTBvctyWQSy
 OS745NLEmljraCYJanD2REo23/3yiGFUVg5gg==
X-Received: by 2002:a05:6000:4305:b0:487:27f6:a4e4 with SMTP id
 ffacd0b85a97d-48c6d1ad525mr1230103f8f.52.1791275732032; 
 Tue, 06 Oct 2026 01:35:32 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 10/31] hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of RAM
 by default
Date: Tue,  6 Oct 2026 10:34:22 +0200
Message-ID: <20261006083445.30362-11-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Having two CPUs and 1 GiB of RAM matches real hardware. Fix the machine
defaults to make its use more ergonomic and less error-prone.

To reproduce the old default behavior for e.g. migration purposes,
`-smp 1 -m 128M` needs to be passed on the command line.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/mcimx7d-sabre.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 65fdb19c06..47744e66a4 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -81,6 +81,8 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
     mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex-A7)";
     mc->init = mcimx7d_sabre_init;
     mc->max_cpus = FSL_IMX7_NUM_CPUS;
+    mc->default_cpus = FSL_IMX7_NUM_CPUS;
+    mc->default_ram_size = 2 * GiB;
     mc->default_ram_id = "mcimx7d-sabre.ram";
     mc->auto_create_sdcard = true;
 }
-- 
2.56.0


