Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD60FC5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 18:35:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrJ3-0006zS-T7; Tue, 11 Aug 2026 14:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJ2-0006z4-S2
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 14:34:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJ0-0002SD-R7
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 14:34:32 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BHtpfE1015633
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 18:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yx5DrvqoVG7WzFuC4QcI2wBJN4WlDhAJMkg2Y1RviQU=; b=Bs/fYvUYJ4ogkZtE
 wkqQrJJOcv5GO7HBEKrp3uVlGoEJmSmTfrnXawG5qvg2EnlmUVnG9w02PGM9pIH7
 E2tYKKqNVlIS5S5fam1glsvs/fM85wPw5rjYQIVgzcrzgS0YQEf0FRlvCEjuWkIM
 bzYJA35x/HHMHneRFGUASfhf3Bq8RcF+YizVVYWcTen3qQnUZ1wr+83lJe8vgFTc
 EqpiKd7CdWAMk/cV1T+UQbRioOiC6sA0FCTDLTRKFTBK6MIb5NFUcXFuzgX5Lev4
 +Btx/JjCYBNp4QcPzCinCDcfC/euDCAZvP3x0IzpkGjt1ZsK92xWwTYwErmucEPF
 pZt3og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrg4mg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 18:34:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so2401171cf.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473268; x=1787078068; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yx5DrvqoVG7WzFuC4QcI2wBJN4WlDhAJMkg2Y1RviQU=;
 b=GVH5A87E7PNFHYXUJOYuk43rWTsv6CvcTwebEuoRmk7FeRvDDCsG7VcL40y7G8D8mc
 KelL9gprO0g+Aww4HF4FN+VIY+ulP+7/Vo6ncsyn5packpKqjS0IYOlzD2cMPGtNha4s
 FcYpM4VckvqMQxE8forNzrqts/YBQMEi3EOBkusG9yZ8Ycy60q8zEGZM4R0nu7OQcifM
 xJw8XozaDqLpE1/H/NHK1mUCCWgtMTqQBH5NPqmID0JY4g15rvjD9gPfXRMuODh7flmv
 AvvfKWsenw493hyi8mwVkvfu89NtoQ9gAzk/EoIPwmGjlqWw5t4KlXeT/97USmqAxMyp
 ua2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473268; x=1787078068;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yx5DrvqoVG7WzFuC4QcI2wBJN4WlDhAJMkg2Y1RviQU=;
 b=tJPBzFDNYfrW7XTQB42pKxxCd4n7EtX7k8VcIuED9sWxsfw2ehUMRgdi0ap82Iaink
 pMgFKOak+vS+KDDwdz+5jBqRqsy3PVnPieyFXSbs2LoR/Zazd091jJuZmvaqvHOLPlDZ
 NLFiihUrcPbrgJgd2DGQqGFVIF7sUdN0mT1rFBO+RuinbwMR2VqzJKUjK35fymISu+54
 QGQm8QTKJH/j5fgUBo18YWvzmxUZ0Wf6fsm2MRnUUupejCh3VCeAIXF+wT1y0m1mF3AC
 o9fTnvGrNlaBXEZXiDn/ZL8wKgHAu04R76f6Xm96AdFtUJOqmwq3kxEipG5YXI7KA8rb
 ioAQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp31a3FaunD0OqAE3qjWP3rji7pUXBt796Dt39Y+sHAryIcYeQtCgsZIEuHZBNW2dAVq7Vnl4OAOQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx9gm8TjD2AJSlhIYxctbqCZvoXJc0+0MFpXv/dMdS7Eg062F7p
 If9mZUZHgeer+UzgLKMi/fbPr0fqp6BMcQ+CahjDCaOU7Xaql5tS7hH7km2gUFdva1FPiJjDZAt
 1PUabgEdsAWSzRk5ujw+6eMYc/28HffK0bEkfgb9aFweNxi9SoKmZwec=
