Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1504699wrq;
        Thu, 12 Jul 2018 08:31:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe04R0oENs/hsSgC69AdE/uR5uGJ1V97WwVdKP+bgTcShMG4Eli71SADt6HfZIXaNnRTmdX
X-Received: by 2002:a37:318b:: with SMTP id x133-v6mr2219037qkx.16.1531409486801;
        Thu, 12 Jul 2018 08:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531409486; cv=none;
        d=google.com; s=arc-20160816;
        b=J1HgX86y+Bpm9d/lXttCZiXM8//SvnwJbOIWl3dCVcH5SJvtjkh4PRJsAowGMfG6V1
         yhrGgd5JXpJdKLmOk/5cfLF0auXomllLgnirJuL9NlP40xZ3gKrHIpp7P2nnl4ngm7BR
         w1ElYKmjlD2CNQqusIew9cF6OTwktrEt9e+o/aub49cHzT4uii66pHg69iarcXhnWP4s
         4p61cS53o5dOnhtGQ2GLFD5qXhN9WNhud5eQl5AKFHnTRnMTuVE4GrB23Yhi8x6kXgPz
         WN7XXMwZpW7K70GH1EbgxkUU44esTTLPbxoG7/qLIRVSvAb1VN2z0zE37ybWU6QSBDpd
         b0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=YIeY4wGn1vh/DPNdTFnGaLLG+4eLS5yeK1gnPb9TnpI=;
        b=w8qLllvmwuAgP7HEejbRqnCJbHQn6kitN9BVqNPslRJZrKlqS1OV0fSW5400bcwaQQ
         RLACjyYCyvKTtA+qWrFYT2Z7b3YdFjVtVoIAJ39qWsdERbp84WYMuD2WL8itWfmocFJY
         ZDpKpa2sNXgZMCJ5j6pIFVFqCAM9b2PGl0LLQJ5XtYnXQKfoMPkcl3K/P+guZrKgpg2z
         2tGmhW5kv7S6mxFWEsRbvHmMn26ZHl4d6PnDNKptW7BKeeP8Ku95Asi8LnS5eOmW85iF
         +diPgkzVL6C3kjhfJ6zhwX31pEcJbS3djoWAXtNmRBylq+OvvKk2FLHBVxnbNGqNOmnf
         7HIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i63-v6si11371617qkc.264.2018.07.12.08.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddZ0-0005Ge-3T
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:31:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYk-0005Fo-1z
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fddYg-0007kY-Vq
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:31:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57476 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fddYg-0007jk-Rw; Thu, 12 Jul 2018 11:31:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37FC54022909;
	Thu, 12 Jul 2018 15:31:06 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1AF71C677;
	Thu, 12 Jul 2018 15:31:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jul 2018 17:30:58 +0200
Message-Id: <1531409463-3843-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 12 Jul 2018 15:31:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 12 Jul 2018 15:31:06 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v1 0/5] Fix crashes with introspection
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
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qE13rdCjt/eI

As discovered recently, you can crash QEMU with a lot of devices
that do not get the reference counting of child objects right.
You just have to run 'device-list-properties' and call 'info qtree'
afterwards.
This patch series fixes a bunch of these problems in the ARM code.
I did not fix all problems yet, since it is quite time consuming
and I first want to get some feedback whether this is the right
way to go or not.

Thomas Huth (5):
  qom/object: Add a new function object_initialize_as_child()
  hw/core/sysbus: Add a function for creating and attaching an object
  hw/arm/bcm2836: Fix crash with device_add bcm2837 on unsupported
    machines
  hw/arm/armv7: Fix crash when introspecting the "iotkit" device
  hw/cpu/a15mpcore: Fix introspection problem with the a15mpcore_priv
    device

 hw/arm/armv7m.c       |  9 ++++---
 hw/arm/bcm2836.c      | 19 +++++--------
 hw/arm/iotkit.c       | 74 ++++++++++++++++++++++-----------------------------
 hw/core/sysbus.c      |  8 ++++++
 hw/cpu/a15mpcore.c    |  8 +++---
 hw/intc/armv7m_nvic.c |  5 ++--
 include/hw/sysbus.h   |  3 +++
 include/qom/object.h  | 19 +++++++++++++
 qom/object.c          | 14 ++++++++++
 9 files changed, 93 insertions(+), 66 deletions(-)

-- 
1.8.3.1

