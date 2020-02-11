Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4923681lfp;
        Tue, 11 Feb 2020 02:20:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3wWeDxdMcT59N2eDH13HlYjPF1JSxQ7IS6RHN3AVT12fVvsPRUqmukXJ6wiEOQvdAwP5v
X-Received: by 2002:ac8:38c7:: with SMTP id g7mr1664648qtc.229.1581416456044;
        Tue, 11 Feb 2020 02:20:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581416456; cv=none;
        d=google.com; s=arc-20160816;
        b=Mde+ANw9/5JbA5y1hlfvmqKO6y/wnqCJYjZ1Z6RtWDHNYaJImf4HO5tPJn+6G/Ab43
         yw4PjsUkoyFJID6ClF+pWC2h0OoAHmmqZ3BkJ8spWEtdgAFAHHuVGKkQUKYpjw+yBTl8
         nTC3G9MFjn1Y/X2c0BY9FtF1BknY1dknB0Xh/udAfRcB8jub2EjlDaPh9StgNjH2024L
         2Jg760fXz7PxzEHjMzta8ixAE+uWG7QJiFPaxjK0uBg3LzM16+SyChjYvIK8n8UH+Xyn
         4Sdug3LBmPlAWe5izGUnvoB0zbkm9siTXhcZXhBetrqEDJgnQ+ykpj+4uJFO8Elyp9LT
         otfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=1s72C7ex/dMKuhxXF26CRUSjnLXZ1e0+ts0EdmugKmo=;
        b=EtrwG0o4+0/tEm6SJce1vrpp7g7qwUf4IMQlrHHzhw8fPcgZ6230+ixFv9aYmEjarp
         6d8v91kErFm6Ks32f5QKoPj7+6aLQZ1ekDetgrRECqz9DKnMQBkdorL+cYsHFamN+SFm
         1tdzuQOJ48r6PTuhVRcXtUShHHEErQISqotptleW9UHaRx4aL72FV2XkRbNTBxEDcBTV
         p9Rmg8SDgbVp8ATlao52AFDhI3+gr6kLol2ziKar2L3VpC9CMkdSNT0Txgmg2mjAc/0V
         6t0ddH7D+u5+9ZhQYt0LdGOpysOV4HUniAnHqAoB1IzQ0waizpp0Gk5FduD0DtnA0FGx
         7g9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=flsuOw0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si1660237qvp.52.2020.02.11.02.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 02:20:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=flsuOw0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1Sf1-0001Jg-GW
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 05:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j1Set-0001IU-5B
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j1Ser-0001K1-Qa
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:20:46 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37058
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j1Ser-0001J9-NE
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581416445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1s72C7ex/dMKuhxXF26CRUSjnLXZ1e0+ts0EdmugKmo=;
 b=flsuOw0e+NwP0gQX4VuXdumXRkim3a2FhV8/H0VB2KFOmQXdlpIRB+KFl3o5pJ4hEHtcV0
 X5EXrgj6qyBUwbhXNzUxCNUJpUrv04l5lcC9XqYkE7hiTiC0Knl0UTQZFFe8Cy+QKO8VS/
 /rkug4EPQFcm6BwQwM+F1uRkPcHQMnk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-FslLWKpaNBGJdzFKAEXwrw-1; Tue, 11 Feb 2020 05:20:41 -0500
Received: by mail-qv1-f71.google.com with SMTP id e10so6822473qvq.18
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 02:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=feQUUY6fJhQS0CpdNBDw+Mk6D8Vvj4K1BxtqjKhBPzE=;
 b=TcgUyoC+lGfS6m956tkjzG1J9WyalfNSZb3P15w8IzGO8OUS5r9aILL/x82msKW4oV
 wyePN0QYNIWD158BNxKFBpELprJomvb/AwVueaTQ44tlG00ZH0krjHK2IxAURwtzUe7K
 7DzF9osEpuk8CHR0AhLbnF+5Tb0qO1gKk9H9J4Rtl0wKXbV7MQAFgvlpHv/AaSdnUbUR
 DfMdNHXe2NJedYvVSr4KVaGY05JG5JZzH5s41LCPczC+xRE3zIysibZJ1IVdhPJtOWbL
 e5BkbJM6y8WhOStD4J1n4tZ86zIPVTyUq3oo4Kaw6uN7uT7Ub1y8KS5YOMxZR/nUT9qe
 9jXA==
X-Gm-Message-State: APjAAAXEscYr7yo4wasHmtj+250GsSWdJIdP0UtzX6ol8zJcZUKwMj4l
 SJRDuEsD18BCmmnnx+d0dseECP3Vv8hIqOFpjpZzuFcQwJuf2vczjt+2/zqHPpFNfyewYrVKrYo
 t3oiw+y9HDBeK
X-Received: by 2002:ae9:e209:: with SMTP id c9mr4250186qkc.363.1581416441310; 
 Tue, 11 Feb 2020 02:20:41 -0800 (PST)
X-Received: by 2002:ae9:e209:: with SMTP id c9mr4250177qkc.363.1581416441019; 
 Tue, 11 Feb 2020 02:20:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id 65sm1852688qtf.95.2020.02.11.02.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 02:20:40 -0800 (PST)
Date: Tue, 11 Feb 2020 05:20:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp test
Message-ID: <20200211051953-mutt-send-email-mst@kernel.org>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
X-MC-Unique: FslLWKpaNBGJdzFKAEXwrw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PU78dc76O1EZ

On Fri, Jan 17, 2020 at 05:45:22PM +0000, Shameer Kolothum wrote:
> Since we now have both pc-dimm and nvdimm support, update
> test_acpi_virt_tcg_memhp() to include those.
>=20
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

And you can add a last patch on top updating the
expected files and blowing out the allowed diff file.
include the ASL changes in the log ...

> ---
>  tests/data/acpi/virt/NFIT.memhp | 0
>  tests/data/acpi/virt/SSDT.memhp | 0
>  tests/qtest/bios-tables-test.c  | 9 +++++++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 tests/data/acpi/virt/NFIT.memhp
>  create mode 100644 tests/data/acpi/virt/SSDT.memhp
>=20
> diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/virt/NFIT.=
memhp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.=
memhp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index f1ac2d7e96..695d2e7fac 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -913,12 +913,17 @@ static void test_acpi_virt_tcg_memhp(void)
>      };
> =20
>      data.variant =3D ".memhp";
> -    test_acpi_one(" -cpu cortex-a57"
> +    test_acpi_one(" -machine nvdimm=3Don"
> +                  " -cpu cortex-a57"
>                    " -m 256M,slots=3D3,maxmem=3D1G"
>                    " -object memory-backend-ram,id=3Dram0,size=3D128M"
>                    " -object memory-backend-ram,id=3Dram1,size=3D128M"
>                    " -numa node,memdev=3Dram0 -numa node,memdev=3Dram1"
> -                  " -numa dist,src=3D0,dst=3D1,val=3D21",
> +                  " -numa dist,src=3D0,dst=3D1,val=3D21"
> +                  " -object memory-backend-ram,id=3Dram2,size=3D128M"
> +                  " -object memory-backend-ram,id=3Dnvm0,size=3D128M"
> +                  " -device pc-dimm,id=3Ddimm0,memdev=3Dram2,node=3D0"
> +                  " -device nvdimm,id=3Ddimm1,memdev=3Dnvm0,node=3D1",
>                    &data);
> =20
>      free_test_data(&data);
> --=20
> 2.17.1
>=20

