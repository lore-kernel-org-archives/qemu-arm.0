Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23EDC44532
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 13:43:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viYTw-0006Eh-E6; Wed, 21 Jan 2026 08:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohamed@unpredictable.fr>)
 id 1viYTY-0005Bo-6N
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 08:42:26 -0500
Received: from qs-2001f-snip4-8.eps.apple.com ([57.103.87.61]
 helo=outbound.qs.icloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohamed@unpredictable.fr>)
 id 1viYTW-0001On-3Z
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 08:42:23 -0500
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-14 (Postfix) with ESMTPS id
 5DFFC18000A3; Wed, 21 Jan 2026 13:42:15 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unpredictable.fr;
 s=sig1; t=1769002938; x=1771594938;
 bh=MAqqeKbQwR4WEZPLy9SVkmdTt6Yfi3jNZF5s19r1Uoo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=VOw3eY5OOPUGlZpgSqYFpofzNz+2h/xmgDXpvN14Clm8qgULw2M6AUkjjhwTxI1gGwFWHetenvnlu/Z6bGmPQ8A8p4/FfdxCxeQvxSa80UUrTawTUQA0DPxxLOIaWqS5urrNO+07EP5gZIpqoxenUeumqrqJSmeYHvv247qGHU0mWB/X+wS4Cs3HrCEwbX2R/vm0zK4NpFJXrvQNEvY4JZhLY3PAzxpbjM4Dc4ItUwR90vJXM+Q9vcSO1DYdDitGiOPAe2Z4gYxrLenyauk+l75R+yisaVIhSvsvb4we2l73JcFxpPnavuv7P3ccFefZAw7N3ZoFonexDOJ1b/WGLg==
mail-alias-created-date: 1752046281608
Received: from localhost.localdomain (unknown [17.57.155.37])
 by p00-icloudmta-asmtp-us-east-2d-60-percent-14 (Postfix) with ESMTPSA id
 2C2A61800164; Wed, 21 Jan 2026 13:42:12 +0000 (UTC)
From: Mohamed Mediouni <mohamed@unpredictable.fr>
To: mohamed@unpredictable.fr,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v17 20/21] whpx: enable arm64 builds
Date: Wed, 21 Jan 2026 14:41:11 +0100
Message-ID: <20260121134114.9781-21-mohamed@unpredictable.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121134114.9781-1-mohamed@unpredictable.fr>
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JvrTvdahZglyIazG2fXNJw5fs1_MYdkh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExNSBTYWx0ZWRfX3I3Kokvl+k44
 L9VgkiZc5y/lzPvdaibTvJ6ea7mUKz7LpYQbDCn1bPjVMrQcQ79DB26OyLjm2nbp5fDGrV1IcHt
 rUqeM4cS7BofO+NKBd6qieBbnEYC8xsu4agUajoMvf1MHTruFmDYSA0Hqp2exypp2frmycreqzE
 AUqpUVjf7FiZIXyNaOq6jdKcWHCHgbU7izhhZtrLRzo9m/PVndfM/H3SXLzhh7vGHefvAP6qpod
 7r9TKdKBzwTFJpWM+0kteaml7DlNz47JK8gtvwPjY4HMz+NnX5xkzTW6I92zICMWWSeAHz0Dem8
 By95ilzDp3Ky7uCUqqN
X-Authority-Info-Out: v=2.4 cv=EqzfbCcA c=1 sm=1 tr=0 ts=6970d7b9
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=Ck9h3XeVBPDugYI9Na4A:9 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JvrTvdahZglyIazG2fXNJw5fs1_MYdkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=924 suspectscore=0
 spamscore=0 adultscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2601210115
X-JNJ: AAAAAAABcAk2AlWzdXeE1biP/0NWWK6qfLrDdWhf12zNFbhNQk60sF2rxyffjlQ+LOL8l8jONWuf8o8hKcsp5sU7y5DogKam2YmsOZwtTSC6BIaCv+EUxZa7ZVTZ0DBH1zzz1n5X9ZVlCHsIYTqbh4j52Zk9wSKTqzLsRAAlLHmPnl8QDNl5i4SA4xUNIcTlugPw7eEZB89NmxRzS1NPW2jSjbZR7+X3/vcgAiuoXMrIF+0pNuSVSoaa+K1ZfMNfXtKD6PxODGJb1j37weHb4J5D+N8BVyFeVcav2VE5zBBZVi5oktqPGLA6wQX+F10WEYHcOKDxxJt1EiA805M0VN1aqbwS0PVxtdnTDiz6Hlhaa+wCk7Z14QL1hosEZzoFEV4qWiNHt60gTiXyjjQR+SMuSaq0nkuGd9AdTBdAG0WniUlj//QuamukwYDtln0INcjAeu9eRJO3AQd/Olg3JZ0jUe9ebi0wC0vYAHCMupxt0vR2vD/tD1B94dOLAYf5RSEEloIFLj5xJHo2saDGBtSnUZHFrI6Q7IKr7rIlT6CHKTFH5sXqlGzWLeFeTvQ368+grqSIERtEpRFF0x517nW1EFtO/o8m3aTchGU0C3f6wfEK0zP1UleqfI2l1Pk3QhzEru4o8j3FOoFo3k1PcMQNUgn4FVDdL62efreMaBSexfAxYTqu7jREqjXQsRVlqZHrF3iCu2a45l+DObXerHYxmbtXsqgEbWL/W+xbnX4x0+oHnH+mqzOpVnijI9AsOEfcJjMYYxrMNMZcU9vI7vhZWUiqSUoqhvRMidlNSdwVhlTT4Lmfe5i1nlr8lEG0cOgj2J2MHVANNnINCBfQ7lVfv3jTYlMoOysdQMYqMc/+tSLVaQ==
Received-SPF: pass client-ip=57.103.87.61;
 envelope-from=mohamed@unpredictable.fr; helo=outbound.qs.icloud.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 meson.build | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index a84f14258b..286afca4bb 100644
--- a/meson.build
+++ b/meson.build
@@ -300,7 +300,8 @@ accelerator_targets += { 'CONFIG_XEN': xen_targets }
 
 if cpu == 'aarch64'
   accelerator_targets += {
-    'CONFIG_HVF': ['aarch64-softmmu']
+    'CONFIG_HVF': ['aarch64-softmmu'],
+    'CONFIG_WHPX': ['aarch64-softmmu']
   }
 elif cpu == 'x86_64'
   accelerator_targets += {
@@ -856,13 +857,18 @@ if get_option('mshv').allowed() and host_os == 'linux'
 endif
 
 if get_option('whpx').allowed() and host_os == 'windows'
-  if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
-    error('WHPX requires 64-bit host')
-  elif cc.has_header('winhvplatform.h', required: get_option('whpx')) and \
-       cc.has_header('winhvemulation.h', required: get_option('whpx'))
-    accelerators += 'CONFIG_WHPX'
+  if cpu == 'i386'
+    if get_option('whpx').enabled()
+     error('WHPX requires 64-bit host')
+    endif
+   # Leave CONFIG_WHPX disabled
+  else
+    if cc.has_header('winhvplatform.h', required: get_option('whpx')) and \
+      cc.has_header('winhvemulation.h', required: get_option('whpx'))
+      accelerators += 'CONFIG_WHPX'
+    endif
   endif
-endif
+ endif
 
 hvf = not_found
 if get_option('hvf').allowed()
-- 
2.50.1 (Apple Git-155)


