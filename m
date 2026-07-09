Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD56CC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 23:12:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whxuz-0002uL-Aq; Thu, 09 Jul 2026 19:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whxux-0002ta-Kb
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 19:12:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whxuv-0003vZ-H1
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 19:12:31 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669HWq752563407
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 23:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2M7jVczTG6o+WxB0ZaYCmnDVtbML8yWUFPwdITSrPrI=; b=JwB7R9xBbLWvn8aa
 9PT+RJ8sdFUrYbGuRCjz7yxFY6Q8PmOvi3d/gK17WboEPgAUWKOqmYWkY+1VegT9
 akD1bE1Nft0wNh1KqQu1m+7adcInrrtNu2Cv3YWfZdLUnEmRPk9nAoglFXnGj3Ce
 fhv44MBYKrXFQujt1//v9XzZmZlNqxQJRnYzQtSANdScICBC0tm/0JzDK8AD9bH4
 BC7x8faDxayOtv0sSPz4J/JSQqS2VbqxXvC42/WeOLIOcPDF2RPWj0aFfKr5SmPH
 +QFvleXfa84nSkUNgzXwT/ySIdlk4WfNnxGV7U7fAYtcAyOAPEa+MgnV+b+I3BcZ
 nSurBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3hufq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 23:12:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c21c01cf3so5502391cf.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 16:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783638746; x=1784243546; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2M7jVczTG6o+WxB0ZaYCmnDVtbML8yWUFPwdITSrPrI=;
 b=Azt7VA/YBk+KXGuUGChQdY5qBn2GZcQcqYoHDI/fmQIDM3o5qtjh2QqOJYVlt35kEe
 BzF2NI11lM0d1WFBR8+kecDsv88r8HZEvSBtVCvVlg6KC2SqPnwZeG2gez0VHgz7QO67
 6M+uJbJWsmdQaq3wCvt44yUsvJqUstwTtUwJDk6iQdZsepF0tdos3u/vVTYxHqZcyiko
 GSh69t37t2jzhkazN96Kv418gS4dfc2gD+V7jye9HhXG9a97Wa1ryOyUTQ2dLpPJX5zz
 yDPoT63rbqB178bNUGJd92p5empMBiYjAs6akggqjpu9Shh6r0YhqFKPVpqFmZ6wWAxr
 WJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783638746; x=1784243546;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2M7jVczTG6o+WxB0ZaYCmnDVtbML8yWUFPwdITSrPrI=;
 b=qeNhZf8fOEDhi9eJYvup+nt0B612V7E1wkLpY2oMyuEyTYSUjfwNrUdk1EqljYcCLd
 AF3ZMXbdqIAQMr6/cJI444AQTFHnW00Nl25eUwnVDWUdOy29PDgXB9gtOmZBWBEM1CLw
 gNo0bmbDirwyS2tCJSU13LuzNbb2W2EeEumkOX22ScEzDDI4k7lAvQw349p8BCUw9e3J
 58YYtXI9H8zPCXU6uzHmaEVgxAxU/ShlRVYNUQTlePqtrNv0V4XXt8rJRpNYfdPRaD/X
 5vmxKWOCFEF80W6A0iqSLzgNdaAvz+cW5Z0xaTWsXJ0wptvimQPm2SGnNResXhw/WvEm
 7BTA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqn5j15Gbp3hm4De0TvhR0DomGQyfMSVpys7HPCxMWsbwbenhKZdg/FurDGl5WDn7MxcGEJcYNmDA==@nongnu.org
X-Gm-Message-State: AOJu0YzAlOrmMNBzu9CHTKkzgGdgnxQ+J8P8J9mncvzhVc/hKnvZim93
 f97LcYm+6FJvIlSqczhXQcxeDiAV15oYt+n3qNuUDy9dvyABfWVJ/4oU9WlM/6Uiyqx28ZSu0uS
 KeWuDNMPSfC9Vh76hJl4+bRfRSLff4xRaEQEaLHBnO2oI69ZiI6jUsn8=
