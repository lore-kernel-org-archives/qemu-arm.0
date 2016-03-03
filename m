Received: by 10.25.208.211 with SMTP id h202csp2577216lfg;
        Thu, 3 Mar 2016 00:40:16 -0800 (PST)
X-Received: by 10.55.192.89 with SMTP id o86mr1516158qki.31.1456994416115;
        Thu, 03 Mar 2016 00:40:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16si40113541qhc.88.2016.03.03.00.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 00:40:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abOnv-0002Vs-Ln
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 03:40:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abOnO-0001uv-8E
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:39:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abOnK-00066j-7d
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:39:42 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abOnJ-00066P-RH
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:39:37 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e185so14565398vkb.1
	for <qemu-devel@nongnu.org>; Thu, 03 Mar 2016 00:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gx42Dfhm+oIyo4UySq4TNXzS3HT3I4iQntRbDB4f3wE=;
	b=PmbZ4tTPBus+RMewiFfN5Zo5A2G0xDWKeqgDQ44puvZep1LaAiDbGdpK1KNKpYvE5J
	bw3IykATpUzAqUboLD0Znn9gu/6TJ49n2EZZhRDoD3nPvjtdCTAdB7lgiyOIAr53TbaE
	+2mFS4PV7TjS+FL98CWlOA6ISJgnQoUSXvqnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gx42Dfhm+oIyo4UySq4TNXzS3HT3I4iQntRbDB4f3wE=;
	b=AmU8xyEJtYRUrTvozAcV5DT9mIL4HAyr7yzPeF6FAiPNfK98VG1lkKHd4p/CO+ZTX2
	PKgzIMZtvoO/pOqfTXe08khWUT04gBrn7z/BEMocW09/HACE4F1vfpqVKFC4eQopj2TL
	FBTpZ9lkC3nyEORbGN1ybuHVmTX6eXMu09BkBRymNsve2h/be/b3uvUcdiaiZcnQjH56
	YrKs+2Mlc6nwoCYVBZzm3YIqzPKB+z+AQRGeGQn2k1v7fKMWMDsBFaGVpQy7xvST+Bz0
	rvDBb7100oxdIpaHqzgTnQdJ6k8HNLGhHv4fu8z+x2+gcm1ePKtH/j/UUqAe9yjzevql
	Mx7w==
X-Gm-Message-State: AD7BkJIlKouziHp6KeOMUabK2CKLg51aASmYNhW4Br5j2QRwASWkLNrLFpWE0jcPzzheIkFwsvio2bqf9Kr60xZd
X-Received: by 10.31.8.210 with SMTP id 201mr1028212vki.90.1456994377100; Thu,
	03 Mar 2016 00:39:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 00:39:17 -0800 (PST)
In-Reply-To: <1456982069.10265.11.camel@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
	<1455622497-25966-3-git-send-email-andrew@aj.id.au>
	<CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
	<1456982069.10265.11.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 08:39:17 +0000
Message-ID: <CAFEAcA_YcF1zYY4brY+Wxc95-fn-WYN7TGMU9A4_YfPH=SLjeQ@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new)
 ASPEED AST2400 AVIC device model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ygYOZKLbKTyg

On 3 March 2016 at 05:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
>> > +    case 0x20: /* Interrupt Enable */
>> > +        s->int_enable |= data;
>>
>> Are you sure this only ORs in new 1 bits?
>
> As in, am I sure I only want to take the newly set bits? If so, yes, as
> the the following register serves to clear the field's set bits:
>
>>
>> > +        break;
>> > +    case 0x28: /* Interrupt Enable Clear */
>> > +        s->int_enable &= ~data;
>> > +        break;
>
> The 'int_enable', 'int_trigger' and 'edge_status' fields all use the pa
> ttern of separate set and clear registers (the remaining registers may
> benefit from the extract64/deposit64 helpers, I'll think about that
> further). I'll add some comments to help clear this up.
>
> Otherwise, can you rephrase the question? At face value it seems like
> you're implying that I'm doing more than ORing in the new 1 bits?

It was just that the register name didn't imply a set-bits-only
semantic and some of the other registers looked like they were
also incorrectly not handling updates right.

thanks
-- PMM
