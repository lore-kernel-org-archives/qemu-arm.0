Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp942723ejb;
        Mon, 30 Jan 2023 05:25:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8a9jWAwj0K89Y3Ub4ymJP9mNV4Q71pblNd3Pbq+KrdirT3Ud/zQ8gczaWLMaJEerR3o6z5
X-Received: by 2002:a0c:eb8b:0:b0:53d:a724:eba0 with SMTP id x11-20020a0ceb8b000000b0053da724eba0mr1001697qvo.6.1675085110725;
        Mon, 30 Jan 2023 05:25:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085110; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/+9iOrG9TZHpsnlgnSjLJ0JiqoXwlAyVZoww7eElIuB0FOi6oF05kRksmcu66sDP0
         BlSIHrnn1juyTEu7o+XaFnqNtbnp2URvVp0JuyTWt05udFdMHXAkt8iUD2VZbMWDiZnY
         HYMC2rQH7AO0WG+2zn28FjDNnv/iMQSQIIwo5yuXczVjRHj3cwLXCvEr0SzC5Y0Vioh+
         jM9les+Dqrcu19taW4OskzWYmSHTASBRBE0gP3bGNu2kvMQE7aAVXSkA0QILVwsi9SIG
         Db+5Aa3No0zRktnLs2z2vDGvSfoSkLAgNP1LPtDvBMZ5Cq2h1Yn/WL7rozHZiiN8WrXM
         P7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=THpMpm+l8y1cW2d6agwzOogXvY3GUaQJHADZw5X5Bfk=;
        b=Mc6JxiMLTSdZMR6mOl53I4ztlk18DJtPyEc5f6UpuWBgVM74L+CjwagzVjRS2YOFh1
         HnwMxTkDik1TJvvqKbdwtixgE+RHQjYgNQ76IhnWmof97/ZiKYRJ+lRi3n2JrXUJbEGw
         WwLtNguGOrXGbxJ8a0eU4gQj0mnOkQM6AMVqZcP+9d5UW2MsLR0ajDpHxmQGeohbb3Ta
         M5GIX+LoUKw899trfaD0D2glTg+yvM7FqgnceytaPg3Da7UcnVUUxgdZ6/XG9vI2DZcY
         e4GOocNRseZxYcWcTRPPJGqSJi0TKmSo1rtHy/bJ3ZK90e9PFHf3FMZXcaqMouXxUGhe
         vZUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ri4xkheu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe26-20020a05620a851a00b007200a46e5fcsi1030793qkn.136.2023.01.30.05.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:25:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ri4xkheu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU7j-00067I-Fu; Mon, 30 Jan 2023 08:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6y-0004eY-CZ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005hn-TQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THpMpm+l8y1cW2d6agwzOogXvY3GUaQJHADZw5X5Bfk=;
 b=Ri4xkheuyXsvlLZ+7ec4wr/wcHnnT1rB8V9UBAa/dgY3QcSjD1etDWYFNriHa1afHhEyBH
 qdQZgMcatv/nPzrTbZMvoRRD9MQzyAdGrMA23gWXfdcJV0/jgBQAzprECg6uXlfyzGrTDI
 jfsy9leajHG0hR/71lxnwr6QIZt0w5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-pEESqWQsOaChMZ27xPra1Q-1; Mon, 30 Jan 2023 08:21:58 -0500
X-MC-Unique: pEESqWQsOaChMZ27xPra1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E35802D2A;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0FF2166B29;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4703221E6A22; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v5 03/20] scripts/clean-includes: Skip symbolic links
Date: Mon, 30 Jan 2023 14:21:39 +0100
Message-Id: <20230130132156.1868019-4-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V3vjE4+5g1o6

When a symbolic link points to a file that needs cleaning, the script
replaces the link with a cleaned regular file.  Not wanted; skip them.

We have a few symbolic links under subprojects/libvduse/ and
subprojects/libvhost-user/.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/clean-includes | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 8e8420d785..f0466a6262 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -113,6 +113,10 @@ EOT
 
 files=
 for f in "$@"; do
+  if [ -L "$f" ]; then
+      echo "SKIPPING $f (symbolic link)"
+      continue
+  fi
   case "$f" in
     *.c.inc)
       # These aren't standalone C source files
-- 
2.39.0

