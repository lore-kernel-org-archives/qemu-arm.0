Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383479ejb;
        Thu, 2 Feb 2023 05:40:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/QlQvPqKNJPA0vAwFiTFIP/NkrGP9G73KnoaKdRoKh5VObsLWwIYGO/BDnw0fnH096c9da
X-Received: by 2002:a05:622a:18a0:b0:3b9:bc26:3349 with SMTP id v32-20020a05622a18a000b003b9bc263349mr9680870qtc.37.1675345228700;
        Thu, 02 Feb 2023 05:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345228; cv=none;
        d=google.com; s=arc-20160816;
        b=qJ0Q9H7zkAu21DpgUPajvNPiWl21rcDQUIrSrOODXIon55dVJ/Cl1wKnpk1JH8Ggy1
         r8ZYcX2mCw8LGZwN2DN6e+3sInIsz7InkaEtoAUVluEVQea4UVnrE3zQC1hQKX1AlJtQ
         O2VLJ6PrLMWvoDO+sRSvcOTu6Iq3ce5EZKhhmco5ofMRIX39c7h6toPrWMildZmZi7P0
         oMD2Gt+3gCAqc6bZU+Nrjn+M7Z4OTOiGbikLIp89/2FdnvgL2ixgXxDvcDfndEhG0mx/
         QKYfKlDm6RNJgyJ4ni91d4o9D73iGy5+hiX7iQiRd6dCMy06frdFq55y97eYe7hk1TcJ
         yXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=THpMpm+l8y1cW2d6agwzOogXvY3GUaQJHADZw5X5Bfk=;
        b=Y3tdCA6s8Efch5mq4H8VsPvvmUwF1WdWreUG+AyY5M6SnruSRHDSjT+EvgYb5fBZhZ
         MkVAf41jaa8nwnH2WLN0kgR1XSgJMYOpedXWXosn+XQuOoYJoKhwPCBhrVaeV9eIefA3
         6dfJxtqXXfIUX+E2KDErF/1uAuN9H8b/uld2bIbxJYUMIaREBIE8Dh3pK7uIffKXVqFI
         reWHC3oEEYpCDDsxQDKrD3U0zGXR0X9YpwdB9IVMpf6bXYfBjNbjE40uG6sHsMMUDtsY
         jUjPPsnqVzCD1K2Oe1SjQ0Ml0k7ocLsAbMMsXPjpFozM87WJwm4vkxw0oxBvLBwgDAqZ
         OBTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VM0ZeYRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21-20020ac85895000000b003b68be2791bsi12433758qta.209.2023.02.02.05.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:40:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VM0ZeYRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNZng-0005RJ-TI; Thu, 02 Feb 2023 08:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnd-0005KM-6A
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnY-00085l-VH
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THpMpm+l8y1cW2d6agwzOogXvY3GUaQJHADZw5X5Bfk=;
 b=VM0ZeYRjm2uoORirNfYSFpVSD0lifNUSU7RZARRcXhxO3OGxdT9W+GG+RhV9DA8GzpsyEb
 vb3aBRE6AKRP4Bf6EEQaLcvRPvwTWvXm3UqSCoB7bSkR+O/wfy6pgvyp7tWyOPR8dx52jK
 UeFeBMxXHVHETRQ1ydoo6qUUCzLJdDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-esUOBJD_Pg2Elu3fugjGiw-1; Thu, 02 Feb 2023 08:38:37 -0500
X-MC-Unique: esUOBJD_Pg2Elu3fugjGiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90A3880557A;
 Thu,  2 Feb 2023 13:38:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCC7B140EBF6;
 Thu,  2 Feb 2023 13:38:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B355B21E6A22; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 03/20] scripts/clean-includes: Skip symbolic links
Date: Thu,  2 Feb 2023 14:38:13 +0100
Message-Id: <20230202133830.2152150-4-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CK7pg9lbx2nL

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

