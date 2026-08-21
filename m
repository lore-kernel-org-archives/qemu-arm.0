Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0269C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMpg-0004Qp-Qg; Fri, 21 Aug 2026 06:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpd-0004Ns-Cs
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:50:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpb-0003RU-Ey
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:50:41 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9Lwrk1550425
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=; b=JDyumpIwhNzQujzx
 ps3fMra6aEtLBDdaqG89S6bysNNpqWpw3vkie3lB39j4Vn3rRBlf72YDDhqtumy0
 k+c4f/9YXa8BgACsLDUYe+thEe8v+TArOtox63lNjJJhtn3J55PAEQifkiTx4QhB
 K09zHP1pIHd3DOQnbo0CtoozfqfQMX5VKRrtoZQv0h4c6G5Vk6bCWXmbcxJqeYqy
 R1kGDXZCA1blxgfmj2IvF8RDCoW1fgZkeg0OXDFPwaZQzWeCj2SkpkaHM++NbaXw
 fFXuJlSzVPSYr7GB4R9VaHwQVJ62+PZbQ6pGLqlCnSeUsVFJkQ3RGYFEevQ70Epn
 MfHgqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d069tuf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c0e702df8so10550881cf.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309437; x=1787914237; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=;
 b=jf9wQiVqP8Wo2HAIXplJA2+QKS5+HDRL6tWVXIkUFGfEDa+CiMn+3v40BSPVmlCLck
 jhjwtOVoL0u4U5wc/razhzGdduNve0OSyGMOChwEoQfz0W1KRIebHEyGCcn1IsdDyOUS
 s2pgfVIJ98hjRSyfeUzZDFy9AIhxe1X8J1bGlMC67BCOEWsxGqn2jWXwulaQ7XESDfNm
 zMS9f4LiFO7oLa9DkHHhoR1tmVH8jaFq2ueJxbSbYpK3OIRN3Q/kvvBiEpy1wWaMIt7g
 W56TzVh6cgYdDatakYnQa0jbdrAShWR+QJCWVeidTPe7DkCtI6/lFhAIVIk97p/R1rqm
 ajag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309437; x=1787914237;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=;
 b=KDHAvVirn8j9d4k3D3ABXW7HDPZxhvV8APVon+z8VVUIy2w3s70qL8N5FSdXapgv9O
 9BUb9BsA55xbkmDkeIbj3ZJs0UvQ19Ow7jYbH0f/KWyv7oZ7bCfpbKpQR4u+JDRZzKKK
 N0kqz/4tk8txIpXGStKeGVoV8hT3C6GAtuJ6f/z8TZCHBxeBVB/nxtxLs7rRoKc8HZRr
 T+Y5bXnYlBhWGoR17/6/zgJLoKPmw64041nUcxeBM8I+Z5lMI1jmJ+05X+gXyxiy63vU
 H0nUG2O7pw3dnDmXNHzCjhZs3IAk9eMER6TeaRrNH3wRyrrDLV1fzKOS8jlp2/OWcDUe
 Mo9w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1+s88SQyzlVTwYkEPkqsnhZ6D+by2na2rAfGMyv0SgAbcJh0bB24LR0I+YHVd4F4Fb/FISXUY7Q==@nongnu.org
X-Gm-Message-State: AOJu0YzWNz48Cl3BoXYd3wKo2jnORQ0sAPCqDyT8W3txvBAEHJB5IwML
 BlVoTZaWaeuYTy2006BHlxGEwEF3KZBYCX9MC7QeEYX4CLm1yC5VPIhnoCAOgeU8ytmiQby4bp7
 6hU9rl4XEaQmKthK0yPDuTzx3SP+KobyqcHj9PGyDsdNPI7lkbddVS3c=
