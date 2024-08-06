Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1303126njb;
        Tue, 6 Aug 2024 10:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWTtaQpdAsFFw16o/BBeVzfXYXAzo1fH+g0ebF1jU9rKsvuC3ymCgMGPgDoc4/NSKUkemFGL3M75qbGNplpuqqlC7ZCumzB
X-Google-Smtp-Source: AGHT+IHOw2BJiUm5sj0K6InUoPq/wnb6Z2q4UN3ZgNyq57jvGgP1qYD+1OKfs4/i1Qe7YYDWIAeJ
X-Received: by 2002:a05:6a21:6d85:b0:1c3:fc87:3770 with SMTP id adf61e73a8af0-1c699659108mr22887840637.36.1722965605043;
        Tue, 06 Aug 2024 10:33:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722965605; cv=pass;
        d=google.com; s=arc-20160816;
        b=rzL2pNRDcDhd29b8Lk/7aihK9MRXV2mRJdyd7pNCa7XB3uXf0e9fJzOK3Lf/wuh4Kz
         RmE3v+MRY0bSe2u1Obm7a2QpGWFcYbe5Urn10KnIdAxCaVR9wIoew5gfsSG4A7i8pOER
         u0P2mS3XM3yg4tMNjKRaxDJrf6YuNBoySAm0wQJiJkHVdVuA4S2PAZIujwKb4hcY0PVG
         N6hY6D7iAAfbdm2DrMh9gvLUq6rrrlx28r6xeUiIKl257Os99m53UfQUkyRCCBU7DR5m
         H27RZ8P3C7K89Xe0ltXfu5sugvaXHn5+1UR4+FdUtFrLAp7hIRr7pz08t5tlSi08cHWD
         zD+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=AJ8MtrhXTfXLVW/4fRGaR/9OyloXeKfWbGmEuGEPmm8=;
        fh=pOdCxWa9rQJU0vaikvZDwOcgRIEwREE3jBY9GdQlMoI=;
        b=F0GXa6fY/uM0mfXiCI4uuJ92YA3/7v2D2A4K+tn5ljrkZMM83UXQe7flwTRlpl99rq
         1501Sbt5Au8Cs7+dHZ72ljHHP1ibDv+DIIwKArtnuUnN29S/a+eFdz42WoiwV9LJI73R
         yqzAHyNkxBtdD/o9vkLetqtJMZHiw/2HQpS4Y2VTxTsWIs6JeL9ap0DDR9+Ag3q10Ez2
         U0EiRREemPBtYrYFdtKmOn5elXFcnATppX943SwiLruojIBaKOA+pSNG8niy+90JVrQp
         681iJzOIR+kWlLpu8Udvil3xjpmv1mbr+PuP0MYpix5A/sBkJQ7xakVqzWGnrGuZAq/d
         S0QQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D7htS79C;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23420-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-23420-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-23420-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-7106ec7f317si9627865b3a.137.2024.08.06.10.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-23420-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D7htS79C;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23420-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-23420-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B87D28711E
	for <alex.bennee@linaro.org>; Tue,  6 Aug 2024 17:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789B354FAD;
	Tue,  6 Aug 2024 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7htS79C"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF24D9FE
	for <kvm@vger.kernel.org>; Tue,  6 Aug 2024 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965594; cv=none; b=d5A5xDUpAoh8ieFLICBNHTM1yQZ6Y/QDODbHMwJE9IqyRkHHjffOdhMaKtCOY2fquebcp301MvxZDjLu5Om9A9DCIhO+vo3Ri7WK6HnWO8OW0lX7pgZvvUeguepJDA3v81rmFodhMfLfZaxs0N3pXHUoE1HxrXAs9L6GgGiw+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965594; c=relaxed/simple;
	bh=oAVm9bnQV/3odujBQge14xXDV8alMWTy2bW+6t9o4og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYxJdQcD4Um8oFB/9TOrJEyPePeAn5cHbMx1mBiFDsNux97a3/wSsn8HO+vtfGsp43HjRLyDZQeJt7hNGGTWEHuQOKUAC9Lv0DSJoWIItvUOqiE5FglN7oEizUI09BxoPYqQo0m9nVVuvra0x015OVW1sP5gvftJ4+/cpMy9qn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7htS79C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722965592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJ8MtrhXTfXLVW/4fRGaR/9OyloXeKfWbGmEuGEPmm8=;
	b=D7htS79C4jfD+PxO5wH3v91H3jOhHRqgndCp43T/udmykeqHQDY11DgfCrY+57jQhqbX7D
	KZwjMEemGX9bcFhIq5Rn0qFzz/W2J4Z6OXH84obfi9PUBbxOX1DXI6akhxM2qsRTHPl8AE
	hGT9Oi4gcV3sMlpkPKuqtuePpTcYOYg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-jlnfk0gfN_Os1NWJgBe8QQ-1; Tue,
 06 Aug 2024 13:33:08 -0400
X-MC-Unique: jlnfk0gfN_Os1NWJgBe8QQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD25F1955BF4;
	Tue,  6 Aug 2024 17:33:05 +0000 (UTC)
Received: from p1.localdomain.com (unknown [10.39.192.15])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8527A19560AE;
	Tue,  6 Aug 2024 17:32:56 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Troy Lee <leetroy@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Beraldo Leal <bleal@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paul Durrant <paul@xen.org>,
	Eric Auger <eric.auger@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH v2 8/9] tests/avocado/machine_aarch64_sbsaref.py: allow for rw usage of image
Date: Tue,  6 Aug 2024 13:31:18 -0400
Message-ID: <20240806173119.582857-9-crosa@redhat.com>
In-Reply-To: <20240806173119.582857-1-crosa@redhat.com>
References: <20240806173119.582857-1-crosa@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 1RSAQca94F2H

When the OpenBSD based tests are run in parallel, the previously
single instance of the image would become corrupt.  Let's give each
test its own snapshot.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 756f316ac9..f8bf40c192 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -190,7 +190,7 @@ def boot_openbsd73(self, cpu):
             "-cpu",
             cpu,
             "-drive",
-            f"file={img_path},format=raw",
+            f"file={img_path},format=raw,snapshot=on",
         )
 
         self.vm.launch()
-- 
2.45.2

