Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121FDC43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 10:01:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZwg-00055f-Mj; Tue, 14 Jul 2026 06:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wjZwQ-00053B-SX
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 06:00:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wjZwO-0004Ne-6Z
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 06:00:42 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6SUW63929125
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 10:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=aHmCaxQf7ey
 g7S5raOEsx5YSWYXD2jjjc04bAVEXfbA=; b=IOU4IvgSa3rGVgmlcWDjYenNGBV
 RzYtQaL1lam3xTyuqHfe4V1sGjgUW30dBT9cMyAl2HVr5qJ8rgCsFYNiwTHEJBf1
 ry+bUfJjt/mYXMtWsLE/zy6U+Ug3yFZQm0uA188qDMpzO9UEaj73Tb2Zxj1ego/s
 Ffzot6B1Hp6F74y+/hW5V8Ab1U5Dvu2pLgM/ipbaImR7OYeVsrn1uVuxqJlR/0RV
 ZxzGrU9WNwCppxjhVhg3H2IDQIUB0h5dLOfdFs3v54mL915M8+5br7y5PZC2za/a
 KpFCseAod1UahHIkypbEajmWdysCYg0R2cSciZx1gBZe1w/3xvT6oP2dTKQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xbemb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 10:00:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c89704da8c7so6302886a12.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 03:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784023236; x=1784628036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aHmCaxQf7eyg7S5raOEsx5YSWYXD2jjjc04bAVEXfbA=;
 b=TVfivRYqku4jkiHBJjEQlmOco5AffxZhYQRiR3AkseuPlNCqfbERqzUkupSgX9rlj/
 woHZHQbXE6XZI186/KlUgzGJn9KgBLw+1tSqJ4RN6U/iPiKDaioI16IEyCla8Ac0jFnT
 u6cbZ8y6D767/E+iESPfdtzvh5tSEFyc0BYQ99Sy6RWK45D79O+FXWPcq7P0+lLfGan1
 RRjaTVIn2XTo0y95IR0ltPLKDrRcuTeJRL8IeqmvDzpe9lzNwiXsKTri9colXmyE9I5t
 nGzWgSMF/Jt3/MstRVvbCqGrKEbBReZFyfZVPyStqaW1a9TIfYhj4tGi3do7a9DFozAd
 ASJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784023236; x=1784628036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aHmCaxQf7eyg7S5raOEsx5YSWYXD2jjjc04bAVEXfbA=;
 b=llg2E0cTqrkPiJ7BwkMokyft88T3XwVqTQ8lmosyfsgPMZDzRxY/CFX/zg0QI/FjbM
 xHd8+274E9OC+DUYhGhqDbXDby1UBkJcCYshCWfVzZjqKEpqEYfEgCsOGwzyOXKQza8n
 qf7om3Fq0rMSqFKyRH0vlxvBoSwQCsBotHZXBUuPoQ77UoUP/8+o7xAPmeUO3cac5nNt
 rwqrERJqSECAPxLehXaBVab3Nz9uED5kvhm7RwEaFx4/pAE+6jTMlWqaKkiCpieSoGZP
 72bkOGaIB+E7teU2sYGIwV1/KQxVDRRKfLZPQob9ebgpLwVFG6nMtQKLHSxCI7jxEill
 /agA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrbjhrh9VWZUe/papq9WB2h8mmYlMQ7uWK+XmsJE6WFB3zUbvLmGHkS45p4sk+GrHAzG2QDeSfVcw==@nongnu.org
X-Gm-Message-State: AOJu0YzID2kwkUaYa5iQI+KlGJxnD96RNtRGKmSLtJI5o1qqyRijPumu
 Fm+7I0k9zt0cICZP2UiisDc+I5xjUoTfO1/IqROAW+wWSOleal2hxIpKhERgknjIyFZ1h4Jfcc5
 Zxey7F2Q6Ef5MyvPP+LG5aQbjUyn2lHsBueq8U/LsNmI3mOg8x7frg+0=