X-Gm-Gg: AfdE7ckcbpFAgDx7mlh/CRgH6SmGeRqc80CKj/Dz8YwSo5wARabrAGs3JRw3rOHKGjk
 yJxyOP9egn2oZj3fq1Vt7iu0XiQfyUm2r0Jv6W+sg4MqPh3A/VNSeEWvO3DiUBCW9OIiwI8OZPP
 +XlI5eMcec3KwKfaMcdUCZ5lHqMyVe7m4W+THtYNOVPC4JNozpkLQMB/OmdiX02KVrjqrAcenTU
 /F9w4IbtKjS59mB/WQYrlD5uKw1j/3O3bYNlp2hppwV2fghlXrCGKZli4q6Wv4Vcf2T1UJ6JdtT
 hbE5NRmsjf+epJz1Okh/Cv+LFzh59pJpAhzfjjyfeUJx6A8KDxFPRuOcJrEoOuw2o/RXV2557/b
 WCqSmSzBhqNtRSmfm3GAHCLitB5VLyufp5CtN3mogPz2gBjcvOqX9S54dCceH3w==
X-Received: by 2002:ac8:5751:0:b0:51c:ff8:cd4c with SMTP id
 d75a77b69052e-51c8b4bb3f0mr97728811cf.72.1783638745637; 
 Thu, 09 Jul 2026 16:12:25 -0700 (PDT)
X-Received: by 2002:ac8:5751:0:b0:51c:ff8:cd4c with SMTP id
 d75a77b69052e-51c8b4bb3f0mr97728431cf.72.1783638745163; 
 Thu, 09 Jul 2026 16:12:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccaf1sm165756635e9.2.2026.07.09.16.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 16:12:24 -0700 (PDT)
Message-ID: <e6eb9034-91df-4204-93b5-01f4c0e07074@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 01:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Refactor AST2700 SCU preparation for coprocessors
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIzMSBTYWx0ZWRfXwgHDJ7Z7ss/l
 34pHHs4vy2pE2IFDyzK9i6LKrMlvN6AF86RhjCeNCAirwwpJb0znbjZWoDnKIfGE6LJvjanKPvs
 SbG8MxFXEVnEJg/eGIAeudVVFtdA2PD7TxTS2xeLeMmtVU0huP3ODYzS0xaP1F2kbXnBoiTmqEg
 s31H+2UcFiiRTV2SNn/7pNOnxID775jygv73boL6rJ6soTI/BANVRZUaaxUiXxQ0PoFKMeI4cfh
 bCGMRX/xh2iKQ0aj3aLIcecP6VpZAB82t3rqYKyPast0mTLHNyJdHMKMVG4EKlxwOhGYK6T9RGk
 3nNARYL2WsX6s2hUMn0vUNwTea0+V6lg3BUvnGykzAmhslqSVjd1L2I/EBqzzghGXDFH51doRbd
 Exhdncn8DKgQsneW31kpTj7eMY+YhkfYL0FBdSfozz0N2jofk+vf0y9nD0X8zDgeOApMTEhNjBH
 H3fdGjACtN955gUU6jg==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a502ada cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=9QJ4sMUYSkxLhErQLFYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIzMSBTYWx0ZWRfX0BJWPurMWKKz
 DRrAwIerkVCfmynBesUmw6guUmsU95ISK+o8z+lPSFwyIpa1/Y7lXBEH/V3ECmBwhPyQvhBhpko
 PkJnQasJjh+pqCbkGJUW2IF653yCO/Y=
X-Proofpoint-GUID: lVMEK03krK2aIet5lUJtK8ar2yvzc4OU
X-Proofpoint-ORIG-GUID: lVMEK03krK2aIet5lUJtK8ar2yvzc4OU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090231
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/7/26 08:09, Jamin Lin wrote:
> The original AST2700 FC support series [1] is fairly large, making it
> difficult to review all changes together.
> 
> To help speed up the review process, this series extracts the SCU/FMC-related
> refactoring into a standalone prerequisite series.


>   hw/arm/aspeed_ast27x0-ssp.c         |  56 +++++++++++---
>   hw/arm/aspeed_ast27x0-tsp.c         |  56 +++++++++++---
>   hw/arm/aspeed_coprocessor_common.c  |   2 -

It is unfortunate these 2 complex models diverge so few...

