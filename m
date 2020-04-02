Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1764196lfi;
        Thu, 2 Apr 2020 02:59:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypLyAt5ij8l//V60jhis4a5v+w8b2ioFnZWYf46vmB0hc3x5M2c98/Axh//b843WyLtfAGyu
X-Received: by 2002:ac8:72d7:: with SMTP id o23mr1988863qtp.101.1585821564837;
        Thu, 02 Apr 2020 02:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585821564; cv=none;
        d=google.com; s=arc-20160816;
        b=E4gDDx63MJSKX9lUUAunuPPZSRMar+rdzzo1uPLuQlhkkANIxHQsL1gcdpQYXOnAV8
         askQF6TgDq5/uBwKDZGWeYpCSiTVTgxXYCO9fVIQOgez2GmgmIojx6rKiPUj09oTnnFL
         n4JtM3nic0PSIfI1H0eFylzXXXeAmdNtRyWLYgT5zDWsqTaOSLGNwzGlrA7N6bnc3dx0
         j19AXXYx1eBklKmfJTu/b4BvB/G/p4/LjMzH/JYYO/nVyz76T9JycZJJ+LvUl6qIzBiX
         o4yWFuSxBKq4Jx4ReaxmpKOHusVTb3lQj5i2lXtQ9byQYv7GNdYavyPy8E9W8B3yFSwn
         lsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=bYJz8UBRrNj3MPpag7qiVmHNTPTcSrtNZp7+exnqYA8=;
        b=JNRPWXnMh5NtNvl1u+8EY1B+7HGhdiqBU0cRVj3y8ACOu/ir8FmzjxKugwyARgbaIM
         QouHyJNNIv8kaakn46gFuWsPy2ZycMgQKVmZzvGJDMVrokJHppU3cb5fiDdSMmibGKAf
         qlprKnr0nGbOJFLG4sWevqtSUgJgAkaUxgHMtFDaAutUYlOBxeatv9WAYM9mfIHVYUyL
         S2qVCTBZy1+dZY9Ny/XB84lswd0HK4wN3CYGC1tn+3iY/YMoaMCthYo51XShzXbjH9cR
         R/1bBtOEFAKN0EiO8SA27VefTlF9MCsUZkvwNblEGVW1PhK5vaD9u7x0CY+FnmgjLJNh
         2nNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VY8enEoC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si2867064qvn.1.2020.04.02.02.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 02:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VY8enEoC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJwdA-0007Zs-89
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 05:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jJwd1-0007Z0-Gq
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jJwd0-00063k-Ag
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:59:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jJwd0-00063Q-4p
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585821553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYJz8UBRrNj3MPpag7qiVmHNTPTcSrtNZp7+exnqYA8=;
 b=VY8enEoCxxANlFBDaWveceq7O9Noe2WvfKEHbe0OsZyyd1nd1TflDn7k+GA8WLjuTF8IEu
 KwefT9fWzXlXMHBsoGhwRsx92Bd9Ddpx/3nKLnY8Qm8DzDKJwwnBfgHqu/alE/wiQgkOMB
 mbMuNGUW3MnCt3kmv9Jumpkz6ic+wyc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-tVhvOvkwNha7l_eskh8VQg-1; Thu, 02 Apr 2020 05:59:10 -0400
X-MC-Unique: tVhvOvkwNha7l_eskh8VQg-1
Received: by mail-wr1-f71.google.com with SMTP id f15so1251147wrt.4
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2020 02:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=kcM+lIQaFPCujnSX/yJSGlUbqRxnq+GCz6SpXdNKbLU=;
 b=D2M4m8LMKvbQkt18LByKqXlsqIp4qQ4k7+jJuMP7Y+j3uyXyCCfYxcr8VXn/RoMc3H
 bivrEUl41QBmmHL0PlJapHXfMQgEfZCFUDxl+KlNMADACXLYG5YztzdXB7vq3B675kv/
 A/i3bSKKH0soX2ITQXCSTEOopoWrS6gm5y13OtMl9m4tqpjVfr8tJN8ASVfV4XQb7w8P
 47h1oMetoYnxf6rJpVv0LhQiyQ5CtL03DnxlHJ0wzEK+72a8NT2QHEwXZo6uLsZEkVwH
 i7dTU8X3gkSComJhyFW4JH3nN31EGlCoiMlRbf1OE4Oy6MEqUCG9UMiALW5xv+32aQIi
 vK/A==
