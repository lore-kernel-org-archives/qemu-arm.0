Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A7606A331
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUPAHVdK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALW2uVc6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVPG-0006G2-QI; Thu, 12 Nov 2026 09:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPE-0006EY-64
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:00 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPC-0007Pv-KB
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:03:59 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACB8Fs63477109
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bi/CcAI+rvmm6cAUvvP/Z0IB5bzH7SCWH1tuI55uIAY=; b=fUPAHVdKnCegmG7a
 1/WDzkp2jOm+99kDgT9FaOptMUHO/y2byO/D2h310doa/q0WGGSWwLmJbud+I/iJ
 HfMHGRiThyEHn5d8fxYVyuwlxKL6E7YBYUQ0iXHgJ40QTiIATBRe6VxI8cyUtG7x
 83T0IQU0CsUImHakuNWtFQxONCYTAp9VGLxmTuNk4aMvhlZMZcYqB7KPJdqaPLQW
 ZkE7aa828O2w052tNnbeBJolwSo64QfWaurLOQhnNNqLFOtQcKsgRg0aXeU9HBxP
 j7a0KmXqWZs5b1K5r0ZYwp8/Yi0oq6cLc6Igv9CQ9KGG2wmVTBmV6hqOQ3agmvOe
 oPB+LQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuhu2v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:03:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5eab0467c89so5631097e0c.2
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492236; x=1795097036; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Bi/CcAI+rvmm6cAUvvP/Z0IB5bzH7SCWH1tuI55uIAY=;
 b=ALW2uVc6o6/hcZ6vb2nzEsgY3IKkimZXFwzKvhl0eenfJY/xAf3HqwKm6mb00nIrfo
 uXgik/17/nwdt/BLgny8Vs+yxu+M9TXncWeiBjAMmTIyLFwad6L2vtB/HCnO2HP0LHzy
 s/SOYTZS3d2QCCW8WtpaY5wGLt5HK6rkDHlAKgnI/0TJlMqb0JAN0pJvtOIU5dB/yqAU
 OY/ZJ062JOQTfkJdf3eJmgMD0QqL4UpAnfm3e6mZaTiiga4yyOPuaquXFzLGH3OtUCfp
 IOuuFiNtMOWL1qqlGFvXDi314iXDpqBbdEMn39UMq12eJqW3HYW49KhIUeE6kaA2oOoR
 1gUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492236; x=1795097036;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Bi/CcAI+rvmm6cAUvvP/Z0IB5bzH7SCWH1tuI55uIAY=;
 b=tgBY/RKn4bIjv2nyd68ayZI/kINDRdQ9/e/jT1LBzllekQeI1227lq9uvU0jUHZBvL
 M0Yl/+GBaQmgkNVVKW4zOAeIGPmunAw1PxcN7JNe/IuYjXFokrE20nWqqJ/Z6U5FEbgN
 l7xB/oW3TNfYUKY4Hm7OqElgIX+1SsFvAoKW1g7LMCOs9lDHvYrcFjx8vjPwtv+foH94
 ukEsBoTtdY63bM6+lhnru6RQvpqRvXhCenArQcqOw19qhcHWcCiA4elWylVfRpMlapZ5
 EALkLeC08FPTkvCqaISupUoJWY+ogZdHmj3bLkugArj9cZod/VVxM9SmcT6gtH0biNiw
 85wA==
X-Forwarded-Encrypted: i=1;
 AL+hErHe5qJSdHUCSOVooPjvRSPZFVZeaaG4lMC1fX7Aoll1Rc9IHykS4PZmA0nTE/40PjUNWK+FtojxNQ==@nongnu.org
X-Gm-Message-State: APuU4Z+rF2BQj07pcCpufPKWpnhJSQH36orOCAnGYwFfQtI5Sdh/Xtbq
 wlByw3Qlw4SpIV/Bq2LR8+l8X3ZTUnl9JUZDM9PdSGc2IgkBJwU02WIo2eRYTl6fUTbuaNoW8TX
 IixPnQEdNJLpkH4uUx9OeZdV6RNLgItGNkjIkT0ash06CeuLEtdlNmvI=
