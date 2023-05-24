Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2613023ejb;
        Wed, 24 May 2023 07:59:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ua/Kv+O7APEQ0qxeRXqCbkQH3ZEQRfyK0Kctx6hOuiCei710nVoLg6whkEcdf4qTKgs9F
X-Received: by 2002:a05:622a:1345:b0:3ec:d85d:2afe with SMTP id w5-20020a05622a134500b003ecd85d2afemr27664271qtk.2.1684940379664;
        Wed, 24 May 2023 07:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940379; cv=none;
        d=google.com; s=arc-20160816;
        b=qCoocPD9ol95zxSbK5hwwv+gE+AVyP3RyDNMqMgWbHiG/s4Ye/2Gno9UUZ7KXsGGoO
         LnFPFOR8Ft7YIr+1EoOhPoWn5h5S0KYjcldWbLbAtFaEZ2JeJ4JMgFXLLasUx7+R6mLK
         qygG+uDbtRaa1Rk9JKI61wrhW/q8D78HhwIZAejm4eYIBVfSnk3qm9hZGPJbak8h43V9
         930PnVeGhm6Vxe6krguYIuew6AESKegxSLJHOIfXohkFXOn5QTvoxoCaQkTVIbm3Zg7J
         gcLbPuqiwHDGsqZYQm4rNyU9kYKplchg94nfPQ8abZr2x0aEwaOBoUG9fc79ZKhuskGD
         Xd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=u+I66XzF83QGfQRczDmREp33WLCVxh4y1YWigeQWiZY=;
        b=zWQZOs7eQLAj15VVDiB925bkpLyfPF8k697uDqy7CE9iNuANJwznqEPTLH9UuJMNJb
         38XTsKYEOEYUPI/W2Xtqf1hChe6PDI0nT0LtdHjVJ6Y5p/SwCwaQSgItQbeCDgqnuKuo
         51gqDEHlQAyz/kneVJOaWL7gXTVD4skzVZc9RmclkwzNNPXhFS4FxclpD6cnuVz5xSL4
         5wDYDwXSrdPrIEDxVOiNts6SqKCDrRlLUTCAcK5nc8jgSA7pAxbosNDYAaY2Dr4aIZQj
         1E99VVz80o/MVN2FkjsQahRjnKZfZcN7f47bQRPC2HoGieB0euZs+joMKwEdFjkosgrf
         ABrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jeWWkeNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85f96000000b003daa657db60si6864491qta.476.2023.05.24.07.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 07:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jeWWkeNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pxd-0006J6-5q; Wed, 24 May 2023 10:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pxa-0006G5-0N
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1pxN-0006E3-Kf
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3078d1c8828so910931f8f.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940349; x=1687532349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u+I66XzF83QGfQRczDmREp33WLCVxh4y1YWigeQWiZY=;
 b=jeWWkeNLDAYu+p0La/YDqVv1DGE470Bv0h6Y0xE6uBRuYo91XJvlFHKV1EL6vNOLtE
 57/7SI3Zk0FocY+q1XErC/UPNah2mOFQHKr7AQ5dHugxuaSrhV2f3uI02sbyFXp+6L8o
 cs59vMW6UBtpwhYSQuBuOhZJn7Zmt1yyZdIIZggs8BFfi1qsbpN0UEE8qig7gCGmGiNE
 OwslX2ohnOJpkgR4970AM1VwiK4W5afnngzle8g1Ccrd8BjeuU2APjAdDswvLVlbgsqM
 pZHALrIU8E7ZK7TLEUyIxauOGFV+VpTQIKmAiF8WauWkYLkUIWrEF6uZ4+XFVlzlFGg7
 7r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940349; x=1687532349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+I66XzF83QGfQRczDmREp33WLCVxh4y1YWigeQWiZY=;
 b=YUJoE2tyoZTQrRm2S3so+Zl9XjmWygN4JbPVvNbPBzp6oxMXLJ17KfhLeQ6QmKWCfW
 Qu7H/RosPALIBm8MMINWQAJmYGzIWSE/t+An+NlR4UD6vVm+G+Mml/4j23SMidT9+WMT
 GSqka531OPczRXKRqB1xSfXKccDXMYHeNZx3oyhakvV/hktkLyHAj5d5D8XpzrIERNES
 ZYA96G0p963/bfuZYc33sQaUGZPEX4sL7gOnJjLviI6646sjHV9laE9WiU3Pc6DpnHfG
 u69ol2Yx7T4vXTss8JQbpXuQuyzaaHBgbF72G10OMKTjMhw0nLGA8nQQP6rNKiQdS08p
 GQAA==
X-Gm-Message-State: AC+VfDzlyg5dxoK43vg9VXwkZeyVwqsaoU2ecUgZ0i8JfL+qatn1sZEc
 nHFMd4TlpPEawDScNI4Z4XQqPw==
X-Received: by 2002:a05:6000:1246:b0:306:2fd3:2edb with SMTP id
 j6-20020a056000124600b003062fd32edbmr38452wrx.61.1684940348943; 
 Wed, 24 May 2023 07:59:08 -0700 (PDT)
Received: from localhost.localdomain
 (fac34-h02-176-184-31-193.dsl.sta.abo.bbox.fr. [176.184.31.193])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a5d464f000000b00307d58b3da9sm14700936wrs.25.2023.05.24.07.59.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 May 2023 07:59:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/10] hw/arm/realview: Introduce abstract RealviewMachineClass
Date: Wed, 24 May 2023 16:58:56 +0200
Message-Id: <20230524145906.33156-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: OF6RehNhsb4B

Probably still spring housekeeping stuff.
QOM'ify Realview machines further by introducing a common
(abstract) MachineClass, and set the read-only fields in
the class_init() instead of machine_init() method.

At least the diff-stat is negative :)

Philippe Mathieu-Daudé (10):
  hw/arm/realview: Simplify using 'break' statement
  hw/arm/realview: Declare QOM types using DEFINE_TYPES() macro
  hw/arm/realview: Introduce abstract RealviewMachineClass
  hw/arm/realview: Factor realview_common_class_init() out
  hw/arm/realview: Move 'board_id' to RealviewMachineClass
  hw/arm/realview: Move 'is_pb' to RealviewMachineClass
  hw/arm/realview: Move 'mpcore_periphbase' to RealviewMachineClass
  hw/arm/realview: Move 'loader_start' to RealviewMachineClass
  hw/arm/realview: Use generic realview_common_machine_init()
  hw/arm/realview: Set MachineClass::default_nic in machine_class_init()

 hw/arm/realview.c | 177 +++++++++++++++++++---------------------------
 1 file changed, 74 insertions(+), 103 deletions(-)

-- 
2.38.1

