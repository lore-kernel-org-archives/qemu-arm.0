Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0110DC87FC5
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 21:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udxw8-00026N-9n; Mon, 21 Jul 2025 17:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1udxvW-0001aA-KR
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 17:20:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1udxvT-0002lJ-BA
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 17:20:01 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIfxxD008178
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 21:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=4nwohGI0bwQaJgiNcSl4LKBBMspKPtG3MPh
 cY/MxFzY=; b=GlgnLpCbZtbpynYgpc5fQcGFo8lFOBwkgVpR9+gt5mGs7HCedHK
 2/JQ94xdJd0rBuOuRLEZPxNPhulR2CTdyMOfZ7ZmDbuy6Og/vUbsONiinz1C8m2K
 Dcx0JooMPIuJ5BHR051/ui6P8IggUHjL9z08TweAo/+a8amF0Gnsjdepq0i0Ug/v
 p6vaLDSa1r7zndjCgieTjXtDezJUE6i0eyPYon8pGZRiXsdV/SNhUMcUg+W8ZBI2
 PoWiDdcdDLDvd4WRzMpxVZq4DQHfIcrLX4oGxkdToiDffKkd5TpsViHgKpSgXgui
 +uhtKebb1RLI1ZNW+CKqqRmu/433OdQ/Ikw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vwhw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 21:19:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74913385dd8so6678957b3a.0
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 14:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753132795; x=1753737595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4nwohGI0bwQaJgiNcSl4LKBBMspKPtG3MPhcY/MxFzY=;
 b=dE+R3xNPJIiQPC9nyT6tPUBr1TPZmvHh5QpXvz+EBr5e3ucD5dDJGe3yiqQv6WOXME
 nv+kTqSS1pw96irp7DCCmCW5IhmV4u2swdu/R7ZN+hCe1iWRcj0K0nybGaI6qxOiEdzq
 UbB7hoaTN3cdReGB0iPCvQ+IYc5koFnwH1dm+sXmjoBvDPSoqnA1nY52f5PKc/KIjrLg
 ipL+0wz1QvpdaeTQXp1tXfj8oJbsCi3mOlLGLnJ8gDeD7zUZH1y1FVICCeCl0L+CeLyU
 Oh6mbXgcMpt4V+gXwcIX+M2A1nPlk9PvCbxLxS8haHISOUGqVSd2BmQc/rOGd1n+NQ5+
 Sk/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV94EcMcvsIVDhrv8/ux0fG+fX0TddqxUEsoQCXCgsbA8W3O1qZ4Ve/BqiTFKyHupAfMJP4x5rNLQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1DKym80tViCWj1m1EwKe1JQuWfympyndheSL9fHtMdgtzIQ+r
 Wko9mAkityNrcItRvq0322ZjrwixEAzzNbJZmmc5felP6P0QffHVevflUEvHlDEzVAq2JJhIIKF
 U1t4K6ypJA4MYv9i+VDJo5EqE0NI621Nhv4KtJYKl23lvPqJQX3bCbfFeUK2EJ+LFjQ==
X-Gm-Gg: ASbGncshcao9T/Ou57TxWgs/3SzWVNoY0UdInfJFU1fsoXi/iKq+EfFqvmxhuz8zQmc
 kYTBlOCPVdtEccD6r2SZXUVMZ/RtrxPbh3tHgoKkvu2++/W26KUkMTiCzQ/TjpaZ1zCvS/6oPTm
 kGOk7oqBHV6Ud4k55va4i5lyNax2+/sR2hGCqSymwPQVxww8GmSvUzHeEyQxzdQJKmWnukltE0f
 WkKDDdCOrRzCWB3Si9rJ/8OgLFpMZIXagGUkX953THrcswNkZoDCR6B9+22E/rNuxikjOiXcGlI
 g6+uAY/yhMxDI+qKmIhg/jKY5LA+ksyu8WbYMMTXI75+z8MSqaSc9xXiBmvWBoOtH5tzuVA6tKp
 CydPjl55RdLXolDI=
X-Received: by 2002:a05:6a00:3c88:b0:74b:f639:33a6 with SMTP id
 d2e1a72fcca58-75722773326mr30197160b3a.2.1753132794925; 
 Mon, 21 Jul 2025 14:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbOdC9wSdvoGalNiiSUH0TfzJLawUb9SXFfhmINt8Arm2oMckTBCU6ZFNfKeUoVe421Y3Hdg==
