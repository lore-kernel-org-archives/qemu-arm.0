Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DCA606A331
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TyrwqkBE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyY5uFo6
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOx2Z-000181-1B; Thu, 05 Nov 2026 07:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwzX-00056e-Pb
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:59 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwzU-0005wi-Pz
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:55 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tWlQ433424
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 54Wj8Ze5ODDpotjXvWsGMuJa2158rPlapy7ZWwi5knQ=; b=TyrwqkBE25IQ9hhX
 yUN6zte3DGG5lyLeeyOJ8EF+38xYdMfYSVdJB22NAjlHxHnu92Yn4brQXgxwo+y+
 Yvdi1k4zz9U6q5f58iWrSUrdOb7AB8ON2suIHNZcsdgeti4HCBKou78z/P0TLFDJ
 cSWzA3JndGiCW3SGnS1IoWoEZiDkqBprs2zLNjfzgeDoPEnb2oQRObAeVBZD9pKS
 337Rholj3kcQWiy6H7yyp/tNMWW60tayMOfBP1p8Jg9tBJCStlIDAsIEwLKYYm5I
 p0YkCN9Qp0lEj2uDCsQGVvVBt9tXK2mm7snZz96KQ2e2xCsSykRjRRnGiWO6dx0e
 JpjPGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9khr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:54:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f568dee56so346418585a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883281; x=1794488081; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=54Wj8Ze5ODDpotjXvWsGMuJa2158rPlapy7ZWwi5knQ=;
 b=JyY5uFo6pKJs5lrCCCO85ApEK8gO7epVirTgtce+3ybhO3qeZbUmX75s5j2whbHVda
 7EoXQ3jrsOZswQIbDay1bqo872X6Phmm/wEAzFhvRBbrbIX9mPGyJ5IKoHwZvj849ffH
 AvLJqU/X/z24YwSjZHykOUcnMzma2HipC0p4CVmt5tlwQAZ5ZszhlxBNvfe5KPElGlOf
 v2B2ZhWtvnF+saLeoZ51IYUYkf2+MN5A2rYNyCeFyZ2eniNuX3fMq0JHZ94G6uBNQwK6
 /0DWnry9CN0ELsVpHM5bj0NtJeZRhwZC9ahw+AcuJGPKxnQBPZJDdA4004hwtHGg6RmY
 OeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883281; x=1794488081;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=54Wj8Ze5ODDpotjXvWsGMuJa2158rPlapy7ZWwi5knQ=;
 b=iN5ZvDez5vZXF/rEiNqkxuDqx3ZvJazqxLNu3DcrJcjGlrOkS59jEGwe0UV6A0gjKD
 E1ZJEiCaKtJCQGXfocU+gZD/8tML51jJLBDaARRjzz9mQ2NNkSU+CiXHMJT6ROP4sgW+
 zZ0REv/ASZCVGbDAl4UOIthF8OvmsBcsllpRA99FqNY7JmNXcxRO4Qd28nmEr5o5dTnA
 78V92z8rMBUwCOwXpiA1zjeByENWzjjXX9tgPEFVgACzz7pANG9GApKNpZDx0viNwLcF
 sHqOwQ0fqPFvEc2X7Y2jq2ytJFyJUyFSVBAz6fXGQcqLntn7yxbQVpGxsMxeroWMMhTh
 Tf/g==
X-Forwarded-Encrypted: i=1;
 AKwUvByziyBE/4h+b05pqAMqrp6CZDyGrgQuVTfYhK5366pOPyeMl1UY/0VbmXBTLFbqy9UIjS1KszVkZQ==@nongnu.org
X-Gm-Message-State: APuU4Z/qTmVZbRQpCVs+nG89k5XE/+e37qAUUDwo4MHUi0ghb/BXQF9Y
 7RDmgy6HAQf6wLASllAEabW/6ez5a2k8nvovANm5Vpm1li9PihTIl01YX7dhw94ZO7OtZRjq1eb
 f5yf9t8WTbZtv8gPiVt0XkNEDTvi9bg94pW9lx/ypS7lHucPwu+Nspbc=
