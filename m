Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E5F606BED6
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+GnN2+z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDGIrh4/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJMpz-0006nh-M7; Tue, 20 Oct 2026 23:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoy-0004iN-08
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMot-0002wo-DQ
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 23:16:54 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2Es4d3420597
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SXkn645Lr/ajES8wPsLn5pszC1HGjQSvfYfwjciavtk=; b=c+GnN2+zoCwIrT2D
 f+mx1wn4qRNnEvYMXwoIdCtrl2Z72xfQ8XHI+iYEVap1vwU+TfjhMHMYDOMYJCL5
 4fXK5SxbsTdK4Om9yYLmFv3N3rG06QC3+tCRAqeKi62FrRd0oxYAH8O+xDjkzfJm
 mR07KtGHPXqQPjhkYYl5wU9XQS3WbY68kbsGc22HeNCBq5iNNjvKmSnIyZnXIUOP
 yUYTsXDa/dSoGkcoml4sMH3ulK5kx5OiPEDt1SMWXtl4nFa9Hvnvb6DyOPgj98Yx
 kCzU0x1SJDhx/g9r8mY13ifYQNB3+rLCFKeiA+a8WJgcARz+8D/oLi3CpZ4HmfJp
 oGWkUw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r0ubr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 03:16:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f3969a2a7so50073985a.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 20:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552600; x=1793157400; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SXkn645Lr/ajES8wPsLn5pszC1HGjQSvfYfwjciavtk=;
 b=FDGIrh4/1Weun8osnD3ElQDsj4wR+GcRTGjThprch+tayBsS1d21TTov9tAhulDgDt
 LLO3AdSPaGmD8XbRPhIIWvpoXao/3wOzP2eYggj9i41io7Hyv1oJ6s08Pf2L+Vv3vAti
 /oThRWAMM9hLxB/7aFPa6jPDRVGzs7XH2kceJH7sEoVS0g0Iq+Z81bOTjf44fRhPSnaz
 vKc9jGiAWJp73qoFckn3a8CRfuk2tLdbq6iOMjwHohJf1YB33s4PIg5j4byh+GIWA447
 dl5a36HhMvLGiWps6TIFffXxh2CDX/6bRxBtg8+RjBvhXFtcXwgqz2xyPZhxEn7yG0Ow
 do+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552600; x=1793157400;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SXkn645Lr/ajES8wPsLn5pszC1HGjQSvfYfwjciavtk=;
 b=PEfZnO1+yVBFaay7tjak1fH8Gu4jklVAVwjp6Y7k9w86a7BshqBpLtKXIwDULG7KHM
 Kma483DAsrrqH0iCT4GFjd874DIp6tIB5SceH4zhN0HjVkE9N1xg/Q8gkFclaLejdppB
 elv/Unw35Rl76gtjpCxGYxvdUKrCAdbtzvE3AqNGwyDu3kIVZk7yZ/+M7KfWX5p0eZWI
 zzrxIh+y0XwXHXGF3EBiKdkmfPT475wryIS7PA8Tr4KFHJk+dpj7R4pxa7Boutg/uD2B
 wrBsvfZf/DQYSgckaGvsFHB/bsXR3/h+xOEU0Y5/Wd4LFYpQPhJ+0sxHFKtZdUfUxZ+4
 pNaA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzriP9IvtXyifoQs94BqdhCaxR8RaojO2SV1dj8IoQN2m93uAV/kCN3H1hXAlxFdYvUpVORMsXJVg==@nongnu.org
X-Gm-Message-State: AFq9FYKaXs4DnMYM3SVLIVjYGyyNJmkFT/W2OnQEH4eWDrxY6CPC5aZX
 taW6vKkjBSL6nuyyKSkuroUBcIUwauZeOwG/orNB5BuA5IJaClcDKgFnBcINn8obP7hsGuZRG1Q
 wU2XTTJjEBcgo6uHYjJ+z2Sx7b8iPoG0LxXuxJ5tpUQc40zrhKeXA5Bc=
