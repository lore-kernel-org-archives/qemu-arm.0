Received: by 10.25.0.198 with SMTP id 189csp677541lfa;
        Sat, 6 May 2017 09:13:34 -0700 (PDT)
X-Received: by 10.200.55.6 with SMTP id o6mr18804110qtb.236.1494087214230;
        Sat, 06 May 2017 09:13:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a34si8209457qka.124.2017.05.06.09.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 09:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d72Kp-0002FF-Gp
	for alex.bennee@linaro.org; Sat, 06 May 2017 12:13:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d72K2-0001cU-Nl
	for qemu-arm@nongnu.org; Sat, 06 May 2017 12:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d72Jy-0004e0-Nc
	for qemu-arm@nongnu.org; Sat, 06 May 2017 12:12:42 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1d72Jy-0004cd-HQ; Sat, 06 May 2017 12:12:38 -0400
Received: by mail-wm0-f65.google.com with SMTP id u65so6775859wmu.3;
	Sat, 06 May 2017 09:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=zQQaP1vCSXJan1zrzpk/aSXuqiLHWt4w6KjUVTtKiyI=;
	b=jPbyCqgkMV4OR6W2ZuHCfpMo1LDCFbm36564lGWiaiJg8vAsiNKIH8szpEesmOFudr
	qCsZlNsycriQQSEadR9UjP40JgfeuZpBPz1Y5n7dFIJmpK+eTCHsTEa39PU/RTlonIRY
	txY5VDH5NEMOxCqVuS3kWiFMJ1nX73jLyo0A3hlTqLA2b8j/mPT0hrveBEQ6j8Z/yYau
	tBuy1Qc6Aq44/Uo1Arnw8SwACEBek7CvSBtPRyVn6KOrQXkckGyUqwqb59gAqOThT3/L
	d7dgmMK85TuHD40KcW+oHZlVSrqAwreug2iFs7c5U5XshAiZtqrt0VGZ4PsPXyktBX1B
	/iCQ==
X-Gm-Message-State: AN3rC/5wQvG73ZB75tSJ9A9XVO5ZAzODJm3wtMZQrKaT9qCgMXQznXWW
	C9LJTDAmZEKVrA==
X-Received: by 10.80.170.220 with SMTP id r28mr5772870edc.72.1494087156100;
	Sat, 06 May 2017 09:12:36 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	a56sm2765146eda.3.2017.05.06.09.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 06 May 2017 09:12:35 -0700 (PDT)
Date: Sat, 6 May 2017 18:12:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20170506161233.dtqh3tfueol7ln6q@kozik-lap>
References: <20170506152414.8704-1-krzk@kernel.org>
	<20170506152414.8704-2-krzk@kernel.org>
	<05f9ba66-784d-0dee-fd0b-48f0f8f15d1d@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <05f9ba66-784d-0dee-fd0b-48f0f8f15d1d@amsat.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Move RAM initialization
 next boards
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XkXtMVKqkwa2

On Sat, May 06, 2017 at 01:05:19PM -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Krzysztof,
>=20
> Please modify RAM -> DRAM in subject/description so there is no confusion
> about also moving the IRAM (which is SoC specific).
>=20
> With this:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Sure, thanks for review.

Best regards,
Krzysztof

