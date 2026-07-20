Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370B7C4451B
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:30:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljNk-00009f-6g; Mon, 20 Jul 2026 04:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljNd-00008u-Vx
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:29:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljNc-00021v-Ia
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:29:41 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K87TpL2000771
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sS2DFJoDOAen5lutOa6h4WIVLuCPa/Bz/G7//rqLTD8=; b=GNz802/H2uKG19sB
 G1ZNcWtI6CFNgyBR2xyTnQXWtpBThopFKCWtlAgv8TF5hJC4wnJ9KkBKVDRWYdu7
 Zx6iXS+cBOx81AaO2f2AR9ToC47udJux4wjh74vprGX739V0CNIz07QqPbblzfr/
 sF//yZBQ8slPgKWBam2vTBwdgxFNkJMuq1mvwlmQnftEDtKi72T+7ZtpCV+UfpIl
 xZohOxQLaICTm+nymP8wQqrZnxpjeavyGHvYqvJIHLNMBwFizo8cetUbNy3NpbhN
 z4/HHKn9MiOj+GDEdCKjFYIbwvKLjNf6C5f6cqsd0s6dXmC2QFkqkIVb7iEXbfkf
 3Yub1w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxg2y2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:29:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8f0ed4fe79aso253625226d6.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784536178; x=1785140978; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sS2DFJoDOAen5lutOa6h4WIVLuCPa/Bz/G7//rqLTD8=;
 b=X2wynRkn3v/EDf8O65b52Bw/R5LqBFM5LIKZkStDJGU9ywVLVllxvbRpr9T+ySrS62
 9bV1a+6DzB/kWQ0UHFsC8mQIw7FremeDkAs7xyZxLg9GZAoMOmSwOOyx2rrnZXXRdamX
 sxrdmbX2RaxqOrL35sHpQus9SXVKyDSDhaXtJo+aznslWuBKvbQFKWjv3vXgtC4SRvw5
 fZZXQ6d1FuDSEUy1iHf02AXK5UtbZkA8VvwVhmYMarAfx/LcSWaxj5QqAxbu8NOG0glc
 ozoeBjoqY0vLAH3YCGvL65agAptHuDm2Rxd2xyQX2lzwPaFdYh1aOHkYZ7yXVmrN19rc
 Qjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784536178; x=1785140978;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sS2DFJoDOAen5lutOa6h4WIVLuCPa/Bz/G7//rqLTD8=;
 b=nt8XUhxeAO5ArMyX6TxWWh93LJIwgX7/I3RmV4toca6WjTS/Gu9QagZmbkTBileleb
 qfbE9KacTkEdvipZvz66vuOX5Ox+m9Zf7wt6IJPz07iUwiNXwLPJZ1/FVp43eOmdDdcl
 p+ZPyZuqYXMCjp972dWwcXNLo4ex6gjkZxN9dTJCr4JkGRTwx4OXR6zzpBqKawVla0Q/
 kxOke+TdHM5JFLsWzCNsDqe/Dl9cbQUD+ZjXX9+2Egczwr/8PLkiWG6slLtfxW6KApkq
 W8nB+FSTVWfLK0cU3iSKtYNi17WKN1NXxHHYVeG8+TPjYqDwYAoAsTP2f2vJ1K3fEhii
 FvGg==
X-Gm-Message-State: AOJu0Yzu4UM6Q/Jxj7hBi4E+PjgsDB5jN7+vjXLx1zwOShW1uzdekmRA
 4WachVhzwc0V5EWajoZUb84cSKHdquwfOX16eftIfMCaI5teOsk5fyP9c2cpZMnMXmEXJJ0rZFz
 cTEE/xzAlJ0xUtM7/yfU1nbVyiHtJTTS/LEZxLoEboorb5lY23FnHfNQ=
