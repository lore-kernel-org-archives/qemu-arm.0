Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED138C98318
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 09:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAP19-0007pw-Oi; Sat, 26 Sep 2026 05:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAP10-0007of-Vv
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 05:48:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xAP0z-00028r-48
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 05:48:18 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68Q6P3O43268392
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 09:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nsyljrcJz+7hDpqgAdLfkjNEBVvfzVs+C1b1nrjCPX4=; b=PlFvb5mNnxKmJ3+G
 9u/JSfpm2MaINsxp2RhUg8AtARGyGeu8eBfHmrp/pMqEUcQYcIc2dduON5E5m8mg
 O83HYZNDJ/SiV2rqL+rVN4/z3SrEZTCQZdG64oEoYIypoIVzEiwfRwTEqf+tKBdg
 nnON9FFJmDxRIUvRVB/Coe+b0HNGneMpd4wpX55X7bRsULda3XId8/CF96S/Wsfr
 vKe99mgXFn5nCCcBXRnCO0VM9xfaeTuebx2C+ooG+icCuLVxScWjeJLLNxye1og+
 by0IKtZ/rQ5KTy8+VKz03ZD97aETTCJZwUDBLhLS/JLsHCzClihT5tM4Cp+jUYiz
 pcvM3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0x83-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 09:48:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a08ff8451so284283485a.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790416094; x=1791020894; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nsyljrcJz+7hDpqgAdLfkjNEBVvfzVs+C1b1nrjCPX4=;
 b=B8197ztlTE8gKYvZGnzRO7euugunRTIF0IrlkgxvpZ8m+lzURGW2c3xkVo7mN9QaEM
 BfQ6bwYCwh2WtR0MuUwuwac4dWMeaMhsHzZHAmX+2CsT3RsQ9LjFE8ANwpreL2atU6Oc
 TNmszwpVuU1uta/bLiaSmGi1M0Paqj48PeKki+V2ZpzQgBN8wwpixCOz+fmxMUJLX9S+
 UKb/NxvhZnygWQb1/17jvxIiQLNa+hYPA27cuMSi3RssvY212X4aSG47LgpFo0GRIb/I
 vKd385s+BEGuOxeE23z5Vrn1/XcrIBRvtKAJRFl+Z9A+LXx14aN3qOVnaLA6LCd41feM
 nTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790416094; x=1791020894;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nsyljrcJz+7hDpqgAdLfkjNEBVvfzVs+C1b1nrjCPX4=;
 b=KU039OZVLnQOu/iPKJ3g4PVIHTGUd3Q/tQMtoGIY5c/fx/twewNrMls7dUMjzGY15O
 Kz6sAlyjBPwDbbx6ysfhtxyRbg26cJRNTR21wrl6OkJ83hl5IwafxR5FQwn28nwDWLeB
 QkglMwhiUOOKmkpWrxZgcNW+X9Z2cozIu/JppcTs94joPJrznI3XiMbM+hYs+6Tr/De1
 ++LMHuNcY3l4QibgjQ/gNF19X8by2WWYsBUCCduzmvpQXXZwQd+4rBA9roYsFTradkRq
 UZyDWHXEareZWV4O609m7PBGpv0JvHNG/ajXlFW+o/fRSLrAZV2LdZPJ4mFsbwE+O6nk
 Apjg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6wsFkzzfMdBONTh6THJmiYIRW5aEKA+4ZRAaVqCf9VbUz4GkTnhX28r7xAlB5aYB1itRAfJJ05Q==@nongnu.org
X-Gm-Message-State: AFuF++nrQHTlGEZiQHZw6eP4zBdDOpX1TbIxZ/xrpZK/8nt1fhcuEO+T
 IbMLqgsauUIQpmggeXCxjZr2xPznvJyfbL4qZQj9iVk3wJEH9Nz1oxePhTjw40CfIJjXA3ecNkS
 eSFcw2BLzzjI8eGhm2rVRAYQhEev1AGW7W6ROHgPpbQ4kqJXtoDFRYj8=
