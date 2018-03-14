Received: by 10.28.91.67 with SMTP id p64csp163912wmb;
        Wed, 14 Mar 2018 06:30:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsZbvcPzOp/iR/abGPJ55fHo7Bj1IrEATXP3zD8vgF+awQxG5MmesOTTUm34RblAxr09HYH
X-Received: by 10.55.245.14 with SMTP id l14mr6932042qkk.301.1521034259495;
        Wed, 14 Mar 2018 06:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521034259; cv=none;
        d=google.com; s=arc-20160816;
        b=xpgpJ6+25T95uSAHgJsXQjLRuD2qhDZogKfnSLQUKdLq6s2m8VuNR4Dadu943ITZ4f
         fIRTE60WDV+K4wBfE6Gt9PmzJwixosdQfW1hOYITKLz1ApQr4Y0lBWXkRg6o4x+hP0jj
         BjDrQ8IFL+gS3y0E2OxnUkyyj0FFo9xayYnW/3wo86qknU1pdQjr49xOurB+iF7URPTv
         wRxoPL6ioLiapIlhkuaJCnjfIe+kIbyw9SgKihmGQtLY7gy6wbwFYNZLrM7EPYx4XKJP
         zwZNJTITRBRn3rPz7Ct5PugyvbSP0oRfg/lxoDUjFq8LevFR1A+lTQ0/g1VD8C3Res45
         38ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=dqJcsHvm11zV8BTJ0GIkoNfduzXyUTKF4uwhY+9mHKo=;
        b=AFqzISdgMpycuFLPVAkWkqHn534CBcq03Zwqczh7E/fYRQXq2J1MHtlBm50xEDR6IU
         CcimMA+l68d8PytZ+B4H8cqhNKUp94wdoxgE/NNcEjQ84+QKh9uEdCY1HRASZ7V6V8oJ
         1lS+B8HfaoR+/sooS69Q+SHfja5ynLMmHFmPkC9aUeI5f7GD94ek+aDBR332wgSG7eyD
         /Y7WcrzfvcIlVZaxFRJCTzvqDMVIsnHmudhLqQX/wCgeTSrcq8jJGoAwgbX5MqQ8whXT
         6wK9iLjbp+Z2GybzvD9uAnlz7OluQLi+EvsvZAgB+NKwgYur2DxF6RS4P3k9ibAhUtVk
         r3aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si283041qka.230.2018.03.14.06.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Mar 2018 06:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ew6Uc-0004Vl-UZ
	for alex.bennee@linaro.org; Wed, 14 Mar 2018 09:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6UE-0004QU-12
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6U8-0001wG-7j
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:34 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:33583)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ew6U7-0001l6-MH
	for qemu-arm@nongnu.org; Wed, 14 Mar 2018 09:30:28 -0400
Received: (qmail 29330 invoked by uid 484); 14 Mar 2018 13:30:09 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.175489 secs); 14 Mar 2018 13:30:09 -0000
Received: from unknown (HELO localhost.localdomain)
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-SHA
	encrypted SMTP
	for <qemu-devel@nongnu.org>; 14 Mar 2018 13:30:08 -0000
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Wed, 14 Mar 2018 14:28:01 +0100
Message-Id: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] [PATCH v5 0/3] target/arm: Add a dynamic XML-description
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
X-TUID: vNtmWcJROk0P

The previous version:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=33190

Abdallah Bouassida (3):
  target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
    type
  target/arm: Add "_S" suffix to the secure version of a sysreg
  target/arm: Add the XML dynamic generation

 gdbstub.c            | 10 ++++++++
 include/qom/cpu.h    |  5 +++-
 target/arm/cpu.c     |  1 +
 target/arm/cpu.h     | 29 ++++++++++++++++++++-
 target/arm/gdbstub.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c  | 58 +++++++++++++++++++++++++++++++++---------
 6 files changed, 160 insertions(+), 14 deletions(-)

-- 
2.7.4