X-Gm-Gg: AR+sD12jSwb/egm+uN+i362TimQ60gvnCtUNDgwYubgXGBqv6X/cOXWQ70wEWxNoaJT
 YVJ+2orX+JIhgqJCgr0S3ICCIT+W0ATP40KK9/UmwUc6BWAkpevlUaj4GYqFnpXcG1IEGD8W6oI
 7HprmngbUsjmHvNfIUAO9FyynyK51Lyw69QoutoxDdts0XY0sWYUZqTP0oPXimlJRP3rDtbTNtS
 OeKEwhHBCRKQzJ3jsb/X0gZNJyY8zy04FSvDQafFtSCiP8ILYqNLY4ae7DTpiz74p6OMr+KKo5B
 YeSjMFO62wyjtBKp1Z/ObfGyut/2y2ffTJYGgK8HWccvbK/c4YP2USwx7t6G7KdUspYmL1A4/H9
 z+3PBUvhKqWkbFwztHn8uYw4S4Lb0fjQ3U14vgdRjtg==
X-Received: by 2002:a05:622a:2611:b0:527:69dd:5413 with SMTP id
 d75a77b69052e-52d584ac3d2mr48841591cf.5.1786473268434; 
 Tue, 11 Aug 2026 11:34:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:527:69dd:5413 with SMTP id
 d75a77b69052e-52d584ac3d2mr48841211cf.5.1786473267917; 
 Tue, 11 Aug 2026 11:34:27 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997aac6e85sm10692135e9.14.2026.08.11.11.34.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/8] hw/cpu: Include missing 'qemu/accel.h' header
Date: Tue, 11 Aug 2026 20:34:04 +0200
Message-ID: <20260811183410.22428-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LA-Hrw1djkV4i9bq7HGFJjxdQYVMaik-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX4p5lEUXEEeUp
 zrx8EAi2VpkqUjlcN3Uu+j2w2IW+J9bIwN5j2sAjBX1xjV/xL2UDTqr4IkLF9kUhpr1z3eTqISM
 ZtONfZjfrS05GtWdgFBz2Ngm0n1Ld68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX0n6bjHbOa9kG
 WOv6B6E1KKaVaKYKu+IOIamJlr6rS+C+z9V3bexTbIc4DVgrJtDRrLITmRcdh9Y3oqR7tvYgzqK
 JiuITIqA8qAQdCYQs07Jxwz4VX+oitNmD/G5kSrmwYGooDIzvV6L1EW7SsPwZ0lIAIPvuAPuBn1
 0MqbU1OnHw1aZzn8nVDcMoWjfu27HhSodJg3mkK6ufPPxaGC90ocLz6Gwnq7y0Phw4Fm+SXhCRU
 ddzzF6kTu9sNJL2lOBLoSKkmEwaq23tjQJqX+CXLI5/vcA/U/eAzm46BxivceiGctBvqnEsbYRF
 kmT1yGHpsZvPcndClyYLB+RmA7c/qYR4Ly+NE9+vuk6hDqdHfDZI2ObLoVl2gVrU3sDHKMeq9T1
 BIBNhNNiV9O2PSYCogf7Hi68t6WwXSZzvY3bBkxiKLJi9EmKLkGWNEVgbJPjk0/O39+0Sa5sOf0
 x/LVtOBBDPsv/sA2sZQ==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7b6b35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z_YzvCJ9eykze7sI9H8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LA-Hrw1djkV4i9bq7HGFJjxdQYVMaik-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

cpu_common_realize() calls accel_cpu_common_realize(),
itself declared in "qemu/accel.h". Include the latter,
otherwise we get when refactoring unrelated headers:

  hw/core/cpu-common.c:233:10: error: implicit declaration of function ‘accel_cpu_common_realize’
    233 |     if (!accel_cpu_common_realize(cpu, errp)) {
        |          ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e314f916f84..8c9ff25e04a 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -23,6 +23,7 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "system/hw_accel.h"
+#include "qemu/accel.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/lockcnt.h"
-- 
2.53.0


