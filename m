Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E17C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 12:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wm9UH-0003av-AW; Tue, 21 Jul 2026 08:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9U5-0003HB-Pg
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:22:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm9U4-0003wX-7d
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 08:22:05 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LARNaw1349852
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Sg+aRlSfL1je4BTZTcRTkOp9Hr5XLA1t0eyNuOYYM9s=; b=Um1G55YFxtOpIwik
 YxKX58AksiBbWDaHidB6DZZwxRbH94d7NiGo57rLHZf3Y/Gd0KXw4yB2lKM5pz8z
 hjKN4qPsj/d9ppLZ9wATGpgWWu8kSfRnHOZsNdTy3tUqQyoiQ74LLVIy86rHaTd+
 UPEuZwa/Ntez7PqWKZ31JOjxwgpkPHlCbmpAXY8d8edmV1BRLWn3DsaSRy2ffP59
 BIf2njiGZ3swIVXF9dyCUr0L6CKd0sAlhLEUyK39GPssGum+lBCNwnHbQiaAJcHC
 pFp2pGcP0JhtVj7esDuQmWR5SkuEjrSUgkS3zBeQhbAo7tv66RAYfn5BT1hISoFs
 vKjxmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa8ksk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 12:22:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0e702df8so165014051cf.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784636520; x=1785241320; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Sg+aRlSfL1je4BTZTcRTkOp9Hr5XLA1t0eyNuOYYM9s=;
 b=PG2GF+2S61eQMBd36Er1O9FLV0ZBkQjFRok91ekKpMwni8iXVwuf9MvquROAybaqQ5
 dGjCYSQ/qM3yCakFNHSKAqzD5HP9OgwOShUQsTAco4Ll7F/pDJhlv3a28kvQYz7BRiz9
 ZMrsmuFduQ0A+KWmD5AxuvKH2+p5+TQROcjw+Q4cCNw2KjgS2OLSt1V5dAbvDPj2/oF1
 J7t6/rXwMBqT+S1FCT7ooA1ZVmjfBTYHKl9TjuJVzLJP7EyA/DFMzx5vqkNfeBeX+e6A
 53Ce/B1XAvfQ1RE/C6sbAqpRtArshBmGgtpKWDh3uDLnlpS+s+vQqaU2Q4BpRyys112O
 2oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784636520; x=1785241320;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Sg+aRlSfL1je4BTZTcRTkOp9Hr5XLA1t0eyNuOYYM9s=;
 b=ZolLqsOCTkbOuS96qgTbo8bZefT3goMFitQsOsUai0NvCULa6Mkzae2J7XCmNJ1Ixk
 BJ26NaEzEZEohRjbH+MFJSezBAGiIT7OYUNwnmO9CHdhAytIelZhcEthPM9G06aqXAY8
 g9PkcTMky45YhTD/gFW8ubdskuj8c+fETqKhObhDCMvW5oylrXyt8ChvE7yUMG2nzfok
 W1fiNEADc36FvxYvEHXVW1wTpKLABGtPhk6Wzsiz+IFrWzL164kwlufW4xVHq+38xl5A
 TyOJuGzGMQN6ngMLqU5ViLgWW9B7NC1/vlW8ZbkrtOIK8irSxLkbx7RXj/Kwbmqpy1i5
 5azA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqv2aaXMx7PqqpK2Uyo9X+Rua5ihsxGsVzIKyZL6otvKzR58nAPSTd6eMBttKuRGCbm/g7A/BGHgw==@nongnu.org
X-Gm-Message-State: AOJu0YzWjVpYecRcIy8X5SgHVOxaaXAJeJe/sFLq8mwTkg78ZDgIw5pz
 1c0JKvzSku3sszlPJAKN1YKBf7x2DUOmR5DP6ZSgSXBvmZT4G2HRzDgQdkkD7TtpvjJDhKQzQIg
 pwrtgpRSw/yEPKobKhnqObA/NdUF+0+h875RfSgTKXUFLAg+JwSCpgd7USqFt11Q=
X-Gm-Gg: AfdE7cm3nRFAXpcZXKlUc2H2ni80cEIqBKy3j35zhBWJRdVivpMMqeJPIVJYzr/8ook
 6qydSshwSiPetcWTlTdfMmVopmpgI2/7XoJ4O1BrJSzPNVHHFoO+tCLk7HVNkRhk8b9wuhebAG4
 La3BYYh7OdN4C+UOlSC6xU/1jnU/tACH7sng5j7Wxvf5yvXFUrHaQ7sVT7BLGSG5AvzB8ge7z9x
 tZLRZJ39UFnc9CVsmkakWWriF7rTz1V92av1VeoZkdP0dDDrAPvhHgK4phe4Yem1d172Nev8yze
 1oi7nJd2kkboncU2+YRlM7skE+uDrW021douCZxsDcl0QVhiidGGh3t0wbWt8P1zhP10f/cVJvb
 vv8u9rMswnynYKxHBp4EvjGJvGWVUH5IA5ghWiDPzJEB8gEO7Fn6CkJydqw==
