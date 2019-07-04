Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1843502wru;
        Thu, 4 Jul 2019 03:14:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZRqI9S8iFkESo1ijFryyQxlkzYyCnap8QFBU4k8Jhl0GmBeo1rMuPKU7Hh45pb03ELYOD
X-Received: by 2002:a50:a56d:: with SMTP id z42mr48549193edb.241.1562235260114;
        Thu, 04 Jul 2019 03:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562235260; cv=none;
        d=google.com; s=arc-20160816;
        b=0f6YkH0fVLdIJWzo035UQQ0unA1torb99t++Kg5OsuD07D5kAOPoUPYcevI1B1tvcq
         edhE7W/28F5x52dWq1c8ku8ike31CZ/u8ItR9F4pxAzSlwaQjT+97H+LU5xZlcsKcX7t
         wu07ANslByQWs4fWqL8MTVs+kYSEsRcr7bZkuL/n/dE3tJcZqsOhKKVhSrk2WbbV0A7G
         baCfE/OSrnKAmJ2ws9g2NNc9NBn5pTZg9I3DUkx2kln5YJqKZXL2pVrVcWik0J404PiY
         qT8u4FbbEGRB4fILfF0/VJq4ynTOdFnn2sH7YUaL9Z90+XiqC35lSlJVbtUIsdrZG18E
         dOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=5Bq58N9oeS663XfHbn8UBSitWIOJL7IJFbjEobeIgCw=;
        b=tAh6MY00herz+QN3yHuFHYWm8tdIjySPKKCk1hwAHvPRKgSMaWfPYLhBrg17iDEEf6
         4910QVs87N6+NZ/Y0UbYbJpp0RK1Tvx+uCdRfam/QqHmCsgG9iCUeyu3wZlvnxrh2aKA
         JnnqSBfopdoWqBzgouKWNti5Gn3LBVtpJDTG/AmxSGt6zNL4q5PhBbKSY1zglO5qN6Cv
         +dAqxqeNaba3Ni7ZZQRh37w8knZklINcrh3xmceiBhJe4JKZ2jtJDTVQ+6hBkWMvCIQs
         zkRQglEKzbBZNJcyMMnBxK/F9LB02Z10krolYbN0YTVJW15+3mI/Z3wgE9w47VLSm3H0
         SeQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e57si4337934edd.263.2019.07.04.03.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 03:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiykt-0000xb-8c
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 06:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hiykn-0000xG-LA
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hiykm-0008Hj-Mq
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:14:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1hiykm-000886-Fl; Thu, 04 Jul 2019 06:14:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 744B730821FF;
 Thu,  4 Jul 2019 10:13:55 +0000 (UTC)
Received: from localhost (ovpn-117-206.ams2.redhat.com [10.36.117.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1E886BB0;
 Thu,  4 Jul 2019 10:13:46 +0000 (UTC)
Date: Thu, 4 Jul 2019 11:13:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190704101345.GC1609@stefanha-x1.localdomain>
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline
In-Reply-To: <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 04 Jul 2019 10:13:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1] aspeed/timer: Provide
 back-pressure information for short periods
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7B/I49EZwvfM


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daud=E9 wrote:
> CC'ing Stefan & Paolo for a non-ARM view on this...

I'm not familiar with the various clock smoothing techniques implemented
in QEMU and KVM, but this looks okay given that Linux guests expect
this.

Stefan

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0d0VkACgkQnKSrs4Gr
c8jvKAf/Wr+UzmujJSPJXSN6CYrGku1rXIRyQeJxMV+bcQy5zBL9TstWE15OtL2e
s9L5/8zhIcDECNHEQZrKz6+Tfr5kmnMUbCBjVL8nQTxjty+YZusB6kDIH8u5RN4c
dCGS4YJu9vNw8HouuFIstWTzUIfGTV0Jc9PearfhilGLuQLBilus4PlEnzIeAZau
at4IRB8duBArX60lwjLIETwLMoiM3qyZ4PUQWdAAEMwJ0avQ2O3MBEZjRgbm4RD+
ktXp8Y09K4fBdZyXy9ClqGF4o3QI3lO+6Ziety/HXtYuA7neo7k8TsX/RzGIQAzv
xhNqKi2jtN2/SkdJNowvcU16wZUIcQ==
=FQf2
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
