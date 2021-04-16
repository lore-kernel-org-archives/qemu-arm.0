Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp49733lfr;
        Thu, 15 Apr 2021 21:52:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCdHVnW5thsCs6nBiLt6RdItOEu7h+QOSm9GO5l6T1rGNJHqYy7Tz/hCej5b3Zt3efOrUg
X-Received: by 2002:ae9:eb84:: with SMTP id b126mr7111268qkg.135.1618548776811;
        Thu, 15 Apr 2021 21:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618548776; cv=none;
        d=google.com; s=arc-20160816;
        b=1BDqlhe9wtTgbAnrncRPgKlMrwOsF87OfgppiOxI2xEOIajoZNq8m3KVGn47u/gtwV
         XqqgaYp3UqodHqHh7C5vqaiEYNauLvt85QaL9CXe4S7ReYCUDzbpLOV53WvHNJymT7ps
         7rzumZqKIli6GtE2Kvma4JdSaNhn200WH6bsOOEZdQckIfmOs8Z7sGgXrkOMke/W81TO
         sLxMm4sMlufGwDyaQpIlCw+bIaJVZmpqLD5P+Z10k76nLP7y1IJdG2lgojd4XXIoYuVK
         xQoTK2SbJVkr1u8Gfs67/V4i3+MwjGsm0+S5OyYXHWuURwU4bi6mTWuhskv93B0NjsqO
         w+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ILN0EwWFzymjSvc7bTzP9KARikQAvDGvu8xCyZYr+EY=;
        b=droEvrdgHd0KEts1uaZJ9IC4JoxkvzDAboQVHum+H/Ppt1CjU1+NPVSX+yvKoD62nX
         KWDBwp1Sqcsn2o2NLwI+Du6Bvq3iXZRX/NX8IwkkvppB8ak0FFkWIddrY8/4T8Tti0Mj
         chN2w7L2Rcibw3F3YdQMf1RkKVvvu6X/JtqD99Lj5th5iJnEqnXVsqiYHxboYBd2m/N1
         1qxeYocgibHPLZlbLedrg8MxJ2ZALh6+o4QGNOZXuf0BSm4R++ppkGPpLyimpZg8lI/p
         W55Gb82BwAnmZww/QjqGn7zGCs8UkhfzB2YQV9K20XhLLcfqwDCKjhzcpoP9ZGJq9rwo
         /ddA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=T6AMjwzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si3753095qtb.107.2021.04.15.21.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 21:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=T6AMjwzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXGTQ-000767-6K
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 00:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXGTH-00075j-Hk; Fri, 16 Apr 2021 00:52:47 -0400
Received: from ozlabs.org ([203.11.71.1]:51453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lXGTF-0003sf-H7; Fri, 16 Apr 2021 00:52:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FM3jg0K8Dz9sVb; Fri, 16 Apr 2021 14:52:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618548759;
 bh=M5DRCjE7+W1oq12uc54aAKXTf/vzdlt/VNay/318hMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T6AMjwzWtZw+i2G+1ebnCNUb10qPSDcZcBRS/jelrDBK7NqAIhvw3Hrix1VB01NlD
 w5dRGTgCqWXOunw0GNe/pLYM8vsgDXesdqx+8F4G3Wdcgfvs9uHEs64Q8XRGQLfqY/
 KlJJ0f/vlTDiaaBPGSLloyS3waXgiyRrT+fL1thk=
Date: Fri, 16 Apr 2021 14:33:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 09/12] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
Message-ID: <YHkTiCE5RNBvue2/@yekko.fritz.box>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M/U5VjhaaYHsyIdB"
Content-Disposition: inline
In-Reply-To: <20210415163304.4120052-10-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/pFi9LN0kWH


--M/U5VjhaaYHsyIdB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 06:33:01PM +0200, Philippe Mathieu-Daud=E9 wrote:
> We might have a s390x/ppc64 QEMU binary built without the KVM
> accelerator (configured with --disable-kvm).
> Checking for /dev/kvm accessibility isn't enough, also check for the
> accelerator in the binary.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>  tests/qtest/migration-test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb4929..c32a2aa30a2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1408,7 +1408,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "ppc64") &&
>          (access("/sys/module/kvm_hv", F_OK) ||
> -         access("/dev/kvm", R_OK | W_OK))) {
> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>          g_test_message("Skipping test: kvm_hv not available");
>          return g_test_run();
>      }
> @@ -1419,7 +1419,7 @@ int main(int argc, char **argv)
>       */
>      if (g_str_equal(qtest_get_arch(), "s390x")) {
>  #if defined(HOST_S390X)
> -        if (access("/dev/kvm", R_OK | W_OK)) {
> +        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
>              g_test_message("Skipping test: kvm not available");
>              return g_test_run();
>          }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M/U5VjhaaYHsyIdB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB5E4gACgkQbDjKyiDZ
s5Kdqg//dPzb8NSIKOPBAchx4fQfNNlRvAN0QOVihtWc5shsO3LZL0cuWL9ut0eJ
RQm2dzJhT6kOfy+y+9o+5hA56wvI6X2uxY8HULQJqrN9nQJmSxXMhWv5N/UwM43U
4wfEzR2da9SMo8ZpjrO8PcIPGsekU5B7myBV7enxYyIdwMMkOVX41MW3xIh3r5KF
YHsqJgWxlTL2B1fwdm+sINce3qZFlJBgDNHyptdduovZ9JDrD7XysNZmBRjD26QK
I5Q1VW6BARlls3t35WFkmqgJ3Z6ACMFnqKwAbO09VYIuh8jw3qgUBsXWIanQoZGp
VTptfbQZJSrUs7mJ4RFxnDmHUr4QVP2JzE1Hee8xgpQJxyucDpLiW93QSehdgNQG
+HDxkLctqvF2NrRjqc+oDRbLh26QX2F3XmlZvOhxHhNanLnaahPnYxIp4pPLJcWR
qJ83jf6UswNywT83ttwLx6nZSFRB6+WWVxTFfV3o3S0lXtFMP/dX7TCKTuhhsUJ6
KRlS6zKk6zlfPX92uINMlHocpTZ3f/JL//i+nuomZwat4S0780ZUH0frCpzCLfAY
nhSVafRDZCAKvn+7tWIa7NKCVE8gEcf7epOHxh/t1nAWDNLi7AOz6v2VaWwgL/f3
llQiQp5oh6U1pxuVhQGCUfoSHzqJ38thy7zx4dvmq4OsUXsrcuI=
=NVHN
-----END PGP SIGNATURE-----

--M/U5VjhaaYHsyIdB--
