Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2052868wru;
        Thu, 16 Aug 2018 09:35:23 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzJN7SBn+awJP4eaHl3IYpJI/ROzBAGKAaj2UMr8fIU8o+GiwM/4RmQa3qRiZ/jAn54RpIB
X-Received: by 2002:a37:5641:: with SMTP id k62-v6mr30032124qkb.40.1534437323420;
        Thu, 16 Aug 2018 09:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534437323; cv=none;
        d=google.com; s=arc-20160816;
        b=yeJiAgWWe3E6ETvb0YFyE2JrSLQ3I9rFL/xlyDNZJ0yN5Rv6JpOSmL6iQyMNAtOdzW
         8F/msTZ21cmdtbLj4h6v8RshJs1WCoS7GGKQSgpHCGYmH7+IVLr4sBA+iFTCk84XrKYI
         +iIGeKsygsppPb55NrctO9038k7oBoAxTwYoyVmYbSkzTLgRmEenyJBq7kVwTfwVww92
         kRkngP+2wjOGfs+tpF99aHDc3P1RYQFrhxwMENmy/FnM9HU32nuZ6BzoIAoa9JJdFE+o
         xnJ9qdUu+xPNZ1s2wIw2TyxdZSZyVn+C6Bzv6HyNkR8v8x6M7Ky5j9nU0aJioPvtLKEf
         QjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=tQ+IfivC13xI4obrLwQnCuQgnh8UwIH+4uv0Zk4+cMw=;
        b=lfmOlFln15MSueWStXLGlcfIutcJYoPWrRAhDsKxt8+QrvT9ft40iIPs9N6Y0NkTqR
         QW+j7eCllpA9EAzaxknc0b4gw4WvE4XIL7KLUNClizIxUFfRSiM7zN6MOVarjXw6uj+d
         4OSMiBJwcusH4eluONGoBtbB5qo/s0yC6RmrodfJmZfRkKbI7BW7RupW9nhyDC9R+LLo
         f2DXCZqSuTplHPc1i685eJCj/ePakkYiAuxfTJENKGBe5kOJvOTx797GKI9Gqee5ETLf
         hKWDqEyKda3rP5bKeZJs4qi9PeiwhPmCW/jNCI5OaWQ3fUksTEyB4Bhp5u8lEjj+xDxo
         waSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="HGTjn/RV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s30-v6si5917162qth.284.2018.08.16.09.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="HGTjn/RV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqLF4-0005aV-Qg
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:35:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqKrk-00085e-SD
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqKrh-0008DT-Lh
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:11:16 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqKrh-0008D7-HM; Thu, 16 Aug 2018 12:11:13 -0400
Received: by mail-qt0-x244.google.com with SMTP id n6-v6so5321981qtl.4;
	Thu, 16 Aug 2018 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tQ+IfivC13xI4obrLwQnCuQgnh8UwIH+4uv0Zk4+cMw=;
	b=HGTjn/RVp2VqPUCoX5KN6n8WkHHRzWNsLTxH7a1hPLP+2GzzkqZmTbHb6w4t1fZAoO
	F3BHrOdgXsTgSKurP0W19BIEVMRkmFmue1uPkiZTC5nbewMXj2UqPKzGdZMj+/GVz7Ih
	z7hcARA9yK5eiAglD7fWdrgXQcOlFxZIqJ0KL5RFweO1uavq4Yw8ONg+K9+jz/M6nFVb
	zzgUpj51sVGhyd3h5qomgSq251ogaP6PbfwvawgNWjQkeTZZzMDexoeE+DauDRVP/CYG
	w+Plzah4KXKyKvIcxOrAr2WJpv+o69eDalw4To+vrD8c4HeZtumB/vzGdhBDn3Y3zmoa
	GM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tQ+IfivC13xI4obrLwQnCuQgnh8UwIH+4uv0Zk4+cMw=;
	b=TVtMHXaJdL0x+jueVzSRJ2C6PHZOws0ARzXUZJ+Y4r+yCyOJ9Yab1wa83BxrWbI1km
	qkIyWzZJvTLlNApRrisGQgKWJ9Ne3Jsi8iqsKoiOkzK/rdSRFKwkLUBFBV5iYa5+Cblj
	DQtuuT9FoMQlQ8FmVb2hoj9XFQVm/YFmEorz7VCPMaRTPfs05fv35U59S7N68BUEgiXN
	OovKDAEBNWEHXZent9026kxCev/kf+ZjWyST6Om3kfWlazyaSiuFERLEFBvq9AK01ZfZ
	dTU97tkt/m6TbyegrRMMWv+JTGboVqiwoCU3uUHCvPbdvzKwfxPdsHcxKtKDhy9yuDh+
	2gQQ==
