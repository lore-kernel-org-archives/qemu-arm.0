Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCCC606A334
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=erdGgyOW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZXNfiLG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRZGK-0002Ik-OO; Thu, 12 Nov 2026 13:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFe-0001M8-BC
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:25 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRZFc-0008IA-Pm
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 13:10:22 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACGRR0m1768187
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Szxmyh6AHSFS/1ZMahHiUVQVJ6UFuz/SaFCJMKqS+LM=; b=erdGgyOWXQpWjs+J
 qtDxve+5y35dZOI9DF/Y2Iv4i6IZ+o42r2AGWkJhBMi+DEK8i5qO3H5arF4xqtQI
 agONPZrq6MijPQWOLFPH0spMFAUyCkRAvDZwDezFs4Wx2uCOx7oNPeO5IUYg3WeD
 QlRen6LNy8lL4WhHs8Nz9xzol6+U//o8jEOY2NsTTJjJeAYqCggF7PIhQxGYrgiz
 BiXsQEgwCy37SESj0nS5eiOdCkRNJ4wa1rfVrdsN1V4AEuAAeBI355Yz1JvAkne5
 DaX53V4+36A0y2wAECyHZRkXycsn3/nbdrVfDPtljJ/2CHUcX+e86j7YfGwyDHYT
 NPbmEQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0age5d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 18:10:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7d2ef6a9f18so5490137.2
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794507019; x=1795111819; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Szxmyh6AHSFS/1ZMahHiUVQVJ6UFuz/SaFCJMKqS+LM=;
 b=WZXNfiLGy6hWVRZKh9XDH5ne6gEv6SwuU87QK+lWv2NB1hjgQTPhb+rwxJMi/zr+XF
 dMA3WybMtTxzxkmCBJUfo6TVYXtIIcD5Ptk+r99Vsiy9kSkC28Q/7sN22Jz/W4TbeVoT
 6f1a28nha4F25cEib3Arf5xsIl2wJ+r3GeLZojJ/JUhvsTUVnxgTpO92OkAPLbq8rKTV
 eMZ6Z9/pdN4pXGN5HjVQ20ii6JRjp8ZVwL8e11rEqa6XDOU2ZImZAVJJGpv083PKk5CD
 UEG17DQaEsZq9o1+g8BsTqcOe2WRTK7aW2t1lGJw+PxdJzinTIchIYdBn5+I6xLWvnit
 tE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794507019; x=1795111819;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Szxmyh6AHSFS/1ZMahHiUVQVJ6UFuz/SaFCJMKqS+LM=;
 b=Uv0rcf5GgaehErDbACPWcm2bJ4rbTkgssjJAqAqWnB5L1YNyLgCIF9ECYYIvjGAhGq
 fD6GcX5bu9fB8PGwQxzef2fkNkWPQq+lwcvYv9efMM2hrVMa2g9wMhzeD0N2+i43k/8W
 Bw3G2ogg2IDj3W9doNWiBj22PM+ZYUgnYH22fJY5amUC3kboPjfS7WdM47ZxB/Qc1ky8
 Qqoo0GnyUwP4KbcD48l4ZDHd+DzdTT9MT19YOF3mCzZ0YrF44OXz7FPjee9cgqD/9aX3
 op7DfUn5Pko/bu3turagPd9LBdp6gWjoRey/7xOb9nlOjADFgpZvDWVu6CeNBVvL2QLP
 oi3g==
X-Forwarded-Encrypted: i=1;
 AL+hErFCthcStryySKGlzA3+E9MOOGV2K/HCRTx2A+aGSclUzzXxOKWhdb3LCoG2QpGlg+gXx2CBud3Aqg==@nongnu.org
X-Gm-Message-State: APuU4Z+2GECzjB9lL2F+saUVj4UbayrELUBvS0NlgMXwilVmrNu0FoF7
 AvQ6ORzF7I+F4rNn8IDhiezrtnyp9IrUcxUSs4AeRqQ98NgrMrU2gs6COOs4Au4Z241GpsCaUIy
 npjc+XVYbbKD21cWjkw/eelLDaY7dlX0d1Am98WiB9GrVhZdLTE41Rifvfn4asOavBw==
