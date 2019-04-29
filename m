Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3721436wrh;
        Mon, 29 Apr 2019 09:51:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzG0O+t+YIhE2sRHG/+9OufhKjgTHvqRsL03eBaWUPXL92flQGxqMY3jwbFwLzf8aDS72uL
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr2083wmi.77.1556556697954;
        Mon, 29 Apr 2019 09:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556556697; cv=none;
        d=google.com; s=arc-20160816;
        b=vqt+mSC+GeO2G08Vng59TbCuuhRb39gcOKdabsHIYzZ56xhCW4o1ENxDuB2auP8w7+
         a7fYKKd5GFWassMdz9+AkltQEjAWVA8fplw1n+3o6HOj/kpvrDYKvFzMgXUjVtmvASRD
         GkiDCNYsOFq6f7kCgGh3nDbIfnNPxbAHHTh00rTlMZnW2DuJb02JbKWlNcvp3y5fQqGc
         ifknZX8/Vprw/RVjJrpzEuXFNff96cLQSP4oQf1rK/83CoU519s2MGuQFoSlI/Ms3MOs
         91ptoM3wh2naPARkDV6LX1FrTRq44DbhjCkrcNlQL8NlfBJ/3zOGlSoKdWcKWt18Wukt
         RXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=SKiMQmc+Kubdp9R00/VmSeRI0Okt7QtharzHi3LB5uQ=;
        b=ADHtt6LsxrsuWW5pD8u5YTkYZJdP2BxALQg+411aBuHNyJPSIKbydj+4qpgKAhuQHC
         GtXJ6uY6lLiafaAb867lY72DHCbMxLeLJk7MV36b5B0BnnrzUNt/Bj4Y9iXCXg1vk6/j
         Kpz+jYjwFIZUoWrr7B8Ua0JyJJGxz7AgUlkulrD2tBbT50/tEcu5bWrpR4OcESFxysXy
         KecuHnREV0L5vsV2S0nojvh1nt9QK17gv68uSWcLd6CtExsddC2lcblECKNPREDI9v+Z
         PVpi+oL88RqkJFWam+uEC69AzFk4gavdapP0HVRvO+sqBnmkGSO7Q6T73Nwr1QDICm80
         6HaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h7+rJZ63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si18731wme.174.2019.04.29.09.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 09:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h7+rJZ63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL9VB-0000gG-2Y
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 12:51:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL9Uw-0000eG-0Y
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 12:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL9Uv-00017n-49
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 12:51:21 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL9Uu-00017P-TI
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 12:51:21 -0400
Received: by mail-ot1-x333.google.com with SMTP id a10so439323otl.12
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 09:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SKiMQmc+Kubdp9R00/VmSeRI0Okt7QtharzHi3LB5uQ=;
	b=h7+rJZ63NFIogzbHMrXeGG6/TK5g4dsHkjAZ9iRrigGsssTUYc4lBvYDXszx6UYR/3
	EMWdhtN8TC8jDymDgBTN4sZBUzcAJabD370Q1z1ANDRrNIvwDqo5qFXROopHPVDBYrQW
	6ItYvDTrprZd1GKiV86tXeDA0tF8p/eyZfHjjAa8Puxodror28G22SIE8TfOH17jClCk
	EZjaKrHjycaID8m1lkw+jFS0IZxjjQ1zsKSi0bCI1uBdWDSpX2nUSooA4MPE8hFwv/1u
	6BGDHM3GZi8LL/so/4uq/CLdKuEANipLUmcmpuyPSXNBbGgb7kq3IL11wQjezzGzpcNL
	FF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SKiMQmc+Kubdp9R00/VmSeRI0Okt7QtharzHi3LB5uQ=;
	b=AjoetAgFx3t6rK+E5GqxwmFutkGudl7wpj7Nn0r1Ooka/Bhy+JshAW7G4xcFMgi0ki
	+927bUEOXWtClLSZIVkev2P8/36VA88loaGSSEXbfqSxgtoyere6nIcOrjD2Eam9TR89
	bLCvc8xCOcx2vgkKS19wYDPSac/Y6dWY+KqQ0qIQnxFAwnqKg+0Oa8DKH7fmaQ9DjOWX
	QX+MAn3xpq3phYn3F1rnaN4ZBelIX442taLGxTuwm0acuYzmUwg/ITJIcx1bp3ubIQXn
	VG9cjj4XKBRxoqk1Oom7bAsivBXAHUE7b/iqs67shrZ78seUodVHwjYWZWHNn+N+ewDj
	QfHw==
X-Gm-Message-State: APjAAAUkkmL2JsJWOYfalmcp5ejCjs8gM4+y/j0/340nAkrtWfZJyd+s
	CyFR4S/pUrH7QIrWHrynNHBUH9sY/fpL4IMc4UNIXg==
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr1874471otk.316.1556556679948; 
	Mon, 29 Apr 2019 09:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190412165416.7977-1-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 17:51:08 +0100
Message-ID: <CAFEAcA90Pv=zEqaonGV=c022T=CYMo11nkqNwBnGgocESnBNmA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-arm] [PATCH v3 00/12] hw: Remove "hw/devices.h"
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
Cc: Thomas Huth <thuth@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SHPbkk78MbjM

On Fri, 12 Apr 2019 at 17:55, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi,
>
> As his first comment describes itself, the "hw/devices.h" contains
> declarations for "Devices that have nowhere better to go."
> This series remove it, creating new headers for devices covered there.
> MAINTAINERS is updated.
> I also included 2 cleanups while working on this, in "qemu/typedefs.h"
> and "hw/net/ne2000-isa.h" header guard.
>
> v3:
> - rebased
> - added 2 patches suggested by Markus
> - addressed Markus review comments
> - added Markus's R-b

Since these are almost all arm devices I'll take this via the
target-arm tree (I'm going to make a pullreq later today).

thanks
-- PMM
