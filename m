Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EA6CD98E4
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 12:07:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZp2o-0007oK-7L; Wed, 17 Jun 2026 08:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZp2m-0007nH-QT
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 08:06:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZp2l-0002hD-3F
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 08:06:56 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8UP471703232
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 12:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LbS5qDj9xA3MzHcFKfMaHGxE4u+tbAr0kRcbCSrtuUE=; b=VCbLZAkAIrSn2+Ff
 IGk6VS9V7N7jtqiRsxO/jRFxdW8Lavd323fxub60N3nDAc+M1fqMGuLnA08doNqX
 aijIJlPv2Tow1GYP+def2obBMSfqE4/D5oSDwe/I27jdenZZu78z76HXS5CBMnLz
 qyEkAMfL/8faS4EF3jCzUSkxuHOnue/nhTs1ruvGwy+h/7+smNmPqeeksyRSnE4N
 K0XzRPDw4KddKoFyz8bHTYrh+PhNv1VyznfTKTZsieJjCdbSbyX1kDD37+KVPAqT
 Fq+P9DbfFeZ0KVJFk8WlLdskuvvrHBxrAMHZm2YKjblrHRo/URzPOwZ3vgenbRmH
 WSxLfg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet2wy6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 12:06:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5bba1a92ddfso3217903e0c.3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781698011; x=1782302811; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LbS5qDj9xA3MzHcFKfMaHGxE4u+tbAr0kRcbCSrtuUE=;
 b=GinMjrB+a3fqLknTEF49YDgFDgRME85hFuPjBW8g09SGnXAkEwThLvumRhLkY0Mju6
 XBq07qr111ynp2s666ZOOFiJPD08oa1AmGIoSmiJl7kNIJICwNB6G7JiKoAkoSRhu/9q
 n68xcuLnxSMFl7Wu21K6iezR2GaEY3F3o14/XuWlJumhZ6oipIz3JAnJQ4WCAQnWexjp
 gH6HPmWUL/WwpCeitXUogrSQGoanvQqAAIjTmaO5Lk+4eKXD1zUs6B6mze4h21MejE4T
 K+s6S0I3K2VFd/0sdrE5k+kdFijFYQanIUys+L+iui+s3G/+39jMYDuxBLku0V30hU2f
 j2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781698011; x=1782302811;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LbS5qDj9xA3MzHcFKfMaHGxE4u+tbAr0kRcbCSrtuUE=;
 b=OhIahpGD9TGx4OTmUrCpBvV8P7ERxBHbJ/QSJjxRNvKf8918mxWEMM1ZgJnmonCcHx
 QvtV9pvmfPvcN0Cs90NUG2zCN3vZzEj1PGLgRZZ3/NMAGRX+5tShIhkYBYqk16qC4l8E
 kJYy+/RbS2k6+S/NRtZRUf/t8/LGs6f0IvjgggWFSomO/ov3GTsL+d2jexEWq2v47tTS
 iYe7hozNwkXe2x+03SvpYSPmuzAEoLOR0GDiHV9J1OXJ0Xaqn7yloe3wZmqS68QoOKl5
 0qt3ovTncDln9zNN7X/kid1Ay6Km+MTg8gyLERplUTL7UAmAfqLNVAexoUWwC6s4ngqh
 +00w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JuhEuzuXBoZLDktygLG18I+Shs/VREcSigsexA87rydphQo2K03X4RF5cl+SdOEoqOlBCfv5DnQ==@nongnu.org
X-Gm-Message-State: AOJu0YyrQ4aDvJCDqts4pX9AjDKCJPMvUfad2BV00gr+adpC5pfUuNUa
 ev0OcfNXThhQFttsIyB2chxmw6LE/9sl6r848rmmiQwlkMawIObzqL1Oxwy7U07gXtW4Mn3k/KI
 06XU5Qj50h4KegA8Ytg/M4wNZOIQDA3GzVFFNBsK+Xn4XV/VbW/vihKA=
X-Gm-Gg: AfdE7cnWFySU/yx7d9/ifDrDRImQlfcx8PRaQtO+kl49olo4k5YQPCJ1hYrAO/MaJO7
 BZbHIsvsNHFJt5fw78kM6Wlvj2QbqeQ0YAKlYfBDENoQw8mdEnMndXIbZuovzgzaAO6YYdexEHp
 yiTTdOs8PTKrcFyHES+LwIEbAvdfzVVb1KWAoQPLm78tepX8dVjisIL5BM3m0n79iPI2rsgWLU/
 Qf4LRi6sMPEL3gtIBhzZpPNipzGWxgr9tg/c95+UQ52+a0ZoD0svKFXSYLKosbIvxG7CjpIzrHZ
 HSKKJGyjlVWBTnTh78eYMwk7YDw/8y40JeqzcUqZvdvyVn6oamdNsufGdI7iSbozhOj+O8GQ0Ps
 9QC8TBRQYDuXWEoWm5/nqlnxEKPmFE/Q5bZFUszGsvIzPJ3nbkqqrqq6uM+/e7Q==
