Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540CFCD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 17:51:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQU1l-0004Tc-GG; Fri, 22 May 2026 13:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU1j-0004TM-V4
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:51:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wQU1i-0006tK-7g
 for qemu-arm@nongnu.org; Fri, 22 May 2026 13:51:15 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64MG1GgG1816063
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B6XtmqdU0ZnakdbJzlIeNZ46Ug0URjVcqmhHgjk+JYo=; b=eBk/0IbSrKWvY4zV
 HBW6ho0cpHpvh3bxRc0Y/Qr1JCMgBKGivWWqf/NcXg6NwTQwRWHRNXim2kCwiri1
 ASMn7q0KTiEKjFUX3MDaLdhxrfGUVERLmZmOScghJKY+CQZSRC3H8ZZ8jtevw1uR
 rzWhfbhfDTSnLZtu9cVXmA2UaL4o47onNWYib6LXJ/B9XBKOldesHR4CkK4C7oLT
 HSUlL+sQcq7uZkg5ztmI7Qhja6if4uw8S3fi75ulbB3n37a+CE6LYd92TUuwtH53
 I9bC9mPXoQgMAovCYzADehK1nB4W3Y01XDyP+iZzLVVUhW1Gd04ZZsBJC8usDVDe
 TM9jDg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm37a4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 17:51:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2ef37c3f773so7900671eec.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779472271; x=1780077071; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6XtmqdU0ZnakdbJzlIeNZ46Ug0URjVcqmhHgjk+JYo=;
 b=XLvB+sIZ3x3aVrgyhYJ5pUP3ThE7Eag2w+48QRegObwnl6rCOXeA6HaX1pq3oS3Ch5
 Z4SJOhZiDVtxmYzlcKRpU+WT75Ag0r4IrhlRsceztV/PwlqlBb1vVzwG7a2c1wh+69Lx
 SVN1zBGUQOssydknYLPV3um7WKPx4z7oQ/htyovK5wgZ/PkF+sG/bkmdaP0BBGaL/Gvx
 hfxf7z8nGeaHiFNbUKZBeI3jNlqDIYl0b0wx2mn0PdF6vgdvPHleMdVxsOASxaQN4xmf
 Qeg1tPBkLtFzdDtpGKnhEkigAEj3o82wr6j2rf7K+yRmYup34qng8OqDMIOCNSei4SRl
 edQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779472271; x=1780077071;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B6XtmqdU0ZnakdbJzlIeNZ46Ug0URjVcqmhHgjk+JYo=;
 b=Kh+taG5/HYbOcDsYq5eD68+hawPo1x3ftsmzM/DVAOlcFhok9GT84/jG9s8FY3AGUg
 WXhZBufRGrjXjmttsQ5EqBomWwXKv5AsZ5zj84Ukv+w5MGKU2QGZ8oBP7SZN6009HKjN
 Gfv0o44bZMEtNFVjNTXugd2IkxKB1iWrzUeHKlpqqpZSafmfk5DhwVvr4MaDAu7HANMB
 KDgCDq+3ugbgFhZUPOF8W/vaSz/tHjfZ1MJ+C30xOXpwUJ4Co6XkiCtdyFH8NZ+gmXcG
 8np4hvrrQIRKbE49uX/lw2RJ41LegfzCA8sWUThD+1LWp7HEarwzQGtyTORdeI/5y1Yn
 jxCg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LyMW0pLHlp0opI7OB+iNAWOm9RXPcR8OadiLW268EhIhJwU9iRE+RbX0WR4rSRpNI9ywb29mp9w==@nongnu.org
X-Gm-Message-State: AOJu0YyyAHAYB0ELiiohJtoAbqRtt2MGRAgEWQPEt0mZviBaMGAvEQfe
 eE77i+dKNsRuDFf00Y3Z8o0pnqwwqCiWXWLAP16SGeeMiflmsR6Hg6CW21Fvmob9+A8Dgao3o8W
 TeL4YT2hu2BVcB7bCSpqZbpU1yMPhv3wehn13sk5tnEtIQDvJb8Pe0ZA=
