Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A61D607E67B
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUxLcP34;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J8AzBIPw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMoZ-0004Ty-Uu; Tue, 20 Oct 2026 23:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnt-0003GW-IQ
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnn-0002gv-U8
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:15:48 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F1EK336606
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YfBbz1ntshu7HTJMMRGMbG70uprZA/xRojya9HsrRiE=; b=eUxLcP346bJ9nyE0
 VDN9BEmJ7YEBDJMyzf0p+DeAbNsyExWygj3eHLz3dNkEQCzE+KGce51T7+fFDVK1
 MI9FKbNt9s1cc5wMueEV0+m8BWzwDmXoXXGFrUNdShf6ekumOxq4Z53QuvbgT2VG
 l8dW79OH90zxmFZThI8hIzqk5x7lJtywNBQaGriwh0lqCVwJi06R5HOlDd6k6m4Q
 Kl+pC07Q69qzUze7CrMVXeelArpxo6b4ggVBtHoecGb6lpUjXAnU5N9uOzAfsUFX
 U5RqagfPTlBA9gjDNIPQsc2oZKMGK0tpKpEEuw4uWzIP6vPm4EJU6j0ctxVNLizf
 ZS5wqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabhrea-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:15:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917a7fffbe0so6820756d6.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552530; x=1793157330; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YfBbz1ntshu7HTJMMRGMbG70uprZA/xRojya9HsrRiE=;
 b=J8AzBIPwwVFCjbOTnwbxLJMel3vWm30fsS3vaBOjc5Kw0DvXFC/md9Pv4RAw7F2HCQ
 CE5/Y0oJI0ZU2V2/VSBPcXnbfNMCoGInwY2CsfcVNh10+FDYytHckb8NiSUxJUtP27dO
 zqoHZpRwvBMe5z6LuIiTQw6QVHR9enJF92tKG14TiM5NSx6kHzCoNY3RALWYFI3OEr9a
 Me8xQj/sR1AMa+pCY0BG41gW7j4gXvRU2BIu8HeKw15+LKtbgKKXdD6M57eWMi6l32CM
 8734dB3VQ5oPAA4UqJdHHxvO/alrA+pJlOTedYg/j971ltWtqmySz2zFf1aGC5141gTB
 Irhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552530; x=1793157330;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YfBbz1ntshu7HTJMMRGMbG70uprZA/xRojya9HsrRiE=;
 b=0LuhpUtAeC/LnGrwV6F48CN7yMOQLzUn2DUTDy+iH7X7M1YCHcUw4xVVc4TJoVozPP
 gn7WEcBCHn5LL/cfDrwPdOsrqrsii2Khmie8ZObGSPEjJ+/D09n/RpFOqAAKKr6eqEh8
 Zh+wUI6cG/wUkvSV4jpouNslK0NAUB3z3nVoabiRw49JxXIHA37RlV9w+LG5CIhkJuaP
 0r7lNV82kmMBArQSVtcSWsbYxKFrk04SvJ1jy/n4sez/q8OgG2mWje0hxr6QegpJ7zFU
 q+Nu64n++7K3pRkZUyI9Wlq0l/4YW7pzkhGSu+VpGMJpk+kLjhX0s0HMYAQy/QJ0l58w
 zk5Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQCsvNW1lMNyZfIUiknLmEofNdtuAf89Sba2OrIh3UA2wXisfJ7xyYfZJUVpr8tzr8XBYtz4/Fsw==@nongnu.org
X-Gm-Message-State: AFq9FYJ1SSyPiEip809nwsDzdgajGajpJuJ7v821rgK+ZjSCpWA7it7R
 P27JmAMLjV8+k0uwbcOYNYX72CZYrWIshWArmqjgLbaah/hMlAvy7r8f8EaRFo3WzyAkOovZX9/
 fpa6GyCuPxFJ/pBzLPbyBF9l2a9CV1SkmXtV1czt3Mj2HtqUQrpDtzFE=
