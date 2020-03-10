Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp847795lfc;
        Tue, 10 Mar 2020 07:54:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtcNihS/q/3RiRdFN1kFHbvu7oFo+TCVGbOzI7+Ng3gVLNjahyO6DGrr9aw+gJ8B+d8gAfY
X-Received: by 2002:a05:620a:141a:: with SMTP id d26mr19910491qkj.312.1583852073512;
        Tue, 10 Mar 2020 07:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852073; cv=none;
        d=google.com; s=arc-20160816;
        b=h/uLCrKtGvmWyWz6ZxsILdvg2uPtF7ZT4CGw/lus2lDORbJGo9ZbIPjW1Z/MBwTFXO
         rjhN67fPYKmPLmQnE3oiQFBb2kfozWHMNPyPe8PYUn93qe5+GeJtelTzbUPkEraBw90Y
         6dooYF0TMlaZpeMlg46cI+6gFA9IC3xNKO0MF+YB9njIYl6TnVK2+zCI/4nJu+BjOPnP
         6uRyn3Uwc5D85pbpoZCNdjRPPECsrkFSLgVo4i2KGXc/QITi1xAX12ltI5/LylbSOCvH
         sAzkWzkWs9HtAO0sTZE+1YKpC6afqeQUR8hqZAGZR1Sb/avt/FW6iR8ERfJlcbyjRRiA
         xjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G/KHwqUmIzFAy34J8/MsFSLwJ3o2KuYwFWkhNhpavm0=;
        b=hIR+CqvN26bg8K4F+yxvRFQ9bBCPKMEUHpghSDm+L/SH3myFyY5pIJtkCnWvsMOayx
         qND9vVoZH0LYpOuTlXbawqduy05YQtxTQsbEFNhUZKA+vSz4ytMek94iBgYiEi9Qqm6e
         k47ZdSYSu61neiCsLZFQQ6WPUpeeppWdQDczzeJ3jzdwWNoWApAnElhiRo5Fx/5yTjny
         5uM0LYv6ty7tLLLEFrDd1nOb0sPIKsTThaOdC7VSHD/1XgV6MnE8nG5qlK5pvPbbBR3s
         Lq4g3pzhMfwyKAkWJiYahnYFXk1uVza5uhmonvwYv/LVrcY6XOnVeZ4nH0wP4hMO3sZT
         HoSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="UwU/+1Zt";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id c19si1384878qtq.349.2020.03.10.07.54.33;
        Tue, 10 Mar 2020 07:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="UwU/+1Zt";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2611B4A5BD;
	Tue, 10 Mar 2020 10:54:33 -0400 (EDT)
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
	with ESMTP id C9dUombsEQpb; Tue, 10 Mar 2020 10:54:32 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 02A674A534;
	Tue, 10 Mar 2020 10:54:32 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id DDC464A534
 for <kvmarm@lists.cs.columbia.edu>; Tue, 10 Mar 2020 10:54:30 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kYpDOOQgGtT for <kvmarm@lists.cs.columbia.edu>;
 Tue, 10 Mar 2020 10:54:30 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 4C1D24A523
 for <kvmarm@lists.cs.columbia.edu>; Tue, 10 Mar 2020 10:54:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583852069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1Y7SAIkQ6YKL70iv+PevVOHVnPkk+5bW/+E3fVVoME=;
 b=UwU/+1ZtJZ9W4XNSAK/8cXeFomiAdMBEFeFXRJrUERS2tlhL3DRmRJoi2RMYsuFCwfJ4DR
 WoRnbvB/rKPni3/mBjGt1vvUwivHLUvBBS6SSXco863P9z8xkv3Ki/EE+sCwG38Qyvuf/3
 3lN4UOrsZ0DCh2SYjT/asjeLHwseQ/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-iCXgruqYP3KD12YZLIk2GA-1; Tue, 10 Mar 2020 10:54:25 -0400
X-MC-Unique: iCXgruqYP3KD12YZLIk2GA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AACCF8017CC;
 Tue, 10 Mar 2020 14:54:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-85.ams2.redhat.com [10.36.117.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C111E60F89;
 Tue, 10 Mar 2020 14:54:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v5 01/13] libcflat: Add other size defines
Date: Tue, 10 Mar 2020 15:53:58 +0100
Message-Id: <20200310145410.26308-2-eric.auger@redhat.com>
In-Reply-To: <20200310145410.26308-1-eric.auger@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-TUID: CFzqZsAcfcXD

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
