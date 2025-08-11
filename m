Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD81DCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 19:39:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulYKy-0007IU-Go; Mon, 11 Aug 2025 15:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKe-0007D4-QK
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ulYKR-0003qj-Ct
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 15:37:18 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGxVAD024551
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bBQY3JDfi5s
 Isqu5HUp7kVZ6LoWCvvo+zOI9FAcYnaE=; b=oSkdoQPxebT128j1Hp84fj9kWRH
 sCAOgWRjax9wIRHLgOy9mZUoADSvzU9EC3Qh81Q5GtngbbK7y81SU6GfbUTTHe2P
 LLzI3ganok2QKx2Tv2TAoCdcO3FV3YHRue88a9ORwyaJ+mNYbiygxK1UEYwTMeWD
 PbVRK08RaUcdWbYuKyTmRvrruPce5NleJZBapapBDh3jXXybktsehT0FjilWhOIq
 6Vm6jeL6HaerYlWXY92eqqN6UhsUo+GlGW0e9shuAGIzyLIwmUegMxpnmpqh0WkA
 Ero3h5bZozCY1clzTxTJHvj+9q3lHvqUFbHres6ngxfmrWDqaPXKolEMQxw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem49nma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 19:36:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76bcd829ff1so4450369b3a.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 12:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754941018; x=1755545818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bBQY3JDfi5sIsqu5HUp7kVZ6LoWCvvo+zOI9FAcYnaE=;
 b=jCTeX/7oEnfYis99mm4K4wuf0AwjcpBHmG7AKCZqvcal8fUZKUtd8v0+Beu76KN9b0
 yam4HUpoqWgmg9pJDtowEr2xJ+dqnjaezxqNjsBOkKzmiL7J0vvoj3WONNYZ6o7/fvh4
 Nd1VXg33I8D51l11u1AEiw3geTOUhJEGD5tielA243A/7zBjJWsaaIUI6xSFHd/H1Qbz
 8u3gI3G8N+weo2dX3mc/+dN960TGXhYm5LEPCkiaLwYwiA0dj6eFOh65SYrrGy4LldZk
 2maAODXV3o8bsfVUzjh4JoBAxcdZpUtH5eBeALXcXruYJS/XShtp7ZkPqHWq1xCDXZCQ
 qDAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSWVmPBNvOO3LCqZHChaSnYY2tOIvf1de9CIZnMh/KZI9ZIQ8F4znl5jP2Wjk/tJycX66XguhfGQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywck+vqKhb7vg3o6kR0LVGVMsph5K4qkJ4Ifkb/XFXh+f/wCx6u
 /d08JsWAZ3HVUf9f+zcYlHdakBEIt4+KrAXB7eBj/ZxRG0brHnjsu5qlhknsvyEoH2dgEZtu93B
 bq0HVUSoWNwE07Nladv/e525XOauw1r0lVItabeZLK+8rEyRN2HUyouU=
X-Gm-Gg: ASbGncvhIET16Kowsk8Pej3hKM/hu9jRFk+jx1JvrEYhaxW3y5i3Xd3KEoFf/NMmn0m
 jLfVb4depIDWV5pcsg/DXKwuRt7MDUkR0kPINd67drsvI/EAnzcibVV3EiXHk4G0nn4ZQ8H7T2U
 LLVElaIZZAKlT94XBV6i3UdfzLQFOaXtLrHxvCq1U5FU/NDoqOlBPIX3i+haoxHJz1VmPoZal6h
 PVN3IThXUQWpZcbjhUQ2uTYgmjV4d1HTNw8NbElYgB+R9C+TPDTOJO+iG0rvB0KtvGFwoH1pfiL
 46/W229+bz+6gMpbfhudTZqGnagc9Aj4Dz0EetB2BNBltMz+Mem4dE/syygGa4L72+KydfVgsFb
 2qys0HIS1q/aGlng=
