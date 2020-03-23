Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1592056lfi;
        Mon, 23 Mar 2020 08:30:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsprWwgVQsQUzGUZnmJgBgt0DcvQuUv+uj5MUmgx2ddh9C9hh4V1+jHg747psTiL8oaFplB
X-Received: by 2002:a37:52d5:: with SMTP id g204mr21895587qkb.401.1584977433508;
        Mon, 23 Mar 2020 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584977433; cv=none;
        d=google.com; s=arc-20160816;
        b=wYnWmOdeYYhmkaaqYP+RMOmGmztRydCO+O78J/Zd9lvx6OmGQoBRx8znm48swRDHDr
         T4w9wH4EgRCvrMxtROlvhYa0Uuvc8GhQZRXm2RqXLJClBwQ5byQHBb+9JxSwVaM0dmxF
         ucxCqXOIdGoTeDcbFZJVP9D0Qm05Hi+zhnLvVtEQz+lcnOHML0ukoPj5LHoqC+/uzEDq
         2CXmVSuRt1WHxSNQ6abJLw4l0Ty3E9ycuK66IyQtTpGqRXT9AfUNxCikA17QQYY82WpO
         QZrukXYWMdy5QEXfFhRXEywjFmm4PDyuLpMCP+mT2NDQhA+I890uNl9FS669HOCUSBeg
         iXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=C5FFIL32Xk4JS/YnTAd3rqMntVvEjC0v+56CjlZ2pWQ=;
        b=ns/muQOWftWEWsLxWvd1dl+r8KSkqZyK3ZUXk1nk3s+pOaXymBunA7SeKl9bAZVzUg
         sh/mmZFKWIS/beeRJmlhYh+dmj0U9BMxe8VxYAt8MIVWFeIIEbxCo1hMJ+tGpjPLiA9Y
         ptOD73q6fsCISVA9xYP9TqmqQK5qmL+8IYGrDnhAHSn3LsIovj0j7c+f1+P5TQaRtwYs
         jTjflcWDpApPUsvlAiPkO5P6+A8wpFdCfGVtBEioi0C1PGmXxhMRcXo7I+L9Yv9AzVhs
         GLXfN6I57q/mfnB4WW3gyyGKN5vudhL+JRbEpAMjxZwtppilQjamSq7pd9ldxYAnpxlk
         3g3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z7axevgr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si3544597qtv.69.2020.03.23.08.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 08:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z7axevgr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGP28-0000iI-VB
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 11:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGP08-00068i-Qk
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGP07-00072r-L8
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:28:28 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:35858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGP07-00072a-Gc
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584977307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5FFIL32Xk4JS/YnTAd3rqMntVvEjC0v+56CjlZ2pWQ=;
 b=Z7axevgr/OXExDdkYztpPG2yNYYO0eErmb5k/ehqL0LuALIcW3WddVILdFjJD9NLVpdLqe
 xZ5HkPiciGA+4vDrvzvhHsnCZ7UbRFXVWCItJwc3Q2B7BBlILoqv1u+ozc7TnueZgmX5hD
 hO+nvEGAMv1NfDGLq7dra2djgKwgzH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-yQT2iSwgNKepr-t3oESiqw-1; Mon, 23 Mar 2020 11:28:25 -0400
X-MC-Unique: yQT2iSwgNKepr-t3oESiqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7BD68017CE;
 Mon, 23 Mar 2020 15:28:23 +0000 (UTC)
Received: from localhost (unknown [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 206121000337;
 Mon, 23 Mar 2020 15:28:11 +0000 (UTC)
Date: Mon, 23 Mar 2020 16:28:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 09/10] tests/bios-tables-test: Update arm/virt memhp
 test
Message-ID: <20200323162810.5b4f0124@redhat.com>
In-Reply-To: <20200311172014.33052-10-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-10-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, mst@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gMMm0XINAT6

On Wed, 11 Mar 2020 17:20:13 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

SUBJ is pointless,
s/Update.../
arm/virt: test pc-dimm and nvdimm coldplug

> Since we now have both pc-dimm and nvdimm support, update
> test_acpi_virt_tcg_memhp() to include those.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> v2 -> v3
>  -Moved addition of empty table files to the previous patch
> ---
>  tests/qtest/bios-tables-test.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a597bbacf..c9843829b3 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -927,12 +927,17 @@ static void test_acpi_virt_tcg_memhp(void)
>      };
>  
>      data.variant = ".memhp";
> -    test_acpi_one(" -cpu cortex-a57"
> +    test_acpi_one(" -machine nvdimm=on"
> +                  " -cpu cortex-a57"
>                    " -m 256M,slots=3,maxmem=1G"
>                    " -object memory-backend-ram,id=ram0,size=128M"
>                    " -object memory-backend-ram,id=ram1,size=128M"
>                    " -numa node,memdev=ram0 -numa node,memdev=ram1"
> -                  " -numa dist,src=0,dst=1,val=21",
> +                  " -numa dist,src=0,dst=1,val=21"
> +                  " -object memory-backend-ram,id=ram2,size=128M"
> +                  " -object memory-backend-ram,id=nvm0,size=128M"
> +                  " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
> +                  " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
>                    &data);
>  
>      free_test_data(&data);

