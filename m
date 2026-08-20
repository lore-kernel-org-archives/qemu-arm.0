Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA34C5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:59:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0Uf-0006ND-UY; Thu, 20 Aug 2026 06:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Ue-0006Mt-BZ
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:59:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Uc-00083E-Jz
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:59:32 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K9JCeP2927102
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TYGHNrcRUWlhw+/HAQ+6jYwfobgMrzGS7mD9WBau4p4=; b=pNVXsrdDAqidVxD2
 8Rksb8L6Fs/Ujst//zELcNPR0tarshHpwwdjv6WxHUN0w2lrjsmwK3UOassi8KO2
 INX0F+AZmQMucan8pd2NfSCSM1CxQ+qDH/ZC04i40PP3ORa5NmoMO+jBNNwFsKIR
 JSdrc+WKooFZuHXSjFQTfoSgCB2mrGrruPhcZThRehPAGvAdZRGupuRSXZrt4D/g
 XzxJgbkQitW/xFbpqLnylnKGUveruXK6azfWP1fG6ND84JUaTmmUD/XtpTsUw4+i
 qF1S6q6Em6RD4AdFe3Im99M/Adp5VL+y7XD9OZT9DZrJyl+WY72F3s60i9wh6LnZ
 XQPPfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk0cn6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:59:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92ec3146553so399119285a.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787223568; x=1787828368; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TYGHNrcRUWlhw+/HAQ+6jYwfobgMrzGS7mD9WBau4p4=;
 b=Kwu9hMWNYwYrnIGOsZ/0yUgTMcF/YzX7adIPAF5qfzo+rxL9k7cyA5K283Bq4hscPK
 TbDF6yr7wgkYJ5wY1RHuGCNCjqiDcwzqNJNINgKPI18rTw84TN7uzPB+HRIvSYywuXrp
 Uc+LHRG8+3g42106nfKzYxjbXbG0BrLUd3FkHEbPAoyQjJFDd0UEQqLn3POWS6Ftxtxx
 ZCCCHz+EdA014YezqsrywpU8FrTq1XdhMGCNy+5WcvMTqkK2MPQd4V7vNY/xxfOCZ8Oh
 od4Rpa8qpB73/RrAOAXjCUTMQIrS/8mpOsGYJYkM2fRj9mp+ThSgBE6WSrP7QJAnDL7N
 AtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223568; x=1787828368;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TYGHNrcRUWlhw+/HAQ+6jYwfobgMrzGS7mD9WBau4p4=;
 b=cRJP3kcF8dghId3+AW0E5ZxsHEtM03F2vEAPatgn+4GbSkZtjZrcuDbpvkhV+PNfzZ
 ovD8raFE3QhE5L3PDV7J+Mhnqok+ibv32RaNdPTSUQKsVTbiAf6tynEUtt2RFiLsVxab
 +Mi9kF/CDjVHPa+I5RrWa3li77+Ah/mzOY4RyB8uPQtJ2oc5YbXzPvCVIDIcTbKSteED
 J2CK40ZO235CKSCiNKHt01+Tk5UUxDvuDQEGdP1UaWXJFaCrXEdu5JVgG3PPGYSbilfS
 PH7mS0/aNadeQ7W+43EIu3zNshuzTenn34pxgRYUuqWAjarOrN0Mhd5RdQTcUQc3T9ZX
 kwzg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr13nFdJuh2VdHUIZAlNlvTNRGIRgeg63phBN4WuvMFd1YIVb+04lL41215jfxyUm1gTb5bb1FvJg==@nongnu.org
X-Gm-Message-State: AOJu0YyOySdbT5HA3QTUYmPYXqs8zo4ZQlIGj0e+/0X9BQdoX6auFI4r
 jg1CQB9EHDmdkFeujx/UMdP8GPQ0qILB4DgsOukE5taMlFxnF6hKHsoYxRtU+poVNaBgjgQ46dP
 Mf6lCx4HaSmFox9Johfq8C/n5UcFKDOvc8wpbtyw4iWHmQcNd7vOVwJo=
X-Gm-Gg: AR+sD12F0sr3/E2e4/W339DNHirHweWMXUwIZd9yMTMhVdLSLXDJEyYleTAAua/iAp6
 AlBZklCe+nmmm8ZRV4eQP0kPIajde/VVGW/7/xHhgwtgpNvX9zg/Cd/CiH8z9NmbQPSsVf+/CHB
 QL2IP7DEV6RNw621ZJJktC1sTSqTXHeRitYIep6rwR8DhQuOpCcgEsga8arR8Rgx01zfovDUbQm
 NZogrMXrYDkYnT85iJg1Nu7EyEBKUnvF8ExMHAfEP/hpJJ5+XxZmhok3FvZ5yroS1U0qNtc3Ost
 NJDWQxFxfB540X0rCEh/3/lfGkr6QlakFX/GCbmEY8xnSyCRpwsbi/rIJf1qKFeMDk/KCJCuQGw
 nAZfKr7yIw3kGWanpB6YuShEBAExpKkBYyTM=
X-Received: by 2002:a05:620a:4556:b0:936:eeab:307e with SMTP id
 af79cd13be357-9371e1f7192mr1075022785a.9.1787223568625; 
 Thu, 20 Aug 2026 03:59:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:936:eeab:307e with SMTP id
 af79cd13be357-9371e1f7192mr1075019685a.9.1787223568233; 
 Thu, 20 Aug 2026 03:59:28 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c338dsm10255027f8f.25.2026.08.20.03.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 03:59:27 -0700 (PDT)
