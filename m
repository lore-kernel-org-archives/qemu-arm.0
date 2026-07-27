Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCAAC531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 11:55:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woJv7-00065e-8v; Mon, 27 Jul 2026 07:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woJv5-000657-Uc
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 07:54:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woJv3-00048x-Bu
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 07:54:55 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66RAMLa73427831
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 11:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MjpLSH/2+fydhNy2psqhlGT5vqzfdqQcuqsCt78TKJc=; b=lKJhR/x0wP/rKxAV
 Not+KgAF9VQ31w9ZQAVLPUUJiW/KvbZsJR3UeWJk2Fvsd2Py2WTclwEHqB9hSudA
 ZZzpBTSEiK8ErtFqR/Vp9GSAW77S2UcK7dTQmbGkxq/zmbyH558mAQeXwwjqlXr5
 1dyM+njVScvNOPWN4RyJ0DDt3Hi5OMygHG9mMFY7CnMdg9s3MU3qNcm1hitswg7i
 LX7yZtiAPWinLjzEpxNaKtuYLfQDz5Db8QIKImDbWf6UfNVqqqm+iLOul43bOQ95
 ge+x2VTsVDHXlnH8VT+/ic7znSYSO+RcbJAbFzOAI+1rp5+vi5sfC0wSsv0SIrKT
 mLgFWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2dn7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 11:54:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-522de3c645dso54952071cf.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785153291; x=1785758091; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MjpLSH/2+fydhNy2psqhlGT5vqzfdqQcuqsCt78TKJc=;
 b=FYqshLI7/rryWcfAHHBUczIOGGRr/pCDeJ1TufOt3YnEylPwj20Wqca5MvDagbfm3v
 HY4uSG8CkY237pYEdF2aRZRXgJvswvdhdw44EjwQlFwRu3TtxI6QCcVBQJKQqe/EgsIg
 HN/QbrrUdgLGfbKRAm+a+UL4M4ISMUlRvbQzLluQKkr/7LDkF9MWPp6m3HX2QvHoP9m7
 XdAW9wXl5zlUXh4XuGvVaLBPcBbLZFn6uq1spX2visIdKauWli78m8Nujs748l4/DM1y
 Sq6OVz/huahh5+xdyL2ywYIhhpBK6QuzA4Y2Xr6N3ScZl+5tRGoHT5pKGdM8QEFZ2DrT
 aH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785153291; x=1785758091;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MjpLSH/2+fydhNy2psqhlGT5vqzfdqQcuqsCt78TKJc=;
 b=Fjq5W0m+yT0PPnjI+7hLc4NyOIx6IruBnjXdeZx51BiEnY09g/Wy7stpSyV0bzE6sQ
 31RqvUnhspXcoRsKOKybmxHK/3ydaGyf6ajvQYXGK5dXNrtkpuP4V46VEN691xKNhFLl
 EMCHNUh10V4jD722aGpXYpK7UhKgtCffhUuA4DoARKaaw0a3CqsUTjg1faUpcma6EMij
 AlEj8upPieFcD73synrKDTeBHhfTvQya0y4cRrn2Pcd8R1GK1GSgNcNVhqVF6/eLCcZX
 5MnZIQPA9YZZaOfcEOTQeoGPxLf/5kWSoH6wrU9QbV0tuN86LlqeEo1A2iEpNh6yOLK/
 kaeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzRRx+PbFl6RBL5GwQ+WNw9Q2EZ8ZuHPTcT7BwXfMYA2rY70gAb4wZ5dkfWZ2xh5B3YRl9VB81gA==@nongnu.org
X-Gm-Message-State: AOJu0Yyb5TVxytdPcqknJNTfuB/X2qcHDVI3xnyJOjluB7+aXDClkH+h
 ZA7C46ytVGhRF0JHEyJIwcSQIlxr2QjcYYhEZhEemL0B64jXB183jZKV4/LKTkvmZ/W7a+QnRA9
 XBIn+zbf1FIdozLPBVpEdHDLsx+so31aspg94ZQRsqlqk1+u85Wqr0a8=
X-Gm-Gg: AR+sD13y2tuDFEg7rbLeOpts2KmGZi3gtBz/QAYb/T5ntnJHbLvAP6szCNauTbNoqsk
 DBh+b3QXxI2VTuq28bYDtHRYMusdb2uL6sXtdurgg3htjfWbKzr4Xpr3TWn1Rz4jyqfVaOydmlL
 7znWRhDowTrwKBwl2I8H5/dLOQp8/oZhZFOEPVapyYnOmuvQh/JGq0dPszsc70tkNT9t5HVP0sv
 oT90fAGXhv8cevP7JxGQ76pMjX7L4QpQ06B9OlvTn98kfupBwP+qRCLYtXzggyEZKhzooDze0Xg
 XU18BEdXkpWE+Cxb95uQ+VGqbW5DtzG5vKW8fktWw0ppXHwiyhUQcqdTLY5cq8EfH2TVM2xde68
 +oHIaZWZXtw2LU4sG/Mx7HI9wyHL/sNTKEpEeR7lIoHpiO5WCSLs=
