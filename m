Received: by 10.28.173.206 with SMTP id w197csp4181242wme;
        Tue, 16 Jan 2018 08:52:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBoubgYLfMKbvwRjlczIBsvwct/CfHZNJ98zc3sSDC2qYr4nMhBx9A9e0aHWyo8XvIhw8vpKS
X-Received: by 10.129.94.65 with SMTP id s62mr13226148ywb.261.1516121528708;
        Tue, 16 Jan 2018 08:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516121528; cv=none;
        d=google.com; s=arc-20160816;
        b=iMiQ3rKhe2LCgGFa46+n946i5Vj4DwFsvIvHwjcnkxN11nFjmufRtV2wDjrLfMpVm8
         Rero2bpYJ2x6rf5wPQcVaqhh676yUdnKHy3UtNGryR0FYy9I62fz3R4HwNbPmoZrKylS
         EuOh9rjitNflPMMkzamKqN0uVfE7uKqLj3ce+0AAzMLlYjPKX8IthKAtbXsKBfU7Hxw+
         RNJgwjOs8UBmNQh2+XUD35zmn4+eHpkC5tcMINF3XucraqFPxtfrDLWZtyi0Caq9yWr6
         ZoKCRmQMILcMx83Wircp7j528ghaR7tLN8JInFGkyK75MzCG8DIwea+3F4Z+lMX0gt3L
         KVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=zr5CC78Z0APeDmB0DuW/9cisqdQhTMjoEmq+obKG138=;
        b=GzN5Wk/AEF9neaM+8ukG1hZfw4kkoJ36Xe0s9vCGNeLzhDVybELkhciL32Od3RdYtD
         Ga2Aq4H3K109VQDsN6zkw66xfzxY2j3gOX9dBUQ7iaymVpH3jyAyK32QzEntaJ/gde7I
         q3nvbjvW0+m5IXLQlmsgou48dThVoy7zo19USDImY/KdPpuvjXSAx5W7ztknmi1U526a
         j95nYM2JjWY/8dNgXQnjBhAUI/fKGqoMagQ3Qi3yWvw8wvkGNsS12ZgGoQxWVSGBBtCp
         jORuG31eL3h/e4WLOEJjhR7XTiRceE0FxB1jjXNKoRPlBPq8UKweNv9u1A9Kr9AK/Po9
         uecQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=InMzptmY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si574813ywd.150.2018.01.16.08.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 08:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=InMzptmY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebUT2-0004yw-8t
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 11:52:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebUOJ-0001Gd-Dh
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 11:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebUOD-0000rb-OQ
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 11:47:15 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35995)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebUOD-0000rM-K5; Tue, 16 Jan 2018 11:47:09 -0500
Received: by mail-qt0-x243.google.com with SMTP id a16so19022124qtj.3;
	Tue, 16 Jan 2018 08:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zr5CC78Z0APeDmB0DuW/9cisqdQhTMjoEmq+obKG138=;
	b=InMzptmYscL/5mt56pioud+YWw97M6BTE/ekh/CR4P/JWMGeHUUStIrbfqu9IGEW3K
	F20viiF+07MaymMNl4EKK/UGL7WuLWZTmgdwKmmUS+puthTNAtuUPamrFHsIJ0E9oJWC
	hK//50c54ga7ZrE91GkolxgSQzhNZ19yNkR4EwIzHsdkll1WxeJj7IxNYoVoB0gpyoZA
	kJwOIpctG5L1k8xmEztCbPHeCuRQerNCydu0dUGZJHlrRK1B3ODJ3KxHelRbECNSi9jP
	Ddt7M4oSxuy/Y1haC7TIlcugDtgxydv3OhTWsMv5dKBJv5B6hALwIMoilP+FyFle15k+
	MxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zr5CC78Z0APeDmB0DuW/9cisqdQhTMjoEmq+obKG138=;
	b=ZtDQ89lRbR3+nll/AHTIVpLq9QilxQUWZ+KXNJeXL6z6Hvhbe1gtF/B49sJneqmmgo
	TeOJmwKu0K6B9F4zXI21M11O13tYp2VFZ4ZXFdm1QguNMJbZsalJ25dafn6xpkO8lzKg
	AYt8dz/V4aosW+x/rncdz8nbv8NB8pKD9MLRtAteligPf89qn2ttBw3jx0696vRvXDWv
	SmLlT9oSkfeak4RCSiExT3dUcO7lKlabyohn+rN5jzEmK3ftA2LDeWM7OTBDNZKTnwSI
	HioymMzgZ6oj9Qh0K0+iEA/ZI+qAY8m0Scrxwq91WxJhkGq1Ac0pNipkjlF4FT0xvR8w
	6Pug==
X-Gm-Message-State: AKwxyteXEjQSwBwBs2fI6WkWZ5A64V5YnExQTI+VQ7YU/vSXkVe5WUqJ
	fUoeZgOSA/FKmdGW8/NqRlw=
X-Received: by 10.200.67.75 with SMTP id a11mr36958636qtn.197.1516121228971;
	Tue, 16 Jan 2018 08:47:08 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id k7sm1815532qkk.70.2018.01.16.08.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 08:47:08 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistai@xilinx.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-12-andrew.smirnov@gmail.com>
	<b085a18b-84f4-6695-f664-c146ece47eee@amsat.org>
	<CAHQ1cqGtN+dvSP_q2QXRJ7wAwBZNGzVkpG3Zd9KS87OHkL7n5g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2be301ba-b417-e818-93f4-d43aa8b60b40@amsat.org>
Date: Tue, 16 Jan 2018 13:47:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAHQ1cqGtN+dvSP_q2QXRJ7wAwBZNGzVkpG3Zd9KS87OHkL7n5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH v4 11/14] ARM: Add basic code to emulate
 A7MPCore DAP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RhyPnwzz0JjZ

On 01/16/2018 12:04 PM, Andrey Smirnov wrote:
> On Mon, Jan 15, 2018 at 8:32 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Andrey,
>>
>> On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
>>> Add minimal code to emulate A7MPCore DAP block needed to boot Linux
>>> guest.
>>
>> I was not aware the DAP is accessed by upstream Linux...
>>
>> You sure this isn't rather part of some bootloader built-in self-test?
>>
> 
> Yes, I am positive:
> 
> a) I don't run any bootloader and boot directly into Linux, so it's
> just physically impossible
> b) Here's the code:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwtracing/coresight?h=v4.15-rc8

Wow :) pretty interesting!

Alistair:
Some features might be interesting to add to the multicore-gdb project idea.

Thanks Andrey for updating me :)

Phil.
