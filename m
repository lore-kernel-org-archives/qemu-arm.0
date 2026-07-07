Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A69C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh6I6-0003g8-FA; Tue, 07 Jul 2026 09:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6I4-0003fU-GT
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6I2-0000Cg-UY
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:48 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C9MQd3740903
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 13:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ibBuYm58xe2e6IjrbMmj336RR3FkZ4lwFHvOiyPJb4E=; b=eJjZOhkK3V5/hu5h
 ZZSbWygK3aQAGJcKUDILYhyzcZWtsA3jfM/jPsQf+0PG8Eo7anO/vUvXi1DTXGTW
 g3uqOrfYM1wAlj57rWVI+gNAJDkOFFAI464Dgnm/w1axHcQFz4l+vmH2I3sQLSOB
 Y3EeDonl32qid16xPV9k2LPY6sFcgmac/meiSFFD+cGo6cuULcLXZkHeSAIDa9iC
 W5wp5G3i2Bc7uySWxi0ZTjFWpqQG1a14L+YS4YCdIMqdW0k04awpSR4YkKMR7ikH
 UCEIaY+mtTnVvuL8ckSL6dCgGrVLRdxKFn5RGRxvlvi/GVhYQcqc8COAloVydBAe
 OTua9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9s45-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 13:56:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c26012cd0so53543841cf.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783432605; x=1784037405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibBuYm58xe2e6IjrbMmj336RR3FkZ4lwFHvOiyPJb4E=;
 b=Nl2Gf59NOSAqc5QtxSWC7coOIAbEHgtlSOSuf9Peuyjxejz8U/IZDyEIfNJGzfRtkj
 FJEVScm38mFU3wFc80X0FFYh1CnHKCDB0ENWrczARuDLXnsQAaT2oe8C+IDR5tv+98oS
 HI5JE8ZvdgdoUBw/UiPAwwUighBVkTlBVlAJfGxtofGwU2xFJekoznvAy+89MGFMtiNW
 GIOeVDFuO12RAEGpH/JpLqNSpzmHiNznFJO1xIpk7bx/nKxZZk09cL6IxAQEl2qswssj
 pH4jd5P6a+STgYmQa66LCjHO6oiuzCGB8UyX/e8tIc5nX5e93J/mvQMQjGZRlPV70afi
 qpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783432605; x=1784037405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ibBuYm58xe2e6IjrbMmj336RR3FkZ4lwFHvOiyPJb4E=;
 b=mUlC+ohXYfmPenovCwaW4BJ3qTy4vozQ7VSD9hQrlgWjn42Bg4rOCbNQrNswXcivOk
 afc6o71qu9o6Fm9EJvjETL4e8sOlmWjvGoMC8pFE5+yjz943Z/NfM1NHCVs6DMNSW+qc
 aQkc6oT01TGYRSbUQmzFnM15XVzFhf+hkSbkdILSFq/CzExTlSEWJtxLB+rvkzpgYY7F
 sbuUOBJA4xX7MaUbR4fSy/lxuhLEsr9BkTQwzlDd54hLZsQzYCOZw95jo56ebOLZePoL
 ACpjeocX57QCXfhsWOs3QhVpZHHMmpS+UWfF/dP1D0xlq7DzCN9jlI4oAEswF6Qnlvsj
 ozQg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrM17xMxpWM9AhNjwvBAVfbAVJAHaxtfdNgE5UcMmwZkaQ3lh617m1l4FXGOZgZ9RwYq6Wwc6AkGA==@nongnu.org
X-Gm-Message-State: AOJu0YxJYZOZFjLvYVvU8/1doTnL2aWhElw664BFkw3J2dmOdisZfzaN
 ZeIjBgDQ3p7ElvoPJopkv04Vzu0Bs37CgYyIY3cOLKi15XMtkPokdVEi405e7jdd6pX92ySPW+3
 MW7yo7jwNbRG9/CxusBZ4CRWN6MF0ZsJFCwBuq+1TtU4RPc/HHRGqfC8=
X-Gm-Gg: AfdE7cmA9YVVSFt8cOHla+0tOW85PeyFtVu3dY6KQrsUPLnZ2tzTEI+OCGwvt7I+omP
 vPNjDjomRCOjwMOMoKjUBT9cOg3U59SiF31Yfi7LmdVyCz6dn96hLYhdSilGHd3KGiYb4CgKl+S
 fyDl/zSzuRsv8nMlaf2tUoATfN8P7EF6BSmQ+g65IqwjMp1cRwVLEOmts7GSpoF3hZpqBaZydi2
 5H2Z2a4GeeIOba9HQKE4PfwmiSCTsCIskc02U7nfFrGSIdQEXeao2Y4NOKqgUxcPtU1u721v2fQ
 uICpLuU1sewT+7s85JK5w1/P8rli7XfhcCqBgQREcsz0XJ7FbjZFNU63FXm0l1yY5RhZxHRVU/3
 21W4OVUTszphOTGdh31H28NoFFBKJhjzRyiX8lPITp6YAZa5q1aeJ3qBx6UWXnMID84JN
