Received: by 10.28.91.67 with SMTP id p64csp472200wmb;
        Wed, 28 Feb 2018 03:02:29 -0800 (PST)
X-Google-Smtp-Source: AH8x226eL6EuFdblcaNxVD4ArB9Y+yzc+ncg2MeEQyxyfIIFptMWynwg0er9m0bdRJYNcShkAGCY
X-Received: by 10.129.125.65 with SMTP id y62mr11447151ywc.190.1519815749748;
        Wed, 28 Feb 2018 03:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519815749; cv=none;
        d=google.com; s=arc-20160816;
        b=NDTODOw10oYyAYcL/HZSwol7jdCIGSKWUb9QVWBTjbjMxaqF0EYlVXBXtKe4eOqIOu
         CZ78jTTp/rsmWP/cFq/CW2B+SqXX8xzM6Y8eLsfliUboGKZEJCpxjUiMlsFhWbfXqggh
         o5jWMiAqNhdlc4JnNj0Q+q/a1RXg0I8FU3uTszz0qEMLDaaa/LuvXjYF7qeUrPZZzBfc
         yjwuKuv8OYjb9uhbTueVxY1i18HcyOznEK72lyznposGCzaur2P6V1fAMlRIp3tTVvw6
         wLehLTtbSa0K69r3NmiE2naAGF+x82hxJPp3nA40iYP0iVadi2cCPRyN5MF4zhyL2cS1
         couw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=z97a+rCIVoVDnBbiwt9v3qI8q2WOef/rfk0Zf0B4jP4=;
        b=HSubqlIhMI2Z+DZI0fzjgFjdhkCADqfcvHfCPt9TxDeRAP1/g1Mf8Z5XuciuVHePub
         em1t8BA+E4bIJfIXCU0OBpwIpzneFAtUNg7HCuwCX4sMxpGM3zprSMOHHMuSkc5EyCc/
         waC630zG2TfwWji3NC8YPJoWbxlXY98+O77D7b35JL4dwpsdlq1aUfTbTHL8e0PNlM5s
         Cl8oZAQfbJqTxZmZiFK4STOzwuGeyFM499KfXBRGMlnHxWl6q2l6i9ngNWxBIr+OQ2Wn
         EjBJaMile7as9SC14klac086IdGxurCAdTRHxGRW7aqREJtZvE+iXoc0N3WhnoLC26bz
         WLfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l33si229737ywa.467.2018.02.28.03.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 03:02:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqzVF-0003au-70
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 06:02:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzV2-0003aJ-T5
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 06:02:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzUx-0007KD-9y
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 06:02:16 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:42329)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1eqzUx-0007Bz-0G
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 06:02:11 -0500
Received: (qmail 970 invoked by uid 484); 28 Feb 2018 11:01:52 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.215932 secs); 28 Feb 2018 11:01:52 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 28 Feb 2018 11:01:51 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 28 Feb 2018 12:01:21 +0100
Message-Id: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v3 0/4] target/arm: Add a dynamic XML-description
 of the cp-registers to GDB
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
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wlj4nOJIIYJp

The last exchange:
https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03618.html

- Add a new "ARM_CP_NO_GDB" bit field and enable it when creating CP_ANY
  wildcard aliases.
- Add "_S" suffix to the secure version of a sysreg and fix the reg names that
  were manually containing (S) or (NS).
- Add the XML dynamic generation and add a callback to read these sysregs.
- Add a callback to set these sysregs (I put this as a separate patch as
  we still discussing if we'll give a write access for these sysregs from GDB).

@Peter: Intresting advises from your last review, Thanks a lot ;)


Abdallah Bouassida (4):
  target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
    type
  target/arm: Add "_S" suffix to the secure version of a sysreg
  target/arm: Add the XML dynamic generation
  target/arm: Add arm_gdb_set_sysreg() callback

 gdbstub.c            |   7 ++++
 include/qom/cpu.h    |   9 +++-
 target/arm/cpu.c     |   3 ++
 target/arm/cpu.h     |  22 +++++++++-
 target/arm/gdbstub.c | 116 +++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  |  35 ++++++++++------
 6 files changed, 177 insertions(+), 15 deletions(-)

-- 
2.7.4