X-Received: by 2002:a05:6a21:32a3:b0:23d:de52:a5f0 with SMTP id
 adf61e73a8af0-24055204322mr22839561637.42.1754941018394; 
 Mon, 11 Aug 2025 12:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmle9vBKoxLagh8sWB8D2Zda0I8i/qcY6cxkD+vXIumb/y1I90opfpv8KW4iHC2k2pDa8ENg==
X-Received: by 2002:a05:6a21:32a3:b0:23d:de52:a5f0 with SMTP id
 adf61e73a8af0-24055204322mr22839523637.42.1754941017984; 
 Mon, 11 Aug 2025 12:36:57 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbcef6sm27677171b3a.85.2025.08.11.12.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 12:36:57 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v5 1/4] target/arm: Increase MAX_PACKET_LENGTH for SME ZA
Date: Mon, 11 Aug 2025 19:36:51 +0000
Message-Id: <20250811193654.4012878-2-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PkF9xBnEJz_Nr3YGDFP3WfQfCja_-M2z
X-Proofpoint-ORIG-GUID: PkF9xBnEJz_Nr3YGDFP3WfQfCja_-M2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX7WgXUV4DYZ0W
 xtOo4GrSAsLJXiz8V2ZE7/L7yQVU5HNDLBVF113E+2upewBLKpdWuy79JohgWYsbHQjdcUgyD+Y
 fbaqMO4LHNJST4DnAgeGK4ZrKzAwPdIM4eQgDBoLr2N1QBabWWsmZU/a8mMMwCYHxt8xx2rnlBz
 vV2UVQWu1Sslz7heSiESp7yuCmdQyrRjPTcQr0edbFPyb5/OpV9Gy9ti35hVpR88XyqMQmAEGOF
 I2tOVFxdXTzTavOwRfJwLrrA4aL3GIHVb0zau5EqnM2XCG82gMNOndf+xV6tg6BG3T3IjX19CzQ
 lfmJplc+RMojybfe1uyp/UgAspGlA7M3K5Tb222tahzey2mPrIeC/iarl3p4KFQABcYeFoabj7b
 ky781lHr
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689a465b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=2OwXVqhp2XgA:10 a=CCpqsmhAAAAA:8 a=EUspDBNiAAAA:8 a=XJBTR8SIO4LSYOdVysIA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patch increases the value of the MAX_PACKET_LEGNTH to
131104 from 4096 to allow the GDBState.line_buf to be large enough
to accommodate the full contents of the SME ZA storage when the
vector length is maximal. This is in preparation for a related
patch that allows SME register visibility through remote GDB
debugging.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v4:
- the value for MAX_PACKET_LENGTH is changed from 131100 to
131104 to align with a similar update made to gdbserver
---
 gdbstub/internals.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index bf5a5c6302..87f64b6318 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -11,7 +11,27 @@
 
 #include "exec/cpu-common.h"
 
-#define MAX_PACKET_LENGTH 4096
+/*
+* Most "large" transfers (e.g. memory reads, feature XML
+* transfer) have mechanisms in the gdb protocol for splitting
+* them. However, register values in particular cannot currently
+* be split. This packet size must therefore be at least big enough
+* for the worst-case register size. Currently that is Arm SME
+* ZA storage with a 256x256 byte value. We also must account
+* for the conversion from raw data to hex in gdb_memtohex(),
+* which writes 2 * size bytes, and for other protocol overhead
+* including command, register number and checksum which add
+* another 4 bytes of overhead. However, to be consistent with
+* the changes made in gdbserver to address this same requirement,
+* we add a total of 32 bytes to account for protocol overhead
+* (unclear why specifically 32 bytes), bringing the value of 
+* MAX_PACKET_LENGTH to 2 * 256 * 256 + 32 = 131104.
+*
+* The commit making this change for gdbserver can be found here:
+* https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=
+* b816042e88583f280ad186ff124ab84d31fb592b
+*/
+#define MAX_PACKET_LENGTH 131104
 
 /*
  * Shared structures and definitions
-- 
2.34.1