X-Gm-Message-State: AGi0PuZWQF51QMqNcdtwIPZ6G3+DbmnvT4TEbIH3aza9xmob4saJSJy9
 EK2RNtqg8CmKGcVrOniTLl+y1C/ViGmbuarT9zNroZ1nZMRGJSHu/Do0HF+L0dmo3Ko7qZBKaHR
 txH1bADf4u/SZ
X-Received: by 2002:a1c:f315:: with SMTP id q21mr2640266wmq.169.1585821548721; 
 Thu, 02 Apr 2020 02:59:08 -0700 (PDT)
X-Received: by 2002:a1c:f315:: with SMTP id q21mr2640243wmq.169.1585821548459; 
 Thu, 02 Apr 2020 02:59:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1868:42dd:216c:2c09?
 ([2001:b07:6468:f312:1868:42dd:216c:2c09])
 by smtp.gmail.com with ESMTPSA id t6sm6250937wma.30.2020.04.02.02.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 02:59:07 -0700 (PDT)
Subject: Re: [PATCH v2] util/async: Add memory barrier to aio_ctx_prepare
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20200402024431.1629-1-fangying1@huawei.com>
 <20200402093221.GD28280@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7de4d886-d861-5c80-f669-098b730906c8@redhat.com>
Date: Thu, 2 Apr 2020 11:59:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402093221.GD28280@stefanha-x1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7fYZeEc37bDDNzeSKpHMy6djmskiuXbhL"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: fam@euphon.net, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, qemu-arm@nongnu.org, Ying Fang <fangying1@huawei.com>,
 wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yz8BAY+7Re9l

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7fYZeEc37bDDNzeSKpHMy6djmskiuXbhL
Content-Type: multipart/mixed; boundary="ARsgMU4D6t2OXgPmm6TrvkE6RHKAjBl9w"

--ARsgMU4D6t2OXgPmm6TrvkE6RHKAjBl9w
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/04/20 11:32, Stefan Hajnoczi wrote:
> Paolo, I'm not sure how to interpret this case according to
> docs/devel/atomics.txt.  Maybe you can clarify.
>=20
> atomic_or() is sequentially consistent and I therefore expected it to
> act as a barrier.  Or does sequential consistency only cover the memory
> accessed via the sequentially consistent atomics APIs and everything
> else (like aio_compute_timeout()) can be reordered?

Yes, that's what I expected too when I wrote that code. :(  But Torvald
Riegel explained a while ago that seq-cst accesses are actually weaker
than e.g. the Linux kernel atomics[1].

The difference basically only matters if you are writing the relatively
common synchronization pattern

=09write A=09=09=09=09write B
=09smp_mb()=09=09=09smp_mb()
=09read B=09=09=09=09read A
=09if not B then sleep=09=09if A then wake up the other side
=09do something

because you must either use memory barriers as above, or use seq-cst
writes *and* reads.  You cannot rely on having a memory barrier implicit
in the writes.

Paolo

[1] https://lists.gnu.org/archive/html/qemu-arm/2019-10/msg00051.html


--ARsgMU4D6t2OXgPmm6TrvkE6RHKAjBl9w--

--7fYZeEc37bDDNzeSKpHMy6djmskiuXbhL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl6Ft2oACgkQv/vSX3jH
roMn6gf9G8iYNeFAnctSRlfxhtoLOahjINkoihuLe14ZwXCPJXugXey7TUiY7y6t
H30E1NGCfcgqxtMZhFVDl18AyptkE3kMXAJiI083YUcm6gZVYji8YWKq16EROk58
N1Y2YbSj9PXchZboZLXMfhho0fRCOA5kP+bXpEOOHOlcxMmgLXg9SYNVXIGy/hsK
+oUIF3WHn+AJyu1B7l3DLl+7HRGcR9VL5qp+Ka418KbtFs3m3TWpfNVVFOkWe9Kx
oVJmmR8GM1Ow1sWaYAtaNSKVUVgr5sjzroLleC2Y+52gUehV9jEKkMxKjCerNwiD
BvTYzBOxxuE374YmXGXlHxHtL1rhww==
=+IeU
-----END PGP SIGNATURE-----

--7fYZeEc37bDDNzeSKpHMy6djmskiuXbhL--