X-Received: by 2002:a05:6a00:3c88:b0:74b:f639:33a6 with SMTP id
 d2e1a72fcca58-75722773326mr30197139b3a.2.1753132794407; 
 Mon, 21 Jul 2025 14:19:54 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc680absm6338808b3a.144.2025.07.21.14.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 14:19:53 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: vacha.bhavsar@oss.qualcomm.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix big-endian handling for NEON and SVE gdb
 remote debugging
Date: Mon, 21 Jul 2025 21:19:50 +0000
Message-Id: <20250721211952.2239714-1-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687eaefc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=u4tEpLqHghJ1O5z5lBIA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 3xxBTzMeQDs88nbPYqOLXaM4Gu0_0-4o
X-Proofpoint-ORIG-GUID: 3xxBTzMeQDs88nbPYqOLXaM4Gu0_0-4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MCBTYWx0ZWRfX1GrYNd6/7lLM
 PwtbiB3TDapz95ACHzIbwdoXI+s328R5okLe9D7yY6mdyRpAL2fCkvOzx8+/htNauD01YokvHlC
 e/EtO2PGP4dHSBxwj+NGa2QuRHGs9gJl2+OYxUotA0ISVPbjkqxKlMdyw2IdP9Vt//nyMzlAKkT
 7cOpTep1QzIWQAQ+7P7OYyhG1qdkIHzKuwj+9VkjpyfGspls3XLxbkFCOM9a14o44O3LoEwdu/9
 XHwUYWzngnOAmoJpdI+28tXMraSrFcfCZOiwZVJCaYMdaw1MPc5bIQgfLXfoXWjiryByVlS401+
 CpgCVmQgugboyPf/ZbQmD4XaVdZHJuDwsnwP+oZK1Eu1cJ8Eyl10Fp1CbFEEbJmupcEA1lOnuBv
 yahOZxtql4a/DXjbwOVmBGjSmggsagJBfwBoN5muhNeu4ygfd/l8pCNAMALMtGzelWPhYVYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=715 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210190
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Upon examining the current implementation for getting/setting SIMD
and SVE registers via remote GDB, there is a concern about mixed
endian support. This patch series aims to address this concern and
allow getting and setting the values of NEON and SVE registers via
remote GDB regardless of the target endianness.

Consider the following snippet from a GDB session in which a SIMD
register's value is set via remote GDB where the QEMU host is little
endian and the target is big endian:

