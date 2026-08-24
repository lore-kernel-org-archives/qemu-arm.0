Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091E4C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyShi-0003Gm-5b; Mon, 24 Aug 2026 07:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShP-0002s1-GM
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:18:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShL-0005II-2h
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:18:41 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99MVu2083195
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=; b=T7IFdJBRS1/KpH2e
 O2dDJn4RX9gfoPCyhzvXpt5hZ3uZtGqCLAk1DZ1RikEcDJUAmScGBOL3d7iBr/aO
 AQFbH8zGmByAyQj1M2260FEB4EWnXuBdHPEH4FJ8zAABCsxYy2vbVpgzMpsInO+y
 i3xzNk+w9Pli+gFavgHJ6MDmH47focZ65JqsfR3yB+TEEI5SvpzbX4jynOHZUN+y
 SFStPy5EgyKoLzdbfpGFQR9RCtS7xcoW8ZGWwlkePigkGiLaJWoBCZKyz3cxbKNy
 A6Ek8gt/B4kXe9LqjgZdVDUc2n+9Tfl2znF9a55DyTsKAOChkOk6U05QEsV/X2qr
 o5kNow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbth0b2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:18:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5174a23afcbso47802811cf.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570306; x=1788175106; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=VYspmXYHjN/HbB5IUiHEeg5S5WrBtYxr3/j/mlIBhsvOkyEepbZE44kIUJc5KhIErS
 5mDi0kSbLzY1cWLJdQZ2EMBTlZ3zGJXMI25LwiRWWjx/mj5GqvtneC9XkgUxuVWI6QBb
 D0FGs4Zwu2WdPJZTsZgFBNIO53W/hTlzp1PDhY92Cq9DpDmIH5f1+b6LJTcWsDpfRACL
 EEwbf9lA4lNLtS9D1f7JPYGCjaEbuCzIBSn2DsU68Mxqe/0qveae8cmNV9Nvs6N8mDZ6
 T9XkVmsg0Ze3NJLmWLki4eHpnykZouzKb0ldgzcJjdTQ2gefRJ+rT8+jCEavz5a1HhYD
 6x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570306; x=1788175106;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=hL6Kkvc3mQkRDepQ96DR1QC5snKGbR4Gy1240K/+6yGtZdYNKDI5ejcyl211/Az8iH
 ayoC2TygPAf8x75bot0Ht2dn+H5pu7Rj52z/SO/q3ZFH7sJKCQneIcUQd+gmvp0+4K+e
 i9M8YawUVRgTlgnciOrhTKYRFr1SFzV1XcqZTsQLjxuOEK+fDX85vo7uP5xy8jClCDi3
 TpYeD6uzFqEbZABYgvEtbsr+pOj/MncEMc6pAOofDXGpxQsuQdBHQbjFIOWFJujSu0Kz
 gw4ibB9xOoMAFabqweVPiQ7FHXFF9l4LafKzSpYXOXaTUQA3qtyABBNE7DRG9DU2Q9oV
 /HtQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp9pAlavfMO8FLhETSGfigSbrvNIpYuBB5R6uoIfkay9LJcidLux7P8qqGogkm/7VUwrOIRNF/6fw==@nongnu.org
X-Gm-Message-State: AFuF++mic9JkpTH6ALVXD3KChZ7KwqflTqkRWwo1oDt7917Oj7JfU3r8
 wH82nhsP7H7KzOErp0DYJyQ1DHCiN2h3FtRSGr8KMe6cbglV015SGM2+235fIjOXBD2Id7bHggO
 Pn6EvZ2EqsNTjkI+oHJIt/STvQuRlMmP5g8yELsAbGDr74XZUTQdgYls=
