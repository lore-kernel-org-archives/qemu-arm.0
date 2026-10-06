Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1889ACA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:19:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMrb-0005kA-Q6; Wed, 07 Oct 2026 04:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEH6N-0001db-RK
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:10:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEH68-0005NY-5G
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:09:40 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6966eFHH2834263
 for <qemu-arm@nongnu.org>; Tue, 6 Oct 2026 09:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 52nP0BOAav5p1wTWpyqMlxWLS+x1vw16L0c9WvcWI9M=; b=J65Ius3XYU31qca2
 qcGd22/0Oyto6RByWCKG7mjAJpqRJuN+A7YhbWaKYcuKqOCxKW5547IBCp2cW8Pu
 Na1JEAEklmL+9BUIc8+cxUd4elF3l9y3gZW9eWjjeBvQTfVBlY342NIfrnlc3iBx
 kQL9LBbzD57+qYor35lyqZqpRKdI8+wp7jb5njXLbODFs9q6E7+fhXts0TG6Hv5H
 cyo/zElGJ7u4/AUWVTOXuy+wlI0O8hlUbDAgFd3i/CO7/TsVTSqCIz7JIJyejc8B
 MFZwV6dYlH0lYKqNeZ5Wb37koCQBZE+KR9s5vHF8jupa3NOL+Ra8KetI+g5+6Yt9
 UGmq+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnckuc1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 09:28:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93909014c85so409472285a.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791278910; x=1791883710; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=52nP0BOAav5p1wTWpyqMlxWLS+x1vw16L0c9WvcWI9M=;
 b=D4Kley4UwdzlZQJixoQJMJDTJ5wKD9FhptQNsDOTOMMaZlrKKTfSv+hwVHQ+sMv1zO
 KfTXoqIiqeLoixueCw/1/LYItbGZwqyvnj4DeB5kGF95koeFLEQ02oljklL4dpcDKRDR
 DsxYti10MFPbwEhyxUh3MqeCknraIZ69l8xFnuQE3E2hUhyHHZXDS4c22Yxqyf8OQu8n
 Brfk++671yW5kkjetxUmOKYMIWTDYNiEace3E6YPutAHlNWEOBa3IDPb9ANCePiBP8/F
 M2ahGg6/LSCgb4A7ytk8dvlimyR9uZ30fU9RlO8tj/CWouJadJ/HgX9me+6swojRNIRf
 Y88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791278910; x=1791883710;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=52nP0BOAav5p1wTWpyqMlxWLS+x1vw16L0c9WvcWI9M=;
 b=xBuO2X+rdnBQzzPSS2jGSbvy/MVoeAWmeg3K+89HwrjRkKrYBg1OBMcrCvoxTeTwdv
 ydn9qiZzbqcYJpjRrVN3TKfnpyG8SWDKJ9yhBmyaFWvJ990bQiF5bxJMM7onAUeXQZLc
 i3M3lcD1JmbIJGWslE6wuG7/ASsfiJM5ZrrXlARHc6sXSx54Z4WOJRP+tAvo5eKS9N7i
 tR1r9eHQxlGjxLWXopI8X9N5YhNiDzhjPqXe3jy0Qe9zVjNZ0Nos6sX5AcM8sFCPFF75
 +Mczpf2GlIYl2IHW1KzKuek1zVpIyME5d3yFppesX0eO8AqyTrFJMdY2IRVQ9xclWeUp
 26Sg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwUzQW6EN9/FQr90L31tY664tVqBuMT190288fENrWRLVoPGWkr+HpBtnRtDfNdt9wvAVLVdufWOQ==@nongnu.org
X-Gm-Message-State: AFuF++mZcdq+hGs7htWFwftx09klu7h/LZIOA8WoqXtNl3nOqJF2HFRA
 7WHZ/++Ai+v1owCeJwnw/89DwjhqdC1vm4y2U0JS3hepvaqnXP1jdM7F/t24vUBL8SvdtNztIYy
 rvOEMU58wBE3Hn9ABqxVvZOz8okl4FXQy0ATi4+833sWpm8FERzAFdlU=