X-Gm-Gg: AYBFou257M/ijfQDm2VWEji9fNpG85tWNiHKSrG4TTU1u1hQmwflPiJChfHueyN9pSa
 oCCrMwI46yUorGpB1BnE1t80Vw+s4/+4MjKMsMo1Fo23bZz5QofFfqR4ai1RtCiVqR7aYJEtMKj
 XqfNpvVj7tBKjNLf/6T/eOI3iyFivnkGyEynsDUYvg9I0uKya+sX3Kssmgv68ZmoBbxseunMMja
 tyB2hJ7AVcbv11fKLMwrEjMLqGWI59lABJW681PUhbHxqD4qwUEqPTx5+g6kfe+VBumhy4Cq1Sd
 keSmc0L7QGcLooH7pEJ+O8stmdjAo3+mTjQUHe7/qoOSew77JH8QIqDtuSQ8QDvuS25g7dy1ffp
 9EtNTMVg6KjOk5Oan4TXAFBalbfBCUV3EJZZFX9fF
X-Received: by 2002:a05:620a:3703:b0:93f:1dbf:6cfc with SMTP id
 af79cd13be357-93f57fb8621mr221123785a.36.1792552529840; 
 Tue, 20 Oct 2026 20:15:29 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:93f:1dbf:6cfc with SMTP id
 af79cd13be357-93f57fb8621mr221121585a.36.1792552529285; 
 Tue, 20 Oct 2026 20:15:29 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25827087sm2413903f8f.21.2026.10.20.20.15.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 10/33] target/i386: Replace magic value by proper
 EXCP0E_PAGE definition
Date: Wed, 21 Oct 2026 05:13:43 +0200
Message-ID: <20261021031407.24862-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX/mDeStzsuA/v
 1jNJ8QeuJMtQYKqFFJ17vxnoqtJTt5v9czSMCPO4gj4YElZor3hQtTMltF+K9lqM+oOdDkv7NMQ
 g4P4KsS23M8omdHA4QAGkzZYX8WGLWY=
X-Proofpoint-ORIG-GUID: r8mE9wXu2F3D-hFamxeNLhArXQySiXr7
X-Proofpoint-GUID: r8mE9wXu2F3D-hFamxeNLhArXQySiXr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6ruD4SrmH5aw
 FmxkiDCS6q3SeY9Rivdbj52/ZxUKQxuKbfHWOXlpXKvjBy/F+fniCWw5vERDOVOBgtZBohIfDj4
 ZZwfArl70bA89TS6MM1pweydAStagSSejMhfplDY4oh6fZ6v+uMxDqmg0JsrcBi7Bf/yw/lWwOs
 v/2vMRxJX2+c5xi4ME7ptr0bvFaQk3ob4xPzMQrV8Or00RGeR2rJk1rfUng/MqDXz30onSEHGSC
 GOWgGNzYZNrSqd0daqL/rvSWZ46/SyjGUHcAJKARwg73Rtuu6Bz4uFoQWV/RAv1uYvDA+zsMUtc
 I1z/Ox02d/oCS+2aDYAzSumHXqeErAHLVJsDP/nmBHoxVI6ipfHyDegh0kxJn954G+DkqXTHks0
 VUjWvUHAO/zOZes/jR5w6YubHLvjE3N+3/RDJAHrgDo72GcBeaEE/ZU2idIUavB9bcWSLX2xHpt
 zb3JcjaYzmbNe0cF1ew==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad82e52 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2cblKrENZZ9LBr9VnxsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

No functional change: EXCP0E_PAGE is the 0x0e page-fault vector.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/i386/tcg/seg_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index cad19f9ca6b..c89d97e022b 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1215,7 +1215,7 @@ void do_interrupt_all(X86CPU *cpu, int intno, int is_int,
                      env->segs[R_CS].selector, env->eip,
                      (int)env->segs[R_CS].base + env->eip,
                      env->segs[R_SS].selector, env->regs[R_ESP]);
-            if (intno == 0x0e) {
+            if (intno == EXCP0E_PAGE) {
                 qemu_log(" CR2=" TARGET_FMT_lx, env->cr[2]);
             } else {
                 qemu_log(" env->regs[R_EAX]=" TARGET_FMT_lx, env->regs[R_EAX]);
-- 
2.55.0


