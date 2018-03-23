Received: by 10.28.71.155 with SMTP id m27csp556933wmi;
        Fri, 23 Mar 2018 07:37:33 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvu/sP+UkHuUtr0ZIo4eah4vatO/8zSyBWrMiw/vzapoax3K3KoG2ppNhnhqx2nrFcnJwht
X-Received: by 10.237.54.161 with SMTP id f30mr42533316qtb.128.1521815853451;
        Fri, 23 Mar 2018 07:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521815853; cv=none;
        d=google.com; s=arc-20160816;
        b=djR0SBTUfUPFJXz5j63GyXpSgh5kCoyMaMbW36m59qSAOmLRrtwJ476G6Xva9Oo9yY
         Uhoxs7RHqNG1yfa3CNY53t6p2Hdz1RMBlUcw/VGlkjjp7MKbCaJ4KS/wLzBC3GCHjLIx
         h63ak6rjfUnuaWTOxWzzoMphwABHZWITuJEcabsNuVmv3sbXsmeZCU9DmOJR0cYq6v+O
         979O7a/BZMtnDA1u0trH62M4JqckP/1dlfYXv0lXaFCU1JVAZWORzWtrHOWntDNRuIVo
         znFa+gX6zclHx+XoIC4wDGDARx9d5rDO5PLJqYNDV/Wha3rpBQLQnA/wySJ7wUy120wZ
         2VZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5wKmzbUKtw4FnzTEL63X00nsXkzYAVHDrN2oCw/ACHk=;
        b=dEptfIlREv8/FQUa8LrHFr3atfV6AFOxtKermNlGJhxRVFbGDtZjbuPzfbXh8rUd+C
         6ntwfDree1shIQ8KdNbpqJrXTsOryvW444ZWxMc9B6Zxp7pO/S+KBJwWMPNNLeWaXAX7
         I73Z78v9tya2AWx3MSJEcVsYotCxd51AUzLbDbW5XxiZg5QgpQ3RUCVylV0JsVrCvU81
         mXwYyeD4MeY7kBsrVjJSvU45oq0U6YCFJ0Ex//mB4Y8RdPO0mZy+io0OIL5QhUf4XjIh
         LE5/If1bG4Qccx3kdlIuFKMerDtT0G3hnVxCrXlTocQZfGNdG0TGcQKSrMSqY2OIhKTg
         vV6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n4si6082787qkb.276.2018.03.23.07.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 07:37:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezNoy-0008Sq-UC
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 10:37:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkG-0004BU-5N
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkF-0003FL-AS
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50668 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNkF-0003F4-5f; Fri, 23 Mar 2018 10:32:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AAF2EB70F;
	Fri, 23 Mar 2018 14:32:38 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A12012023233;
	Fri, 23 Mar 2018 14:32:32 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Mar 2018 15:32:01 +0100
Message-Id: <20180323143202.28879-5-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:38 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 4/5] qdict: remove useless cast
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AH1j2CoehY03

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

