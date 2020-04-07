Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp5460503lfi;
        Tue, 7 Apr 2020 10:03:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypJqkgr+stvidBvcf+IMyCaj5A0rLsBFjpo2fksRMemIej2rhZr8sBkgQiGYs9Oz6sM/Rqjq
X-Received: by 2002:ac8:2224:: with SMTP id o33mr3296722qto.263.1586279035159;
        Tue, 07 Apr 2020 10:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586279035; cv=none;
        d=google.com; s=arc-20160816;
        b=dMl8dySDoFwPKRRrbklHvro/zjW4WAyRZ+jAmYGEupIFGLwBqkeOkvWPqrPj66w6cw
         8otzCRFU9ZqRBRh6ZpyEHxJtAaT5Ih5RRQyIfrniruitwfs9R+ikch+/9iHpD7t72fKa
         M/iVjwt9pGv4Hy3TSRT5Nl4PlfRJVs8tVyxZBP0ybYJtxw6+mFOxIVmt+jcN5I5LkGG0
         pcLMwj2F4fqV5YZCC9tuLbBJxdoR4iLOrTanAMq4f9dcnG3Q+yQpJgbtVaIkbQ8poJhD
         SUZM6qCjDBduUGIxxuIMU7H+n66yqMF0i4xh79fKzvsHU0QZ46VExJlFAHlY4FTG9aOn
         TS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BFcrQtnbq9bGO2WHRbOIRBXA+nrThr7Gu72V5uBbUYE=;
        b=fYJFIX4x42ZCvPBWHuJG/9JISABe4hdYis55VTI+8RQSxLz+RDT5LBVxEudY7tfdEa
         Dgycr2uaDICkXrge9rdzIDBKFQTt7kXzZ9Mnu9i+OaYkVLBoFl3D3h1++OjBwncecVQh
         BrXkhA5GlaukDV21WRKYfA9lTPoMulqPu8Agbynyykua1kvW0cDye5n9Nqgh+rGJftkk
         ek64wNiFUDEUF0tpE3QWDaI4JmL2PDAHSuD2YcQW/6H0mVv5qHnoUa/Q0Nw86JNLaLsx
         tk359g0abA8hy79NNInAANH/JdLS4xX47yZSerOM0b2mE0RpEP1KG76TmHb8pRMvtfuA
         sVrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=duuyvJcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si2175073qvn.41.2020.04.07.10.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 10:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=duuyvJcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLrdi-0003IJ-IM
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 13:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLrdX-0003I1-64
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 13:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLrdV-0002xB-1I
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 13:03:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24078
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLrdU-0002wh-Sr
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 13:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586279020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFcrQtnbq9bGO2WHRbOIRBXA+nrThr7Gu72V5uBbUYE=;
 b=duuyvJcGggZdlp/GX7gTILqi2EaiBueqgYQoK79ChLNQrC3A/fKATypyZZIhuiXMFSo3xB
 nzTiRjsWgDC9KtD13fPFlvicGho9oGHLIX2v1sFaLo6EWo4JJLnEjx4Kuawmq1+rbQtEqt
 On2wxeUvJ16L0vAZF4kNHTMH1/EeSt0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-jwTa3_iAOIurAi7NpXfDJw-1; Tue, 07 Apr 2020 13:03:35 -0400
X-MC-Unique: jwTa3_iAOIurAi7NpXfDJw-1
Received: by mail-ed1-f72.google.com with SMTP id e24so3658867eds.18
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2020 10:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9e7fiOmxM++2ZZJ8ql55IWjO/GeN9bp7lW3qHRePFjI=;
 b=Fjx1dBeXlzB7JGDtIZ+6k7okON1uKguuRy02pFOOQ/uMx1G2f51OoINYkwh5no2USY
 9bc7WAJvUaWyt2JpXgX6AFaNfKBx2eEZyLmr21uS9tEXg39nqUoLFjchk3oog2QCaLkd
 UZfGF8dgtIMe8GiIGk4cNkQZQIF1ipwyrOm8jCQDS8retLeMfCIuYkAAsADvYff+Ej5u
 jhCJyQvG3fMLH2wxsoHgfP/2sXRDJkMXaEqRE4fyAsyxeQ7DkDKLeF1jGNJ++vHNiH9p
 C/xr7OQmDZ5jjgmdEF43IHP7/6y1ia3z6TKNfEOKED7LukRqsuwOulRUkAdPq3kVN9bD
 AWgg==
X-Gm-Message-State: AGi0PubskbE0yh7PdY8u+2fci2LT6JnhS+QaizWF9hBLYYI6uNBekSZQ
 hVYUB79962f1+iGi4G6JZgrrfnMn7jKa07RfB0GNU+yieE6HQJ/9a0/zr1woWb14X4XAV/PDrQd
 UX8b9m3WTdryP
X-Received: by 2002:a50:a0c7:: with SMTP id 65mr2923450edo.7.1586279013711;
 Tue, 07 Apr 2020 10:03:33 -0700 (PDT)
X-Received: by 2002:a50:a0c7:: with SMTP id 65mr2923415edo.7.1586279013445;
 Tue, 07 Apr 2020 10:03:33 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f17sm2691656edj.86.2020.04.07.10.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2020 10:03:32 -0700 (PDT)
