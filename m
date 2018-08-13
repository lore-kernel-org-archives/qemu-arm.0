Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3244532wru;
        Mon, 13 Aug 2018 12:08:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx3dlnfcEqApoHajv2mhz0oew0OebUuu7fk+a4nGfK2R3TAARXW452ZHmmCSA06/yNn2MQ5
X-Received: by 2002:ac8:2dc6:: with SMTP id q6-v6mr18656297qta.178.1534187312883;
        Mon, 13 Aug 2018 12:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534187312; cv=none;
        d=google.com; s=arc-20160816;
        b=YBSRKh9XnYReiikgDjMBQaRPet5t7Ijbq59RPrYKBLSLLVt9sRJ9CN9ILINl3vrFjA
         pSE7Szz8dTQ0XPjV+80Wj6cYGmC57Sirunwzt2wByDFWj9q5eAqufIEd6rxlkHlQbXuY
         pdg+b7mVC1I+sz8kABo+iMvuGfcwXnjZ0jnHDmLrZAwxBoUmVUuQR4MB3x0tiAapEyyr
         6lz68CmUUkyJgvah10XtfnKi2WCMbKVIAJFKq7JVjSkK4pWlBCPlqqq3EldJRHXHyjwj
         MzaOVJwRYxR3+sEn/tcBg1VJZmdoHNh+rooIiE/s+pTaYwTFtV7Kb4sqWpUyuUcOlfc9
         Bt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=N/bCJnfzGR5rRbi9IQQVojtHQp5ImE4L7UvLJvqsAiU=;
        b=Y4Nax/iFOc5rixNDa/VVpnJTUqiTl31874Uq9zv0e3YhjLrCC3APqsAMYI2+ZT/oXS
         YBnlz9TobAdUtKaI+RE8S0ZeASFRTAllAa3BZV8cC6q/PRirImV1+Vru9rojRpkN54P3
         Flg6sbMcRaPEv3NLyRfgbJXIZbVFOh3oIXmYvYHMaJ8UKhXj2XEhTqTeOgI245iMdGTF
         UDOKa/qD1bzS1La/kSmHU17iPLTgjDOxxmtY440HwnHc7IUoirJFOF6W7ofvZa91lKtP
         bfyQBuC6rrMcoXzRBWDfc9vHmcDs/j/ZW4aYFWJUnTAsuSP09Esj0gGZQ6OTwCXK5F+2
         JcSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7-v6si7040086qtb.267.2018.08.13.12.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 12:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpICe-0006Hu-BM
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 15:08:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHuc-0003Wb-8q
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:49:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHuX-0004cz-Cm
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:49:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47316 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpHuX-0004bd-7U; Mon, 13 Aug 2018 14:49:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8994E87A78;
	Mon, 13 Aug 2018 18:49:48 +0000 (UTC)
Received: from localhost (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 252FA10031FA;
	Mon, 13 Aug 2018 18:49:47 +0000 (UTC)
Date: Mon, 13 Aug 2018 19:49:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180813184947.GB18429@stefanha-x1.localdomain>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-7-stefanha@redhat.com>
	<25a63ca5-20ad-f8d9-0117-b46c31c0c6c5@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline
In-Reply-To: <25a63ca5-20ad-f8d9-0117-b46c31c0c6c5@amsat.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 13 Aug 2018 18:49:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 13 Aug 2018 18:49:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 6/6] Add QTest testcase for the Intel
 Hexadecimal
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGhCQtctENq5


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2018 at 01:26:08AM -0300, Philippe Mathieu-Daud=E9 wrote:
> On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> Can you add a comment providing the .S asm source and how to
> build/generate this blob? (I think this is required to respect the GPLv2
> license in your header).

I have resolved this by using a memory test pattern instead of an actual
program.  The test case uses -qtest anyway, so no guest code is
executed.

Stefan

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbcdLLAAoJEJykq7OBq3PIu2UIAMWYI0EksP3QVfI1zRiz1t3k
cIBhI6vrbXvivDfzp5Yi0X5qHP/qMZsWcTkPqzm8+Oba2kVs60JsgbG11Le7TpBD
vjxjsOIPDPmK4gj8UfUsLyGItIAez/ZTAc1eti9LtaLaNuh12q2+2w9SurIxkyC6
/gVYFT2RZPc5jsLjgBPvrmzLhX7zrALvEYYXBIBVLgpP57Z0jesROT7dLT8yOcGo
U+Z9hLmfy7LCD1xtLSBb9ROfmWl15N6cTBJfV75E5PUo2B4fk2rmqEZ6IAMSe5RN
idZeZjX1ASFoYCh6tTBez8wM0qBCmtyC4YKRj47nPy2nFHdV4h5dJVw7qehn4qs=
=Q+bo
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
