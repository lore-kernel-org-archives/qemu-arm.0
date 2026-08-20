Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F367C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx99x-0005cx-Rv; Thu, 20 Aug 2026 16:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99w-0005ba-VX
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99u-00027w-Sc
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:44 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK8HvJ269619
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=; b=PK9hYCGXk8Ma+e+D
 7Uj/LPuExCNCb4yHn0KrSrOvSaCfC2hb4fo9R7tzlk/iH+pL+7sj8hGjBKflbhPs
 Z6+yoaXO/CiOEosHhMfZlNdLFA+nVRFfSRNDLbA1i8kaD9E6R8aGfOFwI3658pbV
 JrNS0RnZ0moncsc2+5LOG43YhSmAwnzg1oAYzI59VlhaRncMT/bErtBKBZko8hiR
 rWM/jMrccNRKRyr/VEaGydCRMWKQW5dZhTKHw1XBD0QPM9ybVrlPXZJWbm8eG8D5
 p7YqkvUgfJ4VGK+7hg1QlQSq2uutwaHlRjFbAf/lCHAdxjPNuilNmoUJBbJHosR2
 yCmCUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1atjp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c083f1818so2663121cf.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256871; x=1787861671; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=;
 b=AKfXss8o2dMKTVTAoWtjivqTzQipOu8AI/umnK6b2pcruGyag7TOa20pw1iVyi3h5k
 +Qikdz3UDnuoqkpG5UKN1K2vxQTrucpQ48oQEwVVN7N9j1ZfeaTRf5f4fnfwnoB6aU3X
 9sSmKOTtEMxk5dNQekLT1GiBKEuz/PXKglQXwaVWocL141E7/60p7Xj/gHdzAOHyrNoO
 oERuqvqkBbeYkItfDt5tjRmob4Zp26EPb2H48+StFuBfcRQ9Xn/h2SA61lqPu4lsphkc
 F5s0j3G82Sm6deTnbGkv/xkAlI705URTXIKG1ljPkXDzQny1njR1bcyooKN9SWJpwJ/P
 8W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256871; x=1787861671;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uHmqw3PgQrwhWNplvoktCYvtMz6v2lpYN+dpIY29gRk=;
 b=Oa+yh9VrY132QramUnMlM1gAoxBWW+rzlCx5JnI8GAuQYchAYftKHEU4jpCZATcCzI
 fGjukPi2A9SDqo1GjhLKQnW+fMJnPza4d8jGy0duex9Zl9w0/VEOyuvgpP5VbmJpjrT/
 PJh+MF64p8x/2mTeu8iUAZPucxYQklBI1su/U/pv1eSmIIkh6EQQn9lmsDjHawoUBbjV
 MRS1RGgwj+zKcifjHKYQc/DiomfL5ByaKj8Mu6pidaJHfcJIM6YGQserjmqIurg0q8OB
 tMfFpM3opndVmGdNgb/in3jlj5XpTwNRILfr3oya9xGIt3w3xHz4ljcICeKWTyChTqIB
 BXYw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDIdk/jY3pu34XeI8apDLUdKm3kwJRAjaWCC/aURb/3dLNU8tTodb+4Nv8Cl8Eyx5RaMPEQVYPzg==@nongnu.org
X-Gm-Message-State: AOJu0YzBK6QDTFPF5N/Ch4Auck9NfwZ+BZc9wy5aPn/mw5GN4Hv9wdOy
 OLvMIeXttwlQqMD/thRpW7lVX+iJZQMxShcsZmunxcwms4ChEUl3KYcExDPASKD7u2TeIoyEUSX
 svc6viOywhNm4MyXNZrNevLHqN1lFI0AVVH+d9gOAqaXgR6cXtM8qjKc=
X-Gm-Gg: AR+sD126ckQZk8sIg5OMpxnfu6KJDtjItr08jFi/GM2Tzr3kac1Q5XhpO4e0nnge3BL
 hM2eMuMhPp0kIlmT3SG9huLbREZMbzOIJVNj83dlsg2HGgAqjUkpn0xRB/tA3dGlZKLO1dhzjeH
 8kRxMTeCW4FQPvUyHZUCqUNV5Wvx926ZrxQVIdDSXBtBhEaXbgBdx7DFHmQR3C3B7AHHrQVNehu
 3/hEN5HZFqnoK41RxNd8jPmqIiOemzTEE5eZDmmcGn7HF5TDot4Mgs9A9HJgCA0C/bZbQ3HbhCW
 XfKgIk7DdGxEK4agtF4GQrOC8VOA5ocroPwHlYdxIRYe3YRjX1msFcuAoCpr74xMvSALJuwEMLk
 8aObCnZ1f0GEAyWaR0xL2W9aEc86t4O/pOwwSuw8dnw==
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id
 d75a77b69052e-52df56e5052mr10337031cf.1.1787256871267; 
 Thu, 20 Aug 2026 13:14:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id
 d75a77b69052e-52df56e5052mr10336351cf.1.1787256870664; 
 Thu, 20 Aug 2026 13:14:30 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b8ecef78sm3973845e9.0.2026.08.20.13.14.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v2 04/15] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
Date: Thu, 20 Aug 2026 22:13:44 +0200
Message-ID: <20260820201356.29775-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vcyPR8OQPmcyX-V8ASyG3QvqI58WEZK6
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a876027 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=8cuzm4DnCyvNWT4wVyEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: vcyPR8OQPmcyX-V8ASyG3QvqI58WEZK6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXxSCMUOq+Rr8o
 LyYcp78PjYSMIQgLyEQqFiMOkwY4JC0vTEW8k+tywkZLGe/Hs/kOoDFyuF5+OCcXkvdIXn/DLPL
 GUihDU+vTlbGMx0zVWfASXWgIjM0pmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX6ba9kEn/m1Fe
 bHV8oxgMD1sLV0Kx/AyQzeWgHiMEyPPet/QUC+qbXkoGEqGzzyLAXXRJZl3MnLz9UJLX8ucf8MQ
 XjKqty+bRypL3+1hDEYpp7YMlotVMlzqt4OFFPurocJd96wRzFaVep6dTZ/AD2eMPr2fM7eQdGa
 yDnk3HNE3sJP5iVOq7nkTJEFbFRquIC17OpLjXALgC9yRoKf0ikFIi0RQM08Vw6otC0Ki+yn1q/
 n1LbULQjUdNtIBBOy/7agddZyrWASfDN70Z6+PIgHOqMP9XJpCXueOo/HjYqY5n/3FrLD14oQil
 98kYYgQGs6GFS1s03nbFe9j3ANZkKn/ewnxLE8HdP9xajG0Y/worG5FBu0PJYcaChuT1Vu0VGYX
 eg0GHBWtkUfOYf6lPoPdOE4lwOS804w2Y9RrwvdLfPdXAXiob8tzFkHO3nUw5cmSvybzZ9A0g70
 NQZ+njuuN5EoE8ii5TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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


