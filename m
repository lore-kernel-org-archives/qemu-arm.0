Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39443C88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:49:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6a5x-0007i3-JX; Tue, 15 Sep 2026 16:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6a5v-0007e7-W6
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:49:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6a5u-0008EN-FA
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:49:35 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68FIto2R3342370
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 20:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xZdMKVMaxURCm+QzrhuuLoUCbueZWZJdafQ6tOreua4=; b=hIQtmkRKizglJRSR
 MJSG/5nTcmXBRuWNuB22h7NShHZFy3mjGHA/s/pa6paDjRVUbiA3kNAes8mSr3OZ
 X6TWzbWWLeziFq2Cx1wTTRLtzMzT6aeEJJVh+pq8mknTi4/LtlYqTSXk969MG2a0
 bnWyWUOWscw4Dli85MPHqrzyLeg5i9DhTE5UGz6VYDM2UJhMBCdwFClVvm1EoyAK
 ilFELHiLA3tuYSRjAlG6HzFHn0QDRZfLc/m4S6x5dzQyA8J1EwEf2/FBGkDCHBDn
 gdtWGkRoan6bmDEd2fYFLkJ0qzdDhdQIbkDdX88A8s0nFnpDnmYOcdFlUVgqNFBV
 3QDVBg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpc5ka-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 20:49:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc1b8088203so4683139a12.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789505371; x=1790110171; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xZdMKVMaxURCm+QzrhuuLoUCbueZWZJdafQ6tOreua4=;
 b=Rg9iQPJXpPhkMX9VY7GlR/vCt9WYHu77waDkIL3DcnMsU34MvJ2KsUlq4G+blOB1n+
 pBEs9ALDdsfIO0tD4E8K7Qgf9zw2unUZGEoMsaHtJwXxKY47xInNMbUFA9qkz9JwzbZi
 LAQolaTZdyxaDfgymP/tEgL/44OwMtKeqK6g7wzGmnHCTtb7bhhjfwGGi/JsOQFLnPcH
 RNEgttx64FJZPxQeHg6Ik0lZAFSypn+nJbNMO0lf94zgmouOUjmbEEzgU+1QvtGdxNzm
 co26NFoPuQTaECbNlf//h6kaS3wtG4TDrFQnJ3EfYQ6K92cA8lXX+zKEv10YKCCah1P4
 zAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789505371; x=1790110171;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xZdMKVMaxURCm+QzrhuuLoUCbueZWZJdafQ6tOreua4=;
 b=xBFUZsLj/t/ASIhQrkX7sDwtsVoe2iIW4Tkj9TOjFJRX5L77zc0ZqPqIZkiTeS4P3R
 7k/AuE2THjMGcEQCrRYeCoazbFfh15u4fYW7d6+UOQOkzHJfXNCVr7PlL2nAMpKVvaPJ
 vyRuKaQOGO4drERMg4wKfPKinkT1dJuPSC6Jov5eudei6J6q9Q2KRy4wuJdIvLFQ2x6u
 69TfeN8Vn7EawjwjpyIbFvLuHCzwtdvf6BMLXEkvJ6iPfxsIs0gFVD+rQzP0nSS7vMV/
 QPUTkW18Xk9OK1VOhhtauPcDrlOHkKndWsvaQxVBnbPHRnDW6DW2CYMpct+g3tg6faMS
 Nxfw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2CA0nnfpxvRJHlhs+NXwfi8bVZULtbp1vL+4SGpHHN6RH8ggDK0KkG4EC5R61bXoOFkf/KmEJPw==@nongnu.org
X-Gm-Message-State: AFuF++ndcaOsm6oNw1wWFwbBip2e9M1H+4IJZhjtFLDfBwqDZL2DeNdu
 Wn9plZQE885Z6mKpkwhhpT7rRKfALFl2OSYgaI5FGPZzkeofAqLXtmjU9ol6tFBiL0SUEZritVU
 Z3BypzmfCK5wXPSYKdipKszTNEkMikdONBxqrX1rKuaqLQqUB3nHkKU8=
