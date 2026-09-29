Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB2CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWnj-0001ah-KV; Tue, 29 Sep 2026 08:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWnS-0001UM-46
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:18:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWnP-000350-OO
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:18:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCEmMq4066640
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FIIxQY0DKkpd5d1Pu1aYAbPDsQs3swAKFb9g30h4g6c=; b=WgLbYV6v53NJaJWF
 NXYEO4c0DzEhJBVkbAckHXzZ2msHD9JeEEWIY/wAT9i1J8rEtJvFC8NwNirWe8gz
 CPtNvLj/q9IXzpa0l4XWDM3IBgQbQjF6ZjjZn/nZPzZQ+iJpe3UW+IxBjibwymBC
 s31N1r8GyJAg2YXrSXZ03ru1bVcbjAXbNxcVhwh0iGG1Vu+1j6Q7+02N2WaRYma8
 psenXnFQoWRF5r4bSEJrbxriGTIO3TbnPG+/lMXJhGQbp7UDEo2+zXFP0e8YulRt
 dJ5YT+hpRW4rf6WFDUj/84/KJmLMbHF2WIT89nm3cz7KvJOoJKVgVI+f0eWN5unz
 3Rr9Ug==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbxsk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:18:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7909e307799so3902120137.3
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684333; x=1791289133; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FIIxQY0DKkpd5d1Pu1aYAbPDsQs3swAKFb9g30h4g6c=;
 b=UZT3lGRmKwIlJqEbwTSAQM2Mr+/V95iuTB0Szr/rtT2padjHBNFcwxdtHZQYlSAT0y
 dqWG0IHmGa3izA0DZ2LdyQ3zQUTlTcMgf+8NHR+WClxnagiBpEA/bahoGagnGaA2oFLw
 OWghLDMap+5erTBVkSNqc+4/NlnZ7mKQck/re704m0+b5AqFwZJhYCv6r1Kys4tIxecG
 w8I0trC5Lp0CGahe6GLD9fR/w484FpploaOLayuT/vJDjdg3S2MAMeloiyKLT/OXP9jc
 hMgyPu+8Ef2FVA0H4Nn1rrp+wD0CewdYERaMyPw+ETSDQwU0rM67ASrQprdt+Y/6EHvE
 HJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684333; x=1791289133;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FIIxQY0DKkpd5d1Pu1aYAbPDsQs3swAKFb9g30h4g6c=;
 b=ZA8yT1hhoR5mXljtq5kRGMqdEaKv70BdIGtDUZZALyyAM+z4Gl9qELmTaWZC7BnFjr
 Y3HGZh+QUJaec9J4OZdYANBO/rCDPae78g/7KRQlhoQlCRc3aa37ue1BcngjkZxLXyo/
 BnkLCG215+s5ygtfKEOAVVs7kYMUjs9C30idnWTXSTkFtsEuHVc0bznWFPIapckTpdY7
 OBOuLxCCH/CXmFLde3Xu1l+aBqd/RrlT2hjupxQCxrS8jfdH1jUu/etFcK7DvaFpoZp2
 k6qMpToNXMY48Q20WUkETQXKggbdJ6dH1tqhdi0Cmln9lQcYx1C0rvh9eMzYSgxfD8pn
 MhUw==
X-Forwarded-Encrypted: i=1;
 AKwUvByGyT1FUE5WrtsI6YDzsOP75CBZnaBsnyREJ5ujqv4FWKriV+CLpfHdDzQU4721KepjDUrIDAMVqA==@nongnu.org
X-Gm-Message-State: AFq9FYIyTHn825CZsSRw6S3hyfDdm9ozOFJeV5ey09hcxN9V2MLrC1sy
 B9yF49QewrwglS6ff6bZnODSac9RN0NTUvl5b63HgfIbyQLX9xpwTZN30VrGdyPCql9RJ6tCnLW
 UXp6lhJtpKiny2I+pM8s7kxDWyLo/gRJjWTBnOIQHXomFjIJjviElOEg=
