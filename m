Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4356204lfm;
        Sun, 5 Jul 2020 14:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDywMjXSGukhL05S8SOD7PRFR+LMyxBg77A6Ftz8UFrs6qtVeWiEXn3KWVJdWSbAzHRQ+5
X-Received: by 2002:a25:9341:: with SMTP id g1mr10509917ybo.171.1593984846559;
        Sun, 05 Jul 2020 14:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593984846; cv=none;
        d=google.com; s=arc-20160816;
        b=FNrCqk0FT3iYZ3+IAVvOH0mstJO3XpmUvywDplN5UFLYlvALJ8ROsnI1ceRjGgwf6i
         CARvLvKn95ivVL0xcFPXQcmNdYD6yahm+eqO5IDgWg6UnUp9MT/6uWtqIBl1yaTPuPqt
         DHfYNPc2Tu3McMEsD04s4Cwtjq+PmU58Ud+n2jWZHgP9i+5yKUvdBOXYZPoBG6swfyIF
         45Uv3zwy2LPylTT4sQ3rVf5Xkq9ODzaBP+5heP1wPacvs6ZMb8x8eFmdLsaulrXdmI/d
         m+EEkrOvnTRum6rIZZtJ6w3TZwZM80c5UZSM6gIrbIlh991gQg0xwC0NHnYYAi/JauVJ
         gkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=XLadhnT5E6vAuu3xAswg3w8AxNaxCNbfH2QiEzn8UKY=;
        b=ikhnd5A4nrx3q5jwDqpuE8jJm+VAwpbe9oB/90WQaF06MjgipdnoWW04USnRGjFdqc
         W9P3tP90KgpGk4PZN3dfCnx1FA/MNDJX03FuULNw/LvalayI1e0oTnBLRtydU4ev5oAb
         eN9wD3UhT37efi97CZq7Gy4yaRodJr5gu954WMvGYhN0RL5ERWP9w3q/iHsmsefYTSY8
         G4+0bu8E784LEeJW6vr7yIjH0E0MbYyGopKF6LfhVaGDRn/tZh0C6vwT+/EaN/LK6PFw
         zYnjnfA+aq0tlN2zhx2XgEdCRyQ0Z7lGGpM0yxozt4ID5vn/JOwCEAAhZJoaNVwjv0g+
         eJ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gk2a4Jew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si17232117ybl.369.2020.07.05.14.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 14:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gk2a4Jew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsCGz-0002zd-UU
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 17:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsCGq-0002wK-1K; Sun, 05 Jul 2020 17:33:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsCGo-0000IM-L4; Sun, 05 Jul 2020 17:33:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id w3so27213728wmi.4;
 Sun, 05 Jul 2020 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XLadhnT5E6vAuu3xAswg3w8AxNaxCNbfH2QiEzn8UKY=;
 b=gk2a4JewNsocDz51UVVyk2Phn2VsI4QYox6zZcfj5NbONwib/Txx2Tz+VL/ZS4TknQ
 6BO7k6t+x19t0zmZJ4RN4sOnAyGqM3vn9CXP2UAWBT8Ozt26wEAXzK+HzDE6Ezjd6sNC
 Vw7SNUTeh4Bs8ipEgQereG3lHdLX110hI2gc6InYRjiQfCXRJeiE+tXaJlPDJYrs9iSv
 BIx9GdjTHIlNRVVW6x294oGNvj/a+WJqyOG9yyqS4T48MePAZDVzHLwsVzML8L7D+F18
 rV7KVx21LvG1I6clBeEEePWKv1aHuLPLucCHx4cK+lgTklZFPVfnn502UUYJxbPXogfz
 A6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XLadhnT5E6vAuu3xAswg3w8AxNaxCNbfH2QiEzn8UKY=;
 b=Zr+ID7JGbSJ5X3/2NWsi+Wd2Fu0F+U+Q79JPinr3zMowBBcc3H/f4iq8B3BOt9Px/A
 opYNnQ1WfjBRdJucB66TjU1QsOx/ydC13W1AoVhjetjklzUVAmk11T+6628fA8suWsuo
 N08KNIeRhZvcyqMF9hCAtSwPcvZcrqvivdWzlq8m+KRk0hAochfmSTd9TV2Pr/+TGzC4
 qkL3+SCe/mguOz3HUmE0F2VNbo8O7Zow+twYXbiJobKelmhW2/Wvat2jzNiBEEqmDqwi
 N6xTpYJMOb/VY2iNIowjTz1hvDSDMfv30LAFkTzDurpULriQd0sTCt3LiulAB2RMb40J
 HSwQ==
X-Gm-Message-State: AOAM531oIbGzZ5RmdrfR4/0k+Ofi3jK1hqo1mNUs+G4mJrb4znb3RHbf
 Vs75YRT5kRXdFj4yL89iU+9OCaAWiZE=
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr44586471wml.36.1593984832366; 
 Sun, 05 Jul 2020 14:33:52 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id y77sm11244453wmd.36.2020.07.05.14.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 14:33:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/sd/pxa2xx_mmci: Do not create SD card within the SDHCI
 controller
Date: Sun,  5 Jul 2020 23:33:48 +0200
Message-Id: <20200705213350.24725-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x8frEAkSf282

SDHCI controllers provide a SD Bus to plug SD cards, but don't
come with SD card plugged in

This series move the SD card creation to the machine/board code.

Regards,

Phil.

Philippe Mathieu-Daudé (2):
  hw/sd/pxa2xx_mmci: Do not create SD card within the SDHCI controller
  hw/sd/pxa2xx_mmci: Trivial simplification

 include/hw/arm/pxa.h |  3 +--
 hw/arm/pxa2xx.c      | 39 +++++++++++++++++++++++++++++----------
 hw/sd/pxa2xx_mmci.c  | 15 +++------------
 3 files changed, 33 insertions(+), 24 deletions(-)

-- 
2.21.3