X-Gm-Gg: AfdE7cmfVAvp8Q8f0QncTe4ezFru8Rp9efK3EIGktf7slzWhQ4zmfMeemlhD28LoA8j
 XBjEX79Yq16HspPBx9virhXNVI2R07MpvcwRSGQIIPq+oj6Kh5OKeZ5qiEO9E0Tst4HMhOMLLIf
 kqMkkCMTFIxKl0NcrqhImJek1qQuHa97D3lC7HPNo+wqh2qLyzXElSYmE8fJNMjRMNJeI0SDYge
 RlCZPNgaK1xZnTaIWoAF9fn68JeNQ5qprY19SjvdPNfGm0LvKZJzItpRFaA4cp7ShzuHQDoUt+o
 pP5WQpmE93r3WgZhuxTeIhXGfc25waECkDTTmS9X3kvYmqf46+SnBxBtrL6amwtK+jE3LTDFI0X
 9sLFDRnSuiwwP8Qe0qTHDf35y23WdzpHnvygzksoH+5BNFCffsAfBXQzFpVMBv6XrRb6TpEhp5A
 ==
X-Received: by 2002:a05:6a21:1bc6:b0:3aa:c93b:625b with SMTP id
 adf61e73a8af0-3c35731328dmr2041499637.3.1784023236021; 
 Tue, 14 Jul 2026 03:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:1bc6:b0:3aa:c93b:625b with SMTP id
 adf61e73a8af0-3c35731328dmr2041448637.3.1784023235508; 
 Tue, 14 Jul 2026 03:00:35 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3120c8e41fcsm44747855eec.15.2026.07.14.03.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 03:00:35 -0700 (PDT)
From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
To: daniel.barboza@oss.qualcomm.com
Cc: matheus.bernardino@oss.qualcomm.com, qemu-devel@nongnu.org,
 brian.cain@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 marco.liebel@oss.qualcomm.com, philmd@oss.qualcomm.com, ale@rev.ng,
 anjo@rev.ng, alex.bennee@linaro.org, peter.maydell@linaro.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 05/14] semihosting: add callback to set error
Date: Tue, 14 Jul 2026 03:00:33 -0700
Message-Id: <20260714100033.605571-1-matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <fa72c68a-141e-4b8a-9445-4131dd83f353@oss.qualcomm.com>
References: <fa72c68a-141e-4b8a-9445-4131dd83f353@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEwNCBTYWx0ZWRfX/FrXyBZ4cmr2
 GEQLSF1ZcQ0vf3Na+L8YXLyXoRWXBq+yGSafLAsY1BUNc4UKjZf2Smf25wAE2hbLFslhjb7NxDp
 ynH/901nELNCHssxW3u4KqlKTwjWBuMsUSyGzAdP5VNdWYIIRubqWdFa9Bf0RXrrScyWbv838RI
 ivEFWJRRtDIiCLwhUhsQY2MCeTRQyZyxJcYIY25YJpx6ogb8oKfPTuB+sWxqgApAi40+ff85w+V
 6z6SFmRJAeXhbbTU0Cgw5wjNU3vwSZPXcHGDPTWlUOoCY6k36yBnH5a5Jk31nvHlwuLtgOVUPV5
 GvHJkMVsM52CfAw6Q7SqqH2giavVzwnDY2Ivs9b4vSnA16AAn/sS+BdnJI74BhrdAvoE98UoTfe
 PHcDYs86jPnzCps+qO1B+nTVXQoHmsNpp6Ke+UHBtp0KwFQXy12xXMhMIvK2wFj1yiN6tnVteyR
 zOP2aX3mdI5LDduBRjA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a5608c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pQJ5p14Hjn2YFAB6FyMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: CK2snHYY6KKHg2IpwOYcCW0JJoPruHwV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEwNCBTYWx0ZWRfXwbIOHSK4K8fD
 7UYOkbLXVXPX8byDuNlzfu4fSU7/heCnM2LS820jqAqj+PI7zSpQ5y3hXgihETYT6e1LOlMQMUF
 zKtnzUR8605EgzOy4IIJnvWQznHT9FE=
X-Proofpoint-GUID: CK2snHYY6KKHg2IpwOYcCW0JJoPruHwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140104
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=matheus.bernardino@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On Tue, 14 Jul 2026 06:50:19 -0300 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com> wrote:
>
> On 7/13/2026 5:07 PM, Matheus Tavares Bernardino wrote:
> > This is currently unused by existing semihosting targets, but it will be
> > used by hexagon.
> > 
> > Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
> > Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> > ---
> 
> I suggest making it patch 06 in the series, right before you use in patch 7.  You
> can even mention "next patch will use it" in the commit msg for extra clarity.

Good idea, will do. Thanks


