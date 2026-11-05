Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A069606A32D
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSrFC285;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivBUODWg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOx2e-0001RH-Uo; Thu, 05 Nov 2026 07:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwze-0005FD-RY
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:55:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwzd-00060S-6t
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:55:02 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tQZl433306
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VMMFN1+pLoUGNoBqmjhjA8Ezrd5KH/WaeThj9lHw1qg=; b=eSrFC2851qN8qhMQ
 GfIkvvAxje8D5cBvJxeIh3E8SqSkVR9fhOLaqVqmoAewAlddH45eD3Cg0cLKLxX8
 5Ze/AgdZSFwwe8OIwZtxclKWUjpPUViVZnjqhaltGOqHFlPeaf75z65XOH90AE+k
 XlNCOrBwPaKVAsgHrT6IwNI2bJP8rdJxeUARRgHgKCaq+k9b4d0j8jAMPY6RVsDf
 mmbYPRvG7JRvL53dLLoYmn0w+E8Tj4pJ3qvMmwzz1c6ZZ2yEM8KPuPCiPr1KBa1u
 5bQzvwjOsByE+WIryVyPZ4LJ7550W14FiYJQSTy9Ds6dBksFiz6aTKZbDNnrEgam
 S+25XQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9kj5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:54:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f5844e383so360787085a.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883290; x=1794488090; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VMMFN1+pLoUGNoBqmjhjA8Ezrd5KH/WaeThj9lHw1qg=;
 b=ivBUODWg81z5OoBvsI8MNu9l/trwPVSMHlozCrqNq6TR+SLEXG8nYf1kbiCxGi3Z5h
 9pb5Pb720UqT0zLWQBd5uX4nKwQmh3NdiHd8sXST3XrT5wMxWQ9xREGrjXxiEFGPNLav
 1F6GeKxDG3jfrwj1AJrgjOAwtn05vkfKUNUmm+LkAMmMRDlZI4eZQaNhqrB0B7KUm4b1
 Fui3oSFwlqCPDM6clFFGjw8k58i8pVao/teOAB3GZSYCYDLCfqQz/dodmgKqLNV+AAIP
 nIhzvwQF3IeHM3Hr3fp7c/gfgiw/Ws8lQLS+TlTuny6gyE7X+y+OAUo5DXKkeDlCLM3g
 B3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883290; x=1794488090;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VMMFN1+pLoUGNoBqmjhjA8Ezrd5KH/WaeThj9lHw1qg=;
 b=PLELeNkrSXuRTz5dLcoipA6x4y60FaGfBt8PirKyDDRqPCcMktyPpe/1TgnxUn5R39
 HXGZCR4ed6bH7mk+9o4VqFh8OyCccJ7FRXVgsng6mli7VrHLtWgIZLkn+iirM2F/s2mn
 cJ9CTe5cWc97htNV2DAR2FK6xUl4/3I2rej1wsmEHoP4ZDDu5a+HoiLxyz96+dwa/Med
 Wi8ZAVnc5cCJsgdyB5w/vVoTph5qCuLp+6N6YGnSLjPOViZuRHrpeYLJwIhIY4dAf1Je
 Uxd0o6QmdrpDQCs7df14AcylHMdhT9E9X9jOnBJsEutvvxSIYZB5/P0gBSeNk4NxOWuq
 RmMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw6jLtR9lk5GjMPOpzKhxRwLsj2zZQbbCm3hHTUbY7cFc5rc0l0nponerCtPr4vwdnjLCw9RcR6fQ==@nongnu.org
X-Gm-Message-State: APuU4Z9Y5RjbOD4RMl8ZrxjTnSTDriHjaB9BmxEihoSeZpywW1MwSQOY
 bCjnQo/qhw8BBDw9kYOH7aNZnALcbbybAci+65nOBkOXahSHfHzQ/r8dGk3IMCY68K9vwOpvWQk
 pJei+NG7K6lExQq40I4JTK6MBS6iQvKtrbsuwMeE1kXrJSrcUI6grlNw=
X-Gm-Gg: AYBFou0wxV7VkWzTNGBFZNBtkEmxi52i4CBOFghgwXKJP6NAZ/75qyGhIoqWO5vsfQZ
 KwEtmbimwlsNq0YBQOBh8Yr96OvqH8QlKk1ZLCn8zRDyn2xvmHcL6/3cWlwDUScb+AqakPOCiAZ
 /2O6eqI/HpaSp839ycGYV4owB96g+kPl7DnMYcV2RLC16OTnxoaB0nU8FYe0nsuSor3n6KEbTov
 AybYrRoEEazUJJb2T4PujNQ+CS98X++Q43KENChOW+0XLOJg+ZykCPj2XerDzei88/IBrE/kZK6
 IjAnXLaP3OABaKG2ZokQ0+wAHuQIV+FgFHw7mzZmDtya7P1IQV5VstTEOPJjx4mgoadssRaAgND
 imPIdBVZvlS9VAbWO81ZB/31RcMQ/qJPENQGJC2nDwW4KAnkznCzSCkyVTCGSYtntM/6uNzPfjn
 WNjIRUwfPfVBCw+gGw3WDO14W6
