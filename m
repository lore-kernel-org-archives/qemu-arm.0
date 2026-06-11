Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84284CD8C9D
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 19:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXlIk-00051a-L1; Thu, 11 Jun 2026 15:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXlIj-00050r-2Y
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 15:42:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXlIh-0007r8-Gn
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 15:42:52 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BJERSL1401136
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 19:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TvylKnl8g91nEdStL4aCH+mwsBpLvFowEhkt4nU/E0E=; b=UXDl0FmKGNeZpgf1
 u99IfEB4vpImLbQ77iNKbBYUtv+ST0NeA6AiERjAT2DNk/zaVQ6nJzoWvMv4HT0i
 3lIC/vKMs4jEpkmLFkN4pfnEdrcdn9KBZg3qN3biz+PxiEhAnB851FWVOOysRroX
 DqCpfA//3vOMrkTWc4jYadSQHxkeoelpjY/3Bb1x/pMUOpaehZYa3qmooooWdxCO
 a4rLtfT7bLjlxRhfCBMyVJivEa9cdwUxONLvbDbWNkL/kPK0ZaN+OGiCEzQeZlMB
 Xfo7q2aC3e0ONBDQF5bYY04ZRXUwqZ0zKC73z2THIHxs1A6ILWVZkkewMIPYNk6g
 9prcLA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er30g83td-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 19:42:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cced8f230bso6397706d6.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781206969; x=1781811769; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TvylKnl8g91nEdStL4aCH+mwsBpLvFowEhkt4nU/E0E=;
 b=CBlkxE1Z613Uezp5xknhH6YqVlT0GbXQT+EX5Hl6mCqO9IgZJUA2owwDxmqt7Zq5qO
 OG66tDk+nE0nlPT/fcWtDJq6QJ8pSOcwK41lo19IZCv5IzVHbLOqLdoRbyuFfv1yI7xM
 ih+XF00rvRXDiTujozCGLje3fD0IzHcyeQ60eP1918ttCh/CIkuKgxkJPRpf7NgXEDri
 biNe+cHiWZiZxFcPsRvgO3ZvU76lNGM9ldwbAgBIcWtJwPrPLdQZsbRcdxjooRavfQ69
 pKYJY4x1WU0mHlMF4xSU1D8Zw5pJWMqZaTDMMzC+ueDhW3wUKzj1gAZfFN0AwAYZC2co
 CpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781206969; x=1781811769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvylKnl8g91nEdStL4aCH+mwsBpLvFowEhkt4nU/E0E=;
 b=MNsQFdWSS6OBVfedAGMHyCTTZTtwjZtuDPURnt6qyNXzCUw5InWTWu7pnQ71SXAlfv
 Bg+QUq3i+4S+7nG3yosDxa+/K2fPFGf11U3uoumo5xW/1u6zjvrsyON1ku7d1QDohWVb
 5SiDvW2ImbI1iro+EYZUn3oDHDW7nslCPBIZdQbO5yfpwqNKWmGBp+YPjxDZLnLYt6J3
 kRP249U8sbbCXjXuO0yvoAg5Bo0DzWZGzYtVe3ybwRZ+DrypMpFMY0ZC0tHa/MyjzI3D
 8KoyithQxXtZwa26GZBn9LdeGvPJ7bqYXUrVlyh8JFCSbvct+/vs25eUzCG5IDW2gDSF
 AMyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lntZAZ/gPwfY4me7ptEgl0xRDxDT0xQQ60hu/zaThAKL9FneovsT77wRyAiwYig+pntoYYqehuQ==@nongnu.org
X-Gm-Message-State: AOJu0YzKgahVDvJxbWfQkSmO9eSq2qgQNc8kVBeb/Vkjg+mfEHrl5LlC
 WelOlZakLCCgPUPA+x0u7OjcgMcv6hwDtYy2kyEK25Ul6bpyvwUlk0h90RClw299ezDtSH8D5su
 dG77Cx76IX+InX/ctjtqZ+5nH9/UXkCkh51zyXDtOVSZg98jLogjIugs=
