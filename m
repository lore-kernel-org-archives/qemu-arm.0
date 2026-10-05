Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09BCA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 11:20:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDgk1-00039Y-If; Mon, 05 Oct 2026 07:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDgjv-000376-Rr
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 07:20:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDgjt-0007ba-QS
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 07:20:15 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695Aoj1K2041843
 for <qemu-arm@nongnu.org>; Mon, 5 Oct 2026 11:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ic3zZ3wQ0msvUEy4lYFbiaHqySHXg6iWBFYX9r00yFw=; b=YEB7nrm+KdH4fkzt
 XfnUpdy6qdRuB4E3+0OtCA/1/+riOe7UKVl2gk+j8NcaxoeSGxfOpCXufY+wczQf
 Ggm6N82ExYRcy9PN5bO5+B2Hua6wdpOUiFMJr8fHMxx2Q8ZcfBN/FYZL7Tox0xac
 rbh2/FSOG7p49uXRdiKmhUNVTyZowgFDDxnTL+kfF1Cmt53oEaqcf0WrGrJhYvKk
 ETYj1QNr91dI3yhiI9WVIvObjgvKLMFUkNtX/i55q4/vG2mdizIT3YroP0nIVvUB
 8nAuCLT+Chc5GNUeQKcsLEjBZpFYBBtt2Qw/yltydT1lDxYpt84egaELQVFOU24D
 HGtQrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa5n9t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 11:20:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ca4a2b9c4so374535885a.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791199210; x=1791804010; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ic3zZ3wQ0msvUEy4lYFbiaHqySHXg6iWBFYX9r00yFw=;
 b=GPKQ7sVdab7hbFBjgcxm/PDMR29ausGgRrdtqmSHNcN25qWpHmV660YvlSYLOwqnMC
 gNKY1j8e0RWZq7S+UiExW4FipASeR3w3DKOkJ/4fqNLvOZoG58XKyQlOZljbYhYbz/dI
 E0GZIQ266VkBT5wW3P3DZLuiuinWC/2gSn/gqoc36bTEU9G43rLlfEi2qtL+f1dw6NRu
 aeqW44sdWeCqmIbcC9RWV+Be8zUyNtk7CX4I0uESl5C4yK5gfEzKM9vGQ0r33Nb7mJvc
 1uoZM9Pse2khW2gY0NRgBXe0bzWcsOFUecdHAVuNyaOkAsiFDhwT3Pex1Phb8NAW8gOP
 nySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791199210; x=1791804010;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ic3zZ3wQ0msvUEy4lYFbiaHqySHXg6iWBFYX9r00yFw=;
 b=DzzWAgs76H/LoEgwHsxppuHphYSLO/PET4HTQMV7D4xZ2MSwY1uZDrZHExW5ZQ5gTV
 riOrn14OcVe3gIBTWNKmzDHgQKXIUZXy2YFYUXFjJluAINq2lrgJJ0YzgSEo3dMM1/EH
 W2RxaxyZQsXL8HFQHYomYgBsNMtHQ/gh8TyxhYnkR59oVcophk4V8Nct8Gxt9IoVTPuN
 aY9KbWTUP0/wYlAqpa+ri4yzuNDaIK756uf4wukD2FGTNFnXyCXuRV3yinLfUltjIynd
 wj+qBKStmvd5UsDaL3krC6wcOXC/vhPNgbBgP+wDMrL07dcl3m6dd3lmDvUc/oREmX0B
 H7/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzrra3DPfa3TgvwRXBd9FW16yPJxtFNfbeS3DwLG79zNJAez+afNFhx464jLCK6YIaPQPSI2zmVAQ==@nongnu.org
X-Gm-Message-State: AFuF++kCcvq3X4v5FkNlbrISZQsSMUhRQ6k2WB00vW2zbTEypt+cYXeq
 67bVhetf45H++giW6JVI7mGOXlBCJ6wvV5LmDLswhDeQHKQIcKfuaS2EYBYcbB2lw9gYCFQ7ZFB
 Z0sH7GHkut0K9ql8c4hvFsF1z0U8x1MFzlSEApzRua3V3SEr4lbata0E=
