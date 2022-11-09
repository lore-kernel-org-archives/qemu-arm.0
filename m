Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp385291ejx;
        Wed, 9 Nov 2022 08:17:55 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4G9Clt1J1RJLV84hcpALWaQnojzqpPYdZKdfZCA67llEX8QlkhiYR3s0TqsGdj7oS2CqFE
X-Received: by 2002:a05:620a:4897:b0:6fa:9c0b:5079 with SMTP id ea23-20020a05620a489700b006fa9c0b5079mr18561553qkb.478.1668010675339;
        Wed, 09 Nov 2022 08:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010675; cv=none;
        d=google.com; s=arc-20160816;
        b=MsxzS6t2igwFsM8yQ0MG6KWGctqeKNZkxSHwguonQoJFyGOJEwm1eSKmzh/2/cOI1T
         euQAPTpsgMlD5h8TdElcJeKYBVNLwdfxBurWjucf6Q9HDzq+es/WHVWzphDaXoB5yp4O
         BkGyAdZtPQ3anVG1qbEubsEq9M+/cm047eadbT9l3DVfEdNQO4mtfvuahjOEXVbCxUL0
         G5gCwUkIv2zs2DgZ2whygqIO6489RPHf/EpfI64j66zN1rSJoYqUvemw20DshY8E2rcL
         tFL9QXz6sHmFCkjjTkwJWOlIKXxIVYCR2mLOfGKobMXan7qlnLWGr0q2LIAusRsJZ2Oc
         Ax1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VWJDhcEjMyPB1ZONSm9eREZKeQanJK1e8vilV05wL/w=;
        b=njCHv2sbv135uKCC9dqB0dH8+/AtpcCfl9f19z58r4xCPTC/OD2h23Tn25M9fTCgQC
         VFCUYaOxn2CC++k+3qMCzjSKmrz0kr8BgTwTaRKodju5s858nmumnZPJWW7LNMJoL7i/
         9bzpFtnvCvfczy2zrgVuGmxR55ZSo2kIH+nYbXnWasRCTRpFG9utiBMBzi99XZDYy5DP
         I9UAwRSNGnPINUpGHTa7nHBcc/H1UeWoeW4LQomIYCzRUZweVQRARzF/48UlXWmtk0Tr
         5oC4YmWlGVm/ITdBrrrqRL+IQh85hcZPnL/FSBd8d8A3gA5mS2cR6jMHNhZyX/I4zWN3
         Dscw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vlk0vM57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk15-20020ad45d4f000000b004990359d3aasi8801902qvb.462.2022.11.09.08.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vlk0vM57;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osnj7-00017F-Vr; Wed, 09 Nov 2022 11:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj6-00016X-LH
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:14:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osniy-0007cQ-Sp
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:14:56 -0500
Received: by mail-wr1-x435.google.com with SMTP id cl5so26477614wrb.9
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=VWJDhcEjMyPB1ZONSm9eREZKeQanJK1e8vilV05wL/w=;
 b=Vlk0vM57hx9YUC3LIwvO4N1Mw+prT1wRn+qFIS+rE0mHl+keAhHhhTC5BwPk1mNXwP
 rgXVVumuungNZFVPcDOcLKMmHJk7xVPPBKYu2C02Qfkt3Kg2aQvODIuOzL8J0+hA9yu9
 OIJ8uTGH2vA78UVPQIu77A/Z8ANarx1We/0acLu8H/kt8Jrhv+sOoKo2aL1WcWh+SZjB
 prmqAuVLQCvBCS9wOR82Du0ph1MnPQh6T6eQk1AshB8Tg28Dw5n3s01aKEfqFvlLDhZ6
 +EF4pAznxxe5sDwmrtCpxEIJTSYXnpwgFJEpfghU6scGVXoGKRfWGLfKvFKoQsIuF+20
 Ymug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWJDhcEjMyPB1ZONSm9eREZKeQanJK1e8vilV05wL/w=;
 b=nl2tR/C6j7KXUui4b/oNBXMnuYTePB89JNdMly/LpSraFlLwxQxGIe00wH49oR7pfM
 K2e4aF8opdSJsWnm+0UTUjUxvVebosLLpDmMB/dNRxXLEU9f8V+UkFhO6/KD/UtvILYD
 KHwHaxaOAgqD8MpkZrFyRsg6N00KoV4ZTcYYydtwwxDafao+aqOzfgetRC3H+he8cilt
 ic8w5FJ3QFRSZvA5uMLpBnf/3YVQhLFsKHLn9M29OnJWs76FvHpbc013vmR2681lSupo
 T/nuEwa6YenjGhsufS3RGScShY2/tkd3huYEoxr+8nUmD6V7qXCNvQFt6iAEFg6a1YZl
 S5bw==
X-Gm-Message-State: ACrzQf2hFJdYjkUHMjSVG2PqtCwAKpIV5RPXxxr5/w2TCOQhiE0/RbhY
 VUMfqEtYZBOPdtO5/VdP5YrdZ0c8iaYb2w==
X-Received: by 2002:adf:fc48:0:b0:238:d399:c55 with SMTP id
 e8-20020adffc48000000b00238d3990c55mr20976949wrs.683.1668010486576; 
 Wed, 09 Nov 2022 08:14:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 0/9] arm: Convert Arm GIC, ITS,
 SMMU devices to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:35 +0000
Message-Id: <20221109161444.3397405-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: aTHKcqjAVWAz

This patchset converts some Arm devices to 3-phase reset.  The
rationale here is that it would be nice to get rid of the
device_class_set_parent_reset() function, which is used by
legacy-reset subclasses which want to chain to their parent's reset
function. There aren't very many of these devices in total, and
if we convert them and their parent classes to 3-phase reset they
can use the 3-phase-reset equivalent function
resettable_class_set_parent_phases().

Eventually this will then let us simplify the transitional
code for handling old-style device reset.

Note that it's necessary to convert the parent class before
the subclass -- the resettable transitional logic will
handle the situation where the subclass is still using
legacy reset and chaining to what it thinks is the parent's
legacy reset function (by doing a 3-phase reset on the parent),
but if the subclass is 3-phase then the parent must be too.

I plan to do the other uses of device_class_set_parent_reset()
too, but since the conversion patchsets don't depend on each
other I'm going to send them out piecemeal so they can be
cc'd to the relevant maintainers, rather than having a
single massive patchset with a billion people on cc.

thanks
-- PMM

Peter Maydell (9):
  hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
  hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
  hw/intc: Convert TYPE_ARM_GIC_COMMON to 3-phase reset
  hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
  hw/intc: Convert TYPE_ARM_GICV3_COMMON to 3-phase reset
  hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase reset
  hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to 3-phase reset
  hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase reset
  hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset

 include/hw/arm/smmuv3.h        |  2 +-
 hw/arm/smmu-common.c           |  7 ++++---
 hw/arm/smmuv3.c                | 12 ++++++++----
 hw/intc/arm_gic_common.c       |  7 ++++---
 hw/intc/arm_gic_kvm.c          | 14 +++++++++-----
 hw/intc/arm_gicv3_common.c     |  7 ++++---
 hw/intc/arm_gicv3_its.c        | 14 +++++++++-----
 hw/intc/arm_gicv3_its_common.c |  7 ++++---
 hw/intc/arm_gicv3_its_kvm.c    | 14 +++++++++-----
 hw/intc/arm_gicv3_kvm.c        | 14 +++++++++-----
 10 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.25.1

