Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4079819lfk;
        Mon, 29 Nov 2021 12:06:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz3SkYL1j4KK3u+aIW+qpk/QZikJEDGPD9ws7TtGi+pW/jD4h2mn9MNZwFwNOyEI6mtqjM
X-Received: by 2002:aa7:d445:: with SMTP id q5mr77220740edr.330.1638216366610;
        Mon, 29 Nov 2021 12:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638216366; cv=none;
        d=google.com; s=arc-20160816;
        b=t9IQZp3Z5MwdEDImnYD7iAVlSFOiYbUtQw/IqbBNBW9wPwsBaKo21zFYS4SDcT6qq2
         CUMy083c+KB2jNWBMRtSPDuT33SiJggrG37xfULqYMf9WyfyB6EQbvVG1CvyssuCD4lm
         RL5lymLQu2YWjszkrTjHd64bmzgwhPKonPhssSha5/6AR4JkD6FEogmQx1QpKio472NB
         KONSt3aaboPvJDPV3WvtCecGh8YdQd2Limjrw68CgSNNwoz0uTSHxF0J4kvsmqvekKVq
         oAnn+C6L3k+7y3E2StVWP9IilqF6wZh0gZdtnD2vSBn29ii8ftWLlwD344kUdaoNaVqN
         2ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=62TUW3Vud/abx7oT8R5VZ/lcoz88/dROOmNsgymRkt4=;
        b=dFEnHW+E261nJ90E+NIhxiVn90BstkA5g4Pp6TqBcogsIgCpeUIaK2H08yuuWGuyjQ
         me+I368X0pBFVMDDyvcqqVS42sGKb2kBkRq/yTAFA+QCU6CeFegRvWk8HfrGUncbZhbv
         jGjf9v2J7Z3W4ijRyJ5qwTStQoVHMkmQcPuq4+sO0jzVUJwQpLjmxaFYSqmVl8W98MAb
         NRe/MCE37jTnR7AGxHwEDPBGwwDtlOWQaSHqfp1HpQd4AwO+PEm+yXEqatSCAFlRamin
         Z6GhnbpaED1Uwj/YCLeQ+Bf6+3NACc3qv+aUNi6ZEg6Ho7o9gj1XLplxUfO5x8GL/ejc
         nBCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y+amE4xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si23795460ejz.294.2021.11.29.12.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 12:06:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y+amE4xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrmub-0003Ts-OL
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 15:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmu0-0003Ow-4X
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: from [2a00:1450:4864:20::430] (port=45053
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008CO-I4
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id l16so39359986wrp.11
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62TUW3Vud/abx7oT8R5VZ/lcoz88/dROOmNsgymRkt4=;
 b=y+amE4xjw1w5rJJRZY1O3X8MFMxCdq+7EzlcQBvrovYqh66i1BVal7OMAqr37w5bl7
 RPA2CUjX/BFMaEL3idd5bRdA3DZrSq0pkA1v95fo5byIfsiZmE0yzBSd3FoTpTM7zhCl
 3HPvBimZapcKiwPtXNcs+IrqqSIQvkuKLkzj9zIMG3t3EEzIEn1yZlGHOIVVCrrsaCnk
 se0OAGf/dXj6Y+6w15hgJJy2Xz8l7pVqof6qBiDsyGlawYHJWECrILGPnmR0nzvO4ptW
 AHH5vhgN6ZcgSUD85x3PkLdQ4IX4zXAsN8HjVpK5tKMraFp6O3XQvDfBA8gyD9Eo5JDg
 qXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62TUW3Vud/abx7oT8R5VZ/lcoz88/dROOmNsgymRkt4=;
 b=OiipgtNbpw1EBxbnmntf0MyfxybmJrCWEV9PrmT+FLsqxyltpP99C4GxSp/C4I5xFd
 HEC5JHVsoLe9oAmbNhJhPQb9RvxxtuD3JypukN+3hgpCbu90XPNmkX8sGZZkdfl5h2eb
 6XwO4xP4ilaL4KTnpKu+oS1s5U01jElEjzyVjExroXZulgRbGnR/4whWcJ0L/iYNNyDa
 bx3Cxv+qUTjwfBiVD/zhxeisXzcZtxp1YVuAY3D2nu7GMN4hH9rM7SoRO2GTTaFBY8or
 cfrQDIdQl6dUJ/2KseXXhvbiDn2M23JPRvwpBJWMKjUt03GcjMVn58dVEWqur45soE1p
 LC0A==
X-Gm-Message-State: AOAM531nBd1rupz7KMB6ycvJSFnImB8ThhxCBAPuc+RfC0XMZDsTRTE6
 fWabaqhOS04hk5MkWNtxoO/ByuyiT/+2VA==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr35051011wrj.554.1638216313208; 
 Mon, 29 Nov 2021 12:05:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 0/4] qemu-common.h include cleanup
Date: Mon, 29 Nov 2021 20:05:06 +0000
Message-Id: <20211129200510.1233037-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QvooMs9g57GL

qemu-common.h has a comment at the top:

 * This file is supposed to be included only by .c files. No header file should
 * depend on qemu-common.h, as this would easily lead to circular header
 * dependencies.

We still have a few .h files which include it, though.  The first 3
patches in this series fix that: in 3 out of 4 cases we didn't need
the #include at all, and in the 4th case we can instead #include
qemu-common.h from just one .c file.

Patch 4 is just removing the #include from 8 files in hw/arm which
don't need it at all.  (Probably there are other files like this, but
I just did the Arm related ones.)

Tested by pushing to gitlab for the CI build.

-- PMM

Peter Maydell (4):
  include/hw/i386: Don't include qemu-common.h in .h files
  target/hexagon/cpu.h: don't include qemu-common.h
  target/rx/cpu.h: Don't include qemu-common.h
  hw/arm: Don't include qemu-common.h unnecessarily

 include/hw/i386/microvm.h     | 1 -
 include/hw/i386/x86.h         | 1 -
 target/hexagon/cpu.h          | 1 -
 target/rx/cpu.h               | 1 -
 hw/arm/boot.c                 | 1 -
 hw/arm/digic_boards.c         | 1 -
 hw/arm/highbank.c             | 1 -
 hw/arm/npcm7xx_boards.c       | 1 -
 hw/arm/sbsa-ref.c             | 1 -
 hw/arm/stm32f405_soc.c        | 1 -
 hw/arm/vexpress.c             | 1 -
 hw/arm/virt.c                 | 1 -
 linux-user/hexagon/cpu_loop.c | 1 +
 13 files changed, 1 insertion(+), 12 deletions(-)

-- 
2.25.1

