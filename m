Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE7DCA6004
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 20:45:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEYVL-0004eD-Fg; Wed, 07 Oct 2026 16:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYV7-0004cY-Mq
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:44:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEYV5-0004tu-Mz
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 16:44:33 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697JO4KT658433
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 20:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rpSJ/ZrysyVOV7lotqE++dBrBakcCvEs2ZV4gQpOGwM=; b=Z/6doW6VXl6Gy0zT
 qv9d1CCmWJwOtqkiHMlboJNi0KFmP+xly0Ckx6clcs+adx7uqazIbaX8ojJwjmlK
 R9ad0ytG+CdQLS8kDnxMk8NEZ3XGqcavoGvOCwAJvD7/PouqOJPKWYLnLDYhaw4q
 NSzHez2txptMeZfsothvZgm6kH+/O6Gb1kfD0GnuLyTSgtiJ6zQvY60ApV9sf85q
 qi1lVCd0VYc/1QI4XX9xYKhcpn+UfMTObX3scdWk0RWK4lC65AA8d7UjVC/zdvqN
 3bXcGej5JaWAeOncwUlZcfKAmCnET1ZRWDBZ/MfthvKpJgtut4RmkLzrVN3bCzo2
 IboxDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv71quv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 20:44:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3510562ef98so5950747eec.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 13:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791405869; x=1792010669; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rpSJ/ZrysyVOV7lotqE++dBrBakcCvEs2ZV4gQpOGwM=;
 b=ejMUsgkjjOphZ7iunghB6X4PX+yqoU9NFs4thy+WM2TtZQNfbafsvFB9yUYdrq3vwS
 r3wrSSwBzNCuuHNnZD9CgukkrKJfw7pChFZx5klQF0tu2WbsZ3vX8r/IPSLRWqzpX+mR
 o5V66nrAiRibberPIb2Mnl6k0MokerTi2nngBuo+W6eyn33N90qzwpAQnug7hgkNax4N
 WdFjWi1FQiY6xiD9GlUW1gIpHbnbyEfYzQMNgVnV9iDyg+pXXBzVApOBAKrPieXg3bdM
 MPivATqoK9IZSp62cYdVVotRHRPM+2bwiXrK5Eq1Bo6VtOk3ShWrh6BuW1ENr/mRLWXS
 Vruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791405869; x=1792010669;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rpSJ/ZrysyVOV7lotqE++dBrBakcCvEs2ZV4gQpOGwM=;
 b=pKZIuTmJ0nh9kAoxmbrUCbETKfNjgLdW1lOWIcVdTn8AgxuGXEzHlDH/DOYRckDRu8
 VBEKj5JzhFQFOdyFBCgS5/TZPF88D1CHs1wze8T5elSvprqgG30gqS5Wb6i87RhNjeS5
 6xPWfAWQEmzovrgZJW6yxqEvnsPtJMPQGDWh+8clZghat1+1QYptxJ2MMRl31RpduA46
 Dwklpy4JKpgAtWmGqC4Z60Zq45l0Uk+8KXPGOgDD9zxyeNK4j8YFhFfLmLpL5NPs3jMB
 aKNCDWgVm0x1lDar90wnQNR4aanaIO+kDc0texyl8GijgdMfZsrr+oJJvDMkbQR0TD7f
 8foA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy26D6x27QPrmDv0GYZ7ypfcr/Mw+wwzCevna+xk7xDrucIH3tRwMEe2rCaZydKeM+UUIIjCJb5Rw==@nongnu.org
X-Gm-Message-State: AFq9FYKeWUZY/RB5hZrtljeIkb4zJt4vZWg3nEHgl+f2G4ezareiR3Tr
 jdQx7MhKr7XBQsnkeN/PYbniHy3O2oz34ktrqUP9UHLlyOrBJKMLsN/oe2kRtshA+BIycBntov0
 psxbp1/sLN6u3LZiVRVzCOKOsZMysttdVRAJdSCA7O2mRG7uxuCP8OGg=
