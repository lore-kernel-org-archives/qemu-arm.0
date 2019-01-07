Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3188942wrt;
        Mon, 7 Jan 2019 00:03:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5sweP5M4s4If+2nyemkmXBD8y8/Qhm9qVK2furUJ/vBgKJkRa3n26bY3E2zwtZjpM+2v6E
X-Received: by 2002:a5d:6907:: with SMTP id t7mr32641784wru.226.1546848198037;
        Mon, 07 Jan 2019 00:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546848198; cv=none;
        d=google.com; s=arc-20160816;
        b=paIxS5ZXtBKw3AzwDZyMofWPTsMsxoFrWxjGKBWrYE5HnFf0Ikl8kVaFKKV/W11Vvj
         Ivd+Upb2f5nRPGcPEtBFISFMXF6QWq+4PrGST/Zlg6XB69Y77CgW3f+oJY+yRIevy1EY
         pqRB0KM7eNctV0INUYM+H+T/gCbOIDuROiVwetq/Z4hOQQ4ol/NUpvkLfxeeRhl5qMc0
         x1SXbN19tSliReUlREQ/E/mxmgMsdKCrmHT/+z19ozEQJpVbgZbU2F/ZM1v0ILhF1C8e
         6UgGyk2xHVzLwvXTb3nnZ+aTuQ3WRAnP+3bdWtALPhhLu5sZFMBkd1qBY0RJ+yljWhjT
         lcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=8JjHA8Wqry9i2dRJG77Tu2Zo/0uDXtalCyx7ORoNKLI=;
        b=nQpQJ+z46rW00aKjFRWEUVTFrvafbhbu02cBa+tRdnu+oL6CiRP70Gwx+Dtd5wYnUs
         qSUpkBlqMZMNrJFm6ayC4KkIdsb4+X91J7tfP9hb4W2trTeKWh7lnFT63NIY8wvV481I
         lcWnY10vIsuxxIuUhCkeeIvgFLopd0YKPf5KXkcM/UNEKBYNGllhrdZEUzxIIG+TdQRA
         po+HyM6/Wts0GjP3A3kaiJ0DpHtjhdNiQf3lamwjKuA+ZnkfI/50I8+/XdRtwaLjqtwr
         JXSc9hQIz7ACFdxnA526igQVMsO3nbvn2jRqWBSPh1n8OU1f1h9ohOfUuMH1nYjaDdp0
         Ocvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si34466535wrt.269.2019.01.07.00.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:03:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPsT-0005ee-36
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPsA-0005cl-86
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:02:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPs9-00050a-7a
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:02:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ggPs9-0004zi-2B
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:02:57 -0500
Received: by mail-wr1-f67.google.com with SMTP id t6so42142988wrr.12
	for <qemu-arm@nongnu.org>; Mon, 07 Jan 2019 00:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8JjHA8Wqry9i2dRJG77Tu2Zo/0uDXtalCyx7ORoNKLI=;
	b=BcdQt81bV9TsizBp9+yiUmQecPwqpjyh7h9jQN4qRRpdluxfyiTUOmROJh4q+klkzp
	xtqPVdprWk/wX8aouW/BPgxghigU53ooOpYRPHZLP2jDPm/hRiSXZo4N/XwYx7O7XGQZ
	rquAeLkRL5na5fVlDDkADOkmsQnGWas0zX7iqNglHYfzxOAWPy/xi652b87h02kiF6BK
	DboYAm00oQ8flGPPYvLzGTt25dtC3FzbDdZQRk3KGpGWZ7P2QtAy2xAUqlXNVXncn4cr
	4kOLCGT3KM1ERLgh/vKH0p9uaOfN4Byj4QZSkwbIVWiwAa2ZIwWVwb8BzSY/5AhCrnhQ
	oiWg==
X-Gm-Message-State: AJcUukfKeSQPiClaXKEosyl1Ax03juNn5nbZqdVl20UsmczIm5/P0Oxt
	UgchUnNEQ1qEvTdVNZI0B2emLA==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr55433512wrn.185.1546848175710; 
	Mon, 07 Jan 2019 00:02:55 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	d2sm43267081wrs.97.2019.01.07.00.02.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 00:02:55 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-10-philmd@redhat.com>
	<4821a853-bd25-7972-66dd-95092d216868@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8f7d5445-e138-6208-3381-5c70d49db28e@redhat.com>
Date: Mon, 7 Jan 2019 09:02:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <4821a853-bd25-7972-66dd-95092d216868@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH 09/16] hw/devices: Move TI touchscreen
 declarations into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPAxZ7a5VFTH

On 1/7/19 8:22 AM, Thomas Huth wrote:
> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>> Since uWireSlave is only used in this new header, there is no
>> need to expose it via "qemu/typedefs.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS                     |  2 ++
>>  hw/arm/nseries.c                |  2 +-
>>  hw/arm/palm.c                   |  2 +-
>>  hw/input/tsc2005.c              |  2 +-
>>  hw/input/tsc210x.c              |  4 ++--
>>  include/hw/arm/omap.h           |  6 +-----
>>  include/hw/devices.h            | 14 --------------
>>  include/hw/input/ti_uwire_tsc.h | 28 ++++++++++++++++++++++++++++
> 
> I'd maybe rather name the new file "tsc2xxx.h" instead, so that it
> resembles the names of the .c files. Just my 0.02 €.

Good idea :)
