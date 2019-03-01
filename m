Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp593552wrx;
        Fri, 1 Mar 2019 04:58:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqzN9VNJ1vErmnq4HfJybmrS+XLX9TV5+NvWQRo8avnD3vZ8O5BrYfWuWwwP5PLMPoinIx2+
X-Received: by 2002:a81:110d:: with SMTP id 13mr3425907ywr.343.1551445092857;
        Fri, 01 Mar 2019 04:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551445092; cv=none;
        d=google.com; s=arc-20160816;
        b=iV3Cf8bYyHaQBtzRyaWRaUOgTbnQ+oaZ4SbOjSW1pF/SkzkxoR1JrdMSXcEf09yxlI
         BGM859e53RtakkQT1rmLwh3jy/hohGUiN9Xf1tOmKP4SBpbKBscJmJi7mfYP2HGL9Zlb
         KcJJJujlA04f/WkEJ65mDuZz5o6kdCBDt7bUmdbZA8025GVEJcdq7fW+eyBT7+qSjR4S
         +RxUWplqVnCzQHhxzS3bRh/WncKGYkx7bY3MLjhYHAacZq9RLlWi44ufOBpW5vFC79SY
         Is+R6JvwERwGLslxyeJouNkmp5O0EcB7RdsxK3NpEzsJUTZRcF+y9WfyoYlA5ltxub8z
         cxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=X7sMuTM9JaZ/jMUA7p/SR8TyoTnahH7jxphdQVb5q0o=;
        b=bk6cyxDTZARVaUCbic/IhlpbNwGgEWMA6Beue9bo3odw2dXcwfAuDZUjoktu00IVYk
         GQfjWD6JCzri/dxFYWT05pMeNh5CKmNsJqlZ1agJQ/E7SwOmIDirR6FG9hUWbQfqvAMn
         xqHwgyLjSttE4b/DJz1uT3hGaO89P7Suj01AGYvgHJnDjNYltGBS+L0zjunGsORFoSFK
         2va7v31RmXZQWGTph7c2fcWRyZQ+7+EKPhcvdnHjU/SAYTq9wiz1jo6dEZS84CGDdqJu
         DoSUUU2AirYPiI+qVKFUWYDeLPX4PTqJN8L886d/lE9NjbeMPXiAYMXLYhcYSi3t0Psu
         /XuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KOt4ihca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i207si12119594ywa.448.2019.03.01.04.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 04:58:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KOt4ihca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzhjw-000411-DR
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 07:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gzhjm-0003zG-E2
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 07:58:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gzhjl-0006ZK-H6
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 07:58:02 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:38004)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gzhjl-0006YQ-BS
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 07:58:01 -0500
Received: by mail-oi1-x22b.google.com with SMTP id q81so19389073oic.5
	for <qemu-arm@nongnu.org>; Fri, 01 Mar 2019 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=X7sMuTM9JaZ/jMUA7p/SR8TyoTnahH7jxphdQVb5q0o=;
	b=KOt4ihcauzyv3MIi7xfV/ixhq2vobfHHrnw1d8IY86nPczy4xdNxwEr6mRcqI+6rui
	Y90Hkd7/2lTPtbTWsdGWZ9zpfsjU1TjnL2FHAHym5s28EVdefzWVP//+IP28UQc0MRsN
	g51EuooFKbz/rXErgyCu6+3QH5sdfwMc3FbaCkR91ox59fTBE9ciz0b/Xl7jh06q5tEb
	fx1gzZUCHqo+9cy8jOtfhxpENwEUJP6QrxFMtWHk5U8ThK7NC8fGTcYB16YrcZsEUhD2
	ldL9KbePQyB8hbsgVr9WXIxicp749GyP3d5IPlIUkSb64JJs9l0w/fkKqDH03cuFf2TO
	2Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=X7sMuTM9JaZ/jMUA7p/SR8TyoTnahH7jxphdQVb5q0o=;
	b=nHiEreDioXNmpUVIjEQlyah+k0+xZz3vxnbT/yYj5+X9N4ZPpUjvvvlaQuFGAEoF7a
	l3Uf2GlwD2ge8UeVB4LDqxrXWXhvXyZqbGreSTnc1rc2s3WkfXVe5rh7SIYCsuHyDoKk
	3AkkwUwQVPYFEUajUXGus/WciKg33OAfjUm/MD2Dvoj1pxSgppj/wKlRRa1yRiDW+YZ2
	n7SEEIDyJrt4JN/40GJ+HJ8GSEuG6sDPdPafXUiCUoymjtaNaryvFjUTiRXSvZOzmucj
	NGoIAgt0VjCMwP1mbJZTswC+MEMvwJOhT+bHP5cirQVOFZiBSB4k632CXlN83dnAgKGb
	8cYw==
X-Gm-Message-State: APjAAAUa76RQF1705VEeuU/O4sw82kHYXZ226j8RNrQc/Z0jUPy+j57s
	I3f4UZAajRUDskdD0kWO8qUaxWpLV0AgPF5LlDK5gQ==
X-Received: by 2002:aca:ab11:: with SMTP id u17mr3250020oie.98.1551445079807; 
	Fri, 01 Mar 2019 04:57:59 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR02MB3587ECB5D599D4DA99C1B021D87B0@AM0PR02MB3587.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB3587ECB5D599D4DA99C1B021D87B0@AM0PR02MB3587.eurprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Mar 2019 12:57:48 +0000
Message-ID: <CAFEAcA8wmzzFXyXbF2E7=NdD-8CNmxijEC1HvB-idA2J9gOPJw@mail.gmail.com>
To: "REY, Julien" <julien.a.rey@capgemini.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Subject: Re: [Qemu-arm] Qemu ARM M4 emulation
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HtcoMBGx96hy

On Tue, 26 Feb 2019 at 15:06, REY, Julien <julien.a.rey@capgemini.com> wrot=
e:
> Our customer want to virtualize their physical test bench. Their test ben=
ch is composed by a controller device who contained embedded C code execute=
d by a Cortex ARM M4 kernel and their physical system with sensors and actu=
ators. The virtualization of the physical system is not a problem for us.
>
>
>
> The main problem is the controller emulation. The solution we have is to =
emulate the ARM M4 Kernel for execute the embedded code developed and then =
to connect to the virtual system.
>
>
>
> We tought of Qemu to do that. We have experimented the emulation of a
> basic OS iso but for a Kernel whitout OS we don=E2=80=99t know where to s=
tart.

> Run an emulation of ARM M4 kernel
> Compile and execute code
> Taking into account Imputs/Outputs and the card controller architecture.
>
>
>
> Do you think that Qemu can be a solution to our problem ?

It would be possible, certainly, but you would probably need
to write a fair amount of QEMU code to do it.

You would need to write code which implemented device models for:
 * whatever SoC your controller device is
 * any devices on that SoC that your guest code cares about
 * your actual set of sensors and actuators

QEMU can handle the actual Cortex-M4 CPU parts[*]. If your
controller device happens to be using an STM32F205 SoC or
an NRF51 SoC or something based on the Arm SSE-200 or
IoTKit blocks, then we already have some of the device
models you need. If it's using a different SoC then you
would need to implement all that code yourself.

As a rough rule of thumb, you should assume that writing a
device model for a piece of hardware is about as much effort
as writing an OS device driver for it. Add a bit if you're
not familiar with QEMU internals.

[*] One exception to the CPU support is that we do not currently
model floating point for M-profile CPUs, so if your guest code
uses the FPU then QEMU will not yet work for you. I'm currently
partway through working on FP support, but it won't be ready
until maybe mid-year.)

thanks
-- PMM
