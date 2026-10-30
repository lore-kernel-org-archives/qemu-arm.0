Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D28F606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PQn0+AJR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMnhx-0002DN-PA; Fri, 30 Oct 2026 10:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1xMnhw-0002D8-Dh
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1xMnhu-0004mv-1j
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793370948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iB/1GxQwupUBAtXtIchLRO3Do52Z/lPXw7gI4CrqYvY=;
 b=PQn0+AJRuLBdfYDSS8aFHKtk9S789T9W3OlSOzXgvu4tJVYPB9IAcye1a29n5vmdiAYxz2
 efQEgKlIaxchoahJ5CTJXNmJG/687a9qvP9KroMgDZYhgBeYBAMuMInp/CKYJ1x+GeNXc2
 zLwUKnXsnABugDMnGhn8NHh5uCu6yYM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-QrUbHn2pNSaUyDB599lX2w-1; Fri, 30 Oct 2026 10:34:41 -0400
X-MC-Unique: QrUbHn2pNSaUyDB599lX2w-1
X-Mimecast-MFC-AGG-ID: QrUbHn2pNSaUyDB599lX2w_1793370880
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a0284121c6so7102715e9.3
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793370880; x=1793975680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iB/1GxQwupUBAtXtIchLRO3Do52Z/lPXw7gI4CrqYvY=;
 b=vpaEIVeXwmDhpz094H2d1+9GSjVsLakD0tnVu1UT8WkAD5J7MK1VOtKZYXkzO5RVrD
 AhUvGyWIUFMzVWAjWiVvtrn/O6wvSUt4oMURF+lMpHkmCx/0KDSpy2WdXuSVyQNnjhU7
 AULZ1vgZVDstSJse/aEGCPTiuOA5OtO3gV7gvqC/LfsPYLGkUKUxfII0qy+XEceei1VS
 pYfk3LC2FGFEGkHqUIP7tzainMa3Xy4lmXDy6c0Fi9h9vbjGLjec6fCpTPi4mH/fEynj
 vpaJihHdrgwERxfgv7iHE577gE/ys3SIrdtNU7zty3P72Azm5+rvkXUMpkSW4+Op7sLt
 wDgg==
X-Gm-Message-State: AFq9FYKxT3nEjQb0MCNKt7uyWo1mZiIsljeQn1S8w2FklbPKRd2sMQLj
 34zZ1ztkPlhn2dyq85PWIbQK6/LxevRjDxvmXlfrBztcKTMWovGHNLUeU5qF/KfmxwPn+VfPKBb
 5FRkDtE2fnVSlHQHe1NAft9IeAUvgXuhvJqmcAPf2Fo92CEnLJwBXzA==
X-Gm-Gg: AYBFou3fLIyqP63AgLwp2kOrz/VOA+K/UyozVUQ3AkwDSOVkUlbK3JVU82LzyrwiqkN
 N0sx/+GpzpPy2tPcdSd0Ad5u+9QHdwI3m4uTGXKP36RckWSWbs7GRckZ948eM2LGi07ybGCtjHX
 3BkSETcH2NcSvgjcneIos2ArXW/6SSNAl+W/SxV6e9su/oN9VJYxGGt7vnnVaBruSnW6adUHyWS
 NqTnlbgoBZOwRb+l1+U4uNo/Nrv+UvK0T1Yib+8u77+lSmvzCJEhWKAoIC9h6ubmkpGcnuqkRe5
 J5ertRYf8Up/4up6tX+zn7gnabJSyTTRcjSA79q5L7icA1F0DxDRjw9vPB+B3nXljGaRWFonWiy
 7PTdR21QGUIHw/KKJ+c8d5L26ESrJ8b/wM0yfVp0aBfwue0Ck4n9ZkxQfox4at84HkiFmFfK9hl
 rtL5CBJEkL8Y825AvPsU66ouodZuhY+gQPApriPTATUtwmCT+2
X-Received: by 2002:a05:600c:46d1:b0:4a1:825a:56fd with SMTP id
 5b1f17b1804b1-4ac18a88fa6mr57165305e9.32.1793370880503; 
 Fri, 30 Oct 2026 07:34:40 -0700 (PDT)
X-Received: by 2002:a05:600c:46d1:b0:4a1:825a:56fd with SMTP id
 5b1f17b1804b1-4ac18a88fa6mr57164945e9.32.1793370880211; 
 Fri, 30 Oct 2026 07:34:40 -0700 (PDT)
Received: from seott-rh.redhat.corp
 (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71bae25dsm3102924f8f.59.2026.10.30.07.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:34:39 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 0/2] target/arm/cpu64: migration tolerance for PMMIR_EL1
Date: Fri, 30 Oct 2026 15:34:30 +0100
Message-ID: <20261030143435.57230-1-sebott@redhat.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uVXidD6wM349xpHXQ1Jdw6GbLdxxGEg-dGLx32_J2HM_1793370880
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PMMIR_EL1 is exposed from Linux v7.3 onwards. Backward migration
to an older kernel would fail without cpreg migration tolerance
definition for this register. Fix a couple of typos while at it.

Sebastian Ott (2):
  target/arm/cpu64: fix typos in kvm_arm_set_cpreg_mig_tolerances()
  target/arm/cpu64: Define cpreg migration tolerance for PMMIR_EL1

 target/arm/cpu64.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.56.0


