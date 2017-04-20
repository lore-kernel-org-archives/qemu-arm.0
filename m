Received: by 10.25.0.144 with SMTP id 138csp755689lfa;
        Thu, 20 Apr 2017 07:18:15 -0700 (PDT)
X-Received: by 10.55.150.133 with SMTP id y127mr7840828qkd.230.1492697895826;
        Thu, 20 Apr 2017 07:18:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d56si6008439qta.117.2017.04.20.07.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 07:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1CuV-0007U9-40
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 10:18:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1CuL-0007R7-GE
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1CuK-0007ZG-Kc
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:18:05 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:35669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1CuK-0007Yj-E6
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 10:18:04 -0400
Received: by mail-wm0-x233.google.com with SMTP id w64so105259992wma.0
	for <qemu-arm@nongnu.org>; Thu, 20 Apr 2017 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TZZEzvB1wueQJbUNEKfrO3quKPEG0rZWtRE0OFZP4OY=;
	b=YxvEcxdH+07gf2OMEWC1fWoNj9w5b08pSDqJXyerOCIRF8H1pdd2ztJxcS07G7mYhj
	H4Wj3og2xENkizI/5JaHQMRk10nlXbumphn/DPQ7rKdVa2gFvP5ZnHRYn0V8RhgC9rlI
	5dG5tiBy7XR3PWSNvgd6kTG9Pul+pu6DVccck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TZZEzvB1wueQJbUNEKfrO3quKPEG0rZWtRE0OFZP4OY=;
	b=fu8Tx5+roBRTNl1YW870dr7J3wBcguxYo3YYX5HAwsiUwpwegbuxDJCAUlKs1g/F9F
	yV4TNSI7oCwXgNjUBM0uMWubsB5WXbIB+TvCZG1PqUcaEMB324mG4aZdk/1m0vZM2Dtg
	qPQqfg4H2xCXi3rGljMKv6G0v4dVX/aINm7YlBa3R/18Pzi1R9IfW6vKB594itUlBcKq
	I5qJZc8X7tOygXNI+VATW7RTx2eFL+hUKkPu3TxWghTwf9YXb+4cGW5sZnn6X3JfwJ/K
	rrm+oZDVyBzwyTMsPudbC4b9RVuWGliqsYUipDLNna6o1tWaQCcfqQVAWjB1jvzeaZ2L
	ovNg==
X-Gm-Message-State: AN3rC/4aVsrHI56Ac9oIXDOcOMIdT4Xfxul6oOG7KHlNSVyOLFE4JYv2
	cVzZ8dgrxK2JAeQFoaCrWrQYslh4ikCm
X-Received: by 10.28.57.138 with SMTP id g132mr3351508wma.92.1492697883331;
	Thu, 20 Apr 2017 07:18:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Thu, 20 Apr 2017 07:17:42 -0700 (PDT)
In-Reply-To: <CAAdtpL43f=RFUJJ+pOXLUaGpx=Vg=Wy3gML9=EWpCGBAu80nww@mail.gmail.com>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-4-git-send-email-peter.maydell@linaro.org>
	<CAAdtpL43f=RFUJJ+pOXLUaGpx=Vg=Wy3gML9=EWpCGBAu80nww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2017 15:17:42 +0100
Message-ID: <CAFEAcA8BUqU_Z1OKfhbx0ViYXfGwhx1POdeYGGAc9AQmjUBi8w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 03/11] armv7m: QOMify the armv7m container
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
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hx6LWCag9T/e

On 17 April 2017 at 04:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> On Mon, Feb 20, 2017 at 12:35 PM, Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
>> +static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] =3D {
>> +    0x20000000, 0x40000000
>> +};
>
>
> What do you think about adding a
>
> #define ARMV7M_BITBAND_[REGION/IOMEM]_SIZE (1ULL << 25) or 0x2000000
>
> and use it at least with memory_region_init_io() and eventually to get th=
e
> output base addr?

I don't think the size of the bitbanding region and the output base
address are inherently related: it's just a coincidence that the
output-region base address is at input-region-base + output-region-size.

I don't particularly object to a constant for the region size,
but I don't currently have any plans to come back to this particular
bit of code for a while (this patch is already in master).

thanks
-- PMM
