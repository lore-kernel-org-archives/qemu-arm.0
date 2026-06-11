Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FABCD98D2
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 11:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXdUz-0001RQ-Jb; Thu, 11 Jun 2026 07:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdUx-0001Jw-27
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:22:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdUv-00016w-6R
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:22:58 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65B9xBmo242661
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tW0vcV8YamWhpQyUKXazyYRUV/2W8ZpI2T0zA2FSpJA=; b=LpphJ54jL8xelk7t
 Wk09qjSecTatz/Ro+D3/+EBSYEALabUnR5Apoj8W0SMfVahQHKo1x5f3gj0DRwZb
 YzB8nw1hs/ISHG+rCfBpV+XHCgNFvRVDwtDvKayXvFLkLfrBt2M60Dieozla00he
 wtMqISaABI9O+UIWgpIAAdZDLANbplerTrr2tgGUUT9dGymMMciWt3XQmGYfG0Et
 sVLdkL+FCJ2Sz1qPHEawstTlv9CHpkC5i2mopJ0NNMd0qBbQ6HUvQzgXwuBYQ32y
 NVU/SQaWWN2F/sZmYdfXvH+YxrBTWav0br+Fa+t8tNzbMsFgnqQS7epu1P4CQGL/
 Tt/j8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7035mv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:22:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51775f7b2afso15860091cf.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781176975; x=1781781775; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tW0vcV8YamWhpQyUKXazyYRUV/2W8ZpI2T0zA2FSpJA=;
 b=IcdAR95BXzzr42FrRlZS4fJ6odw42NXwoxzzjw1f8x71ZDi/5+df+3G3Uw+SFNiBpn
 QkMLGnrI72fM41sMtz3Wo6+T//Z7+D5RblkX64QLGU71X71WikgJaHEbLUHdL8gfByyc
 5g4x0othSbNzF0zx5gjSL/8HfnnlZf3naXOzi2DsCcMLPh6td2tXfHm1WMhVPj3sV2BO
 DsnI5kvwmo2vvybxWejCHVEXqlLfVGV6ItpEG3hE+kWLS1rrIMOhhCrSXlMIeoXB4aBx
 feLTtb7m6i6N1KPXEtthnrADT/D5dqPdGbYpa2icE5wGRlqy0u1qOrVDtODCQvM4/pMG
 Gwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781176975; x=1781781775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tW0vcV8YamWhpQyUKXazyYRUV/2W8ZpI2T0zA2FSpJA=;
 b=KhrI80+TmFSsts6AbNGU/IabFwLpWUA/K2AkZLVWIxcxNxyqtS9YTbPi2yYSoclCjp
 PNZBgJhQFbh4vq9WB/Dav66vqX4FIltVX7KYMss/59Vv0iZGrFAVAkbLmYkDPwZbU+bN
 l1rv/ZsEjxLWy01MKBPjAI8esJDMHa+a9W71WWb/oIB6sWPIYAnKE63TczDapDS4U9jy
 QjB3iOI+huy2n4aTh4MIz5upP4AcOsq5w5cYfl9YhYArNY3gDAsEWJa+eCZWgW8tiXU/
 oFt31U2BK40Fpqtt/9PCWlGurn+7Rx07n0SXCRbS64ojAjOXu0X1GX0Gl8mikjJubGVM
 pZVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/I/t9JSfPGZF6qEwLi/tIg7AVV+rh0uDi9m14veW8ALyxSNvsNM7Nk2MqNbo7+9+tUAKTH5jzeog==@nongnu.org
X-Gm-Message-State: AOJu0YwbEUxQAwdwxa2sUU+Q7oO6Hp8juOtvdmruP6u1iIrMVIZBNDsS
 /cD8NvD+AZ5Ffts2CpUDP5tQ4CHSIzngdxlxlOgNvC+9G4pag0GzIFA6sMPD4gGIKfLqpCnXo/s
 HlN7tvrQqAxjxo0BqBL984LqKG6X8Zz85RAcSJ+LOvAuy1bF6KWQfBIY=
