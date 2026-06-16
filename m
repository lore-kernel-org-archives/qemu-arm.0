Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C70CD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:00:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVGK-0006b3-Mc; Tue, 16 Jun 2026 10:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZVGJ-0006ad-NP
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 10:59:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZVGG-0000zf-2h
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 10:59:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GDxmn43894635
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cJUXQvNAPsOTQ369p2XR/ExFmKzy/Y6bGHq3tSZ79wc=; b=jCQsRXcTm9Snc6me
 Lk1xySTKTy4UX3n5B77BVrDtkwTRCTicKlEWpTimYaYYKpYA7CW11T/HfdbHiR/l
 e/r9VCk2ujGdzX2P7aYRjZN/uocxkFr2lziUipU/QGFC00FoHKRPhDT50/p2WFt8
 wc6hvKOESLb5ESqCwHJ7pVQXO+E/N8UKRJfTLIIAMGGak/Prif4cXfN9ZpFItbVV
 bBB4hdRpJy9t+Kxz+daAZGCiDzHPYglGIqhS4lv+KhRv5YrNBRKy9nNysg7Qty/r
 lCdxFnFhS8fjpy38Lr/f833BLKaQAlw9Gb+7In4O/toU7Z8AhzzHfvKB67ulVw2z
 HKA/mg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1epa36t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 14:59:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-6c89de84f33so4917109137.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781621968; x=1782226768; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJUXQvNAPsOTQ369p2XR/ExFmKzy/Y6bGHq3tSZ79wc=;
 b=KU4EYz1koi80Yn/yDrzGCBSXN+AlIlXhccC4vr0Is//jTLlWoDQ2I3V2eH9Ui/QEyk
 DGVMeqqzD+UBTKWMg4IQrF+uok3IQ7iOqhzZM9HSQKnWHKnCyBh2peiK1dwqn/bHdrjT
 4YGC574a25CHxlvt/iL9LYFs03xy/zVG2QEF14KxXcmPyyN7TVE8m4p/NM2SwamOwRbS
 M69xosj/+5zFhU9tO2vkH7ICqmIjeZ2YdHWmyaR9P0B/Shxht4RJeoJy/IFU5Cuj7E0o
 XQonAVbr5PwQbBISIQ7rR5VeP3GE/WKTpp/K82+VjOqVFPlyP4AN1aMjb740GYofIG8s
 Daag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781621968; x=1782226768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJUXQvNAPsOTQ369p2XR/ExFmKzy/Y6bGHq3tSZ79wc=;
 b=OlZa3vC6k7PuPytFBD045tt3oMymR2SaFgqgIeFPTEA5u1K9st5Wjogy85/l5LuCGE
 uI3vrTv2Semjtgz/FZyUO9IwErUGg0Z2vgFil8CHsn3QGyymnm7fXg91yM+ns26dZYAm
 9W9VW3rOYgVgogvtf0ngH/Qt+EK97iRePqpQ4WvF57Dk2yueOiJzle86aHwQcdQQd+iR
 pX+OCEANA57RJKjcOyLUexFcxnDBaAlAg/AH1juNavbsQPJd5mOhPQ/mZNaeSbt8nr4M
 wWvVUC7PH0ADADKjqy3LItsjliLEjZkP3ZQg6p1Zgaz1RlBBPUj6rvHyWud9TuPJvQzm
 df5g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GJdyDBcallDQ2xPIl7KCUGTTKE/9tmpFJKItxO0LHQuIAkokrhtLnwh+Bu6M66d4Jx5Qv9pBqrA==@nongnu.org
X-Gm-Message-State: AOJu0Yw4P+gvTFLDUNp+0YCks95+N3EM09A3uBHS8gEpmV5/sXvrZf0t
 e4IW90xUuzcU9Th/+7/ser4uQgl5PT8qyft4dvNQpPK9BqLbsUm5DcUVwcaHSCoS6rCOavrbjOZ
 EBMzeKkDathDhijJJMTIej93cONFvB7kILR+1nm6XUP/3tvhwQSbMjYV8SJ1CE8M=
X-Gm-Gg: Acq92OGN4eZNZKoWAEUd7ZTiaS8ukhr79hmriqfSfFNewcy4y3Gdvz6xGQVpv03o45u
 fljsnFGIrhk6vwfMXbazeWx1Xplp5Nhc1LlMpnnrhjhOFvVd6uBU37xZJCBVcKj7B4+V6NhGmG5
 Zaz8e76TGmrpP0DdYsEp84RkazzBz2mYp3D8rJglY4m/Z19/681dteRW1hsmdC18qNcwYkJN7wR
 b3MwCbJFQcIRyrD+ecAkoGh5kACu/MC7NK8xpXUBW2qvu5yubj8hhh01DFKYroLoJ/shuajSj8D
 hJytrjo1PCIp++l8dl6SZ3hi8GJaNi5bck3iex62a8cmmcyIvPBP/3fZ85Pxrr+Bx8WUWKpXZi+
 sgt18yHciuzie6FPStmpLrVdvbZqEo8z6i6Wt/PISpg8244+DVdtgc+dSh26LiC0mlQp+IJRE
