Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4773DCD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 05:18:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wST8k-0002iP-HD; Thu, 28 May 2026 01:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7i-0001t3-3b
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wST7e-0003ni-Ie
 for qemu-arm@nongnu.org; Thu, 28 May 2026 01:17:36 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64RKltGq2451173
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ENvm1iF+5Lv
 CUxFc8MW65vyiEQ9o3Dl/pzylCTFs5FQ=; b=CcCQ1gMTu8pdWo6WiyRkfvvczA0
 jfGAsAjayz8EYensLKgcFJ9T423WFoqq4yZwnwWBr2ELtkn1eQQO1twVosb+wfTE
 AOHTPBD37k3HZ2OTVwAIhqL8+PzjbKrOn9wRSWVmGl4frNMOPM/v5xXIr+4yuNeZ
 fyjn7CzzwU7nfl3z5Bcw+sd4xrzQLj5TQ7pn+/isxkJ5aINfxTuiV6V5313Jf8+4
 048AG8QRf+wdE8agjnZnhBVSqp20oOndZfE1vQys0bDisA3IzOjQOJl2XFDkDAnQ
 FTWzdNG1yK3wV/kAFw3Rdw0IsewattFLQ2mwS5HjhtLBiUeQpQpVdUYWhqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y59dcs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:17:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304d8613efbso247517eec.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 22:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779945443; x=1780550243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENvm1iF+5LvCUxFc8MW65vyiEQ9o3Dl/pzylCTFs5FQ=;
 b=O7idHNgz2HigjfulXENcP9+uAEVKzBBYVEb38vZ3fmGWi2rXSuLGK00pcOecGUkJ/K
 ZzYpwSuKP13zs4EyCk9KS/Zkr5fQHw+x1jxR+dRbSc8drkOuHyUkJpSJbeWu+FYZ/ojn
 X0y46S9eHboY98x0C9bZKhg5502h0vn1kP3lViFX3dssRLlYcooD9/AwWlrq3B1eOwyc
 z0dpCGjStVqtEhq9PVkP/WVOZCBKgxBk6FNjqlACqR3xzk6R2oLtPckOoO6zRezNylce
 XSbBdjGOs/s63k9puoG14eU3bEU/DBgWVOPrj6TarwYiChyPEW/aaa/0JjAX9kKp5mNl
 dipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779945443; x=1780550243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ENvm1iF+5LvCUxFc8MW65vyiEQ9o3Dl/pzylCTFs5FQ=;
 b=Ec2QdlnPHsW9sro7OErrQ2G6DU90/K+It9AyFNEVvBBpijHpBtCdnW3BLoHhHrdjA2
 x+VBP5orGIPz4wQ6lg4xDlm9cIFUb865uZZMxMoJKLjyuWDIErDo/2IEu/YTzOK6btcc
 jdNeJTnyMHXxC6jnhDXk8xNvATKW8+esMih3Ot6sbubxg47O22iHvV9JzYw7dIxoaHuD
 aAnb5SyTRbvKIpyPEmXhaJ9AbxPJSyqXBctBdOU05piFNAhLxAJzyWFP3vhG362d5dEU
 c3moO+P/2ckYBQdtvCs5UpSa/ouMoOy+xwrwtttWEhNyrRYkwhnEx1cU6okKC2T9XEqA
 aQsw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LUVqa5P1r8JYQ/5A0R7OF0WqOIunH+FqlBhsjC6NVgMKuoGucJmi1aKNMFWj7ipYHNGjr0drUzw==@nongnu.org
X-Gm-Message-State: AOJu0YwFtsqNq82GJUmoUWE3DLrx4359dayT45L1kEX/QwteX3VPBBUL
 CW0rZLJLyUKhJj3lUw5QkU/Q9W9n1CuEmQALgFD1e0E6OWkV7Og0cI1J51bp61lHYZ0dUq+X0Py
 00P3Q6xfM4a0Qs9myrtykRTS5c7xa+a7bUGje0QI52BJy4EI98ZNnT9E=