X-Gm-Gg: AYBFou1U9FPQKEUayY940zE7IfCGy4nWFxnVP5XUNjty8vSIpNSQy63Belr5wK+Asg+
 U9HFXeJKDY3wqo5ZxDSCeuAPT2QhTGd6G0J+1qLLqUG2/83dg8InnyljApUySGyggNe50ujigBh
 PAUQcLV5oBo+5WDhVn1QjtEx5jm10EJCYYg8M+wLxgwtfz7Y7zOTRO/OKdRSR/zeqU3nsGxsM/a
 BdLZOmL0V8jXE5n/KZ42Lgd/EwGnbXYtZsj4IZENIEnuv7Yg+vs+ifU4PF8RTD1HpxD9Wap47qd
 yKC0seL+JE35AAlxfaLBPhfP4N3KeW0a+aPKbYls8c792Zcl3ukwQGJHSpuBAXOcPuWnkBQGYc6
 x8y+VWYC62lK9KwU/JyCCgEth2QipzbRKGw==
X-Received: by 2002:a05:620a:4690:b0:93c:6f66:bd07 with SMTP id
 af79cd13be357-93e50f811c8mr1252429585a.13.1791199209757; 
 Mon, 05 Oct 2026 04:20:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:93c:6f66:bd07 with SMTP id
 af79cd13be357-93e50f811c8mr1252425285a.13.1791199209236; 
 Mon, 05 Oct 2026 04:20:09 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027727cecsm344535785e9.9.2026.10.05.04.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 04:20:07 -0700 (PDT)
Message-ID: <0a3501c2-ffec-4cf6-8c19-4f166e30a4dc@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 13:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 60/63] hw/input/pl050: remove duplicate class_init
 assignment
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Pavee Hui <phui@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20261004-issue-4560-v1-0-ccbef537cbeb@redhat.com>
 <20261004-issue-4560-v1-60-ccbef537cbeb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261004-issue-4560-v1-60-ccbef537cbeb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NCBTYWx0ZWRfX6PO89iruul4m
 z+VXrhk+SrogSTkd8iwXSqmA118HIe89gdnM+C3IAJO7GPhTLTAQSRfcpYwVgUo3YvKgFfT/MVa
 71l2DKxDiiMpHCXcPBf9zxw4h85hx7TMr116skNMOEUt913R++Ex05BT/EftLM7KCAHHiNRTHex
 stfZdjIVpTck924u27ke7ZwqnkA+1vAM4FQdTfW9K5NHIVxaTm5ZyFCjkMMbDms+h7QzZEiWN7O
 mNIVvTd/5DXZiTCHtmpFEvhzcvzUTnvsjWdmZGa9DCrXQPk8Iw3HnGvwahxYwVbfReEwTzj73ld
 XxhmrJ6yDecbo/lNUvUQUx5D240R6UXjzQiNsmhUa0jD8awFxjRJS57n8oHMIcekPaiKVwnb5ZA
 ZgTTLaMJHQqLUihuDFXKnR61x0ycnM2Xp7TZDJlDCk9BwgpghkoL8Nbs9zivq8gEHsohFXHzGYD
 nqR4b88uzG8kD/bhZtg==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac387ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=1XWaLZrsAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=QIRNzdSv-Tx1t3xKm3cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GmbHVAtRTys5Bxby1k3G0QkPanYAeog6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NCBTYWx0ZWRfXwmx5Amqw1dp7
 1M9jF2GU1AwvXFErh1aOXHk349zU36TvHRR2/LDZytlf+tWiBL9nbFHSqFUC9Bhz6r5CvJ/lnzh
 2Xv7zl5UuUcLi5fBl96PMUn0FTyJmWI=
X-Proofpoint-GUID: GmbHVAtRTys5Bxby1k3G0QkPanYAeog6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050044
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/10/26 12:24, Marc-AndrÃ© Lureau wrote:
> The .class_init field was set twice in the TypeInfo struct.
> 
> Reported-by: Pavee Hui <phui@google.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes: 475a4d463b2 ("pl050: introduce PL050DeviceClass")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> ---
>   hw/input/pl050.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index 48df2734e269..3731e6969850 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -265,7 +265,6 @@ static const TypeInfo pl050_type_info = {
>       .class_init    = pl050_class_init,
>       .class_size    = sizeof(PL050DeviceClass),
>       .abstract      = true,
> -    .class_init    = pl050_class_init,
>   };
>   
>   static void pl050_register_types(void)
> 


