Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp470972njb;
        Thu, 8 May 2025 07:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzbgEBQKGVgqPhWUi//4xCh1L4/+Y3NE5s8h2msIwp7QOeWRqBx8fKsFcwXpvlpuTCOKQucPXBj4MfCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFF+mXSaTZwSb1deNaQr5zMO25gUSsEUe6lNuKYjGwJovbzENC3amNIh8kr31nZUFMDNI/+
X-Received: by 2002:a05:620a:40d1:b0:7ca:f3c6:c0a1 with SMTP id af79cd13be357-7caf741d39emr1129727685a.55.1746715332224;
        Thu, 08 May 2025 07:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746715332; cv=none;
        d=google.com; s=arc-20240605;
        b=kQiL69HNlzQSgOsYjYkgpWA9ARRseL4LP+1gVbNWe7D+Dn88n2CkOcUacNEVyhhIfc
         R+OMERhfFWAGE4/o2cdQcubs60ZNuGxFtyRpxVqsj6ot06i3L09Is5Cx8uY3TQnx/BNR
         C2OFHcTz7fOYranfqEEuwsBIdHoqo8mf7dKufKu5VZFDx8fU5B2Ze3GaKW1EemYWil6P
         dGQ8Wtaep0Sqeo4JXKjO5VMSmVo29SutoMVw4pefXYUik8PkRnFXbo+2J+8eQE7KXnkR
         POpL9p0Q9aaj4Yc7EcJROf7SBosAXIX+y1PvdKjS+td3lB9KzQX9rjtMOLKe9OdhvQr9
         2BCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cd10MReNfpFzWnArpCXp4TIzQPt7sdUReieZfc971sU=;
        fh=mV1hj/g4izUEtI00kKHr/+DcS8Ht1XYt/8wmIYnJvQU=;
        b=i6Og+PcOe6dPAAPHw9eqKCJTeVCAePWD/Iyz9/6khgqgIgYNvjv4COcfrjplzJHGKJ
         hQooAHSIyWHwVIALFf/QtFYX7gQAdUV5X8No6pCHKZyvS4qejHf8bxPj2mWbgiypyRIk
         HRF/rw7qWzLLLIjr6EoEklonJ7fAfrwj2uMaKYBWJy80EvqFQzK6wLemq+9TfcCSrChS
         81n4NSljUFmRxtrbEL+XFKONcYrjqXGuWSp31HEEYE7mbZz6bxUOqwLnutLvum/At8m+
         HFXn4jSbNb+MgZVhOnzRSNun2WC8ZxiPQIQAv6NYSHXwjm14/OFyX5lDuPit4S3/mH4/
         L2ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uryft3WX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd43a9si66985a.249.2025.05.08.07.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 07:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uryft3WX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uD2Ri-0005rq-8d; Thu, 08 May 2025 10:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2Re-0005nB-3n
 for qemu-devel@nongnu.org; Thu, 08 May 2025 10:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uD2Rc-0004zw-91
 for qemu-devel@nongnu.org; Thu, 08 May 2025 10:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746715311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cd10MReNfpFzWnArpCXp4TIzQPt7sdUReieZfc971sU=;
 b=Uryft3WX9XG0/eC7wzp5qYf6/RdLTRbN3fIAkFfuSgqBUysvax7+Ihe65V9mKQ1a5S5vlY
 3wnDM2vImgrjOV8Xm/v+S3EEcQtjsuKCzbMahyBvKyXAGU3WHkBUwxgwucL4ZLzU/Ifshi
 Tk2fZSPojbWgWTVIwVfA1N1OaoxkEuU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-nTT9Q8G-MteX_H2cz1h0sw-1; Thu,
 08 May 2025 10:41:50 -0400
X-MC-Unique: nTT9Q8G-MteX_H2cz1h0sw-1
X-Mimecast-MFC-AGG-ID: nTT9Q8G-MteX_H2cz1h0sw_1746715309
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CEB8F1955BED; Thu,  8 May 2025 14:41:48 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6E84F19560AD; Thu,  8 May 2025 14:41:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH 5/5] Revert "meson.build: Disable -fzero-call-used-regs on
 OpenBSD"
Date: Thu,  8 May 2025 16:41:20 +0200
Message-ID: <20250508144120.163009-6-thuth@redhat.com>
In-Reply-To: <20250508144120.163009-1-thuth@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ndp1mcgifcXb

From: Thomas Huth <thuth@redhat.com>

This reverts commit 2d6d995709482cc8b6a76dbb5334a28001a14a9a.

OpenBSD 7.7 fixed the problem with the -fzero-call-used-regs on OpenBSD,
see https://github.com/openbsd/src/commit/03eca72d1e030b7a542cd6aec1 for
the fix there.

Suggested-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: Marked as RFC since we likely can include this only once OpenBSD
 7.6 goes out of service, see:
 https://lists.libreplanet.org/archive/html/qemu-arm/2025-05/msg00559.html

 meson.build | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 6c61e1dcaec..5f0e6a65cb0 100644
--- a/meson.build
+++ b/meson.build
@@ -699,11 +699,7 @@ hardening_flags = [
 #
 # NB: Clang 17 is broken and SEGVs
 # https://github.com/llvm/llvm-project/issues/75168
-#
-# NB2: This clashes with the "retguard" extension of OpenBSD's Clang
-# https://gitlab.com/qemu-project/qemu/-/issues/2278
-if host_os != 'openbsd' and \
-   cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
+if cc.compiles('extern struct { void (*cb)(void); } s; void f(void) { s.cb(); }',
                name: '-fzero-call-used-regs=used-gpr',
                args: ['-O2', '-fzero-call-used-regs=used-gpr'])
     hardening_flags += '-fzero-call-used-regs=used-gpr'
-- 
2.49.0

