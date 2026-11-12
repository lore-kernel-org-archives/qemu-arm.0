Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28460A3803
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRlEJmlV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSBa55d7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVRm-00085u-Gl; Thu, 12 Nov 2026 09:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPq-0006i9-EN
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:39 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPo-0007VL-MO
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:38 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC9EWnK4092470
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tvPgX6zbt550DX3PMKCkJzPcSsfzMzrq0LIQQnTkVFE=; b=DRlEJmlVJWeoAEAY
 YIXXMpeTS2nklJs9zqz1ZbfxwQ05JsisA0jptsa+lbL1ux5tv0iMLPhcBvf0G/eY
 O+e5OyYd2TYwJP4Z9pXr0KH+EJusNQGbzXlb536RlQbXKzD9xa2JdiiyyYz/SqJB
 JM4QxWo3lSsWOSGGr66VzYpHMeIh0HBFjBF2EDo0Y8HC3VqYdjAQU6WOpfEy+65E
 gcIAnKSK8iiTKQful3qfQ4cwUGioWC7C575HzX/PRyKyoa5C2leWY2K0GSM0ZuYq
 G4KmqMk035k8OtVlNg6LfkJE91sDF+kBGN7IM+f6Ea6ZDrqy9UGyy1aWJsJFqKmy
 M6VyIQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k4s2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-9907539aff7so2925256241.2
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492273; x=1795097073; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tvPgX6zbt550DX3PMKCkJzPcSsfzMzrq0LIQQnTkVFE=;
 b=CSBa55d7PxQI4rQX1d/94uDuFnIun1O+2O4HhFJ+mnoN3nBonrBfYolLLEdF3b+oLF
 9N7j0NbZIOlqPGCDCVYccmo5RUuQZsUTEVDAquGy1qzDnHsyK6wcBDngvsVf0Fz+QU4D
 e4zC/NMVe+CypwPTVNdYxqPYMj5t5oKVJMV/BclOiZF0SyH73YbNOl7Bzd5+v5uMz+Xd
 6FKoTqCmxB5HyZJZexI8kVL7VFEx2LXv6FDZERZ8tymIwnqMQFqvKb0Y0uDD8tHtqCjn
 ZO6fEWK8n3+dGQM8xNkUFTMXv7Jmy535xeIUPfOK0iZf+1a0nxcgGZnw09JLUbKwRuVz
 odnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492273; x=1795097073;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tvPgX6zbt550DX3PMKCkJzPcSsfzMzrq0LIQQnTkVFE=;
 b=SrFpmigewj5I5ll5tAIqZgytiePWnopAkbHQddTa+6B/omGHP+ffnJPJttlE2IPOEJ
 mMZYceXHMk/g2IkkScXTZcN6m0Vacnyy1QMH+g9bqwcw5UQ0LrPV8KxdxRPpjZ/CeNQ4
 pRpRMaiBvkaX6hcGXsRJkNLDGXYY5Mh9FXJOHF8TlBkfjG270bWGDkEdy6XbXqeblYKj
 ByxxlhKEIcGk7yGvLJld3x0Dy6iDoxrk+pRzR25iYG3Fq+lqvpBOK1o3ciomoJyi+Qoa
 YNDHlyFbP2pgrDK6pEISOQsXOJ7qQqc211gc7+FTXv9cTyDqs63N7cKWO1u1t4+C/uJp
 7XeQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHe99Y+gUAX8WKrQ4TvNsOarCp/QEunMPU0tRyyjighaF6JePautGzN7IQ6/as8FuTzUt4DkAyuVQ==@nongnu.org
X-Gm-Message-State: APuU4Z9ETvPRa8uv+/y8ddo6/rvjIEn2E0T9QhkuxIX4NBzuDR17zXVJ
 Drc5Y6n2Z71IUm4FfNyrXiBX5uYBkuYiGmxRS0x/UibiapOFXssxPyPqaVrOFyJhvQrmfHd3bYT
 5vkDmCyiDMQLcPlUyZ2PUbjjuRCXqwS2xAwrb2FRSejZkTvY0Hga47iU=
X-Gm-Gg: AYBFou0seKT/mPnmrhE0IiKffuL85T+k3Cp0svcg7CxdwVw2YuDBcfZKWyP8V4FF1eN
 1GtZhS+RVeaA2ZaW26BspwdpSN5i8drzCDiTfybt6nGlsFeTZ3DcdZnZwpcGsU5vgc4nNM3HMAO
 2QOfEsEpo+P1GXrHGCNnH+poCoHXCFYKtERLI/PzuR7w9jmU7jkbxCyVXksI/iE+xOw/vXHoQRS
 OUh6mYRf1citfDYVDj+exrkP4RP04T0HVjCy/hrQL9FLybQD+0vnNjtJrMDbWowzT+Zsbn/SD9N
 WnFiQ7PWPe0ZTsmRkGD+9yIJhs5ZzGwfAxurgHCD+H8kKhK6eYBzDk6OxV3EcliV4wKPsHev+Gm
 hOMEfKiO61zU1HeM3s9LE+cBaL+zCJ/Zd7Wx39y7/CkrnmWui5SgVGr7CrMpTcg0txuYxaJUYNc
 lAUuxzdYLbf0o1xw==
