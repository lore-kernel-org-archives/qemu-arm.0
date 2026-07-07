Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AEBC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:19:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1xF-0000hE-Ba; Tue, 07 Jul 2026 05:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh1xE-0000gi-3u
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:19:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh1xB-00049Y-Vs
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:18:59 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678Dl2V3050576
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 09:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FvzYHiO4VYNp2iZmxCAWw6qGGJbCSrTsYtPaxDi4QsI=; b=jfDHEYCcHh5pR9Ew
 FtGfAdC89sAY+muUhKY4YGGU2u7Nd4BeZX/395mMn8se7aDSOdNG9Ipubxti5jut
 4Wxki4bMhWmOJfEPBo84E/38JW1cHXfD+ClOOv8PvEYm8VNSJOZSjQszqFIuIW3i
 MCMd9YuczVmCqija8uJ31mPmtWyfen70J//jx5NzI1678eBqGxTmv7J9yGFEB84W
 r8ImhYqzwoGx2wYTo+CugSHU5AEjGiW72qNqOsDx5dURxrnjd5/FW9WcOgZ1prto
 Q7YtVjVX2iRV00U9Kl6mH7p4pLabOWE9Dj3GZZhxhPHGhQSMJz7D+F3TPNBg4QGJ
 si08Ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u8ehv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 09:18:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1a97644aso52888881cf.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783415935; x=1784020735; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FvzYHiO4VYNp2iZmxCAWw6qGGJbCSrTsYtPaxDi4QsI=;
 b=Ot8JI0Hc6c3h2773BkKXlU5iq7CpPFSiYghC2Fptxpg3+LY3ln+RsZBKuT2p2HUYKt
 twMT1rgKaJM9b/aKgp/EPLYTppKuE5q5vJmTkU/0Vbw3rTVxANmvXmX4hTLFHRSoBxnB
 rfHQ0/9eBjpowsHCUz0/Dg6oD+zERh7Xrd5PV8c2k+lGwGWExTaKT8jhzkBiNLV6Jjr+
 VQjkXX7aVqDqANK2uVjcunJ+f+n7ZvYHUusIQ0JpdlTY8QoPY85oSWrUMqzirGb19nnw
 ccKpeHGvFELkWdhwcYXtNHauFyqCva+xWfoxLuqKGmJJd1xy9yZmNh/wc4unPi5A2EDB
 3qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783415935; x=1784020735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FvzYHiO4VYNp2iZmxCAWw6qGGJbCSrTsYtPaxDi4QsI=;
 b=OK/LSxiqo/y5qqQS0YD7Q6QVTP3lqCd1BiPuMJaHNLONZ0QUwXm5rYS5DJf7UtBNQl
 g95ZYcNBGm4IS7zfDpRTaMySK+EEEmxZ1X8DTld354a5FKlTbpyGFX++2yZle51z+9ea
 /1ChEAckF0Kg0/389AoViS4XkePcmjyyivsG2HTkmrec5g3wzzoPUfbwouu7mUhMjbjo
 67x67I9aDRskyhOnhVb710zR6d1Crc3sPhAydj18DPeNxHdbmuHDuayQXoJ9j8833/VI
 ycLpW39lvrh/1BbwnMGX1onnDSvCmBet99fpV6r6WC1eBdu0dezXLDE1VlQ3VekDAj++
 CsGQ==
X-Gm-Message-State: AOJu0Ywo9A2I6ww1D9/Nr8onwmKvzHGleAJLwVBEGGyX2/BisKiBPbLh
 RGSKhfU7WTkH5701fmJDxy4yEhLtqWNfvrLkp/UtIPibM/D0spi1qEGFZONAnoppIqWNS8u6xJC
 A6cEGqdaVKHGlqU/2hmHlIUFEnAxr6eV15wfAj3DwBIlIynTS3xEw3mc=
