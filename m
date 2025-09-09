Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33694CAC583
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 16:12:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uw0w4-0007Ui-Sz; Tue, 09 Sep 2025 12:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uw0vb-0007Od-9p
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 12:10:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uw0vM-0001ea-Pp
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 12:10:36 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRrW023879
 for <qemu-arm@nongnu.org>; Tue, 9 Sep 2025 16:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hYcRMIyLWQv
 lXfcTsmqq0jOfVzmmK99eaBq5EKBXMsg=; b=HdPSdo7OdIZiGhLxUjmefiGHF2O
 jRNq2dqoJ66AGxU9brGxu9hEtd1UhJptAOCla5PiDeZmfMw6rQemmHPJT9u3qndq
 /PDf9qnBizfKmt4vJeT1Uw1ocen9qRKXgdNqMszqqJXH2pTaDDgYlcXNkkmElcHs
 sVbNsyMDT4wGnF+QjwzTMjkVHL8V5SpIvvcOVKtD/hTRAw+/fqbN9A2Pb02qUIL4
 RanWU4Jvkl+PUtqjQoKeHxLMpaIfGCsSXB4i/sHXbbXFODhqVF5Km1T1n5UXiC+N
 X91dS7PJHkcCHT2jV8sm5cX0wWqYhAy1E6kTcfohd6gsvvzfOjo7/Bkm7sA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90v97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 16:10:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4d48818a04so4253658a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 09:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757434216; x=1758039016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYcRMIyLWQvlXfcTsmqq0jOfVzmmK99eaBq5EKBXMsg=;
 b=H1hqSTk5CkrLJqkM1w3a5YIFPBKWUP1N6T6iT8StAvh2Yo2Bie8d1x6CszJwPI5HRG
 tC5O18jIZYNlVXfsYA7MWO1IzIIt4FZBiTKIB84dDYyGN+lEm8ojxu/IDUQ2sMrbW6PQ
 GHCI34QUx13jjdD4JcovM+fNagIsJbPnbwZovY8gpd2NCHXltWRl0AZB9I9tKUNG2w8V
 sjLS9mX4KhCBjC7VxjDeNke3k+1HZCpcH+9OZ4Za8htbHgXf7LmUkwjTMRP//wXBW3P1
 W560H1GmwmDfZkZawHlW9gQ5jOqceUNG92QMFu+nGD/XZX3IshDiTfayy1XJLRrlv2Wg
 GB2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqlNyT6zSLp4omoK0qRbSthgYh7XAtKrzeEyiHj5G6tX9DJUKTRMMh9BQtG27ArKHMoB8WqcC2/Q==@nongnu.org
X-Gm-Message-State: AOJu0YxdZQTgqRXe4lfhQl5NdTbKkC4n5GAG5NkHXM4x9EH7wDDH9NYD
 2XCcmSaSuq1i6B8MWOLTTr/DuDkObNmDDXUmPapsIj9+pnwuk6fmS5f1/My2OqGFHNd8cGgmFYy
 q8Cb64MLAFBCHi2peA0LJ6BDpAcdzM/k1fDvhiefSqV2+Q2R89lEoF1w=
X-Gm-Gg: ASbGncuu5qbebfoekRayYAYFCgvKM759guxOMV13Claw6bulnfPAOvU4R8mjooJggOn
 q9hZao0NFzaiLDfBNkBeFB001zN441FBn4vttVDDjHWwjaoH45NJ66e+DVXLwJKHaEiYonNiImn
 2Sw2dumfMM8Xh238FyX8T7h/s0pg8RE3hMwUflEXCK0PfwaWiY3J2KvuPq0Xde7BHOj4CTyDpuD
 /SPq6eK53Wc32KPoK58GC3FizBUWFDtwU7Hc4VHDMloEIQhl661E8QxjUTLX6CnjuM+XyjP2QaV
 q6Cgpg9DXM+RdWW0wIwHY/NYjOxlTzQdXq8VEzhEdpF9OWgRAETvvw/jMZuUTJA0SwBwDdQDXb2
 1xXT/WfSJrObb0y0=
X-Received: by 2002:a17:902:f609:b0:24c:1a84:f73f with SMTP id
 d9443c01a7336-25171bc0554mr110231645ad.51.1757434215969; 
 Tue, 09 Sep 2025 09:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVCD/8BKitT0z2NhNz+nZQsOilEADT2jpMjsDZUS+JJmmYKPF2uV8PnMiNRzpWL1zCaJR5wg==
X-Received: by 2002:a17:902:f609:b0:24c:1a84:f73f with SMTP id
 d9443c01a7336-25171bc0554mr110231215ad.51.1757434215449; 
 Tue, 09 Sep 2025 09:10:15 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a2a43a9bcsm1794975ad.89.2025.09.09.09.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:10:15 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v8 1/3] target/arm: Increase MAX_PACKET_LENGTH for SME ZA
 remote gdb debugging
Date: Tue,  9 Sep 2025 16:10:10 +0000
Message-Id: <20250909161012.2561593-2-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250909161012.2561593-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c05171 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=yJojWOMRYYMA:10 a=CCpqsmhAAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=XJBTR8SIO4LSYOdVysIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22 a=ul9cdbp4aOFLsgKbc677:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -N5owH248a3NyeKsq8YvcXzd6fkD462w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX75NNbebKExE7
 ZmyyfM2BfkDXCgI3c50WZzB1bZqCz8JYiGfVtJO4jV41aDgVxAs5I3GByfX6pyKKDqjAY8AR5te
 jxF7mW3lUbICbMJzUCI93/+Au1vwXfISxdppZB2LR1XhG3Pb2R7KQzylnncwiIR0GAOmS/0sONg
 +QCfBdjAzCB54HpGuOv4nsjXGJPJHhzP0Q6vsbI+WgVvRKgBCTPrJIhX5QLxsr5SILh5UhSyIGc
 eNfT3eK2bdGR5WKziFiFDVoPwj3dT5PuDr0ZWtGr2Xt3tNkeFPTsuF7E8cgm9XvUMw25R8WQwXt
 nvP1Xy246cbpyhXaM21Gj5VZ6GLrbYxD5wS1nldWIuOzQFnD+tDQSXcRFTilzdl4MKwzxyGjO0R
 asCBP1Rg
X-Proofpoint-ORIG-GUID: -N5owH248a3NyeKsq8YvcXzd6fkD462w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