X-Gm-Gg: AYBFou1iS+KbDH1YLctjHRA/TPGNX59LTK+lu8vbPQw/r9bTIACi7QW5iKtpfO9WRLF
 ewZgGFhUEZVcYD1Xv8RJ/eB6gkCEJhHWn9caxC0UgIvxnKOuiCcwOnzY4CvAAJ46gFrTRFXYRnn
 oq3jyCfSV9ZyUlV9ZR9Gq1WAToemHL/oYgToWiyXaPRyQsJTJaiU3vRy4q5cUdydxW1ac7nwRlt
 gH08yFxy1VejPZGFmok5VOgYPbBlkAAIOfcn3j6vgNoefv6FMBDY/z6PDQF+5WNaOQ/PRuEgfgf
 j+7TTI8SjtF/yI5tbGjZ3f7knbhSLnxxfE9hQQSmqDZdDsDl1hxnatomszi/o46HbfZ9fIcdk3v
 CTowHXMe+GgsdDXuXhGAOjeBXFkXS1hpzVA==
X-Received: by 2002:a05:620a:269b:b0:93c:5152:8775 with SMTP id
 af79cd13be357-93e8f0592cbmr137729085a.3.1791278909374; 
 Tue, 06 Oct 2026 02:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:93c:5152:8775 with SMTP id
 af79cd13be357-93e8f0592cbmr137725485a.3.1791278908901; 
 Tue, 06 Oct 2026 02:28:28 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c50f54sm54416385e9.10.2026.10.06.02.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 02:28:28 -0700 (PDT)
Message-ID: <843c6a28-df55-4df9-a29f-7951925a4303@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 11:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/31] Kconfig: Extract config FSL_IMX7_SNVS from
 config IMX
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-24-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261006083445.30362-24-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX2jif4oHPP377
 1Fp3hpIyE83j+Z6fO4XpCz48Wmf7cNOnDgIt1ZAg3efl5VQc6IsDZVhI+a8KIRsrzcePXc9abXd
 QVbZvG3t0+qJdlCvP4+eCDVrVWcyn6s=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac4bf3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=FRSEYCzRAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hB8EK7K3M6JkGnyv8YgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-GUID: GfzAX3YSnQui4V4U8WDom5NdRwsai4R6
X-Proofpoint-ORIG-GUID: GfzAX3YSnQui4V4U8WDom5NdRwsai4R6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX7B7DiiWrSTLC
 KhBAsOYMxxMMKahGhytzBmWTLZ/4xgnPwIWItxNXZnBWjDb8XTdnm5Spiog7jOYAwV1VTQRhlSY
 +6vEpyvDrqhGnhTdra//b7ejQeRoCWoa2gUOfJgKaH6rSK87mz2FaK6y54c9y8R3SX7rdDZ4Dg+
 BGXhKLIkyaUjxCkSAEAwXhbVN3/+unPS7STjY4iEw14q0k4BWJ/AS9IsAtTV3+5TaaS25ADI5N5
 HhrAoysPratNg9wDgjRep2NXTppQpndUXB6CWM545opWbGOxasqmO2VM8vvBVRQhrtMYMi15LGv
 C8Z43dGhv6vRciXdDOsayjsnjQarjdl5V0NSUZImDKEKoZ3Vi/CJthOEUwI86SKyczQtfZlcHkq
 SZM8365WICsJfnC2lGgHXfRhyb2bjOtdrHvO52+KdEcsb3IYDT9iHvom3lOJdvnP8DrC2te92xh
 BIUdvjqLHEYh2kR/TIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037
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

On 6/10/26 10:34, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config FSL_IMX7_SNVS to eventually eliminate config IMX.
> 
> Reviewed-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig      | 5 +++++
>   hw/misc/Kconfig     | 3 +++
>   hw/misc/meson.build | 2 +-
>   3 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