X-Gm-Gg: Acq92OF1DUJZr0uSDRCSbbmZk2vibH9dLPH5jL3ZbQ2HLkNhXUXkkrdWEP182i8bcbG
 DdDdkD+aG/hgBX53TbAmqqUePedkTYu+SwhroSHaZT01v31EPeEbXQSrxMHfw6kW/vqzvSMP5zm
 orRJfRBcuY3EHdriijd5+3mR5st8/8pcuawoj74mAOHRVQQ6U7WrDGJs+9XCxC8w2sM1xhl9JgO
 mfBmaEvCkcxAFMs8WIVaydZKTX3wVOWAw3GgmYaBUGmy7IxDVDUo52aZGyN4jv+eC0AsNUZdxpX
 tVn+JyxnG12bwtQmpBcN6jcAuLadJjWTkycAJFTrYmym3OO1f6l88+OhHXxl5+fuOk5YzuvTkOD
 ahiGOAFWLHwN+xeDCK/RiLbDXOTv4aXsn9sZgdKHh9UOArNNaqSGaUy1lzAWGxaACm0rDpewSXq
 tB253I2scWtkC01Q==
X-Received: by 2002:a05:7300:e8ae:b0:2e2:9c65:ef6c with SMTP id
 5a478bee46e88-30448fd620fmr2259619eec.4.1779472270777; 
 Fri, 22 May 2026 10:51:10 -0700 (PDT)
X-Received: by 2002:a05:7300:e8ae:b0:2e2:9c65:ef6c with SMTP id
 5a478bee46e88-30448fd620fmr2259605eec.4.1779472270206; 
 Fri, 22 May 2026 10:51:10 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20ddbsm1467675eec.11.2026.05.22.10.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 10:51:09 -0700 (PDT)
Message-ID: <f6b1ab68-8d21-4224-896b-dda140f89907@oss.qualcomm.com>
Date: Fri, 22 May 2026 10:51:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] tests/Makefile.include: fix typo in comment
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20260521131739.540157-1-alex.bennee@linaro.org>
 <20260521131739.540157-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260521131739.540157-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9gYGmagd371yqCaUO0iM3wa3TJeRLVnR
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a10978f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lOGKEWSEe5e9jjuMITAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=h1q6ZXiXV6sA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NyBTYWx0ZWRfX1WjSa1Z+UEZx
 c4xLssReozgkxyT5y8a+ZN8dGnpyWjuklFHCQGhHzzcJYrjUtLhd04/UMR5FSlRUbrjesK2kUHg
 86Avg6qzM4aQ9YfdhFOEQ0jCw0eHqCfiuA/o1jh1tlTUG/YaIqkNizdgIou9gw1x5yIPCLq5mgh
 sSq54UHA/dCXcm9vUHB4foMhl9IqYePUyfbTqQv/oxnsy+aTngWknNmlOwRJ695mPx8uwxH18oC
 Iwc1Gk2AA8oZxuZ+DZllGHeon7Y+8Fu7DfISyI+1nh1s/aUvSnqOr5TqyjeRj0sFzd1VFgZuNx7
 Fb72gRJy5NvcvnhxZ9M4dOKrICzGrfn6HKpz7E/CEiBDFZk2LskRYDshe8v0Z4NyooKTeowhJCf
 OCyn+p/pOkbyMfeEHtEpp3nSsDYUYaSR0SiOvh8sdc6lIaxUiSFLSgWYx1R4Wuvjg+x/pfJsZ6F
 DweWoa5EL091hnNfuGw==
X-Proofpoint-GUID: 9gYGmagd371yqCaUO0iM3wa3TJeRLVnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220177
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/21/2026 6:17 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