X-Gm-Gg: AYBFou2FGg3dxyq26UgABA35jBWfG21qs3TsC4XoaWYMJW1Wa+PjysotHANzUbdEak7
 IEesBwDzQjikA3nzLSuWxqO1OtXvsP030BC8rJL8VnHDxfV7p/EJhV/E+y7LMKwsKjdrJjTK7JA
 tg0JUYInFSpCA5CGPMv9OONioOB8FfLkvnhUr9QzDEdKftHhFXCi8ROsKILE20raPkYBBjaXjnW
 fcvm45CFGMor0IuRZbzi00rsSamgKZVI/jNp4xK8h/g+0KbZ+jB9yZ1BPZlIcP2AukIKSJb1QBa
 LTwgw2pmdPqc1WA1094oW1qRemL0HkUEb2ybmrzffrYl1B8ReSH/aW+L4LUw6+PYFpVkRGsR9iV
 eoPUqJacZrr/owZcDz1Y21pl/2zBijGhJAt7fuxLb74c/0E3+fJFy6uzMCboZzCs0e6bGYA==
X-Received: by 2002:a05:7301:1827:b0:34c:e77c:f92f with SMTP id
 5a478bee46e88-3515de87218mr3185251eec.37.1791405868412; 
 Wed, 07 Oct 2026 13:44:28 -0700 (PDT)
X-Received: by 2002:a05:7301:1827:b0:34c:e77c:f92f with SMTP id
 5a478bee46e88-3515de87218mr3185219eec.37.1791405867771; 
 Wed, 07 Oct 2026 13:44:27 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515afab2c5sm8924118eec.21.2026.10.07.13.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 13:44:27 -0700 (PDT)
Message-ID: <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:44:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-9-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007115253.328-9-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4MiBTYWx0ZWRfXy/6eytnGwfoH
 6ydFZjmAXQ6jLVLUWHPwkEyhwwmq6GpitbCMvtSjsxKrDNPmBCb3o3WzJ5WJ/tbGJpT/PZTm1NU
 gKNPPyZ2HsMVsk6t0/mofgofhvwJHAg=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac6af2d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=OUyg3ATPP_6f84ILN7EA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: qLT86vEZ-V2k5u0qgUgwqE7y2_QVL64Z
X-Proofpoint-GUID: qLT86vEZ-V2k5u0qgUgwqE7y2_QVL64Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4MiBTYWx0ZWRfX0tVFgAppn0B1
 60/5QJ6dXPxH/KAG6z4ux6sqPXmPLFxJ8LThK0ZWnXIsfcxa39z2stexQ9yFoUHGd7NJRrNINk/
 XY+Od5lSFhDIwzVl2sHLJefQ306SkZMOLyvwvhWQToxHpj6FHdk39hH4wi7Ul1yIQaEGLBJYAzF
 DMFPCCU2L5u1gMJUei7kERdhrjjhiqNS5Qtu5qSCLj+1bdyqACHk2BN5hAG+MKzEhHukvhBgZb2
 dQ7nnQ6b6xcDQz8DdNZnhet4DdW/fJ5D+5V9aX9SZmWJauKpakmeNfK2Tr336x2qX9Tw52O8ID5
 W1bbhMvv6AffJBy+WLsq68oAbJFrKMGw++WrIgc6cKep0AoHTQ2F/nxy8pY3ZC+ooc0vqUS2cRE
 NdqEsAjazhQ1XAvCCK/cu96lMSVZEHbZG3oe9xVvRuQKzajvy+Q8bCJYiaJKOwWZjNEF2ZsmBhz
 oDLG/fzBtsCNweHwIlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 10/7/2026 4:48 AM, Yonggang Luo wrote:
