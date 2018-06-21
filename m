Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1374482wrq;
        Wed, 20 Jun 2018 17:38:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI79h4hfx96UOIIHRP8HPvVHRdli7EpSofAsodtd4luqaLTpazgslHPXTh9V9lr6kJz9C/O
X-Received: by 2002:a37:bf43:: with SMTP id p64-v6mr19008668qkf.46.1529541534894;
        Wed, 20 Jun 2018 17:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529541534; cv=none;
        d=google.com; s=arc-20160816;
        b=Gso9aAo9/N4cADM+1JSU5PSDcU5nX/9ek9NX0Y4f2EVTYNHpRJUQz1JJpluraOAjIu
         FmY3M4OBCbB3uCypJlBAR64BFnDNO7wsFHnIMwOJv5KdN5eTLJARsj7OLtjge481osIV
         zbRH1gKGGCQD7tYzE47MYY7rr7N0FPEaQQoCh+sn24rlPPig3JyCNntxNEsY7VNs0f+X
         fC8KGo4UnQEC5W8BgTONf72G6AD2L1T/qlM8n93/X6QLJyS2BEY3AJHpe83uQIH2H4xK
         +FR4qey/2G04upKyzt4B25aYv9B+BCGQ0s9LRLgKp5e8UZPRLxpMAr7jRC5EInbDqotj
         9cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=rCOiKVwrr0vObpL01OHM09GleGZc5eCggqcM9PVHibk=;
        b=m0DOy/msRF/3MTLJLw2pn5mZ/tR2bk5qK6pJbsfRe1pCohmfdZjH3nV0jLqjVVf78A
         MOGfmEsueEiNy5spN3DlZs7XuoiFD0JKpoEHODzuMDC77GEvdTt2rC+Lj4lFnyrMhfyw
         hCJ70nCFlo1p+FSS+r2XfnXyx0NzF2DsqZd4e8S+hGb2CcMWzFx0DSaayarzFtsUoW+d
         RBERvbW4Z/LrgNabcc7e/CFiQVXVVpqux8zntcDKSXqCgCQ7InIlvm5uwoof+WlSmg0U
         ePgQve5j74D7TKV97s6iB8a3OZWA9GAlk/vYA0YlCxE2Jrv7rmt4uul/XTlLsC7wwcUr
         bkeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Gh4qMSb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66-v6si3609350qkd.29.2018.06.20.17.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 17:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Gh4qMSb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVnck-0005Kf-D7
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 20:38:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fVnca-0005KF-DH
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 20:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fVncZ-0006ID-4g
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 20:38:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41473)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1fVncY-0006Ae-37; Wed, 20 Jun 2018 20:38:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 41B2qv2XfPz9s2L; Thu, 21 Jun 2018 10:38:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1529541515;
	bh=e0m7TncE1kj/g7CyOEpBjrbaDFc0TULUKrVgaZtU5UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gh4qMSb8gm6PtdxSTrllbxJC/zb733NF5U5ebGj5EE6jaxPzkodJquzht2eYoCg2K
	iu5YrghcGHMhpc9ocjc4SF6p7VkADWapWzotLt2R5dsWpgHVun5OXZ8VEa2V0DCcM+
	DOakeq2wMU3zyeLTsljhGHV+abYPlbfyj5Zu/51Y=
Date: Thu, 21 Jun 2018 10:37:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180621003758.GB32328@umbus.fritz.box>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-4-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <1529500053-21704-4-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [RFC 3/6] kvm: add kvm_get_max_vm_phys_shift
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, suzuki.poulose@arm.com,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WRN2z2yrnSYf


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:07:30PM +0200, Eric Auger wrote:
> Add the kvm_get_max_vm_phys_shift() helper that returns the
> log of the maximum IPA size supported by KVM. This capability
> needs to be known to create the VM with a correct IPA max size
> (kvm_type passed along KVM_CREATE_VM ioctl.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  accel/kvm/kvm-all.c    | 7 +++++++
>  accel/stubs/kvm-stub.c | 5 +++++
>  include/sysemu/kvm.h   | 1 +
>  3 files changed, 13 insertions(+)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0590986..137c38e 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -280,6 +280,13 @@ static int kvm_set_user_memory_region(KVMMemoryListe=
ner *kml, KVMSlot *slot)
>      return ret;
>  }
> =20
> +int kvm_get_max_vm_phys_shift(MachineState *ms)
> +{
> +    KVMState *s =3D KVM_STATE(ms->accelerator);
> +
> +    return kvm_ioctl(s, KVM_ARM_GET_MAX_VM_PHYS_SHIFT, 0);

=46rom the ioctl() name, I'm assuming this is an ARM specific call.

In which case, shouldn't it be in target/arm.kvm.c, not kvm-all.c ?

> +}
> +
>  int kvm_destroy_vcpu(CPUState *cpu)
>  {
>      KVMState *s =3D kvm_state;
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 02d5170..7575ba7 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -161,6 +161,11 @@ bool kvm_has_free_slot(MachineState *ms)
>      return false;
>  }
> =20
> +int kvm_get_max_vm_phys_shift(MachineState *ms)
> +{
> +    return 0;
> +}
> +
>  void kvm_init_cpu_signals(CPUState *cpu)
>  {
>      abort();
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 0b64b8e..240e3d9 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -206,6 +206,7 @@ extern KVMState *kvm_state;
>  /* external API */
> =20
>  bool kvm_has_free_slot(MachineState *ms);
> +int kvm_get_max_vm_phys_shift(MachineState *ms);
>  bool kvm_has_sync_mmu(void);
>  int kvm_has_vcpu_events(void);
>  int kvm_has_robust_singlestep(void);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsq82YACgkQbDjKyiDZ
s5IPLg/+Mwp3WKz9NlTwx9vNw6c+GjPztP2ZHvAp0ZxofimFfaMjGlvmmXmgv72u
H403Df2B53L3Dbu01krp0DFeNF8Vzw8s7IoyyacmO2FyXgSfzIk9eedX9VakY9UA
tviyK8bAI7o0BqVSZa9BKAPzTumn2GSXJPEuzoEgoW7fqLzLYG+LFFpQDYCapi2R
Gj40XeMlk4uz6RmTI6q/dRqi79QsuIrQPHUwXpFUclLFoexNR6OcoeBDk73bMkdU
uy+JmM1elwS0DjgeGjAcg1JR/X5K4adAhJ4JeUbqXdNfhzwFFYtmDZuwp4P16dve
x05Xos6VKPMM0nZuQsmZih5M7/RE1oLM+GSL4BgODrDIlDfhM54ZVlgto1p3T0ny
H+nwSqNKKIt2jioqdP53Pb/Ws++OyBI4bLWHCxh9Z9BTQGzxa3Xre19S5ZArFTF8
wQjwTIL4t+AtTG4uP5tKGOgoJN8aPK7Yjz/6LigDIHQpzsFLKMLiY7AMubSHisKG
EHcWWnNgt8K1U8n7RIICQLETZkM3K4O3Z/TcPhfGICXE9a1QgNLmLAhGxnU7Vrys
L8qPYFre+esnDhtQA3u/MI+mvdR9MZ4Z6Q0NAD0214wGppZHxiwX2u8vuz1GIn9x
WGVdmaHCBiBTJxuExmgWFMqUpyd7j5FOu9OUyy4SwKuVJCFRp7M=
=qEwn
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
