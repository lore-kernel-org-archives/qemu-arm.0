Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2CBCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEO9c-0004DI-9e; Wed, 07 Oct 2026 05:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xENyV-0007vz-Vu
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 05:30:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xENyS-0005Ho-L5
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 05:30:10 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jdhk3194057
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 09:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=peOisZFBpZ32NfgNzRqCOq
 BYF37h9kgf8/mExHACSj8=; b=Z3Hky59E4w3XAFutILqPUIF5ibcW7JUYKIcct3
 eTG9ugLUXYOqV8YKPkZ4MTs3/BCT+QrOHdt7UqsKmNz5Vsj9dwAVvrxU05A2F8zQ
 4LCt9W+nRCb3eP0LMpgcKagGMEBLgSxWkOHKZfcOiFC+LGUFZW1V/vlDfvuIkyTe
 ku/BNxGtrvgqTlfXtYTHxiPF2wKXG5XdonX5+D3jLWwlE6EkR74inbtfEHTFwNcc
 0tBrlmkb3605A8hrFKJpL988jlSoFzzMrgYL0F4/BHD968oIOWOq3VWqy6XnrECH
 b3T71LcaFpq289YdWqH9V5dD+6JlpPJqBPijRZFKPsPLAxPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukmmb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 09:30:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cc5f70c8dso425164885a.3
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791365406; x=1791970206; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=peOisZFBpZ32NfgNzRqCOqBYF37h9kgf8/mExHACSj8=;
 b=afJsEUvFwzOYQRd73AtNf1/DeOLk26WrjvfgpftUYiajsAz3sb6zI9SlPg7VLUWVDQ
 EcEMB6bcJ27O0jv5eX4A9ebimyGkkSD+U9JDYn8TwKsae37VS0MOJSmIf+57/uNVIjNI
 7NwQuQq9eBK34QxuOI4GKf0zT/2TjyqtX2iuRfiKXyG57nZvvY+ni1bNqTaKSYrV3jOZ
 BqQuecjSxW/aoMojV9P3dW3lin3GmLIwbbuyavRcPJkzPFGXzkJIp9f3plRhw0TINdM7
 KWRE233LxnKS8qU6LrYql3AyDRDpE1xu9ItGLxcqw+YJW9t7N2xzKVtIYj6blA2aeA9M
 pEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791365406; x=1791970206;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=peOisZFBpZ32NfgNzRqCOqBYF37h9kgf8/mExHACSj8=;
 b=QdcwGiJgOTK1XkfN0tMZORE1T7+ATyizKEppUjgeVocz+dCxgBajpczLFqewb9Bduu
 cwOZ2oerELdNZBdVrkvOkCRZzi2oOi6zWi2mCT2kRKnKjNZyvdaUar4EF4j5zqKptLYO
 opMGr2VO3SqhazFeqZhZQMmTyLJuaFQGw7Tk4hWl3ErJ1A1OazPoH6HYN/Vk2vr7MB9W
 2a/2noaUwfLga81zIfcSDHe0gPQ/xTfLWGuXrb1jAW3gzrambWeEg3eVrUdqwDpT0QSJ
 L2ynqsP1IhRqAHx947ukTeeA4e4uAW6eLaPPFJx5Nfc7ydmpwSwkdLt0DL0c+WcMM/Rj
 07ag==
X-Forwarded-Encrypted: i=1;
 AKwUvByAxFfpFQh/yKaT3kWR0zybDtM/CkaFmGyjBMYnAffQU5yrVtLgBQz5VVMXvyJeBhTf1LkMMff7eg==@nongnu.org
X-Gm-Message-State: AFuF++kPH+tPgjY1fAhCNcyCEsDNeDsb7pKdCEO8E/CEXv5O6l43EFYf
 fi6kt7dUTOXfk9uTA18oRgf37VA58gR4I4D6y+x7+tVtqnyZ6XnL06H5sbMliVk4NfHCQZUtogm
 yUBzZHyiJhiWFi3xJc0/XO6Rhfq/Sy7j45eG8aiMNJF42cQ4Yh0hqGd0=