X-Gm-Gg: AYBFou1xRKoBh6WWX0HKFWdAlePIJ5l99NzZn9mGxq20XxT3++6a9rU1Uy625Q2zSYy
 DYE2Qe6YXB7oRJecK9jro5eMC2CJwi59tWflV7yWK8WSzz5tOTGnmeiw6kYi1SSQtOqCimlsdEE
 4GCwUbreDfdCLdnhAlQyTVAoL6TKZ+0ribXLU50DfL/lSEpMZl2dLAsM0GZWQhaEfChgeH0FXT/
 9OS69JZfWU7BeS1ZNKrydbxbwOXqmRkPgL2EXBIR4MgQ3IiVSd3Ht6wnm3zw4XuTbx+eCVvnM5D
 mJdgYQb1d/2kknw/NLkpa7n/uSVSyzPszjoseWHukWRELv5JhxzO2GdaihDEIGgZ962xfBNRDhw
 N9do+HHcisaZsLO7QiAhynBZpI8uadET+6waB0O3BkVtwaCADJVtFv9BbL9sygHoK8SNBKMd4L0
 9Xw77b49XPxO3IwOmX0vWjIMW/AM1CyA==
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id
 af79cd13be357-94421695deamr2916896885a.35.1793883281097; 
 Thu, 05 Nov 2026 04:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id
 af79cd13be357-94421695deamr2916894085a.35.1793883280618; 
 Thu, 05 Nov 2026 04:54:40 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4a49fasm166564966b.82.2026.11.05.04.54.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:54:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 16/17] libdecnumber: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:52:01 +0100
Message-ID: <20261105125203.40320-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec7c91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kSs1XlKta5HeGRuTdXcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: O86ioLJTuEjJACcY-BWQedlbmoIrVUuk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX6emJZ80Rq7H9
 g9Pj8lNx6+YbzWBIgbk7z4CDv6w5unix1iICIrovAKCR8Ch3e398zNFqAlqXSXxPt8vtx64xZ9l
 f+hjipQd8wXnXTta0sfxQKHo8guQreE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX7wcRUOPTCd7J
 H1mUQwh/mWkARwKC+RcypV2TPKLPRON6z3qkBWTpW48XOjYaIjdXGAuI9vMxDe52mOoY31qPvLE
 n/nYpRQwL+FYQnt61rLwaSRrlk6BxJQbdIOYiyE4QhHTP0/22ldU6JbaeBA1UOCqAfJUpejumZA
 1M1fGYX8OM13f/GpaTEj5KmdxIZKiFgwrVkCDuWzDmWmjEZpVaWu8athn2FaAMi8Emm0pmAeEy+
 P1Gf2viQhK7Fxmgcla7JSJqi1pay97HWIbaZtEnQ9wRqbnCkPAo3mJ7+PR2rD3ga4JKmtSxk8/f
 1///bxZVw2InanBgWUidEAg+IS/mrq4BjNuZPUK44Sd3lBBbec0W/lcj5Ej/dMd7BfUSuc8fbfu
 6LCmZuOLgWsBobbD+W5bEsE5335K620Jrj6rECRJoRhtW/eHYY2DoJQzKTHRY0VhfthYzNgbGJF
 kH/6ReQTs3j2RX+3R5g==
X-Proofpoint-ORIG-GUID: O86ioLJTuEjJACcY-BWQedlbmoIrVUuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to format hexadecimal
debug, silencing -Wdeprecated-declarations produced by Apple
clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 libdecnumber/dpd/decimal128.c | 4 ++--
 libdecnumber/dpd/decimal32.c  | 4 ++--
 libdecnumber/dpd/decimal64.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/libdecnumber/dpd/decimal128.c b/libdecnumber/dpd/decimal128.c
