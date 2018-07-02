Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp101599wrq;
        Mon, 2 Jul 2018 10:12:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfJRAt2nLjGFi6O8xcGvL1p5RapgB6/I5qubnHS8L7hJCwdZ4K3HRl5BxASiD4q/Fqt1+MO
X-Received: by 2002:ae9:e817:: with SMTP id a23-v6mr12024308qkg.213.1530551569082;
        Mon, 02 Jul 2018 10:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530551569; cv=none;
        d=google.com; s=arc-20160816;
        b=CZ6sZbWUiMfEOl5ZU2QA0F+IEUR0pF2yjKTcwZ3AqJYTuyIsibPhzPmObr1P6hwIIP
         7V1OF/3Lxhyolz+pqdvPmMN+jjXPd++zSHcvbgKdQjz/OItoaKsn03KxVd8a0VBHVRsN
         1looNaMO8Bxd8q/oHRNybROj1k6qI0Y2IdVsEEYMOapHW3vhWn/InOOlbw0CX25tNEOB
         d/4vwQyfJbZD6usrySUQOc9ktVLdXTyHdvzVTaozX85FNVhI8JRDrqU8RH3Y+xnVq11m
         pZhxg8aDTLOYB50jTQaKBZt8zP77c3dTm3XxiLIwb/5H0LaYB5d3jJ7uJF7UBCVOOEhx
         Xe0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XowW/4qFeaNqfvrmyVSnbv0bZqJIAZkKhxrl0/GwIhI=;
        b=oBNBR9mFoXl6wPF6CqVGUFD2F3xf64UwjihGiqQp1NBBR5ppHTdJk7qT4ltYkLYbLh
         jKelzdnLtTMFGhFGeVqKmhLiXhK0DbRa/MLEX/7lwuWqWQuBwOLmLfYcw1Sv6ZESCnsV
         l8+rpheA4QE8sUUUsvQfGFq7Ca7yK+md9AwXdm/QqdMLfS5TcG1OPscE0PhWYym7k0Sv
         NwGZD9W9NnzSwzeg3IJZ1YAS6+YAYS4oohpc3aIQ/v2bcOmEcehyMEFd9zMAqrazlO1D
         TfHtIxjvC3iN4aOihORtse2QKO6D1xlOKRyOrtYrxrxw0uYF2t7dISTzDsdb04Os0Xvm
         lc3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KNDYfiNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33-v6si6729368qvo.161.2018.07.02.10.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KNDYfiNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2Nc-0001EC-FK
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:12:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa2Lq-0008E2-5a
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa2Lp-0004hs-Ek
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:10:58 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fa2Lp-0004hF-9b
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:10:57 -0400
Received: by mail-oi0-x244.google.com with SMTP id r16-v6so17234273oie.3
	for <qemu-arm@nongnu.org>; Mon, 02 Jul 2018 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XowW/4qFeaNqfvrmyVSnbv0bZqJIAZkKhxrl0/GwIhI=;
	b=KNDYfiNSpSzOR3ukcxcMoThEVxE0IQO8yQIE2UbwrUH07mscUzrWeoDlKSrrk8qqv3
	hMtFbHB3QqbFjYYRqgyqpb72Yh3c+1VOjTrhXtpJ7eeawEZ5w97ZMOxCkk1ilL9sIZej
	yA77trWWPVpGGSQMzSPlFuiJw7ekmm5LcmAxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XowW/4qFeaNqfvrmyVSnbv0bZqJIAZkKhxrl0/GwIhI=;
	b=ahp0krv3cx0XsmjG7eGRAPRNbgM8U/FgOkdtK1pkGpQTLIXaWz378x626B9iIYUge1
	UYAihpMg7eQJpnJzicdgkVKxgW3AGsM4ElAXXbS+5abyGV1oOWmlzbSbFfPMbC7OMN0+
	DygSBySkS7eBpBzo+ltm5iYoUNkzpbnvNexGnN44sc33QQ27u6dYmWOsFMcJpBsKMcSt
	zdSFx6tlzBh8Od6hgaUxvrbD1xK4gm+TwrKD7lcvqtMjPQUqbJkOFewli6GE3VWbYbfT
	22o2LxwK6wg6uiqjVdPYYZEXGl8QqYa4IY6UOX6u8q4s4tnMPRsO87EkryAOJqeZaZ6y
	7nlA==
X-Gm-Message-State: APt69E1U8pHquwC2vrgkOvS6HUgKUms925Pz7Qdat4vcAKl5YUFpnpSy
	R3d3V3+v75617C6PIzsCGgJRRm0kyb+89TlMSuyigA==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr8949259oia.11.1530551456645; 
	Mon, 02 Jul 2018 10:10:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 10:10:36 -0700 (PDT)
In-Reply-To: <20180702170522.GA9885@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jul 2018 18:10:36 +0100
Message-ID: <CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pt3HAqZ/8kvA

On 2 July 2018 at 18:05, Guenter Roeck <linux@roeck-us.net> wrote:
> I don't think I'll have more time available to spend on this
> anytime soon. If it works for you, just drop the patch. I can
> keep it local in my branch. My version of qemu is different anyway,
> after all.

I'd kind of like to fix the bug, though. I'd just like you
to provide the image you're testing with...

thanks
-- PMM
