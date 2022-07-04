Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3002082lft;
        Sun, 3 Jul 2022 23:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vt3y2mFMlXPp+NChzqGoYuA4Oy0gHDfj6RGR8wWvQrwHgcuVIN9TazpUrKG8EXy3FIAfxH
X-Received: by 2002:a0d:f9c1:0:b0:31b:726f:9ef2 with SMTP id j184-20020a0df9c1000000b0031b726f9ef2mr32519497ywf.252.1656917396550;
        Sun, 03 Jul 2022 23:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656917396; cv=none;
        d=google.com; s=arc-20160816;
        b=0d4SZF5/NKGk4sHfYwYi7mbwPksZyBAdJBgjdeEeOXfUvNIBrdTL6Ch28VeZP0Gmn/
         Mt2XxU5PMkpxgrgXKsXKweTc/L1p3ufu8J+cuBT/ba8lQJuKNgDoP/XfE37lYb8vAK+M
         TL1//rQUM8xL+heL1Jj7uQd46UlQOCRVeOoYAiZ1gaplS9V2GQ2NOp0IPU7x/nUNy0XW
         3VzsFJwi7blnv0HSFjyQMOQY8gQegHWi0OvHQYafGtscOKmpe+s0s2OOtaVFr0BNRQqQ
         s53uiAzAivuTv31KH4yOngthuECSDFLsQlLkrpPD4DO98Npohvjr5bLaovrTU6ioF+7M
         VvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/Zxsb/fXTfzPzD85shT5J+1m+4C8tjjmG7Du/pZgqU8=;
        b=Gt4kJyAArnD4RIi7LVywDKfY243LrCzJ4A/gn0pk09q26sleHGSa/8DO+n9cgFFeoR
         BEeCWsG2ctgkeSR016WWoB7jAdKMRtbuyTAWDRVr1JqxHn9QGcfrxXxtupx1zv2iyrwk
         hB9m+KTdSuNkeA00TEFizBbV3c+abRLZJ/wt8rFO6dfEkr7Qw9gy+vZhBthbLhR+MMhX
         C3iQfA73ym4hc0pLO2giK2o6iLAuNvEQo4qekNIYiXhRUXWXKIGuo7JAaH5knCKBuL4r
         FsxaQ8Yh7Y7IYmcuYdakn9Q+7JLLDRwoR6fjda/TmOGdGsxPP6/Z9B38xBVNAbWvvD8V
         ZNNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SWaUQG1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a256503000000b00668bcb46fb3si38440858ybb.556.2022.07.03.23.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 23:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SWaUQG1r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Fu7-0006II-WE
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 02:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Fnp-0001Ck-27
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 02:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Fnn-0005aP-5c
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 02:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656917002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Zxsb/fXTfzPzD85shT5J+1m+4C8tjjmG7Du/pZgqU8=;
 b=SWaUQG1rGSLUy4GuFVoThfsk5bs1jgib49xrDZpFcxWAPeZba88CfQRVf8l5C+MHJ3MPEI
 Dx0KyluukTAZSPMmxTbCNx7rqDSOXjYYjW9hDg1+NKnps1CDBXNDyfm1HCZch0dsDGCSij
 K007gDsfXdbNTwW7p2xKlUI54L+9w08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-klja1yQvOzWojATi3PFRVA-1; Mon, 04 Jul 2022 02:43:15 -0400
X-MC-Unique: klja1yQvOzWojATi3PFRVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 630D9101A588;
 Mon,  4 Jul 2022 06:43:14 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 837B3C15D58;
 Mon,  4 Jul 2022 06:43:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Subject: [PATCH 3/3] scripts/make-release: Remove CI yaml and more git files
 from the tarball
Date: Mon,  4 Jul 2022 08:42:54 +0200
Message-Id: <20220704064254.18187-4-thuth@redhat.com>
In-Reply-To: <20220704064254.18187-1-thuth@redhat.com>
References: <20220704064254.18187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MxG78Pvq6gbU

These files are of no use in a normal tarball and thus should not
be included here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/make-release | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/make-release b/scripts/make-release
index 176304f30b..61c0fd0bfb 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -61,6 +61,8 @@ https://github.com/open-power/skiboot/archive/${skibootrev}.tar.gz
 EOF
 cd ../..
 
+rm .*.yml
 popd
-tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
+
+tar --exclude=".git*" -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.31.1

