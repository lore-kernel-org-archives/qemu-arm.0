Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379149ejx;
        Mon, 5 Dec 2022 01:56:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5o41YtZUvIOoSRUBbNGLHGBgC8+bGarJa98BCnDycn7czbLLKXulhf4SiHGVt+FRh11p9f
X-Received: by 2002:a17:907:1185:b0:7c0:d543:7bd6 with SMTP id uz5-20020a170907118500b007c0d5437bd6mr8069330ejb.237.1670234168477;
        Mon, 05 Dec 2022 01:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234168; cv=none;
        d=google.com; s=arc-20160816;
        b=sK+qjIK7B5ibamaxUK4ibcbMBnTImT1e68QV2qlyPYA+DKd6dFXVjyuVu70sELMESd
         20Po9bYNGCumVUguYd0XekXsRFmU+pPQLAhAnIX5iuT25w86VnMEEq27ioE8jQNfhCnk
         EG/fjn5AXN+4cNLFgd0+FrFnR4IOX8/DGe1fC3SfMI6uAPpbTz1UlsxXLtlHQVftv+9s
         FW/7bwknO+HbpATrTc9ln2ReJaelULeYv09Fo79pBvhxZwdpAFLll6OWecLdZxJLygpO
         JLnWPvNRKOJqhMo1UR3Zbpwl/OWo9+ypwa/DLB7nNChaqMDt5N8zcTsz6TRU6Tj+DJJ5
         +efQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Hw3P8H5TEBArqeghTjjseYw/s4nFSWWkJ9rmhoVRUno=;
        b=JtpupsoP/eZdaVStGlU9+l+MEq+1g2BWOJDMMsq+EJqXmPMX1OTPyyKV7+5G9gI5c1
         pIyvUmcVO/bPJnMC2cSj8qnwb33foKPBn1WyRO7QdDqD47mGNfDuHTlpXpXhTJn9J0vj
         SgWBbQIPytRkeD9ThC6aM44s0inw1dKS+nd95FHxfK+JthRFjFi/CZV0xotDbPEUz4OM
         4ZXlVsa2QOdfJAVb2AFVKSRzyEIzKARC4iEZzPnPosjQr5txWQmltuO6vq71fy8RO5Tf
         o793ZWGBSQfqa4LwOkDanzd+reapbhuZS0cUbjlROhlNJ9+vAfxLfVE8aVXjoA14z9BD
         FGGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ThItRtsG;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qw2-20020a1709066a0200b007ae4c686a4esi197265ejc.159.2022.12.05.01.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:08 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ThItRtsG;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hw3P8H5TEBArqeghTjjseYw/s4nFSWWkJ9rmhoVRUno=;
	b=ThItRtsGxSqrT4amTe7Ud1D9e+ZoH28P6RlxJvgQefspWgsK6LBSQUhZTSLzaq/ystgHS7
	NlAtlPtGmwypmoJ2Z0AUy73EWtyBQfWZ/nrGrLUT8+AySCdrhGg+m5IX1JQ8AjH2wUgNyC
	vBsWMQqqfUyqGIQulxowinXQ0SPx8jA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-kb_4S__COQ6ApFpRLzKmiA-1; Mon, 05 Dec 2022 04:56:04 -0500
X-MC-Unique: kb_4S__COQ6ApFpRLzKmiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B3B9185A7A3;
	Mon,  5 Dec 2022 09:56:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE292166B2E;
	Mon,  5 Dec 2022 09:55:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 26/51] target/s390x/tcg: Fix and improve the SACF instruction
Date: Mon,  5 Dec 2022 10:52:03 +0100
Message-Id: <20221205095228.1314-27-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: yJAJM0O5/qwz

From: Thomas Huth <thuth@redhat.com>

The SET ADDRESS SPACE CONTROL FAST instruction is not privileged, it can be
used from problem space, too. Just the switching to the home address space
is privileged and should still generate a privilege exception. This bug is
e.g. causing programs like Java that use the "getcpu" vdso kernel function
to crash (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417#26 ).

While we're at it, also check if DAT is not enabled. In that case the
instruction is supposed to generate a special operation exception.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
Message-Id: <20221201184443.136355-1-thuth@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/insn-data.h.inc | 2 +-
 target/s390x/tcg/cc_helper.c     | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 7e952bdfc8..54d4250c9f 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -1365,7 +1365,7 @@
 /* SERVICE CALL LOGICAL PROCESSOR (PV hypercall) */
     F(0xb220, SERVC,   RRE,   Z,   r1_o, r2_o, 0, 0, servc, 0, IF_PRIV | IF_IO)
 /* SET ADDRESS SPACE CONTROL FAST */
-    F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
+    C(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0)
 /* SET CLOCK */
     F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
 /* SET CLOCK COMPARATOR */
diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index b2e8d3d9f5..b36f8cdc8b 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -487,6 +487,10 @@ void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
 {
     HELPER_LOG("%s: %16" PRIx64 "\n", __func__, a1);
 
+    if (!(env->psw.mask & PSW_MASK_DAT)) {
+        tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
+    }
+
     switch (a1 & 0xf00) {
     case 0x000:
         env->psw.mask &= ~PSW_MASK_ASC;
@@ -497,6 +501,9 @@ void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
         env->psw.mask |= PSW_ASC_SECONDARY;
         break;
     case 0x300:
+        if ((env->psw.mask & PSW_MASK_PSTATE) != 0) {
+            tcg_s390_program_interrupt(env, PGM_PRIVILEGED, GETPC());
+        }
         env->psw.mask &= ~PSW_MASK_ASC;
         env->psw.mask |= PSW_ASC_HOME;
         break;
-- 
2.38.1