X-Gm-Gg: AYBFou3wkhtkzMEN45JOv9Ndkhm8qjGcJM0lT8a2hNK87xSU4X48Fr/krbKxNIsRYOB
 LCMqAOTdAN9eSLX9DrIggYW5dMy+L2yWkxNoMuTbqZggayDCrRvQ/LK9vzYgqDcBaw/pQY81JFh
 g5TYLotMe/F9UT/gJ+s8PX9PAxAvxAwSHZDJE57woNsJCMvGtC1TTinzwrrkw/bFOwO7Exwjsh4
 B6lz1i7AqzVo8966Quvujwe5WBQ6kyTEC5DUWpEYVhX4NHbt944IRUDdQptWKuRTh6OSdIoLN13
 dAyjOPFCb7OTgHmgCZBkpf8XDW2aUqBhZNvlaF2jEsfsr/mFNDfu15Acdzj9kYClPbWHb6TkRoL
 F+i+ZOWGDAuqJxsNx0TkSjgIKPHWm8cmLLA==
X-Received: by 2002:a05:6102:a4f:b0:7b3:4af0:976 with SMTP id
 ada2fe7eead31-7b34af062e2mr3433910137.21.1790684333275; 
 Tue, 29 Sep 2026 05:18:53 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:7b3:4af0:976 with SMTP id
 ada2fe7eead31-7b34af062e2mr3433896137.21.1790684332826; 
 Tue, 29 Sep 2026 05:18:52 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af502cd22sm3753000f8f.13.2026.09.29.05.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:18:52 -0700 (PDT)
Message-ID: <dbc93e3c-77da-449f-b7c9-83f54ce49016@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/42] hw/arm/Kconfig: Select missing UNIMP in config
 FSL_IMX8MM
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-19-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-19-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lFfJs8r9l-5b38xUT9Bf8ukjS0znYAaz
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbacae cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hGsxVD3Pt4E_wTTo8hUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX4SBb3dpUTkFK
 V87yeZyfpd94jbZvMcXJFPXjCL5jZj/nzL2d/vaMjPZb4hNp5G0RoIpNDb+bhs/H3cuI2IgzMWk
 4BxNsOXzqZUC2cbhpEaDlyG3Dtn6EMv96t/jn8afBL9clHYp20bquuD0RHzVCvtGUm9QpZ0249Z
 b/fiBOwir7k7dbn1XrFE7p9lYlaMS+AKmSr0XvUtJODWx3sFtoNDrzOZkMlkxRMNKAWklcNyvHv
 qlUXSoDh6xTCB+l+OW2dvXlXXtl4hksyivHSy18+WgvUaumXlFyKs3Ao0zXUBPSlz089CoA9GPn
 1swzaZXh4SnPH66nyS/1CZE7hSPOxM/OMuykL8Lzo5Pw2/Zqh3EKrpx9gxlGkEbKGA/Lb+lSlDk
 sqK1qCnFp+4SNSn1trKbzLlLm8MK9QUEdKTaOJMNpwjfljqGUH2FqdhtXQl+N2EKFfkhJZaXoyt
 CscWE3KcYtED8mIC3TA==
X-Proofpoint-GUID: lFfJs8r9l-5b38xUT9Bf8ukjS0znYAaz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX0Qq6s61CjPoV
 UtbhnZatnHA7KH8hGkX1LYWIWj8g13npGqH35RhsiW7mAJl4J3qXNj+y3JTfNjl6ebhTt3NeXC1
 rd2kurxDGNzC1b0DlLiK090U+O39sxg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290048
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> TYPE_FSL_IMX8MM models the whole address space by representing
> unimplemented devices with TYPE_UNIMPLEMENTED_DEVICE. This means that
> UNIMP needs to be selected by config FSL_IMX8MM which is currently
> missing. Fix that.
> 
> Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit) board")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

