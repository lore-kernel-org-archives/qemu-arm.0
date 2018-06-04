Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp381133wrq;
        Mon, 4 Jun 2018 02:20:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIJKB+mKBPtzai6FhBLhpanXsYrMFYt5qD/P2enWDn3OwxxrYk92wLgXsSwCUw1gsoL0R21
X-Received: by 2002:ac8:3617:: with SMTP id m23-v6mr19496208qtb.219.1528104032073;
        Mon, 04 Jun 2018 02:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528104032; cv=none;
        d=google.com; s=arc-20160816;
        b=g0y3J9PwFYNq5WS1JyjY+qzC4wGKbCA+HMKs48MWoLdvk6RbNkqIdbkFMc920IsdbJ
         keRFvYGUn6X48paNONWRS5BE85o4SagF8FIRehwYqXlBmAYpY8Nl4WzaOZyOhKo6TRg5
         c51sNRaRE7LqFP9BSS28j8V726f3rZai0p+XIhZ+ex2HVeK+NONL9iYRRE/FQI1fDUf6
         KEcW2RdJS7cpbEPJs5ry5MVnnILJx7fwDvINvsgFA3pQb8VBAu+hJnfu4n7HKNW7qE8L
         QnWhx9euAQRPT8v89VQbIyVwPbLqtRD+4wUo5EpRQixihRa7Ni2WzlYwnbhYBPabj1gB
         cwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=7XT9b5LAeI5whzK7RMCfDkLngyJNEEhwh+qzpRKtEIY=;
        b=tqBQiafXLcqCLFXMm4jSdnLWPFPWaSeyEcpCbTKjzm8HedDVwH5y1N6Q+7Y4UDMjjj
         E2aRSCXo06dt06rs2zgGQlF5IsB2nBwAUWp2uZsMiHC2BdF4rE9Seml2SW7cboHni73V
         jKga7YSe774dw9h3yGj+/sUapVXOdUuIdeY5KtKp58+ZJnuOeJEdZGGT8z6iaiHbodmG
         2dWWbABJJldPy6WPXj2L9pTSdmNCLGBOhkLGQxLr5Ef4JA8q/IBm3rlqmc0dJylld5NQ
         G9EDVueebhICzNpqU6A7qWAZ7lzALhsfAPwQPdyhujB5pN460xrZwbazKe2NLY7GLXfg
         vj1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kRhchqES;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si3748770qve.56.2018.06.04.02.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 02:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kRhchqES;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPlfD-0002ZZ-Ie
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 05:20:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fPlez-0002XH-BA
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 05:20:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fPleu-0000Ns-7t
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 05:20:17 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:46691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fPlet-0000Ly-Tn; Mon, 04 Jun 2018 05:20:12 -0400
Received: by mail-wr0-x230.google.com with SMTP id v13-v6so30736899wrp.13;
	Mon, 04 Jun 2018 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7XT9b5LAeI5whzK7RMCfDkLngyJNEEhwh+qzpRKtEIY=;
	b=kRhchqES7zQ24mwWin8lFfrT5ikuRhY0oAaGD7dCw4eGHiB97T5+POdl71EV4fkcr6
	QEtxW0LK2Ze5YAoUUvadn/+QhhKWBJQn0Le2shWOIFrd7beDEioAbwq3H0TIH4K/YH/P
	hnfEbDMrKOfqdnLTJGcn3HdWuqN9qjUHiH6Xr4uEqqZ0lSbHfXbZM7vHFCYydbKUmjKG
	6DI74OWWhb3d7Pudbaxk8g4CMq33WbT67RJdScMDNGIqGM83uEaj8/kb0y8Icv+aFHHj
	ido+bjDCik8szj+6Pqy7ltNH2/kk/ftCt9Hw01MWVtUf8fIi4/TuFtxyL+FXiVoazf/K
	s3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7XT9b5LAeI5whzK7RMCfDkLngyJNEEhwh+qzpRKtEIY=;
	b=Ihfd3qO+yk56raftRqbj2setpjYINMHvJLSEJaB+qwPSZAWdJVsZRnAr5eZWVX15G/
	JAwGBDasGQDqiMSGvEFcJ/5Wbxjj1oHF/SA9Ea6B3Uo+v/lXASPwtpzU0uL9qu4WrAXk
	m2NV0oeBawmDKuPlbINIg5i3VZBsco+RNjfeeqpopHp5z9Aj24+EKNzlTQ3UfvLhXikM
	XINgxxwfNpgXRDQHcIAUktgkRRtdn9tlogleiy9KNaLj3NtoYEjmHMqagXfMv0jKXFFs
	NDGjzkqY8Frcvb3Iqv/TiLQq0+wxDXob3Xtyh9bgZFUrhL70ZdOSnkOwnxRAaHyQ6Z5p
	hYww==
X-Gm-Message-State: ALKqPwf+nipQPKwaaR8e15QvJPYFbtqFyaxAY32BXGUMeBrIZ0k8KdbA
	AvSlpxC9J4ATuARr6ZtUXh8=
