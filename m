Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7689A606A321
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/S8f+Yw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aTv13yLJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZEa-0000af-Fl; Thu, 12 Nov 2026 13:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZEZ-0000aF-3I
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:09:15 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZEW-00036I-HM
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:09:14 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFaPh91593550
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P1uAtvxC00J36ym6pdmfYyfKIuBnQlzkKk9c0joVQOM=; b=l/S8f+Ywp87gIvO7
 bhgdFYNQvbSSKV5jWnIH0NfdLz5mRSKj+/RaXsPzjP+j+cv/IcFvquhppiat60Xj
 OCq6po8Ml8oMOSNYeqa1b6E3PA3TpYCLO882rfI7DSpULMfF2uFdPuEi9CQwQfOh
 nBlbQ5nO2EKrfqJcetvqW+SES4laQjXovuEc3fL80BC9Rp4l2pHup3HmdW0Ri4sg
 9E99pqHe6Nhg4GXP1WZBxHA+RfwFOeX01QOBJo3IedC0LAVbK7+xvYQTlAcynDsK
 SfloES2/E9GlkEM9QR0OjdaF8KAllOzLQLrNi16dh6RQxZYaqDPd9yvRfTC5or45
 Whdu8A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8m4my-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:09:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-99063f4065eso48958241.3
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794506950; x=1795111750; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=P1uAtvxC00J36ym6pdmfYyfKIuBnQlzkKk9c0joVQOM=;
 b=aTv13yLJEo9FnveYOVhEUoIAb799tp+geoM9Fr06WARzDRZ4jpR/7IbQpu+joXyYP9
 qvxdZAdtw3YRrHl1OYl9D/bJhKX3bBcFBHn0OUcxCAZywmMF5yOrM7tpaneI/E8GcGxa
 Go85EjP3V4CDMJIDzB6c/cq4RDu2KHO2yMxmVTZn4jUEK7Zcvrcm+T+tlVDYSKRj8ze2
 no+bAeH1FZi+I9zTmzeHVXKREqg+fKCAySRBE7t6As/P1/+jKmTDAJYzwJ4k7mh1NnWK
 mIe4jhzzkb7y5z5kZq6r1zWEjzBfUvPVDalW1QKx0B88TG0KpH8ZxMohc9F3DZdlVEN6
 XeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794506950; x=1795111750;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=P1uAtvxC00J36ym6pdmfYyfKIuBnQlzkKk9c0joVQOM=;
 b=JFgK1ICUI7eu+nGOBrpteyCKadhhcSp2S9bPTCqRm9pjtKjdn/TQtaYkEpOo1QDz3m
 ha4D9Bs9SoOOhDz6cu5GZqonkaMNaVOL60Il4loLhtbgF5ascbwknACSfURThWDVqdz2
 lNr//wfvm+LAEzZ6GC8IT+IUCARkLAa4UYzUP7NjlPyOQhRPoOsrD/baX2+1o3NIwQur
 w6Eo2DjFMsGZaf0yZYvEh8+gU94LooQXYt+KgRNdHOA5suco794iWy1FMeSiSwqGQHY1
 fkTRi8UxvEYzym+ryA/+rIz8jBL3s1vWo09iVR3gorSlEU1LPq/6Ryv3GlEGmPIzZzkL
 oDmw==
X-Forwarded-Encrypted: i=1;
 AL+hErH5VcDebYbtCANQX8t+iOcHs06YGhv88pUgFQR9wSTR4wmGzmOVexMmT/Karutiwkj/kEkpABKWDw==@nongnu.org
X-Gm-Message-State: APuU4Z9fsD3nazyPo2levDUcxdTn3nFVarJLHJAm5gQdQyuX55TTK2i7
 ezWDbJnqP18+fBbUSImxoSjdPoAXtTy5RHSpSUBgEbwxCDoV4gkRzFwWQdO1JifVS9yaY4oJkLR
 QQ61mSUUKCxop0C1A12fPIflbgUNqV8PD8HgKZye5pxZ9AgpUcYpTSGk=
X-Gm-Gg: AYBFou2SwuIZhr8074ksdD5W41EzewghIS1G88q1B/p1yWAtDZW47SGqrlstvVN1U0J
 QEb9R7Jbw0qNbhr1NrIp6GJlTvlWbx7JxIqXpl0q3H4Za8s8AchoN9h/bDKBUiPjkcg55/PSBGN
 qqanru4frvFyyJceRLCrVoOZKiqNfbKKEyXP1nLeREkb+5is07KZ827ekX/8jxFGje77pMV66N/
 Frwhmt3jYpzjETTyaHZLzRl5P5oaxaenO7Fd6Q+KOiUO5bst5d9E6UjjoyY+yfIme0afYHhiKdN
 0Pu3URmpXBtI44UBQNfvZ9ZlqqzzbXId1hgruph/OdD5MEZL3sy+ue8Lk3UVxbcFcqiPl0Gp7gq
 +N3MpkbFnz9lN3jHzAIIRDZkviY5gdbhbLLc52PkD/kDOkBbxrrqh2JlZ3IxOaPqmOEJujB92FP
 vo4LwWp2tlEivwRw==