(gdb) p/x $v0
$1 = {d = {f = {0x0, 0x0}, u = {0x0, 0x0}, s = {0x0, 0x0}}, s = {f =
{0x0, 0x0, 0x0, 0x0}, u = {0x0, 0x0, 0x0, 0x0}, s = {0x0, 0x0,
0x0, 0x0}}, h = {bf = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
0x0}, f = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, u = {
         0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, s = {0x0, 0x0, 0x0,
0x0, 0x0, 0x0, 0x0, 0x0}}, b = {u = {0x0 <repeats 16 times>},
s = {0x0 <repeats 16 times>}}, q = {u = {0x0}, s = {0x0}}}
(gdb) set $v0.d.u[0] = 0x010203
(gdb) p/x $v0
$2 = {d = {f = {0x302010000000000, 0x0}, u = {0x302010000000000, 0x0},
s = {0x302010000000000, 0x0}}, s = {f = {0x3020100, 0x0, 0x0,
0x0}, u = {0x3020100, 0x0, 0x0, 0x0}, s = {0x3020100, 0x0, 0x0,
0x0}}, h = {bf = {0x302, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0},
f = {0x302, 0x100, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, u = {0x302,
0x100, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, s = {0x302, 0x100, 0x0,
0x0, 0x0, 0x0, 0x0, 0x0}}, b = {u = {0x3, 0x2, 0x1, 0x0
<repeats 13 times>}, s = {0x3, 0x2, 0x1, 0x0 <repeats 13 times>}},
q = {u = {0x3020100000000000000000000000000}, s = {
      0x3020100000000000000000000000000}}}

The above snippet exemplifies an issue with how the SIMD register value
is set when the target endianness differs from the host endianness. A
similar issue is evident when setting SVE registers, as is shown by the
snippet below where the QEMU host is little endian and the target is big
endian:

(gdb) p/x $z0
$1 = {q = {u = {0x0 <repeats 16 times>}, s = {0x0 <repeats 16 times>}},
d = {f = {0x0 <repeats 32 times>}, u = {0x0 <repeats 32 times>},
s = {0x0 <repeats 32 times>}}, s = {f = {0x0 <repeats 64 times>},
u = {0x0 <repeats 64 times>}, s = {0x0 <repeats 64 times>}},
h = {f = {0x0 <repeats 128 times>}, u = {0x0 <repeats 128 times>},
s = {0x0 <repeats 128 times>}}, b = {u = {0x0 <repeats 256 times>},
s = {0x0 <repeats 256 times>}}}
(gdb) set $z0.q.u[0] = 0x010203
(gdb) p/x $z0
$2 = {q = {u = {0x302010000000000, 0x0 <repeats 15 times>}, s =
{0x302010000000000, 0x0 <repeats 15 times>}}, d = {f = {0x0,
0x302010000000000, 0x0 <repeats 30 times>}, u = {0x0, 0x302010000000000,
0x0 <repeats 30 times>}, s = {0x0, 0x302010000000000,
0x0 <repeats 30 times>}}, s = {f = {0x0, 0x0, 0x3020100, 0x0
<repeats 61 times>}, u = {0x0, 0x0, 0x3020100, 0x0 <repeats 61 times>},
s = {0x0, 0x0, 0x3020100, 0x0 <repeats 61 times>}}, h = {f = {0x0, 0x0,
0x0, 0x0, 0x302, 0x100, 0x0 <repeats 122 times>}, u = {0x0, 0x0, 0x0,
      0x0, 0x302, 0x100, 0x0 <repeats 122 times>}, s = {0x0, 0x0, 0x0, 0x0,
0x302, 0x100, 0x0 <repeats 122 times>}}, b = {u = {0x0, 0x0, 0x0, 0x0,
0x0, 0x0, 0x0, 0x0, 0x3, 0x2, 0x1, 0x0 <repeats 245 times>}, s = {0x0,
0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3, 0x2, 0x1, 0x0 <repeats 245 times>
}}}

Note, in the case of SVE, this issue is also present when the host
and target are both little endian. Consider the GDB remote session snippet below
showcasing this:

(gdb) p/x $z0
$6 = {q = {u = {0x0 <repeats 16 times>}, s = {0x0 <repeats 16 times>}}, d =
{f = {0x0 <repeats 32 times>}, u = {0x0 <repeats 32 times>}, s = {
      0x0 <repeats 32 times>}}, s = {f = {0x0 <repeats 64 times>}, u = {
      0x0 <repeats 64 times>}, s = {0x0 <repeats 64 times>}}, h = {f = {
      0x0 <repeats 128 times>}, u = {0x0 <repeats 128 times>}, s = {
      0x0 <repeats 128 times>}}, b = {u = {0x0 <repeats 256 times>}, s = {
      0x0 <repeats 256 times>}}}
(gdb) set $z0.q.u[0] = 0x010203
(gdb) p/x $z0
$7 = {q = {u = {0x102030000000000000000, 0x0 <repeats 15 times>}, s = {
      0x102030000000000000000, 0x0 <repeats 15 times>}}, d = {f = {0x0,
0x10203,
      0x0 <repeats 30 times>}, u = {0x0, 0x10203, 0x0 <repeats 30 times>},
s = {0x0,
      0x10203, 0x0 <repeats 30 times>}}, s = {f = {0x0, 0x0, 0x10203,
      0x0 <repeats 61 times>}, u = {0x0, 0x0, 0x10203, 0x0
<repeats 61 times>}, s = {0x0, 0x0, 0x10203, 0x0 <repeats 61 times>}},
h = {f = {0x0, 0x0, 0x0, 0x0, 0x203, 0x1, 0x0 <repeats 122 times>},
u = {0x0, 0x0, 0x0, 0x0, 0x203, 0x1, 0x0 <repeats 122 times>},
s = {0x0, 0x0, 0x0, 0x0, 0x203, 0x1, 0x0 <repeats 122 times>}},
b = {u = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3, 0x2, 0x1,
0x0 <repeats 245 times>}, s = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
0x3, 0x2, 0x1, 0x0 <repeats 245 times>}}}

In all scenarios, the value returning on getting the register after setting it
to 0x010203 is not preserved in appropriate byte order and hence does not
print 0x010203 as expected.

The current implementation for the SIMD functionality for getting and setting
registers via the gdbstub is implemented as follows:

aarch64_gdb_set_fpu_reg:
<omitted code>
uint64_t *q = aa64_vfp_qreg(env, reg);
q[0] = ldq_le_p(buf);
q[1] = ldq_le_p(buf + 8);
return 16;
<omitted code>