X-Gm-Gg: AYBFou0W9wr5Q+x2qiyCA0uF48ZlVdKrxs1QYPmEgZDA2fbhRFb8w2VDXEuJMoXnvae
 gsrU2FA7EXiiv+4UzO9/Bv5EPFvl6wFfx0/7LSWcl6cAV8U9SN7PiXxoTdT7e8bPTuzr2ODpODG
 b0iuaQuIkU2jRpLngcYNCVbN7v5PK0mOf+YU3DAcMaoC1Irv6MwjIBm16Ms3nF8jP1+iJ4wh7GX
 bWOx4s4YGRWkNP8Hvv4RzOc5FZivPs+Xwow4UjmX86DgRp8Oc+31dCzkQAsv5vFiXB+L4M1ccXl
 7mMOOD8v7jn3MCUugLGjA0Rw9MxAr1T0HiV5YszC0PDkl9HoHSwrID7+OaQwsX1p22Jh+1AyLMg
 2rkx5zRNljjtRUVnl9YpIIBAIaGoNyuEnDMquJEdq
X-Received: by 2002:a05:620a:40c3:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-93f57f74c51mr222446585a.71.1792552599770; 
 Tue, 20 Oct 2026 20:16:39 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-93f57f74c51mr222444285a.71.1792552599253; 
 Tue, 20 Oct 2026 20:16:39 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcd25edasm20923305e9.3.2026.10.20.20.16.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 19/33] target/ppc: Dump EBB exceptions names
Date: Wed, 21 Oct 2026 05:13:52 +0200
Message-ID: <20261021031407.24862-20-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad82e98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=kkiHJ-TBn4Ncjf4pFXQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: rMP6FJJsOtFwBs28QHNrup34ynLHNSm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXw0dAUh1Cl33h
 Yf84/BcQUhHIfz5skPEQcZTX0u75ZEOj4oev1BeirjX7tfr94nBP9ujENQzeLnPm+4NnBMShSex
 dVgqPtyKYWUseaDNIN34S5X9nudpd3KdJTNYy+XfDEFnSGl6Ya9pL1iWOsvNxA5brInVTRWPGJU
 XbSVGJd+7WLqtDG/6f0awtL9HF5SobCaB7yJRorl6QlAl8bHH2D9+kq+w3kM0xaLyQww6fW6lWc
 IaJMXJ27qVllCa0LDPyaiFDhunPVePSQSQACOLrPKgV2nmg2/g36TsXbpkT7GEa+5W1NhQrF6V+
 OPe4bFjweTJ7d6hItDj66lFuQAoSZeGqz4DMWDon5AdSJTJRXtWIpXStINgZnQ2te+RM2XktWNk
 1inzHvKcvHsEOKbFNOeHJ8JXA4lqTkUf9yRU0+UDxtFJ11LnHkqEJ1SKEFptgWJnDq8cWnsG1Fm
 gFoqi22Aa8FU08HbKlA==
X-Proofpoint-GUID: rMP6FJJsOtFwBs28QHNrup34ynLHNSm6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX1+prXmY4leDK
 i9WJupPKao94it+ZcURWe5RmbdN0RHlQZ5zjS9YErCyr5FQx41bFixRqz7XGp32mNiqSr9bIfr0
 B+83piSCQ1dzQFmR1ZfNbbXOucRuZDc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB are
raised on POWER8+ and logged by powerpc_excp() with '-d int',
reaching g_assert_not_reached().

Cc: qemu-stable@nongnu.org
Fixes: cb76bbc43fd ("target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/ppc/excp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6d05b865058..895127fb2e6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -100,6 +100,8 @@ static const char *powerpc_excp_name(int excp)
     case POWERPC_EXCP_SDOOR_HV: return "SDOOR_HV";
     case POWERPC_EXCP_HVIRT:    return "HVIRT";
     case POWERPC_EXCP_SYSCALL_VECTORED: return "SYSCALL_VECTORED";
+    case POWERPC_EXCP_PERFM_EBB: return "PERFM_EBB";
+    case POWERPC_EXCP_EXTERNAL_EBB: return "EXTERNAL_EBB";
     default:
         g_assert_not_reached();
     }
-- 
2.55.0