Message-ID: <6a3faf4b-2b03-48ce-aa85-0406e0ec4b67@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw: Remove Marvell 88W8618 devices
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260819185430.3467629-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GkxvdeWUQjRTvxyFNB988TAa0-3BbJbu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX3aow5OBH2eKW
 EdE81dTf+xl48zb2cybUzTQLfpJJaC1xu8xkl7+GrEhJQPpXbhLqX/oS8c/WhSvkJRtZkPXCPG/
 yn7jv+BoJ4D0nWI9La04B8xdoUhVrck=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a86de11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WTuRqCryRA3U0Y2z8-YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX0BleL6Gwcot0
 isxKg+ee84htJASQt1Gu+f7XvWbZiH/rP+Y330TTfu2RQYnR93Fv4eHjJNKlRI83fZ/5ClYCRv/
 Ra4gOxksSFe4kAxvpVkTJ5mr0auLhRM4W+RgvzMzuH+OZHeb3osCGw/sIEuRauUY3u1x+JhGYUD
 ZDWlHumdeqFsqFyEEKXar/5610TuGUtmkvfmXg0gnpZUZo60ARoSO0fR1Ywz0GE2twtGfg2DXFH
 lm8Z9RiEeukiM2P9MYKJrIQlpXyLnk1VFDHisyNfMtqmdFpUXEys6tXX3aJKaaO+HzQRCWWYB/x
 YRnTHYT5O1MrIssYKhmMEo1KTFdOW2u5nEqIJBpaBo7G7Lz2g7CRX7red/+AbFgqwsCeVRMpzRA
 eLfZdINxaCY3PHLknUIUcNvXBCnlfkY9acC5ot0agGIZvceLwrav9u3dYOfysMetjnXxZfaxw0R
 ESb1tTZopAJrxdHIMTA==
X-Proofpoint-ORIG-GUID: GkxvdeWUQjRTvxyFNB988TAa0-3BbJbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200081
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 19/8/26 20:54, Peter Maydell wrote:
> The mv88w8618 ethernet and audio devices were used only by the
> now-removed musicpal machine, so can also be deleted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/Kconfig                 |   3 -
>   hw/audio/marvell_88w8618.c     | 315 --------------------------
>   hw/audio/meson.build           |   1 -
>   hw/net/meson.build             |   1 -
>   hw/net/mv88w8618_eth.c         | 403 ---------------------------------
>   include/hw/net/mv88w8618_eth.h |  13 --
>   6 files changed, 736 deletions(-)
>   delete mode 100644 hw/audio/marvell_88w8618.c
>   delete mode 100644 hw/net/mv88w8618_eth.c
>   delete mode 100644 include/hw/net/mv88w8618_eth.h


> -static void mv88w8618_audio_callback(void *opaque, int free_out, int free_in)
> -{
> -    mv88w8618_audio_state *s = opaque;
> -    int16_t *codec_buffer;
> -    QEMU_UNINITIALIZED int8_t buf[4096];
> -    int8_t *mem_buffer;
> -    int pos, block_size;
> -
> -    if (!(s->playback_mode & MP_AUDIO_PLAYBACK_EN)) {
> -        return;
> -    }
> -    if (s->playback_mode & MP_AUDIO_16BIT_SAMPLE) {
> -        free_out <<= 1;
> -    }
> -    if (!(s->playback_mode & MP_AUDIO_MONO)) {
> -        free_out <<= 1;
> -    }
> -    block_size = s->threshold / 2;
> -    if (free_out - s->last_free < block_size) {
> -        return;
> -    }
> -    if (block_size > 4096) {
> -        return;
> -    }
> -    physical_memory_read(s->target_buffer + s->play_pos, buf, block_size);
> -    mem_buffer = buf;
> -    if (s->playback_mode & MP_AUDIO_16BIT_SAMPLE) {
> -        if (s->playback_mode & MP_AUDIO_MONO) {
> -            codec_buffer = wm8750_dac_buffer(s->wm, block_size >> 1);
> -            for (pos = 0; pos < block_size; pos += 2) {
> -                *codec_buffer++ = *(int16_t *)mem_buffer;
> -                *codec_buffer++ = *(int16_t *)mem_buffer;

There seems to be an endianness bug here.

> -                mem_buffer += 2;
> -            }
> -        } else {
> -            memcpy(wm8750_dac_buffer(s->wm, block_size >> 2),
> -                   (uint32_t *)mem_buffer, block_size);
> -        }
> -    } else {
> -        if (s->playback_mode & MP_AUDIO_MONO) {
> -            codec_buffer = wm8750_dac_buffer(s->wm, block_size);
> -            for (pos = 0; pos < block_size; pos++) {
> -                *codec_buffer++ = cpu_to_le16(256 * *mem_buffer);
> -                *codec_buffer++ = cpu_to_le16(256 * *mem_buffer++);
> -            }
> -        } else {
> -            codec_buffer = wm8750_dac_buffer(s->wm, block_size >> 1);
> -            for (pos = 0; pos < block_size; pos += 2) {
> -                *codec_buffer++ = cpu_to_le16(256 * *mem_buffer++);
> -                *codec_buffer++ = cpu_to_le16(256 * *mem_buffer++);
> -            }
> -        }
> -    }
> -    wm8750_dac_commit(s->wm);
> -
> -    s->last_free = free_out - block_size;
> -
> -    if (s->play_pos == 0) {
> -        s->status |= MP_AUDIO_TX_HALF;
> -        s->play_pos = block_size;
> -    } else {
> -        s->status |= MP_AUDIO_TX_FULL;
> -        s->play_pos = 0;
> -    }
> -
> -    if (s->status & s->irq_enable) {
> -        qemu_irq_raise(s->irq);
> -    }
> -}
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