X-Received: by 2002:a05:622a:3d0:b0:517:7188:c47a with SMTP id
 d75a77b69052e-529a8381bafmr80802411cf.2.1785153291434; 
 Mon, 27 Jul 2026 04:54:51 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:517:7188:c47a with SMTP id
 d75a77b69052e-529a8381bafmr80802201cf.2.1785153291051; 
 Mon, 27 Jul 2026 04:54:51 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69fb51c9eb1sm2547975a12.10.2026.07.27.04.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 04:54:50 -0700 (PDT)
Message-ID: <a9ad33dc-b487-4ce7-9b8e-d437b6cc5d12@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@mailo.com, qemu-arm@nongnu.org,
 sef1548@gmail.com, botszhuang
 <22925483+botszhuang@users.noreply.github.com>,
 botszhuang <botszhuang@gmail.com>
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
 <CAFEAcA-q5ihYpgYtEosQ3+SgbMdw7e7=xk4motLFL-A==g1k0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA-q5ihYpgYtEosQ3+SgbMdw7e7=xk4motLFL-A==g1k0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExNiBTYWx0ZWRfX6e9StgYzneEi
 w3gaqW4/BKAJEowR3C0VaALy/ijAL+4PRvdNCEiycV1BGhGWRYrEuK5N8XCwrWBE3/n+dUA6H00
 Pczw543pDAkJ9viuV/ebt0BarWnWgWA6gVLCxNxL6j08xUP5eS+83BA8JcEo3PImOVYHkf0nBHB
 UbmVQFwpfwfEXU/Qwmhlw1VT+YYWmTFHsAwaY47e7O5aDN8hCvWV5LrPjtDp54S5M55SaG+1nwb
 bneH+lm8drRXo1s72edoxNstjQlCr2Sw7shU2pksSdgo05gjvXivTc0xH4lHr/pmVdGQAbpeAkc
 iBTz3zokB2+ZVXRLkCOpDEZUL7f2RYqfyOGSYF30198zkhQAaeJB3MytFSkwn5+GMNW+JUAHKX9
 u9oVsiqUl7jnIgU0snPxW6XLFayfTyNhJ1d6Uzj7yhKfQqSKIwb1fom0z4XEOM8JUDzAcYC521c
 c+h8MIOT7iMLb7h+LVA==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a67470b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=t2M2atKBCKvtHhSlAyoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KgKbBHZY45sEkmPj6IcUIWAkh6pjQIT5
X-Proofpoint-GUID: KgKbBHZY45sEkmPj6IcUIWAkh6pjQIT5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExNiBTYWx0ZWRfX/S/GcAHyHUvD
 yBAt5lAMsG0C77fXStqz6IT2nd3A1foS6HR1Q2W2dFfxwXK59ULAgt41Hxqc9VCBGMDuoyLrt5H
 yBsOzbc7iKvAfEk+y50CjjOSZ/IOWsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270116
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 27/7/26 12:04, Peter Maydell wrote:
> On Fri, 24 Jul 2026 at 13:51, botszhuang <huang.botsz@gmail.com> wrote:
>>
>> hw/i2c/bcm2835_i2c: Correct CLKT register offset
>>
>> The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C controller is actually located at offset 0x1c, not 0x20.
>>
>> The previous incorrect value caused the guest OS to read from and write to the wrong memory address when configuring the I2C timeout, which could lead to unexpected controller behavior.
>>
>> Update the BCM2835_I2C_CLKT macro to match the hardware specification.
> 
> Checking the datasheet, this is definitely the wrong value,
> so the fix is correct. I'm a bit confused by your commit message,
> though. The value here in QEMU can't cause the guest OS to write
> to the wrong memory address, because the guest OS doesn't ever
> see what we have defined here. It has the offset hardcoded into
> its own source code.
> 
> It looks to me like the effect of getting this wrong is that when
> the guest writes to CLKT (at its actual 0x1c offset) we will log
> a guest error and give read-as-zero behaviour. That's not correct,
> but I expect for most guest OSes it'll be pretty harmless because
> the guest probably doesn't write the value it wants to configure
> and then read it back to check. (QEMU ignores the value written
> anyway.)
> 
> I've applied this to target-arm.next.

Should we also reduce the region size?

-- >8 --
diff --git a/hw/i2c/bcm2835_i2c.c b/hw/i2c/bcm2835_i2c.c
index 34de1f36e5b..5f6093087dd 100644
--- a/hw/i2c/bcm2835_i2c.c
+++ b/hw/i2c/bcm2835_i2c.c
@@ -222,7 +222,7 @@ static void bcm2835_i2c_realize(DeviceState *dev, 
Error **errp)
      s->bus = i2c_init_bus(dev, NULL);

      memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_i2c_ops, s,
-                          TYPE_BCM2835_I2C, 0x24);
+                          TYPE_BCM2835_I2C, 0x20);
      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
  }
---

