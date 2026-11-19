Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23D606A325
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Nov 2026 22:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgqctrNk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bS7Q4iwn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUB2X-0000r0-Ur; Thu, 19 Nov 2026 17:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUB2W-0000qe-OH
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:55:37 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xUB2V-0006Qx-9L
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 17:55:36 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJJU3hX1113054
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cDHn2js0U4aPHN5i1hXWwk5EQCMkIAukLAStwRKVSmY=; b=ZgqctrNkqiYcAiMW
 cwVmuS18u+Yb+sHRm44nUpoKi3FFXv40y7DoToZLnZIgGjGCGVh3l2bDT9EwR4kA
 j4Cvn0xKddJb2DFv6SBUbT4P3JDmH+qiRmS46MO8/1+HmShmFea770Uw7mERtu+0
 095bbsb31njNRhNL8bQnuCDuUWMXmNZjgrZGtTOP87uKJ+raYL5hwlo8zTGxpKxk
 seJhjxPMU/ws4eXGDYiGzdh+zyCKove9GvVxAQIIBsHCNucOr2RUyWSPUShgO/Pk
 hn56jaOLlY/tHjm+FYFkqQrs1exG5RMDiBreIYU1pq17sIa4TVLhWBYXVX/Ad/Oi
 LnGexA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au0ts9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 22:55:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f6f4fe531so59048785a.0
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 14:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795128934; x=1795733734; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cDHn2js0U4aPHN5i1hXWwk5EQCMkIAukLAStwRKVSmY=;
 b=bS7Q4iwnygFY4kSkn1qKZeR7xY2fcgHEhVg1gUnsyG4RKzYHdy1jBJsBUKvTUQwbx4
 OfkBNPe2v0Bpc+4n4BF6DKSDfgNSS15IakEyfDmPT22LPYaGH0VgGly3E88fB+a7WIAn
 8mHtkBHYP5TiuWGrKJ32N2h/NxYTUKMNhjXS0eaH2R8YLfZg+8QGodtYzcPUrAZk0el5
 nfrcjPbDBHAyVdLEp9o6SIyjSUb6Uo5dWfcuoHv9mMOf5Un0DKB0KcJ+rlgDqnOx5P5L
 mHAlGxJi90foqQZvZvz8uW6Q4uqhuVKsJCgMLKQ+vd2AKOW3uwtDYVmREK7QTQ6m2lzC
 uPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795128934; x=1795733734;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cDHn2js0U4aPHN5i1hXWwk5EQCMkIAukLAStwRKVSmY=;
 b=A/F0AUzoDhFM1jQSKgFfDiwcG/y+EfgQrXdgd3HoOqLVkJSFFajdVGMT3z37SU8L/G
 7tgUassr4pcbPsTukuz5BO1v9dhgRlv4jWqXeDWFdke3aCGkblrlYYBZ7sU/VmVu4l41
 UKDRn9pEw9hCY6uTytym+1QGKSzUFfDgfDYhqLSH4UYtZe/nnfYjBdb5doY8GHk0NaTy
 7KG8E+bzvNyYT9RybBCQO74ZiovNuf8vgfDyvHGVigOjJOsRMylu/EYl3alJwzEdHY9X
 SnqhqFdA+aUCv/4RdBFwfMuo8ruIBDHT1rpT1wiM5tV/a9YqwT4hMeN+FZ8KH//5/24K
 e0og==
X-Forwarded-Encrypted: i=1;
 AL+hErH1DWZ7ImWIzfHB0JJk3oblqV7Ojrf3QG5bBorEe+Q6ZxS4Ddz5BI0LzFT5zoEg+twUoHX12udJIQ==@nongnu.org
X-Gm-Message-State: APuU4Z/p9wZH97wlY4bsSdh/Z+omdlKNypzafJC26rxPrQaCVjOo1ud4
 fqPywPSIARCVPx2J/G6VNtXPnXDQ0gXv/h0u96zHD6Iv4/KGMze4A37sV2oShLNefQxlIQ7l6z6
 ugn/cyV/QX4U81Z+TKursOXwm/Kao1rQwGvTyYzs74umnpiCcseM1Eco=
