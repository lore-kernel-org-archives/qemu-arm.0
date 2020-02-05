Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp187481lfp;
        Wed, 5 Feb 2020 06:42:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbyehDn+VB1v4+IFbXchhPjABWBNTNFvDryfPj9gs9Ton/ISygVDJqo45rWxOdGHqPWS4v
X-Received: by 2002:a0c:e98e:: with SMTP id z14mr33026131qvn.158.1580913748309;
        Wed, 05 Feb 2020 06:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580913748; cv=none;
        d=google.com; s=arc-20160816;
        b=QkI3XWkwQnKhRZ9bgwmtI2YjTPbWIrOUWlzpdP3ci/IWBFj43F82Isa/WcsRw17jxh
         Ug5quTlJhDkPut1Ucv5WdvhKbQkBuo+F6kYeHzLSQGotPn/NKa4WgyKrqXobmaOftGPV
         H+gXrLci4AI3Y9miSD+dtShr0H+KMk7zxqR+6nT0ZTw+3tb08PZ6sXFVjIjAdVLsoqEM
         dK9bCqqCWFD2ZpyLye3JZOpKRk0v/815Uq/MGFikKIj2Vyqq0dU8Um6vhxKhzvgvJrXV
         jj3SYZEw24quan63hrGtP8y4fJAChur4mpVTFrDClVi4HqP4vvBVHziW1h5vvVMnAJjj
         FDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=0kyKvGWlr4sHpTV4rEePrOoocfQGRqpMub/4CaZCDWU=;
        b=HyAk0f7a5dmq/kFKHm4bJ03+ge/mRidhkyhbfBfP321h1ozwDUy/bDclK9X/ceOe4u
         LAQbe7FKjzpY5drNKHnAMrVCqDA1oKKhviRnrJHwxsyoPIxj5djfNl+RCEGJtzE1Z2XN
         tWVK4okM5uS4Qod9S1Vc9trJoy4dMhw9TPmoiw0W4lyOhvtN51fb+qAn+VpzYUVCAO88
         haqsWISqIVOAxxjA0Ch6UwZ1ZoN2M7ah91RFfQGQEmIDnWhwgi1wm8bDLF9v5rRTgBgL
         eF6UYmgzqWMKu/iX9FN1JHMfMuibjPsVxCc6ltqAoTSFDnCOPj7mXSyl1hnVlW3tK9aR
         uwaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YBxf/jvO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp4si22918qvb.66.2020.02.05.06.42.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 06:42:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="YBxf/jvO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izLsp-0000av-QE
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 09:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1izLs6-0008U1-PL
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 09:41:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1izLs5-0002fc-Ev
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 09:41:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25660
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1izLs5-0002dq-AP
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 09:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580913700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kyKvGWlr4sHpTV4rEePrOoocfQGRqpMub/4CaZCDWU=;
 b=YBxf/jvOF5OsbREWHueIuGqxg8EGWndDFGc0psXXpa4SpYletUs/AH7/uelW3SSx47QTjK
 o+Tnh4VE1c/PxEqgkot8yf09HkFFhH9qRNSmFQ4DqItjqynpbc8YP2lFQnsjhXVT2G+Z8Q
 OlkPsLKaaKu+AlUSR5hRcVFRmHHfy08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-NuAAIiOrNUyN7Gis0Mgd1Q-1; Wed, 05 Feb 2020 09:40:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B48861268;
 Wed,  5 Feb 2020 14:40:29 +0000 (UTC)
Received: from localhost (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2748A1001B05;
 Wed,  5 Feb 2020 14:40:28 +0000 (UTC)
Date: Wed, 5 Feb 2020 15:40:27 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] migration: Optimization about wait-unplug migration state
Message-ID: <20200205144027.55qsz3j7qf26pzfd@jenstp.localdomain>
References: <20200204050841.44453-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200204050841.44453-1-zhukeqian1@huawei.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: NuAAIiOrNUyN7Gis0Mgd1Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7V2bZo/WzwD

On Tue, Feb 04, 2020 at 01:08:41PM +0800, Keqian Zhu wrote:
>qemu_savevm_nr_failover_devices() is originally designed to
>get the number of failover devices, but it actually returns
>the number of "unplug-pending" failover devices now. Moreover,
>what drives migration state to wait-unplug should be the number
>of "unplug-pending" failover devices, not all failover devices.
>
>We can also notice that qemu_savevm_state_guest_unplug_pending()
>and qemu_savevm_nr_failover_devices() is equivalent almost (from
>the code view). So the latter is incorrect semantically and
>useless, just delete it.
>
>In the qemu_savevm_state_guest_unplug_pending(), once hit a
>unplug-pending failover device, then it can return true right
>now to save cpu time.
>
>Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>---
>Cc: jfreimann@redhat.com
>Cc: Juan Quintela <quintela@redhat.com>
>Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>---
> migration/migration.c |  2 +-
> migration/savevm.c    | 24 +++---------------------
> migration/savevm.h    |  1 -
> 3 files changed, 4 insertions(+), 23 deletions(-)
>
>diff --git a/migration/migration.c b/migration/migration.c
>index 3a21a4686c..deedc968cf 100644
>--- a/migration/migration.c
>+++ b/migration/migration.c
>@@ -3333,7 +3333,7 @@ static void *migration_thread(void *opaque)
>
>     qemu_savevm_state_setup(s->to_dst_file);
>
>-    if (qemu_savevm_nr_failover_devices()) {
>+    if (qemu_savevm_state_guest_unplug_pending()) {
>         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>                           MIGRATION_STATUS_WAIT_UNPLUG);
>
>diff --git a/migration/savevm.c b/migration/savevm.c
>index f19cb9ec7a..1d4220ece8 100644
>--- a/migration/savevm.c
>+++ b/migration/savevm.c
>@@ -1140,36 +1140,18 @@ void qemu_savevm_state_header(QEMUFile *f)
>     }
> }
>
>-int qemu_savevm_nr_failover_devices(void)
>+bool qemu_savevm_state_guest_unplug_pending(void)
> {
>     SaveStateEntry *se;
>-    int n =3D 0;
>
>     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>         if (se->vmsd && se->vmsd->dev_unplug_pending &&
>             se->vmsd->dev_unplug_pending(se->opaque)) {
>-            n++;
>-        }
>-    }
>-
>-    return n;
>-}
>-
>-bool qemu_savevm_state_guest_unplug_pending(void)
>-{
>-    SaveStateEntry *se;
>-    int n =3D 0;
>-
>-    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>-        if (!se->vmsd || !se->vmsd->dev_unplug_pending) {
>-            continue;
>-        }
>-        if (se->vmsd->dev_unplug_pending(se->opaque)) {
>-            n++;
>+            return true;
>         }
>     }
>
>-    return n > 0;
>+    return false;
> }
>
> void qemu_savevm_state_setup(QEMUFile *f)
>diff --git a/migration/savevm.h b/migration/savevm.h
>index c42b9c80ee..ba64a7e271 100644
>--- a/migration/savevm.h
>+++ b/migration/savevm.h
>@@ -31,7 +31,6 @@
>
> bool qemu_savevm_state_blocked(Error **errp);
> void qemu_savevm_state_setup(QEMUFile *f);
>-int qemu_savevm_nr_failover_devices(void);
> bool qemu_savevm_state_guest_unplug_pending(void);
> int qemu_savevm_state_resume_prepare(MigrationState *s);
> void qemu_savevm_state_header(QEMUFile *f);
>--=20
>2.19.1

Looks good to me. I tested it and it still works, so=20

Tested-by: Jens Freimann <jfreimann@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>=20

regards
Jens

