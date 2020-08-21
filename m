Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp489838lfy;
        Fri, 21 Aug 2020 10:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC4fKnG1n+JSJPpuW70mGyktU/sfG6SSz/z19HLRqZJDZ7ZsCf+2nwt5G9DRUgfVYMlvgt
X-Received: by 2002:a67:f544:: with SMTP id z4mr2449984vsn.217.1598031303700;
        Fri, 21 Aug 2020 10:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598031303; cv=none;
        d=google.com; s=arc-20160816;
        b=Jh0InUQFjg6VNR+YLaQE97XKI67C2w9Jbogyeig8SSSoQi/U4spxvDRPthSDz4bGNr
         sOoArXMaJW/FiXFyVQJHIkAmi66cTv42E1hKcoGQNZOde+s5qJV0F+Za92gin1PjuGqS
         bhbK8s+Q+aMjtBEebmilO50xfzVUUfZqoNOj8N97Pk9/GD9z/P1oRtstnR0UySN1o/En
         j56ttFefYKfjH2RvSwiHRK9RkrNdWdW9R8mX3j5ZsqSY45fbUEK1jbw41BPC4zxvFn/y
         yMAfJxjiWQw9wE48KCQ3edebiUPKE2Y0ehZHt+sgBDuQ1m8SBSeMnALV3FFqcb6gBpbP
         eQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2uqKLIwnsolMGUBAKKhtdES03ym0NQX3Xf3uXXgGuNI=;
        b=ohx/H6m1MuG/tMzqy+9KuRpST+qFMKnVsIVU9dR2cAuig819939RWEXrHIavF/R4sk
         dyAl0GfE9fHYfbYI9lOFyQXEomqRXaHQcGtCMHyUh5ACILvLkN4QhPpRO6un+92N2ej8
         ErZrGGuPhQE5sdJID9WQkAi64Rcd7KWCJzoewASHc1VnTZZSW4hXBqn3pdm5ay7ZpH5L
         6SdZ76eVDKNdApeJkVeAXyLn6Buh/7oVKywhurhtvq22Y3MjG5xzDV0z8Pznv75UfEu5
         0sSBljfVAhgv3UJtCkxi2dPdif0QORUd4jXtRxSkMojUt3HDGbc/0SPKngZ90SCJIwbi
         3WTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GOFJCEte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si597822vkk.21.2020.08.21.10.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GOFJCEte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9AwQ-0002rQ-Vf
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar7-0001MO-Mq; Fri, 21 Aug 2020 13:29:33 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Ar6-0001Ao-02; Fri, 21 Aug 2020 13:29:33 -0400
Received: by mail-wm1-x343.google.com with SMTP id x5so2641302wmi.2;
 Fri, 21 Aug 2020 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uqKLIwnsolMGUBAKKhtdES03ym0NQX3Xf3uXXgGuNI=;
 b=GOFJCEte6vgw1DpRYWrf+Q0HHyQ6jO6cdeleJDLpiiak/0YzCONV0KKBNnURzWG8fQ
 Noa1jHIdqpTidGIrnVlHoS+AxzTt7HWna4Mp7/bHy27Z0rZ/Wq+3NdFXWUtOMDXIVqay
 RJ9sMD5FQ1lIdBFC6Vuy4rQVkfx43hWUxnZUMiz0NR9bWYv55JXYYPSoMJujEuu8L0yu
 eGX+MeJ3dsymOQRTyNySkvi4Iy1FZDZQe+mkRl3OtjtqjteEkZEInHN9XN2eVvDOmELB
 iu8M7ZsBpLQ3q3lHtnU8Sh9pdKlaVbnl/cPwSTGOK7KyASmv1QWx+zCU6e0QlV/IksAM
 JfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2uqKLIwnsolMGUBAKKhtdES03ym0NQX3Xf3uXXgGuNI=;
 b=lSJeGsRFVadnf3H2L1ZB0zxcD/w8uu5bVvb03Y5fj1uYtmSEmfuHoPaUrVW/ECCtXQ
 TqOTdUoYbiGS3orI4aCYO/9NW9FkR2QTc2G9Id8JOijKhzIb9us9ZbD5g7FpJkDWGvNo
 4i6isE2qzpprD8RLNftT0ThNS05NXBl/phopiRz5s+hnJFoXERt3HutWpLk6lwmdR4vX
 JOpnE5bENWHzU+6HHjaG5Fnqfy5gLML2uEr6it/m32vj2hdlLXmrZQ5zN+9co1Nxbbsh
 E9UDxJ8tv/BWFgE0oza4+KdHeohxgJzB9/+TrlJanLH8fdS9hOisL3NKYzdWcQALqjbr
 YUUQ==
X-Gm-Message-State: AOAM533eKjun2ctbFAEX0gtSDJk8jIySuO6rQw7WS4vB4TYHzUsK9BRH
 3vIG+/9IhsNGm7FMjC7FGXxI2BQDc5Q=
X-Received: by 2002:a7b:cf22:: with SMTP id m2mr5009939wmg.46.1598030969538;
 Fri, 21 Aug 2020 10:29:29 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/23] hw/sd/pl181: Rename pl181_send_command() as
 pl181_do_command()
Date: Fri, 21 Aug 2020 19:29:00 +0200
Message-Id: <20200821172916.1260954-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RvgmSDFt0bnF

pl181_send_command() do a bus transaction (send or receive),
rename it as pl181_do_command().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200705204630.4133-3-f4bug@amsat.org>
---
 hw/sd/pl181.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 649386ec3d1..3fc2cdd71a1 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -173,7 +173,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
     return value;
 }
 
-static void pl181_send_command(PL181State *s)
+static void pl181_do_command(PL181State *s)
 {
     SDRequest request;
     uint8_t response[16];
@@ -402,7 +402,7 @@ static void pl181_write(void *opaque, hwaddr offset,
                 qemu_log_mask(LOG_UNIMP,
                               "pl181: Pending commands not implemented\n");
             } else {
-                pl181_send_command(s);
+                pl181_do_command(s);
                 pl181_fifo_run(s);
             }
             /* The command has completed one way or the other.  */
-- 
2.26.2

