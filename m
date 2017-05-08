Received: by 10.25.0.198 with SMTP id 189csp1390878lfa;
        Mon, 8 May 2017 07:33:14 -0700 (PDT)
X-Received: by 10.84.233.199 with SMTP id m7mr63147048pln.108.1494253994464;
        Mon, 08 May 2017 07:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494253994; cv=none;
        d=google.com; s=arc-20160816;
        b=ExvrEH0CGJK7akycAGYVcE0H+aXUPnrhTCjBG8sKqenCW7sEQVwTXUg9n8wrvMOkvL
         4TjUMK6t76eqf4qPTagAtnk1ZLZc1dTJhfAX4qDcKp5Ag1fhAqah3D1ySgUQX8OGbvKd
         FOjm+lJq+6963jML+2oaeJQ2C+UkQXZY9v3Zivpg8jJxluBehfdeZjz4RVbWk3kAW6sx
         EF17mDkwW1HOGFSbh7Ebsy9mogzGdjG32jhnfaP22pDIBzkxJBhHF96FUCy6HKBVbYYW
         gmzkhMF1oNGggtBevCu9RfkH0+cVGwYU3nqADBXNkwcfWM/aFAc6aoTysgy0+r5UPI79
         BlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:mime-version:user-agent:date
         :message-id:organization:openpgp:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=w/HRGpNYB0xNJeb6P2uhp/DG9QFa5P8Avjn9xuhIvr4=;
        b=kRdM6J7ELnKicibZrXUZaDooqlyN0CJ3J37P3vA82gW/jj34NyNVmfNB8RhxEMH7T3
         CAmHEdhs2TTiiPG2B9MdbQxuZE5kpyPdhFl1veDkxm3JaWZvXJzex+8wt5HMqxlIFL3S
         t/Uwdsitv7bURfQhYu8DoGvXxR/7R4ofW/GPDGBwAfyncAwUPs2kpF3YZltyzqNV8Ht0
         rnfXjjsoR0nIs5jt6tJjqK7UsDIVMzknsuVxp4mmZLRx/gzgHqbu70qQhHMdn4TsWk9k
         u5LkikwrB153ljcWu9ykQ1TxU6qjqsnjz/j6Nc8+Q0Bdmk6iewCT4CDyAHQ4ra/ykA6M
         R2xA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 64si10639271pft.307.2017.05.08.07.33.14;
        Mon, 08 May 2017 07:33:14 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754839AbdEHOdH (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Mon, 8 May 2017 10:33:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39746 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753852AbdEHOdF (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 8 May 2017 10:33:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 46375A0905;
        Mon,  8 May 2017 14:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 46375A0905
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 46375A0905
Received: from [10.10.122.86] (ovpn-122-86.rdu2.redhat.com [10.10.122.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9BAEC5C7A6;
        Mon,  8 May 2017 14:32:43 +0000 (UTC)
Subject: Re: [PATCH v6 3/5] shutdown: Add source information to SHUTDOWN and
 RESET
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
        alistair.francis@xilinx.com, "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Burton <paul.burton@imgtec.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Alexander Graf <agraf@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Cornelia Huck <cornelia.huck@de.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Stefan Weil <sw@weilnetz.de>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        "open list:Old World" <qemu-ppc@nongnu.org>,
        "open list:Overall" <kvm@vger.kernel.org>
References: <20170505193810.2934-1-eblake@redhat.com>
 <20170505193810.2934-4-eblake@redhat.com>
 <20170508052617.GC25748@umbus.fritz.box>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <117db2fa-302b-362a-738c-0c114439f8af@redhat.com>
Date:   Mon, 8 May 2017 09:32:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170508052617.GC25748@umbus.fritz.box>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eJaV9TWHqeWL3RiuGaBs5V0dHviTnHgX7"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 08 May 2017 14:32:55 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 33V5G+iAgVU0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eJaV9TWHqeWL3RiuGaBs5V0dHviTnHgX7
Content-Type: multipart/mixed; boundary="N3SR1LsJgaJAGWQAJUnJiFhkLotjXn9So";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
 alistair.francis@xilinx.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 Andrzej Zaborowski <balrogg@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Burton <paul.burton@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michael Walle <michael@walle.cc>,
 Max Filippov <jcmvbkbc@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcelo Tosatti <mtosatti@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 "open list:Old World" <qemu-ppc@nongnu.org>,
 "open list:Overall" <kvm@vger.kernel.org>
Message-ID: <117db2fa-302b-362a-738c-0c114439f8af@redhat.com>
Subject: Re: [PATCH v6 3/5] shutdown: Add source information to SHUTDOWN and
 RESET
References: <20170505193810.2934-1-eblake@redhat.com>
 <20170505193810.2934-4-eblake@redhat.com>
 <20170508052617.GC25748@umbus.fritz.box>
In-Reply-To: <20170508052617.GC25748@umbus.fritz.box>

--N3SR1LsJgaJAGWQAJUnJiFhkLotjXn9So
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/08/2017 12:26 AM, David Gibson wrote:
> On Fri, May 05, 2017 at 02:38:08PM -0500, Eric Blake wrote:
>> Time to wire up all the call sites that request a shutdown or
>> reset to use the enum added in the previous patch.
>>
>> It would have been less churn to keep the common case with no
>> arguments as meaning guest-triggered, and only modified the
>> host-triggered code paths, via a wrapper function, but then we'd
>> still have to audit that I didn't miss any host-triggered spots;
>> changing the signature forces us to double-check that I correctly
>> categorized all callers.
>>
>> Since command line options can change whether a guest reset request
>> causes an actual reset vs. a shutdown, it's easy to also add the
>> information to reset requests.
>>
>> Replay adds a FIXME to preserve the cause across the replay stream,
>> that will be tackled in the next patch.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> Acked-by: David Gibson <david@gibson.dropbear.id.au> [ppc parts]
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [SPARC p=
art]
>=20
> [snip]
>=20
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 9f18f75..2735fe9 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1166,7 +1166,7 @@ static target_ulong h_client_architecture_suppor=
t(PowerPCCPU *cpu,
>>      spapr_ovec_cleanup(ov5_updates);
>>
>>      if (spapr->cas_reboot) {
>> -        qemu_system_reset_request();
>> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>=20
> I'm not 100% sure about this one, since I'm not sure 100% of how the
> different enum values are defined.  This one is tripped when feature
> negotiation between firmware and guest can't be satisfied without
> rebooting (next time round the firmware will use some different
> options).

Patch 2/5 introduced the enum.  The biggest part of the patch (for now)
is that anything SHUTDOWN_CAUSE_HOST_ will be exposed to the QMP client
as host-triggered, anything SHUTDOWN_CAUSE_GUEST_ will be exposed as
guest-triggered.  I basically used SHUTDOWN_CAUSE_GUEST_RESET for any
call to qemu_system_reset_requst() underneath the hw/ tree, because the
hw/ tree is emulating guest behavior and therefore it is presumably a
reset caused by a guest request.

>=20
> So it's essentially a firmware/hypervisor triggered reset, but one
> that should only ever be tripped during early guest boot.  Is
> CAUSE_GUEST_RESET correct for that?

Of course, I'm not an export on SPAPR, so I'll happily change it to
anything else if you think that is more appropriate. But the rule of
thumb I went by is whether this is qemu emulating a bare-metal
reset/shutdown, vs. qemu killing the guest without waiting for guest
instructions to reach some magic
memory/register/ACPI/who-knows-what-else request.  While it may happen
only early during guest boot, it is still the guest firmware that is
requesting it, and not qemu causing a unilateral death.

>=20
> Apart from this, ppc changes
>=20
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

Thanks.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--N3SR1LsJgaJAGWQAJUnJiFhkLotjXn9So--

--eJaV9TWHqeWL3RiuGaBs5V0dHviTnHgX7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEIGKAAoJEKeha0olJ0NqFUAH/2b8f/o4s8hHefg41wGxezZb
A/JVuE4gus9lM/B2Nrl5GgA32JQVDjLtXlty2jcZRrdfFA7TOwVXREaAwThe+F/O
Y2su6qeNcuSLbdN3SL4ygiPDSmuZwaS4b6sDtE94MOaj1zCNkqtd713i/AP4xWDy
2ZRR+SOIbl/CKP6n83aZTDLjI9gGZOZiE/g1BLCz6c/y2QWKvHVFtEmkTb//m9yJ
LUWwTiP3LV40z5FRq+gjpE+G0V+wb2JqE5UGd24Fau4M4e9dWyIhwH7+hulkv9E7
anGqjLdYhNDGnnz8jCvXo4DBYjiY0DdnhlVOHuvdUlcSVIp1n99/QpmkdjrR5Ws=
=fXNm
-----END PGP SIGNATURE-----

--eJaV9TWHqeWL3RiuGaBs5V0dHviTnHgX7--
