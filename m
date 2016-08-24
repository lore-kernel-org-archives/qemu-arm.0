Received: by 10.25.21.156 with SMTP id 28csp114840lfv;
        Tue, 23 Aug 2016 21:21:20 -0700 (PDT)
X-Received: by 10.55.142.196 with SMTP id q187mr1000682qkd.208.1472012480588;
        Tue, 23 Aug 2016 21:21:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n64si5052797qkn.194.2016.08.23.21.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPgm-0008KR-3H
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfA-0007IB-LW
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPf8-0004fO-DO
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 00:19:39 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPf8-0004fJ-9T; Wed, 24 Aug 2016 00:19:38 -0400
Received: by mail-qt0-f194.google.com with SMTP id u25so195949qtb.3;
	Tue, 23 Aug 2016 21:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SsQE60ZrUbmIySaOG4Pc3Vr4J77O48kUotP+RshZH2w=;
	b=uiCrOq+uHcEYa75Z174OqVumknrsYEaRy3fjSIHzpKMmz7weXuN5TAXAq5JwjNF/Sj
	KrN/uwrSDe3oNvXTC+pBaRH7Dj+rPNE+2v1JYuXvarGvCy8njJlAmtlasGmq3qAGSAXt
	PAeekuZwOUO/dog2sOnx7TwdkWluB8OuCLaH8B6MOgrOjf6jZxZ1ylzw8iCgWj+x7sKh
	wGCTF8CEXW3Ibk/fAh3ikn7yQHS1Lzu3FZVgjfp9lwco2PyfGO4ZrbZi4NSHl0/mLIn9
	czTfqAOxRJ10aMdRriFvA7nR/8nge6wCFxshdnLzFKSlIk9E1B6goHBSb+94XeTuuSpX
	1law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=SsQE60ZrUbmIySaOG4Pc3Vr4J77O48kUotP+RshZH2w=;
	b=M2HvVgFhM62CmATM741sYWeduJmAV1fTQ5gjJ0r5O6613osw0KcVedJX99+l23crpK
	SNxsPzT3QfGF6NmYxytVFFLsI6KEnhMnr2KYeu41EInAnY2dwsdLnVXp8EECnHpcQj3v
	BDvWfaT5wPMwbCupVf91ynmOJkaq6jrLhOv2EffKXOsAIr1AQeW2TK/p20eKTLtDNaSH
	JnS6doaSEQSaNi1yq2C0UZvGXRM+iFtevKmVfkKUfGKAbQBBsukTljNY2hBQLls5Dkzb
	7QMslVm2DXFarc3RIPO6bxioQEL7CI1gN/HeiBTqwdYDZjBlmy7pDeZvpVPmyqH9Ne+i
	sG2Q==
X-Gm-Message-State: AE9vXwPaFZ8OiI1SSG/DfHLICUKCGhWU8BhrGw79eofEdLz2x6mbKIG8JqZf9hFNSJmi9w==
X-Received: by 10.237.53.157 with SMTP id c29mr1069883qte.75.1472012318023;
	Tue, 23 Aug 2016 21:18:38 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:37 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:56 -0700
Message-Id: <1472012279-20581-5-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.194
Subject: [Qemu-devel] [PATCH 4/7] cutils: Add generic prefetch
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7TBynL7XIGj

There's no real knowledge of the cacheline size,
just prefetching one loop ahead.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 util/cutils.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 4d2edd6..0f1ce1d 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -173,6 +173,8 @@ NAME(const void *buf, size_t len)                               \
     do {                                                        \
         const VECTYPE *p = buf;                                 \
         VECTYPE t;                                              \
+        __builtin_prefetch(buf + SIZE);                         \
+        barrier();                                              \
         if (SIZE == sizeof(VECTYPE) * 4) {                      \
             t = (p[0] | p[1]) | (p[2] | p[3]);                  \
         } else if (SIZE == sizeof(VECTYPE) * 8) {               \
@@ -376,6 +378,9 @@ bool buffer_is_zero(const void *buf, size_t len)
         return true;
     }
 
+    /* Fetch the beginning of the buffer while we select the accelerator.  */
+    __builtin_prefetch(buf);
+
     /* Use an optimized zero check if possible.  Note that this also
        includes a check for an unrolled loop over longs, as well as
        the unsized, unaligned fallback to buffer_zero_base.  */
-- 
2.7.4