The following code is a suggested fix for the current implementation that
should allow for mixed endian support for getting/setting SIMD registers
via the remote GDB protocol.

aarch64_gdb_set_fpu_reg:
<omitted code>
// case 0...31
uint64_t *q = aa64_vfp_qreg(env, reg);
if (target_big_endian()){
	q[1] = ldq_p(buf);
        q[0] = ldq_p(buf + 8);
}
else{
	q[0] = ldq_p(buf);
        q[1] = ldq_p(buf + 8);
}
return 16;
<omitted code>

This use of ldq_p rather than ldq_le_p (which the current implementation
uses) to load bytes into host endian struct is inspired by the current
implementation for getting/setting general purpose registers via remote
GDB (which works appropriately regardless of target endianness), as well
as the current implementation for getting/setting gprs via GDB with ppc
as a target (refer to ppc_cpu_gdb_write_register() for example). Note the
the order of setting q[0] and q[1] is suggested to be swapped for big
endian targets to ensure that q[1] always holds the most significant half
and q[0] always holds the least significant half (refer to the comment
in target/arm/cpu.h, line 155).

For SVE, the current implementation is as follows for the zregs:

aarch64_gdb_set_sve_reg:
<omitted code>
// case 0...31
int vq, len = 0;
uint64_t *p = (uint64_t *) buf;
for (vq = 0; vq < cpu->sve_max_vq; vq++) {
env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
        env->vfp.zregs[reg].d[vq * 2] = *p++;
        len += 16;
}
return len;

The suggestion here is similar to the one above for SIMD, that ldq_p
should be used rather than simple pointer dereferencing. This suggestion
aims to allow the QEMU gdbstub to support getting/setting register values
correctly regardless of the target endianness. This suggestion aims to
yield results such as the following from a remote GDB session, regardless
of target endianness:

(gdb) p/x $z0
$1 = {q = {u = {0x0 <repeats 16 times>}, s = {0x0 <repeats 16 times>}},
d = {f = {0x0 <repeats 32 times>}, u = {0x0 <repeats 32 times>},
s = {0x0 <repeats 32 times>}}, s = {f = {0x0 <repeats 64 times>},
u = {0x0 <repeats 64 times>}, s = {0x0 <repeats 64 times>}}, h = {f = {
      0x0 <repeats 128 times>}, u = {0x0 <repeats 128 times>}, s = {
      0x0 <repeats 128 times>}}, b = {u = {0x0 <repeats 256 times>}, s = {
      0x0 <repeats 256 times>}}}
(gdb) set $z0.q.u[0] = 0x010203
(gdb) p/x $z0
$2 = {q = {u = {0x10203, 0x0 <repeats 15 times>}, s = {0x10203,
      0x0 <repeats 15 times>}}, d = {f = {0x10203, 0x0
<repeats 31 times>},u = {0x10203, 0x0 <repeats 31 times>},
s = {0x10203, 0x0 <repeats 31 times>}}, s = {f = {0x10203,
0x0 <repeats 63 times>}, u = {0x10203, 0x0 <repeats 63 times>},
s = {0x10203, 0x0 <repeats 63 times>}}, h = {f = {0x203, 0x1,
0x0 <repeats 126 times>}, u = {0x203, 0x1, 0x0 <repeats 126 times>},
s = {0x203, 0x1, 0x0 <repeats 126 times>}}, b = {u = {0x3, 0x2, 0x1,
0x0 <repeats 253 times>}, s = {0x3, 0x2, 0x1, 0x0 <repeats 253 times>}}}

The first patch will implement this change for NEON registers,
and the second patch will do so for SVE registers.

Vacha Bhavsar (2):
  This patch adds big endian support for NEON GDB remote debugging. It
    replaces the use of ldq_le_p() with the use of ldq_p() as explained
    in the first part of this patch series. Additionally, the order in
    which the buffer content is loaded into the CPU struct is switched
    depending on target endianness to ensure the most significant bits
    are always in second element.
  This patch adds big endian support for SVE GDB remote debugging. It
    replaces the use of pointer dereferencing with the use of ldq_p() as
    explained in the first part of this patch series. Additionally, the
    order in which the buffer content is loaded into the CPU struct is
    switched depending on target endianness to ensure the most
    significant bits are always in second element.

 target/arm/gdbstub64.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

-- 
2.34.1


