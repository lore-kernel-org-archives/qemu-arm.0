Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF76C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 13:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh6Hw-0003eR-VN; Tue, 07 Jul 2026 09:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Hw-0003dz-2r
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh6Hu-00009W-NH
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 09:56:39 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8s0U3676417
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 13:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Cul7p3G9iEU/UgFnqgWcT1iEConpD0eXZ6L1n3JD9c=; b=Kx2jO+/G9gFnfral
 i+y/iOvAsOkQGJkguLvkCh08PltF3hbdKj5fVu7nWIX+KIgIgocshExYfgzOpZ0t
 cYGxjurNybB16/cPyxAubl3cqhY1pY7gkqo2JLbMla1elKva3GM4MGCxJpd17S37
 jIHuyU26CLc93RtUYkFWs83rKRD1EzejXtMECJOcrX0AjeKQKH7yCAd9QNzaEjeL
 ydRe9f+gzgdPfXm9MZEvxQ0Gfcmn5cQ32AY5J6VUxGcuZ9Q4BeFhQghvVQnbmdlq
 sfuJiq1MH1V6Ljab5omPSjfj6Jt9nyKLVDF3plXx9aByvcoS+4OTh0BS/Hjiw1BY
 lvyYvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15a9tx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 13:56:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c07f25de2so29450311cf.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783432597; x=1784037397; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6Cul7p3G9iEU/UgFnqgWcT1iEConpD0eXZ6L1n3JD9c=;
 b=Fa6RFU9t0jV/P0iLpTSqXA1EdywjEikSLsnF9GA3AsvgGMD2CBY5/sdfHMzt6UrdWj
 aebYzdK8dRI3X053sMiSrfYf97n9TS0HjVgFtwjHxM3i/YCTK+O1PBQVPMOdZ0MpBcOK
 OjuuDHl1pI9dty8jhSOsYM5586Av0bfobyAIljx+WS1oh8Qo50U+XX9VeZrv+gaxsD2e
 OXizrf6mNyDZjgIzIqYANGEvrCarra60S+ZHEIViO4C6xJEBt4i6pkext9eahLPhPi90
 Hmd0T2aMLZI/UCp9qmDw7kS4jEXNSR3IFDT8zT0fYg1r5rH4RRDINl+JDaFo1zLTtNkd
 /fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783432597; x=1784037397;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6Cul7p3G9iEU/UgFnqgWcT1iEConpD0eXZ6L1n3JD9c=;
 b=ZVUazOVpCdiZ3uNa4h/eozXma+jbEGTMIO0pRtZFv4zujC1GWjY5D8HkJXMGeFyu8W
 8uzq4A+nQOk01ck22NG2KJyBB7LCCaOrnwm0CRS2JGaSRv4bSwLzBMnQHnjf20YmrAVJ
 LFwRm8uq4EGadCTsd7EQsj2Rpt+gySSYP76Z5Xn4lw1t3uWtVhRskCp3FLMqLChMqp8H
 RlAaSiHFLuQchzMRkBKu+xciRgeuwK8wkL+WWmz2/u0aGN1L8Jkgsr0dUf1nfIiL+Mpl
 hbWj0pXflJ41Zh7+MCjdntp5xsiPtR6AxJAmz/0YcC/yF3JAbDOwISVYz7lOe3QmFGDm
 PHyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpBpyCPvBYP74Zm+7uyegxYjAHa7qg4q01gqKzKVTROMVTsf/sTxlx/6enesPRktLUFA6wEGuJpVA==@nongnu.org
X-Gm-Message-State: AOJu0YzQtCQwTOrTPdoSgQrjnhw587FHqmmgSThsC9FLhu9LEf0ixaYs
 +O3mw4ZZrquEv4CpO77W9GrsUafrqXncXcmRo3XgL7c2viDQCpQXq5JnswnLeL71N3VxV6sHIGl
 YjgVeQGT13T/G8t6645KfifU+wkJpYvDop3OVo9kXg08tGmqpA6/VwoU=
