Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1898082ejb;
        Fri, 3 Feb 2023 16:35:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+bgbC/BbovBzp+/sPToX8Q2y7+gyErnX1YsWHAjeqdYgJOQCnpA2e53xvpvpI40rcRukhJ
X-Received: by 2002:a05:6214:518f:b0:56a:390b:6fa9 with SMTP id kl15-20020a056214518f00b0056a390b6fa9mr4401546qvb.4.1675470926379;
        Fri, 03 Feb 2023 16:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675470926; cv=none;
        d=google.com; s=arc-20160816;
        b=sDuc0PDQZhkCcdmP3GXBUQVvb5Wu8LTCWD3epaIjeRPZRB4dHOyCPudDLCP99Fva5C
         UF6sH0CNAP8fEthtZ6VKUdUnmbgMkIlCJ8GdVZfBUQjliDNTPdustK7c1JgO8dOuVD53
         d7d9eWcbVi8gV3/JJOdMek1TG6f6cA76dMPEbzEvVPoDMsrYAEEjSS1RvR539GFzXHUN
         bVDIT60aE2l/BWJYHVkC54YIXkqEcEaTzfyZOY9FW7O5uDtS4/Hk7wYbWLqHdOXRKe7M
         n5wjdzZgkXOe1e3a675iRnJeNwmI16nZLxSAskj7ew4P1sjP3IgmB7mX6brK02I8u44r
         h8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=ZS39PoBufl++Ztlgs/FjTixw4LQfbcR3fQQLW53RbeA=;
        b=FtyIczlsvAKHJgBg53im0EZtDSNrLmB5wXRolUoJkmuj2JIVTQuky83mr3kSXG14px
         W2Nk3tk137VscXXwhCd9bzH2QHTMux/kCFAMvCmCdz7OMOyGhxRhRbcCivTIjQU2ok6v
         +fsVzpefFbq0en8ET4ihrOOWoOd7SQAGY4H3P0UvxaPN7mnXXOFe1Ojqj/UpG/nwSrda
         kMslpJCW6q+vGOu1KFWOXWbyQpjGpHpiHQgVleKDNd4cVZ7qo8sc6xGF/6ACc2+dCFNP
         sVJLWDUtLuh023EAQGQyA0aGyFyblEKTqpGAOrKSu48XSphlfIdpHy+K0z4gGD0wfrGj
         hmuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020a0cd64e000000b0053b66a408dasi2606118qvj.58.2023.02.03.16.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 16:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO6Ve-0005cG-QZ; Fri, 03 Feb 2023 19:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pO6Vc-0005Yy-0Y; Fri, 03 Feb 2023 19:34:24 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pO6VY-0003qt-Vi; Fri, 03 Feb 2023 19:34:23 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id AA05311F041;
 Sat,  4 Feb 2023 00:34:17 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Sat, 04 Feb 2023 00:34:17 +0000
Subject: [PATCH qemu v3 0/2] ARM: Add support for V8M special registers in GDB
 stub
MIME-Version: 1.0
Message-ID: <167547085745.18032.9674021893886143814-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p0ZoIaGq7XcX

Rebased and updated to use NULL as a sentinel.

David Reiss (2):
  target/arm/gdbstub: Support reading M system registers from GDB
  target/arm/gdbstub: Support reading M security extension registers
    from GDB

 target/arm/cpu.h         |  25 +++-
 target/arm/gdbstub.c     | 241 +++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c    |  29 ++---
 tests/lcitool/libvirt-ci |   2 +-
 4 files changed, 277 insertions(+), 20 deletions(-)

-- 
2.34.5
