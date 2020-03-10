Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp849569lfc;
        Tue, 10 Mar 2020 07:56:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsjad2ftNYfoX7UamKoFEM7aCPItAHLMEcc+y9yXriQxTCYjhJxA631OZplZ/YVA9DFN+hZ
X-Received: by 2002:a05:6830:1d95:: with SMTP id y21mr16419993oti.90.1583852185450;
        Tue, 10 Mar 2020 07:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852185; cv=none;
        d=google.com; s=arc-20160816;
        b=jQovEzbFBMWoj186lxO+/v5QTE85wtZxyY8QPDI2f2Xeusd3IVhOtvoGBcEZE+tnCl
         BdLA2DLC+NbzVgwkcNgWWi4jsV/Gqw+rrIUWAXb3x1OBc1UzejLqQ06lsB1o7DXTHsh7
         Z2Y+Of8edyf3+bmh3bVsHTiBVzTNd0DUxBJu0HiEinHECBDgxIIZ2ZoYrmO/9Cq4b9jm
         YSJ7GiihsUhASK4s2Md9a/WuMzOkF9dSE1uOeWCq6v1yHcMItx10Jy3qFwfVNMmlxPKh
         T9FOQxJ7l2sPHwGu0t21+J+0u8F55Vt6gL6KC/b8IZgjVq+BseERkdcUwhrm0551tIzX
         UyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=F6Y9O3L6ux6zcyjxR98H17Ex0dxMm2pHA4GBIrRUtcw=;
        b=mwHttHFPc5AMykEO8NwSVE43Yf7HSysGXAaDv7AHxu+Zjm+m0QYCKqxdDml3xsjYvq
         uvmFmwjpFjJAgj9+TytWGE7C+o/T4gEMVnlB/tmcey+GY5LiHzkEN0FYaht1mIYEh38Y
         Yx78AcUPSM2zGtYVQIUZeV+40KYEelfeukGtnRO6sIVG45in2GWO/2LlX+FJ4iRgVRQy
         tqgGieANnxLyrL3IaXeO7tJJIlmyo+npiFo2MimAmVtZiNyzghlo9aaGPn+4dXx9y0+H
         eSJ6LHlbCobiKp6uYKx7uhoKnnacRPLkGFV3qPgVeOEh6xAysoC1xbOSEOysTqOrRYdG
         m89g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fx9SAMIs;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i7si5431916oth.143.2020.03.10.07.56.25;
        Tue, 10 Mar 2020 07:56:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fx9SAMIs;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgCJO4Y (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 10 Mar 2020 10:56:24 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39369 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727532AbgCJO4Y (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 10 Mar 2020 10:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F6Y9O3L6ux6zcyjxR98H17Ex0dxMm2pHA4GBIrRUtcw=;
        b=Fx9SAMIsXOanlte0TY5PpiAEXhzuF3byF7Iq6JwbYeXjGEgjJ8MOa+8EGgAOMcHanwrQs6
        C+L5F1dDbyYDipDwHhcvN1OSDm6+e5uHzTpJTZ91mx3rfaG53ZrxdtZJbDoqsXFs9jjymt
        lljEyQ7/m9/zYL4LSKeEQ8s5c99Vjaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-sfzD9SM5NJ6iyJlr4oKb0Q-1; Tue, 10 Mar 2020 10:56:19 -0400
X-MC-Unique: sfzD9SM5NJ6iyJlr4oKb0Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47CA919067E1;
        Tue, 10 Mar 2020 14:56:17 +0000 (UTC)
Received: from [10.36.117.85] (ovpn-117-85.ams2.redhat.com [10.36.117.85])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F5E5C28D;
        Tue, 10 Mar 2020 14:56:14 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add ITS tests
To:     Zenghui Yu <yuzenghui@huawei.com>,
        Andrew Jones <drjones@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        peter.maydell@linaro.org, andre.przywara@arm.com, thuth@redhat.com,
        alexandru.elisei@arm.com
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309115741.6stx5tpkb6s6ejzh@kamzik.brq.redhat.com>
 <20200309120012.xkgmlbvd5trm6ewk@kamzik.brq.redhat.com>
 <5cfe64d3-e609-cd1e-4f92-e24cf5f62c77@huawei.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <4a80c1d0-e33f-b1d9-c8d5-3a2fb01104db@redhat.com>
Date:   Tue, 10 Mar 2020 15:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5cfe64d3-e609-cd1e-4f92-e24cf5f62c77@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zgBJV8BuibZC

Hi Zenghui,

On 3/10/20 11:18 AM, Zenghui Yu wrote:
> On 2020/3/9 20:00, Andrew Jones wrote:
>> On Mon, Mar 09, 2020 at 12:57:51PM +0100, Andrew Jones wrote:
>>> This looks pretty good to me. It just needs some resquashing cleanups=
.
>>> Does Andre plan to review? I've only been reviewing with respect to
>>> the framework, not ITS. If no other reviews are expected, then I'll
>>> queue the next version.
>>
>> Oops, sorry Zenghui, I forgot to ask if you'll be reviewing again as
>> well.
>=20
> I'd like to have a look again this week if time permits :-).=C2=A0 Than=
ks
> for reminding me.
I have just sent:

[kvm-unit-tests PATCH v5 00/13] arm/arm64: Add ITS tests

where I took last Drew's comments

Thanks

Eric
>=20
>=20
> Zenghui
>=20
