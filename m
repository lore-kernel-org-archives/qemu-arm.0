Received: by 10.28.71.155 with SMTP id m27csp541377wmi;
        Thu, 22 Mar 2018 09:16:30 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsGF9Xtj1/JpPWN7w9nWD7DGZKcxBva+eKhsLyM0Iz7sGqwHcpMT39rw65XJmtepapKTxZI
X-Received: by 10.237.54.65 with SMTP id e59mr16265904qtb.28.1521735390575;
        Thu, 22 Mar 2018 09:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521735390; cv=none;
        d=google.com; s=arc-20160816;
        b=RZ8QEiKL+bEht7D73fvcYAHTE6Xvf4h8S0+dwEwBKIG9DZV09I6+3JeLbV9F//PxD4
         wSYz/ieSOqfigNUr5v1aURb0C8KDn2K1weKv6qRfo4xYK58FLdlmX4Va+AzYa6LFO+SA
         43+V1D/c+Aub0OcL5XMdSSJi6nMGGkEyzahTNbRRFja3nmv2jZ8+hytZfqiqwtSfmoR2
         JkYy7PiF9pohKXoLO+tSPxZ/3ZZK9+aaHFjLQIzLj4+swh4V5S6Hs4ziIB2F0JMOj3v2
         myaHqb1bY9T7+ifQMsdiL3hiGephbkN449yX4hgjj22YDq/p3s6nq3crO8kv3yiIP1/S
         W3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5wKmzbUKtw4FnzTEL63X00nsXkzYAVHDrN2oCw/ACHk=;
        b=Mku+UCSpJM/pV9EdqnRRA+I8A+WI9Bg5Umga0pgKeIcjgDlZOL54xSIb+OwHivYGHz
         E+1n7xr4jDEAG390rEh+TXuPQDhHNLyatjacOQ9prbUkwiFO1VozRmWQF9riMF18etnw
         M7tdYqA4feQhaGdJEkWZecIdVGnZCgSFZBYCa8SzMGI36FInTmfauZIH+GtVLVPmMfIt
         PaCCsVEP0Nf6XBVOB7ZqD2iGsssoMLUIgf7fdtKGtljj3Psd1MLYlWXjRBsYBrx+PeCe
         FqFtVbHW/tTaDYNMKytohgiO8wNeyiBunMetN+odDsyi38rv6BOzUNVwUBcmn4TKMDQM
         CMcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si1543745qkg.132.2018.03.22.09.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez2tB-0005h5-Ty
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:16:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2q1-000289-BB
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 12:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2px-0007Qn-3p
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 12:13:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51174 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ez2pm-0007Jy-DC; Thu, 22 Mar 2018 12:12:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDA0C8182D3A;
	Thu, 22 Mar 2018 16:12:57 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 619E02023230;
	Thu, 22 Mar 2018 16:12:50 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Mar 2018 17:12:25 +0100
Message-Id: <20180322161226.29796-4-lvivier@redhat.com>
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 16:12:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 16:12:58 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH 3/4] qdict: remove useless cast
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zi2y0Y/gcAK+

Re-run Coccinelle script scripts/coccinelle/qobject.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 block/nvme.c | 11 +++++------
 monitor.c    |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 8bca57aae6..c4f3a7bc94 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -695,12 +695,11 @@ static void nvme_parse_filename(const char *filename, QDict *options,
         unsigned long ns;
         const char *slash = strchr(tmp, '/');
         if (!slash) {
-            qdict_put(options, NVME_BLOCK_OPT_DEVICE,
-                      qstring_from_str(tmp));
+            qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, tmp);
             return;
         }
         device = g_strndup(tmp, slash - tmp);
-        qdict_put(options, NVME_BLOCK_OPT_DEVICE, qstring_from_str(device));
+        qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, device);
         g_free(device);
         namespace = slash + 1;
         if (*namespace && qemu_strtoul(namespace, NULL, 10, &ns)) {
@@ -708,8 +707,8 @@ static void nvme_parse_filename(const char *filename, QDict *options,
                        namespace);
             return;
         }
-        qdict_put(options, NVME_BLOCK_OPT_NAMESPACE,
-                  qstring_from_str(*namespace ? namespace : "1"));
+        qdict_put_str(options, NVME_BLOCK_OPT_NAMESPACE,
+                      *namespace ? namespace : "1");
     }
 }
 
@@ -1082,7 +1081,7 @@ static void nvme_refresh_filename(BlockDriverState *bs, QDict *opts)
                  bs->drv->format_name);
     }
 
-    qdict_put(opts, "driver", qstring_from_str(bs->drv->format_name));
+    qdict_put_str(opts, "driver", bs->drv->format_name);
     bs->full_open_options = opts;
 }
 
diff --git a/monitor.c b/monitor.c
index 6ccd2fc089..6e7667d82f 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4316,7 +4316,7 @@ static QObject *get_qmp_greeting(Monitor *mon)
             /* Monitors that are not using IOThread won't support OOB */
             continue;
         }
-        qlist_append(cap_list, qstring_from_str(QMPCapability_str(cap)));
+        qlist_append_str(cap_list, QMPCapability_str(cap));
     }
 
     return qobject_from_jsonf("{'QMP': {'version': %p, 'capabilities': %p}}",
-- 
2.14.3