X-Gm-Gg: AR+sD10AR1FvgRVyLq0V4himzIfi/j6fSXc4qc2uswFdqMjeou5iUblt1GI0d6XfuXm
 GxSaPYeJGeo/WJFU/4Q9eaJhXh1K/dyzIQW3rkgVAKdG7P9+RZXgJayPxSestdIShNHb+tKfPOx
 nvtH81LhLyyB6YcG+P699r7KZLrFaMBMtRipyOxT8LMGZg0VunzZhBClcz/UGAdJ+MyI5PmaX4j
 w23X0p2RXQ2N9DWuRXQ8fzfy7sPqRU9rlDQQv1a9rtElXLm7kY/XF7AnrKXmgh6Jl/MDW1RXt/d
 MCAOZrhk4HSaiM9jD1BoPuvSPre7VUiAH8+r7IWFlmhF7WNrJFzdp7Ype8p6ANzM4wSmaEnhcJ3
 bh6ip2y+pxe3d6ofbmhc9YRcWtdQUEhTKw+UQFTmCEQ==
X-Received: by 2002:a05:622a:1e15:b0:52d:99e8:46b7 with SMTP id
 d75a77b69052e-52df59fbb41mr44399391cf.22.1787309437138; 
 Fri, 21 Aug 2026 03:50:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1e15:b0:52d:99e8:46b7 with SMTP id
 d75a77b69052e-52df59fbb41mr44399021cf.22.1787309436788; 
 Fri, 21 Aug 2026 03:50:36 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9b6ff25sm14514575e9.2.2026.08.21.03.50.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 06/15] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
Date: Fri, 21 Aug 2026 12:49:40 +0200
Message-ID: <20260821104950.32108-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX8j4X7gfsyLFD
 D909HD5M/1hmiOLkFpcPIEExDnC5tKgKsZJDTtQ2UpmPY2Fhz2/fB28FKXQFvFrpETedKoZlLel
 gWeJaq4d5lSH9dBC59sz1X9TAYymVziMIsLRCG0t/kK8+okxjlW28wm25ZYpc+BQivwOXAx4csf
 kK0szYRI09fxlQ1RKGUBHl8y/apQsgP30XKbdcgRQk532EtIuejNMGbQycPp1/yClcYegdp6eyi
 7Ppm5lzvNNI+phrOlEFP0YJhmvmvucrnMuTi+ajkotVk4l2nBEa+tkXrinWx+qMeJO6SoeixTAw
 84HIrg0MOU027CY4hCvyq4VGQve3rsUNqaG24WhAO+SNxOjn8CjhBW93anxye1U1xtUdWVFlGwB
 6db1mrjXAnsIuou7X03lpUxtMkeS9wZtgij8I3W3EvW8vyqJvwheyAoEh6Y/3k+NIBfFIhwPT/g
 BmSUixSegybmyvUj92A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXz1Ta2jSOdfq1
 r73cIQ39XvhXiDEyd4RoF4uk2LoCD6NNSocQe9hRPgpwKZxb1ZguhW9/jhekxDghEWU5YS7G1XT
 pfM0DidsnpqgrF9uHJwOGx9cnStSvEw=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a882d7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=8cuzm4DnCyvNWT4wVyEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: vi4tg921qGmcG16HzbCVDB_OhLorc4Gr
X-Proofpoint-GUID: vi4tg921qGmcG16HzbCVDB_OhLorc4Gr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
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

@env argument is accessed without modification in
hexagon_thread_is_enabled(), qualify it as const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/cpu.h | 2 +-
 target/hexagon/cpu.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index c50fbb3f72a..e4f120eda17 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
  * @return true if the @a thread_env hardware thread is
  * not stopped.
  */
-bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
+bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
 uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
 void hexagon_cpu_soft_reset(CPUHexagonState *env);
 #endif
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9765716b516..4cc6bd67c28 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-bool hexagon_thread_is_enabled(CPUHexagonState *env)
+bool hexagon_thread_is_enabled(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu = env_archcpu(env);
+    const HexagonCPU *cpu = env_archcpu(env);
     uint32_t modectl;
     uint32_t thread_enabled_mask;
     bool E_bit;
-- 
2.53.0


