Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4114CCD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 21:49:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX4JA-0006rY-8L; Tue, 09 Jun 2026 17:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4It-0006ep-Uj
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wX4Ir-00082A-J9
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 17:48:11 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 659K4EQf3229754
 for <qemu-arm@nongnu.org>; Tue, 9 Jun 2026 21:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0hQu54QMYIl
 yDxg7BT6SCUjLRp767RiipdPlv6BEBxM=; b=gqJlWazqT5lSbKAGGiVpfxR1KOW
 bdIFm/Jv5c5wqcNI49T4PUu4vme4Y9elzbnlkzNGm7uGjf1k1zjoNNFHAoDfTdEN
 EaRvjiubxn+Tm3D/10XKkEhAW/qH3dIKGZo0sS5Sh3aEV4zZM34tGmwFtZ6nYkas
 GASLPTjYsxEjNHYrPF1aaNf2/kok4xYSgVOVP9+GGQ8099Aw7PccjpbwwBvSrSs+
 Tog+dSkobWVIY6zk9qTgVqRbS19ZU9hGoeASnWff//t/uygNAKP4/8rMoyJpmJuN
 6dEbXhhvJH+5SvWP+Et1mO13q61wxLs14vL7mz9trOCRcm5TSdQlXNW3YjA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgkxpp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 21:47:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-13825e1dc0dso10306257c88.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781041677; x=1781646477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0hQu54QMYIlyDxg7BT6SCUjLRp767RiipdPlv6BEBxM=;
 b=HHVMmlUok3svQNr1Wr8mzBq0toYNX+ey7zTifsGkIg0XxpEsu8ZenbGOZ7W+wUmi3b
 6/URvFp9SW/U3T87A1FgtJMmnRgmUNej/LY+cECU9g6gdKlY+5xrm/MJUZTaquXv7y1M
 wt8zhZ9qF+jHN1IZRpgQ6JqwDQFKfB3jKBieqwPwE+P/2AVYzoeaUniud9Y+/fiha2Qk
 xBCS5noIizXmMbBy3EKltuaJ9nmbq0tLCmiFJpuDHAoCvtnrBmzPn3PVmkDpKpIehY/6
 1nFBLTnatzDKfrUin879OZXCbvjlcMbLXQmUUjQIgNjlPl+vZqD6Vx7qUrCZoouzmjSi
 KMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781041677; x=1781646477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0hQu54QMYIlyDxg7BT6SCUjLRp767RiipdPlv6BEBxM=;
 b=o0GyPnN0AqmsfILesIlbiFoafCWoWsRbdPL6ScOkpCr14qUKlEdnbhwwbl/6ESOzYh
 hiiBEmFyYiLSGXbb9Ytksj1PcqkEVBDl0HBgVyllenROXnfdYg2Y66mH5DT79b7y5lIE
 IfJv5CSy5cLEf4Fou5wTZ+wFZzgPXv8Kaia8pFYsZYJuhSRDVDtJ8h9aa8wywpbkGWMb
 wfw/xjBlr2/eo+GgQd0Spt7pjs42jCuDtigXyxUQznyr2S+w2ZUMihtrUY14mz/pkM7e
 tNtAthIpc6Pt4ZdzN0yijnne6rEkfZc8fyNYaFGNitMQcqfkQTjCJxoA5EuOvAMXOGH4
 Zxhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/k+jpMYOi4Kss6+fQqUlvfNTyxTzGSOUzmBEh5oSl+FbWDVHhL/0zRCc4tAL9ORP1JzWClTCQ9bA==@nongnu.org
X-Gm-Message-State: AOJu0YyHfre2MKt+ExAhpjrBOJWt6PIKm2FuHGNtwlyyIh+QUCZZrGud
 BP7uzABEeJL/gQNI7VrOEG4XKuRlh8fgB7NwuwLJpDU1pTDw9GZwBkLd8SZtjFOGMb5g6MMuScX
 VNARvKSO9+khdBJhD3By1GinVeI+njwcK9Zd6jjSOl2+kBeSYQOrFpHs=
