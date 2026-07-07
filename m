Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADF7C43602
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:27:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh25k-00049K-Qu; Tue, 07 Jul 2026 05:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh25j-000498-H5
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:27:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh25h-00069V-Vs
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:27:47 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678DnQf3205863
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1mw9fziuvY+i1n9PBqkd3l3Av/XCqrdSX1isoJQ8am0=; b=X9SumCKV73U41inl
 RDeX5/VOqc9u4WfchqjqPrVnx6BJff+5vN/MI+oO30F4E2V6DVHfogcliYVLW91M
 awppJjk+xZ1Kk2X8sptd2NXiRU4E621eV6ieeZ74+WWlKbbIzVCyv72iyIsZCOXz
 6eJFO4m1ZZcdi4Dz2CC2UVQYX2r4cYrV7OFWFtbGFMWvl787tZ3GQuCQRkS70GYT
 bON7tcavTQO2XzMMzIWNu+gxh0eefTC1lcQWLst5ibBuif9VLZWujJPPyhlyiudC
 ZKecJ9U0ikqz62raYqq273PNT5/g5MbfC9Fbx2Cd23Xd6osVEm6Xxd61374yWWcV
 /YxMGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3md8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 09:27:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8fc6b670b4bso15465516d6.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783416464; x=1784021264; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1mw9fziuvY+i1n9PBqkd3l3Av/XCqrdSX1isoJQ8am0=;
 b=Yc3zPe6Yn3WT7na+Q/fZ9MWyFPXVV8q2VWgtBx1LoeKMh21UQNogzBA7otszSL39sZ
 rw43k8lQa8Gwh8yRyCgO0xbi1jq2hCxS24cbeEMF483b/ccPHLj2JQt+7taayruL4WdA
 29zrIhOesXhmAprPVp2BmOi/70tuEq/SJpA00tuQm27z6bQ5Y2WFShaZ/uRq4Hd1xvvy
 1HzGbdi9endJ1WSD8vJk40zE5t4kTVwQ7Tg08QAfQuLfYl2uVfp037TBXSORqtA36IWY
 G/L861KI/hGgVFdOZyZTmCMYr0QwlB8k0Ne14dgBusqTKhkter1cCPpSDAFNxxrRvv5u
 BOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783416464; x=1784021264;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1mw9fziuvY+i1n9PBqkd3l3Av/XCqrdSX1isoJQ8am0=;
 b=PyZFeBYvG/R92RRnAQzk6k490iBo7V/mfsLI1hy7O8XdZJQFBlfWCttUaaJ6bbDHri
 xptp2ATYZar1ZmsRp15/b8h9V+JkRtwN65PHI+I7XEJsW2+ePLM540U3Q8DcC87mYbyL
 +EPjgtiAHC+Ra8DzQ6jfh4zUjGXWSw7ekyPiWiw5A4tcYAMFevbkB85N/cWQo8VYpWGI
 KS+vOVvGIQcySciT8jdlIEvhNYt2ROCdkTjLxA4F2F59dCHecbLjY5w49govkpQe6sGf
 C+eB3Fb2ao9gagtoWyE7hcLFUFXRFuy7lFNRlucfIV9xPXiktz3gP/QfoAoWTUltC8xL
 ymLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcEhoCgu8HmA3xLEZfNvNTr7Dl64OTS9KPmIDR0/+FIEMd99y229OZK8RLMI1aJF3K3+FICjsC/A==@nongnu.org
X-Gm-Message-State: AOJu0YwhdABuJfSOyWQIOs2VeMEJx48Ijc8mTAYvQA9hHhw6qMS1VpQw
 wqkGsIJJKbirNxYaJMeO5++eF+rdsmsPYVNKwGWeISoN7qEgdeQ431XTMQsLHNPwmvyv9kOgSpb
 iFjwsLQXyPEWGo2mj3hL7i3rMntgz0k1a32QyrDMrMYvQisnMF/KNGbo=
