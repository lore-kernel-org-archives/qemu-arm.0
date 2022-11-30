Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1464656ejx;
        Wed, 30 Nov 2022 10:56:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53+iWPZxJTY2cbQhmroPT9fREL8cR6MdlmiPtpIu+VlvWQ/UyXs4N2len9j9Q/jAaQ1HLg
X-Received: by 2002:a37:88c7:0:b0:6ec:537f:3d94 with SMTP id k190-20020a3788c7000000b006ec537f3d94mr39226018qkd.376.1669834595141;
        Wed, 30 Nov 2022 10:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669834595; cv=none;
        d=google.com; s=arc-20160816;
        b=L1Q3WfpO1lsV5Z1RRsA0MRMV6Yb2UNCZMtAhlx7q2g7NQD1Mgbvs6ATV5OqtIAII+U
         vH+RU3F9Nfy8YzzKWGGqBdDahVuFdPB40U3YHoY+Tx+TCl03x/WoNBpdW2iESzezqtPT
         9IJHAL6WGodOfaYOOoz6Ut12tK94d4d/TrWDjpY3g5NfN2DtjdvKKwB/pI83fraqNtPU
         9S4qlmB28wIsM9JdwCiqDfpmgM4n2wRF4XLv6L3JIP6JRa5lHmj8/tFlwTC0TLC+HkvF
         3uMnCzuhMoKNYvO2Nl7N5TX1gEwcz/6osklehikoiLhHv54KyNyibxM8dx3E8jxunRQE
         NcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=NppjKDQZmTZ4QDGux9qEg/iSG43aSkPtzc8Ru0v2Dmo=;
        b=pFAmv4Tgtibs1NFLNkONzf5Sa23qW2ari5TKm/6ACc68PjFtRPqULtrfUn487YdBFO
         eQOLzUqLwHhHMn7X1V+y8DMtJB/Xv9Bz4F6iMyT/ggRxSkz+/dGgisKkZD+grhUXwxd1
         nWJ0MtU//CxmH3sOQZj2KVBvW5XAFJ/a0oT3apJVMdaJB8TgwcuNbjYyZabPWt6aUT4l
         IrGrk0Em7qP4UMRWxC4c04xcOGqJHdy/mr7T1+/jbYWSRS1tXbpEc/pMAxHXMop8fm2Z
         vJRPUtZvqOe4VBJOJ2TjlgYBKZv14iVGnDZ8bIDQL0xEHU5WQ0RQ7w2LwaLqNK5zjSF0
         Sr3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020ac81112000000b003a6881f5221si1096213qtj.379.2022.11.30.10.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 10:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0SFn-0000m2-UQ; Wed, 30 Nov 2022 13:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0SFn-0000lf-Aw; Wed, 30 Nov 2022 13:56:19 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0SFl-0001LP-Jx; Wed, 30 Nov 2022 13:56:18 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9702A11F1E5;
 Wed, 30 Nov 2022 18:56:16 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 30 Nov 2022 18:56:16 +0000
Subject: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
MIME-Version: 1.0
Message-ID: <166983457648.13115.4940680286975412418-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
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
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LrJdnEuiDdnD

This patch adds timer peripherals to the arm-virt machine. The
use case is, that this machine is quite useful for testing purposes
when it comes to non-Linux operating system (seL4 in our case).
However, is currently lacks a dedicates timer peripheral, so some
scenarios cannot be tested easily with QEMU. The RTC cannot be
used, because he resolution is too low. Since the sp804 supposed
already exists in QEMU, adding these peripherals seems easy and
it does not appear to break any existing use cases.

Axel Heider (1):
  hw/arm/virt: add 2x sp804 timer

 docs/system/arm/virt.rst |  1 +
 hw/arm/Kconfig           |  1 +
 hw/arm/virt.c            | 47 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  2 ++
 4 files changed, 51 insertions(+)

-- 
2.34.5