X-Gm-Gg: Acq92OGMoGQVClcj3Lly5oDNmZ4Vp/PnNrBQuNeJXzN5aJkAanKPYraYvChqOBJV+P0
 PoPFK+jFYqcDzFoNTsVV5V/1L6vaerG7IQSgm/i9eIutdGwAmvlqJIsbjs95mo93jpq3gOUouC+
 QBWiyB7umBKi+rfKbyTBNlGRkW2fefCVQ9eoze4SyMRnDrI9SovKon8zvdTrNM2VlTZtUEJ84Mi
 xA65Ih5LTI2o9jsu9QwiIiF1C0+ILfSX4cpt9PkrWp0RCpgJSbfPrqaUODOC24LjqIEpaeYqc+1
 CrS+jbjFJNheh9c1jSjXG578m78fj/lXN1VdksKKdgJ8R4AlMgUCzkvFEPOzOHdea+7DHpVYCXr
 xoqKiBc4zDd7V7SgI4DDQqt7ERgyvYaV5xdDiVbP02Xgm4BaKU3VkxrkpccyTCPzX3MscaMMKVe
 GVfOimjUIa+CGgaXRx
X-Received: by 2002:a05:7022:699d:b0:137:d08e:e5b1 with SMTP id
 a92af1059eb24-138066d7b7dmr13058524c88.16.1781041677294; 
 Tue, 09 Jun 2026 14:47:57 -0700 (PDT)
X-Received: by 2002:a05:7022:699d:b0:137:d08e:e5b1 with SMTP id
 a92af1059eb24-138066d7b7dmr13058497c88.16.1781041676769; 
 Tue, 09 Jun 2026 14:47:56 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137f5550bcdsm17095895c88.14.2026.06.09.14.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 14:47:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 05/27] tests/tcg/meson.build: introduce exe_name
Date: Tue,  9 Jun 2026 14:47:23 -0700
Message-ID: <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfX5X/sj1LykWU/
 YVFyz9DtB2WDvtuLZz2ddOaVWlJh6XRizsEobOKVH/IfjWAoyF+vjS7/bWyiGlB7yiinKxc1wtj
 Lmkti4fjdaa0y6BAENmgppNinyKVXLklMSxb8v6hiBGIGMH8XaAfzlaFdmTx6mvjQe1jXpyITb1
 Z3woo9/TWLIT1ShYkU1zJLY2lzvtCUWOCizN8ABVJNo8bxluOrWsfB0YxaYhfq3IkKAL+WVJiWB
 RdCqb1yDZ2pVA+/2L5K7O2eXxZHQWtQufgQNpBNPcogdddgN/ZLF2eLa0+fwDRkhFtM6VlBOwBP
 szvhj3tFygYYd3eH2NjiPcO01p2P5gh7w/E0h7NRl6JdpLd7iP3wF4V/EqSYW51cYTdihHnei2s
 MhBoghnU9T3kbEypylhmPBVDZKFnf/j15lFePUX4g8P1bzOeVZtGz4NpxoYnIFVxVPye1V637G1
 4EW9o7nRgfiRi0C8zoQ==
X-Proofpoint-ORIG-GUID: -1_ghlQbjq6WLBQtYjn_EinEoBYP008M
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a288a0d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vdizb8zAaNHivpZOFqUA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: -1_ghlQbjq6WLBQtYjn_EinEoBYP008M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090204
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

We add possibility to duplicate a test executable for a given source
file. This is needed when different cflags need to be used (like
vectorized vs non-vectorized for instance, like sve tests in aarch64).

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 72d1a9f8986..2c6d85c586a 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -11,6 +11,7 @@ tcg_tests = {}
 #     'tests': [
 #       {
 #         'src_file': {
+#           'exe_name': ['provide an alternative binary name'],
 #         }
 #       },
 #       ...
@@ -18,10 +19,10 @@ tcg_tests = {}
 #   }
 # }
 #
-# Every test executable, is built only once.
+# Every test executable, identified by 'exe_name' is built only once.
 # Tests for a given src use the same executable by default, and their definition
 # is guaranteed to be unique also.
-# Default name is derived from src.
+# Default name is derived from src if 'exe_name' is omitted.
 
 # plugins come first, as we need to build the list
 subdir('plugins')
@@ -47,11 +48,23 @@ foreach target, plan: tcg_tests
 
   foreach t : tests
     foreach src, setup: t
+      # return a clear error if user mispell a setup entry
+      foreach key, _ : setup
+        if key not in [
+                       'exe_name',
+                       ]
+          error('unknown tcg setup entry \'' + key + '\' for test ' + src)
+        endif
+      endforeach
+
       # meson '/' operator drops left operand if right is an absolute path
       src = folder / src
       file = files(src)
       test = fs.name(file)
       exe_name = fs.stem(src)
+      if 'exe_name' in setup
+        exe_name = setup['exe_name']
+      endif
 
       exe_name = target + '-' + exe_name
       test_name = exe_name
-- 
2.43.0


