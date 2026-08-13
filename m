Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356E7C5DF6A
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuZzh-0002EH-EZ; Thu, 13 Aug 2026 14:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzg-0002DR-31
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZze-00028r-JM
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 14:17:31 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTJAO2778269
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QUpkBT3vzMLzNP9l26VILjfTLo8RAThxlfT2F7nsTu0=; b=LiWQEn/GpDtpTz4W
 PvmQNnbfd3vyKQ4ejomX6bI1pChD74UDsrbe6/CWizDvW/rfn3P25M2G9glx6G3j
 GevnmALo2UA3A/cK/9AtGW1BnLvYPns32UJP4lTjUSUxEqEGDdIQVHQ0/0mtU97I
 cQrO5a5MUaC/OOJ6CrkAjZA8OBiVOE/sD0nkyKJV/X6U6zLfgx2nad5hDuAb7tJH
 oVGoVmfU9MQ4PjFb43K0KjGZPcXah8Wta2f7/xEJHZI6/1fw2nLr99adYj7NFndR
 97UvxYAyHT9+K5P993ogOD9jA94/vHAj5kMxL9D1crWgVx3udsm1urUDBXeENoTo
 ml6dlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5j2pe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 18:17:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c083f1818so3038041cf.0
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645048; x=1787249848; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QUpkBT3vzMLzNP9l26VILjfTLo8RAThxlfT2F7nsTu0=;
 b=Lm1w0+khSrbGNWVtQ2O4YhLu1EawKxQ1Hj2HSo8efNrcBiXrvDZKwINfZROq2aYKAt
 yKTgzkxZjXIJ0GH46tHiqsFJ7vXLf6+Gm8ziHA8KWu0sUxsBVfbJfGlc+USI+IxfDNlY
 FMRc9TI6JSQgVP44WGQLUvDIgsps/fkWq3jSi3eCUk9fvTsOqVgW/tZ1FkFmJF82gDtL
 MKKBfacCD7YPJw3OcFmMQ6j1BORpvVC95GkaDCsrKX1FcSTCjwiyDxJjLcxbawO/n+7s
 Sndgq+rqxi8oq3bmsPKmdsAq/8LqGJwwsqXUSfNK6HLyzLr0PVdAcxgmTk0+XoHKAXIh
 HBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645048; x=1787249848;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QUpkBT3vzMLzNP9l26VILjfTLo8RAThxlfT2F7nsTu0=;
 b=NIA2Ou141EbudkRQIglGLAa/kLsZa+l2Vcx59XbMhLPVg4SsQNvwJvhJWm52hfus6F
 8c0Yzj4bxCfF9ix3VaQUpl8V46uvlyJpQ2H+zjuqMM5L3KT6VOeBFcEBL5torw0UO+o4
 dl3SISiUnB/x336AhxZD5yoOCDypyxA0TX5wrCtnrrV1ocq9iacyR86mSEBuqhy7qgH+
 QNmE9mi/NcSNfGL4VzALg8Z70aexE+AgJ+Xyt6NNxXRcVGb/mi5HmsTX1jeerFIPkCPr
 jXkcVpEbc8Osnt/kYpwvt0Norldzp4jhgjYt4rMSjNyVlHETJICg6x0KIpA1D9J8s1SW
 s5fw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr8FDfSzqoeGZuYHhBowlvyQUycWNIj4J8e3zmcsgqpuSVvyOQmNThy1pZR8xYGeIbKMjNPrhKeJw==@nongnu.org
X-Gm-Message-State: AOJu0YyeVkDxjT5umnuoqKl0MRajXG1dwTSu8u1iYAb8XqHIs0JdBri6
 q1CAvQQH2YGHGMqwA+5QgrY0u3qfccaHnVdJgxZkB5w7uIvcXwh53kcOtNXubRb2Ql6ccc7ywkB
 u7vSq3D8iGvYU6jjhIJuONdEIlOmqAy5c+qgFFvffIrKtT2DM3QztJwc=
