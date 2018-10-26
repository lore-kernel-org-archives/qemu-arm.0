Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp524630wro;
        Fri, 26 Oct 2018 03:07:41 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dXUSCbJBAw15zsk64aN9r5QJZywpxCqq6CT2UhxxgNZs1l0XHPQo/7mtqXUL6i6WDpGZzS
X-Received: by 2002:ac8:3a81:: with SMTP id x1-v6mr2633145qte.370.1540548461742;
        Fri, 26 Oct 2018 03:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540548461; cv=none;
        d=google.com; s=arc-20160816;
        b=MRulw4xBsgB0fwP6Ab5wPQe/ZjV3hERJk96Ta/k4jGugU8VjNMTKrMd3PxWTpAwYO1
         mfVP8GlPV1fD7aULJjHxvvPShpgiIU6vls11ziuJlspaPg/BTjqpuiCHzSYis8bHWnfy
         deU2l3yvo4RGDxAKwKoxSwLBpQqMUZ7Jno1oIposhbMgOxZLs8A5WGHeTnxz82Ntcjx5
         HgZTo0aqO9INIdmVSVq8sKwzk80uG5fMJoAZsvp6pqg9G/Dvqj9F27RLDIaUeocTUeqH
         AldI9eL2jhX20pC/8ksMZzRbaVuLWqHeW2rfn2DtfDt5JtlUtIUb6X9aghHfzvnsyT7w
         oBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=KmVECDxncu4gV4IhVM8d/m/YaQvQYwQBwAvu6Fgmves=;
        b=eNGt+LPkXFGxqOos6gSyyz9O3yFpRCal+1WXJyN2VCdPpDo3q//Wt/y5cLezfcTyy/
         +E9Sl5e7N9TTbwNg0foJH5nwTQvW2IXOSWyG5Vy1gd7y6GOVvcxPPA38F7gUpA5octEY
         u98R22De/1CHnQlTpeA25xb9TQT0bO4hSEVh7HvFtMDjFkJDpargDMBaQfyjY63bFcsx
         DV9nejwA66Oq0ZRHb3zM5sZSj1/Vy4j8DbTvo1xE7gvghehrVRKU0aXqnFKQQ1kPYqEc
         lN/5wSOJjqDHVYiHcf7TqFzNtHUdLJ63qTkbrF29GibKkv3cDJi/O64/LI13JE07zvon
         Mjvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4-v6si2032551qte.269.2018.10.26.03.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 03:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFz1p-0006S1-5O
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 06:07:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFz1E-0006Ed-3n
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFz1B-0005b4-6i
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:07:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gFz1A-0005WO-Pk; Fri, 26 Oct 2018 06:07:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DFE483F45;
	Fri, 26 Oct 2018 10:06:57 +0000 (UTC)
Received: from thuth.com (ovpn-117-235.ams2.redhat.com [10.36.117.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2590B65F55;
	Fri, 26 Oct 2018 10:06:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Fri, 26 Oct 2018 11:06:49 +0100
Message-Id: <1540548409-22560-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1540548409-22560-1-git-send-email-thuth@redhat.com>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 26 Oct 2018 10:06:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/2] arm: Deprecate the Strongarm sa1100 and
 sa1110 processors
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 52xb1Fhb51L6

The deprecated "collie" board is the only user of the Strongarm
devices, so if "collie" goes away, we should remove the Strongarm
devices, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-deprecated.texi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index acf9809..0de5c7f 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -116,6 +116,11 @@ The @option{[hub_id name]} parameter tuple of the 'hostfwd_add' and
 The ``ivshmem'' device type is replaced by either the ``ivshmem-plain''
 or ``ivshmem-doorbell`` device types.
 
+@subsection Strongarm sa1100 and sa1110 and related devices (since 3.1)
+
+Without the deprecated "collie" board there is no other machine which is
+able to use these devices.
+
 @section System emulator machines
 
 @subsection pc-0.10 and pc-0.11 (since 3.0)
-- 
1.8.3.1

