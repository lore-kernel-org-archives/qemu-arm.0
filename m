Received: by 10.223.159.74 with SMTP id f10csp3659484wrg;
        Tue, 12 Dec 2017 02:47:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBovgdFfLElTgS5t9/4dodned97tFE7Jkr3+fibJvthccIxmYXKnpmwSXrO/NneIRY7HthrZj
X-Received: by 10.129.65.81 with SMTP id f17mr2417205ywk.373.1513075645453;
        Tue, 12 Dec 2017 02:47:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513075645; cv=none;
        d=google.com; s=arc-20160816;
        b=Wkm8O8igj2ecv/zJJnKAETpNMMgj4k/2OqEa6nPis/KiM+5wEKwXAmf4PsO77U/uC8
         xObC7Q7Qf8lKg+E+0IPPp346tXawY/lQ0kaHHMGpoy9k0MSGGxyQVVQq0QwKMRCShN/J
         967nitTt1QOENKMcljctJNty7WvOlz1WAfU/ZlT9CiJsxrG2L0Ac+74ODwYLNusz5gE6
         w3gCw0mg3vXXyAFuwBWogLhiNnwGbnwaGbE2EV2L2FqxkUwFsa2dbUcoRFkXpjU8HIQS
         O6hjHBjXLSil4AJdQRg1Nq3OCVSYhnWQdH6rZRzQ05uM2NYaavhwTVZvhE9aF17SicJk
         4Tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ofsTu2uemCs9p7MQW6FBqKqYNkjWeFQYONMTQPvY+wo=;
        b=HaltrER/Ilfqb5OmdN1XdbauxGoYR8MYQ/sjIb888/2ldlDvGV5mTUt9JsK8+COBT+
         s0jTy2kiT6rMpEhDLvwjZesnLd2gXQe1X5yQ86LtN19qPT2anbLwH1BdWYl/yaw4oyeX
         k2rY8KT7bD2JiuML7PSNvDK7QY2E7f9uf9X1S31dycuPytNy/MGhqScGbgUsJqjjfK11
         pWiWwRNlkybNL/ApcEsmc8Ue/OiW8xe988b3FPeF+eCRPDehUB1h0v9hTm+EpSrpQRD+
         IlPHuyA2tNSLtZPk21NuTpbMbM1LXgyoHWxf6AL9CB0H/XrBaiTPzKIJMDBbTdRHnLP3
         nbwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j51iu6s0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1si3246283ybb.523.2017.12.12.02.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 02:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j51iu6s0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOi5s-0005bU-U0
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 05:47:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOi4N-0004vx-RM
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 05:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOi4K-0008V2-5c
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 05:45:51 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:44484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOi4K-0008UZ-0F
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 05:45:48 -0500
Received: by mail-ot0-x244.google.com with SMTP id d27so17392316ote.11
	for <qemu-devel@nongnu.org>; Tue, 12 Dec 2017 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ofsTu2uemCs9p7MQW6FBqKqYNkjWeFQYONMTQPvY+wo=;
	b=j51iu6s0f+vaWqiNPAvEi0y4lX8oXdIJJh89zjXs28lApjEkE8DW79um+mkfuAtyYg
	Cmg6BHEawwDZuJeXLHXyMGnnN9C+1bQ+dhkYSZN0Rxp1lUuNnaT02eo+QrQVp4eDW8iL
	AXVn6M9LW0K5JhtGUN3werNMdBMYidbmHt+fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ofsTu2uemCs9p7MQW6FBqKqYNkjWeFQYONMTQPvY+wo=;
	b=obZ2iobIpuwhv0rw0routFUUYMFw8/lqvUi0LtKCWbkQjXsTl5A1tERV4QMXFZNnRE
	D/5MKiz77yHjf5vUAbEmn/mrdPiO4ixPbxqzFqOG+IvUraoUTUuqaOs0eDT1E0dQG4gH
	5CQgYyX3J7MJvfvGzuMleKjZrOCbaE38ZqL84ye470UUAKq6K1IfM89Z5tsoOtvSiZJs
	i1ID5kKSelCYAIFXoTSLA0G3707Vnc7gybGO/syFZ46/Qk9NnC7Tr3Sm0IvnqKRthepl
	kxFk7m0URdSWgjV/ctUrwPJvySJVZjuG6tMPhlvJkIMB5TSQrJUTV5KyWSBvf1hMjdXZ
	vuaQ==
X-Gm-Message-State: AKGB3mKlINQwAHVOgBMog6iUF3awyTSJCPvOhJabxHI3MaNFaWsddCX0
	k0HtBOdWZl8ELti9B4bv56gpd0JCkppXszqEexKo0w==
X-Received: by 10.157.90.6 with SMTP id v6mr2830193oth.54.1513075547338; Tue,
	12 Dec 2017 02:45:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 02:45:26 -0800 (PST)
In-Reply-To: <5A2F6F44.8050602@huawei.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<5A2F6F44.8050602@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 10:45:26 +0000
Message-ID: <CAFEAcA926yVWg6n+QE0mydU5v1DLBwtkfEM+Hs28H9bMVcgyMA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another UART to the
 virt board
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rayhOWRBVgtB

On 12 December 2017 at 05:55, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> On 2017/12/8 23:02, Peter Maydell wrote:
>> Currently we only provide one non-secure UART on the virt
>> board. This is OK for most purposes, but there are some
>> use cases where having a second UART would be useful (like
>> bare-metal testing where you don't really want to have to
>> probe and set up a PCI device just to have a second comms
>> channel).

> I'm wondering if it need to provide a machine option for user to choose
> whether adding the second uart or not.

It seems harmless enough to me to provide it always.
It doesn't increase the attack surface for security
vulnerabilities because it's the same device as the
first UART the guest already has access to.

Do you have a scenario in mind where it would be bad
to provide the second uart?

thanks
-- PMM
