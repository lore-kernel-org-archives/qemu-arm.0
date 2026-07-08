Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C5DC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 23:00:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whbFG-0001EL-M0; Wed, 08 Jul 2026 18:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whbFF-0001Dd-2A
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 18:59:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whbFD-0001E7-Fx
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 18:59:56 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668KtOnb3990620
 for <qemu-arm@nongnu.org>; Wed, 8 Jul 2026 22:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 clU9kC8b8erhmj+alIKj9MA0iQnWxmEXLf8F/F5FAuM=; b=eDYeD0b1YLeV8phI
 Tpku/2Dri/YfT40NPZwLGNK90XQtQXcp3Kdn5c4o0204YS/TX9tl9cMklliTAb1W
 mzZj5UiZH56WAt7ybKtIgAjx/xnvzeeYLC02NuDwioyoCBthGFXplo9aMMPXa2JW
 p3yKocRgpZsH1EXy0X3CvlNNc5sXu1xaHHVGv2LeVW5t8IHs0VgUvI72Q//48zye
 JhcirgtXQ0Z7jWi1z2SmP+4RhLK/rPaZiCa7la1vwxPF6n+BhxMtiB92bi/5fQ0C
 vsUxJQ/pJ+KMZjney9paunpzonXKPVzQPx1tzLXbcm051u5hM852jXoy74TaK8Vt
 GI0G9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vrqxf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 22:59:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c01ff996dso12120131cf.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 15:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783551593; x=1784156393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=clU9kC8b8erhmj+alIKj9MA0iQnWxmEXLf8F/F5FAuM=;
 b=kcBM7sPasBtEIZdoQQ9pVRreI4PSnStJHBPg1swW21vKsfs8OPRixWhxzJnVrYWvkS
 dlaQhxTkSxGbfH46gk8k+3iKkCtP5mYkOenmLydj5U9iRrL8QGJsPU0Wzdz4rj/Gtt/l
 G8XnLeffJdYOeQEbBIBfoIazAdMiC/lMBVtMviVtYF1xSonm/sw2v81ABwavm7iPfidj
 I8562nPwStm/ibTrJo1AyqqD/GGxOfeQs4ZmvMVB7o3Pc2B16EIWAMmme4Ov0EJ1VX1A
 kz4yRlLl6BbVIyzrQC8QYSDFqJp5ydlMKqyXji69J0Ha7O2StyJDkZ+dTJB4FSfGgv28
 7dcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783551593; x=1784156393;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=clU9kC8b8erhmj+alIKj9MA0iQnWxmEXLf8F/F5FAuM=;
 b=puJUeazlzwOIGVj5vK3wINXDNYEK8J7IHT2L3waV8QnlfpX8tvdB/KpmMiHcZCm8tw
 6a3ObJsBnIvsDdasLhVgm+QBG6+M0eFa94CiiANkIorLASy7Sl8ofotlCOLAwtLa49wd
 LfN9YBOGFVRtuYzHZQc8JbQMy3sJoP/1z9pzJoE9t3SkmnmVFpKooCuIwjEYXIvxRqvh
 1MmzyrX8mqWCEqouG9vXNVl206t2p/nfcbvQDm2o+leAe0g60ohNAJ05+oJ5THZ6zpKI
 MsEU2peTVw4iqfQvqXddcdrIr9yQzltF1T2tSI1o7U/Eyk+eMs9KQ/tKsexrwFRDdShy
 ANGw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrt2QGUIVyNdikVr+RItHgu8NF+0PjHotnutREIrdqDQclPuCulWKrtIY3FFZck0GQGEsI8Xp0KCw==@nongnu.org
X-Gm-Message-State: AOJu0Yy1RVGw3Jj/4tUaA+ZFsRVok497HwBCBf0DwroHJnNDyyZhvbRF
 J9gRVf1aBSNlQsso6afJCMGs5sJcVqPFPxsyWwKGZ0fU2CcIjKfsNS4eqREl7baSLpbXBgkZDI3
 x2xR9hd2AewQVa93dceHwnWMFeWLrh/YzNS2oXGb11Jn1NnnZDpPjIGc=
