Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp796127lfc;
        Wed, 11 Mar 2020 06:51:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvhcBKjwBB+oRxLz2e4O0regyGl5epb0PnbysXsPSbEyxl40ifyipp2tCWuNbgQYbnSQIgs
X-Received: by 2002:ad4:58b3:: with SMTP id ea19mr2975166qvb.80.1583934698363;
        Wed, 11 Mar 2020 06:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583934698; cv=none;
        d=google.com; s=arc-20160816;
        b=g+XG24d/CP6aoRtoaackrfzMnpTy0UiB1qYauPzGTIQDDoK4jdXh0zezORBTP6JAZ/
         sfsTZQvsgprA5Aa/J3bOB56k1m+4u63Gv7NYC+cy9BAu9XOlppQCPVjfmzguqvdAucsv
         M6gj1Hbng02DOKxQG6kVgdLrlRoc0xW/P7g7yNV5YxLOzTB7NwJ/+Iv+IQT3Uv20AR8t
         mJwC2NMw2BLC6gqDhkbsW2sV3PxsjrkM5eM/bXGSiw4tARDvz+XY2FWHR0/TcpVlQrWw
         z/MeW39iHcLGK3YyffdpPzCNkU2jtCf3RngD4aG2MRMY5n2tUj51AQWfoYfO0HLp4UCf
         E8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G/KHwqUmIzFAy34J8/MsFSLwJ3o2KuYwFWkhNhpavm0=;
        b=YnV9csZzKvNkHuOhJ+WF6qKOuXHSo63YwOS7ayfUCUk3RogTwfOg8HEKqk008U0y2I
         D76Cai1LvPfW3cLch70DzTZ1zktGO8xriPimlYpo1lTwHl4IJkSMUj/e3cEobgHm9SKK
         nYkLiOVE5sU1/DHfF1Qmaws6fT45+YcKmOg+ZbJN4M17pACjM+4TtCZMRp0TlLE0VtQ2
         Rlg7uKp6pCFYuVcDEwBO9NHxjN4Hpy+nGlcgI4xuAr9BbWM1jP9PWlCd9Qes4qxK9Qv8
         xHQQpRpjyISQg6cEHxo/EsnPogj3ZC6UZ8T9PGOnmgCxWEcAbTTMgD2nToxzHlafGXjd
         XaPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=BR52yY1k;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q21si1062319qtr.355.2020.03.11.06.51.38;
        Wed, 11 Mar 2020 06:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=BR52yY1k;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 117E44A4F7;
	Wed, 11 Mar 2020 09:51:38 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiDpiSquFPBp; Wed, 11 Mar 2020 09:51:37 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id F1B474A534;
	Wed, 11 Mar 2020 09:51:36 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 953804A2E5
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 09:51:35 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vFxTs42kFbq for <kvmarm@lists.cs.columbia.edu>;
 Wed, 11 Mar 2020 09:51:34 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A880A4A4A0
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 09:51:34 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583934694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1Y7SAIkQ6YKL70iv+PevVOHVnPkk+5bW/+E3fVVoME=;
 b=BR52yY1kALI/uZjf5+X2Itj1sm/vKwRESLjcHczeipmXdT4oFuvRxX2Z3Qttoo0GEgRoiv
 NWnrlMfZkbdmvCfNYRbJVLsWrBKxuGQNPYn1yvxN2NkM4UtIJF4WJ96PGjVEV5EJkb4J0r
 0eCH5Y9025iFsK52bOHYbji0a/QKp+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-WVKaapncPDq1YirsLZ4soA-1; Wed, 11 Mar 2020 09:51:33 -0400
X-MC-Unique: WVKaapncPDq1YirsLZ4soA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75D6C800D4E;
 Wed, 11 Mar 2020 13:51:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B323E9296C;
 Wed, 11 Mar 2020 13:51:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v6 01/13] libcflat: Add other size defines
Date: Wed, 11 Mar 2020 14:51:05 +0100
Message-Id: <20200311135117.9366-2-eric.auger@redhat.com>
In-Reply-To: <20200311135117.9366-1-eric.auger@redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: andre.przywara@arm.com, thuth@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: i8k85aDdxbUY

Introduce additional SZ_256, SZ_8K, SZ_16K macros that will
be used by ITS tests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 lib/libcflat.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index ea19f61..7092af2 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -36,7 +36,10 @@
 #define ALIGN(x, a)		__ALIGN((x), (a))
 #define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
 
+#define SZ_256			(1 << 8)
 #define SZ_4K			(1 << 12)
+#define SZ_8K			(1 << 13)
+#define SZ_16K			(1 << 14)
 #define SZ_64K			(1 << 16)
 #define SZ_2M			(1 << 21)
 #define SZ_1G			(1 << 30)
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
