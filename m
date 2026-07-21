Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33195C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 12:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wm9Ts-0002oD-RK; Tue, 21 Jul 2026 08:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9Tj-0002g0-1d
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:21:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9Th-0003tK-6J
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:21:42 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LAQs3O2502670
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qh8fZ9CBD8v2l4WrtQ/Oi0
 YqttXwQqWJQl4rqPTa2z4=; b=IrrGQi0gB/DLCl5R8GqhOJAWNis7U5r2t2YjIT
 Isusv4FlYVcdm185Gfv/OMS9WeriN5LVnlUGBq97PatO7XqqMoZ9aKJWVTef7bHV
 s6et797LhUlDQ5BxC5+DxQec8R7KLMCVJ8b9pVJzrugCHucm6QnB3/kJIkG8PbWE
 Q7KTTOogcq9lxNAuVBIG6w9OvAhTyu+BBIBKJZGrCIRUxXj6tMsAC0aN1z/jXGp1
 Sw5dMDgiyqT7WKFAJPuAEdbiC6N880Y++pjjbYyNlkjsYu4kWNnHbw+T6le0h3J9
 dajwgMOgbvr8+8wZDb5SLnHwAPpXUQgQ6UbwXDnMx6UibYmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsrnhe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:21:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-520a00c7a03so130766141cf.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784636498; x=1785241298; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qh8fZ9CBD8v2l4WrtQ/Oi0YqttXwQqWJQl4rqPTa2z4=;
 b=biuWwgSd8qFY0c1E4gCWrYQhqmRhHK1aWuHFQ43Bpz8U24CQyZtMsK0enB/TxbzX9o
 CRPUVqK24HyMGeDyBQBsi4il+G9pPCuc6eNeQe0R1sj8Zb7JC602qRKDrmacGzUo16+7
 hc+SgbuHN8Mi9GtH8mricP8oQT8DFtz0K9ZfNrC+dKjeHeqGr1AAF/JyzSneGr9lRCgL
 Z9hH4d8I1wkKIU5vEqb76Nvt/0mc5NKVbT/FJXrCGSwFn2yPKQ58VJOm8EIm4ON2HMaJ
 E4ALtp9GlR7QkRL0ip3YuNoi7JA3duh+HQqut/HUmgezIHwPC+ULNY3IAOwEced032AL
 GjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636498; x=1785241298;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qh8fZ9CBD8v2l4WrtQ/Oi0YqttXwQqWJQl4rqPTa2z4=;
 b=hH/nJuv/pcfl0b7v24XHnd0mfQ+tp63DJPmxOqPzCQPBsbNpIU1Ys4omu7Mi07Ztqz
 P3u4t8va/9tI9hK3UB0+HTPEMZkEJxKDQEWHOmivVQntpGTC4gycFzjcOw5DagXoUuUh
 EuGSTgI+eBR3+zQIiQqvVt5ZyLDK9TL17eNN3hZRzQL91f3xwsnLEcFlrOdCnoHi5t5Z
 r3la9XfUaDy8JGs+FDWOpbSROQKrHOm9ua7MCnU6DWK6QFyHwRz7bmc58+yM5qiua6bA
 nwoNjOJXSYbt3rXtA5i/oO6iendsX5Oo6zD+Nv10iNOPsuVjjeopSNqVO9HrYoEdL6Dz
 Qb/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/vSJfiM3WC0qDAMVO6H8/GF4JlvcwUNmpmXHQTk2Msc7ojXGUSY6uvTJJUrwSmQOMQJAM2NQSYQ==@nongnu.org
X-Gm-Message-State: AOJu0Yygbxkc1GMoRtR5eraFnnWnHtip47gn5AUtuuuI5gmyptq9zB/B
 tvlwR9wIMW7mPJBSYQlQA95uw0csxG6PPvZFrrbIOM+mQtu5rG1E/XRPDp9+2M4kEFMsAajkxhi
 kpoLfM//2n3kHTDMkdt1mF4dZi8ouwyArpxoh6bo/PNpOHCJM50iNiTs=
