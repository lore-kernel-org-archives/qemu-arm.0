Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1072839lfq;
        Thu, 10 Sep 2020 00:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj9iUrmjA7/5F0bvxQs1+s74vvwLcduzWapMifEietdCDTnGErM4Bbq1l2+onjCmNyDBrv
X-Received: by 2002:a25:9905:: with SMTP id z5mr10555936ybn.38.1599722634340;
        Thu, 10 Sep 2020 00:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599722634; cv=none;
        d=google.com; s=arc-20160816;
        b=k+GqcjG5rQ9gSXGI8a1T5f2YvIBauDM5yEC7LJt3qSY0MeD6yDN6JAq3KGVuYrsyVn
         VVFvMCwLB9vLgyq48gx7ZPM3iR6nVzFj/rp1YEylKReiLp5hRbhfUbf9Ru+oqgTBbGGh
         M8RNMbW3T44R17lLkrVVgVrfj1Fqy5M32IT1f3vRnNu8PTGg09xA6oWxnWEukdILZ9wi
         EdxON/OQJF/E+4OhwP1hv+gwHzCWWAKEFEgDec0VKAi6Wpo6YSivObm9/4UWVfdAUZz3
         FmVaPu1ijy/wB1L677SIQE/wAKkxeP+UegU/qIdRAigdx2pBQLQ6hqbk2PtbsU7Q5mdM
         4P6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IiUNInL/307o83xAPoEOVWsbuFJeacWIMWUZqFjFjKg=;
        b=S5447I8rBpmbpCu1jMAs4WQ0r9zRyLTXcmbUNf+f3mslywqcQNYTXDtdp+CBoWOiS4
         Z+1t3M/Tv4RTUlOgxsSxS/vYwquwCqnXDcVJjLHRE3v9TJiLijFOJo0HHdtCExG9ZG50
         3cloTzflV9SCUdHAXr0ksmq1/wQiuywQKh5br+VZ0NqU7mL3R7qAGQ/gGkaHXAuCgZJX
         DOcRo65D1jDNlKoYVw0gPe23kbu+HXX4LqyR/DpEJqLUns4we6tD3dHbLtm4EWSvcos5
         fjJUdIppotSiOdUZD0b3tFyfBynAPDftF0WiFHUi4S15TLanOvkbQLlbS+URHM1UQayb
         4cnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EV1O5ouY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si1358506ybp.157.2020.09.10.00.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 00:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EV1O5ouY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGGvx-0007Fy-Kx
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 03:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGGvc-0006iy-65; Thu, 10 Sep 2020 03:23:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGGva-0004Io-E1; Thu, 10 Sep 2020 03:23:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id z4so5524952wrr.4;
 Thu, 10 Sep 2020 00:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IiUNInL/307o83xAPoEOVWsbuFJeacWIMWUZqFjFjKg=;
 b=EV1O5ouYb1hrMPao8ECJKuezt3lKVJVlYgpfS8p7oKejc/N35zkPLblK3QvTPLnCur
 tSA+ZJ28wnYaux9AyAQL4BF3KfGaKxTtQoKX1cQ5eAmK2kSFxhjr324HRqlErKAWSxh5
 MdB8lQEKy5vGk9l7BtvYDK1TUMaA/flRQWWsajizBtFat6euSd/e+OBg9WKwU9ARyaGk
 33dANB97NsQnobSYMAwi9Lf8ITbxw/nm/2jfDbADmtE30WZXqBBfRn89BfClqzXOfJBU
 57MigVyhHuo1TtSPgPqvpdgVnf5giDb+U6yDV1QBezpMT80sK3+pewArA3N74eRo6Xyl
 NDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=IiUNInL/307o83xAPoEOVWsbuFJeacWIMWUZqFjFjKg=;
 b=t0UyEuJgqUZlM7ZgE94DQvyQvXU4xNlNoRelP3mXmJP810QbCZ2qPB/mnKJ2ltPJhF
 ucj9XAxQ+x82OOT0mi1iErg1r0OBBrpO+D+QbY/l+9Rjjr7tiQO3gs72rFvAzo8trlaw
 R3EDzRS58CKqOBobXizyKCuPdIxIm5m3bD0Yk+rYiJOD5Rzri3JN6jFHDHTrpz6OQDFT
 JqIPZqXk/R13OAqfMkgVHsjVnms4Qo/VIsSR2jZr5wlT0NJFX44/ngXCYG8NOLggpyI+
 ZdlKeniU6ff1o1lDdxQWAIeZytmwzWiSAcb7LZMlQ4dnwjTUfX6hELfWPbBVg2wlpaKa
 CG4w==
X-Gm-Message-State: AOAM532E6mJE+EfVLgKxk6OVBJLG6/JE+MtZ/mC109DrP5/KPau2i4TO
 mh4UxcGBsnqw0k4KffDS7H2zKCXUWzg=
X-Received: by 2002:a5d:540a:: with SMTP id g10mr7187535wrv.138.1599722606993; 
 Thu, 10 Sep 2020 00:23:26 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id x2sm6783804wrl.13.2020.09.10.00.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:23:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw: Replace some impossible checks by assertions
Date: Thu, 10 Sep 2020 09:23:23 +0200
Message-Id: <20200910072325.439344-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yF6z72wPyuGj

Trivial patches removing unreachable code.

Since v1:
- dropped patches queued
- replace dead code by assert (Peter)
- use PCI_NUM_PINS definition (Cédric)

Philippe Mathieu-Daudé (2):
  hw/gpio/max7310: Remove impossible check
  hw/ppc/ppc4xx_pci: Replace magic value by the PCI_NUM_PINS definition

 hw/gpio/max7310.c   | 5 +----
 hw/ppc/ppc4xx_pci.c | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
2.26.2

