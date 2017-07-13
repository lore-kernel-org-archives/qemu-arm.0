Received: by 10.25.44.15 with SMTP id s15csp2078236lfs;
        Thu, 13 Jul 2017 05:05:49 -0700 (PDT)
X-Received: by 10.200.50.2 with SMTP id x2mr4619326qta.23.1499947549341;
        Thu, 13 Jul 2017 05:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499947549; cv=none;
        d=google.com; s=arc-20160816;
        b=FhBY2Z9Qs5juuaDYR6WImFE+i3z3lE6dmkrv6ytpgAqZTTkHEZ0AXYUYZv/ZdN8ZIB
         XJuBXYUXUJBMfKUQ0TcZ2sUuTkeJRuCzQq3CheWrXNrH1NjVVgT424dFLRo5xuUwq6CW
         GEQbO2QJpXtFoGWC3YRiia00F68RqgT5AtIyB71CfKSxL3krEGS3qzPF9VBrz8bSxMWZ
         1SIlpXwpDGs0YG5MBx6wb3bhrLE2hVvAIsc0TWodcA4fJXG8VZQcAMHYYg2/naLlUBxZ
         +JfLrsnp7tF4pdcYuAFomhCMG3/aP+2glTESdpcfH7dzG7l9cC81zuCHDMT6Bsg8Zvm0
         4ToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=yBra1SjTk/PXDJlt3mB90Ye7ttdFGO7aZqCKQBrTvNY=;
        b=0Hz9DwZfvpIEfLz84ZX04EDRjKyIbz7jmCBepTl2+rxw4pSHKtzmBouTaOcPAQaPXo
         ZAqNZwMvzJT/oyyDFXtEiQsxZkmGKE/pnOMx63x3gOo71ikw/lDSCSoaSyfchSPwhacY
         Dvbtv3UJIAeRnpgnb5ZoqvNG4izgStnIjmq7hDms4Pe4Jfy/8Brw1GnOTNVWKn8GiZ+W
         HxEvT494fhpZxad+bsSVQnnHP1xj0Ru6wDx43gm2SyJBO1xcv85P4P4AlCrj/KM8bWqE
         G7s3Q/2ctAtA6h74KFauz8ZgIL+ffpSQuXJAF2K0lVcOZXCyVu/x+srjgWW+5jFhlPB8
         YpFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q19si1058472qke.312.2017.07.13.05.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 05:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVcsM-00030y-KX
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 08:05:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dVcsH-0002zC-PN
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dVcsE-0004wk-HV
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:05:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dVcsE-0004vB-B0; Thu, 13 Jul 2017 08:05:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3067F7D0EF;
	Thu, 13 Jul 2017 12:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3067F7D0EF
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3067F7D0EF
Received: from [10.36.117.124] (ovpn-117-124.ams2.redhat.com [10.36.117.124])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A3C6060C;
	Thu, 13 Jul 2017 12:05:35 +0000 (UTC)
To: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org
References: <20170630030058.28943-1-andrew@aj.id.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cd1aba90-176f-9ec6-3e2b-d1135156a96d@redhat.com>
Date: Thu, 13 Jul 2017 14:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170630030058.28943-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Jul 2017 12:05:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 1/1] memory: Support unaligned accesses
 on aligned-only models
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: f4bug@amsat.org, qemu-arm@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KUdwGnKTPlAT

On 30/06/2017 05:00, Andrew Jeffery wrote:
> This RFC patch stems from a discussion on a patch for an ADC model[1] w=
here it
> was pointed out that I should be able to use the .impl member of
> MemoryRegionOps to constrain how my read() and write() callbacks where =
invoked.
>=20
> I tried Phil's suggested approach and found I got reads of size 4, but =
with an
> address that was not 4-byte aligned.
>=20
> Looking at the source for access_with_adjusted_size() lead to the comme=
nt
>=20
>      /* FIXME: support unaligned access? */
>=20
> which at least suggests that the implementation isn't complete.
>=20
> So, this patch is a quick and incomplete attempt at resolving the issue=
 to see
> whether I'm on the right track or way off in the weeds.
>=20
> I've lightly tested it with the ADC model mentioned above, and it appea=
rs to do
> the right thing (I changed the values generated by the ADC to distingui=
sh
> between the lower and upper 16 bits).

I think the idea is okay.

> +    access_addr[0] =3D align_down(addr, access_size);
> +    access_addr[1] =3D align_up(addr + size, access_size);
> +
> +        for (cur =3D access_addr[0]; cur < access_addr[1]; cur +=3D ac=
cess_size) {
> +            uint64_t mask_bounds[2];
> +            mask_bounds[0] =3D MAX(addr, cur) - cur;
> +            mask_bounds[1] =3D
> +                MIN(addr + size, align_up(cur + 1, access_size)) - cur=
;
> +
> +            access_mask =3D (-1ULL << mask_bounds[0] * 8) &
> +                (-1ULL >> (64 - mask_bounds[1] * 8));

Please use MAKE_64BIT_MASK.

> +            r |=3D access(mr, cur, &access_value, access_size,
> +                  (MAX(addr, cur) - addr), access_mask, attrs);
> +
> +            /* XXX: Can't do this hack for writes */
> +            access_value >>=3D mask_bounds[0] * 8;
> +        }

Can you subtract access_addr[0] from mask_bounds[0] and mask_bounds[1]
(instead of cur) to remove the need for this right shift?

Thanks,

Paolo
