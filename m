Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2801447wrt;
        Thu, 18 Oct 2018 13:05:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61JFg6z0LvG4fwwOcyNhK8uR3MlCX34tvJvNvuyDZXC+AEt4GSwwrG0JZe5r/nRPZctZmI8
X-Received: by 2002:a37:3094:: with SMTP id w142-v6mr10356087qkw.131.1539893138239;
        Thu, 18 Oct 2018 13:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893138; cv=none;
        d=google.com; s=arc-20160816;
        b=ap4fmoStBmwCUFytryIc8eN8xGSJC02oOKUXjCoVNGDSaCNXXB5FeetnLynSc/6iL0
         AKvwawC0dQNpQ2I24C1HAKJKNpvXfdLhCyq7fr2XEBleGyB7Xu7Yg0b864F0HMAdDavc
         XR8GyLv5JLSKXDtitY2d5cGiQXl4RxKiSfD7BlIAj0jbw5Lc3pq8/UzykAS6165BRkT5
         v+FEqpt26p2ePMCmjePm92ZpjPbNNG1UeJmsRol1KdCibdyndH/m+Oc6V8jkI+r9U+iY
         EYJpme74UJ+bJABxwFQKkxby5jip1oNNCgFnRThUcBcpe1mXufdfOteeHujetMkdnCed
         8Rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=rgDL96DCp+AEqQ3BmofsZcUe4DoTyXbEbayrSXN0xF8=;
        b=WsRHwejPbStTfdHzy3opQ/1kumM9j/33aHd5Zv+Yvzjto7yEwmhvmTHwLYc6o3YtMr
         Tgo+F808fHJ5KBkx1bHzSn4LAz/TnBr2QE7KS/J8j1+uiGtPwlRBEXHF8EUvdKCOjY9C
         aGEwoGH9CWwejVpez0u57YzN08GykSXeavyhV90fTjMQWd/euPXA9776dwZ33B8Zll64
         71rGIZk+QUQMW7kx7+fXoQIjIZ52CXfERJ0cij3iqo8nHSoV2SDvXNwTW9thzmzjMKIV
         7MegrCrmSQeiyw4SS72D0RdUZEEjA/YagB1Ph9F+xCtxr7pbGul2PaWZPs4mYrZ6mN/S
         OCmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x190-v6si1541546qkd.185.2018.10.18.13.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEY5-0007XV-1x
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:05:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXK-0007TJ-Rc
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXJ-0006yo-SS
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:04:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35526)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEXE-0006vm-7g; Thu, 18 Oct 2018 16:04:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47E823001C5F;
	Thu, 18 Oct 2018 20:04:43 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6F9C68B2A;
	Thu, 18 Oct 2018 20:04:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:39 -0300
Message-Id: <20181018200422.4358-3-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Oct 2018 20:04:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 02/45] vl.c deprecate incorrect CPUs topology
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4JRpOjtfBfX

From: Igor Mammedov <imammedo@redhat.com>

-smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
so that total number of logical CPUs [sockets * cores * threads]
would be equal to [maxcpus], however historically we didn't have
such check in QEMU and it is possible to start VM with an invalid
topology.
Deprecate invalid options combination so we can make sure that
the topology VM started with is always correct in the future.
Users with an invalid sockets/cores/threads/maxcpus values should
fix their CLI to make sure that
   [sockets * cores * threads] == [maxcpus]

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <1536836762-273036-2-git-send-email-imammedo@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 vl.c                 |  7 +++++++
 qemu-deprecated.texi | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/vl.c b/vl.c
index 4e25c78bff..027d04c7ca 100644
--- a/vl.c
+++ b/vl.c
@@ -1235,6 +1235,13 @@ static void smp_parse(QemuOpts *opts)
             exit(1);
         }
 
+        if (sockets * cores * threads != max_cpus) {
+            warn_report("Invalid CPU topology deprecated: "
+                        "sockets (%u) * cores (%u) * threads (%u) "
+                        "!= maxcpus (%u)",
+                        sockets, cores, threads, max_cpus);
+        }
+
         smp_cpus = cpus;
         smp_cores = cores;
         smp_threads = threads;
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 11b870c5c1..5d2d7a3588 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -86,6 +86,18 @@ for these file types is 'host_cdrom' or 'host_device' as appropriate.
 The @option{name} parameter of the @option{-net} option is a synonym
 for the @option{id} parameter, which should now be used instead.
 
+@subsection -smp (invalid topologies) (since 3.1)
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where @math{@var{n} <= @var{sockets} * @var{cores} * @var{threads} < @var{maxcpus}},
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies will be removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+  @math{@var{sockets} * @var{cores} * @var{threads} = @var{maxcpus}}.
+
 @section QEMU Machine Protocol (QMP) commands
 
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-- 
2.18.0.rc1.1.g3f1ff2140