X-Gm-Gg: AfdE7cn8A9Mrqy3HNKGtfFmbxluvyAdH3gxV30lV2E+Drk+D62iP9ihLQ2ZoIo9Nwh3
 KRBvdC32aqcISHrbFkXuYxoI3FAfuzuEwVp/lM9yFjYpLSA1aJ1S8PVweLRgA9U9ziGU7ZxIhUQ
 vpnymbuq/9YZQEXzMEnE6OFZKTtNmjnim1qGqSfeXYVkW7AOKiBmMEt9yrlCnnrgV/1CpnBWcYc
 x4NuM20tfkE10G97cfVpc1kQc/UCC0qptuji70gew1IDiC1Aa2IVa6nAsWAOdVYkU8NKThTNRaR
 g56gPtY37mNGggCgLdQemLWcvRm7mgVTtXeEuoKEMhkXlFYKCtRw+lc15yIDX7W3+3h8gZOX6go
 shI5sbxg6gq26nDz6Y+scZelI0LvOHZa/VM6ZjewNkqXgmXJjcHM=
X-Received: by 2002:a05:622a:1e11:b0:51c:511:c5 with SMTP id
 d75a77b69052e-5213c8e2f6cmr130787921cf.16.1784536178315; 
 Mon, 20 Jul 2026 01:29:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1e11:b0:51c:511:c5 with SMTP id
 d75a77b69052e-5213c8e2f6cmr130787761cf.16.1784536177976; 
 Mon, 20 Jul 2026 01:29:37 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f69e5eff1sm19352499f8f.19.2026.07.20.01.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:29:37 -0700 (PDT)
Message-ID: <a8e58b3b-55f5-477b-86f4-d826d85aa544@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] target/arm: Imply probe from
 allocation_tag_mem_probe
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717232306.378988-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5ddc73 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfXxYszwr/1uNSe
 HWkUVNEV9jPmbn0RQyNZJWYfpjEqO9BjEkCLMRwto6WsvOCvbXL8QzT1U1WAqXkA+Ftxg3For2e
 afx3zdWwiwZkH8+m+RdZgMN790/m6kU=
X-Proofpoint-GUID: hCuyzhzwXSU-ZEQ0Ojr15e0maDvO_V_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfXyyz3Xsj5kB3D
 varSXLdkk81Xgo9behunBxZHbo+mpJE/DiEOU+2HOhG8wFAUrdZ1lK1biHYdh4UN77qSO4FGjrJ
 /Uevwu+RXk5iFGaBu9rTnqN18TFkaDtmiCQ+iD4L+9G7JG9NS8GHEiMTqunB6l1gKvdpR3htTQs
 9bDLIEHV+KaGNRDYprtolH/nuQWHoshBtbRyRhu8FiGDoPdcI+hU5YP0/E4T/LFFUbVypoluz1z
 yQ7ykbnSi6FgkHkByW0iXZfwCI/qu2jruYG9OtEyFzDTfQU6H/i3hGGTNRyuUa52u+LUDn3nXCP
 sZQ6s3zLw66OccMHrCa/hWhZT79h9J7MbhHoYMZBYhG47dWApV5549yvOmRGZSXq21u3g78k0Hk
 aSsSCBGQeAsnl/YJv+WXNlczcZMZPRKvmALQtHKk+ZzsN+AA5wv695JpeqCr0TXUrWG40H+2Cu9
 HmZ8DsC3Qg+FZLY11eQ==
X-Proofpoint-ORIG-GUID: hCuyzhzwXSU-ZEQ0Ojr15e0maDvO_V_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200093
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

On 18/7/26 01:22, Richard Henderson wrote:
> Rename current allocation_tag_mem_probe to
> allocation_tag_mem_internal, then create a new
> allocation_tag_mem_probe that lacks probe and ra arguments.
> Force those to true and 0 when passing off to _internal.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/mte_helper.h | 18 +++---------------
>   target/arm/gdbstub64.c      | 10 +++++-----
>   target/arm/tcg/mte_helper.c | 29 ++++++++++++++++++-----------
>   3 files changed, 26 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