X-Gm-Gg: AYBFou0cnnSAoa8FoUQwLjZvHbNtWkfDJeatiq4/xC600Q9kJuTNfOR1BoWXmnnYqP2
 uhUfQEnaaSZgbyQ2NmYXz12mh2jW8LyUidhCPaO6aOJXGhXpCnmBTIHg7UnwIiilpS6goBGOIXH
 WbIThdIvAyIINO7/s9J9j6L9PUprn+HyyKXD0UT8wNHvQTogVD4gj9+TxPtz+vFiW8Vkbt5UeRC
 q45JtPXfJXDUXn0/hOZpLy5UKhR0dbo59Ox1DMp5C8dL8qL73vcnOSMZpZsoQ67eb0Ry539//Ry
 kH05kTd44e1dLqqZ8Z4odY9eFYP8stEDxgiP3yNEaBIHs/1C/1G7fNFfX6nYQMZ8TkX8/hnLWLN
 W/LXApfLTXM08Teg4hKca+c1yYo5BbY04V+SgQrtFxoB3h1tzR50LDeHwYMCVU3HVlnBzWdp7sj
 PTvtgt9DWVNWwhjQ==
X-Received: by 2002:a05:6102:84d3:b0:7a7:198a:c2bc with SMTP id
 ada2fe7eead31-7d50624a2cfmr2480722137.36.1794507019100; 
 Thu, 12 Nov 2026 10:10:19 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:198a:c2bc with SMTP id
 ada2fe7eead31-7d50624a2cfmr2480712137.36.1794507018661; 
 Thu, 12 Nov 2026 10:10:18 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08e57504sm121259335e9.2.2026.11.12.10.10.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Nov 2026 10:10:17 -0800 (PST)
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
Subject: [PATCH-for-12.0 v2 10/12] meson: Support Linux-user executable aliases
Date: Thu, 12 Nov 2026 19:08:56 +0100
Message-ID: <20261112180859.85380-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX/rXc3iRScw4U
 fW3y0ebFqDnk4+gEJ+v8dTSjph97cKEwMKdnMztxtZfujZgrcdkj4GGV09U7oLQpSN49WGaTHuh
 vIqlGZsiU45jIBYDHiLrxlzQRHDN8e8=
X-Proofpoint-GUID: n4eu_Q9VLvfm0PcV4IOJ398o-rT7E7e9
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6010b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zs-5URzUCjn_2RNnlE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX2Bj+LfRfvKGL
 0qX030DHB1ITvoyPuCBGOvPN51vEcNJN9tseWZxFoKNAtt/M3cwUMeEgm0fdEcP26msM50zHQbc
 hfOuyxF90crsagMr6ZzPgu2cfceWX29KtLAwKUY3D+J8odakF+lxRbr5KOmc0lNbkfaDNwI2227
 3IIzTpeTwGNbvlMDw4XnE4Kyw3KGmbcAJxsaxNeLx46yQJTDOfJr4J/az9FHuU6iv+M9anFnMeI
 MwHyuHLUdf/QypMfmIOW5UGrtlymIAb5I42nBnjiE/vonUucyHWjmgbcBRy2oK9QqdDovIWKmIP
 G9pGqKHNquHuWFtYfi4jZvw2qbcKjZqbKEV40RLGI4mbSjGVbKOZYDnDhORwTwJhgHOgrXtfhwF
 WT/y25DBJa2Zuqh5nj3nL2c5zgmhkhtgo+RacVXJ8iEAhZZ7T0GQRIjjpw8MOWdXZQQVaqyCN30
 qJd+NiDqgUPtYh1zxxw==
X-Proofpoint-ORIG-GUID: n4eu_Q9VLvfm0PcV4IOJ398o-rT7E7e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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