X-Gm-Gg: AfdE7ckRG/KLpGxl6Ar4Kpf/98nyItT7khTUg79uTZXKCHgsBsehhCVjhbi1rioVye/
 2s7OyUu7cE8QxT7yDraiUMxdlAEB/MNuCN5DBdrY38QEf2pK3gteCH2ydsXX6nHvuhtyF7C6WcE
 Ely2sqQC/nSLSmqU2C3+lm4sYkGaTMCAATxmvAMjwApPXdqynZ0piZqAG5RB6WVKF/ZVNWKtmmD
 mbfnD/oSR1NFINFfHbCTUM7KB/zETQ5HoLiNILa5HsKbd4sTu5ZiWBKJgXNQvJLbgouM0FB5hq1
 TChOwaIYsRRdQmDkNLF7TO2URL2VQ/+NaqyILrkUoJ1P3dAmZtX3gGCmwIwQnuhhXJcruO7UWne
 6y52SOwgiKfemvZxBv8/Krue3fClMR9lSezQ+33IS0B04HbSTP1dC6yawP6enEA==
X-Received: by 2002:a05:622a:453:b0:51c:2685:2952 with SMTP id
 d75a77b69052e-51c7487ff4dmr46542201cf.62.1783416463382; 
 Tue, 07 Jul 2026 02:27:43 -0700 (PDT)
X-Received: by 2002:a05:622a:453:b0:51c:2685:2952 with SMTP id
 d75a77b69052e-51c7487ff4dmr46541951cf.62.1783416462757; 
 Tue, 07 Jul 2026 02:27:42 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19dbef44sm5568723a12.31.2026.07.07.02.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:27:41 -0700 (PDT)
Message-ID: <9574ad25-c47c-46f2-8ccc-7c4b811c1cc7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] hw/misc/aspeed_scu: Introduce Aspeed2700SCUState
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
 <20260707060919.350637-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX3JAc6xK7YUVD
 8v/diDJd587fYv7ew/EpTbwqQ+VoxL706UcTPAnp7uSVKTg/N9CDb0ARvVt+T8vnUX3f6a1T+aO
 H2OfhHI2Wa+OurBA/k74mxewAZKEqyI=
X-Proofpoint-ORIG-GUID: v7-SKyG39eb6nOJmw_MdLfImm8l4g2G3
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cc690 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX9BS+S5pWLGwO
 kXxstRyI43MFYMFlr6jo5ooLnv4k7qPgkApKlPmpHupMeB0cabRzPNvpdWVdJFhO4Gg1MRm/+cF
 N+Fll/rlKOwajiAmcIIt9ubpI+jUAu+RMtBHBPAmyizisGSVn3U9GFFq5asJoqodwzmGHkYjCNz
 q+DO2CHfI1S/6gsF1QeI0YMrGEk1OqLPC7eD8u26fezGj2b9XuO8j03SOm+15u5w5XjwOr6/kyt
 ejdAgIPGeRvq5IXLRYr5pshMkJ3snGYOfODFAn1e/ourB53uXnppuiKCOtsg8QX+tz90gGBhFwu
 HyIFZyfLXKaq2k6BG8KqbMKhjpKtl1H1gpCR3GHJy0ak9wDwLTG03NNN+9GSqygAxZdPqDftbni
 d6Z1ZFJ7HKnsPWCOcSAli3wh2otGj/NlklXFKfPwnciONc3yzTt+Vj3Ak2ToUstoh2Nlx2klnIg
 GGq7eN5CKuuHGldr1FQ==
X-Proofpoint-GUID: v7-SKyG39eb6nOJmw_MdLfImm8l4g2G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070091
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

On 7/7/26 08:09, Jamin Lin wrote:
> Introduce Aspeed2700SCUState as an AST2700-specific subclass of
> AspeedSCUState.
> 
> Currently, AST1700 and AST2700 reuse the generic AspeedSCUState.
> However, AST2700 requires SCU functionality that is specific to the
> platform, particularly for interactions with its coprocessors.
> 
> Introduce a dedicated Aspeed2700SCUState to provide an extension point
> for AST2700-specific functionality while keeping the generic
> AspeedSCUState unchanged.
> 
> Subsequent patches will migrate AST2700 users to the new subclass and
> move AST2700-specific code into it.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/misc/aspeed_scu.h | 5 +++++
>   hw/misc/aspeed_scu.c         | 8 +++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

