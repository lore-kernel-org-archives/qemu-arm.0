Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796822ejo;
        Fri, 5 Jan 2024 07:53:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESoEYUQj3Eru5VBALuTp8HBQLBQ22kmP77iLfNr+92+TE0tjEEhMnC8h+oOnv+KBm+TuIU
X-Received: by 2002:a05:6214:20ec:b0:67f:acb2:3e17 with SMTP id 12-20020a05621420ec00b0067facb23e17mr2373419qvk.90.1704470003103;
        Fri, 05 Jan 2024 07:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470003; cv=none;
        d=google.com; s=arc-20160816;
        b=UdK5EvEtEEZUUpwGFJK/hy1VhYzSGSM0OOteH13Ec/HtTdmbb1g3+6QXrRXO88k6/d
         pnoHclyN3jFUp/N5ULdwz/WnNsf/bK44UG6vb8/g6olv5pLD/KiGJZXUrwVypVgHGhWW
         HKF2rcOy5lCMZ2/SO21k7DEO6JieWN3wf5IhuX5kbwVONh4j1c96z0q0TnxYAc0Lhx0O
         mNbzGhc9TwLfHdCa1Tjqx5OlO+Z4RYp8XiEmBXORSCqSsUzEkBf7tN7W6DiGUcqTJw3/
         rNVbTrAJHgqD5lxnXaaQkW/ksQITFKE9oAFS/ks/SKa7XVwiAnC9l27dJdep4DnI5a2p
         yemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sJhN/WyzxWMOOPIeTap61yRQUoY0YL+ZGCT3kZkMZNQ=;
        fh=xTMPh2SmnK7LCN7tWD8/ixwXLwgQIG/YAKddxD8STHM=;
        b=UemAJQt5fLH7sP0hRhu+voBym9jdG6M65No4QiJc3UCW1fgs18RYucnJXA0eo8AsP4
         gVKaBVfB8VqkPtbTc72rf7mJrLcm8y/KbwaG2CVNEVUYnNC+iEKAGeo+b+ZpT27/ICe2
         c15NPds90ZsCFHMG7DwnEyQNeb9Vg8ojjlJPdYlETkTSdlRVC0aP4tSvr9VzUaPK6Aca
         iHeScZ5HwAYAtKxurIpLd/9Bn04vLa+DS1b4xb4qD3+S3O4ofRObI98Bk1Ucz4ARq4+L
         5Y0GOM2i95H/wZh+iZcO9Rpxt6gustzkXHZMO8ioHmrcDtcMFdKTvVBsvxlb1pfkii2o
         91JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbhIsb5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a0cf387000000b0067f69b6e7b1si2002998qvk.558.2024.01.05.07.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:53:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbhIsb5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmUL-0006KF-SA; Fri, 05 Jan 2024 10:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSl-0001mt-4c
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:50:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSi-0001H0-7t
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:50:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3374eb61cbcso1485576f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469812; x=1705074612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJhN/WyzxWMOOPIeTap61yRQUoY0YL+ZGCT3kZkMZNQ=;
 b=kbhIsb5G5wAWcU8WA6XlQi/6lKGxmbGxrqPEcemqnUAJHAWx5hQHKlqoOe50A3ShTl
 1VjKZw6HJZXRVq0Qkdp3/7TWZnZqz/0Zm6Hvitg5mfr38q44rrsFhW4TCZ2kdOVEZF4w
 RiGv8yqiwQJ0qh9gznbkrTMAXZuJ0/qlbqeG7B/SxZKotvHVMF19VFSsRvVTp+rYcejd
 k17URYeJuZmVmQklH/D1WUAfYQu2xiYwuf7NAfsNDt0yHchKrtVurmB1PKsfNg0CYRV9
 zxWKlhmZVkFLu4szNRvLhGnHKIQL8emVwUpOXYMi0QeF9SBpw2psC7u0feUG1OcLX6jm
 hKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469812; x=1705074612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJhN/WyzxWMOOPIeTap61yRQUoY0YL+ZGCT3kZkMZNQ=;
 b=ILofvflN2YW6V3dZP5aj8qjX/1A5Yej/lQInPLrT0V0pEGHEE5ckAEykeqIpfgN179
 5NHid9ZitAj2C9wTvOOhLNcWcJxRiJG/U2p7LHay7KR9HZhAFWbwTexLLr1/eUSsu6tl
 O7PF/YFS5Z4EMqTTwecZWpTgLgglB380mx+XBlkkTM+gvo2EIs6CQgh8YunLJ8MbnmJl
 5NswS3dmzWKFN45OkDUfDTTMyhvZNFfiI92wogqldiMSWz5Jp5CeohzHc3b5X671dfFQ
 7NlMC6shYZ/yyxk8vfJim/g/YiF2ovKCBO7J3LjLnPsUvLNq2DsgwuUYl1swtLrEVw9H
 +W1A==
X-Gm-Message-State: AOJu0YxYEL2RvPHiMblHMkUrakeib/u/iJdk3BUbxiQ3rbV57z0MiVpg
 Ni09FAzlfdJZR9gtxssVY1M2BSBLW42XiA==
X-Received: by 2002:a5d:6d50:0:b0:336:808d:95e5 with SMTP id
 k16-20020a5d6d50000000b00336808d95e5mr1497119wri.67.1704469812164; 
 Fri, 05 Jan 2024 07:50:12 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 a22-20020a5d4576000000b0033671314440sm1629463wrc.3.2024.01.05.07.50.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:50:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Grant Ramsay <gramsay@enphaseenergy.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 70/71] hw/net/can/sja1000: fix bug for single acceptance filter
 and standard frame
Date: Fri,  5 Jan 2024 16:43:03 +0100
Message-ID: <20240105154307.21385-71-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: L+vCVIrTcQky

From: Pavel Pisa <pisa@cmp.felk.cvut.cz>

A CAN sja1000 standard frame filter mask has been computed and applied
incorrectly for standard frames when single Acceptance Filter Mode
(MOD_AFM = 1) has been selected. The problem has not been found
by Linux kernel testing because it uses dual filter mode (MOD_AFM = 0)
and leaves falters fully open.

The problem has been noticed by Grant Ramsay when testing with Zephyr
RTOS which uses single filter mode.

Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Reported-by: Grant Ramsay <gramsay@enphaseenergy.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2028
Fixes: 733210e754 ("hw/net/can: SJA1000 chip register level emulation")
Message-ID: <20240103231426.5685-1-pisa@fel.cvut.cz>
---
 hw/net/can/can_sja1000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 1165d59824..6694d7bfd8 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -108,7 +108,7 @@ void can_sja_single_filter(struct qemu_can_filter *filter,
         }
 
         filter->can_mask = (uint32_t)amr[0] << 3;
-        filter->can_mask |= (uint32_t)amr[1] << 5;
+        filter->can_mask |= (uint32_t)amr[1] >> 5;
         filter->can_mask = ~filter->can_mask & QEMU_CAN_SFF_MASK;
         if (!(amr[1] & 0x10)) {
             filter->can_mask |= QEMU_CAN_RTR_FLAG;
-- 
2.41.0

