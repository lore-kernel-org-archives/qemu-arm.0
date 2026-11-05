Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8899606A335
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NB+TRIES;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HcvMEp1E
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwyK-0003VT-Fp; Thu, 05 Nov 2026 07:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyG-0003OH-42
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:36 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyE-0005mm-EM
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:35 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5B3Lh23193515
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7oSR+J5qW1aMzh2dYDYU1Jy0t1xB9T5XHm0AYD77RFU=; b=NB+TRIESuEE3GoEg
 F2YUNZRB/dF7bb5HIQRuRdKwOn+AfUi7Qi4QP1+F1xYh1UxF+qaCA6LFup42+8m+
 TUbAzVIOQekb1To5WQGiiI9chGZTJpxtOwxETp0BNhPfNbLNxU8hYjKhT5KrRaMz
 fBhdnUZ+9w5qF0eJ4gsCEZHDlHxCHNoF6czc/A0asZ/WFeIdg8Vp5WOZF3TtRNjo
 CirFXT26OxhMD9vTCADRhOZ1hTMgj4nhf/fbNAimQFKYCU3Jh09splE8ONMz6efj
 FGAzT9y3V9l/zMcxfEaPIxrXRS+86D6rnSQRhUbPNbIyzYz/O26/mCf37nL3JANh
 pEA2oQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdres2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:53:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cb93c874bso127131385a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883202; x=1794488002; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7oSR+J5qW1aMzh2dYDYU1Jy0t1xB9T5XHm0AYD77RFU=;
 b=HcvMEp1E39W1+d9KseCl5goNrRRzBtN6XUiy17WSWZtiD54fD8YKfIh8mqKYUCtp0z
 rT64QrdTdTzICajcqYLaqJ8iOWwAT0X4nT8c8qlOkPTxFbQRse6jYgFTWs/ZbzYzgHWt
 E+wweQiClKKkx877KHh4Ybz6VtZzKjCbI5Wu2pm1/br0B+yMxUzcvcSTDKph59+plRAc
 GtanKzfgMLBLp/HW62MHcihRAFgtszrKii28MGoaQhCxKb2uM2dX+RGT/oqSEUXG5mie
 ppO2QBmnzilP4AiGSqGEhk2XOr2ON935/3Plwkhc9v7KVXfVE2aJVUoTnHl1kqwQFYmu
 7wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883202; x=1794488002;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7oSR+J5qW1aMzh2dYDYU1Jy0t1xB9T5XHm0AYD77RFU=;
 b=oMsUVV/x8C61gm6wH9wf1VDHu4vRp9nVqL/tzsHvUhKwMOBvyMMNoL8Eak5WSRNqVV
 Fna0iG3qKXz64BpNT+r/5XQFR/i66svdpXezA/WZUkVCFjds/U442jzfDI8+1+9RjMWN
 VQpKHQVJa4oW1xFrse3aiOeEakLxuW5yfArro2OKvglgi+oovLcVrnCPCv8hhP0P/Ec6
 2jBe/N9j5cb6edYzMtHT/nNd2tvZ/eCAt6B51XXzFLUrS4/qIZbJ54vOoIqbSdERRivC
 pFo/NdT+xxtzCzVh0EFTII3wODTlV2ZHlWVMugsfqlICYB0JOv0dW1Jce7s1WfsKpOdX
 ffeg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwGWhhyy2OnYL+fegsQTDDkmOB0sfMNezq8v5U7zZ9gKL3JT8ztaLNTWRfb545whdJvT4X7WkkHFA==@nongnu.org
X-Gm-Message-State: APuU4Z+NtISY1ZVJSR0NNvYn8L6aSrOSoh0Vc5UPdSzuKm4tPPeWUNVv
 I59OkANf5gmXjIFONBPdtaFhhaXH5tQA5AYpMYvRg7KSk1YRyL6hZahYZc1Qznl9+P8gFqZ3Hic
 lG264InS8uBZcYirYB4451AIiOleE5VNlliXW/nUr5qxJd0ZbsG/EKKE=
X-Gm-Gg: AYBFou17DAAVmFYBk+ig8a/USTKzSmiMqp4ZQHDCZCB50x5uYqa+IUfnQWWSaPUO0nt
 DxBTPDz/w34i5Yytvj/+rDq9iFsCHp6KQrd4W75mC7ggZFF4sd4ez/M2Twd60DMu348bKntnG8u
 LY5Ip89Zee7Cdt3MWoGCB/4PquzyjENWWPdmUwwiNWrYSqwVK2YI8AiVAI6P1aoJjfCLVTxXDII
 BDGwGn71thY4gk2EpNFEsfuz6BMCNQIOKOUb7Pbbw2RfcVDmJTHrr5NITUg7GNcjjYWldGJ41Od
 AUoB/ZzwAm96AsKIK5+aJNNKLvImO5dj58N96A16Uq7H0s600WZ3rbT8TNrFDwNDHZVkY2vTWZn
 5m2uRPRm6uHe4SZIk6mFZUyiwxzwqk2rwPaoGl0K9GoDQ8hGnVReWku69T2aM5ctp6MzghIJEAb
 4g9N9XE2pGP+aYRdR1bfv6Y/zq/9OkXA==
