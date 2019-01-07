Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3184359wrt;
        Sun, 6 Jan 2019 23:56:51 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7vs/n2XPVg7OxwmQC0mvVgnTqlySivVZL2jCJmqC991O5KrxRv/iZbX8UYviVpG3VxtSLQ
X-Received: by 2002:adf:db01:: with SMTP id s1mr48587905wri.214.1546847811474;
        Sun, 06 Jan 2019 23:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546847811; cv=none;
        d=google.com; s=arc-20160816;
        b=cdCLbnT6fsYUT8HQGvKB+DcNmSVIKn82SUx5uPUVoVzhsx2mPKSvLpOdCirqSQqbLv
         k+mx4WwhjMB5uwaeTaeuaQOB56SUznngEM9uueK/bN5lAWl99Po5r7KoXRnjYnSGTGZ4
         IBNZNWq+kcXAc1xPbx7A2EElxdIfHP/dgU8FI3cisAsLy15aTZ5+vRlUyBsZcnCHj03G
         FFHSZRrcgfNqK7DMhkwXOWWEB6uQ31wia0vehuwmgIuboDqKgXhLW69bxhfi1dZ0Tw7S
         6eBdlCjaxQ+b+8znQf+E7TSnSo8FN4qcfMr594KrazgjHiokKY1/7ZBtIrFd3qev4U8z
         qf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=1JHorlpQ/GIw7drbs04PEdp61+zod5ndeUQeVcI+jt4=;
        b=rTRTB0HmskiRZuwTxBAJ3yHL8HfJuG/Mb0FcpJS9v4pfqy21cHVRWNS4Z4jFdbgute
         6lzxmI1gAYM3wn5BX25Fbd5HwRTEhywlP+tJcOmQ5JuPK++4Z+e3rT8nkIOKvuiC8Dgx
         LednNPGti8qvEK+HSd17buGK5rf72ImkUasikFj1y1OUmQuH/KeQ49THRmN+PHjc0u1e
         aqPHXztaMTketrwdOVaZfJb1C4JbIkYd9+niRH6Q4OL6oG7O/1ZP/VARKLkqgO1KRDDO
         eqONQsgWpTgUadevO/J6d3YmTsNqTrS9DZlhSM4XxK66qXo0CaoWThy7nenkcotXrgpA
         8Wcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si35440368wrt.183.2019.01.06.23.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 23:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPmE-0003Ti-IX
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 02:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPlt-0003Lo-D1
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:56:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPlr-0006x0-Gi
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:56:28 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ggPlr-0006uI-AJ
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 02:56:27 -0500
Received: by mail-wm1-f66.google.com with SMTP id a62so6231115wmh.4
	for <qemu-arm@nongnu.org>; Sun, 06 Jan 2019 23:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1JHorlpQ/GIw7drbs04PEdp61+zod5ndeUQeVcI+jt4=;
	b=J+xNynNcUSoLR6g0eVPr1KksZy9O4lDxGx6HJry9mXqWBDGCRlDvR8BcBTXy29d+7J
	hL5qUM+HIKkdAvZY6EXH6sICG1FFoA2iI+qjsIwbr9JCt4mt+p48hE7Obh0v07CAm3vQ
	rEOJii1QIVSUGUhoTsdW8arbFSNCXAQj9FekVmVg/hled/ffFSM/dqdx4NCOuwd3iYqU
	ZEnIOR0YnG+F++jhk8XA1BEhzvIoEIOu+mRXQjdhZK5rsUEkvdsjMPRK6rqld57XNMkr
	/3PLoxDUFj00t17oTyJEMX2PRnoGO0WqRC9fOrIh6Ns8GHQ3tLJB0xSYY2UDn0ioQlsq
	bu+w==
X-Gm-Message-State: AJcUukfLzwdJ2PH6oV6Vk3xfJ4lvXieh5+kz+ceQ2oFaUzc9P8tCJxFc
	7kdSDGtOus0K4OAt8anCFJvu9g==
X-Received: by 2002:a1c:b14:: with SMTP id 20mr8274967wml.103.1546847784902;
	Sun, 06 Jan 2019 23:56:24 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	j33sm76464565wre.91.2019.01.06.23.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jan 2019 23:56:24 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-4-philmd@redhat.com>
	<5d940a10-85c9-7361-86e0-99f9e1e8e737@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2d38b4b7-5275-7e5e-3293-c793d3dcebe7@redhat.com>
Date: Mon, 7 Jan 2019 08:56:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <5d940a10-85c9-7361-86e0-99f9e1e8e737@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH 03/16] hw/devices: Remove unused TC6393XB_RAM
 definition
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
X-TUID: Q4Wp+QIQlZ+w

On 1/7/19 7:32 AM, Thomas Huth wrote:
> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>> Introduced in 64b40bc54a9, this definition is no more used since
>> a0b753dfd39. Remove it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/devices.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/include/hw/devices.h b/include/hw/devices.h
>> index 0e27feb0c2..4019b3be17 100644
>> --- a/include/hw/devices.h
>> +++ b/include/hw/devices.h
>> @@ -51,7 +51,6 @@ void retu_key_event(void *retu, int state);
>>  
>>  /* tc6393xb.c */
>>  typedef struct TC6393xbState TC6393xbState;
>> -#define TC6393XB_RAM	0x110000 /* amount of ram for Video and USB */
>>  TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
>>                               uint32_t base, qemu_irq irq);
>>  void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
>>
> 
> I think I'd simply squash this into the next patch and mention it in the
> patch description there that you removed the #define.

OK.
