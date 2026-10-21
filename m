Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C460A5BE3
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMvH1mVI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JnopNSdV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMmd-0002c6-GX; Tue, 20 Oct 2026 23:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmU-0002Yq-Qz
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:14:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmS-0002Ns-Fi
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:14:22 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2Uwwf3457250
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fTP5GdPijMVLrRP0iA6yBEFGepVL/U+WJ+mrzKQRXGY=; b=UMvH1mVInE7egOyp
 LnidU6vMzxuSCrLx1xTZBuHUvFBw/MK6VGbnvnWTRJb+Coz1wbH2w6NzssU1AVwV
 nNld6lr+s9mjLHdg66ovZURCaMFUNnv02CrvhF8ITUyJivz/uLJcOy/KwZEJD7Vd
 L5r2+w/imY+JM7fuBUnBNl9YZINZU6VKubMqpS/T+KYo54UK7naux3bf9iNhrcpV
 OfgfRaIG34rvCFcBAxINtCYZASd4PU+gfjZnavkDNLct28z+X+tc2YXFkfF9Vq+Z
 t/ymlnRP5mR4ojr3PCwMvZR2G26YgAvSzTWS0IHQT9JcjrpVPXunWINr9HC3QqJe
 npq6OA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r0u47-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:14:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91b4bf686ceso10983826d6.3
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552458; x=1793157258; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fTP5GdPijMVLrRP0iA6yBEFGepVL/U+WJ+mrzKQRXGY=;
 b=JnopNSdVoD6Jye76AggEfuGYN3ooxl8YQzDTsrY+exi82aCjCf5TSOcwxwN0EY2gj4
 Eq6Cw+QgaScday9QVv1EFn4+uQvysJlrrTEonaR8Cy4joZhA8Wotf4plX8JC/N2IvL4g
 gJCg93hCGHd8gpVyhNl8XnOl48l4QmXA4SV8MSWnNubxifzOSrGAO3u1Niu/bxJsMhC6
 H5Y0tfnxeC331AVAFE/ZCOEXKj5vMTIDUMLVIycYGoPSCub4tCi18wAySIbwASvkZUue
 wwGFBhQRri1hrACUmCLA+/00MKx6L47OMZSWlKsSkgjyI65Rq+YWsi5/AeKoF/BgPl6L
 D2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552458; x=1793157258;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fTP5GdPijMVLrRP0iA6yBEFGepVL/U+WJ+mrzKQRXGY=;
 b=v63YtAnnWgBk9tlqROLhtMsbq/xqqdQKo1Jc7BK+0KjUZ07T3iSVdzuTP36yELZikL
 TVOGK7uxd3rui4eZwGSkCIMlBtgMurI7Wk0zyZ3kHAOu2RoTLRzgB2coPS95G8x67ldC
 wDXdkK/7FvvPv1UjrCs7oaVhX9ac+GBaXhlVI4SOZDZWPYEMX55BShyzV7hgZS9vCyyG
 KT8CLfVtvXyPu14EDtMvArfcujPElIeUwgZ/MEjGwR2TVjprG7395F4hYWL8mtM7wTRK
 AbbrMj7p3YguCNBwQCd5sC5dYauSnCD7PPuh/9Sf2M/yvQV/OhmUNOWwQrhFq4y/OTp+
 Mx6g==
X-Forwarded-Encrypted: i=1;
 AKwUvByQLkhWCA7UoR4Sulb3jcWK/y8ODmmazgL24ozhJVU52pHyLjYtYq7wuQVcLHkMs3JprfOmhoinsg==@nongnu.org
X-Gm-Message-State: AFq9FYLHw2QnBk/85VhrIm3Bd2pmhHYQBWdKLVnrVlRgJcuiOES0MWLo
 iMYJU3W5ibsjr4iaSzE8Dy5gD/3XrtqUUjoYAsTFHcCqZgfkVIPJFJu4vwykuVoC9zCqSNY+2gA
 +bZbOidfrKOwIqY3sB/f9HNfkEOlljHz7ugvl7HDvbWrljwRL+3o43G0=
