Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2698413ejc;
        Tue, 17 Jan 2023 11:44:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtpcamICMbcgAcOsxkzn/cO4r0j5TMf7AvWJkpHeB+qn6nQRF5smY3ZrQfeFURDCxrqxxTZ
X-Received: by 2002:ac8:7c8b:0:b0:3a5:4fa8:141c with SMTP id y11-20020ac87c8b000000b003a54fa8141cmr37486122qtv.23.1673984682213;
        Tue, 17 Jan 2023 11:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673984682; cv=none;
        d=google.com; s=arc-20160816;
        b=h4C6pl4VAxfPHPcnR/szMDQZQzwc9l+xG59AAJEtpkmZRnXXEhKTygWAMqRPkK81+H
         zwZmiEKJQDOtmI/tIoCaEjolGAA+s1aBDTrGqKfk/tmU5zWlkfUrqIBNN5peEeJskuS+
         H4TAcHVANVC38Wc8Nr077ZBJ1iF9j7yvaz3JaqyQwAwwqzDqIBbU2aKIN+dtvWqL4zWN
         BNlDjQjdASU1ROsrbz6uNubaklflnDRsog+IJYV9iGTZMyHKSlYywxdiNp3vmh//Mwbw
         mYkLmu1KBMOERP4zSgCDZxueEXKdTwGexpJ5Yn1LSUKULuIEbgDi7VIPEWZdQ6cpeFwy
         7ioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=qCiF5Q0yknkNfuaBzsYIqP85siUCf14jM2iocXU8LxY=;
        b=gOvm/X1jlpC1Uj0xczYi/EJ407lu21G6FAP9esRAmC8GTOgum+dXuLLk5Fv2AL42lP
         hqh0Ly0N5Qk7tK3rPQoaTNNYVmWD7RychYAZNB07GmQc4lt7+3YzqTTxbIbklVTLUqfT
         eYE2EAHfVzf8JXqwv8ofVl+/VpUx2DWqMmoYms9Q4rEqyzzDSXoGXEiOl9ZHcatDL0c8
         Yk7V2hHqRo76tYv0HiuXBJhMl23EUHNc7sT/GQrxIYEM+1dP9SRGsh0nhaq7Lk+kpi+C
         xQmhHOGgBgPt7vzaXjeTqimkZsr33ZBnzzHFlcBbkwICPJeAIQoasj3agO7WH1i6M9n+
         aHxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020ac85515000000b003afdfd9ea38si12445940qtq.75.2023.01.17.11.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 11:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrsQ-0000CQ-PT; Tue, 17 Jan 2023 14:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pHrsO-0000Bf-V1; Tue, 17 Jan 2023 14:44:08 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pHrsN-0001HA-FX; Tue, 17 Jan 2023 14:44:08 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2594F11EF48;
 Tue, 17 Jan 2023 19:44:06 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Tue, 17 Jan 2023 19:44:05 +0000
Subject: [PATCH qemu v2 0/3] ARM: Add support for V8M special registers in GDB
 stub
MIME-Version: 1.0
Message-ID: <167398464577.10345.18365355650640365165-0@git.sr.ht>
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
X-TUID: 8Ha3OieLAsH6

Patch 1/3 was already accepted, but it seems is not in master yet.

Comments addressed in patches 2 and 3.
Let me know if you'd like me to split out a separate commit
for renaming arm_v7m_get_sp_ptr.

David Reiss (3):
  target/arm: Unify checking for M Main Extension in MRS/MSR
  target/arm/gdbstub: Support reading M system registers from GDB
  target/arm/gdbstub: Support reading M security extension registers
    from GDB

 target/arm/cpu.h      |  25 ++++-
 target/arm/gdbstub.c  | 241 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/m_helper.c |  51 +++++----
 3 files changed, 296 insertions(+), 21 deletions(-)

-- 
2.34.5