X-Received: by 2002:a05:6102:3e90:b0:7cc:2cd0:e74f with SMTP id
 ada2fe7eead31-7d5060d344bmr2043332137.30.1794506950019; 
 Thu, 12 Nov 2026 10:09:10 -0800 (PST)
X-Received: by 2002:a05:6102:3e90:b0:7cc:2cd0:e74f with SMTP id
 ada2fe7eead31-7d5060d344bmr2043313137.30.1794506949463; 
 Thu, 12 Nov 2026 10:09:09 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0953159dsm76215395e9.3.2026.11.12.10.09.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:09:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH-for-12.0 v2 01/12] tests/tcg/aarch64_be: Check data byte order
 in hello
Date: Thu, 12 Nov 2026 19:08:47 +0100
Message-ID: <20261112180859.85380-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX7W9EoG2ag9fv
 zEY9PSLlXMmgOLRncygg9/NsitRp56FXiAe5WDoGm65zxs7GGzg5fUyk7F6ga+xfB8ndFQ7JtaM
 teZsC5n+bEXGDEobwgvn3/2f1hpw0IY=
X-Proofpoint-GUID: fQygAd5RB_i_KWsMj3lEt6_h1k4x0HU5
X-Proofpoint-ORIG-GUID: fQygAd5RB_i_KWsMj3lEt6_h1k4x0HU5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX8xDuNY6ys+q6
 +/ETN81WMPG2JBqL4mrDtFDgqD0/tJmtvB5+3U+KMTDgVnet2KtsVnGoc7FiVoZqOqEnuh8NULI
 S0DJ7Lfvqe6m7aCFqh9NfOLljgo8QlidX6NHLS+C5qSFv98VAI5GXeQhInHs2piplVqK8Wij8Yd
 fpF2FLdLWpz9XGsd56nggTQDMNivpbJ6gUZxEua2syswY/y6uUu4IX3fqCxpOPpvyLCe/gEC/CW
 HYgAOWlqMOXwR5Z4tovYH3pHIbmjr8eVmBXbTw9LI1t7TKcYS1Dv2ZfLBor34UrrseULRBpkdLa
 r0mFaSm1uki8WZaC6cqsjg+BEFj0Xqm+R/71/I4Eg/U0uvIc07jiabVNtzYXItprwL/eJ4Nv0gU
 plIuKrTqe9USzIfwgCOHKWXWVBPrTnxFmP1YBEZGdrHq5mX05c62d6SiIOo1sG9T2lyScQAvJZZ
 1iUjEntuetLteZ1PDNA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af600c7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=apfC6Sr15dbh0XQO5jUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Load the write length from guest data instead of an immediate,
and fail unless the syscall writes exactly 12 bytes.
This detects incorrect CPU data byte order rather than merely
accepting the ELF header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/tcg/aarch64_be/hello.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/aarch64_be/hello.c b/tests/tcg/aarch64_be/hello.c
index a9b2ab45de9b..18432d3257dd 100644
--- a/tests/tcg/aarch64_be/hello.c
+++ b/tests/tcg/aarch64_be/hello.c
@@ -7,16 +7,17 @@
 #define __NR_write 64
 #define __NR_exit 93
 
-int write(int fd, char *buf, int len)
+int write(int fd, const char *buf, int len)
 {
     register int x0 __asm__("x0") = fd;
-    register char *x1 __asm__("x1") = buf;
+    register const char *x1 __asm__("x1") = buf;
     register int x2 __asm__("x2") = len;
     register int x8 __asm__("x8") = __NR_write;
 
-    asm volatile("svc #0" : : "r"(x0), "r"(x1), "r"(x2), "r"(x8));
+    asm volatile("svc #0" : "+r"(x0) : "r"(x1), "r"(x2), "r"(x8)
+                 : "memory");
 
-    return len;
+    return x0;
 }
 
 void exit(int ret)
@@ -30,6 +31,9 @@ void exit(int ret)
 
 void _start(void)
 {
-    write(1, "Hello World\n", 12);
-    exit(0);
+    /* Force a data load to check CPU data byte order. */
+    static const char hello[] = "Hello World\n";
+    static volatile int len = sizeof(hello) - 1;
+
+    exit(write(1, hello, len) != len);
 }
-- 
2.55.0


