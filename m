Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5281166lff;
        Tue, 14 Jan 2020 01:42:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3hhVXhr2s9Oo+x2FVVV2UibufVqGg+y81Yn5qx4NAhSAFA8AXG1JCevxp3zYYiYKeD3ux
X-Received: by 2002:a17:906:7fd0:: with SMTP id r16mr22053976ejs.319.1578994929315;
        Tue, 14 Jan 2020 01:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994929; cv=none;
        d=google.com; s=arc-20160816;
        b=IHeLFUI1XLyjwBXyAtJSrrNBg2QMthhr6Wr6YI/9NI6dGu7NMd5Y6Ifzk2wn7Apb/4
         m2LwugAKhJmI09Zu2YQPXMaZdqGr4hHV74hcWK1W1baeqhcaDdt2+IfmqqTSGKILi8/E
         w2flxxPCZXnpV1mQbXiddCkkDuJ8z+PRPAuGKC4759MZdO86e4xb77QrLWrEXK7oyNxN
         GJV27QET7oYUT8ZatzEfpUArAd7BzDf7si/APuY0xtH5QzsI4NaBn7HryWzF/zA5hOlH
         ourNVzFjEEVEcYNUFhIvkW4lncKDhpGE71D6wBsSQZNqnzwQfaV/2pTOhLKoft5M+mwk
         dvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=500ZmFBEwikUlMIqphyR61O1txsRuYhX1wQe8tn04xA=;
        b=VfFPV0/S9SBidBXJdJ9v3Fex6ULrJ3StFRjW2t6K0s0yJVVB5FynFwwdbUZ6UA4tQu
         0TE8IO8H4fycSmvC/5/tl/BpY9wNUAzOcWNaFkhQyqgCTY0Iks1nWrMZeAWBJeJ47XFU
         ltpr0yFFdOjjxvNqwiJ9XTjNo8vwCsEbftTcCeVBWnEdo/sLQgZmLOmHAKUhQUo9+Wat
         MIa2ZFY23y8XSBbKHIB/eEuNYCYFsMPi59nDjs8EnXph3Ib2DnZEs0pPw0zP8w7I7PQu
         8JVDrXL1R1Et2tnh8XOrSmcmFn1saLJn1qXHiDcjTgNkKVNQhzu6VCxVrYh4DkMgHPkK
         IImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=csxj8H0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si7943235edq.464.2020.01.14.01.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=csxj8H0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIi8-0000Nf-0I
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIUm-0007Aa-NN
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUk-0006hj-PO
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40885
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUk-0006hT-LW
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=500ZmFBEwikUlMIqphyR61O1txsRuYhX1wQe8tn04xA=;
 b=csxj8H0FXcQxk0lcbfooBhrl1PTtACd3MuB43+Rst7Cg5Zb95OfLyOYEouXN1rRJ38MtPZ
 AHxm5FeFEWUtMvtPG5QVrUc4MJe2cBt9j60kvAzyVqx8zapFtngXJ24q/cKHf9C2yy5QT1
 /G3bOIEsqhLjsDuTNnJkjp8HYJLWtsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-KilAbPkROj-XGZiDX_8CcA-1; Tue, 14 Jan 2020 04:28:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D539800A02;
 Tue, 14 Jan 2020 09:28:14 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963C6384;
 Tue, 14 Jan 2020 09:28:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/29] migration/postcopy: wait for decompress thread in precopy
Date: Tue, 14 Jan 2020 10:25:53 +0100
Message-Id: <20200114092606.1761-17-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KilAbPkROj-XGZiDX_8CcA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GNAsKCMQUgGJ

From: Wei Yang <richardw.yang@linux.intel.com>

Compress is not supported with postcopy, it is safe to wait for
decompress thread just in precopy.

This is a preparation for later patch.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index bdb0316892..c13b44b4d9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4421,6 +4421,7 @@ static int ram_load_precopy(QEMUFile *f)
         }
     }
=20
+    ret |=3D wait_for_decompress_done();
     return ret;
 }
=20
@@ -4452,8 +4453,6 @@ static int ram_load(QEMUFile *f, void *opaque, int ve=
rsion_id)
         } else {
             ret =3D ram_load_precopy(f);
         }
-
-        ret |=3D wait_for_decompress_done();
     }
     trace_ram_load_complete(ret, seq_iter);
=20
--=20
2.24.1

