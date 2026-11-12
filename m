Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A37606A8AF
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o99/An1G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ejSdcu0v
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRVS0-0008L2-5s; Thu, 12 Nov 2026 09:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPy-0006mW-GX
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:46 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRVPv-0007Wh-6U
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 09:04:45 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC90vAA2514210
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Szxmyh6AHSFS/1ZMahHiUVQVJ6UFuz/SaFCJMKqS+LM=; b=o99/An1GsIl8P5xS
 7nJtTcSno6AdLHGZgJxS4Clw6g5QnQMrS7xVXre9VBq8krA6OV6Is1sRxeNclI1K
 NNVfGORJ394c0pai3kZsewFUEYfj6eWcXcNhoJ8TuFnzWviEEUgN/k2Pgemsx75F
 twrNRZBBoo3PoAGn/t8lvd526aPvM+Dr7pcBvDHPvnLP1warGWEGZ3Ncm5ZX12Gk
 YPuMfU5cpK0gHphvDcuV6pfADKHkD4t+vgwHjne8K0kbS0TorOneYZ9PKLU3FM7o
 dv0hPjQVyfaa3A8MeZ9adiBcSZM0IUREFdP0WOLuyiSW/b1H4NLTuWPnh8bgEGFa
 vrVX1A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1uvbc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 14:04:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5ecc172164aso3194712e0c.1
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 06:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794492280; x=1795097080; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Szxmyh6AHSFS/1ZMahHiUVQVJ6UFuz/SaFCJMKqS+LM=;
 b=ejSdcu0vdtBPwBMNITF1ByOxdasLfHZFH9upjAidjPLqNWSqiiDrIeKKClDu68uL6q
 PBcg812UCaym6+PrG/Sz9qENWmPg55xWSnVqpoq19bEULs1RQeXtCfzo1BsbhszsUz0Y
 B8euvOrxc5Sy4xrLo6q2TPTHcuEJgVYzY/SZVFlgzKOIqaX1ny9Q1J/kFw6eGQWpO5SJ
 yy54EVCu1hT/nUVo56Y0t3vNEfijoyVygHPI2vHhRFT1hO8NG14OXea3APZKC0M3folg
 Sa9rzzEh8E954z1VHGYd6cCkXZwwuhzQUlPgkq0eiLcbgHM9Okw3CUYw7NXtntjRPMDD
 Yg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794492280; x=1795097080;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Szxmyh6AHSFS/1ZMahHiUVQVJ6UFuz/SaFCJMKqS+LM=;
 b=qcoQzUQXR1oCFmw6VuEgaZAujE+usnqxlCHILfVfs8zO2lJa6XAGQSG9VB1dYHhCfG
 QqIPkpdQnhMnKdp/7VNAVARN55agyBCjWKxURJG/yDWvrPV53QgVcC6pSP+zX4FUYceh
 seciDwwj39T0IadRXoOsVr881kCXnDjIo8BJuavmrB1INf1CrOhZ6iA79bJ2QpfKB9m6
 aJPwN/fOsZl5/uiTBh74R8bEGul8d3in8PzuMySSGvFvVkOJVxCWtO7tdfgnzLyBNyWE
 HqRBzvqdQ+8SKJh3zMBI5XD86T7oTaw20cXrRjjYIvgeFLC1W0n3udB4utYWzq/bV/fJ
 RTtw==
X-Forwarded-Encrypted: i=1;
 AL+hErEXV0BS50XKn3hq3WLjePApYJpNhJpaLTf0DMtQqz3/GClUjOcjSJLVKDgNQvWk3Cqo5l66oZQIYQ==@nongnu.org
X-Gm-Message-State: APuU4Z9sBtUpdjuKGxCwMhK6H4OmGcrfeKdmAHVwxOxSKX0w1E7fqxhs
 JBLIqyOwloz8FdKLN5iDDeRx+AYg9S1OQ2dy/nenLr4Buja7GZRVHF0wOjwNMLT7iAyn3kiHGyU
 7KedTJ2C08uhYXdjEuNVR93TWJ8vdmkjVsBowMa81WHiCTbRgCdaGCfk=