X-Gm-Gg: AYBFou0WHK5AxqXGjZFgoRk2GMWt6q7GgjMWAR4J0qrW8E8jqE59fgTufXn3RM6Kd/F
 /wYDagUwG+YBCpbus2f8s6Upcz22HTPwAMuIHOwLBVYsR1ACa+fkXWzoSj8pChhQm3av39cbVWG
 FR0BJRUD2q51wS1TdmQr1By/LW16sEuuhwbbu3adyX3v8RuRVJTu1T5cL6yGQM4e+ZwVOqMr3hm
 FTamj5Zaq2YrqH9LlWbizvvG4qybq3Zp99kusMENfqpHZy9dCPBiVehGkkgOlfijZrWSb/R7O8l
 WD1041JO+vTEGziQ0ErbwVKfs+KaAxJc/wsSrslHm2PJfe3tz+fHY6yQZT4RSlo/gPJxiG/h6/g
 9SU+symlP4WkT6empdHPZ6alMf+IHut01dicIISYC
X-Received: by 2002:a05:620a:460f:b0:93c:ca09:aa34 with SMTP id
 af79cd13be357-93e9b7c2ac4mr328637385a.46.1791365405795; 
 Wed, 07 Oct 2026 02:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:93c:ca09:aa34 with SMTP id
 af79cd13be357-93e9b7c2ac4mr328632385a.46.1791365404997; 
 Wed, 07 Oct 2026 02:30:04 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a180310c9fsm37495675e9.4.2026.10.07.02.30.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 02:30:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 "Scott J . Goldman" <scottjgo@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH] target/arm/hvf: Retry RAM write faults only for dirty logging
Date: Wed,  7 Oct 2026 11:30:01 +0200
Message-ID: <20261007093001.74476-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2dYVnQtqhtMnFGW3rzr-rRWAeN9J96_x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfXzX89xWQ+/S1Q
 EZWWFWnTf2U7r5JetIoK2RJZ6zdvDBd7Zlgi5kwQhbJMZ327BqVXwnCFMCRPsyKpoirHvjJ0xNn
 ccdFvXZdj5CTmoBdXtoiwtt0xZfvRI4=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac6111e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8 a=4iX3uDW9G_cJQgqnWakA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX90uBsD3rV8d4
 LrtJ3Es9W+YyMqHAbN1vSK8RAdLJ0eorC40XKaY3h0CXFnRtpA74CDEBBxVWqrOdLR9yHsdA1sv
 gQe6WG+pvdBuvT6TNH+QEQj8W8C7HAi79J1JNJ5pddkZRLOZb/cVd+4HD72RT+zb+fDJYM7cp7z
 SkZ/4o9j4Ue63Qier3flh3CpVZrZhXIl3daBIpQepPnfTt+1a7JN7PS+b2oR5LmoT4r34MTvp0r
 6flI1oeGdxDB2UwIAv90XG4bhbHEDk1R0WoAqhUdPqLuW8zrOKLr+15xs4AwFGv50dEWfU/4/XK
 sH0X3Zv4eUp/j3UG/4s7nDRoqFwbux/SsZHNhlbG/lCI2kc8Ut1WKLL7jrD5YEu2z5kiyFUIBUQ
 a6Rw4VP59UprcxAZKfmPLiYwNIMFq6PfUxrxqHJvL9+ZjKn8L/GixAtUgsUOI0cEXysjQw2LU01
 WjW4XPYl1xfc6FSBjzw==
X-Proofpoint-ORIG-GUID: 2dYVnQtqhtMnFGW3rzr-rRWAeN9J96_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070037
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Mark Burton <mburton@qti.qualcomm.com>

Dirty-page logging handles a RAM write fault by marking the page dirty,
restoring write permission, and retrying the guest instruction.

The handler also retried when the resolved RAM region had no dirty-log
client.  This path neither restores permission nor advances the PC, so
the instruction can repeatedly exit to QEMU.

Retry only after marking the page dirty and restoring write permission.
Otherwise, use the existing emulation path to complete the access and
advance the guest PC.

Cc: qemu-stable@nongnu.org
Fixes: 58bc47fd1c ("target/arm/hvf: Implement dirty page tracking")
Signed-off-by: Mark Burton <mburton@qti.qualcomm.com>
[PMD: Reworded description]
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/hvf/hvf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b00a7e1a845..b6a2dba71bb 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2427,10 +2427,10 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
                 if (memory_region_get_dirty_log_mask(mr)) {
                     memory_region_set_dirty(mr, xlat, page_size);
                     hvf_unprotect_dirty_range(ipa_page, page_size);
-                }
 
-                /* Retry with page writes enabled. */
-                break;
+                    /* Retry with page writes enabled. */
+                    break;
+                }
             }
         }
 
-- 
2.55.0


