Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp495515lfi;
        Fri, 3 Apr 2020 03:50:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypK0i3crIlSXFDWfPM5s1t4cNIEjKjtaLEYv+CdTM5jL23trA1nDwUzKDpzf8kkeV9YNiza1
X-Received: by 2002:a05:6214:12cf:: with SMTP id s15mr7621737qvv.241.1585911030582;
        Fri, 03 Apr 2020 03:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585911030; cv=none;
        d=google.com; s=arc-20160816;
        b=yxtkME9Wg7xtGCBTdavGKObNJOmcVncvytxhdmmLoVpIxm/Kf4StJqFcW5aHNFodxm
         8CEmEAXMONXdz0Y0SRJQ3BB4Gb15vyWxh3aQTlKd+4rUAbCezgT8xzioHBlVCPEHfg16
         l5l5X1F2ZF7y8PNJB8sY6Hf/j4n7utObFvXjtsx40D0qkMCIj1neW88N0fGAVc/rLk8X
         9s1ZUsUcrarX0SHFjpmszF82asUHaQ8xYtabVsqVa8/uE3Tkt8701F7PnCY3z3FLmzZF
         s8EUZjoHlXY4sCjYPPhvzWuZwyUKqQ9xsLRCidgyeeI0r+jvgC1n4eYGbl1EgqxC8/44
         wkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iyrINhvaXuzlDVuWWMS/Llp2G7IXlgrYOXxtuPZXbdQ=;
        b=tBR3mcrbyinM+PKYaRSzmr3j7HwqiqQ4Voz+Fky7vGf7ifQ7bGkZw/oIX4m/zUt/Ew
         smnyfz+JC0H+ryTldjz0F+8BCrX2xBS5FTBSeZ6i2e/GvEnZeD4fvvKArC6qlYOjIgKf
         tj0Smy4cWarmkoIFHsAMWnWVTwXO8bhPhixJwurq7nUvexiXPm9ySzs59/9tlNvI3Rxd
         9QKooIhqLE+LRTIMhx0bqUA81QRl8xL04FTObHRKm14FVsmQqhJUS8UDgekuCiGE52/k
         0EHBwbNBIkfhuPrQbsvEYBSGHDnRTwxOYrHfW56Gp7gvBNymxgdv/WYY+TrBMPfvBgoF
         gA6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="JeaI/1ZV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o37si5309872qtc.171.2020.04.03.03.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 03:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="JeaI/1ZV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKJuA-0001To-0Q
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 06:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jKJu2-0001Te-7k
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jKJu0-0002KQ-BT
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:50:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21833
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jKJu0-0002Ie-8G
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585911019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyrINhvaXuzlDVuWWMS/Llp2G7IXlgrYOXxtuPZXbdQ=;
 b=JeaI/1ZV5m5pWEUD1Vmfg/iRpw22QHwkqCF1rYLYCk2XaClFtU36DiOQBsL3UOzm7ZeGrm
 xFhR2UvJprd8D/JtdDs+n2qB/NR78p1F7JWBtiMnH2/TIcHQYns2YViUO0f83hXsxclyVg
 BtKyT4H5BqVNUIC0imY6TjJ1V+D/pmQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-Gzt-Jm8HMEWZYu9mFOmpGA-1; Fri, 03 Apr 2020 06:50:15 -0400
X-MC-Unique: Gzt-Jm8HMEWZYu9mFOmpGA-1
Received: by mail-ed1-f72.google.com with SMTP id x93so5116526ede.19
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2020 03:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O8O05iEobAlBTy+rNcrf24PgymJ5aC8/OkSpNAk7lSw=;
 b=pT4MGNFZ6DGQmt6ClOI5dXJCHWXjcHH4dbbKXooLXQ1RtUP/Ppso35T5IVvoKfcPDa
 WxSwlUZpS0x4mQC9uXJMuOLsFDNnQ68qki2CPUSmo6zC5f8MbyMpDrw74pl+tw0P37Gm
 nkJYeIdyC3fGP9raUIMQ3S1s6s7Ucl5Z9tTGM6y4VdoV2q/VYgodtQ49jM+uMmaL1I6k
 XavCkly84daS5WduLXNt3e6PS6R1OPltVSOl4LVzBSNLLxdLfXOPwNdfFIOkpPDBr+0D
 hf8YuEyiFW/X4zOAMyVm4Q/d/2xklejK24xzMGigdM4/1Aaakr29I8abh83GxVg54hoW
 uXTw==