X-Gm-Gg: AYBFou2cwGBeTdG0ZRVJrtA2i9vAoDvl+hFFIleKOLAQQYWkMxua102mTy+psJDHwVt
 xnJxE9qlNOkjoJ9yiirEytFOUl5tuOJV2/YZD9mgxp/9tFPFuPVjQ1WWdtxE0uSkwwYaIJZBoqa
 +Bom840MCVbddiqxmoUFnRHKwM2KQIN4xivqbplwbr0LiPSRHm4VaMpwJ3G8GcC4f2aobTE1Yws
 I3iYDvS1wQ1+yW4GojIYNpjco3LpFtt5G2UVGsBmPIT7FICtvKreu9pdK2V//8JimO0K21uwYEc
 6Bq+pNqWzk5zp1tSgoy93FQXfsBiHawRAZMgpNihudI8FBUw1OAhde+9HAHNW+zTSUhBhXXdNPE
 pdPW0E8WADzQFgiphf0TxS6hL34c48pR7kn4T4pwS0GXBUcqL0qCSimXwU5hXuqhJYA0gekEBpz
 q/p/tp9Z0FAC22kA==
X-Received: by 2002:a05:6122:d24:b0:5ce:b65d:22c4 with SMTP id
 71dfb90a1353d-5ee1c41ab4bmr2728210e0c.16.1794492280424; 
 Thu, 12 Nov 2026 06:04:40 -0800 (PST)
X-Received: by 2002:a05:6122:d24:b0:5ce:b65d:22c4 with SMTP id
 71dfb90a1353d-5ee1c41ab4bmr2728154e0c.16.1794492279919; 
 Thu, 12 Nov 2026 06:04:39 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e33ae5bsm66292385e9.3.2026.11.12.06.04.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 06:04:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH-for-12.0 7/8] meson: Support Linux-user executable aliases
Date: Thu, 12 Nov 2026 15:03:42 +0100
Message-ID: <20261112140343.61634-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112140343.61634-1-philmd@oss.qualcomm.com>
References: <20261112140343.61634-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c779 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zs-5URzUCjn_2RNnlE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: OO8yUhmF6C8NW8_tCeFGXsIM-z573KMo
X-Proofpoint-ORIG-GUID: OO8yUhmF6C8NW8_tCeFGXsIM-z573KMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX02QFojDA3jS1
 SvYJEMYRJp2nPtRAi35usqbMh+tQFOL95PDoN+Lh9ftnizfGZKT7pxH5azT0CTz33eB0SqycBDj
 iFEQR4PqRxPjs6qGiZ1PmswD+3KxdxgW27vppp+vtMKlCfsdy8H29ytNmLZQxBVOchy4T7afmF2
 3FVQTMcTpVgm7Jb6/zLuCz/Nsry6QZAsToobwEM8rDCZqQO/k1qv+vjquu9IJ1jC6tRI0xywWb5
 r9UScHdBGdfc6SaV9AL6+Uhk2zX5U5Bf+SZqv8jvugT/EkE3UdEpeGFo2XbRFLM3ZzrV1/+eIjC
 dPjhqkt5/KVY4+yFWcUpL9VciIEjf5tSO7AzyXJ15VOtIIEkTrZbihj2FWymNRFRwNpNUGdLtoX
 YFwqH8N5T2FTQR3GxJ48LzCO1R0Ma76GTNGkhSho7OfvkPdoa/nGQ7M5onnQrMsvTOBcfK/doWM
 oC9vhSaEEwRTkUf6T7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX3EsqJ4UnNW4l
 sWfjY8LgP+OF9psE7D/GYjThs7ktJeZj3a5D9Vf+aRWWOZaPmAdL/M4QSOD8n75Fsq/ds8rlr1O
 2iHMfnuVVRbSq5qhoQngFpCZ2z+29TI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120056
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

Accept TARGET_USER_ALIASES in target configurations and create relative
symlinks in both the build and install trees. Depend on the canonical
emulator instead of linking a second binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 meson.build | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 04cf5d77f188..86b942640abf 100644
--- a/meson.build
+++ b/meson.build
@@ -3297,7 +3297,7 @@ host_kconfig = \
   (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
   (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
-ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR' ]
+ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_USER_ALIASES' ]
 
 default_targets = 'CONFIG_DEFAULT_TARGETS' in config_host
 actual_target_dirs = []
@@ -4580,6 +4580,17 @@ foreach target : target_dirs
       emulators += {exe['name']: emulator}
     endif
 
+    foreach alias : config_target.get('TARGET_USER_ALIASES', '').split()
+      alias_name = 'qemu-' + alias
+      custom_target(alias_name,
+                    output: alias_name,
+                    depends: emulator,
+                    build_by_default: true,
+                    command: [find_program('ln'), '-sf', exe['name'], '@OUTPUT@'])
+      install_symlink(alias_name, pointing_to: exe['name'],
+                      install_dir: get_option('bindir'))
+    endforeach
+
     traceable += [{
       'exe': exe['name'],
       'probe-prefix': 'qemu.' + target_type + '.' + target_name,
-- 
2.55.0