X-Gm-Gg: AYBFou1Qx6GPyykaDO87JMMlicStHPPFJx2VSmVjfUCPYyaMThui8GD9R0ysYALX+3/
 bNMMMZkEDwxHYxaP8mqWt7frZXMwhMkxFlwILqHTnfxBEdDeBUfxV2+PH38YL7ACMaonmVOUGxZ
 TAcyZ5VIslctU5St7MMfcJEe1OYxqMqQeOvbiACXsPMGFpWTb63N3v8o6d2Pfhel0NFjq3q9aiS
 n+CwP55Fx3nyYdsDq3nS9bRG8BgApIH1LX2JivGaNlTpXh/NVgWhM2AQfLqvWkojZOjCcsnnkeG
 2of+/PFjU3BAV/Ce++3yelQCvRmh1TXlIpKMf+AnUOYmGbsXDRHc5qqjA3A9yyMYjGQ49HClONf
 iDnPaMhmU+ji1VULaL4PFvWST31VkMY+4qpcfS/DLgzO6A3Y8nfKxNcGdOZgIspjWIl14ce9js/
 5NJZn8/1jk7qKDNA==
X-Received: by 2002:a05:6122:4d0e:b0:5ea:cc3c:9449 with SMTP id
 71dfb90a1353d-5ee1c48ac3amr2756840e0c.19.1794492235855; 
 Thu, 12 Nov 2026 06:03:55 -0800 (PST)
X-Received: by 2002:a05:6122:4d0e:b0:5ea:cc3c:9449 with SMTP id
 71dfb90a1353d-5ee1c48ac3amr2756755e0c.19.1794492235258; 
 Thu, 12 Nov 2026 06:03:55 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c9b1sm15501498f8f.6.2026.11.12.06.03.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:03:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH-for-12.0 1/8] tests/tcg/aarch64_be: Check data byte order in
 hello
Date: Thu, 12 Nov 2026 15:03:36 +0100
Message-ID: <20261112140343.61634-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112140343.61634-1-philmd@oss.qualcomm.com>
References: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uFa2b5mv09xypYEpOkGQ6vhBt8ckmkFv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX3hvmqxANN8yQ
 3SbxZtAGUb1CIHvZMBxrjKh4LRyPKJZRRIwXwx7o1wKa4e0WUie9lo4eFNzse7bluQksOGm3mx0
 LBRstfhPG/Y2V8OzMX+Sf+0b88jpgG0=
X-Proofpoint-ORIG-GUID: uFa2b5mv09xypYEpOkGQ6vhBt8ckmkFv
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5c74d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=apfC6Sr15dbh0XQO5jUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX0oVtpheAyaPq
 88fYbAUXWVByZOfdAooHaV6aETFOtwce375qOBDF57Zo1b/7j15VQXmcGLyetYatv73OldylDl5
 M+pIj5sFL1oP9pUXvInlHzSKKLxt0pi+rT0hsMQUhJwsSuUJMCoHnzlYGYd/lOsMOiUMX8l3X43
 DYKNEo8Uo3FLKQSKBUS3ZWvy7AYoce+fI9p458xbhEEkHpoYxRqPWK+aLLRzclOuL5ko1atMSiE
 9Gecr6lRD2o8i09FlA4TcKt8BXyDSR68v0mr7jDD/uILQod8+VUENON1oFa2lWOnrQMHqcJJf3v
 9pJbqI4ZPhazVr1qN9gYxun1tAkobsFNYLJZFasClyoSErv2ioXaJ0YU/ur1/1tllJiULdPZ/tt
 1lCEPGKCP8vEhPdwYRkFzQrH+xn5SXV8qvfwfCUkAlDm4g6O/JaE3xlts/OgXppi8LAqshDXytg
 or8q03YclswHNnQWbKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120055
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
and fail unless the syscall writes exactly twelve bytes.
This detects incorrect CPU data byte order rather than merely
accepting the ELF header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tests/tcg/aarch64_be/hello.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/aarch64_be/hello.c b/tests/tcg/aarch64_be/hello.c
index a9b2ab45de9b..4816635d1704 100644
--- a/tests/tcg/aarch64_be/hello.c
+++ b/tests/tcg/aarch64_be/hello.c
@@ -14,9 +14,10 @@ int write(int fd, char *buf, int len)
     register int x2 __asm__("x2") = len;
     register int x8 __asm__("x8") = __NR_write;
 
-    asm volatile("svc #0" : : "r"(x0), "r"(x1), "r"(x2), "r"(x8));
+    asm volatile("svc #0" : "+r"(x0) : "r"(x1), "r"(x2), "r"(x8)
+                 : "memory");
 
-    return len;
+    return x0;
 }
 
 void exit(int ret)
@@ -30,6 +31,8 @@ void exit(int ret)
 
 void _start(void)
 {
-    write(1, "Hello World\n", 12);
-    exit(0);
+    /* Force a data load to check CPU data byte order. */
+    static volatile int len = 12;
+
+    exit(write(1, "Hello World\n", len) != 12);
 }
-- 
2.55.0


