Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FE5C4452D
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 20:12:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmGoZ-0003nZ-9R; Tue, 21 Jul 2026 16:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGoW-0003mt-9n
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 16:11:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmGoT-0002PW-Aq
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 16:11:39 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66LHRKCe2446014
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 20:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t0GNFOxMvMLmDuJHKCfGeryl22Aw3cATsUNJObgg0r8=; b=XwvAmmtzj0a9ERNS
 O2gGWNpQaA7GaCvnu6EkayqJIunCXfaG6Z4tMKwehFl7EVvUnX9qku+Wbb/IlwGe
 9wgJ2FySsICxl+X+XeAO3PKF20lX/+JpM3h+zn/EEyXv9kn9oR/Tu6/3pf5HFcJS
 zEGEetMgDIw99MZcPiVEqiUXdyoghFz3TxA+TWF6K4vtnCzCRvHdx+KZL8k+UPhG
 LxiSBuTIxu3N+VFWP4X618Y/m9e3JuJrsQWo4jsTJmiDpeBaT7DxDr6d3mM2bR1q
 2KGh3l2n0oJJvQ7dv2Q89NUt39rmZRuLQiCGATlg58VrRWTSgaJAS7LxkjJ3iF3G
 X5l26g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d0qy4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 20:11:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c083f1818so157023361cf.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 13:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784664695; x=1785269495; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t0GNFOxMvMLmDuJHKCfGeryl22Aw3cATsUNJObgg0r8=;
 b=YiOm+p7xoGtpCK0XwXKqT4SoMFM/f9IGw5eCsbCgwH51SWcivzvTm+Ee1rV8NUOUB+
 ViCCSpjirV3+FYKJgOjTZyfLAisti3bDlBE2yclRTknfx83EjKJkpIpGFnLQ+YcrTvBP
 UKt70byxz6/GQBbA9QhxszAGz1LGQSXB4nsK//TVbVGc9Mzjgm0cf8QdKVNNT/fmp9PX
 rzCuUAHs82J0iossPmE5gG0virqI8Fpqn032kVABZ/VMjkzzg7KXwbvvjpUx++O7X56e
 C7zmYLEb6oN+E8p4F7taKK/m5J3gIlQAnnb75V9x8eluX40ZQZ8hde89+P2Q4I4FuBy8
 4k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784664695; x=1785269495;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t0GNFOxMvMLmDuJHKCfGeryl22Aw3cATsUNJObgg0r8=;
 b=DqbwzrB3P90v8b8LihXvCiV3vZ9x4UwQHQujqgEOAdq425awLve15aRZDWOabZNvEG
 kuTCJqtGvdKiIPmnBcSoTUpiUqhl8E8DHswh0zoHRMvo0h0eFsvJYirkOvg6VQzGu/wR
 ZQpBf3JrJsQlVZEIs9eaZrgC3LvBMUetXhwM8gk6dc0TaeLR7c9ejnO+4AcQIe/YgbrY
 E+KSaFf8wypYaW0MweHeoT4xNkCba6zhzq/Aa1umAr93ZSuzlDaJbuXtrX73H8nAOH5W
 gYT4LeUBo8pSjw+Ct7zcYHDmDvQOwfow0IzB5FJ0p1BoA/keAdJfLLVtdbLLMzMw0yoC
 mCRw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrbYyhlC+/+bAzV6EkO7Awom6nt0mLh4QZRjSJCj49lv6nnHP1TO8RwCUwjZwEBg4Z0S0YMaNoL/w==@nongnu.org
X-Gm-Message-State: AOJu0Yyxx6VKA6r/yg8IiLWo2ccfVzTFSSQc4M5+CVBTt7oY927XuzPy
 T/8P+j5/Msf7Cf3fTlzp7fCJX9rI0I2sYr36IcAPaVn5oVdEw2W2vXI5CPYAIZZwrI+BoCJ0J3Z
 FX6+ix3ZMmdxUsNhCD2m8mIdgvTT/EgL6BxSGcXIF0ian1x9k9LxmQPM=
X-Gm-Gg: AfdE7cnyA+2XT8OBU5ctJfdfDDhIDuuygVt7H05w07OPAraHI8cVFauBMQrGOCNaZZw
 tkG/L4oqET7rwLYpKufjv6hIWF1qan80BTPc4gvWZyOxBD/38uK2mWgAuZ3sr8DwtLoGC6ZQGF1
 AMTmTwAI6qyml7LuFV1PXXz7r7/CoIcpANxCOXz0Z8Fy8kISJSQHE1O+hnumUFr+RgQxZ/IMmOT
 qEdSThB6fhnBWDMBpBzSK+rjiykAmfAY2d26i3a2JsIcFveoOmi8kr/x62yYycvDORzjXqMkK6t
 YtELbJo6Z/WHfmQ9r3VsF+mrnZlWbJrORhGJ6UPdcAcfdgxGVWTVVYI2SuzW9N0ZK8xu0f66CbC
 Rrmp2azYQ8gPGeW8hbOtJ+QXFAsXgmnzHDLOaTittuhySUkRClwE=
X-Received: by 2002:ac8:5809:0:b0:51a:8c9b:6499 with SMTP id
 d75a77b69052e-5213d0c6e31mr199643241cf.61.1784664694918; 
 Tue, 21 Jul 2026 13:11:34 -0700 (PDT)
X-Received: by 2002:ac8:5809:0:b0:51a:8c9b:6499 with SMTP id
 d75a77b69052e-5213d0c6e31mr199642211cf.61.1784664693857; 
 Tue, 21 Jul 2026 13:11:33 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a4f2453sm18211865e9.3.2026.07.21.13.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 13:11:32 -0700 (PDT)
