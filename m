Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5928937wrh;
        Wed, 1 May 2019 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzns4yq5+VXT/BenB55M31XJIUK02dipz+c73gsOl5tRKlmh8Zi7AUbj4vNiyK1k9SzfGjW
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr33742399wrv.160.1556719653081;
        Wed, 01 May 2019 07:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556719653; cv=none;
        d=google.com; s=arc-20160816;
        b=TsLYo7i03sIyC6wsND3GkY9D2oAQ6B7PORWfwgLdcruRg/yTX0BotUvatuY1dWJx9B
         ClZYYJIzbP+NIEHZW9kANxY3qqtfhV9mHi/Q8uEJ/2oARXJDItw0FDhncWxG9wTaW+Qh
         IuZZdmd7sNThp/oKflkanDJX+loQIJC5aNNxC0iq2rcA72UyaAcSkO07gHx6uJ6vhOiR
         z6cJt3lbu95ekf3JZnx65AA5YqZqKFTzRn7E9jZ37VcwHdcmPmFz5MGhXKCB0+yxf3mR
         9twn+Hly218OwUybapNhG9CGG7k489upD2bIfmcdwtGQYvysuj6/J0OglaOEtp3XSuoT
         ln9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Y4nBiVVRReISVIZ4wV4IueXFQZiS7tXJCTJtenKW3bw=;
        b=cwVDbg1IwQPjhJSv8wi8nOw6SP3dJCECgTL5oxgF4CGgIHvxuwcM0zMls5stksOo4W
         5J56rVexOEZPEre23LzWs0n/uST2E2s5s5cewVVmJc2OQkfb+macleFVmaO3tgr4gi+p
         GSNqqE3digUaZxuXFfPgU1x5tRU2ReC1FaoEb53+wbCIXZIsTgSXKvPojRyc6l4N5bVr
         OhypJYB6Ji+YHKq3c5EyxD9YbvriR3Ky2d3QCGb7OjrKMbZPQf8grqFtdQerLNbU145l
         X4HUdNfxFRsS6DSzez9p6+hufV0MYyBFQIiPbSVzX+8Ej+ObzeBUYpVqJcsStZ+nXQz1
         iQ6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qr08ZgtK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si7051628wrm.121.2019.05.01.07.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 May 2019 07:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qr08ZgtK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLptU-0005zI-1S
	for alex.bennee@linaro.org; Wed, 01 May 2019 10:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLpt7-0005vh-TA
	for qemu-arm@nongnu.org; Wed, 01 May 2019 10:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLpt3-00008n-6s
	for qemu-arm@nongnu.org; Wed, 01 May 2019 10:07:09 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLpt2-000084-UZ
	for qemu-arm@nongnu.org; Wed, 01 May 2019 10:07:05 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g3so8659340pfi.4
	for <qemu-arm@nongnu.org>; Wed, 01 May 2019 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Y4nBiVVRReISVIZ4wV4IueXFQZiS7tXJCTJtenKW3bw=;
	b=qr08ZgtKpLHIKvRKXuMSnXdmeUvPOCDGhOxOC817r+i1uJKFtdmgbxgk/i8S7i4kRv
	SYmYgjHqNOnJfEHOIsB3W6YKQW0KynBTAKAQGQ43CyPV6HBgUV/Lh76ZHf01kOJDOyhK
	g7FKLCkT1oTZzJanxbiRpApdT6HXGWoDf59alZhK6O7p8fxKla09cCRK7Ku4KePZTuDH
	46OAqDF9l3sNLtQkDN7BFEscVkdRQ3e81LeFPAUWoXaMW+eAILuThsFRE82X5ZCSwNVH
	NStWkgfXZLeV7JaqFZZdo0Ld9vf7z/Pk8B/pbbg6gQo1Qllm7oB4dPSckMXag8PN7mbH
	CvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Y4nBiVVRReISVIZ4wV4IueXFQZiS7tXJCTJtenKW3bw=;
	b=kn0rKISJ3qCmBs7qDXTTpKjlUSOAgo6R72ka4cD3ePBrOem0I4Xu0pbFzWOy345une
	CPgGphyTsmOXie43GUXVQjbZc7p9QT488QM82lbdkehhUNa+jBNLPJWO817eIVvRQkda
	aHdweuWDyLEY7/O/lg7Nm/emlqKD11ChOTOeyotMQnAy6qW5rWzOsLjccYmyS0Bq/dX+
	7l/bqra7BaAQ0LPg/ctycS4CwOJ/Hi93XckQft1/kuz4l0LLCQR+Kc+fm75xryAqKxvA
	zJh/GzgMa+OijWlqk6y74RWxcQEdN2W1K754m1euvq0qOW/BJnfXArt6ukRCqGqCFNWk
	wcSw==
X-Gm-Message-State: APjAAAWj/7JVLHK70wBdEQGCRWyVRFOGrPM1sRssl9WQ4CoOz8m0gP3Q
	D9nNhmh9j6NAnmajvZ1gLiQ3jw==
X-Received: by 2002:a65:60ca:: with SMTP id r10mr9773363pgv.64.1556719623556; 
	Wed, 01 May 2019 07:07:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	h187sm65718526pfc.52.2019.05.01.07.07.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 07:07:02 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20190501061827.23080-1-joel@jms.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d1c73e60-d828-4192-24c6-ca2f595a25b3@linaro.org>
Date: Wed, 1 May 2019 07:07:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501061827.23080-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: aspeed: Set SDRAM size
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+azELaWpDXk

On 4/30/19 11:18 PM, Joel Stanley wrote:
>      mc->no_parallel = 1;
> +    if (board->ram)
> +        mc->default_ram_size = board->ram;

In addition to the braces, for which patchew will have sent you nag mail...

> +        .ram       = 256 << 20,

In <qemu/units.h> there are some defines to make this more readable as

  .ram = 256 * MiB,

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