X-Gm-Gg: AYBFou0+wYfimPDcZ+oPpE8eI6hNl+UWInvvqPyubB2qCmRARpHm8vJRT9jKOiVok94
 SojF3SCCRqObLaImGm/O5fEb+1ogmfwcrzEbfpquD3VJxKsy2xOQCS79rVjjYYyGRVmDawblUcd
 Pw6x+sluO/zssApwUxufsKNStQUlurET3PTOBGleUSsWedZSnw6zMYDcP3/HPYB655JxwoHFNJ0
 PCMM39NaLHvNNojevX/RdggReWg1g/+OPcOybycAcGnjBv/s3PZ6rna+xeHW53S5Mqs/qQwcYP/
 48U+NbARpKhtxmObBAB3HSXv8ufU6NvTceExhAw66gesXfUvKdzo+FIsZaYU0ZRmILLctiSoWMa
 498TzVa5enX8Dr39jn60x5+fJzAd3DqQpHvZjDL+rL023RtDpefM778bopOQ7IzzmW6ixFFH/Yo
 7VJ/usPcXVNDBBTQ==
X-Received: by 2002:a05:620a:4481:b0:949:7502:69f with SMTP id
 af79cd13be357-949bab34948mr198689985a.78.1795128933745; 
 Thu, 19 Nov 2026 14:55:33 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:949:7502:69f with SMTP id
 af79cd13be357-949bab34948mr198686185a.78.1795128933287; 
 Thu, 19 Nov 2026 14:55:33 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm29296925e9.1.2026.11.19.14.55.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Nov 2026 14:55:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ashish Anand <ashish.a6@samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/4] accel/tcg: Check current CPU in icount interrupt
 handler
Date: Thu, 19 Nov 2026 23:55:12 +0100
Message-ID: <20261119225514.4080-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119225514.4080-1-philmd@oss.qualcomm.com>
References: <20261119225514.4080-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5MiBTYWx0ZWRfXxZS+0GbSk8XS
 RIf16oAha2Y3v7OR82ViED1w4ZOYpLH2bX/1N+LsKnWKNYWifo66mseqWcAZZkCGSwssy28DNI5
 IdSRQjHe+Xau1n5WvN3mZQrJT7oKjTPC68K1V+R2xKCJt20QliyIPEkxO1gqyYuWlgMXGx0e3vz
 C3vtmNiAQkw7sHZOLGOJvJ+MaY0cAC8zyvchPHXb1W5J+2YWCl4z67GvS366y0Ae5VULepfymAV
 37hTVhbRcG8RezPKS58zQlHw5niQeKHJNWwwfSR4v3U12uDMSyOsVWXSRWJkwvfDOb1cgCzNboi
 LbIuvMEZHDWFgHimsYe7AVTK3mKlHdSn4utCZ9SW/Nh4J4xYpNSF5/Hni22z8QFw+dBgsWqZhxa
 ouFxh4j37iAz6z80s4Hei81KIQBwZOeN7G1/Q6hTUi2OReI1YBKX6NnZJnf9rjcciDXP2BXNXyM
 tXGOskhbWZ/g+IFz0Ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5MiBTYWx0ZWRfXz3MdnKnQ99qE
 1ndeh292S9ZehhUvSF/3cvMo94HsRr33YOV3HS6/xa6+ntVJqQXvzTA5InEoGFUUZZiXlLU4+/R
 C/0OmL++e2e5su/M2L4q4ATBOPQNExs=
X-Proofpoint-ORIG-GUID: ix7sRYdQcbX_i95ELFoh2hBhE6_mPR6k
X-Proofpoint-GUID: ix7sRYdQcbX_i95ELFoh2hBhE6_mPR6k
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6aff7e66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5SWVYbJetlhJU-m9v-YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190092
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

Under round-robin TCG, all vCPUs share one host thread,
so qemu_cpu_is_self() is true for every vCPU. The icount
interrupt sanity check can therefore abort when an interrupt
targets a different vCPU sharing the current thread.
Compare current_cpu with the target CPU instead.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/tcg/tcg-accel-ops-icount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index d0f7b410fab3..0313a4d128c5 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -152,7 +152,7 @@ void icount_handle_interrupt(CPUState *cpu, int mask)
     int old_mask = cpu->interrupt_request;
 
     tcg_handle_interrupt(cpu, mask);
-    if (qemu_cpu_is_self(cpu) &&
+    if (current_cpu == cpu &&
         !cpu->neg.can_do_io
         && (mask & ~old_mask) != 0) {
         cpu_abort(cpu, "Raised interrupt while not in I/O function");
-- 
2.55.0