Subject: Re: [PATCH for-5.0 v2 2/3] fw_cfg: Migrate ACPI table mr sizes
 separately
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
 <20200403101827.30664-3-shameerali.kolothum.thodi@huawei.com>
 <00b69974-4b63-0c7c-c6ad-ed0f2eb712b9@redhat.com>
 <20200407103340-mutt-send-email-mst@kernel.org>
 <5b91cf11-79b8-aa00-8f64-f56a3f67c641@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b282fb86-ef49-ff64-1540-aaeeaeadf517@redhat.com>
Date: Tue, 7 Apr 2020 19:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5b91cf11-79b8-aa00-8f64-f56a3f67c641@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, linuxarm@huawei.com, qemu-devel@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, dgilbert@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, xuwei5@hisilicon.com,
 imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KbkuwcJGANgG

On 4/7/20 4:54 PM, David Hildenbrand wrote:
> On 07.04.20 16:34, Michael S. Tsirkin wrote:
>> On Tue, Apr 07, 2020 at 04:17:46PM +0200, Philippe Mathieu-Daud=C3=A9 wr=
ote:
>>> On 4/3/20 12:18 PM, Shameer Kolothum wrote:
>>>> Any sub-page size update to ACPI MRs will be lost during
>>>> migration, as we use aligned size in ram_load_precopy() ->
>>>> qemu_ram_resize() path. This will result in inconsistency in
>>>> FWCfgEntry sizes between source and destination. In order to avoid
>>>> this, save and restore them separately during migration.
>>>>
>>>> Up until now, this problem may not be that relevant for x86 as both
>>>> ACPI table and Linker MRs gets padded and aligned. Also at present,
>>>> qemu_ram_resize() doesn't invoke callback to update FWCfgEntry for
>>>> unaligned size changes. But since we are going to fix the
>>>> qemu_ram_resize() in the subsequent patch, the issue may become
>>>> more serious especially for RSDP MR case.
>>>>
>>>> Moreover, the issue will soon become prominent in arm/virt as well
>>>> where the MRs are not padded or aligned at all and eventually have
>>>> acpi table changes as part of future additions like NVDIMM hot-add
>>>> feature.
>>>>
>>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>> v1 --> v2
>>>>    - Changed *_mr_size from size_t to uint64_t to address portability.
>>>>    - post_copy only done if sizes are not aligned.
>>>>
>>>> Please find previous discussions here,
>>>> https://patchwork.kernel.org/patch/11339591/#23140343
>>>> ---
>>>>    hw/core/machine.c         |  1 +
>>>>    hw/nvram/fw_cfg.c         | 91 ++++++++++++++++++++++++++++++++++++=
++-
>>>>    include/hw/nvram/fw_cfg.h |  6 +++
>>>>    3 files changed, 97 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>> index de0c425605..c1a444cb75 100644
>>>> --- a/hw/core/machine.c
>>>> +++ b/hw/core/machine.c
>>>> @@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] =3D {
>>>>        { "usb-redir", "suppress-remote-wake", "off" },
>>>>        { "qxl", "revision", "4" },
>>>>        { "qxl-vga", "revision", "4" },
>>>> +    { "fw_cfg", "acpi-mr-restore", "false" },
>>>>    };
>>>>    const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
>>>> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
>>>> index 179b302f01..4be6c9d9fd 100644
>>>> --- a/hw/nvram/fw_cfg.c
>>>> +++ b/hw/nvram/fw_cfg.c
>>>> @@ -39,6 +39,7 @@
>>>>    #include "qemu/config-file.h"
>>>>    #include "qemu/cutils.h"
>>>>    #include "qapi/error.h"
>>>> +#include "hw/acpi/aml-build.h"
>>>>    #define FW_CFG_FILE_SLOTS_DFLT 0x20
>>>> @@ -610,6 +611,55 @@ bool fw_cfg_dma_enabled(void *opaque)
>>>>        return s->dma_enabled;
>>>>    }
>>>> +static bool fw_cfg_acpi_mr_restore(void *opaque)
>>>> +{
>>>> +    FWCfgState *s =3D opaque;
>>>> +    bool mr_aligned;
>>>> +
>>>> +    mr_aligned =3D QEMU_IS_ALIGNED(s->table_mr_size, qemu_real_host_p=
age_size) &&
>>>> +                 QEMU_IS_ALIGNED(s->linker_mr_size, qemu_real_host_pa=
ge_size) &&
>>>> +                 QEMU_IS_ALIGNED(s->rsdp_mr_size, qemu_real_host_page=
_size);
>>>> +    return s->acpi_mr_restore && !mr_aligned;
>>>
>>> This code is hard to review.
>>>
>>> Is this equivalent?
>>>
>>>      if (!s->acpi_mr_restore) {
>>>          return false;
>>>      }
>>>      if (!QEMU_IS_ALIGNED(s->table_mr_size, qemu_real_host_page_size)) =
{
>>>          return false;
>>>      }
>>>      if (!QEMU_IS_ALIGNED(s->linker_mr_size, qemu_real_host_page_size))=
 {
>>>          return false;
>>>      }
>>>      if (!QEMU_IS_ALIGNED(s->rsdp_mr_size, qemu_real_host_page_size)) {
>>>          return false;
>>>      }
>>>      return true;
>>
>> I think I prefer the original version though. Matter of taste?
>=20
> At least I find the original code fairly easy to read - just as the
> proposed alternative. So, yes, matter of taste I'd say.

OK :)