X-Gm-Gg: Acq92OHRnPVrvln1kMUn6Ai0TKBaxnwe8dNSr2TBWwZJXBI4m+J0jtaIifbF5ssa6CB
 XayStnhy18FCc+uXhpmfM2ttjd/iWm5G990xRJqC2T8cVyO0z0TGtX8xKu3JnbBta6f8pUzHvE0
 h4xnPCe8vzkS9qw181f7iTsIDcsSH88fSE3Bm4oeh/tb8+p29sRHAgIFPX05pBTY3Pxz90MwREr
 9dAXgsQNnOTAUquVfA5FVsLmpw+QgFXpdDZHAu1bZWaRW8ONC9gEoE1K4EpuL69btWQh1OoCcG4
 VEnkHnPfcnaK8wn4ZthMYxTzh3A8ui2T9uT33qo+D+02zkR9zXmTJbhyh/EqzMdCe+XueCVxiZz
 8mUkMncLANtx5fovF9HqAjJMUqTJpy1bu1/0K3QBAhrXBJTs9PyiE6kufL4vk4Ex9G3rrusEHBB
 Qe1kCca/zBt5wgg2w2
X-Received: by 2002:a05:7300:72c9:b0:304:997c:d4b6 with SMTP id
 5a478bee46e88-304997cdbdemr5762047eec.17.1779945442702; 
 Wed, 27 May 2026 22:17:22 -0700 (PDT)
X-Received: by 2002:a05:7300:72c9:b0:304:997c:d4b6 with SMTP id
 5a478bee46e88-304997cdbdemr5762032eec.17.1779945442091; 
 Wed, 27 May 2026 22:17:22 -0700 (PDT)
Received: from hu-pbouvier-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304b984d9b5sm4094607eec.7.2026.05.27.22.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 22:17:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 08/10] net: use stub_ss for vhost-user-stub.c and
 vhost-vdpa-stub.c
Date: Thu, 28 May 2026 05:16:40 +0000
Message-ID: <20260528051642.115721-9-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OM4XGyaB c=1 sm=1 tr=0 ts=6a17cfe3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rLAB-7AxZL2Av_YYLNYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: BflSv84MOoujyva1ogOc3yi3vKwC5Z_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA0OSBTYWx0ZWRfX227K8ahRkz5E
 JHvFAsukPIyU1zvCTw0yNl8WDF6rzkIq2Du3SRmFrUkayQniLwxcXsPXsaQSsDre0w3nttZ7WAt
 5Z1c9ZFvLdw3oYjBCqhduS5eMf928E6SH0fc5yq3DeFiHzemXdEdMOpPqKfGfx4OSENmx+SHI/s
 r6Tr/ObOExnYPqRyZgPixLHfrI7XQm/HG46CssgGK0cu+k77GkCK3cNMG4DAkv2XbC0Fsq//JV9
 abETYije8aWvhVJk5psA/RHQq555cqfjk8eQMYm9g0D3Xyq2kItao2BbuT7PvC12j0VQb9TRgJR
 hmIBDzXw3o08ZiLr7sHlo6vI8J2NVqtHPC/TJb6hGixDzBt6+zz4pr4H0cstDplReVVgHFkjYV6
 LnukwVKPJrrEFZvtS6KN4Y7Y8j+x7g9S7W29rt0dVgUengl7AIGt03H+yWDtAWCqjInvEaGQLtY
 HdMXG/zO0OgwrLnCl4g==
X-Proofpoint-GUID: BflSv84MOoujyva1ogOc3yi3vKwC5Z_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280049
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 net/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/meson.build b/net/meson.build
index da6ea635e95..9c8068b06d1 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -46,8 +46,9 @@ endif
 system_ss.add(when: [libxdp, libbpf], if_true: files('af-xdp.c'))
 
 if have_vhost_net_user
-  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'))
 endif
+stub_ss.add(files('vhost-user-stub.c'))
 
 if host_os == 'windows'
   system_ss.add(files('tap-win32.c'))
@@ -61,8 +62,9 @@ else
   system_ss.add(files('tap.c', 'tap-stub.c'))
 endif
 if have_vhost_net_vdpa
-  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-vdpa.c'), if_false: files('vhost-vdpa-stub.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-vdpa.c'))
 endif
+stub_ss.add(files('vhost-vdpa-stub.c'))
 
 vmnet_files = files(
   'vmnet-common.m',
-- 
2.47.3