X-Received: by 2002:a05:6122:3c51:b0:5ea:a1ad:6376 with SMTP id
 71dfb90a1353d-5ee1c2b5e30mr2711950e0c.1.1794492273017; 
 Thu, 12 Nov 2026 06:04:33 -0800 (PST)
X-Received: by 2002:a05:6122:3c51:b0:5ea:a1ad:6376 with SMTP id
 71dfb90a1353d-5ee1c2b5e30mr2711913e0c.1.1794492272517; 
 Thu, 12 Nov 2026 06:04:32 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e258e8dsm111259285e9.4.2026.11.12.06.04.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:04:31 -0800 (PST)
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
Subject: [PATCH-for-12.0 6/8] linux-user: Select target byte order from the
 ELF header
Date: Thu, 12 Nov 2026 15:03:41 +0100
Message-ID: <20261112140343.61634-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112140343.61634-1-philmd@oss.qualcomm.com>
References: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX7g/LhIGRUizO
 WtFI80yZXMTQD6xk3fFvEeWR/aK+pF+Lim2CMnNhs11f5MJAGHwPTbSY0nLyvWaCzZn2OtK6fJe
 X+1eJTD4rP2tPY4FqanYISmjFUR5x74=
X-Proofpoint-GUID: dFuAEgHVzu5Xc8_bNQKngx7WOqpEpXMg
X-Proofpoint-ORIG-GUID: dFuAEgHVzu5Xc8_bNQKngx7WOqpEpXMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX8UTfTU3ANADg
 vEvg+h3Bnffgd3ZOFdnG/UWIptFcLUZBYXVgLWoc6L8hBfGCaL66+1kHOV+3I54wEaXW1yjcCNo
 eAF85QaQVroTIxU726l40hBtb84/WmwNf+5wQ36T2BMsNc40yjG1N+dK+8IaBV/I4NRy+JB2iPL
 iKnNIuVdbrj4nTefiuyLYX3Cn4lOKRuqJ9G8wME8YrGzyc59G02C88nKafWk+CWDJd2HxK/o/9/
 VRutv7nWn/qCsKb0iZ6OQrnzm3K2b/ekLiPrD1f2Y/++3jCi3Sh+RfOWey+PqP6nLIrRpueEBEN
 L407Kai7PLvSwzJJTLkQU8D0Ohi300gGQU6U79bHB+jELNxIi9ZJMw0DkFl/39KoY1+7RhpTARO
 5q3rsdYEdpOvrfg8X92UPjQLQIEGDsOVgdqDkY8FPr1qKTJxG2TgItioBStW3arJ6QxpAHP/47+
 BY4A4Ox1DUyudLvQ2ew==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5c772 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kZLfmvQpzMa1BZTGQ20A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Read EI_DATA from the executable descriptor before selecting the CPU and
loading the image. This also covers binfmt open-binary execution and an
explicitly selected CPU model.

Reject invalid ELF byte-order encodings without using the invoked
emulator name to select an ABI.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 linux-user/main.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 2f0c0a50c8a4..71718f974f6b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -22,6 +22,7 @@
 #include "qemu/units.h"
 #include "qemu/accel.h"
 #include "qemu/version.h"
+#include "elf.h"
 #include <sys/syscall.h>
 #include <sys/resource.h>
 #include <sys/shm.h>
@@ -769,6 +770,31 @@ int main(int argc, char **argv, char **envp)
         }
     }
 
+#ifdef TARGET_RUNTIME_ENDIAN
+    {
+        unsigned char ident[EI_NIDENT];
+        ssize_t len = pread(execfd, ident, sizeof(ident), 0);
+
+        if (len < 0) {
+            error_report("Error reading %s: %s", exec_path, strerror(errno));
+            exit(EXIT_FAILURE);
+        }
+        if (len == sizeof(ident) && memcmp(ident, ELFMAG, SELFMAG) == 0) {
+            switch (ident[EI_DATA]) {
+            case ELFDATA2LSB:
+                target_set_big_endian(false);
+                break;
+            case ELFDATA2MSB:
+                target_set_big_endian(true);
+                break;
+            default:
+                error_report("%s: Invalid ELF byte order", exec_path);
+                exit(EXIT_FAILURE);
+            }
+        }
+    }
+#endif
+
     /* Resolve executable file name to full path name */
     /* Keep how we started the program in exec_path, e.g. "./my_program" */
     /* Store real path in real_exec_path, e.g. "/usr/local/bin/my_program" */
-- 
2.55.0