X-Received: by 2002:a05:6102:6a8f:b0:6d9:a879:8e39 with SMTP id
 ada2fe7eead31-7246a30bb12mr1907706137.14.1781698011589; 
 Wed, 17 Jun 2026 05:06:51 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8f:b0:6d9:a879:8e39 with SMTP id
 ada2fe7eead31-7246a30bb12mr1907644137.14.1781698011147; 
 Wed, 17 Jun 2026 05:06:51 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4f8d7sm151753335e9.5.2026.06.17.05.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:06:50 -0700 (PDT)
Message-ID: <97b7799c-4294-47d4-8673-d9634a173fd4@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial v2] hw/timer/imx_epit: Replace DPRINTF with trace
 events
Content-Language: en-US
To: Wang Yuxin <163wangjack@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, mjt@tls.msk.ru, laurent@vivier.eu
References: <20260617115949.93529-1-163wangjack@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260617115949.93529-1-163wangjack@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GQ-oVmlKQI0ho8ts1xI8Rv9muhKT29p1
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a328ddc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eGY6v0xcA4BH_BAmjdsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: GQ-oVmlKQI0ho8ts1xI8Rv9muhKT29p1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX1Hn3M54gywBG
 X67EpI2cUXKBO+EluePxJJlWlqMgNX9yjEupd2tr+5VUfDzDjBfS0Pa8m+Cw0z2xgO5kuXEi5d/
 17w7gNHvFhSpvZqhOJVHcsuRkPrn5TQ3txwUPMQGKrj2KfU9TjMsKtkEk/U3SF3aJA5iU33vMBK
 0iwKdiQKtXnoLKROeetkgNXbSDOE/uuFyl4EYYP8I6VkDra4oif8flPXhKg0UIosFRCTx6sjrxW
 wM4U4ia+hJO8LRnvJCnBTdRVgDIZlZrHTx1WkALt5iwYQkESMuWgBUJPeVuNr7voPQpjuXtG6s9
 KT6DLijwY6Djfk9k+mfAEOD16UG5sbiLlnv/CfohzuSpfnCg2OfBYVYtGCcCZV3nNxHW3InQUxi
 rCgGv78EB+nw9qdEewWP+8EU21LRUV40QhsPbXT0VUSzFPz+46HsEdBdy/weSvRfPOYjENHh1c+
 E4sBIgxyAlfKvlo+3bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX6/1HLf3cCHl4
 uopjTLmcezs6MwF4HZXe6nsg+toAogKG1eFS0W6rkTL+U+eH+Fan2hgTGKv2atqj+puMi+qzEEL
 fOJ7fKl2l+wEA2EfEC8GZ8rpRJ0mcuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170115
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

On 17/6/26 13:59, Wang Yuxin wrote:
> Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
> and DPRINTF macros, replacing them with modern QEMU trace events.
> 
> This also removes an empty and meaningless DPRINTF("\n") in the
> imx_epit_realize function.
> 
> Signed-off-by: jw_mac <163wangjack@gmail.com>
> Signed-off-by: Wang Yuxin <163wangjack@gmail.com>
> ---
>   hw/timer/imx_epit.c   | 25 +++++--------------------
>   hw/timer/trace-events |  8 ++++++++
>   2 files changed, 13 insertions(+), 20 deletions(-)


> @@ -328,8 +316,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>   {
>       IMXEPITState *s = IMX_EPIT(opaque);
>   
> -    DPRINTF("(%s, value = 0x%08x)\n", imx_epit_reg_name(offset >> 2),
> -            (uint32_t)value);
> +    trace_imx_epit_write(imx_epit_reg_name(offset >> 2), (uint32_t)value);

We could simply pass an uint64_t to the trace formatter.

Anyway faithful conversion, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>   
>       switch (offset >> 2) {
>       case 0: /* CR */
> @@ -362,7 +349,7 @@ static void imx_epit_cmp(void *opaque)
>       /* The cmp ptimer can't be running when the peripheral is disabled */
>       assert(s->cr & CR_EN);
>   
> -    DPRINTF("sr was %d\n", s->sr);
> +    trace_imx_epit_cmp(s->sr);
>       /* Set interrupt status bit SR.OCIF and update the interrupt state */
>       s->sr |= SR_OCIF;
>       imx_epit_update_int(s);
> @@ -399,8 +386,6 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
>       IMXEPITState *s = IMX_EPIT(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>   
> -    DPRINTF("\n");
> -
>       sysbus_init_irq(sbd, &s->irq);
>       memory_region_init_io(&s->iomem, OBJECT(s), &imx_epit_ops, s, TYPE_IMX_EPIT,
>                             0x00001000);
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index ac5afe84e8..3c282800c6 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -122,3 +122,11 @@ hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writel HPET_TN_CMP + %" PRIu8
>   hpet_ram_write_invalid_tn_cmp(void) "invalid HPET_TN_CMP + 4 write"
>   hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
>   hpet_ram_write_counter_write_while_enabled(void) "Writing counter while HPET enabled!"
> +
> +# imx_epit.c
> +imx_epit_get_freq(uint32_t freq) "ptimer frequency is %u"
> +imx_epit_read(const char *name, uint32_t value) "(%s) = 0x%08x"
> +imx_epit_write(const char *name, uint32_t value) "(%s, value = 0x%08x)"
> +imx_epit_cmp(uint32_t sr) "sr was %d"
> +
> +