X-Gm-Gg: AR+sD13KsJsCgqlvnI+BGVXaC477ZUJEMYsnqDE/dsPYKDfa0qDv8a1f/hEdcXI2RoW
 smKEffwVFyAWiufRTWUPHzumjW01yyqnJrTWF2SBjZqASXeDfJNYBO7uOFvifDLzfxfI9+xH/Ju
 ND+zAcD876T92G4SrHD28BU6OEcwV00/VxtKNHM3ALYXCUDwSJqdaqcBM0/CtWpnDroMUoLaZIB
 TzJXoIhxM4pFT5swknEno6EpkBme1QtlJcivOnGJGpnhL/mudcUDse0kVEhhIDzrCn1kSHjHKea
 erb55RwhvgedKTLGjN+olXowVQFctnpF2lZJZ7+rOozUN943Kjk4xB9CwQcaKJpXvGlIRoA2BmZ
 RBzdHxikXBxO02As2gd+DufxYYNhh1jq11w2CvTwUXzUxFhd86w==
X-Received: by 2002:a05:622a:1b8c:b0:52c:dffc:4645 with SMTP id
 d75a77b69052e-52df56ef07cmr245489291cf.7.1787570306574; 
 Mon, 24 Aug 2026 04:18:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:52c:dffc:4645 with SMTP id
 d75a77b69052e-52df56ef07cmr245488731cf.7.1787570306041; 
 Mon, 24 Aug 2026 04:18:26 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496296b8bsm1120955966b.16.2026.08.24.04.18.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:18:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v4 07/20] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Mon, 24 Aug 2026 13:16:56 +0200
Message-ID: <20260824111711.26297-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX5DWwadLI0FX7
 Yh+tel7fsMss2/mYRiqp1CZFjwnuGQ3yy2XaHNdCF6L7mDkKavGePEzl6F2X9LiV+gKVbtV44Ij
 JLFzyxDLnvs+SSKcDGKEKLz7490tu8efmPUHOEyDk/+lBa3zcPER89H2NeerEH4D3bg946sdZJL
 jD6iG8foWlikkvc1C7Y4PncEDTIIdxc4+UipactkZx706ymJrJMWpYEaSPw4OCOiz+ooqXNScVs
 vTRVJY6gSUnC4ay+jHAMGoMjpwNhaLfDZDHoY39O67lSVmp3lJ5J3gZhD73EBZhFPT3jyYr6b3Y
 5QDOZ1hhxBG4CYKn5jLOgndxDY27W/xILWsB6rbsPXL2l4f9jT/BH61MhCVVn7jSOW+pM7kuMvZ
 QVZN+ABHKdxhxyWAd/qhu2OHvUqSO0fS5428rensOIhi1cWWNajDsOjvfcHlstnxXLX7lpH4Z5L
 FzqEOwcHJJ8XAA8sHMw==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c2883 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX75fAiC1ECQ0h
 grIoQzzzxZVUHfqZADQFNtqqznzJ+bQm2bqX26e362OjrergCyhL45P0GhC2uu8oBOxjbUs1iIq
 vBM0GSM17Kybv6chhCQybOISg61rKIA=
X-Proofpoint-GUID: YAVCqYrLRzpT6d6M8iVIvQs4aoqQ0MV-
X-Proofpoint-ORIG-GUID: YAVCqYrLRzpT6d6M8iVIvQs4aoqQ0MV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/avr/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a818db753b2..1e4e839bd83 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -183,7 +183,7 @@ int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
 vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
-static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
+static inline int avr_feature(const CPUAVRState *env, AVRFeature feature)
 {
     return (env->features & (1U << feature)) != 0;
 }
@@ -204,12 +204,12 @@ enum {
     TB_FLAGS_SKIP = 2,
 };
 
-static inline int cpu_interrupts_enabled(CPUAVRState *env)
+static inline int cpu_interrupts_enabled(const CPUAVRState *env)
 {
     return env->sregI != 0;
 }
 
-static inline uint8_t cpu_get_sreg(CPUAVRState *env)
+static inline uint8_t cpu_get_sreg(const CPUAVRState *env)
 {
     return (env->sregC) << 0
          | (env->sregZ) << 1
-- 
2.53.0