X-Gm-Gg: Acq92OEY0FYBhpzvnllHu0NPQv5q/boKCVZerqcwQlo3cMGFeM2pWIjcIRV5KZjl4gz
 Bv09npm5AlyNWFhxgRnMb8dF2W18ndkziLjW97ek0aFMaIh43j3TF91HtK58r1R5NFECRtgOctt
 G88kW1IkxBH9aQJNLgivvPFkJQmBITtom8YjYY4r7/dMTKTL/HbQgB9Gdrb55LdOgvwtvByHX84
 Ix27QdxDjqkDVY+cryLqmVldZ4yqhJTDdBH9ZjmzToZIc+ySc733MeBg+uV68bKFqx9NaiM1/t0
 uhb9PTEXgphbqgzQlgFOxqWZ9pvKK7EwxzR+U0vC8Q716K8sF+F4jSGZIwJ+DLyZiEyxh69Iyav
 TD+cDfXhmZkJjyCrnnPCc9w1XcKPOUCPgEocqytq0zQtO/5H1hC/91PAtHZa4E0zbX7npZiz7
X-Received: by 2002:ac8:7f83:0:b0:517:c65c:3dba with SMTP id
 d75a77b69052e-517ee1f07c9mr69214961cf.38.1781206968800; 
 Thu, 11 Jun 2026 12:42:48 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:517:c65c:3dba with SMTP id
 d75a77b69052e-517ee1f07c9mr69214511cf.38.1781206968321; 
 Thu, 11 Jun 2026 12:42:48 -0700 (PDT)
Received: from [192.168.69.232] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4b39e9sm7059225e9.0.2026.06.11.12.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 12:42:47 -0700 (PDT)
Message-ID: <1476df56-193b-4524-a51d-a175a0b45726@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] ui/vnc: switch LED handling to Notifier-based
 input API
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
 <20260610-ui-input-v2-19-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-19-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5NyBTYWx0ZWRfX+Vtw1i8ePKHt
 YbTn1t/q/huLURVf3LQYRNcoXe/6MMC5KvmPt3qVHVzDoqcDwWS+KE+jooSiLX7uCARSWsAe+Rb
 GFpVGnFj6F675TxOESS99Crh1kYoJlw=
X-Proofpoint-GUID: KCgpXuG8ZG1L0645quE-Lw5nKlRippTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5NyBTYWx0ZWRfXxLN37ETjy3zX
 LP2pJ8jihEn5za7xtEp7kUao8rfm1Dq+BE5RgKH4cYgpppHx6lo3Uvy96uy9TKRTImE6puvp7Uw
 4o74f8QLB8YfJvQiGrPin65KzItmCB9S6/jjOW1Oy3pXUJ7YHBfG4ypryjiUV28m1RH+h2pB093
 tuGA/vHWrOFpZWfRgAUX8HAfhgtA1Od7NGd1V6f5RXm66hnb2ayTp8iRhzd6tdUixH2uwPlABpD
 Bzlo3gCxHFJWO6HcDUtB4ePWhBgaoA8xEx0XIhqiVrPRjmeEMbmnQtMj6yYofmI10stuAp27YXv
 rig90cE88KhgVPpjAQuiW4RcwtVKa6SvJOFytKumaAIYlqmpczh7G+p76L3+JpCDLFgefcx5OFG
 LmkmhegP8/E71kJXBdcIrqWWzmXhPdUEMN0tuPyWMIlaP0n2udiJO4QvbSUj56ohMtjwxbZ4qkt
 8c21pzTkGBpZ3N3rRGA==
X-Authority-Analysis: v=2.4 cv=evnvCIpX c=1 sm=1 tr=0 ts=6a2b0fb9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=BqTtkzC31Y18jNUxu3YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: KCgpXuG8ZG1L0645quE-Lw5nKlRippTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110197
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

On 10/6/26 12:57, Marc-André Lureau wrote:
> Replace QEMUPutLEDEntry with an embedded Notifier in VncDisplay.
> Use qemu_input_led_notifier_add/remove instead of the old
> qemu_add/remove_led_event_handler.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/vnc.h               |  2 +-
>   tools/qemu-vnc/input.c | 49 +++++++++++++++++--------------------------------
>   ui/vnc.c               | 11 ++++++-----
>   3 files changed, 24 insertions(+), 38 deletions(-)


> +int qemu_input_get_led(QemuConsole *con)

unsigned, const; otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>   {
> -    if (!entry) {
> -        return;
> -    }
> -    QTAILQ_REMOVE(&led_handlers, entry, next);
> -    g_free(entry);
> +    return modifiers;
>   }


