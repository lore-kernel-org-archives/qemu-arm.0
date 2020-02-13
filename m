Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp330768lfp;
        Thu, 13 Feb 2020 00:19:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwroOXCQHYi5zN9vMmbEm1GczN9RrOCw6gs77CFAgBQIUJe9HlSBqzoyIqmlc7C5MotRuKF
X-Received: by 2002:aed:204d:: with SMTP id 71mr23248366qta.116.1581581963939;
        Thu, 13 Feb 2020 00:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581581963; cv=none;
        d=google.com; s=arc-20160816;
        b=Am7RHdYpWXbG9ZAxwxrzuX7MdCL0Qo6jHxOns2wvrTBZnJd7f4DRRTKHBE7bQdMv2d
         RszCFYFahyI6ozH7+j32t7q3JvlDdfjghNp+VAabybPaiDzbr4yNTzkGbsiR36oim1Ke
         AwUCeVL96k7dApCnT+hQxM+DlxzCY7BJAY4TJyy0S+QKAUSLs3gLNiEuVKxwX1F80WZA
         iarvCi8rUNd7Il81EoZ5cLTK9WlT0SaG42iDbFAwbrKsAmJKuD1c0u8s3b2nBtTDk0D3
         1L1gYas4LJoiqZQpCuSt78sfR4VU0+s+iELpHwBkLRv95ppq0sVE+rJAWtplKUvvZRth
         ChEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=pM2dKSlUEnPtF1tY6boVjueZAba43ctUUtN+SPTBqb4=;
        b=T+93oJfHFP/86l7a5FWPApheatNaION22mOSDqMvHcTGyI/yPtbR8CybtKlUdnsZT/
         S2Tp7lCWqF4IGtFrpFEBnF2nA4WRnW1+zHiZqozNujXHNE65kfdsf06vpt+lFvWK9cDS
         tYss0XvlVUm4EazHxUlpX3HN7t5Po8g5iFGcsJvFstriBACX0oXi1ZHi0FDIN7FL7bQ+
         NTYT4B9YTRPfp6BgtmvxP8bYrvO7CgegxAs3QqT/m2JcK2eJyTs1EarVGCWlXAHxQ5RF
         Sxs/5qkofM0AVngmJfYroi5gvE8ljzTWc7QBw+8DY6ZMbpEll+A0EFLAZmeqgvd7Q32H
         OxtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ayMgCoGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm17si620537qvb.139.2020.02.13.00.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 00:19:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ayMgCoGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j29iU-0004Gq-9x
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 03:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1j29iJ-0004Fr-Vw
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 03:19:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1j29iI-0007qv-W0
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 03:19:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35163
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1j29iI-0007qk-Sw
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 03:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581581950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pM2dKSlUEnPtF1tY6boVjueZAba43ctUUtN+SPTBqb4=;
 b=ayMgCoGBZuA/AzuMW9zdziwcjp3NEb/8LBNOGfRDPs8JlY7nJYI6oACL9IxUvAS6qMq7/P
 lDa4U89xZptEIi+J0z45/TDq4XmpcOCcVSaRSIGYqz791NcoOLYzgSfc4DvqG5bQSjRfZC
 OzUE2hob8xgwCepfu3iTDBZ8yGAX0zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-S04n7xo-Px6BNdagtnlFwg-1; Thu, 13 Feb 2020 03:19:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A7C8017CC;
 Thu, 13 Feb 2020 08:19:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36AD5C1BB;
 Thu, 13 Feb 2020 08:18:56 +0000 (UTC)
Date: Thu, 13 Feb 2020 09:18:54 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [PATCH v2 0/4] arm64: Add the cpufreq device to show cpufreq
 info to guest
Message-ID: <20200213081854.ewkk23yhnog23upj@kamzik.brq.redhat.com>
References: <20200213073630.2125-1-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200213073630.2125-1-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: S04n7xo-Px6BNdagtnlFwg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, guoheyi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OtSEu4S58E7b

On Thu, Feb 13, 2020 at 03:36:26PM +0800, Ying Fang wrote:
> On ARM64 platform, cpu frequency is retrieved via ACPI CPPC.
> A virtual cpufreq device based on ACPI CPPC is created to
> present cpu frequency info to the guest.
>=20
> The default frequency is set to host cpu nominal frequency,
> which is obtained from the host CPPC sysfs. Other performance
> data are set to the same value, since we don't support guest
> performance scaling here.
>=20
> Performance counters are also not emulated and they simply
> return 1 if read, and guest should fallback to use desired
> performance value as the current performance.
>=20
> Guest kernel version above 4.18 is required to make it work.
>

This is v2 of the series, but I don't see a changelog.

Can you please describe the motivation for this? If I understand
correctly, all of this is just to inform the guest of the host's
CPU0 nominal or max (if nominal isn't present?) frequency. Why
do that? What happens if the guest migrates somewhere where the
frequency is different? If this is for a special use case, then
why not come up with a different channel (guest agent?) to pass
this information?

Thanks,
drew