X-Gm-Message-State: AOUpUlEKogmRP8UARv3dgUg794C9e+zbjXSgCxN+RVnKg2DYZKk/kpzX
	yKVa8bD38fQtMTGu9Vof/fg=
X-Received: by 2002:ac8:1bdd:: with SMTP id
	m29-v6mr31671007qtk.261.1534435872918; 
	Thu, 16 Aug 2018 09:11:12 -0700 (PDT)
Received: from [192.168.1.124] ([190.48.89.88])
	by smtp.gmail.com with ESMTPSA id
	w79-v6sm18483652qkw.35.2018.08.16.09.11.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 09:11:12 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-6-stefanha@redhat.com>
	<1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
	<20180813155622.GA18429@stefanha-x1.localdomain>
	<ba150247-7c07-b7fd-f1e8-0c07b5358999@amsat.org>
	<CAJSP0QX-YkpS_RMj2VtP34kBATtq+_dUM0p_y5FvjvNxZBGDPQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <bb23f35c-713c-5976-01dd-9b784c51119f@amsat.org>
Date: Thu, 16 Aug 2018 13:10:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJSP0QX-YkpS_RMj2VtP34kBATtq+_dUM0p_y5FvjvNxZBGDPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 5/6] loader: Implement .hex
 file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <qemu.ml@steffen-goertz.de>,
	=?UTF-8?B?6IuP6Iiq?= <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bFvXhRIroRX2

On 08/15/2018 02:52 PM, Stefan Hajnoczi wrote:
> On Wed, Aug 15, 2018 at 3:18 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 08/13/2018 12:56 PM, Stefan Hajnoczi wrote:
>>> On Fri, Aug 10, 2018 at 02:00:44AM -0300, Philippe Mathieu-Daudé wrote:
>>>> On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
>>>>> +        parser->rom_start_address = parser->next_address_to_write;
>>>>> +        parser->current_rom_index = 0;
>>>>> +        break;
>>>>> +
>>>>> +    case START_SEG_ADDR_RECORD:
>>>>> +        if (line->byte_count != 4 && line->address != 0) {
>>>>> +            return -1;
>>>>> +        }
>>>>> +
>>>>> +        /* x86 16-bit CS:IP segmented addressing */
>>>>> +        *(parser->start_addr) = (((line->data[0] << 8) | line->data[1]) << 4) |
>>>>> +                                (line->data[2] << 8) | line->data[3];
>>>>
>>>> Can you add a qtest for this case?
>>>> For the HEX loader I understand the specs as this is the same parsing as
>>>> the START_LINEAR_ADDR_RECORD case; so I disagree with data[0] and
>>>> data[1] shifts.
>>>
>>> x86 real-mode CS:IP addressing means (CS << 4) + IP.  It produces 24-bit
>>> addresses on 80286 and later.  This is not the same as
>>> START_LINEAR_ADDR_RECORD.
>>
>> OK!
>>
>>>
>>> GNU bfd implements it as follows:
>>>
>>>   abfd->start_address += (HEX4 (buf) << 4) + HEX4 (buf + 4);
>>
>> Hmm any idea why they use +4 ?
> 
> buf is char* and HEX4("0123") produces 0x0123.  So this line evaluates
> ASCII hex input buf="XXXXYYYY" to (0xXXXX << 4) + 0xYYYY.

Haha with this weird indentation (space before parenthesis) I quickly
thought 4 was added to the address, and probably than HEX4 was a
constant... I will avoid too late review ;) sorry =)
