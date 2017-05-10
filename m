Received: by 10.25.0.6 with SMTP id 6csp139601lfa;
        Wed, 10 May 2017 00:33:23 -0700 (PDT)
X-Received: by 10.99.103.7 with SMTP id b7mr4917584pgc.2.1494401602934;
        Wed, 10 May 2017 00:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494401602; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz84KWH9MUbsp2qWc3ttIRMhFPcG8rUKGTRIgl7SrTkHDCfhTf+f9zGB8u3SeUZwCU
         yB62XxGIpfVHInE8Liz7QhPTwgOf5bU+IJcpylQqPQPRvtpQRtZ3+XCynudZrRqa4emZ
         eekcwwsNuvTM+xGsi+umhGR5Wu2wJ744QMFcqbTT8Yc+ENBoSRJ//yWMzY1bvkyE9g9f
         vR++LX7rskMu3TOBHEoiNmIl9efesBoXSeChKsv2q8e+trGalowo4zAsGnd2OSzRjdeG
         CTQtE3KWd7d1U5mVyndq2/l0Nly3AMH9Km9tfDKS2I1X2qL9QzVpAMrnvj1iLc5Z1hqR
         E9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:arc-authentication-results;
        bh=8Oa7BDibavp6PNV4ZrV2ZfQHR4ucGVUbOHIMCiJvtik=;
        b=jNlZPg5Aj0GNTYTwOq0gUOSJ6Qqfc4AkvAP/pXgc6xeo5WI2wH9yc9tT35jn40uwuW
         TF3SAa9jQeeNvsPH1QkrVWUyzO6DZwWd4ZbpVpWNe4Yd+aCczuF9FXqeqKn8gsF2jeUo
         hjkhVUOI6Jxj/OxfDBHvYjFioSXdpRd9rkWWkmMIchQhVOwMVxxBr8/OdBMVOoE3vI3q
         S+zUrpSz2ZrdUj1cFyxVraKANT+L0+jJ7jZovvALsrXPpKn4SQ4LpWiHynuE1kPhTziq
         78Q0nm3anAjvsscdbmS/zp0tFrsghnEjP0pKlt8z30aym+8SqmUh/mpf+gmOzr16NOBj
         0wxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 192si2339836pfu.99.2017.05.10.00.33.22;
        Wed, 10 May 2017 00:33:22 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751200AbdEJHdU (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Wed, 10 May 2017 03:33:20 -0400
Received: from ozlabs.org ([103.22.144.67]:52815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751081AbdEJHdT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 10 May 2017 03:33:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
        id 3wN7JF4WXCz9s1h; Wed, 10 May 2017 17:33:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1494401597;
        bh=WmgjyEL7JZ5x755wu8dOHVMgVRe+ZvS2h7JGEsCxmh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A/yH+n7eRf+2NzKC7GHHahF8+sjuQQ39VAhh3BgUU3usTiscz23qPLQhL+qtcnKM0
         A1GnTx5rcQCYyj/T/4b3x/oheTBotm1RXsUvVWRijpfA8pqQ4Y0TOOKx1DEqDcSafg
         UEZ5j1j9bap4VqDQNv4LcrREYdvTvnM9F0yxXchI=
Date:   Wed, 10 May 2017 17:33:12 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Eric Blake <eblake@redhat.com>
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
Subject: Re: [PATCH v6 3/5] shutdown: Add source information to SHUTDOWN and
 RESET
Message-ID: <20170510073312.GX25748@umbus.fritz.box>
References: <20170505193810.2934-1-eblake@redhat.com>
 <20170505193810.2934-4-eblake@redhat.com>
 <20170508052617.GC25748@umbus.fritz.box>
 <117db2fa-302b-362a-738c-0c114439f8af@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0btr6/5+bhBdui6J"
Content-Disposition: inline
In-Reply-To: <117db2fa-302b-362a-738c-0c114439f8af@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: aIXV7g245uj8


--0btr6/5+bhBdui6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2017 at 09:32:42AM -0500, Eric Blake wrote:
> On 05/08/2017 12:26 AM, David Gibson wrote:
> > On Fri, May 05, 2017 at 02:38:08PM -0500, Eric Blake wrote:
> >> Time to wire up all the call sites that request a shutdown or
> >> reset to use the enum added in the previous patch.
> >>
> >> It would have been less churn to keep the common case with no
> >> arguments as meaning guest-triggered, and only modified the
> >> host-triggered code paths, via a wrapper function, but then we'd
> >> still have to audit that I didn't miss any host-triggered spots;
> >> changing the signature forces us to double-check that I correctly
> >> categorized all callers.
> >>
> >> Since command line options can change whether a guest reset request
> >> causes an actual reset vs. a shutdown, it's easy to also add the
> >> information to reset requests.
> >>
> >> Replay adds a FIXME to preserve the cause across the replay stream,
> >> that will be tackled in the next patch.
> >>
> >> Signed-off-by: Eric Blake <eblake@redhat.com>
> >> Acked-by: David Gibson <david@gibson.dropbear.id.au> [ppc parts]
> >> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [SPARC p=
art]
> >=20
> > [snip]
> >=20
> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> >> index 9f18f75..2735fe9 100644
> >> --- a/hw/ppc/spapr_hcall.c
> >> +++ b/hw/ppc/spapr_hcall.c
> >> @@ -1166,7 +1166,7 @@ static target_ulong h_client_architecture_suppor=
t(PowerPCCPU *cpu,
> >>      spapr_ovec_cleanup(ov5_updates);
> >>
> >>      if (spapr->cas_reboot) {
> >> -        qemu_system_reset_request();
> >> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> >=20
> > I'm not 100% sure about this one, since I'm not sure 100% of how the
> > different enum values are defined.  This one is tripped when feature
> > negotiation between firmware and guest can't be satisfied without
> > rebooting (next time round the firmware will use some different
> > options).
>=20
> Patch 2/5 introduced the enum.  The biggest part of the patch (for now)
> is that anything SHUTDOWN_CAUSE_HOST_ will be exposed to the QMP client
> as host-triggered, anything SHUTDOWN_CAUSE_GUEST_ will be exposed as
> guest-triggered.  I basically used SHUTDOWN_CAUSE_GUEST_RESET for any
> call to qemu_system_reset_requst() underneath the hw/ tree, because the
> hw/ tree is emulating guest behavior and therefore it is presumably a
> reset caused by a guest request.

Ok.

> > So it's essentially a firmware/hypervisor triggered reset, but one
> > that should only ever be tripped during early guest boot.  Is
> > CAUSE_GUEST_RESET correct for that?
>=20
> Of course, I'm not an export on SPAPR, so I'll happily change it to
> anything else if you think that is more appropriate. But the rule of
> thumb I went by is whether this is qemu emulating a bare-metal
> reset/shutdown, vs. qemu killing the guest without waiting for guest
> instructions to reach some magic
> memory/register/ACPI/who-knows-what-else request.  While it may happen
> only early during guest boot, it is still the guest firmware that is
> requesting it, and not qemu causing a unilateral death.

So, I think GUEST_RESET is the right choice here.  The distinctions
are blurry, because PAPR is built as a paravirtualized platform -
there is no bare metal equivalent.  For example, on PowerVM this
really would be initiated by guest firmware, but it's working in
communication with the hypervisor.  But with qemu and KVM, we actually
implement all this negotiation logic in qemu directly (this is easier
than having complex communication channels between guest firware and
qemu).

But I guess the point is that this is a "business as usual" reboot and
the guest is expected to continue booting at some point after this,
rather than being killed by qemu.

Things get more complicated still if we think about what happens if
this feature negotiation fails - then we can't boot the guest OS.  At
the moment the few cases where this happens, I think we just exit
qemu, but notifying this as a host caused shutdown might be
appropriate.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0btr6/5+bhBdui6J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEsI2AAoJEGw4ysog2bOSrZQQAONQcDrk+8XBHkJ+cjUrLJmD
GvWf8otaUn05Y8BqwzsDqav4jUGX9hlt1nyamQVXRGrjjOoWx3vGO3n3n6E9rqkj
iNnEHqnXgvYn8JgGBpYQ1pawEsCuq+NpQa9wLu9SDsg9WEFpu0kA/SjXqSQAsej2
RSCn39/UvO/3h2uDKCxntQ1UiMW9+hywaxfTNX8r1+n4h10LRcD3OhvqdN3v4wlw
nzU81CXhM3XHVkMD5nG7T/Deg7BrmR0aaogvJmDvhsqIqa+KnLLZw2f8R4mclOEA
A25e9xG8sze0J2yFyS2TDTuQuQzp/r0fnvH5A9b49S51gn2rHgZ3xIVs8rz+KUGa
uAkmYzyEtXoLKfZyf+lHjVfJRhGpINu9JzhRBlR+0GRwm9a10Onzeo27cDRFc5CM
E50UVmIecjfWO9x0CAemez6YqfXuqLIBB408+Y4WkOLoWHiwGqZjEHRNtzGY3tI9
4g2t17iHfhkhMw5Eq6B3pBtEQOY21d+PODL93iwfuAq1RmAcUhjmUD1+mRM3GdcA
pBNZNAE/5k3r3VzA10DRd3ebmJ6UDOWefUWOHIqK2fZsf/tNHhJBo0k3WPOlmq+m
MTCMqSkqIsOpDYK7YHvLWZNxk+jymMTf9albzjCX202C77zbpmQa0Y59o03HMbDf
mrS9Yc16j48Dox+nzqwT
=IB2R
-----END PGP SIGNATURE-----

--0btr6/5+bhBdui6J--