X-Gm-Gg: AfdE7ckT/BPfR35Orxfn3QK2Oiq2twM9YSKerUydShD/qGfu8J41VljpSHOEGFgvxHs
 TMDmaLePMgjMiz8xYEa8Oe5siT00hEs0ncL3ITX8NrfvMIjghf0VUERJ3RbkM/GfN9AgkK60hpS
 FB4ke44fa5c4fz8jm5KPxOgHxk+DYkvbZfbLRcRCMEbdSmu3yoz+tdyW5aQ1r1jh/Wx12fEWtH9
 aGo0zqA8qfmDYBCaGDhhQt3JK72dEhrUTnISbX1z3EYGrXgDQYY7j539Ti6GO8rdH0ysdsvg1ZC
 bVu6O/9CGp9pl9kwkYeeQOVutBqhmRFHnZ2YPOoE3HtL8bEzIBRt1lSJGfXcNjaQF+q6GnCz38t
 KGmAK0CtVWhQOmDKklb00Sir8uS52Y/iZLJzxc57zqM4b6dGqxCQINatANA==
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id
 d75a77b69052e-5213e77d7a2mr177256131cf.53.1784636498214; 
 Tue, 21 Jul 2026 05:21:38 -0700 (PDT)
X-Received: by 2002:ac8:5845:0:b0:51c:c67:2042 with SMTP id
 d75a77b69052e-5213e77d7a2mr177255801cf.53.1784636497636; 
 Tue, 21 Jul 2026 05:21:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edda9bsm38945471f8f.31.2026.07.21.05.21.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jul 2026 05:21:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 0/4] target/arm: Build fixes related to GICv3/v5 and hw
 accelerators
Date: Tue, 21 Jul 2026 14:21:30 +0200
Message-ID: <20260721122135.6288-1-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JnE13Kx_ouB10KhKFN7N8UTYzUfB0ejO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfX3yyy8cAwasr/
 +UYR1SCfojLauAoAAmpvLAfmrKbB2FEkHTeg8rpVLjFpMWlDU6auAaCLLIR7z/Oxu/CJ7D2bLzh
 5443LzUu2hOssDbbmqiIgvagyQ9Fpe4=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f6453 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=BrRY6Dt3WihMGghTFtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: JnE13Kx_ouB10KhKFN7N8UTYzUfB0ejO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfX93II9QqPa+vq
 X2syJBxezH6vFP+X/UdPtEz7+8TfWW6FAPw26PeGp7Hi6fDOTbbxyxh6t5jHcdSeV3aRd9FtPpz
 oNyLdsgjaIAsb/azIbj/5ZfocfobD2/h1ju5afa5M+tG/TLE6IM2ZDPzwOBWhn9Hc+D4365FmQE
 n/QKAC33BOK2x6WvpOsHEEL7VDOjyz6RaTNf8No6L0qOminuaZC8bQIg7wrxtCnz6qNVOcH8E44
 wxYTQWC/AEljwtM87OBkyjMRAc+yb+XhkapYmWuGd00nxoJ8rn/0x4QGkmcfbsRKm/7+4N154VX
 4XRB4ES6nJSeTNLcZyFSKQ6abIeZEIJ+KH3kYKGLXsKuLp0dzo2U4jdU6hsD3pphJ47XnDq086p
 IPqKtUHjrYg7j4puF4rgOtlOm9lGBFIwbcOM26DP1TVESiEevkHTZHbf0kRa5X1xe93EosOuy1b
 FbMO9p5RgFu33FAW+WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210131
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

Build fixes for when QEMU is configured using --disable-tcg
or --without-default-devices. First 3 patches might be
candidate for the next release, but still these configs are
not covered on our CI, I can't complain.

Philippe Mathieu-Daudé (4):
  hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX
  target/arm: Add stub for define_gicv5_cpuif_regs()
  target/arm: Only compile gicv5-cpuif.c when GICv5 is selected
  target/arm: Build TCG stubs as stub library

 target/arm/gicv5-stubs.c   | 17 +++++++++++++++++
 target/arm/tcg-stubs.c     |  4 ----
 hw/intc/meson.build        |  4 ++--
 target/arm/meson.build     |  6 +++---
 target/arm/tcg/meson.build |  4 +++-
 5 files changed, 25 insertions(+), 10 deletions(-)
 create mode 100644 target/arm/gicv5-stubs.c

-- 
2.53.0