X-Gm-Gg: AYBFou1mbIryoR+94EvlIRhpEJ3y6Srug4kax26P207p8E5w14I7fIMi/jwTiGty2IO
 pSYD0UzR81gTCZ3riZOMIrCVzAODBiuaWCmerMFMz29SCzuc0yMwHCHCdYpBjKmYYDr2RdRCUqI
 dI80BekDBNjqHvGCAedNekCfrX44wWfij/wRHE3c50e11yencmuoinkhJhTtmNif4Wp7drEOMrq
 BdS6NH9OthbfDspX7fp8+7KXGk/I88DalVBrUtDF4oBIc0nCb0sTsEeP0A9ptxAtB6aA3BNmBg9
 GNUYFCLW43LpnaU3wSDO5Pwz49NkNZg49s6XYgN6h8THHzCMBZc3R2DwBOxeW0a96Ke2tQUIqXl
 AB7BEa2MKnzackQrSmy5zCrs8go4Lb9BRFQ==
X-Received: by 2002:a05:620a:440e:b0:939:c555:efb6 with SMTP id
 af79cd13be357-93c43b7e8b5mr929769885a.12.1790416094472; 
 Sat, 26 Sep 2026 02:48:14 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:939:c555:efb6 with SMTP id
 af79cd13be357-93c43b7e8b5mr929765585a.12.1790416093984; 
 Sat, 26 Sep 2026 02:48:13 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a746c57sm12165585f8f.35.2026.09.26.02.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2026 02:48:11 -0700 (PDT)
Message-ID: <99d1d189-fd2c-47fd-83ba-e232121096e4@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 11:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] hw/qdev: Introduce DevicePhase
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
References: <20260914-qdev-v4-0-93f849b4865c@rsg.ci.i.u-tokyo.ac.jp>
 <20260914-qdev-v4-2-93f849b4865c@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260914-qdev-v4-2-93f849b4865c@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAzOCBTYWx0ZWRfX7euS/aiHzeDK
 HBny+7c/iy67mUGFamr1ZIwNY8Zn/dwjSYvSyp5mhiOCePvd3vrmJHmUf11RF7VKKykk9SLiMon
 ZQIw1g4BAt+l8qSo3nEXxgCbTRYqT7s48FhSYvomNGydde85EBhzsvywb4SuXCflZh+iDwTY5E7
 XsN+nqOSX7MwQbX4Csgw/CNkv1cx0OowkYXk1+uok7SoBmHXekmicqgKzPuE2Xup5ru0GjLn+rZ
 tFNiB0Ek5/2DEr1eh+ocrRMYY2fH4KHAm+WOy8SAogZaCeCbNk12nWgD1ND6cs2++FGhuUo5BZz
 BG/w22gyV4Kk0Z0S1jSlTc/4HazUe/9tvcy6Tu4Y/8AeLvaAdIPifPOwpt7Rdl443TqJy3Q5fkU
 Hw5a/wnOX3YofawTtPFlg7jWwV7iXufXPZzB/ijEZ9qaOsrUl9qpkxDaQ5q6SMSG2I1kpSFcsL8
 xdzLxZygDHGIZ7IiUyA==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab794df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2_YoaiJFEchiNid7zjQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kFnkjpVKOn51dgjaaEWHfENx10KlCivP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAzOCBTYWx0ZWRfX+v8xtLyA9Y5I
 nztAD3SHK5p3BlpmJcucHVunUAFrKD2rvWZqoLLFq1eAxc8qUDKbpBCmUv5Hiu+BF4D5VonU1hA
 femk8hXIQiVXa3NTYmT9Niy1k02DrHE=
X-Proofpoint-ORIG-GUID: kFnkjpVKOn51dgjaaEWHfENx10KlCivP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260038
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

