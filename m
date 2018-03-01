Received: by 10.28.91.67 with SMTP id p64csp1877427wmb;
        Thu, 1 Mar 2018 06:12:46 -0800 (PST)
X-Google-Smtp-Source: AG47ELsb5WktMEUe1QW75UWJHE99nhHCLD7JIt9q0k3vMHd38xN7GCgOpPTEOw0WVaPjUjQDMnIf
X-Received: by 10.13.211.130 with SMTP id v124mr1170214ywd.476.1519913565894;
        Thu, 01 Mar 2018 06:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519913565; cv=none;
        d=google.com; s=arc-20160816;
        b=d07kiCAh3LXKQxnefCMmJWfAZYfg6VsADn7u1KfQij1vJWbGb0iKecajKiCwo9stsY
         xgv1S0VzaU59z0kLgccIdMT4X0J2EwDaMP6AKDseGCoHNGDgARK2kWX9AQHsl2NT2ENi
         q62eMEZlyu+caWwRysq2eIqVzILoyMvsdhXma3sUcYUuDgX/pv85E0nGImwESms4f9sH
         Jc2/kcn9VczgkyMX8JnWT16urGaPjt1SAmuv0zgjvCPpR9xLmirQnvvw2SnpyePdKiot
         hQGKti5c0RjoCX0glR+JN1lrRz0BTJOQOS3LXkXcWHq3+CQ7ZEGx/GqJbcL5AlDfDyl1
         dLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xi/IsLx3snr+BJa7Fuv3I0PyDBDY7yDJOy/VZCjxJx0=;
        b=Uj6e6QIOo6OpTa7+CdZrpsKzregdS79vESv+S2eKDW7lKIka7CMuNk/ZXhRnA4qGeo
         iwuehR4UAoVvKA47u8Oj22xw60wyuHuZkV+gn3zpvFQQVJ/yUjXLKfKE4g7Uim4+aDPG
         UuA7q6PrutwgqnorUFJDEz+qrY859Oz4Ki28NFjzcIqxKI6Sj0xZyBXco5Dh1ni3d4Am
         K3NJVW4oKb2Y/1Q+U9hz9tt3VkRNkP7HaAe/9VhC94W2nHMSyXRZJ2X+VQOyaXlHV6cZ
         iMK5JffBYs0IfV4apU/uTFJ0AX8X+Ul4HBaX9yTBHlRyKJa3+il24Ysf2eVCWGSCSJra
         1vww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gtqDQhNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i11-v6si661222ybi.569.2018.03.01.06.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 06:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gtqDQhNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOwv-0004zg-9K
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 09:12:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOwj-0004xQ-1M
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:12:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOwd-0005jM-5B
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:12:32 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:39851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erOwc-0005iU-W5
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:12:27 -0500
Received: by mail-ot0-x243.google.com with SMTP id h8so5657903oti.6
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 06:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xi/IsLx3snr+BJa7Fuv3I0PyDBDY7yDJOy/VZCjxJx0=;
	b=gtqDQhNNc4KwyDwd7FTzGzivOwA7U7RfYUF8fwHEREzPSuvfJh+gzkLTeMcHRr2PgO
	x35BV77JfwZ3MVk8JDNRQ/8DeEDXYgkE5czIOl4rN2pwpBrHRqqeqok3wzL0H/g2EacI
	t7K3dPfqAUhl32b5s21F/TyMnI5od5i8quzBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xi/IsLx3snr+BJa7Fuv3I0PyDBDY7yDJOy/VZCjxJx0=;
	b=DxUg0UJiFy5mjR0n63Kx/fXBMcOAmJzGA3nFS+e4Z27jKHf0OmwMCa6Mywwn1nePqY
	tNQu7Uwcs1i2hSQPUwWjomIit5C3jqfQ8pn55F612glIMMjhMf6Oj0ihUH1mODy5ULWf
	VDulafT3cgx7MiCdlbr8fpE7yq09/y39U/0DM09++3PUKiyEWA05Vi2tRuP/WxU+PDvf
	hDpAdgNEPpLNYJ1jD6qtXh5KUsvjeFeR/pnQA5UZT6BFqu5Pcqh3AXGJwuj9/eoJu2Nv
	GciYNVpfc2X8KvzmMYZtCEBfgoAkvJ+zredPzpTtKYsDCcw6x7uMqfvTaUF6NwoGa6qA
	kuog==
X-Gm-Message-State: APf1xPC52nOiMEc5tNEHdDU0lcRJGHkHGUjX0h1kk321PD7GPnTNoN8c
	EuY/VUur1KPdT6+WxNZYj/UB1xmCDeDp063Zl4nIdw==
X-Received: by 10.157.27.17 with SMTP id l17mr1465915otl.294.1519913546181;
	Thu, 01 Mar 2018 06:12:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 06:12:05 -0800 (PST)
In-Reply-To: <CAFEAcA_o86z59NmYJhbdLbZnvZ0kdAuSRqLrwrVkysS_+EDqqQ@mail.gmail.com>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-17-richard.henderson@linaro.org>
	<CAFEAcA_o86z59NmYJhbdLbZnvZ0kdAuSRqLrwrVkysS_+EDqqQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 14:12:05 +0000
Message-ID: <CAFEAcA92Kt_w9_x1imqgmoQi7D_jT-ujqh2FexB53iRhZK4VAw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v3 16/16] target/arm: Enable
 ARM_FEATURE_V8_FCMA
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
X-TUID: 9Pu5Fzbj82xN

On 1 March 2018 at 13:20, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 February 2018 at 19:31, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Enable it for the "any" CPU used by *-linux-user.

> We should be setting some hwcap bits in linux-user for these new feature
> bits (and RDM), right?

Oh, you did that back in the patch where you added the feature bit.
Sorry, I'm clearly skimming these patches a little too quickly.

-- PMM
