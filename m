Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5378518lfm;
        Wed, 26 May 2021 05:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPxQ4C2ZZBJK9GV6kDskf38WdYkdwLBwxlCJMRB62s+YUrc1r4tNXqWT8pvkTYXmKUWxSk
X-Received: by 2002:a67:f606:: with SMTP id k6mr3651753vso.27.1622031846307;
        Wed, 26 May 2021 05:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622031846; cv=none;
        d=google.com; s=arc-20160816;
        b=gomZvlWZdFCn8sWaNGKOgCHaxrGPW3eEUNswaV11SvXFBwYf+W14y0nKdrcgJBStkM
         L9b5fTaeEoazTXi6tUcaEPz7OVMi8T153zAGXfCDHE4EmjzB5IUPC8Vc+jgz9YU5U1+A
         TYs+ssoqNuGTF29D1rGZGhAbtKug8ECgnFQS0E1aoLbwX4wy21ONYs/nSaaFybVxygFG
         fJb1L7fRSYusUv8GFBP4xSuKGzkLw27yAL5PEDE/CNBaaRnTE4f+aUhtLaNjtToRdLoF
         bdqrr4bzyeaPCwRKaqHaJIdmtgELH4EuMFDQ8PkkopJasMJzHcvuMLOnhqtynfh6/Eov
         oY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=E8uXjHA9kguAl2uafgh4fpUXuz0c8B7cZeKcMlNX+cs=;
        b=U2pAO6h9E8HpRK8LnkJRXEdqDZR+AV6PjQ28hOXlyDuz+HBeLPGyJKT0Axpe+iXuB/
         zBA41qo42L8+G7joP7xG8Tvtp7i56Qd3T4iID1t4JHYl5+VG+GI1Zg3d3hdI45hWTAqA
         xppxkoKAf4Hc+jtgeF2dd2WxF11kIX8MMPhxMhSYtpNFa9du6q8ia1D0PssQKSvJyrv7
         yhitqMHZQWslITzKZX3jeEbPKm7ul6yyhK1PB7jkE4J7Q2CFA8DrhrYjreAVzYIsPdxy
         gZG3iYfPkGad8obD7cZuJ8TkPc53VT/YkIzjc0QUUOqOorUnAxhTGDgxIAQJtptAOrU0
         VVxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=cqmYtV7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si320460vsa.62.2021.05.26.05.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 05:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=cqmYtV7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llsZx-0007KC-KS
	for alex.bennee@linaro.org; Wed, 26 May 2021 08:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV2-0001Z3-Au
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:19:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUy-00032W-20
 for qemu-arm@nongnu.org; Wed, 26 May 2021 08:18:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id j14so907401wrq.5
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8uXjHA9kguAl2uafgh4fpUXuz0c8B7cZeKcMlNX+cs=;
 b=cqmYtV7mYGhZXTpYhl7l+h7mekWMQGs1ewKwXT4lU+egPpdivvJZDB85zpxGa3xpgC
 lPTPoQYFKjWta6d8lNOFIRrB6PZCA2Di5nFTIuVR0Kb506i27Ew6oYnGLryc3eLdm4Aj
 K095SM/dCJ696hLkccyxocprMtWlYR0+sxdCgggHDA0vg4veYn/bTekZC6acjK3Jomz7
 MP+HXUpKOOY6UXHSxNvBrMk/9lDb//SzjQglupQNhOoxLh4gqO9rLw5JBDUO/1tok4YC
 ba0uGsxHFead6zyj2ISrjaGLxLrsiyW91DaO9RwxKetpxfvKJb/xIIy2HqU78rIzLBZL
 qZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8uXjHA9kguAl2uafgh4fpUXuz0c8B7cZeKcMlNX+cs=;
 b=j948ASkxE2s98evF+FYcnNlW2yReOuuGI2/TqWhC0GFD8kWu61apmgcdP6d2dPKPWy
 3a7KdC3WC4LMX+GLtD4BGaqmBdJl33thqCGNVYILNX8a74XOnsRgMZgNYQaWeykmi7ND
 hy/jgsNogzOn2FIht94lGamFXG+MIrWnyhrBiGAPZ3KuHpAuqjmmyYZRsJdzoOO8bE1C
 2X6/FNIvu30xEdX0rxJeraXd2A4wi/FT88SpvH/4NCuOS7sU5iuhEhV90ruZ4sQx38Ki
 zHwzYkspW3uSXg7eOZq5fUudpGTVZyR9SmQN6nzDSlRClZbj5R/2CewMjezLUJxORyJv
 R1nQ==
X-Gm-Message-State: AOAM531cPsnnUjFWfrUu1xXnX7IunLH2eO7SEseUbHfRcLbprspup6Dj
 0pTaLqjDmvz6HOxZfHIdEEjPvKvVDreSWiTGDi5OQVA4G+heLpbmhmsKlILIg6ND/m8vbfoQkWn
 BNwklg2jbid/KX5uREuCPbaEhnAFhlifHdvbW2RhhVyGf/F3svkjjPFhmjelHAU8GbA==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr33493825wri.41.1622031532062; 
 Wed, 26 May 2021 05:18:52 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id e22sm14288539wme.48.2021.05.26.05.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:51 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 0/4] target/arm: fix missing exception class
Date: Wed, 26 May 2021 13:18:43 +0100
Message-Id: <20210526121847.1935454-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Jamie Iles <jamie@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BdDXGPx1uBQr

Thanks Peter for the suggestions, I also added a patch to switch a 
couple of cpu_restore_state+raise_exception pairs in stack limit 
exception handling for both v7m and v8m.

v2:
 - fix raise_exception_ra to restore state before raising exception
 - remove redundant do_raise_exception
 - remove now redundant open coded raise_exception_ra from MTE and stack 
   limit exception handling

Jamie Iles (4):
  target/arm: fix missing exception class
  target/arm: fold do_raise_exception into raise_exception
  target/arm: use raise_exception_ra for MTE check failure
  target/arm: use raise_exception_ra for stack limit exception

 target/arm/m_helper.c   |  5 +----
 target/arm/mte_helper.c | 11 ++---------
 target/arm/op_helper.c  | 28 +++++++---------------------
 3 files changed, 10 insertions(+), 34 deletions(-)

-- 
2.30.2

