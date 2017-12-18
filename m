Received: by 10.223.159.74 with SMTP id f10csp2940593wrg;
        Mon, 18 Dec 2017 09:53:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBosL0++bjXQO90T+1rs+zZ2Rpxte4LUIFVmFPrZEvcqSoDvAqdp0+ythNXEaLgL5m9ynxE+2
X-Received: by 10.37.189.7 with SMTP id f7mr490842ybk.193.1513619597768;
        Mon, 18 Dec 2017 09:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619597; cv=none;
        d=google.com; s=arc-20160816;
        b=qGAjHeQZGL/fUOFBAwYh2PByVR5uPem7CyyLlRWhgWn71d3eY/9GA2AWh4AuB/skFp
         BpSpzYvXxmcEaeeWJHBYuFS1cN0JOMQsjpNInd/o81nlmfnucWJQjvK74DdCe7DwA/+v
         vEgaQCgr38lXVR7Um3PLQ8coK7luIZLpxqCAu2qC1mk2S4B/uByUxS4AUhsbD6Cr5VPe
         ygniLf9H+zJcePC0qcKpvrFikO6j7GFETUbeD3NvlMCdYXq8PEQxJSoyRDCIKcp56VrS
         jXcSUrEDFMJQc1jK3UUbrHemPl5DuHktOv2pkYCOrqHRRef3LD97L5S11DOI4GOXFXRT
         XGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ENRXS9h8V/c69uI8RDsb604KEPZbwbCQK6rOp4tGF+0=;
        b=Keh1YKrJDyUVhg3pZYqfceb4E3H6HEPrDx8L7v/QERPcg7d5JYUUiql78n+hmGQ505
         MBRm3YsewucFaQy7TyFpy7sdfWD1Wssdqa2tr1fqm3gPwWflABlXIk/llVOAzdSt9BRk
         f0vX19Yw+Dza+lvEv+rsxGcrFiN8E+RXrlDuVGIQSc+NO179ysxwmiTCMDKhYYQW4C27
         r+lia9IhzGKsMVCX+MVjSEKSiQAZnXhT6dH09YlmQThDH3JdhxnFMhPi/Y0gQlTXHJuL
         BBjsqlMIe5w061fz7jBMExg2awM6s5WRLMD/Qazs9JApvyYrz6SkbsK4P8iZPwWGO5W2
         /emg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GAI0lLCO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i197si2519918ywe.763.2017.12.18.09.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GAI0lLCO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzbJ-0006Ih-63
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:53:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFO-0002gS-Ga
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFL-0004jR-8O
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:38 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:46597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFK-0004iF-V6
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:35 -0500
Received: by mail-pl0-x242.google.com with SMTP id i6so5222700plt.13
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ENRXS9h8V/c69uI8RDsb604KEPZbwbCQK6rOp4tGF+0=;
	b=GAI0lLCOJPGQ20OkTy+kPEmjC6D0i+/r+6wETWvkL4Tnb47Mwr7tDySVTpoj9/bosB
	8Ep2inBB7qL9Xl2GrR8sNyQwGnXEQ1p/8V7cfzJnCyLcJv6pX1kMKAUnzcoalvzERjhh
	iPMruL9kjq+zWEO4HsJ4yVhW2I3iAItHULw5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ENRXS9h8V/c69uI8RDsb604KEPZbwbCQK6rOp4tGF+0=;
	b=WlxLHdfThzDwnJEyd2sxXFiYqc66OE17nx0CUb3pdKKv03TRtjPxKrYDjHERE3gAg3
	Dl1kkF3EoslTkhnBaUSpvzghI16MBzSPwyxolT26uvbY2pgyPdxjFSb0smszqHyYk4mL
	U6lqewTHwjkf9nY90duSLD8LQGNtDvZimGkX+6yCcZnHwSqQcJAeMpjLgJ22P8M77LRg
	lvbRHMVbs8tFKYq12Oi1IxYOvGep4GLYvFiMzc6qNd8ELtkwUBKoclkZtCF8tWqlbWpK
	rYLbrBbX4T97gwyPjSqRuwgQuyttns2G1qlBpE64ECsFOQiI3YJUt1qHeG0DQ2hsteXl
	PyAg==
X-Gm-Message-State: AKGB3mLl9Y3N5vhbiGWvLZKVaYTWj0OUcdnHrku8KGUJ/uRO6OWCAqJU
	0ffhyoLRYJaPYQ4fwE2nJsa0JiUlUdI=
X-Received: by 10.159.196.130 with SMTP id c2mr434568plo.123.1513618234037;
	Mon, 18 Dec 2017 09:30:34 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:19 -0800
Message-Id: <20171218173022.18418-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218173022.18418-1-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH 6/9] vmstate: Add VMSTATE_UINT64_SUB_ARRAY
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +BT6trZtGrB2

At the same time, move VMSTATE_UINT32_SUB_ARRAY
beside the other UINT32 definitions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/migration/vmstate.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 88b55df5ae..8c3889433c 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -905,6 +905,9 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT32_ARRAY(_f, _s, _n)                              \
     VMSTATE_UINT32_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT32_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint32, uint32_t)
+
 #define VMSTATE_UINT32_2DARRAY(_f, _s, _n1, _n2)                      \
     VMSTATE_UINT32_2DARRAY_V(_f, _s, _n1, _n2, 0)
 
@@ -914,6 +917,9 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT64_ARRAY(_f, _s, _n)                              \
     VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT64_SUB_ARRAY(_f, _s, _start, _num)                \
+    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint64, uint64_t)
+
 #define VMSTATE_UINT64_2DARRAY(_f, _s, _n1, _n2)                      \
     VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, 0)
 
@@ -932,9 +938,6 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_INT32_ARRAY(_f, _s, _n)                               \
     VMSTATE_INT32_ARRAY_V(_f, _s, _n, 0)
 
-#define VMSTATE_UINT32_SUB_ARRAY(_f, _s, _start, _num)                \
-    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint32, uint32_t)
-
 #define VMSTATE_INT64_ARRAY_V(_f, _s, _n, _v)                         \
     VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_int64, int64_t)
 
-- 
2.14.3

