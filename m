Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1332561lfp;
        Tue, 21 Jan 2020 03:08:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUl6bgL7nW+jE8XAFZrz7CR3UOjoVaEpTckd4PvQYJLTFsgIlutT0p5FVrcD/aZ3ATUaV8
X-Received: by 2002:a17:906:d781:: with SMTP id pj1mr3814177ejb.195.1579604880523;
        Tue, 21 Jan 2020 03:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579604880; cv=none;
        d=google.com; s=arc-20160816;
        b=Tu0AagugUmvjzGloXEktFYyHyo0bXok9uHwYnStufSpnGwAeWpnmNIpbTSWc8k2Yod
         aNtQdqqE8nNX8rUqcipjnbu56bXh/i4ukMoXNWMWAckNTznec32iZbTSMgouLCbRpa1k
         3f8fSRV/u49XXpZ9FRypjWVsxyNAPE3nrF+WIAvj0Q8Rr8hwzSP4Hf7ZuCoUIoiMqidM
         TUayQ2WeMpwSelKKXvhoUF5+nDZzCuoSkt+/VVps0/j3PctsJhY6mfDefxp3zfZSDkkb
         WWDrO9RkpuB9zTPqlKPA1bA4z/gdswt8jeDqykVAP+qb9KoRtEWPwAMCc/T/2KS/166j
         AbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CleyiTyFzeU7YFGR9t8XlXBZmAxEriIlOMwBzucwkpQ=;
        b=HcmReUcqo4HnOVsXlutsZwaQGAZyjfP+n85AkwBH1B/SSL8UNsG6FqbrN7yY5bpwgs
         xhZMT9Sv2CrRjypF177BZm/EHCPbMTcfeNz3HouYgO/RRHDfIiXFsBVPGuAnSNsvVHee
         Q2GArA5q9LqeuqPu9eZ4TYHO/yR+C1ykvdHGwaE6wyQWoMjSVGMkrGNMKmppi6oD8KoJ
         ZscjO0fCPya8zYjpcsCwn1iyyRs+I0xJWP0hNZq+Acb7ApkIdiO7B4O267WcRsfEis1Q
         jKAl6GHCRemNjDWjVO3XHRsc9xu1TPBbbMDTy0m8a/IQilU+W+OUfwIIbnwm2rNti52A
         DrAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PQNiJGg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si24526142edt.379.2020.01.21.03.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 03:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PQNiJGg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itrO2-0007N0-VM
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 06:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrLJ-0003hg-Jd
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 06:05:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrLE-0002fG-Ro
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 06:05:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48583
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrLE-0002er-NG
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 06:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CleyiTyFzeU7YFGR9t8XlXBZmAxEriIlOMwBzucwkpQ=;
 b=PQNiJGg56cBkEdlMbT0/TTxIEFLYVPPfH7LLrc6jwIX/W5wRc1odh2xQyy27Q7fZ7p9dOZ
 GHW5xZ9h+t7N518HxKitLYHWJCfM107skk/p3Yxj8IGhaH6jPIF5RVwZnUgyOFOWqiAcWP
 OQVvwSpdHSCylTLIsDySH5KYBrMsst0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-EdVqMcpMOy2sK8ntRqZvkQ-1; Tue, 21 Jan 2020 06:05:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E5B18A6EC1;
 Tue, 21 Jan 2020 11:05:01 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A48C811F8;
 Tue, 21 Jan 2020 11:04:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/10] qom/object: Display more helpful message when a
 parent is missing
Date: Tue, 21 Jan 2020 12:03:45 +0100
Message-Id: <20200121110349.25842-7-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EdVqMcpMOy2sK8ntRqZvkQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PyDwBK5tXHHG

QEMU object model is scarse in documentation. Some calls are
recursive, and it might be hard to figure out even trivial issues.

We can avoid developers to waste time in a debugging session by
displaying a simple error message.

This commit is also similar to e02bdf1cecd2 ("Display more helpful
message when an object type is missing").

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: New patch
---
 qom/object.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 0d971ca897..bc13a55094 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -173,7 +173,11 @@ static TypeImpl *type_get_parent(TypeImpl *type)
 {
     if (!type->parent_type && type->parent) {
         type->parent_type =3D type_get_by_name(type->parent);
-        g_assert(type->parent_type !=3D NULL);
+        if (!type->parent_type) {
+            fprintf(stderr, "Object '%s' missing its parent '%s'\n",
+                    type->name, type->parent);
+            abort();
+        }
     }
=20
     return type->parent_type;
--=20
2.21.1