X-Received: by 2002:a05:622a:2b07:b0:51c:7b12:5fe6 with SMTP id
 d75a77b69052e-5213f378922mr180367231cf.82.1784636519966; 
 Tue, 21 Jul 2026 05:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2b07:b0:51c:7b12:5fe6 with SMTP id
 d75a77b69052e-5213f378922mr180366871cf.82.1784636519457; 
 Tue, 21 Jul 2026 05:21:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49548e0fcdbsm309001545e9.2.2026.07.21.05.21.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jul 2026 05:21:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 3/4] target/arm: Only compile gicv5-cpuif.c when GICv5 is
 selected
Date: Tue, 21 Jul 2026 14:21:33 +0200
Message-ID: <20260721122135.6288-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721122135.6288-1-philmd@oss.qualcomm.com>
References: <20260721122135.6288-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k2dQ3XVGKCd4nm9VZHcpZ_ASUXkQyYg1
X-Proofpoint-ORIG-GUID: k2dQ3XVGKCd4nm9VZHcpZ_ASUXkQyYg1
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f6468 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EH4q0pLv-eCGfy9bPtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfX1rSiknooxMzX
 zKGu9u4goy/J3GuNLDex42+ZxQ4PboH+AcPrkFgLTHDjO7hj3ODCkfFhtdXYmHCIPNxoHUd0Hu3
 b276czusVIRyBHolsP/LZNXzmjNE9Qet2cFngo0eqnQ0w2lUVD2P792VGocHZhZZXV1b1HO+yvN
 dPMHJIXGCInLFAIX4UP1ohaFqhqMOSjG/lDv+SQbffSi91JfyL8UWke6j4xbdajCEEqhvvTll/N
 1xLqfqLkd//f+q5p08c2CNllZWrSNBU4iid7K26WSJeuZZKApk2ndUfnDmQoVTFRuaVx2MHLPdr
 KAM8IRrjVpklKpDHsaVY6TA7DhLaFoO6k/KaYU4u8BgKN36GHhP8N7DIb//fn8vvyOjloBzUH31
 Z756QK9Wykqs00oT5VD0HXu0BbrNw0sDhWy757NUkszp0LKDHFFoGWpIMLOkjIBx3/4HsgIXnb8
 vRGS3XkLbrCL3HIynqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzMSBTYWx0ZWRfX3wKFzq1fJZM5
 toGr3Ne4OgDt6YYhgNWbs74y634DgGsspCaYPo2AgBNpWhHqlJew9vMD1CNqSWDUTBLt79MwAD1
 z2nfmenAW2dNcefF2t7rtP8yW7J7VmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210131
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Only compile gicv5-cpuif.c when ARM_GICV5 is Kconfig-selected,
otherwise we get when building with --without-default-devices:

  Undefined symbols for architecture arm64:
    "_gicv5_activate", referenced from:
        _gicr_cdia_read in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_deactivate", referenced from:
        _gic_cddi_write in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_get_hppi", referenced from:
        _gic_hppi in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_request_config", referenced from:
        _gic_cdrcfg_write in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_set_enabled", referenced from:
        _gic_cddis_write in target_arm_tcg_gicv5-cpuif.c.o
        _gic_cden_write in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_set_handling", referenced from:
        _gic_cdhm_write in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_set_pending", referenced from:
        _gic_cdpend_write in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_set_priority", referenced from:
        _gic_cdpri_write in target_arm_tcg_gicv5-cpuif.c.o
    "_gicv5_set_target", referenced from:
        _gic_cdaff_write in target_arm_tcg_gicv5-cpuif.c.o

Fixes: ee0f1ce00db ("target/arm: GICv5 cpuif: Initial skeleton and GSB barrier insns")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/tcg/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 573e8b5af48..1cd98c1b857 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -83,11 +83,13 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_common_system_ss.add(files(
   'cpregs-at.c',
   'cpu32-system.c',
-  'gicv5-cpuif.c',
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
 ))
+arm_common_system_ss.add(when: 'CONFIG_ARM_GICV5', if_true: files(
+  'gicv5-cpuif.c',
+))
 arm_user_ss.add(files(
   'tlb_helper.c',
 ))
-- 
2.53.0


