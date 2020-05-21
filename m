Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1534889lfb;
        Thu, 21 May 2020 05:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8mlFo2jmy2JvmDqvOdWzgk0A77Wkqk0EBP5iECdzX5hw9HeuwaJj24vW8eRQpzyJglkdB
X-Received: by 2002:ad4:5684:: with SMTP id bc4mr10011878qvb.85.1590065465648;
        Thu, 21 May 2020 05:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590065465; cv=none;
        d=google.com; s=arc-20160816;
        b=yEq6CXgJep08tewjPd0PA5jM3gDB+fStt48aCir13KUMpIE7WskF7UCHQyTKwWvh7K
         i1GbIGe0hYhRfZRtDt1sWSmnvHEjByWy51qFo2N/l9TTYUbp58aeT+/HHC/A6qAeL1RL
         8qCiXVwnz7SFnoQLEnYixjBN8pC452M8ufMDMuypJe1gez2q8nXgkLYkFPkTbeD6urN8
         eDn6t81mRNeSlFE93IZ60ubXwEhpckyrl4SxpxME+cXDQleGYZy5jb9Q3eqCRhyNCtSK
         p17mOvoLguGx6S8JoSqv11GxfH3Y5fW44t/SMCXwSK4SHGrBbD0jIEFcdhbJg3nZkq+m
         zg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=PeGpWItfOJZddJcKTk8DZm7ycGZspJwU5c59cQRQihQ=;
        b=IxB2Erslb6kwnVo8P+UXHynqfGEgExp5rQzrHsVy2ej7ImeclQPhYdzYWnhVYKbhkD
         VNIt5vB6wieylTW3B19VwNsfaK6q4JxTDTqu+qvDjWhA9aI4aVBJkDAAf0fYeHXQiioh
         MfKKVe9hVCDSY9WGq62MGdo+o2RCXtsbW/Il9szpSx2jUYQHg1M7C/rLGavkGA/Wo7z7
         1PQWz7jDmB9Q6UDbt4RIXVg2vWI7Qf43JZQQG6sG9a4znnSrOksW5hsWrKEb42k42Ij/
         S96qc+UuDHptuVk0ewA4+NcUrQxrOOdHUJv01PCu9IftL4MrObJexxPqMLl2ysjbX4/o
         WLQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=APXxQbwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si3451399qkf.34.2020.05.21.05.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 05:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=APXxQbwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbkfB-0005nw-0x
	for alex.bennee@linaro.org; Thu, 21 May 2020 08:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbkaq-00058w-TU
 for qemu-arm@nongnu.org; Thu, 21 May 2020 08:46:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48581
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbkaq-0005Fr-21
 for qemu-arm@nongnu.org; Thu, 21 May 2020 08:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590065195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PeGpWItfOJZddJcKTk8DZm7ycGZspJwU5c59cQRQihQ=;
 b=APXxQbwb18nP5rDTxiARD2rTj1HhmLu7H65iAFSTRGwuTKvOqzQASOnNMcSI6mv5E+to8z
 dtKrGQ/Es4C1KWINr8OSTYkU1hflbPNonm7S5Eu256cfv9pb+kaRNId6D52JGn7h+kv3/4
 MU6Q7GqMynManThe/GDNTpcGRlj5s8w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-fcrYT1F-NEKC7FzPS2CUTA-1; Thu, 21 May 2020 08:46:33 -0400
X-MC-Unique: fcrYT1F-NEKC7FzPS2CUTA-1
Received: by mail-wr1-f71.google.com with SMTP id h6so2019082wrx.4
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 05:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=pD7dRz0HbjX1Z3dLa5HOTCEnHSW5/TCCKIxYqYpngEc=;
 b=KX563YxDblPmLli3If3Cswh1ncLvBv7LzcJUG153jCK3OOJGBQhESNP7KLF1Q7ud70
 +UFkRf0J5Ye4CMkKWfym6w5VUIr6JuI3FE9gn09xMgIFjNs9ZzEjuL6W/lmuFdqr2X4Z
 Wx/agzPbXut2s61a7vDqi7Nsshn9CDSsue+nbYK6KshxWV+i7zH9oLqGqiEYEgnTBuOL
 RzyZBeC5x6eGwn0/p0Ev6tEFjSaIUTwdjLEKEI5uIkyO50Mp9yWmgKOzChHSRV5GLD0i
 AaiiAKDLdsTJ3bIz5FDjgBdS7TbLJocwYvUbb8J0088PmgSS3O8zxe7wcs0UKoqP7fRT
 DpDA==