On 14/9/26 11:31, Akihiko Odaki wrote:
> Replace the bool DeviceState::realized field with the enum-valued
> DeviceState::phase field to express finer phases in following changes.
> 
> The QOM realized property is an internal lifecycle property, not for
> end users. Replace it with the enum-valued phase property.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   qapi/common.json          | 14 ++++++++++++++
>   include/hw/core/qdev.h    |  7 ++++---
>   hw/core/qdev-clock.c      |  4 ++--
>   hw/core/qdev-properties.c |  4 ++--
>   hw/core/qdev.c            | 45 +++++++++++++++++++++++----------------------
>   hw/scsi/scsi-bus.c        |  4 ++--
>   qom/qom-qmp-cmds.c        |  2 +-
>   system/qdev-monitor.c     |  5 +++--
>   8 files changed, 51 insertions(+), 34 deletions(-)
> 
> diff --git a/qapi/common.json b/qapi/common.json
> index af7e3d618a7c..415a2722fc1a 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -7,6 +7,20 @@
>   # *****************
>   ##
>   
> +##
> +# @DevicePhase:
> +#
> +# An enumeration of the device phases
> +#
> +# @unrealized: the initial phase
> +#
> +# @realized: the phase after realization
> +#
> +# Since: 11.2
> +##
> +{ 'enum': 'DevicePhase',
> +  'data': [ 'unrealized', 'realized' ] }
> +
>   ##
>   # @IoOperationType:
>   #
> diff --git a/include/hw/core/qdev.h b/include/hw/core/qdev.h
> index b1c5f4780a90..ff367b2a5f98 100644
> --- a/include/hw/core/qdev.h
> +++ b/include/hw/core/qdev.h
> @@ -1,6 +1,7 @@
>   #ifndef QDEV_CORE_H
>   #define QDEV_CORE_H
>   
> +#include "qapi/qapi-types-common.h"
>   #include "qemu/atomic.h"
>   #include "qemu/queue.h"
>   #include "qemu/bitmap.h"
> @@ -232,9 +233,9 @@ struct DeviceState {
>        */
>       char *canonical_path;
>       /**
> -     * @realized: has device been realized?
> +     * @phase: the current phase
>        */
> -    bool realized;
> +    DevicePhase phase;
>       /**
>        * @pending_deleted_event: track pending deletion events during unplug
>        */
> @@ -440,7 +441,7 @@ DeviceState *qdev_try_new(const char *name);
>    */
>   static inline bool qdev_is_realized(const DeviceState *dev)
>   {
> -    return qatomic_load_acquire(&dev->realized);
> +    return qatomic_load_acquire(&dev->phase) == DEVICE_PHASE_REALIZED;
>   }
>   
>   /**
> diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
> index 861f78f94c64..efb33a3a27e7 100644
> --- a/hw/core/qdev-clock.c
> +++ b/hw/core/qdev-clock.c
> @@ -30,7 +30,7 @@ static NamedClockList *qdev_init_clocklist(DeviceState *dev, const char *name,
>        * Clock must be added before realize() so that we can compute the
>        * clock's canonical path during device_realize().
>        */
> -    assert(!dev->realized);
> +    assert(dev->phase != DEVICE_PHASE_REALIZED);
>   
>       /*
>        * The ncl structure is freed by qdev_finalize_clocklist() which will
> @@ -186,6 +186,6 @@ Clock *qdev_alias_clock(DeviceState *dev, const char *name,
>   
>   void qdev_connect_clock_in(DeviceState *dev, const char *name, Clock *source)
>   {
> -    assert(!dev->realized);
> +    assert(dev->phase != DEVICE_PHASE_REALIZED);
>       clock_set_source(qdev_get_clock_in(dev, name), source);
>   }
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 34d7b26a7303..66cff4b9338c 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -33,7 +33,7 @@ static bool qdev_prop_allow_set(Object *obj, const char *name,
>   {
>       DeviceState *dev = DEVICE(obj);
>   
> -    if (dev->realized && !info->realized_set_allowed) {
> +    if (dev->phase == DEVICE_PHASE_REALIZED && !info->realized_set_allowed) {
>           qdev_prop_set_after_realize(dev, name, errp);
>           return false;
>       }

IMO a preliminary patch should convert to use qdev_is_realized() where
appropriate (due to the atomicity), then this patch which LGTM btw.

