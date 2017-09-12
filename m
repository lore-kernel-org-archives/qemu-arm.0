Received: by 10.223.172.38 with SMTP id v35csp7104395wrc;
        Tue, 12 Sep 2017 07:05:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBhbhTGgnP4i43DvBLaDzyUE7Mq23AXh+iZ1K6HHaPUp7qxUpm1ocMG2k2DBjWsg8Hv4g01
X-Received: by 10.55.161.216 with SMTP id k207mr18797629qke.108.1505225118726;
        Tue, 12 Sep 2017 07:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505225118; cv=none;
        d=google.com; s=arc-20160816;
        b=p5UonKDBuymd/OuVFG0hNEgnnERdwN5rNe236mxTKxU06AbBLRwpYE/z6LL2H7ES6V
         RAYfpZhtejM/PWtBRahwCkxVnTZVVsN8E2jOSTArWBLV0vERhzmQKzSyIKyd5U47Dyla
         Vjo7ERonq9/DDvrDsp4pL3EA5jJgaAylIVdlTEfw506bx48R7d6levUMCiMR10SQ38nn
         Pj52+frbo5jxNfRbSjWQyhGM69e2gsXjLxxF72YY7AAo8LmRuXQ5cAPYVOdWG5xV1BBZ
         GMgC6ehwjpYJEPWOINBViFWQMXG58gfuLOXsIB0h9trgePO4AHfxywVWpb/7Z6qLFkw6
         qw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=8rlHOdHqTgzJjV8TIkKBrPpKSNK/xTFfQxrvanGLHpU=;
        b=xArTKSHP7HJ6HzJv0bODgGM9X9w/wWksPu2PbEUSq4gVSQiBXy6A18O+I3bZdNby//
         GbiauK23xDrpsl57WIXTNu7XlQ3lXHVaCLhJx6Cq6ARPrcDTzQ/WLoBa2gu7SP6Nfo00
         zkUfNcsO1Kh7PW4KaIyZjErWu4Ec/PkOWmeUyEYWocJtvb7BFpGMxAkstBeAMRGMYyJk
         Mh8eBkl7IESfTPwAS3mlG2e5B+zRmjftpEwiBf1vRVWeaBQA6pzCE2iHCIL7G+nCpnTJ
         Ha1dGb4EsAduvOBWM78yqpytzyNU5qkrw1BVIs2dIlOcktyXMVSZyYqxhrXSd7Zuz7T1
         hMBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k20si1900903qtb.405.2017.09.12.07.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drloR-0000hK-TF
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:05:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllY-0006Pj-80
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllS-0002jS-GL
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drllS-0002ii-Bf; Tue, 12 Sep 2017 10:02:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F86F356C9;
	Tue, 12 Sep 2017 14:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4F86F356C9
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1E046BF7C;
	Tue, 12 Sep 2017 14:02:00 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 16:01:49 +0200
Message-Id: <20170912140149.7692-4-lvivier@redhat.com>
In-Reply-To: <20170912140149.7692-1-lvivier@redhat.com>
References: <20170912140149.7692-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Sep 2017 14:02:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 3/3] tests/hmp: test "none" machine with memory
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nqjqtC75PWal

and add a test case of dump-guest-memory without
"[begin length]" parameters.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/test-hmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/test-hmp.c b/tests/test-hmp.c
index 729c0339f7..6b2dd5f8b8 100644
--- a/tests/test-hmp.c
+++ b/tests/test-hmp.c
@@ -35,6 +35,7 @@ static const char *hmp_cmds[] = {
     "mouse_button 0",
     "device_del mouse1",
     "dump-guest-memory /dev/null 0 4096",
+    "dump-guest-memory /dev/null",
     "gdbserver",
     "host_net_add user id=net0",
     "hostfwd_add tcp::43210-:43210",
@@ -159,5 +160,8 @@ int main(int argc, char **argv)
 
     qtest_cb_for_every_machine(add_machine_test_case);
 
+    /* as none machine has no memory, add a test case with memory */
+    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
+
     return g_test_run();
 }
-- 
2.13.5

