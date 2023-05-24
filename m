Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2599644ejb;
        Wed, 24 May 2023 07:38:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ784p59y6ZNU2N0DQPvSWpC9NhlRpZNLDHViUlGHm3zsHNf+oUzYUbVwlpj0JrkUKNXr/h7
X-Received: by 2002:a05:6214:62c:b0:625:b491:7911 with SMTP id a12-20020a056214062c00b00625b4917911mr539054qvx.21.1684939081299;
        Wed, 24 May 2023 07:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684939081; cv=none;
        d=google.com; s=arc-20160816;
        b=UksgvEG2b5EYWA1VOoM3XAWeGUCwMc/WiblWduMlJA18pFsy3RcKxiWPYkpuoSFNES
         yBYQjWyfEecnJjBYKwmDYCgNTars5nRPIna5W420E74KEKyu1weT83e6rTyj7vYBfBVZ
         iW0VNge1IhKaVxaa1a+kKKEyS3Et8EpIuxS92WGfdbsvzp+OGQrI6r4F7KA53pYawKfi
         zWBkG95imjDyzRMIANJfcKh16zNQxfNRs4JtmI3G3pZzYG41wt6wjp1j47glvc35qP9h
         RFLADZg/VKxKRLG/kqFSFlPCrtbrBqtHbVDTYVdExCGtkAwk1sx8KDJ1h/GS9xf6cmJt
         +MQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4CLXJNIE8AnmMaFUz3EhGB103d1OicktN0ykzKSWRh4=;
        b=xBX6W3ZBmCnFTWYxOHb/TSEIJNGxcbcU05Hq0zY4DtVbBxrLFwEHKCBEcYK/DNtYlA
         XGrrZ5/rQAQa3xIQiJQsk2DjWQ6hnIBMhIDilbC+9FwyDA/O6NHyKvGuDj1ZXb0XaGfU
         +njeTNbGqereHVag3c9NvgYAlB3ESxYiXEZeNBfRluKtf+BTgQJVMAYSYrhDybarh6Rc
         EDAHiGwcPq1Cu7nT7AEuoznJapwjkU8oi4rmc5B/MQmRZoZyLdSD008FkJH/zpNEJi6q
         wdhz1/VAhHKC1VvdF3oj5lHRDsvNfHZLmDZxFZvuS608fvzBXo5QwOATnMdQIE04UAtw
         tQUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=Hj0wevK7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=adacore.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj23-20020a056214529700b006041a751f40si4711968qvb.32.2023.05.24.07.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 07:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=Hj0wevK7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=adacore.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pcc-0007GN-UB; Wed, 24 May 2023 10:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1q1pcY-0007Fg-9M
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:37:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1q1pcM-0007qm-Td
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:37:38 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30a992a9c3eso682971f8f.0
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1684939047; x=1687531047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4CLXJNIE8AnmMaFUz3EhGB103d1OicktN0ykzKSWRh4=;
 b=Hj0wevK72gW+XsAwSRhyF8trZpIHmYzZcutuX/wyrQGksai1u5tdtnPPmGaeZ+rNUT
 uboIIWFgoL3lv/UQJpn1OWNUsiMbWtzpAPVLOgs89Mg7Y/bIgvjRWJ7tIzs7EEm7Jb5e
 2os8Dauy94DwVPNXZhsdVZz1NPIEJf2uUw1UweuPFdVs8CPla7FXgT3KWSH4W7nRQr/9
 FYc8Lf/yVSy/S9+93dR4W/8cPv/FDuVcYEsIZkh9GNBrfuEKyqMPK9tBlAQhTIFJiWC+
 RXhBA8ejqbcb8zScMDgABftgsh68uISAlZ3TyENthx45ocLVngLB4vyTjB9jSjac1Y/V
 4hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684939047; x=1687531047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CLXJNIE8AnmMaFUz3EhGB103d1OicktN0ykzKSWRh4=;
 b=bdcJ74bSZJ6ZzXARWe0HY/6c6jvpeQWBFolBQGXG509p8wwUvEbe63WfJPZRRuSWUa
 ac5YsEcRVrAofwg2+3/7YJMlc7zHHfS1EcZwuavIanWFD2SJmgK1Vx6soLrSQtSmngxh
 bNwSz4PwvebENhSbZ2w6U9iJtKKhavP57zFAl2S4yYlF/05w8CySboaLuJA0dC6QJLR8
 oVedJPvhCOcEUEPZOG9jGoU4xM+/3F3Woc0LTTwc0OwfvKKKvE+9wnRR0p8+j0ZhRZM/
 Q7XG2HREuon9WgLNvaZsdrb4r/EbaRV5/m8oj+OFB/ZXFz62BP3gMTCgXOS/FudmYKTl
 CVwg==
X-Gm-Message-State: AC+VfDzuKtkRFS4Fnft/56T80391O/yXLsPY95bs7kaKAssBt4Og/0AV
 0ZOew43lvtwZ7sbO9TkzrGEDcQ==
X-Received: by 2002:a5d:6e8f:0:b0:2ff:801b:dec6 with SMTP id
 k15-20020a5d6e8f000000b002ff801bdec6mr13440148wrz.20.1684939047378; 
 Wed, 24 May 2023 07:37:27 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:c59d:d6:6f27:fde6])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adffec9000000b002ceacff44c7sm14669319wrs.83.2023.05.24.07.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 07:37:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, edgar.iglesias@gmail.com, alistair@alistair23.me,
 peter.maydell@linaro.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH] hw/arm/xlnx-zynqmp: fix unsigned error when checking the RPUs
 number
Date: Wed, 24 May 2023 16:37:14 +0200
Message-Id: <20230524143714.565792-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 92Ee+H1OwQPj

When passing --smp with a number lower than XLNX_ZYNQMP_NUM_APU_CPUS,
the expression (ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS) will result
in a positive number as ms->smp.cpus is a unsigned int.
This will raise the following error afterwards, as Qemu will try to
instantiate some additional RPUs.
  | $ qemu-system-aarch64 --smp 1 -M xlnx-zcu102
  | **
  | ERROR:../src/tcg/tcg.c:777:tcg_register_thread:
  |   assertion failed: (n < tcg_max_ctxs)

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/arm/xlnx-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 335cfc417d..5905a33015 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -213,7 +213,7 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
                                    const char *boot_cpu, Error **errp)
 {
     int i;
-    int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
+    int num_rpus = MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS),
                        XLNX_ZYNQMP_NUM_RPU_CPUS);
 
     if (num_rpus <= 0) {
-- 
2.25.1