index 1064fb25e01d..e4ff39c90bd2 100644
--- a/libdecnumber/dpd/decimal128.c
+++ b/libdecnumber/dpd/decimal128.c
@@ -543,7 +543,7 @@ void decimal128Show(const decimal128 *d128) {
 
   if (DECLITEND) {
     for (i=0; i<DECIMAL128_Bytes; i++, j+=2) {
-      sprintf(&buf[j], "%02x", d128->bytes[15-i]);
+      snprintf(&buf[j], sizeof(buf) - j, "%02x", d128->bytes[15-i]);
       }
     printf(" D128> %s [S:%d Cb:%02x Ec:%02x] LittleEndian\n", buf,
 	   d128->bytes[15]>>7, (d128->bytes[15]>>2)&0x1f,
@@ -552,7 +552,7 @@ void decimal128Show(const decimal128 *d128) {
     }
    else {
     for (i=0; i<DECIMAL128_Bytes; i++, j+=2) {
-      sprintf(&buf[j], "%02x", d128->bytes[i]);
+      snprintf(&buf[j], sizeof(buf) - j, "%02x", d128->bytes[i]);
       }
     printf(" D128> %s [S:%d Cb:%02x Ec:%02x] BigEndian\n", buf,
 	   decimal128Sign(d128), decimal128Comb(d128),
diff --git a/libdecnumber/dpd/decimal32.c b/libdecnumber/dpd/decimal32.c
index 34ff0fe95991..bc16361c82de 100644
--- a/libdecnumber/dpd/decimal32.c
+++ b/libdecnumber/dpd/decimal32.c
@@ -470,7 +470,7 @@ void decimal32Show(const decimal32 *d32) {
 
   if (DECLITEND) {
     for (i=0; i<DECIMAL32_Bytes; i++, j+=2) {
-      sprintf(&buf[j], "%02x", d32->bytes[3-i]);
+      snprintf(&buf[j], sizeof(buf) - j, "%02x", d32->bytes[3-i]);
       }
     printf(" D32> %s [S:%d Cb:%02x Ec:%02x] LittleEndian\n", buf,
 	   d32->bytes[3]>>7, (d32->bytes[3]>>2)&0x1f,
@@ -478,7 +478,7 @@ void decimal32Show(const decimal32 *d32) {
     }
    else {
     for (i=0; i<DECIMAL32_Bytes; i++, j+=2) {
-      sprintf(&buf[j], "%02x", d32->bytes[i]);
+      snprintf(&buf[j], sizeof(buf) - j, "%02x", d32->bytes[i]);
       }
     printf(" D32> %s [S:%d Cb:%02x Ec:%02x] BigEndian\n", buf,
 	   decimal32Sign(d32), decimal32Comb(d32), decimal32ExpCon(d32));
diff --git a/libdecnumber/dpd/decimal64.c b/libdecnumber/dpd/decimal64.c
index 11e0674fa7c8..18438c1de1c3 100644
--- a/libdecnumber/dpd/decimal64.c
+++ b/libdecnumber/dpd/decimal64.c
@@ -530,7 +530,7 @@ void decimal64Show(const decimal64 *d64) {
 
   if (DECLITEND) {
     for (i=0; i<DECIMAL64_Bytes; i++, j+=2) {
-      sprintf(&buf[j], "%02x", d64->bytes[7-i]);
+      snprintf(&buf[j], sizeof(buf) - j, "%02x", d64->bytes[7-i]);
       }
     printf(" D64> %s [S:%d Cb:%02x Ec:%02x] LittleEndian\n", buf,
 	   d64->bytes[7]>>7, (d64->bytes[7]>>2)&0x1f,
@@ -538,7 +538,7 @@ void decimal64Show(const decimal64 *d64) {
     }
    else { /* big-endian */
     for (i=0; i<DECIMAL64_Bytes; i++, j+=2) {
-      sprintf(&buf[j], "%02x", d64->bytes[i]);
+      snprintf(&buf[j], sizeof(buf) - j, "%02x", d64->bytes[i]);
       }
     printf(" D64> %s [S:%d Cb:%02x Ec:%02x] BigEndian\n", buf,
 	   decimal64Sign(d64), decimal64Comb(d64), decimal64ExpCon(d64));
-- 
2.55.0