X-Received: by 2002:adf:b0da:: with SMTP id
	j26-v6mr14471081wra.3.1528104010747; 
	Mon, 04 Jun 2018 02:20:10 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	d90-v6sm11440939wmi.26.2018.06.04.02.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Jun 2018 02:20:09 -0700 (PDT)
Date: Mon, 4 Jun 2018 10:20:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>
Message-ID: <20180604092008.GA13674@stefanha-x1.localdomain>
References: <20180603203412.11033-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <20180603203412.11033-1-contrib@steffen-goertz.de>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-devel] [RFC v3] qapi: command category to stimulate
 high-level machine devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hap8HpanGojq


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 03, 2018 at 04:34:12PM -0400, Steffen G=F6rtz wrote:
> Changes in v2:
>   - Remove stray 1
>=20
> Changes in v1:
>   - Fix coding style issues
>=20
> Add a new category "stimulate" to host commands that
> act upon high-level devices associated with machines/boards.
>=20
> This is patch is part of an effort to add support for BBC:microbit
> educational computer to QEMU.
>=20
> The microbit board, as many other microcontroller boards,
> contains typical trivial (digital) input and output options such as butto=
ns and LEDs,
> but also more sophiscated possibilities such as analog inputs and
> complex dedicated sensor ICs that are connected to the microbit machine
> by means of inter-ic bus (i2c).
> These devices interact with peripheral devices of the microcontroller
> in use, for example with the GPIO peripheral of the used NRF51.
>=20
> One aim of our efforts is to create a user interface that models the
> look and feel of the physical microbit board and lets the user interact
> with its inputs and provide feedback on its outsputs.
>=20
> For this it is necessary to transmit user inputs such as the pressing of a
> button to the machine.
> In return, when the state of an output is changed on the machine, this
> change needs to be reflected in the user interface.
>=20
> At the moment, there are only a few QMP commands that provide user input =
to the
> machine, eg. send-keys, input-button. These commands require very

QMP command names (from qapi/ui.json): send-key and input-send-event.

> high-level concepts, which are not really suitable for applications that
> microcontrollers are typically used in in.

I agree that existing commands aren't suitable.  They are tied to
QemuConsole, which makes sense for graphics + keyboard/mouse input
devices but doesn't exist for microcontrollers.

I have CCed Gerd Hoffmann, the ui/ maintainer, to see if he agrees.

> This RFC is meant to start a discussion on how to provide stimuli to
> low-complex inputs and outputs typically found in embedded
> microcontroller applications. To the best of my knowledge, there are
> currently no examples of how to provide such stimuli to either SoC
> device peripheral or machine level concepts like pushbuttons and LEDs.
>=20
> To my understanding, the following concepts/apis are needed:
> - QMP commands to send stimuli to machine level concepts like
> pushbuttons
> - Machine level devices that receive these stimuli and act as an adapter
> to manipulate the associated SoC peripheral devices

The QEMU Object Model offers "interfaces".  Many object-oriented
programming languages have similar concepts (interfaces, virtual base
classes, etc).

Interfaces could be used to connect board-specific devices with the
monitor command.  But this is an implementation detail, we first need to
agree on the API design.

> - For outputs, machine level devices are needed that observe changes in
> SoC peripherals and emit QMP events that clients can receive
>=20
> This patch adds a new qmp command "buttons-set-state" to update the
> push-down state of arbitrarily identified buttons (string identifier).

Can you list the types of devices that can consume events?

 * Pushbutton
 * GPIO input pin
 * Analog-to-digital converter
 * Temperature sensor
 * Accelerometer
 * Magnetometer
 * LED voltage decay light sensing
 * ?

And list the types of devices that can produce events?

 * LED states
 * GPIO output pin
 * Digital-to-analog converter
 * ?

Many of these inputs/outputs can be tied to an external UI.  A degree of
timing precision is required so that the UI is responsive, although
cycle-accurate timing is not what I'd expect from QMP.

Stefan

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbFQRIAAoJEJykq7OBq3PIA1kH/jUiBMZgVfnCZKv5lWUpSW5n
9hGfyd5HJLO0xurOpXQamnv1xNshckWAmj3U0TdZ/MUdDn6IbG2RsX4/MSd/EnpF
JB9W39eQpc/jNunCt1da0y9DTwngDlowuhmK5HjQ365Thr+YWqgpWMJJ9hjmaFaJ
ZTQLOIbDUSrwiLY+HWjvfA9jsmFbHQ+OXt08C7Mgz8fyu49SwJ/egF6Arl+eV/Gx
fipi7dC1GfqPo5evcm/WFKXhBHfzF5nA7DlE8Hs7Y0Z/qc1Mo3I3+DiblXVzjuFN
d/6uqYvnJqVmMANos3cn0xmmkkzW1jvt2Bg+fIvCYuikbL0P6OdxT/JYXI/pRU8=
=IhHS
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