> Change TypeInfo.is_available to the new TypeIsAvailable type, which
> takes a const TargetInfo *. Registration passes target_info(), so
> behavior is unchanged. object.h only forward-declares TargetInfo.
> 
> Switch the existing users (raspi, raspi4b, ast27x0 evb and fc) and the
> generated machine parents to the matching target_is_<arch> helpers.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/arm/aspeed_ast27x0-fc.c  |  2 +-
>  hw/arm/aspeed_ast27x0_evb.c |  4 ++--
>  hw/arm/raspi.c              |  4 ++--
>  hw/arm/raspi4b.c            |  2 +-
>  hw/arm/virt.c               |  4 ++--
>  hw/m68k/virt.c              |  4 ++--
>  hw/or1k/virt.c              |  2 +-
>  include/qom/object.h        | 12 +++++++++++-
>  qom/object.c                |  3 ++-
>  9 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
> index 73362b60d2a..8a7c6a116ac 100644
> --- a/hw/arm/aspeed_ast27x0-fc.c
> +++ b/hw/arm/aspeed_ast27x0-fc.c
> @@ -234,7 +234,7 @@ static const TypeInfo ast2700fc_types[] = {
>          .parent         = TYPE_MACHINE,
>          .class_init     = ast2700fc_class_init,
>          .instance_size  = sizeof(Ast2700FCState),
> -        .is_available   = target_aarch64,
> +        .is_available   = target_is_aarch64,
>      },
>  };
>  
> diff --git a/hw/arm/aspeed_ast27x0_evb.c b/hw/arm/aspeed_ast27x0_evb.c
> index 460c9ff0d2e..02a8cff1d9d 100644
> --- a/hw/arm/aspeed_ast27x0_evb.c
> +++ b/hw/arm/aspeed_ast27x0_evb.c
> @@ -75,13 +75,13 @@ static const TypeInfo aspeed_ast27x0_evb_types[] = {
>          .name          = MACHINE_TYPE_NAME("ast2700a1-evb"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_ast2700a1_evb_class_init,
> -        .is_available  = target_aarch64,
> +        .is_available  = target_is_aarch64,
>      },
>      {
>          .name          = MACHINE_TYPE_NAME("ast2700a2-evb"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_ast2700a2_evb_class_init,
> -        .is_available  = target_aarch64,
> +        .is_available  = target_is_aarch64,
>      }
>  };
>  
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index fadbacb2534..22b06c6ca22 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -403,12 +403,12 @@ static const TypeInfo raspi_machine_types[] = {
>          .name           = MACHINE_TYPE_NAME("raspi3ap"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi3ap_machine_class_init,
> -        .is_available   = target_aarch64,
> +        .is_available   = target_is_aarch64,
>      }, {
>          .name           = MACHINE_TYPE_NAME("raspi3b"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi3b_machine_class_init,
> -        .is_available   = target_aarch64,
> +        .is_available   = target_is_aarch64,
>      }, {
>          .name           = TYPE_RASPI_MACHINE,
>          .parent         = TYPE_RASPI_BASE_MACHINE,
> diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> index 566d64572db..a1dc477f25e 100644
> --- a/hw/arm/raspi4b.c
> +++ b/hw/arm/raspi4b.c
> @@ -121,7 +121,7 @@ static const TypeInfo raspi4b_machine_type = {
>      .parent         = TYPE_RASPI_BASE_MACHINE,
>      .instance_size  = sizeof(Raspi4bMachineState),
>      .class_init     = raspi4b_machine_class_init,
> -    .is_available   = target_aarch64,
> +    .is_available   = target_is_aarch64,
>  };
>  
>  static void raspi4b_machine_register_type(void)
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9d192515d85..18160f7fad3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -132,7 +132,7 @@ static void arm_virt_compat_default_set(MachineClass *mc)
>          .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
>          .parent = TYPE_VIRT_MACHINE, \
>          .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
> -        .is_available = target_base_arm, \
> +        .is_available = target_is_base_arm, \
>      }; \
>      static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
>      { \
> @@ -4430,7 +4430,7 @@ static const TypeInfo virt_machine_info = {
>           { TYPE_HOTPLUG_HANDLER },
>           { }
>      },
> -    .is_available = target_base_arm,
> +    .is_available = target_is_base_arm,
>  };
>  
>  static void machvirt_machine_init(void)
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index e52546e4fab..ad2a43ef3fb 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -327,7 +327,7 @@ static const TypeInfo virt_machine_info = {
>      .parent       = TYPE_MACHINE,
>      .abstract     = true,
>      .class_init   = virt_machine_class_init,
> -    .is_available = target_m68k,
> +    .is_available = target_is_m68k,
>  };
>  
>  static void virt_machine_register_types(void)
> @@ -355,7 +355,7 @@ type_init(virt_machine_register_types)
>          .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
>          .parent = MACHINE_TYPE_NAME("virt"), \
>          .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
> -        .is_available = target_m68k, \
> +        .is_available = target_is_m68k, \
>      }; \
>      static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
>      { \
> diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
> index a3ff903839b..89fb786641f 100644
> --- a/hw/or1k/virt.c
> +++ b/hw/or1k/virt.c
> @@ -559,7 +559,7 @@ static const TypeInfo or1ksim_machine_typeinfo = {
>      .parent     = TYPE_MACHINE,
>      .class_init = openrisc_virt_machine_init,
>      .instance_size = sizeof(OR1KVirtState),
> -    .is_available = target_or1k,
> +    .is_available = target_is_or1k,
>  };
>  
>  static void or1ksim_machine_init_register_types(void)
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 4c0645817a5..7d52a15f6b8 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -17,6 +17,7 @@
>  #include "qapi/qapi-builtin-types.h"
>  #include "qemu/module.h"
>  
> +typedef struct TargetInfo TargetInfo;
>  struct TypeImpl;
>  typedef struct TypeImpl *Type;
>  
> @@ -117,6 +118,15 @@ typedef void (ObjectUnparent)(Object *obj);
>   */
>  typedef void (ObjectFree)(void *obj);
>  
> +/**
> + * typedef TypeIsAvailable:
> + * @ti: TargetInfo to test.
> + *
> + * Returns whether a type is available for @ti. Typical implementations
> + * are target_is_*().
> + */
> +typedef bool (TypeIsAvailable)(const TargetInfo *ti);
> +
>  #define OBJECT_CLASS_CAST_CACHE 4
>  
>  /**
> @@ -498,7 +508,7 @@ struct TypeInfo
>      void (*class_base_init)(ObjectClass *klass, const void *data);
>      const void *class_data;
>  
> -    bool (*is_available)(void);
> +    TypeIsAvailable *is_available;
>      const InterfaceInfo *interfaces;
>  };
>  
> diff --git a/qom/object.c b/qom/object.c
> index 96498f3d001..253b9562b41 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -15,6 +15,7 @@
>  #include "qom/compat-properties.h"
>  #include "qom/object.h"
>  #include "qom/object_interfaces.h"
> +#include "qemu/target-info.h"
>  #include "qemu/cutils.h"
>  #include "qemu/memalign.h"
>  #include "qapi/visitor.h"
> @@ -167,7 +168,7 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
>          abort();
>      }
>  
> -    if (info->is_available && !info->is_available()) {
> +    if (info->is_available && !info->is_available(target_info())) {
>          return NULL;
>      }
>  

```
info->is_available(target_info())
```

or

```
is_available() {
  TargetInfo ti * = target_info();
  ...
}
```

Are doing the exact same thing today.

So what is the future goal requiring to introduce this?

It's something we asked multiple times, and until we don't have a short
series doing this change + a single and minimal modification showing the
reason, I will still be asking.

If the goal is to implement some sort of classification for
machines/cpus, I would suggest to just send a simple series doing this
change (and only this - no additional cleanups/refactoring), and an
example for a single machine + cpu, so we can talk about it.

Regards,
Pierrick