X-Gm-Gg: AfdE7cn1KpaEmIa3HYgyUDYePf50UdSPCDdxO/f2fhGUHuNEZR9c5aNl/c0YleB1cXe
 8rZRwUB8+J0dbHASOeeIYY+9sR/+b58JRllG6AEWMxlcMX0FDBYGbhlrhl+7zsLbYt9ZyiFkDpD
 MKD+2/NwsVI4fDtc2NyGK1gsYprCYS60sPtj7oilrHXm9zzBbwqt8QijtYw6kc7Gvo5EYsFsOJD
 H8otwXT6gRKGqK5EZ3HFlYXYS0a7cCWhwPGnfebBT7AEaG8fnq6iK79rqsV251bjHmgThW1yxP5
 x/RuZz1BK8qIX5iadtxqXJVwaDdxp7P/robLYSzOpDTyRmAL/cHeEhRtuLiwMwJI2K4g6pzpord
 MhJatsFE6vEQM+UtsF/NSlaU+2UK6OF9QQ0ROyCD21X4B8McJltU4ZCL5RxnvRw==
X-Received: by 2002:ac8:7e8d:0:b0:517:5e32:af1e with SMTP id
 d75a77b69052e-51c8b2d54bdmr57548581cf.8.1783551592918; 
 Wed, 08 Jul 2026 15:59:52 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:517:5e32:af1e with SMTP id
 d75a77b69052e-51c8b2d54bdmr57548201cf.8.1783551592493; 
 Wed, 08 Jul 2026 15:59:52 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb74835esm15699375e9.14.2026.07.08.15.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 15:59:51 -0700 (PDT)
Message-ID: <c7963a97-8e5a-4c01-ba31-45ce48091270@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 00:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Refactor AST2700 SCU preparation for coprocessors
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EJx5_48mlIiAEEwRDmMXPIbXwrMNvu1I
X-Proofpoint-ORIG-GUID: EJx5_48mlIiAEEwRDmMXPIbXwrMNvu1I
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4ed669 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDIyNiBTYWx0ZWRfX0MV4gFuBZdYX
 hLTSMgKuw6yxVTvSmr7fbVYEMSFDbts6fwot4g+GzwviBIWv3pSqNMs3hwYCQECZz9DBORwaxlG
 /0bA2EUGXkCheudzAzLFhsqP7IU5auQrNOfvXmQGcWQYrEOJVjRJbcwQ3SPp/omBC7H/P6snQny
 BLEnORUzz+SSEs41h6bfK5+wT+bNJRq9KQc3C7Mvey83GkDZCDaubuWT6ekLSvv349u5f6ebR/U
 WQ1AYpjjqna7+AzsG4YheRHZxJ0vQKNL541nvMEYpHPaPkDtU73FGJ5FJ6hQqmUfrm093VERQC2
 cVanNztpned9Pz0uQhFp9AlFjyANEafE9Gp8JkF0ksZFwVJuODLMZSAuyzee0Lj7CMQGPz3zs0c
 H0mNVXgg60FEZ/QSMmW/s+4dl03zzrovVloKbuBoNvi6Ky0UrQm4NkSy7z9BmzAO3h0f0U0L8wG
 xuwlBAKkpKKEfIZWb4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDIyNiBTYWx0ZWRfX3Ejb71ppDS+e
 F94ku/YMOkrtjUn0SJv51uLAMKVbu+AMqcdApYHt1isQD9Wfb/BK1j3P4y831FpXzSrM8plH5T2
 mVTrxOR2vyVAx0hGg3lggDoLdvwMyXw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_04,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080226
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

On 7/7/26 08:09, Jamin Lin wrote:
> The original AST2700 FC support series [1] is fairly large, making it
> difficult to review all changes together.


> Jamin Lin (8):
>    hw/misc/aspeed_scu: Introduce Aspeed2700SCUState
>    hw/arm/aspeed: Use Aspeed2700SCUState for AST2700 users
>    hw/arm/aspeed_ast27x0: Move SCU link into AST27x0 coprocessors
>    hw/misc/aspeed_scu: Add separate reset handler for AST2700 SCUIO
>    hw/arm/aspeed_ast27x0: Pass realized PSP SoC to SSP/TSP initialization
>    hw/arm/ast27x0: Share single SCUIO instance across PSP, SSP, and TSP
>    hw/arm/ast27x0: Share FMC controller with SSP and TSP
>    hw/ssi/aspeed_smc: Add Data FIFO-based flash access support for
>      AST2700

Series:
Tested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