X-Received: by 2002:a05:620a:1720:b0:940:f224:5a57 with SMTP id
 af79cd13be357-94421729da4mr3271589985a.62.1793883289651; 
 Thu, 05 Nov 2026 04:54:49 -0800 (PST)
X-Received: by 2002:a05:620a:1720:b0:940:f224:5a57 with SMTP id
 af79cd13be357-94421729da4mr3271586285a.62.1793883289202; 
 Thu, 05 Nov 2026 04:54:49 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e48b93dsm171033666b.64.2026.11.05.04.54.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:54:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 17/17] qga/vss-win32: Replace deprecated sprintf() by
 StrCatBuffA()
Date: Thu,  5 Nov 2026 13:52:02 +0100
Message-ID: <20261105125203.40320-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec7c9a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iCt0esSg6Z1Y5TalJfgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: E6C6snn0GobMMKinRRpAiRh9ZxnbwuQu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX4ZMgOhlaG+sy
 1gwFT+Id4LCeAyjCJwIn58LCb+MJa71JYEv4mY2GhuSjC00jLAwIHsTg23euQjP+mM79X9abemB
 qubPC9hyK4TDPOsOMLXTf+L4BOnz5wc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXz4OIHr+x1quD
 d0PSo0jUaZyfmjDQehUKAat4dV9zA5VkrrY5gYQlQAycOxk/wGExUuxymbNf/6X3YdHAt8DW2Qo
 CSbONIiGHbPnk5dA6038rxeueAyfy/hZ356+XgPK1LNDu8FwOueVTMO6EtcyaBC79ja8chGyXGO
 G3OoKscyjLXByeeexb29QvKNZZ8AastZpsGdorOgXKiEzLkRh+oqMF4QycdSHGVMeTCFfC2oWlI
 34bPenIh+soohGrBxu6gnLAkqH7bVimfd0VrG5Nnm2ss0QVMp5/BimzslbReMxU/plPQi3YlBFF
 bDEVWmx/cCYHu60quOlOyiAHGJ9uliQyHVbtpE0ZAOdSSALG1umxLr29y/XYH0w0TZPESjhQMCf
 T6jAIReEt8/Sdpa7TraE8gkba1KBiiH6VmEtVnUrHXutxh5YJbHBZN1W7uBp1NEtE6LsUiEC9HF
 N/qQrG7Z8i8SKkpAekg==
X-Proofpoint-ORIG-GUID: E6C6snn0GobMMKinRRpAiRh9ZxnbwuQu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Formatting is not necessary, replace the deprecated
sprintf() by StrCpyNA() and StrCatBuffA() calls.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 qga/vss-win32/install.cpp | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index df00588c923a..1a3d5cbf75d5 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)
 
     /* Add this module to registry */
 
-    sprintf(key, "CLSID\\%s", g_szClsid);
+    StrCpyNA(key, "CLSID\\", sizeof(key));
+    StrCatBuffA(key, g_szClsid, sizeof(key));
     if (!CreateRegistryKey(key, NULL, g_szClsid)) {
         goto out;
     }
@@ -572,7 +573,9 @@ STDAPI DllRegisterServer(void)
         goto out;
     }
 
-    sprintf(key, "CLSID\\%s\\InprocServer32", g_szClsid);
+    StrCpyNA(key, "CLSID\\", sizeof(key));
+    StrCatBuffA(key, g_szClsid, sizeof(key));
+    StrCatBuffA(key, "\\InprocServer32", sizeof(key));
     if (!CreateRegistryKey(key, NULL, dllPath)) {
         goto out;
     }
@@ -581,7 +584,9 @@ STDAPI DllRegisterServer(void)
         goto out;
     }
 
-    sprintf(key, "CLSID\\%s\\ProgID", g_szClsid);
+    StrCpyNA(key, "CLSID\\", sizeof(key));
+    StrCatBuffA(key, g_szClsid, sizeof(key));
+    StrCatBuffA(key, "\\ProgID", sizeof(key));
     if (!CreateRegistryKey(key, NULL, g_szProgid)) {
         goto out;
     }
@@ -590,7 +595,8 @@ STDAPI DllRegisterServer(void)
         goto out;
     }
 
-    sprintf(key, "%s\\CLSID", g_szProgid);
+    StrCpyNA(key, g_szProgid, sizeof(key));
+    StrCatBuffA(key, "\\CLSID", sizeof(key));
     if (!CreateRegistryKey(key, NULL, g_szClsid)) {
         goto out;
     }
@@ -651,7 +657,8 @@ STDAPI DllUnregisterServer(void)
         errmsg(hr, "CoCreateInstance(VSSCoordinator) failed");
     }
 
-    sprintf(key, "CLSID\\%s", g_szClsid);
+    StrCpyNA(key, "CLSID\\", sizeof(key));
+    StrCatBuffA(key, g_szClsid, sizeof(key));
     SHDeleteKey(HKEY_CLASSES_ROOT, key);
     SHDeleteKey(HKEY_CLASSES_ROOT, g_szProgid);
 
-- 
2.55.0


