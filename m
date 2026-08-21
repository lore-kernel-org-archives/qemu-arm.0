Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ED7C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:56:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMql-0005jg-Pd; Fri, 21 Aug 2026 06:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqk-0005e4-KM
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:51:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqi-0003kf-BJ
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:51:50 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LmSD3029414
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=NX5SNCYfLCCIeXfR
 kT5m/LvpiJoTFUH7Yc0A5CV+QO+VWhgPAEOOmmOppIkyoLZpLBVHP/aGfnkppQKP
 RDF1AYgSkQHqzlAZh4l7fT9vpx99ubFZfGkRZuNrYPGWwzjYY4axRxMiBKK5ukXT
 pX70lCVHV4lmVcIJzpaJs3emslXvd2JKpB11uYh4t3tCTYgIrmKAlJDKIuKclmkM
 n6Qg0Qe7OQqZxoUNMUWjjd8h2lQM1WqMcNgtqJEB5RMTCW0DWY4EwWdjNVNFnwPA
 Yitgd4E0eNGcERyepNE6JiAGxLxSjgl+fLZ7AzQ55Ylc+HGSc6Zt3kUDrVZJQmdn
 iSuOnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9sajn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:51:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936aa3d9dfbso93681185a.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309506; x=1787914306; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=Z1mvddq9KQOMY3ckcetSxe1ibtNnA/jd3Ejdg00WONlddwxWHn66OX6hcjXP5Kdtqr
 oibjujRKhvw6fM25JHWUrQQLMVdvdTq/TG1s8d84fSqfJgnlXnumKojsW4IavB8to6pT
 rb7KiVZthu1+QW3FaasBQLFDMUQwCo0GygcmL7W1GgeWcsjkNHnQsF4dmaQK9fCqXFj8
 trsWw9wYVVGDB55vVTuvJiypvHRRGQYC6YRzIEcLA8JeW9/vvM8ZS9CBQ6ucFGBuYq4p
 SSJkwM7s2+1/5XO4Gvnjto+AbnGGlTc+XRIYWl3lUE4sL8W6YyQ0HYRrpmUwaVM/4D39
 S4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309506; x=1787914306;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=UG5Xhz1Ncq8C1WWMJMchfDG+Apc+qsgJtldt6jgYdLYaTxZYv9/Dx+cn65WZWzfE+g
 h/9RajROFogpzKhnKGZNdm1JvNxpsgKtk3JwfvgO6Lx0Avl9TED1WXSqvi/tnHZYtbLa
 8h/Hp78Lrz6BJRofxRTtB28DsqRl64BXX5ONZaRO21x7fKZqZ86lLuoFjeDCnzmZxYj+
 jSHLEvq4rZfOmjUmzjR2v7ryuL1LbgCmKo/YpCvty3+ulmj+pMNNqELuFbx1Kg9awvIx
 ZvQQtyL6FT441vb1WGC1jgHyc3fapjcuPJbEuLY7MLtGGJqPohe9rMkvG1PyqxbopPqZ
 13rQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rop8fxM/kjRFCNt2WngVnL+smh+p/MNFb7n4PgIW7XIjL79R5P8zSb6KbCckpvYbVMA/O7Y+Ywd4w==@nongnu.org
X-Gm-Message-State: AOJu0YwS/O4nPvJf/iQ2tM1zloexbPyRdNUymEyNsynPMu7HeF4/8auy
 7tVJ3QKUeZtTzkUr/LDDSTsfM9X+eOI17q3BIRv2YvPdEZr0D41BlhjadSUeGCONGefbHYLRr1h
 P8VW1UUYJSgbz6YHF2i84DzrPrgGWZAdaq3ZOjyo8a03u7VdIZAP+axU=
X-Gm-Gg: AR+sD12X6Y/BDWEupzz5UTy11p0Cr6RHQn+h0w3+SQmXwKB0xF4MBCMBZaAjvfa+4vM
 +9tAgkIglGNxRAJ46roFoZwniie4Ivx6Fn4+C2FjHBlm1phdwlqNP302vmriQg4ffHlBTSCf37m
 LGFh7ZVbcSKMIfUbO8N8JMizsJ0GoQgbEJDG73NLulZ5fTu8QXiyGy512gjRBA/FE6cYGbtRSqt
 vtd2Qotq96vS5YIj6mzBt/MR3wXhtaCmYdtfbguq7B+9dpTab+G2qBbfqU9fa4JjutwZNoRPcSQ
 HuhSVxJFzshmZKRfxtv7IyUDK+T7MKVJ5z/TYnn+B3qKMIwFmdjD4ZGXbsR6YcUTkWRkYhUymqV
 TcUmlJWthNhg4U7opw4Gp1bzTor4yVjvziK5kDOy6Wg==
X-Received: by 2002:a05:620a:3714:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-9373949dc47mr410248185a.15.1787309506011; 
 Fri, 21 Aug 2026 03:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-9373949dc47mr410245885a.15.1787309505611; 
 Fri, 21 Aug 2026 03:51:45 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9b3eeb1sm13262095e9.2.2026.08.21.03.51.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:51:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v3 13/15] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Fri, 21 Aug 2026 12:49:47 +0200
Message-ID: <20260821104950.32108-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX1XZoXSNLSWfh
 yrAnp0PfPbLa6vpGCUQW129aBNO6cMpnMGY134f2iLf6Yd+kYVjGdkR5Xl506b5kBm3aXSLIaQU
 UAMAtSzHVvV0QxpeANYCYyu/tip8cwoVfED4KoWVEE9M2pqHRN4GivRYrkYOiNMSXCN6uibM8Wi
 0hW9zw4+FzYPbWS/8FgRIZVnqT41M8DSpwf++KDV7OcVlnhfWJXp5EsgyZyu/nMiWLtdHyC8hXS
 G4A8aHq3xhfS3Q0KoAAmsS1Y8435tXYPkED2TLglUUMyXMv2KrCmDlO5stWiKqHhjbXGmy+oVAs
 +kyCyM5pztGSdOk/IdbvboUoaUzNwvLooJ3I51/7Hb9xOymT/uoUgFk45xqmG95PSac624O69pK
 Xc1cbnCAt/mUtk1hPA8amAd3suiMN53La2WTPZML66IZnuSdsUml9I29cTyjtkKOjb3tzkc4pbO
 lLSJUHzfoksxpFD66Mw==
X-Proofpoint-ORIG-GUID: t97tCXRNeY32O60I0LQzzPCd0ZpDa0_Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX3BBMHxCub2X2
 cKCjNjmYJWJ0dmNuTbkUwXsHyFGUnojpUlnLHZNW9PHKCwppqH30Hhjl+B39AdKER52a6swObbF
 JXTa5DaTbGlJSayBOFrLUAKGsMNUPfc=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a882dc2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: t97tCXRNeY32O60I0LQzzPCd0ZpDa0_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
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

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


