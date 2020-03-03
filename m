Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp640548lfi;
        Tue, 3 Mar 2020 09:50:05 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu4bhcS9VeANuTa20p22nIr458b/kdldGEO834h5Ofjm6eJ/9cVySE2Or5It855vqB3YjwB
X-Received: by 2002:aed:304e:: with SMTP id 72mr5428489qte.113.1583257804891;
        Tue, 03 Mar 2020 09:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583257804; cv=none;
        d=google.com; s=arc-20160816;
        b=xBKTw2F0sEJ1S49TThtBDaoZiQzKrjtskv5Q7kivxQzL0WbDULgSHgGvcjbDOSOof+
         LSWRYQaR8WyNwbrElPV2XeW8xa9C03M12nGBplFrhVgiFqgT8VmdiTDAwQI7fTEPcPLD
         hbsVV+abhNi6sQa0ZCsndAPqPl3Fd4hGbtoJsz26fCmEYeAd3GIrjS+XkGC5GfklBYw+
         qpj4tT1KtLKW6jXyTcxL8pvtlmWJfq53+Q2xk8vdp2fIJ1zZUHYjQ0wUVgKfyQNYYhgJ
         sAO3MvM71pshkuI49MYOE+enRoVCiA+xz1/4shRLGCki+h8SLZT28DCvnYGv+rFuxWMq
         MdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=YnwWb0ktjqR6grQ5B0xNv+o0Z5hrJjhALm6SqF5FQYA=;
        b=uLue6bzcobFI4TAEa6bZHRyf/WvsXkGXKktxrLniFxgDkXT9QjF0iwrSL29O9DVVXg
         7tbuVBIO8cfF9X85WNpjsjE6RZWNVcFWOGvS+lmU+l7zR+ppNKZmDntJ0dw77tZLfPef
         crn8UutrC7gS+ekqqIGXFzmlUHlKf9v4e0AbmFs6mXKuweQKDh6kw91WG9W+qtDmjxP8
         rKtSZIkaIYFzLBsScTQQE0sL77zu6pe/zVoG30QK/tqk0QDss+KAlGRLiSmMgSEDr9gr
         PevgRqqcp5UV7+IOP/A5Yshgbmc60q7/H2c88tsEAdljjbPxUjdL5sBGg0m6nf9ZQvZa
         6KjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5xvjKIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d190si7950329qkb.265.2020.03.03.09.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 09:50:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5xvjKIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9BgC-0007VI-7i
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 12:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg3-0007Un-6U
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg2-0006Ix-7m
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:55 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9Bg2-0006IY-0V
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:54 -0500
Received: by mail-wm1-x342.google.com with SMTP id g134so2948606wme.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnwWb0ktjqR6grQ5B0xNv+o0Z5hrJjhALm6SqF5FQYA=;
 b=Y5xvjKIXvEnlCK1SHZJ+0xbdUS+btGLs72KTkHFiNleHZtbTyAtK3xOgFnKkXJizUI
 FInnGxDgRnXNRQM5yc0XarDgx2m6SokVGcKcOYrn41FA4BCjldKVsxKZ5/BsMOZez9nU
 rntphYISW+H42FJRuVoGuokEnXypeeZ2MAHay0NtwnwFZXhmAxg4ZPbZTDAKLvwpviss
 8HlX1m3KKnB4CRKohmQzk+FgOdDDkipT7hFpJ2Ypax0PRFQ0UC9fTPbpkn+DRDkIIyxG
 lfaaWtB/AQIKegsMp4oempmiIwiiuVTgXuwi8fnaH2OJUzNJ14PAJViJuWGFJ2/KlsrS
 mCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnwWb0ktjqR6grQ5B0xNv+o0Z5hrJjhALm6SqF5FQYA=;
 b=KMyb5UP1pttCAigNXvp2jXd9+XAWzGYFWQgsNasqYzmAlnOhJO5Nnh4t1jLfcVmeA+
 fe/RA7brWrMTocJDX5UbC0zcPgAqY0crtdO8T0fwuZbhUd1AZLw5YkZeoO4gLJbsssAX
 Vbt5aZ70Bwwkt3jc7xvtJF+OAAeKM5K6ic+TJk9BmTfSFOYem6k5dcJdJCoHfZh4D0Bd
 SivIv/JIV6FfrkRQ5ODVQ2CERnpzyVpBQ0IL2ga3Odaq1IdTwrMvOViqNTRpf9fEhfgV
 RvdNAi7z1mwTiOiJd5LNtET93RhzEUamkKoRc7OFoZMbjBZdzg/1Cg4yP0ppN2bvKbxc
 aSWg==
X-Gm-Message-State: ANhLgQ101Ok17BJB1/73jFLVjwpEEfjEHB5uq2WL8AJ1xpnq44xDN/u+
 fqaBrgGaj2n+7a4/RHyGq1EKwiw21JlMVw==
X-Received: by 2002:a05:600c:290:: with SMTP id
 16mr5058101wmk.64.1583257792578; 
 Tue, 03 Mar 2020 09:49:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm4867576wmd.44.2020.03.03.09.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 09:49:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Fix hflags mismatches for M-profile
Date: Tue,  3 Mar 2020 17:49:46 +0000
Message-Id: <20200303174950.3298-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-TUID: TlxrlbBvTTr/

This patchset fixes three hflags-mismatch assertions I ran
into while doing some work on M-profile. The last patch
is just comment typos that I noticed in the process.

thanks
-- PMM

Peter Maydell (4):
  hw/intc/armv7m_nvic: Rebuild hflags on reset
  target/arm: Update hflags in trans_CPS_v7m()
  target/arm: Recalculate hflags correctly after writes to CONTROL
  target/arm: Fix some comment typos

 target/arm/helper.h    |  1 +
 hw/intc/armv7m_nvic.c  |  6 ++++++
 target/arm/helper.c    | 14 +++++++++++++-
 target/arm/translate.c | 14 ++++++++------
 4 files changed, 28 insertions(+), 7 deletions(-)

-- 
2.20.1