X-Gm-Gg: AfdE7cn5rMneZeAcyeYM4GpIHc8P/k98lwO9N/rXEignZ9dEwi3+zvlNPztesVLa+VK
 V5w5WxYwPj9vy+zLseWFDCVH5Q0+mUWGk55yffEa8yA7C7GKsfFzQx1eik5pgv1HasCdYx3XsMx
 5AlrNaZII2C1iINzCEzWjtQ16diBybt52W+xWV3ikqdB531vLpu97zlsrK9xR+KaWMp22pt4kXK
 bsi2Gjk1Tn+xNEKXAwZjug/8xXQXvcBBxIBlRYKu/FwJ2CfOqhPwvx4H8B2aDKvTF6oQkUG/VtV
 rCGY+9YLhY6p4ar1CFEaOOGIyfSUwu/s0fNw0uxpFgwwzOd2F73MpbSrZEkLwrmc9XLFhVHmfMv
 3Ix+oa6RCV67K7TNKqJRWvegINRN3NX3RG+YeicOtI2PlWyX7+93aV5yqqt5pRA==
X-Received: by 2002:ac8:6107:0:b0:51c:f3:34d9 with SMTP id
 d75a77b69052e-51c74802e15mr46045531cf.27.1783415935623; 
 Tue, 07 Jul 2026 02:18:55 -0700 (PDT)
X-Received: by 2002:ac8:6107:0:b0:51c:f3:34d9 with SMTP id
 d75a77b69052e-51c74802e15mr46045391cf.27.1783415935230; 
 Tue, 07 Jul 2026 02:18:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d8410sm32629544f8f.15.2026.07.07.02.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:18:54 -0700 (PDT)
Message-ID: <9f20ba93-0856-4058-9b2f-9eac79c028c6@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw/i2c: smbus: increase MAX_DATA_LEN
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com,
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-5-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260706230056.1888992-5-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX0ofGiOFLjMky
 DO2Qjp0ZUv/mP3MHZ59CkaKOaib3fTam11MBpzPXUg7jeQulQgUmNf6foVF4LfGLKj9PyDrJBor
 LVDnL5HixycS20etF/zqh8i+uMNUEcE=
X-Proofpoint-GUID: MNDAX5wOYXQ0oeiAPEDCG6QP0kbfAAKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX+pW5J1NSiXld
 MejRE1ievCnfpy34aDJHjUDqJJkr2gav7MMYu4D/kscqBxQFUSp9OjjyZG1RVOdR1CcR52LlwVS
 hrFc5BPTCt+HYsHeH0HSHG6sN0ZUJH0YwoSu/GaX4Oa4bY0yEM5HBOKh8kNM4idHwLgBTKcDMbj
 Dqhvn1Vw+O/ZkZIXM4Vlo/fgorK3b+/avA2Kc+emATTyrTpWYfkej+zukwEV+KRNE+9DvIu8rTC
 19rNfpIPz31lmfcvL6RC4RUNFz6k2LL42TW2JANMhEQiLRS/1O1XOA08wZ9EOoTaEoVQdRR5LDc
 MEmU0R7qAXWd+sG5mN3AvdhGwE0JKYzGFJdTtEmO0FlWDHki6BlKuwxI+2LOwf2LxBBwYDCRlVi
 ogR8Ok3HKkBoK8wBPGuERk+wuQHnqRILnflhgOqys5/vAzw8ib6sfzwwiHyjBYShuxaNvLmRI2u
 6TuHfUv9huiDsSypxTQ==
X-Proofpoint-ORIG-GUID: MNDAX5wOYXQ0oeiAPEDCG6QP0kbfAAKP
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cc480 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=k-jolHMNAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=r7jnlrndRL5-H-CgCs4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=yeu0PtCsVa5VB5VCVbnF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
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

On 7/7/26 01:00, Titus Rwantare wrote:
> From: titusr <titusr@google.com>
> 
> The 32 byte payload was raised to 255 for block reads in the SMBus 3.0
> specification. SMBus does not provide a way for devices to declare which
> version of the spec they are designed to so we must allow newer devices
> to return as much data as they allow.
> 
> Specification: https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
>> 6.5.7 Block Write/Read
> The Block Write begins with a slave address and a write condition. After the command code the host issues a byte count which describes how many more bytes will follow in the message. If a slave has 20 bytes to send, the byte count field will have the value 20 (14h), followed by the 20 bytes of data. The byte count does not include the PEC byte. The byte count may be 0. A Block Read or Block Write is allowed to transfer a maximum of 255 data bytes.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/smbus_slave.c         | 4 ++--
>   include/hw/i2c/smbus_slave.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

