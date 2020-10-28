Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp786572lfa;
        Wed, 28 Oct 2020 12:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8h/Usn2HS7fNXQv+qTR1Ju8vtQz5+H5crwBmP7EXWpwR6BWygLwfGYLAUd0nJeMX1GWu0
X-Received: by 2002:a25:aa07:: with SMTP id s7mr1230638ybi.334.1603912667570;
        Wed, 28 Oct 2020 12:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603912667; cv=none;
        d=google.com; s=arc-20160816;
        b=pkBg4jLVvjBdGjLK1NVdLvjGryctCcVulhEyv5+CrAfPlUL7ydrIs32l9TuoooCKQZ
         H4elm1NK68ATwmVdjm+JNPerYDUNq/RdK9J3E2nDeCsbhLInXBMmv5jXZFmD3FkzfjXG
         ddwC0Y60JhAHklJeHIhZS6YdTwDADUWgZsN7tub02Zh+zPAcMmww1WNW0VkExliTB0wV
         TnZNaiv+EhTpjia0ABCB0yckNhIki79JXGLsf4VLR35Bm+VyjC8y90nmunWLkOPqdOAf
         nCdprMplHh+a92w5IO5LzgzTHJnYFjrVxwBgRtdAYBopYbtgUDo0cvst5h9KWFjNm2/C
         PiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CZIUq9jQBpb3euLRL7uB1HYxmM0OdzjlpOHQCueZOfM=;
        b=dUAVHYPuczI5588h7A7jqDoSBAqwdmMcxWAIT9cp0JPuZqPAYh5MMlsIfnl3GEkqe3
         BNp6VFbCtufFMhkrPNuoJuQ48s/Tb93mS6iC899jcROMm0jILYiZN5JlmgUqiU0i85S6
         wZ3VVL/BQf9lYjW8Xii+JtIegTmazVbJTecfmUWYu1CEhxDnrqnIKTCWSh4OxxaMzaYq
         7h0XTuJSZ26TU7YXV45fhkMJMB3feJV9IJ6b1ujqNIMQrOTPuz1CFd9K2xvA5qVvaGHY
         GLUkm/6NVtgIeDyYKaWNoEEy0UA4XNpuVoRKhCAnogjibDA2Qu97U0gnI45E0tWTX6Yp
         kgqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tyK2m8sX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v70si490701ybe.449.2020.10.28.12.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 12:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tyK2m8sX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXqx8-0004iV-TR
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 15:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXqwj-0004i0-Tx
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 15:17:23 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXqwg-0007Zq-4g
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 15:17:21 -0400
Received: by mail-wr1-x444.google.com with SMTP id n18so278780wrs.5
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2020 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZIUq9jQBpb3euLRL7uB1HYxmM0OdzjlpOHQCueZOfM=;
 b=tyK2m8sXn9JRs7zLK/8YRPBnjxLON30jDxiol1pF76p0nA23kQNgEYIPk+gTZv8vZH
 kMZTXHBmzIMgzckzHcSjeD+m9f3XPww6LsimpTYV30ZTGrDekEJjneHJvd1m1GimNXL9
 XQ+UrmfctqOj6C7eENsPw/4tnVHIuCnStsxVAHBgrNjzMbITUdh6Y8BuYsQeq+N2tZCM
 vJDC1fsagK/UhM4Xrc4x5D4384nzQw1eBJV1iaBj955yuTbDeuxUIcNNygx9Ip6mWiKi
 9XPE7nfj3Ks4E6n7hFwvOeMRxNf+TfGWAHAvXKTUeFas4ph6kqMg9YIiBLCA/OH9RkW6
 IraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CZIUq9jQBpb3euLRL7uB1HYxmM0OdzjlpOHQCueZOfM=;
 b=SS8ruJEU9vH5bj7EADwX1GsXSgwU3NEB4ufKlptJyVmK6NHTNELb/yKZITktlSzJQy
 b2GNeF9Jd/xMqF6OvuIEVSThpYx9Nh1RS41lWDlHfLOJuxYc5l419J0mwCU1zNgg3Maw
 S6SEdVlu+1BWRpDdoQ22J9MUh68QkLKAwa43t3xUsE6cbP0RTLE5JpF++D1YH2UkRTlC
 m22//NuH+9NAN1xK122GopmJedoXWQrOzhDJHn97b2fzwdRZHZdiwox1boLUq/aIOSj9
 IWGfglKRPPjsKWZ2K0+Fw2Ne08NFoG9szho4M3bly5ogdzymfQUa2pYEQZ72WXSeI++P
 sZzw==
X-Gm-Message-State: AOAM532403POrFqGteK+4C6kYh1P3M/WPvxfnMAe5I9AvB22mTjVszH1
 Iny46IaXUtdOvWVIjN87dA4r6Uh5WUeJuw==
X-Received: by 2002:a5d:458c:: with SMTP id p12mr900665wrq.329.1603912635174; 
 Wed, 28 Oct 2020 12:17:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l16sm743953wrx.5.2020.10.28.12.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 12:17:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix some Neon insns on big-endian hosts
Date: Wed, 28 Oct 2020 19:17:10 +0000
Message-Id: <20201028191712.4910-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5pOCdWeQjA6

This patchseries fixes a couple of places where the vector
helpers we use for Neon insns were missing uses of the
address-swizzling macros H1(), H2() or H4(). This is harmless
on little-endian hosts but causes the wrong results to be
generated on big-endian hosts. The affected insns are
VUDOT(scalar), VSDOT(scalar), VPADD, VPMAX and VPMIN.

This series is independent of Richard's recent "target/arm:
Fix neon reg offsets"; it fixes the handful of remaining
risu test failures I see.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Fix float16 pairwise Neon ops on big-endian hosts
  target/arm: Fix VUDOT/VSDOT (scalar) on big-endian hosts

 target/arm/vec_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.20.1