X-Gm-Message-State: AOAM531+ZM7NuEidkv0Tq9uKo8m7rvCMhg1VGNKEQYFwuUBAxav4nizJ
 TkJD3aXm9P5V0WVCbXYiVdWT6bhQQitcLwNRVgpBpEe9Hgv7veZsTc9jtea4JEPnFLCw+wvTyUF
 HLx6d7bDbzVqL
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr8651277wmj.2.1590065192229;
 Thu, 21 May 2020 05:46:32 -0700 (PDT)
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr8651259wmj.2.1590065191982;
 Thu, 21 May 2020 05:46:31 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
 by smtp.gmail.com with ESMTPSA id a17sm2483448wmm.23.2020.05.21.05.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 05:46:31 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200508062456.23344-1-philmd@redhat.com>
 <20200521123245.GG251811@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5514da71-8d9e-e784-bfad-5939bd7ac99f@redhat.com>
Date: Thu, 21 May 2020 14:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200521123245.GG251811@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cnPwKwY95zFoTWIEJTwV1FHsbv0FbsNN8"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: obHKFhK+1+YT

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cnPwKwY95zFoTWIEJTwV1FHsbv0FbsNN8
Content-Type: multipart/mixed; boundary="4m78srN6PibKSPtZF7iUwG0r86mCzYNKf"

--4m78srN6PibKSPtZF7iUwG0r86mCzYNKf
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 21/05/20 14:32, Stefan Hajnoczi wrote:
> On Fri, May 08, 2020 at 08:24:52AM +0200, Philippe Mathieu-Daud=E9 wrote:
>> Let the NVMe emulated device be target-agnostic.
>>
>> It is not clear if dccvap_writefn() really needs
>> memory_region_writeback() or could use memory_region_msync().
>>
>> Philippe Mathieu-Daud=E9 (4):
>>   memory: Rename memory_region_do_writeback -> memory_region_writeback
>>   memory: Extract memory_region_msync() from memory_region_writeback()
>>   hw/block: Let the NVMe emulated device be target-agnostic
>>   exec: Rename qemu_ram_writeback() as qemu_ram_msync()
>>
>>  include/exec/memory.h   | 15 +++++++++++++--
>>  include/exec/ram_addr.h |  4 ++--
>>  exec.c                  |  2 +-
>>  hw/block/nvme.c         |  6 ++----
>>  memory.c                | 12 +++++++++---
>>  target/arm/helper.c     |  2 +-
>>  hw/block/Makefile.objs  |  2 +-
>>  7 files changed, 29 insertions(+), 14 deletions(-)
>>
>> --=20
>> 2.21.3
>>
>>
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


--4m78srN6PibKSPtZF7iUwG0r86mCzYNKf--

--cnPwKwY95zFoTWIEJTwV1FHsbv0FbsNN8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl7GeCYACgkQv/vSX3jH
roPoYgf+JNMgIUZzO7+lN61e+os+EfjEubcxarvJeqyjX2tl43tKjiz9g7ZG6nWu
W1ID5hJQPfoyAuzf8cCiroEG0WPpwfkw4OjuvhAmocDYfaF1BxPs9lf4CacIr4yQ
IPB9jxsdvgN2KMlo0NOKPzFuEaq17DOLr6tg2GhWTuA//3Qz5Xk5wxhIaMUzRjex
rHpHowj4FiHyB4EbFHZs9W6po8jLusY9r5QgDloBswwcrFOG0fop8FLPO/uUTv5J
R0KRWrjZiL/lCLu8WXwxyqfYc81Ap5fry/7tulCU4kA+eJJTSnzB5rNzwqT7KZ6r
piGDiRrcAhiF01TIEHlE1Kclj4epWg==
=fpV6
-----END PGP SIGNATURE-----

--cnPwKwY95zFoTWIEJTwV1FHsbv0FbsNN8--

