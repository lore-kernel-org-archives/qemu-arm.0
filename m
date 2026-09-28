Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A06C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:38:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7of-0001dn-Q6; Mon, 28 Sep 2026 05:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7o2-0001UJ-7V
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:37:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7nt-0006nC-9f
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:37:47 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MHS0546969
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MlvBsFyEWubQFFud7IHk68cuVghtUXPuKIXMpTJ/0NQ=; b=h0c/fFW3aYt9HUgv
 vYNlzrsMvXU/BjKcf+I8o9dYeOQqUDGqhBfL4q1PBg1RmU0x7/K6cQ5y45FvE3Hi
 bsZyfwVtJAYhl0tG0Btye9ay3c6NLkgrFuFp/lXgeWPX05z7btmzxqKO7Oww81m6
 /iTmzomOA1bEJj+BCRcd/lQRx5bP+0BKcscAF28QCuEPBLX/YPrYb802AHngLYVu
 Hmdi5qn87RoNGteEllRnBlvZcqDapgVgl+m2FWApHp8jxaooFvkYDAE5RbBtWpZ5
 LxHSvnHhHGF0KO40X8EaJH+Sfq/NRsY0Eiiipd9wZJoTwHEswbO00gWEbB30wMCj
 xNzZDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49u78-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:37:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93c5e9c2ec1so239951685a.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588263; x=1791193063; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MlvBsFyEWubQFFud7IHk68cuVghtUXPuKIXMpTJ/0NQ=;
 b=Gr0/EOQK3lYvfwJ5ahtyCO5whwR/O2hS1DUklN9E57HcJNy0d2J0Ju1ifo8NeLE7pp
 ltp83BDuRLOkRXYnzpMEM0q6ZSUXTzvhbT5jGInDJ/9h7XbWvroMcA6Q5bauCJosCPTb
 HvkYKstXUiP2+HQZM4Uu1JcpHO4aYj0o4CZ1rd4Y93bn5TlIRboHrWY1yw3xEZC4WjMM
 wlqCnhMU9lFvuBhJeS+4B9GCsYEeJhk5hXSMkPvzCG/Q+ffEPplRcy5wOfSA8S0aydkS
 IanyRFVS3MnCC6bC81KSJsKS5nBAjfYgeaGhWlNKYwCT0MvE4ZF9eFE45KzH0qTYycCp
 jgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588263; x=1791193063;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MlvBsFyEWubQFFud7IHk68cuVghtUXPuKIXMpTJ/0NQ=;
 b=PCFrv04ywFUhmDMaUAHixnexFCPgbAol0NFzkae3IqFyjc/LgpesINqoKLB0g1VzEn
 b4XWYMFgRaXxdUBBJ3Tx7ZuHwhjl0za4W8UL54JWmLe2mXB03SuL5bd0/dlWkoEpOlNQ
 UbVtJmnfaN2noMWD0BL5y8vusefv7lUbFmwMrq8uX9xWThI2gj99Vd/Wqlt0ih+kpKjk
 N5jsf3nUES5H/nF3QQRod/ih6Md9ihdikyEOw6v1Ui8e/BgZtkV0IzJwYxzTNzWuavN5
 Jt6lLwoU8kpiDrrtxcjXUK3COh03VGcp0tJps7245OC1B5nYEx6y33Aypumw7YLODhPK
 vsfw==
X-Gm-Message-State: AFuF++m7aXlLZwYhLVWB+dsBVJqgweFz0PNv8tObqej5FyMamGaTkUXJ
 IvVo0kgSdko/aO5A4ACzU5GGz2NgWNBpTeXdmJsHuzks13Yl/tSTU1aSQDeJA0QQOLC3mgMXoJW
 cCGOZqHYhNPvKrq7X4LFdaI0joC3uo3oXjGH+J2P5EdiNtnmWg2u37llmX2E87jI=
X-Gm-Gg: AYBFou3FIVpfJINFWtAxL9HybhGD/qIDWTc7Qr1EbJjDKujGmOYaJoBSHcyWCwGY2ae
 KVkyt5WdFRqFThk2HfXrQIyKuJmq+LzpXV6/F90dSJAUyu2JaX9pQHEhZqQf9OlkeubRvfN1uI+
 auwBZVhcXpz+iWy8Fn38J7H67/wlX7UloKuD0Pu/qdw7sexz/tLrRqXfSJyYphbFLKeX5HLwsto
 NETVa7dDF6Z/y1la6JaBdRLGdXqECUCmN6FkIY9E/CIgkYPDIRsuzpMN10Z8zl7DuQOnZt2OXpl
 yTf2Dlldmwba5jKilqiJXEJVXTeD2y21p9EdlxknHg5R9v6medQO+w9VDtREDl9L0oLznM8M1dB
 i6WSNWvFwd3OcI4J+hMiN4d2Ke4Tf+YVkFQ==
X-Received: by 2002:a05:620a:3190:b0:939:72cb:bae1 with SMTP id
 af79cd13be357-93c43d4e800mr1754388685a.24.1790588262634; 
 Mon, 28 Sep 2026 02:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:939:72cb:bae1 with SMTP id
 af79cd13be357-93c43d4e800mr1754385985a.24.1790588262177; 
 Mon, 28 Sep 2026 02:37:42 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00178174dsm119449545e9.10.2026.09.28.02.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:37:41 -0700 (PDT)
Message-ID: <8eac38a4-1cfe-4ee6-bbab-faff8d8a4268@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] target/arm: Add isar_feature_aa64_uinj
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cdlasRoeYguEsGj4IGpx3cLQOyNP4x3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXxhwiDvua4Kqa
 F8EgsPyUzgtviCWwSFMPP7+3hV2DjS96CJQZQI/Z0+xS9zCu43OHV6Vc4iWAmUO4Wu/ZXZrNHUX
 btU2iWIUHtUi76idvqA4+Y8X+xfNLkkj3zXpYohriFgBcAY5yoKySL5CqWU5tqKiCsYfS8kK+kh
 6MYOBtcP5vHcL2bQrcMPbuwMceHtat7oqI4eJNh3hvJae/oOYyQ0rn8kBNJ9UmSOFGLlCtJuxCF
 UoO3vaXMpbqLy1ZVyO7ahII5ZSaUEKGy6lTT7dgbjllL/tPZlhM2Fn4/f+QvUu5e0YCkzI1KPHt
 cX4UtVsvodKj9lY+mOLx3Kgc9uoLfJ/il2vGcROgNHBo0mASCmGvChvvzIOUaX7cBjfvYVGxUUn
 P7MedWnaATUBP0zwF763+w3uSKv8tVpVeak6bFIvGoQQSivRz79HeqH4GnJQscPqTW1C57SrsMz
 D5krisTeE+GTK8fmcKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfXwBpyeDq+u/w0
 rx3NOI4xkXfsYqKWKIe5W9VN8FbE9+x3JFjBcd6z1AFpYWqEGOfq46xlAAK9oSA5RgWj7Pr3oEl
 kLxWVB1kynrPu3+bINq6wMHmUMuNKw0=
X-Proofpoint-ORIG-GUID: cdlasRoeYguEsGj4IGpx3cLQOyNP4x3j
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba3567 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280038
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

On 25/9/26 23:49, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-features.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

