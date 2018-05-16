Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1150402wme;
        Wed, 16 May 2018 07:02:27 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqqSvV71HOBOCOjkjRjRDvS4CcB6jCuZoRONQ+j9Y+xoue/Nge1qeDBCHTPaaxhunYg9AjE
X-Received: by 2002:ac8:3748:: with SMTP id p8-v6mr1032424qtb.47.1526479347112;
        Wed, 16 May 2018 07:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526479347; cv=none;
        d=google.com; s=arc-20160816;
        b=xVt8tUDTIoLprzeB/0saWeAIhY2bU/sZLWuKj6ZN0FiKqH2eoDNMHFMPqTNOujaaz1
         aBOtrvzsnBZSwzJMWbot2VRcDDtc4nb36NdyiV/nrThVvCZU8mmaxLOdrM2MRJMLwW+r
         PiF1TrYBPvKUKZzbEu2WhVf84I7us8BRvHNKnzNl6vnseTxw8/rA7XPrPqHGuctwsQAM
         t6r6LwRJ8csWcL2l0jcEXaDu/f/rbjV7e6I66eth3jpuRKEKWDcuYeVBeoAMWUiYWOcJ
         Vudk95yhkLGnMr3KCblzMNAAoraSe399ALF8pjKaYu/d4/qlh1iTH0BxahLVi8cK8nJ2
         dCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=i49DhDH5RqL/WzEf4kM8WsmH5xC2JrVAwwTipyPR3qw=;
        b=nqtMBGBZ90vF3r5xFKk4nuCNuLryAkWAXXYRpw+K5S9S0eFAEhFRlxH2awSCJIL2vF
         wB4VfBM1rO8638HFw6bi/zUJzJW6ziS1jZqHVYMVYx4cO5V/xWBH2J0oc7MRrtvDvLqd
         mtZVQFefRjT96Z4nIxT26HyCLi5hgXLgY6A+ZnRFptWgA0jj+K5wx7mW/8oi5MbV4ics
         oRpVP3F0E6d7SJ5PoGl0or3WC42Wx6P2+F/2HrxM9rKWiQLC5bmiOIDLozh1Oj4x4kQL
         ma3WFbb27I6q+4yBPHzNijUDdNyIzIYY0Q3aRQlxHQ+Umy6sdwzk/ycMWX6tD0ZTsfau
         iuQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a124-v6si2619276qkd.322.2018.05.16.07.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 07:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIx0c-0001Am-Jk
	for alex.bennee@linaro.org; Wed, 16 May 2018 10:02:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIwxT-0007Wh-B4
	for qemu-devel@nongnu.org; Wed, 16 May 2018 09:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIwxN-00064P-SD
	for qemu-devel@nongnu.org; Wed, 16 May 2018 09:59:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54380 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fIwxE-00060S-Pj; Wed, 16 May 2018 09:58:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC97C81663C0;
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
Received: from dhcp19-241-177.khw3.lab.eng.bos.redhat.com
	(gigabyte-r120-16.khw3.lab.eng.bos.redhat.com [10.19.240.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B6972026E0E;
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 16 May 2018 14:03:03 -0400
Message-Id: <1526493784-25328-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 16 May 2018 13:58:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 16 May 2018 13:58:55 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH 1/2] hw/arm/smmuv3: Fix Coverity issue in
 smmuv3_record_event
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qjIMbfuPLye7

Coverity complains about use of uninitialized Evt struct.
The EVT_SET_TYPE and similar setters use deposit32() on fields
in the struct, so they read the uninitialized existing values.
In cases where we don't set all the fields in the event struct
we'll end up leaking random uninitialized data from QEMU's
stack into the guest.

Initializing the struct with "Evt evt = {};" ought to satisfy
Coverity and fix the data leak.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index b3026de..42dc521 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -143,7 +143,7 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
 
 void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 {
-    Evt evt;
+    Evt evt = {};
     MemTxResult r;
 
     if (!smmuv3_eventq_enabled(s)) {
-- 
1.8.3.1