X-Gm-Gg: AYBFou1BvsW6Y9eZkCJWSUl3HzMLnzrycD0Wl6G5hF06NBS0USpqiVrvWm8qtAkYlQe
 ZhvFBF7AAHf9bwGA5oJcD4UMrcQb6jeN4prbFktuJ61oti2Me1h7RPT1/nVLsL15gMV6UMdKz2l
 gmhWsKLnvedE3OGuNOWVXnefUnrhwfBEVUXgf/+xyYeRlVyfo9hre4ZMwB94JTpCXB/GTQlQweu
 H/14ya/MSNRAxSiNFrii8+MyPUqjV0aiRJiLxKBypwWrAH3HSjruuiFM6O0IIBMZ4FNUcuoccm2
 TmQNuk00El4sFZaUCMvPr8SqMip751yJfahwqaCT1kYhwksYBy/JIwifA0M/SvFX74h9A7lZ7Y9
 Ztoj5CFZdW7K7MMBC3HliaqnnGjkmqbqhn9LEWVeg
X-Received: by 2002:a05:620a:4503:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-93f57e3ff66mr224713085a.5.1792552458381; 
 Tue, 20 Oct 2026 20:14:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-93f57e3ff66mr224710685a.5.1792552457898; 
 Tue, 20 Oct 2026 20:14:17 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb864dacsm40861235e9.12.2026.10.20.20.14.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 01/33] qemu/osdep: Add ARRAY_ELEM_OR_NULL() macro
Date: Wed, 21 Oct 2026 05:13:34 +0200
Message-ID: <20261021031407.24862-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad82e0b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_sJYpoIm5FXuGNwjPgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: zhkv_81MJNadMHbA13qi3lsNjPVeSoOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX2kpkCzzfr5WF
 TIH33NJ0MsTALlhZtMEdDO5GTpISq00l3GmLPnyz7TUqj5uvWsRHeeaY9/lcHHqYWmgB0i1nxOg
 E/+UNbyPGAAwJXNQfFezFFEVJfPLsKAKjil4afKIyGODNIS7yp7yFCiwiZLyD2bKWdHN8nAOlqb
 TW/g11CMVgrFE2IcG/Tqw7fSQAzqjPZEL/H7xboMMfuuLWZNIQzgoKyeZz+ReNcdI/YU/xZ8FlC
 w8LDxb/2KbV2McSQGpexOO/3NcKhK8aB50xH/V+luOEvCVNSwRfl5d8sWJhsyACwKrKJyv3mQ57
 /0USxfGYntai9UQ6d5M++xkV4J7PF0BhRVCSBrcgaQ8+/TdsHH4Q0Khz02r0S+JtD8A27N9jo/l
 hTkDW80N3CRWTWFZ3yVgIVXI6yWGuRpZC4Fwp5oBnP+BH4BXdBtsf4dFuj/zmcq1l8Fnz6coRW1
 f0gJX7PypxT+RNyzEjQ==
X-Proofpoint-GUID: zhkv_81MJNadMHbA13qi3lsNjPVeSoOI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9rSAf355OYV/
 LR4gsLTNyVDbUxCuYMu38WY0cizukNLiHD8KAi0mNbkrre8qJnbp3kRFN4SxlVgBXJTeH69z2Qb
 Qx2PitBkOVqgFwYHlGSDJPXquOMQZfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a macro returning array[index] or NULL when the index is out
of bounds, useful to convert switch statements over enums into
static string lookup tables.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/qemu/osdep.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 1ec5b42230b..993c8ffde0c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -533,6 +533,18 @@ void QEMU_ERROR("code path is reachable")
                        QEMU_BUILD_BUG_ON_ZERO(!QEMU_IS_ARRAY(x)))
 #endif
 
+/**
+ * ARRAY_ELEM_OR_NULL() - Return an array element, or NULL if out of bounds
+ * @array: array to index
+ * @index: index of the element to return
+ *
+ * Return @array[@index] if @index is a valid index (negative indices
+ * also yield NULL), otherwise return NULL. Useful to look up entries
+ * in enum-indexed tables without a prior bounds check.
+ */
+#define ARRAY_ELEM_OR_NULL(array, index) \
+    ((index) < 0 || (index) >= ARRAY_SIZE(array) ? NULL : (array)[index])
+
 int qemu_daemon(int nochdir, int noclose);
 void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
                           bool noreserve);
-- 
2.55.0