X-Received: by 2002:a05:622a:64a:b0:51a:8c97:938c with SMTP id
 d75a77b69052e-51c748ed479mr56337491cf.67.1783432604740; 
 Tue, 07 Jul 2026 06:56:44 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:51a:8c97:938c with SMTP id
 d75a77b69052e-51c748ed479mr56337081cf.67.1783432604246; 
 Tue, 07 Jul 2026 06:56:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0aa7da9sm61030915e9.1.2026.07.07.06.56.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jul 2026 06:56:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 3/4] meson: Simplify calling mkvenv.py
Date: Tue,  7 Jul 2026 15:56:17 +0200
Message-ID: <20260707135618.53561-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707135618.53561-1-philmd@oss.qualcomm.com>
References: <20260707135618.53561-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CoqriG90OCbEZSyiLIDSbwMufFp_ahS6
X-Proofpoint-ORIG-GUID: CoqriG90OCbEZSyiLIDSbwMufFp_ahS6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfXz8gCIoCzHImL
 VaUDgzeQ8B/MxhH8qC0u7zpZ0bQKM0cKECOusouJwp2I8Xyr9ikR5CpIyWeRyDe0FNVYirhO4k2
 U6xFAkCvn7ks8beQ5pmOslXimJcHoiY=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d059d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vl9sPsrYKGekLG37FbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX4LfALi2lyahR
 5py08lURxrEpi1ASmV9s92B98dmLDNENyuP32kma/aM2b54keiJ3/UH1BDTAiUS34u4oUGoVygv
 sxT8XLTsKb7H0WUdcdoiIdAZCh0s2U3QLGuf8BKN+jYvPpgN1KoZqAcjOGBfauScW++9gqW4e3n
 N3E59VAoBHg2dNjqz0hAc0Cdg8OMjwjdExpClLyYzrgd0127vs6cxHRRiGxnHECx8vVsgaUVRuK
 5xqPHxQxbil2eDPPD87LUhQDGtYtk28tFQ6K6yoX5X2LRnhOJWCrxl7Meb54eALhCq1ycRfJF60
 nLyGOKMKF66WQyv1KqP0iZdmm9Aw32oM8Ks+jajhvziFMMYrvf02OA3/uNMLLERblMv511Ia/Wz
 VT9puGDofsE5F2xaG7iTPq6V/PFbz/OIxyxb4dvPGPQHCE/XIittNc42MVQ0FWbqs5ArrkcS4+H
 K6zo64k7qZF3L1U+Cbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070136
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We created the MKVENV_ENSUREGROUP variable in commit 913e47cb6b6
("tests: respect --enable/--disable-download for Avocado") when
the tests/ directory was still processed as Makefile. However
later in commit 1aa22ffee20 ("meson, mkvenv: add functests custom
target") we converted the rule to meson, and in commit 5abfe61b402
("tests: replace check-venv with vm-venv target") we stopped using
it in Makefiles. Since pyvenv/meson.build is included via meson
'subdir()' function, we don't need to export the arguments in
Makefile format ant re-import / parse them: directly re-use the
'mkvenv' variable resolved in the main meson.build file.

This is particularly helpful on Windows, otherwise the Makefile
indirection triggers this error:

  $ ninja pyvenv/functests.group
  [1/1] Generating pyvenv/pyvenv_functests_group with a custom command
  FAILED: [code=2] pyvenv/functests.group
  "C:/msys64/home/user/qemu/build/pyvenv/bin/python.exe" "-B" "/home/user/qemu/python/scripts/mkvenv.py" "ensuregroup" "--online" "--online" "--dir" "C:/msys64/home/user/qemu/python/wheels" "C:/msys64/home/user/qemu/pythondeps.toml" "functests"
  C:/msys64/clangarm64/bin/python3.14.exe: can't open file 'C:/home/user/qemu/python/scripts/mkvenv.py': [Errno 2] No such file or directory
  ninja: build stopped: subcommand failed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 configure          | 1 -
 pyvenv/meson.build | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index d8bc10060e1..851b6ceeeb5 100755
--- a/configure
+++ b/configure
@@ -1745,7 +1745,6 @@ if test "$rust" != disabled; then
   echo "RUST_TARGET_TRIPLE=$rust_target_triple" >> $config_host_mak
 fi
 echo "PYTHON=$python" >> $config_host_mak
-echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
diff --git a/pyvenv/meson.build b/pyvenv/meson.build
index 4e7d8d9fcc4..c2a3411cf76 100644
--- a/pyvenv/meson.build
+++ b/pyvenv/meson.build
@@ -2,13 +2,12 @@
 # unconditionally installed at configure time are handled in configure
 # instead; namely: meson, sphinx, and the tooling groups.
 
-# Note that this command may or may not include the "--online" flag
-# based on configuration.
-ensuregroup_cmd = config_host['MKVENV_ENSUREGROUP'].split()
+mkvenv = meson.project_source_root() / 'python/scripts/mkvenv.py'
+ensuregroup_cmd = [python, mkvenv, 'ensuregroup']
 
 pyvenv_common_deps = files(
     meson.project_source_root() + '/pythondeps.toml',
-    meson.project_source_root() + '/python/scripts/mkvenv.py'
+    mkvenv,
 )
 pyvenv_wheel_dir = meson.project_source_root() + '/python/wheels'
 
-- 
2.53.0