X-Received: by 2002:a05:620a:1d06:b0:93c:5952:5765 with SMTP id
 af79cd13be357-945e1593c89mr394156485a.6.1793883201975; 
 Thu, 05 Nov 2026 04:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93c:5952:5765 with SMTP id
 af79cd13be357-945e1593c89mr394153985a.6.1793883201437; 
 Thu, 05 Nov 2026 04:53:21 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4a7677sm166255966b.86.2026.11.05.04.53.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v2 07/17] hw/riscv/platform-ref: Replace deprecated sprintf
 with g_strdup_printf
Date: Thu,  5 Nov 2026 13:51:52 +0100
Message-ID: <20261105125203.40320-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec7c43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=R3ryGEeKXBx8QBJlfjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7TYuPpLRxUwVoVlok-xOouGQN9vDYVQy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXxvMzZsUrHC42
 dTkG4viYvSnv5B7IIFA8oyDkgE31STIH/0zbsjw99NKAtZswhgBu3BVAXLcyGhF8Avvh7CltLsD
 LOinHW/r/F59SVa9fsAnvxRkcIJaG1E=
X-Proofpoint-GUID: 7TYuPpLRxUwVoVlok-xOouGQN9vDYVQy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX5VtdlNjPma2r
 4PjUSn136ZjTjDBi4WP76q0OcbSvPKBycoIWjtnv0zxC03SA9ewWe+SZTtFLZGgxcJfxPKmsQLd
 u8Sx60EQo95LDr8aEYSiblveOqQNIZeFMgqd2yEFQP+sDJYGenror7vc81ZJe8L0plLMuVfpsw9
 2Biu/xk+dvi6gPfU9o1ks5JjBrp5p8korA8VL8Rap6u1OTxWT+5nIjSeYe+zfoe+WRSoytqdZPw
 OznBI4VSdSt6hg3Y4E2eVuD1n2IFHXZPXlscwqL/NyzvAsbDleY2CPEIeoyjlJUpTVxEE+fazt+
 lzRRn/rAI79KpNb9J4te8I1FTc+j0uwjXLHYrNKWujSkt1l6nlfVVSq/5iZrZrJwAs6IWTf5aaU
 zmaFHpMG2v7rR9/ac+ZcHyLG81SiCKWMrdG8RbabYtz9kHIwvFGywEKwBjeKyyJQnWWkPmGxzmZ
 aXvwKiKIYZu9NqslB9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer g_strdup_printf() to format the AIA
guest count / description, silencing -Wdeprecated-declarations
produced by Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/riscv/server_platform_ref.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
index 5f485b1c79cb..d75bd1465a43 100644
--- a/hw/riscv/server_platform_ref.c
+++ b/hw/riscv/server_platform_ref.c
@@ -668,10 +668,8 @@ static void rvserver_ref_machine_instance_finalize(Object *obj)
 static char *rvserver_ref_get_aia_guests(Object *obj, Error **errp)
 {
     RISCVServerRefMachineState *s = RISCV_SERVER_REF_MACHINE(obj);
-    char val[32];
 
-    sprintf(val, "%d", s->aia_guests);
-    return g_strdup(val);
+    return g_strdup_printf("%d", s->aia_guests);
 }
 
 static void rvserver_ref_set_aia_guests(Object *obj, const char *val,
@@ -716,7 +714,10 @@ static void rvserver_machine_device_plug_cb(const HotplugHandler *hotplug_dev,
 
 static void rvserver_ref_machine_class_init(ObjectClass *oc, const void *data)
 {
-    char str[128];
+    g_autofree char *str = g_strdup_printf("Set number of guest MMIO pages"
+                                           " for AIA IMSIC. Valid value should"
+                                           " be between 0 and %d.",
+                                           RVSERVER_IRQCHIP_MAX_GUESTS);
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
     static const char * const valid_cpu_types[] = {
@@ -743,8 +744,6 @@ static void rvserver_ref_machine_class_init(ObjectClass *oc, const void *data)
     object_class_property_add_str(oc, "aia-guests",
                                   rvserver_ref_get_aia_guests,
                                   rvserver_ref_set_aia_guests);
-    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
-                 "should be between 0 and %d.", RVSERVER_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
 
     assert(!mc->get_hotplug_handler);
-- 
2.55.0