X-Gm-Gg: Acq92OEgYaX/EZZcEwoOUEeLm3hcrZyMmR+kY1hKAqbdfjf3qqubXr+MSnj/xKmwGwg
 67xxRCR3b3VGtn9MoYHeSHqsPU1XcnEi9gMQPpUM6ImlmDNUgUv3iePDVKqkCbq/SIS2gJeefF9
 +jXKHZXohPEDLvqpgUg5dUfZVENZv8tCt8anpd+2gmv/neboOQC0IRAny3a8LUilNCcc1+IRMxz
 t5g6bASM69PMV4yalU5+DQNXCmgYzdLjkqd2R5niDkYTmrVU1d6S0F+XCF4UHTj4dKr6fcGOCx1
 sYB5SFxhfyHoqbCV7xzqm0NnFg/Bow85WgE8XHjzCd+xxi+fAQ1EdXqOWhhIkvG7O7A4T1Tv4Db
 6A9U4eh8kXgx07tAZaSmrQxr3iKhw5lWKO7lzg7G7BxPyjlrRGBy/+hrEvdTMUqwDonYAoe3ndp
 W23MrK91IWJx1D
X-Received: by 2002:a05:622a:1394:b0:517:c582:9161 with SMTP id
 d75a77b69052e-517eefae2e8mr23319281cf.7.1781176974782; 
 Thu, 11 Jun 2026 04:22:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1394:b0:517:c582:9161 with SMTP id
 d75a77b69052e-517eefae2e8mr23319001cf.7.1781176974339; 
 Thu, 11 Jun 2026 04:22:54 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c907ddsm57321985e9.6.2026.06.11.04.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 04:22:53 -0700 (PDT)
Message-ID: <e9403bd2-b50d-40f0-9f1f-b4100334860c@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:22:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/22] hw/input/virtio-input-hid: use
 qemu_input_handler_set_led() for LED state
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-18-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-18-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX8rbudEnbn0Kf
 Nccu7Ef6hFxaPw7a1cnz5rwyXAtzfSV0z3WsqBRiibp4xKtO2HPO2ejP8SyMI5RNrYPiRezmX7V
 c54in7Ud/GumEzHojY+velgdu8UyxBNtuVERV+nGtBY52g6js3bA+XtjNMpTGc31thA/TaKtdvq
 +k4BuWpBUUs+3x5yLljz1n7SolvF6K3scWOXGhkNrw2EG+6V7rV/hw4UasitHBbRmcIhHlntLuN
 uTn2y0F9kT85xfENGoc+5RhjYk1yeqG7BxPW5v6tjrZprcFFg05Oi7T+npEbSYn0Sz7xdP91LLz
 vFJDGhxZllPgUEndhqp8o0FYgDM+2lpz7j+oAEAJVT/FwWGgmtf9RyQ/MvMPXchVAXRbUuPumMX
 njp40Npauu4kfFm5slCpPIabUaLrHMAIYftM0BWiqNnfSFxIPj+l1MLA5iplhtVk9tgJ8d4tUVs
 3/HR1t0itAA91Tzaw7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfXyN/ZgKqhsm6H
 eV3oKblRocgEhZBkQCu6HtZxoWb1A5CP7NOXRrQ3uIhOHiIA+ejrVD4wMrjExiGXOqc6R8WksWX
 nRfGktpHJnOEsU0SSku427faYzzl2ig=
X-Proofpoint-GUID: vFh5PSG_v3EANG6t7507zz4ifBAHFCpi
X-Proofpoint-ORIG-GUID: vFh5PSG_v3EANG6t7507zz4ifBAHFCpi
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a9a8f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1k1Y3PzgwnwA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110113
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 10/6/26 12:57, Marc-André Lureau wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/input/virtio-input-hid.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