X-Gm-Gg: AR+sD13IaC0DJLtaPRCyOY2daRnirv6ZLFMCGl7nC3YrJjo0uv95fQrJb+kGE8IajKx
 Wtvu4iQv9j+4+KYesHwVX0wyhYbYST0WeD0QbP94Jl/VMd0ZEGikNGQiiW9rPpZOdjQkL5pG8J8
 fbDGx23qwT4F9C64y00s0Lk8Rr0AzGdmlsryXw2czDUf8f7GOL/PTW+5xYFMZjaN7QjgKIEJVL1
 g2ZKhXsLysimrWk10zB8sTK//UZH/nrdwT/cifaopSNOBz8bD+XsgxTThmAJfQ4v8A991qcJxL4
 Dh7X751vKdx9o8Tg/xd0kbd7Cr4LWLzoxhsmPemE6ej6S6ghlY7Ni/C6fE11WQSvuKwNI6nk7y3
 4lJmQK1utAtpJRojBNKj1xX1WHBWMltmWTC3R8k6KnQ==
X-Received: by 2002:a05:622a:4c8e:b0:516:dda7:51e0 with SMTP id
 d75a77b69052e-52d73c8c646mr95096121cf.17.1786645048024; 
 Thu, 13 Aug 2026 11:17:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8e:b0:516:dda7:51e0 with SMTP id
 d75a77b69052e-52d73c8c646mr95094951cf.17.1786645047369; 
 Thu, 13 Aug 2026 11:17:27 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2005bcsm1283256f8f.6.2026.08.13.11.17.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 06/16] cpus: Improve cpu_exit() docstring
Date: Thu, 13 Aug 2026 20:16:29 +0200
Message-ID: <20260813181640.6537-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TZjUg_AneHzt9WcxQv3jrw_DhQW8jjJ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX8EWA9t7c7Gv1
 p34/1NOHScYtavuXjBE/GGLC0AAguWCMfnKXTD+IdvKbHrNsz9mVPzlWhdYqffM6f4Op8fO8eOL
 8yhzlRHCSd25xMQFSsYJbvy7ahuKWNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX3nzHKVneH7Zi
 2c82mIQq/LyVLZxQTNaV52HWuuVSYp8kBHGa67fi5In1/sYz40xYNya1IsZ5nDBZDOCJ6O+C6+D
 8C1cc72yOzKMn7b1Z/O5dBtnQOhD1LcO1rUHO/KHVHRFC1GjhLm3KQHYhtQ1uF+Uxn8jSMrNxGn
 c7QojLm/nVWQ4kI7x+ygAncUeDP1sRh9W/okAG7mynrFCgj7Irp5nNqF8v6gXzJ7blTE33r2ccP
 B7t8rom0lksys07F6enT8/vNPk4SaaFxiJq+xUXLzKXzsRjT8SopSkDFyU04UbBbcVYwxIAhlJz
 u40T6xOdQnOWVtSrNdiGzU/1+qV5cmKYY0jrP0sCSTylcFK4ZuZUlHzD82F0joakJHWzcPFqXg/
 1s0d9FzQHzy97ZD77R1QNlo6tGj5MqzY39eyflRGwRwtcucuzeZyiDIY78Bvk3/YoRbEzCdmDit
 9iX14HGhjowcNQgb4iQ==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7e0a39 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2BIhYVGhW6Jtnc0Cf5gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TZjUg_AneHzt9WcxQv3jrw_DhQW8jjJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Mention that what the vCPU exits is the execution loop :)
Mention some of the reasons for calling cpu_exit().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f1ac492714e..7da81f3ee85 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1037,10 +1037,11 @@ static inline void cpu_set_pc(CPUState *cpu, vaddr addr)
 void cpu_reset_interrupt(CPUState *cpu, int mask);
 
 /**
- * cpu_exit:
- * @cpu: The CPU to exit.
+ * cpu_exit - Request the CPU to exit its execution loop
+ * @cpu: The CPU to interrupt.
  *
- * Requests the CPU @cpu to exit execution.
+ * Request an immediate exit from the CPU execution loop to process
+ * pending work such as interrupts, timers, or other async requests.
  */
 void cpu_exit(CPUState *cpu);
 
-- 
2.53.0