X-Gm-Gg: AfdE7cmJ5zD1W5L2goSDN5eGRWkOrjWu3dek/T7dtel5dW+OX91Nmjn7Jhgnc6A+ArB
 3yibK+ziTKfHp8R+ZHxdv46jd7Ffg2AVg5i2MioW+JYu/Wm61X5U0a4Tb4zOzZA9Cz9/siutxYS
 q6o7uoC8Xr3UPJDN1DxP7Ew0kpBPhyUyn18NTLenF2GGFeweCDfgxQmeGQDJWBkyfeM7HEeQb2D
 RfOSCAXZNqb0MsqFNWj0wWPm9fPtHr9neG68KNqQ0M/56UOiotnr2DWNYS58CYfQW6rAy/VaJI1
 MyYEjHwpHAmlDm13HLSHMhkLakgWxYkB0xwS+S596YDNONHWA+7NOI6E9gd99aPMmymi9WlRmgj
 BEoXhTzV5bCfd002aJNAqnRjQFYQOJjxZBL2Ay6UICCQqtvH7NlmK5FW/QpYaACzmvcgJ
X-Received: by 2002:a05:622a:14ca:b0:51a:8aec:9bbd with SMTP id
 d75a77b69052e-51c7479ed31mr57932221cf.19.1783432597030; 
 Tue, 07 Jul 2026 06:56:37 -0700 (PDT)
X-Received: by 2002:a05:622a:14ca:b0:51a:8aec:9bbd with SMTP id
 d75a77b69052e-51c7479ed31mr57931891cf.19.1783432596533; 
 Tue, 07 Jul 2026 06:56:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f4e3afsm65615505e9.7.2026.07.07.06.56.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jul 2026 06:56:35 -0700 (PDT)
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
Subject: [PATCH 2/4] hw/arm: Allow using Virt on a WHPX-only binary
Date: Tue,  7 Jul 2026 15:56:16 +0200
Message-ID: <20260707135618.53561-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707135618.53561-1-philmd@oss.qualcomm.com>
References: <20260707135618.53561-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: No9fLX9XoOyUw-nqqhD0I8MPuYIikPvZ
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4d0595 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=y2RoIUyPlwi2Edkf8gIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: No9fLX9XoOyUw-nqqhD0I8MPuYIikPvZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX0PiUxWuhVuLp
 IeCaVE8aDUd5EFIRES6vDlxEgTtpV52kuYkkzTWZaNv3rtznrTVyIGbQGCaW5+Y06UkDEhelsjM
 yuE+uKU5Tb0QPSXDMvQzB1H0Xjskk1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfXwGdwQRr5BygD
 LzvSGtQO1VmFhh63pAv2P/UojUDzm1v0rM1ZNHCENdOLrzui+T8kHHUbLVQIvYhCN5+0RN8pFy2
 9e+EjOwS6DjcqHh5SNcWXhRmYXZMUaLDx0BdoD7NDtzpGsH6EmZhmUjtyhGSlWiViPLLx9n+hkc
 eVobHxYXKZCjTXjeR5t4I9lHDq9EgaZUWyHCU83dnZ71KiA1LzyxXYa+yAQKp+ghyxbD3t7t6WV
 ViwQ3OCGI+eppJd/RQOt4KC7Oxbqr2TXWA6PuBaT8TqpOYR5i+AtOGsU7y2CoZNdd9ovTykRXNG
 QzaMiuy91ntuEv2CJRpVzGdOpnelpg3q43Ht3J0kE/fq/HABbD2MNU0rCc6B6arAbEn2+jyk/Zy
 E4jXU/QQPKSSNgLCV+ZqZIUpEVvg+tbrcdbUGy0cUfSZ3hiO1U9zq32D5XvvfgMLyN42yPGV5aE
 U12DYfrfJ4x7S8RjunA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
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

When restricting Virt machine to Xen in commit 8c4648f5a20
("hw/arm: Do not expose the virt machine on Xen-only binary")
we missed this machine works fine on WHPX. Restore that.

Fixes: 8c4648f5a20 ("hw/arm: Do not expose the virt machine on Xen")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f9a225c19bc..d0f08c0c07d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -2,7 +2,7 @@ config ARM_VIRT
     bool
     default y
     depends on ARM
-    depends on TCG || KVM || HVF
+    depends on TCG || KVM || HVF || WHPX
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply TPM_TIS_SYSBUS
-- 
2.53.0