Message-ID: <356ebc59-d2cb-4c47-867e-8fc693b3a593@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 22:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 15/15] hw/qdev: Prevent devices from being
 realized more than once
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Luc Michel <luc@lmichel.fr>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20260721-qdev-v3-0-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
 <20260721-qdev-v3-15-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260721-qdev-v3-15-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U_3pwkrOGj-CD3g7vownUwYA1lajvxzK
X-Proofpoint-ORIG-GUID: U_3pwkrOGj-CD3g7vownUwYA1lajvxzK
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fd277 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=z4CWwV-Xco1BPblWOhEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxMCBTYWx0ZWRfX12ThWcPI2xc5
 uTAFxtp/iiqn7/Ydc+M3G2ufIPxXAu512cTrBxvJRXidZ8znYIOilODw/ig565wm3/vXxcMxxUu
 1jEvVo1/WqV+UcZrgISs4NiIQdagFGbZ/xMzGMgPamOr9QwVbDHuRpLaVBxDzAThhcxebDeTt8/
 PJTXmkdQQ+82RtNCaA6ji4+uRfvEOG1npVWVycKNxvHUwvFlo36OPVFnwnHq9SLRz7IV6tVzCbs
 q6uIsCNQGoHsTVAyc11ms4LAMAGFM+vLJc7pjJG2nwGTKlf9aX8urPgttR5zbNrvys9i2igz4a3
 d1f+yXFg2eiTSX1RWgMf9sOqmaYrYAlyVg0Ilqs5nBE0d6yyPkwftLcJnUf3OUmk+hTXgOspRJy
 nu3hLF6cmDJv8FveZJUFrSMCKNnak31mitPsd2Sm7IyKnkfd9lR3bmrq1yWazVH9jruZ3L4RUfW
 Xts59xYnt4yHMuyka0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxMCBTYWx0ZWRfX1f41i1EDvyER
 99/FHewOuqythRtL6uOSN1XaXW786uq/DbX9axzhH0UvNL7M4y/9lzoRWV0oXC/F8NAMDmWXAjb
 HL6gj3LgW4tXG7E4paE3gnzFV1ZMiF8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210210
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

Hi Akihiko,

On 21/7/26 10:17, Akihiko Odaki wrote:
> qdev currently permits reentrant realization of the same device. It also
> permits another realization attempt after a device has been unrealized
> or a previous attempt has failed. Either path can invoke
> DeviceClass::realize() more than once. Supporting repeated realization
> adds complexity to device implementations. It is untested and likely
> broken.
> 
> Replace the bool DeviceState::realized field with the enum-valued
> DeviceState::phase field. The enum has four values:
> 
> - initialized
> - realizing
> - realized
> - retired

Excellent.

I have been working on something similar.

I'd start the first patch only including:

DEVICE_PHASE_UNREALIZED (false)
DEVICE_PHASE_REALIZED (true)

Then gradually rename DEVICE_PHASE_REALIZED -> DEVICE_PHASE_CREATED
and add the DEVICE_PHASE_REALIZING and DEVICE_PHASE_RETIRED phases,
so we can discuss them during the review process.

> Realization can start only in the initialized phase. It moves the device
> to the realizing phase before invoking callbacks, preventing another
> realization attempt. Successful realization moves it to the realized
> phase; failure after realization has started moves it to the retired
> phase. Unrealization also moves a realized device to the retired phase.

So what is the difference between 'initialized' and 'retired'?

> The QOM realized property is an internal lifecycle property, not for
> end users. Replace it with the enum-valued phase property.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   qapi/common.json          |  19 ++++++++
>   include/hw/core/qdev.h    |  12 ++---
>   hw/core/qdev-clock.c      |   4 +-
>   hw/core/qdev-properties.c |   4 +-
>   hw/core/qdev.c            |  98 ++++++++++++++++++++++++++--------------
>   hw/scsi/scsi-bus.c        |   4 +-
>   qom/qom-qmp-cmds.c        |   2 +-
>   system/qdev-monitor.c     |   5 ++-
>   tests/unit/test-qdev.c    | 112 +++++++++++++++++++++++++++++++++++++++++++++-
>   9 files changed, 212 insertions(+), 48 deletions(-)
> 
> diff --git a/qapi/common.json b/qapi/common.json
> index af7e3d618a7c..88a308cbd172 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -7,6 +7,25 @@
>   # *****************
>   ##
>   
> +##
> +# @DevicePhase:
> +#
> +# An enumeration of the device phases
> +#
> +# @initialized: the initial phase
> +#
> +# @realizing: the phase during realization
> +#
> +# @realized: the phase after realization
> +#
> +# @retired: the terminal phase entered when unrealization begins or
> +#           realization fails after starting
> +#
> +# Since: 11.1
> +##
> +{ 'enum': 'DevicePhase',
> +  'data': [ 'initialized', 'realizing', 'realized', 'retired' ] }
> +


> @@ -477,10 +477,10 @@ bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
>       return false;
>   }
>   
> -static bool device_get_realized(Object *obj, Error **errp)
> +static int device_get_phase(Object *obj, Error **errp)

DevicePhase

>   {
>       DeviceState *dev = DEVICE(obj);
> -    return dev->realized;
> +    return dev->phase;
>   }


> @@ -670,7 +702,6 @@ static void device_initfn(Object *obj)
>       }
>   
>       dev->instance_id_alias = -1;
> -    dev->realized = false;

Can we keep the initialization explicit? This helps when navigating
the code base.

>       dev->allow_unplug_during_migration = false;
>   
>       QLIST_INIT(&dev->gpios);