X-Gm-Gg: AYBFou3Ufq5ee/u6FFi2dag9kMnYXtBYY4bSOLhGkckVHI2rS1whSI2BDYxOGfaslJ2
 ERExYc3fD2FLp3dJSk3kpemayLmDxqOWjDG/pk3EoFkdlVvFcHz+zhXwdRaL1Ju9+f/wZ89V6/M
 HGQ6FuTNkudl+EJI08C6ag8TVsW6yQ/P3WGAChzDh0X7Gj66/QQ8nuZE85QyiRyfoqJc22AIcKB
 qdAHQXaQ121HYA+wn7q8b5ENzKzVzu/jl3gOlt50CPwrmJn0N+Lbxvc/6In4twO9K7iN7uoeZXw
 ciTDBPYrb1KNYqfwXrTTNAxPnwcbs8LsbHx+YaWJQ/HYBjZxKYtacIbBweg95pI5054uqsfjzOu
 8k+kU6zCz9wImSDhhrZtWY4o7XLBEZNKNXx1qMkcdlHZYvBliNfWe+yxgD4LqPFmfIFlx
X-Received: by 2002:a05:6a20:c88f:b0:3d3:ad3c:49a7 with SMTP id
 adf61e73a8af0-3dd5f73f345mr161719637.21.1789505370756; 
 Tue, 15 Sep 2026 13:49:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:c88f:b0:3d3:ad3c:49a7 with SMTP id
 adf61e73a8af0-3dd5f73f345mr161548637.21.1789505369224; 
 Tue, 15 Sep 2026 13:49:29 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5a6a175sm1561983eec.9.2026.09.15.13.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 13:49:28 -0700 (PDT)
Message-ID: <3ae07e71-d806-4413-be16-1a793685e4dd@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 13:49:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] Revert "tests/tcg/meson.build: implement
 ./configure containers options"
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Kyle Evans <kevans@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
 <20260915201601.1207839-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915201601.1207839-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMwNCBTYWx0ZWRfXwrXX8YGmHha1
 cPB4l44lwfrcv2lce+uOqwqP58s/t/Tu4wLOSj04f2qff+yJP+NR4rJMqsDb6RZLAGU4TzszTMU
 5E5eI5q66meE7pQBm6ofMhT2g76CRBk=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa9af5b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-EKpmgBvVfop_6vUGXYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MDkD0A9b93q7iaOKwLcbXhvEL-U4cF6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMwNCBTYWx0ZWRfX2pZYg/gIVG1B
 800e00Gv6Gwjuk1h7n0d4ecVV2HC/St9LGNu0dL6jVVc9boEDxvR+4+Oa3kjIuOxgmG4LAIr9DK
 6o3ERuSvs2+SD4oKktADD18iholHzUcAh8TMzDvn9ESZP8mLQpImJW0sA56YjuJt6Op173jY2h0
 wIJX4vMJvTvwi5VdKjaX4g0U/DK+xK8438eDlBnEr1S7zO6Yj2cXZvK2bQoaeVQTtbV3Vjf8uX2
 oXG8uwO/ira7UryuWygen/HxGtbQFpExbqTp7SrDwmGPifxCCEt0+H3xX5cCJXbcNv++YB64HyZ
 JvYDOXwytpxnb19229GJ2SDYTwygad0D3C0y3kE7XfFbwhb1L2rWb2hngxva/EGNSvoM+qqXlUc
 nOA2lABIViBDi2SdLHtlf/8Z/SRB1gAEv+/7cGPPwlvM2x6Iob3/Je5AugFWm4F2OGE/AkCHWDJ
 yceUdCVrbY046spZ5Jw==
X-Proofpoint-GUID: MDkD0A9b93q7iaOKwLcbXhvEL-U4cF6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150304
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
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

On 9/15/2026 1:15 PM, Alex Bennée wrote:
> We want to keep the container configuration inside configure for the
> firmware builds.
> 
> This reverts commit 522b299ca4316d8cad57f9496ffcba87dcc20719.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> [AJB: untangle changes since]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure             | 11 ++++++++---
>  meson_options.txt     |  4 ----
>  tests/tcg/meson.build | 25 ++++---------------------
>  3 files changed, 12 insertions(+), 28 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