X-Received: by 2002:a05:6102:160a:b0:636:984a:1e5d with SMTP id
 ada2fe7eead31-71f5eb00fb7mr9387577137.11.1781621968361; 
 Tue, 16 Jun 2026 07:59:28 -0700 (PDT)
X-Received: by 2002:a05:6102:160a:b0:636:984a:1e5d with SMTP id
 ada2fe7eead31-71f5eb00fb7mr9387540137.11.1781621967791; 
 Tue, 16 Jun 2026 07:59:27 -0700 (PDT)
Received: from [192.168.69.214] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea9520f9sm260532455e9.1.2026.06.16.07.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 07:59:27 -0700 (PDT)
Message-ID: <b246751e-da58-46c2-9ddd-dc48b9b1284f@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/bcm2838: Route I2C interrupts to GIC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Righi <nicholasrighi@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260609024027.22140-1-nicholasrighi@gmail.com>
 <CAFEAcA-YSacshreh4z0Ld7pYdqjECsGxHmkfBrKgQdVPqHVPXg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA-YSacshreh4z0Ld7pYdqjECsGxHmkfBrKgQdVPqHVPXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a3164d0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE1MyBTYWx0ZWRfX9LNLkB7No6Rc
 ejHK2EOB842DNP547zmM0/2GiFa61JlSZ+PHk0nuaLSLfw+Nj9w7AMTanNTwzd/GV8payLzZNsA
 WARm1q3TIK2Cp/2RgrPIClcA/7ky/k0=
X-Proofpoint-ORIG-GUID: BBSLN8NtMNpeiBOQ3DvGvUtQR-8tw2A-
X-Proofpoint-GUID: BBSLN8NtMNpeiBOQ3DvGvUtQR-8tw2A-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE1MyBTYWx0ZWRfX1RnatWpc57c8
 3szCIIoZnx/w8X0gN0Q68pNw7xtmFasAgno1uiCm2XACnw89Il0HlfahHN/Kl3ryVIokbU5jf6J
 8Zzfa2Ro3NA2OPCfGmPbBy9mc8tVkWmLBObdd8kMOUF+6qHjre6UKw4x68UHUqbpicWR6iAlHwJ
 PEJJyndN98Q80jUDWohSY3uP/tjw/gpa19x0VZJBGjzSbJ8skA1ZQ5H2LsLAgKpo7r/0PcPcIUp
 iEGdW6zzGECoBJX+E09P4z8bSDxolfPVNEs2vw1Gk72HJySWq2DeyOo4yrEpVZLfIwsY9sgLoKO
 jNN5t7iAS790uXzw8yf9V+5e/uuv3/bQSKYc7JT0gaomN5BUjiaEkoN8isLzHdXTuASi9dnK6Xs
 ZHlpwQ6MwqHS8zIvoP4fYCWgL/U8J1PPMoiy4Evn/0QZzqP84RDwEZjPjmWV2BqPVf7dS/JLVcl
 hJg2S3Pco4mSIIDonqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160153
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

On 16/6/26 13:10, Peter Maydell wrote:
> On Tue, 9 Jun 2026 at 03:40, Nicholas Righi <nicholasrighi@gmail.com> wrote:
>>
>> The I2C interrupts are only routed to the legacy interrupt controller. This means
>> that for modern device trees that use the GIC, the interrupts don't work. This patch
>> adds a splitter to route the I2C interrupt to both the legacy interrupt controller and the GIC.
>>
>> Testing
>>
>> Add these lines to QEMU invocation
>>
>> -drive if=none,id=i2c_storage,format=raw,file=eeprom.bin \
>> -device at24c-eeprom,bus=i2c-bus.1,address=0x50,drive=i2c_storage,rom-size=4096 \
>>
>> note: eeprom.bin is all zeros
>>
>> Before this change, running i2c get to read from EEPROM would result in this
>>
>> i2cget -y 1 0x50
>> Error: Read failed
>>
>> After this change, running i2c to read from EEPROM results in this
>>
>> i2cget -y 1 0x50
>> 0x00
>>
>> The eeprom can now also be enabled in the device tree. Before the
>> eeprom driver load would fail due to the read failing
>>
>> ls -l /sys/bus/i2c/devices/i2c-1/1-0050/ | grep -i eeprom
>> -rw------- 1 root root 4096 May 17 16:57 eeprom
>>
>> Signed-off-by: Nicholas Righi <nicholasrighi@gmail.com>
>> ---
>> Changes v1 -> v2:
>>      - Use a splitter to route the OR gated i2c interrupt to both the
>>        legacy interrupt controller and the GIC, instead of just replacing
>>        the legacy routing with the GIC routing
>> ---
>>   hw/arm/bcm2835_peripherals.c         | 9 +++++++++
>>   hw/arm/bcm2838.c                     | 4 ++++
>>   include/hw/arm/bcm2835_peripherals.h | 2 ++
>>   include/hw/arm/bcm2838_peripherals.h | 1 +
>>   4 files changed, 16 insertions(+)
> 
> 
> 
> Applied to target-arm.next, thanks.

Too late but still it was in my review queue:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