X-Gm-Message-State: AGi0Pua/GGHzugvJZHg7dfQ/s/qSNi2E8KGzmZVMhsDHer4SPHfsmL7E
 BdjeHR29UzfbaFy1+xXuag9KRtwi2mLzur/9jAMlyhVpa3uVwY586egoId7TFYySQXQxUVw0iqW
 zbJxjiklfjWIw
X-Received: by 2002:a17:906:6d55:: with SMTP id
 a21mr7373486ejt.186.1585911014309; 
 Fri, 03 Apr 2020 03:50:14 -0700 (PDT)
X-Received: by 2002:a17:906:6d55:: with SMTP id
 a21mr7373457ejt.186.1585911014066; 
 Fri, 03 Apr 2020 03:50:14 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id p4sm1576021eju.57.2020.04.03.03.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 03:50:13 -0700 (PDT)
Subject: Re: [PATCH for-5.0 v2 3/3] exec: Fix for qemu_ram_resize() callback
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
 <20200403101827.30664-4-shameerali.kolothum.thodi@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a350c04a-786d-639c-6754-024fc10e92b6@redhat.com>
Date: Fri, 3 Apr 2020 12:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403101827.30664-4-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 david@redhat.com, dgilbert@redhat.com, xuwei5@hisilicon.com,
 linuxarm@huawei.com, shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZOqF34lJNuv

On 4/3/20 12:18 PM, Shameer Kolothum wrote:
> From: David Hildenbrand <david@redhat.com>
>=20
> Summarizing the issue:
> 1. Memory regions contain ram blocks with a different size,  if the
>     size is  not properly aligned. While memory regions can have an
>     unaligned size, ram blocks can't. This is true when creating
>     resizable memory region with  an unaligned size.
> 2. When resizing a ram block/memory region, the size of the memory
>     region  is set to the aligned size. The callback is called with
>     the aligned size. The unaligned piece is lost.
>=20
> Because of the above, if ACPI blob length modifications happens
> after the initial virt_acpi_build() call, and the changed blob
> length is within the PAGE size boundary, then the revised size
> is not seen by the firmware on Guest reboot.
>=20
> Hence make sure callback is called if memory region size is changed,
> irrespective of aligned or not.
>=20
> Signed-off-by: David Hildenbrand <david@redhat.com>
> [Shameer: added commit log]
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
> Please find previous discussion here,
> https://patchwork.kernel.org/patch/11432375/#23216751
> ---
>   exec.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index de9d949902..2874bb5088 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2074,11 +2074,23 @@ static int memory_try_enable_merging(void *addr, =
size_t len)
>    */
>   int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
>   {
> +    const ram_addr_t unaligned_size =3D newsize;
> +
>       assert(block);
>  =20
>       newsize =3D HOST_PAGE_ALIGN(newsize);
>  =20
>       if (block->used_length =3D=3D newsize) {
> +        /*
> +         * We don't have to resize the ram block (which only knows align=
ed
> +         * sizes), however, we have to notify if the unaligned size chan=
ged.
> +         */
> +        if (unaligned_size !=3D memory_region_size(block->mr)) {
> +            memory_region_set_size(block->mr, unaligned_size);
> +            if (block->resized) {
> +                block->resized(block->idstr, unaligned_size, block->host=
);
> +            }
> +        }
>           return 0;
>       }
>  =20
> @@ -2102,9 +2114,9 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t new=
size, Error **errp)
>       block->used_length =3D newsize;
>       cpu_physical_memory_set_dirty_range(block->offset, block->used_leng=
th,
>                                           DIRTY_CLIENTS_ALL);
> -    memory_region_set_size(block->mr, newsize);
> +    memory_region_set_size(block->mr, unaligned_size);
>       if (block->resized) {
> -        block->resized(block->idstr, newsize, block->host);
> +        block->resized(block->idstr, unaligned_size, block->host);
>       }
>       return 0;
>   }
>=20