$ diff -u -U0 hw/arm/aspeed_ast27x0-tsp.c hw/arm/aspeed_ast27x0-ssp.c
--- hw/arm/aspeed_ast27x0-tsp.c	2026-07-09 18:42:33
+++ hw/arm/aspeed_ast27x0-ssp.c	2026-07-09 18:42:33
@@ -2 +2 @@
- * ASPEED Ast27x0 TSP Coprocessor
+ * ASPEED Ast27x0 SSP Coprocessor
@@ -19 +19 @@
-#define AST2700_TSP_SDRAM_SIZE (512 * MiB)
+#define AST2700_SSP_SDRAM_SIZE (512 * MiB)
@@ -21 +21 @@
-static const hwaddr aspeed_soc_ast27x0tsp_memmap[] = {
+static const hwaddr aspeed_soc_ast27x0ssp_memmap[] = {
@@ -50 +50 @@
-static const int aspeed_soc_ast27x0tsp_irqmap[] = {
+static const int aspeed_soc_ast27x0ssp_irqmap[] = {
@@ -68,2 +68,2 @@
-/* TSPINT 164 */
-static const int ast2700_tsp164_intcmap[] = {
+/* SSPINT 164 */
+static const int ast2700_ssp164_intcmap[] = {
@@ -91 +91 @@
-static struct nvic_intc_irq_info ast2700_tsp_intcmap[] = {
+static struct nvic_intc_irq_info ast2700_ssp_intcmap[] = {
@@ -96 +96 @@
-    {164, 1, 4, ast2700_tsp164_intcmap},
+    {164, 1, 4, ast2700_ssp164_intcmap},
@@ -104 +104 @@
-static qemu_irq aspeed_soc_ast27x0tsp_get_irq(AspeedCoprocessorState *s,
+static qemu_irq aspeed_soc_ast27x0ssp_get_irq(AspeedCoprocessorState *s,
@@ -107 +107 @@
-    Aspeed27x0CoprocessorState *a = ASPEED27X0TSP_COPROCESSOR(s);
+    Aspeed27x0CoprocessorState *a = ASPEED27X0SSP_COPROCESSOR(s);
@@ -114,5 +114,5 @@
-    for (i = 0; i < ARRAY_SIZE(ast2700_tsp_intcmap); i++) {
-        if (sc->irqmap[dev] == ast2700_tsp_intcmap[i].irq) {
-            assert(ast2700_tsp_intcmap[i].ptr);
-            or_idx = ast2700_tsp_intcmap[i].orgate_idx;
-            idx = ast2700_tsp_intcmap[i].intc_idx;
+    for (i = 0; i < ARRAY_SIZE(ast2700_ssp_intcmap); i++) {
+        if (sc->irqmap[dev] == ast2700_ssp_intcmap[i].irq) {
+            assert(ast2700_ssp_intcmap[i].ptr);
+            or_idx = ast2700_ssp_intcmap[i].orgate_idx;
+            idx = ast2700_ssp_intcmap[i].intc_idx;
@@ -120 +120 @@
-                                    ast2700_tsp_intcmap[i].ptr[dev]);
+                                    ast2700_ssp_intcmap[i].ptr[dev]);
@@ -127 +127 @@
-static void aspeed_soc_ast27x0tsp_init(Object *obj)
+static void aspeed_soc_ast27x0ssp_init(Object *obj)
@@ -129 +129 @@
-    Aspeed27x0CoprocessorState *a = ASPEED27X0TSP_COPROCESSOR(obj);
+    Aspeed27x0CoprocessorState *a = ASPEED27X0SSP_COPROCESSOR(obj);
@@ -136 +136 @@
-                            TYPE_ASPEED_2700TSP_INTC);
+                            TYPE_ASPEED_2700SSP_INTC);
@@ -138 +138 @@
-                            TYPE_ASPEED_2700TSP_INTCIO);
+                            TYPE_ASPEED_2700SSP_INTCIO);
@@ -154 +154 @@
-static void aspeed_soc_ast27x0tsp_realize(DeviceState *dev_soc, Error 
**errp)
+static void aspeed_soc_ast27x0ssp_realize(DeviceState *dev_soc, Error 
**errp)
@@ -156 +156 @@
-    Aspeed27x0CoprocessorState *a = ASPEED27X0TSP_COPROCESSOR(dev_soc);
+    Aspeed27x0CoprocessorState *a = ASPEED27X0SSP_COPROCESSOR(dev_soc);
@@ -170 +170 @@
-        error_setg(errp, TYPE_ASPEED27X0TSP_COPROCESSOR
+        error_setg(errp, TYPE_ASPEED27X0SSP_COPROCESSOR
@@ -176 +176 @@
-        error_setg(errp, TYPE_ASPEED27X0TSP_COPROCESSOR
+        error_setg(errp, TYPE_ASPEED27X0SSP_COPROCESSOR
@@ -182 +182 @@
-        error_setg(errp, TYPE_ASPEED27X0TSP_COPROCESSOR
+        error_setg(errp, TYPE_ASPEED27X0SSP_COPROCESSOR
@@ -187 +187 @@
-    /* AST27X0 TSP Core */
+    /* AST27X0 SSP Core */
@@ -196,2 +196,2 @@
-     * The TSP starts in a powered-down state and can be powered up
-     * by setting the TSP Control Register through the SCU
+     * The SSP starts in a powered-down state and can be powered up
+     * by setting the SSP Control Register through the SCU
@@ -208 +208 @@
-                                AST2700_TSP_SDRAM_SIZE, errp)) {
+                                AST2700_SSP_SDRAM_SIZE, errp)) {
@@ -235,2 +235,5 @@
-    /* SDRAM remap alias used by PSP to access TSP SDRAM */
-    memory_region_add_subregion(&s->sdram, 0, 
&a->scu->dram_remap_alias[2]);
+    /* SDRAM remap alias used by PSP to access SSP SDRAM */
+    memory_region_add_subregion(&s->sdram, 0, 
&a->scu->dram_remap_alias[1]);
+    memory_region_add_subregion(&s->sdram,
+            memory_region_size(&a->scu->dram_remap_alias[1]),
+            &a->scu->dram_remap_alias[0]);
@@ -254 +257 @@
-    /* irq source orgates -> INTC */
+    /* irq source orgates -> INTC0 */
@@ -260 +263 @@
-        assert(i < ARRAY_SIZE(ast2700_tsp_intcmap));
+        assert(i < ARRAY_SIZE(ast2700_ssp_intcmap));
@@ -263 +266 @@
-                                            ast2700_tsp_intcmap[i].irq));
+                                            ast2700_ssp_intcmap[i].irq));
@@ -265 +268 @@
-    /* irq source orgates -> INTC */
+    /* irq source orgates -> INTCIO */
@@ -287 +290 @@
-                       aspeed_soc_ast27x0tsp_get_irq(s, s->uart_dev));
+                       aspeed_soc_ast27x0ssp_get_irq(s, s->uart_dev));
@@ -325 +328 @@
-static void aspeed_soc_ast27x0tsp_class_init(ObjectClass *klass,
+static void aspeed_soc_ast27x0ssp_class_init(ObjectClass *klass,
@@ -329 +332 @@
-        ARM_CPU_TYPE_NAME("cortex-m4"), /* TODO cortex-m4f */
+        ARM_CPU_TYPE_NAME("cortex-m4"), /* TODO: cortex-m4f */
@@ -337 +340 @@
-    dc->realize = aspeed_soc_ast27x0tsp_realize;
+    dc->realize = aspeed_soc_ast27x0ssp_realize;
@@ -341,2 +344,2 @@
-    sc->irqmap = aspeed_soc_ast27x0tsp_irqmap;
-    sc->memmap = aspeed_soc_ast27x0tsp_memmap;
+    sc->irqmap = aspeed_soc_ast27x0ssp_irqmap;
+    sc->memmap = aspeed_soc_ast27x0ssp_memmap;
@@ -345 +348 @@
-static const TypeInfo aspeed_soc_ast27x0tsp_types[] = {
+static const TypeInfo aspeed_soc_ast27x0ssp_types[] = {
@@ -347 +350 @@
-        .name           = TYPE_ASPEED27X0TSP_COPROCESSOR,
+        .name           = TYPE_ASPEED27X0SSP_COPROCESSOR,
@@ -350,2 +353,2 @@
-        .instance_init  = aspeed_soc_ast27x0tsp_init,
-        .class_init     = aspeed_soc_ast27x0tsp_class_init,
+        .instance_init  = aspeed_soc_ast27x0ssp_init,
+        .class_init     = aspeed_soc_ast27x0ssp_class_init,
@@ -355 +358 @@
-DEFINE_TYPES(aspeed_soc_ast27x0tsp_types)
+DEFINE_TYPES(aspeed_soc_ast27x0ssp_types)

And without the s/tsp/ssp/ name changes, the diff is as
small as:

$ diff -u -U0 hw/arm/aspeed_ast27x0-tsp.c hw/arm/aspeed_ast27x0-ssp.c
--- hw/arm/aspeed_ast27x0-tsp.c	2026-07-09 18:42:33
+++ hw/arm/aspeed_ast27x0-ssp.c	2026-07-10 01:10:06
@@ -236 +236,4 @@
-    memory_region_add_subregion(&s->sdram, 0, 
&a->scu->dram_remap_alias[2]);
+    memory_region_add_subregion(&s->sdram, 0, 
&a->scu->dram_remap_alias[1]);
+    memory_region_add_subregion(&s->sdram,
+            memory_region_size(&a->scu->dram_remap_alias[1]),
+            &a->scu->dram_remap_alias[0]);

2 lines of differences! Could we unify?

Thanks,

Phil.

