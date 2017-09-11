Received: by 10.223.172.38 with SMTP id v35csp5566349wrc;
        Mon, 11 Sep 2017 06:57:03 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD1Xm/JJnElkpcuXAluwCJR5iXaDsXhE3VrHTPxN6lEi0APGcf3oOkxmxg90tzWtn7wAkTf
X-Received: by 10.55.147.197 with SMTP id v188mr12430614qkd.350.1505138223695;
        Mon, 11 Sep 2017 06:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505138223; cv=none;
        d=google.com; s=arc-20160816;
        b=SXyj9JQqeX/IEs4WnRrNn2zMwbcEwgNumoKp6vBghdhRtYBrzNtiQOrnz6mhC2uBB1
         XNqt6dl1tdWaJnFT/SJ6RYTdMWet+Xcjim4ZP/Ggfsn3Uk1SCJ9jzqWQoIiHHZr7H3uA
         zZ+Jpc9ckVge11j/F/ql0r4Fa+3VRIIzxPgv5FCNfLikTiG58liQgNyowbEwYSylWxdC
         NeUvzjHr7IPdBIMmCh5CbbSiGCuHfd7Ar1nmJasRzN7wL1aoFz5EQ71RlGQvXmxpH+9s
         y7nxEhC2oRiqh9WXzsGbgnELxHNeDpRDwaHNwE98yOOxCcBOzSU5degCtEeyy/h/EanT
         z+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=bf7EBUvAk90m8kT8X+mgzX74sVbZFsFOS0pyKj6tAI8=;
        b=CCb3Y1tyOTH6ghT8xFMEaK8SIDiRHvpn/hui6JNh9diRZQu5cTJc3r87Wnui4TU2nr
         2vzS1oONLYlxobVMtTIxzccKxI2wMlUJsZLvdhTUPOMZi35WOVVUl5trAmVbXGLF8Fr9
         13Ii8bD+/UHE1K40v9it3cTx0YEBZIppfO5ygL+te97xBi7QlpqCBF1GS+4qjghGBsCB
         PQmYgWlRvOKx+NQDgpTMd0H4xhW6wnUPp++dXSNSKKqRj19pzwMWEyCnlWABU6cBlDey
         uuvfCIMg9IjAK0OsH4NJKBHiilGbzr7xexaDbIKbN3DZPI1H/NUmMFkmUbCXnJS/iz/i
         84Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si9024352qtb.382.2017.09.11.06.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPCt-0006LC-UB
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:56:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP89-0001k7-KY
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP85-0002DU-VM
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP85-00023m-PU; Mon, 11 Sep 2017 09:52:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7o-0007lb-Qw; Mon, 11 Sep 2017 14:51:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:03 +0100
Message-Id: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/7] ARMv8M: some bugfixes and prep. cleanup
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gduytnl9/U3Z

Seven simple patches off the top of my v8M work in progress:
three bugfixes which are also relevant for v7M:
 * need to clear exclusive monitor on exception entry/exit
 * wrong BFSR bits set on aborts
 * negative exception priorities were being wrongly handled
and four code cleanup patches, including one which is a change
suggested in review of my last series which I forgot to make.

thanks
-- PMM

Peter Maydell (7):
  target/arm: Use M_REG_NUM_BANKS rather than hardcoding 2
  target/arm: Clear exclusive monitor on v7M reset, exception entry/exit
  target/arm: Get PRECISERR and IBUSERR the right way round
  nvic: Don't apply group priority mask to negative priorities
  target/arm: Remove unnecessary '| 0xf0000000' from
    do_v7m_exception_exit()
  target/arm: Add and use defines for EXCRET constants
  target/arm: Rename 'type' to 'excret' in do_v7m_exception_exit()

 target/arm/cpu.h       | 35 +++++++++++++++++++----------------
 target/arm/internals.h | 20 ++++++++++++++++++++
 hw/intc/armv7m_nvic.c  | 11 +++++++++--
 target/arm/cpu.c       |  6 ++++++
 target/arm/helper.c    | 43 +++++++++++++++++++++++++------------------
 target/arm/op_helper.c |  2 +-
 6 files changed, 80 insertions(+), 37 deletions(-)

-- 
2.7.4

