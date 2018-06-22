Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1236628wrq;
        Fri, 22 Jun 2018 13:16:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe5rPibvuxHLllIfntOeXoCzb8yfvosZxnwy1VD4uH9nsIbtGmI0VrgHVo1WtryBQmJQfa/
X-Received: by 2002:ac8:338a:: with SMTP id c10-v6mr2824220qtb.178.1529698571127;
        Fri, 22 Jun 2018 13:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529698571; cv=none;
        d=google.com; s=arc-20160816;
        b=OR6wI/E9yPw8Za645Ah5Cx5HxjZYilFYqIkwaOH9ho1FKYEFamdQnql2yHt6uSxBL/
         EdMorGudnVnLG+z/9OmgcRCElXM04or7zqa/pNg1QUGaPphJDB+3STkGrjMbXGyGGoTR
         jMdlyo3FzfqnLJ+NE0Ye1qOVdVV3kC2KxG5OQhoX5nSkNaSfULOwwn5hU7OvAUXPJ38j
         NPJoUUd5aN1kU0XfEEnQAntsuPgDCtPJweiCKHvWf08hgUPgWYPe3cf1b2rQeV+/3HiX
         +MNCU0LT4CMnSqX/IeD33vi3b5ltFznB5E/rY8w4ez8i9Ui0qc44B5R671ZYYZpw+YIK
         lyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pwO+2USPudIVD/6rTtPTrosRmljOK+u8XafeUdYd7Rw=;
        b=vkvUalvIgV2bJXyuutpjlu9z6CgUdmUe1zXEI//Hu7G2hpomDjfsJ6p8tiFS2bNgoh
         bUp1G3uwkLHhWgQfI1zT6to5cgMD1YMgPosfLW1y2TK0g6ztYHSuKi66rZRtIEiHmZph
         ZtIzZHcwqq1LweLjkQJSztt4zl2ACd38Iio2ARYNgrWf7oSbgJhCwBozJ3kFwQ0uhRNA
         NWqpXw34s/87hWn7CNdlDX3oGDnaDMcdeXLErdxM/kGVuWeagvkac4hK2335tOEyn/lM
         IqwqQ3DleZ5YufCGc7t5mzvdEW8Nw87fsWb1hnREgAWmOkYxEaJ2WFxttlMneS970/g3
         2jkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JXnsHMiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i12-v6si4156510qtp.371.2018.06.22.13.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:16:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JXnsHMiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSTY-0004rs-Gu
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:16:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSTQ-0004rg-1N
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:16:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSTM-0005HB-TR
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:16:00 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSTM-0005Go-PF; Fri, 22 Jun 2018 16:15:56 -0400
Received: by mail-qt0-x243.google.com with SMTP id y89-v6so7034357qtd.10;
	Fri, 22 Jun 2018 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pwO+2USPudIVD/6rTtPTrosRmljOK+u8XafeUdYd7Rw=;
	b=JXnsHMiU65cYoO1CQE1XVNijhNTgbinSu219+mL148PYlREfX49ksCE+Qf2rOt4N4n
	3H1J2LJZXul3aXOot/kJf3RH+MgAge3LXhA+eR10epgxPTR+xsL4HBgZaDlEDTTuWmHa
	VVlLHur/4P60DllQpXtb16X4co+qLZkD6DaRQMuStnhGveM3DFkP/diWSVwBTVB58u6i
	lPLeGSByzhb+e5pmoUr9qUX41TcKTlwEtzDZm2QdUtk2X+mf6e2Sx363Bi8vPtk/i0i+
	H9suVIgk39QqFQSduyOidoEhFvfA7fdudUD0UJd0RZ7w67GouEVzNadOPbdpBQ+Yqylk
	DUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pwO+2USPudIVD/6rTtPTrosRmljOK+u8XafeUdYd7Rw=;
	b=WCX5LeyToeNfMAhIWdfn2vN9aGvS0sGqWMcMGkKm5HcMhtZnqEimRn4CFraKwSp8I1
	UIwXbbiuzEhASv+nyUUcR7Pl7pe57DFWjp3AC7RNtwvelHWo7i9N0M0YfrPbleaoa5kW
	QknUAbHGHVZM3MaXq9IsorTAoSK+JSATV9TZYxLzX91LMCBqCFBijXfB0O2O8hP2v0dk
	NH9YYI+XlqhmO8YoCnMjqas7xMtMuhHuetJ7QTJtzXYj5jHGNVEzCdWNgSow8qZO0BxP
	PGIaLb+h950ICOb9ZZ+0YXZwq4n3nWLKhPq1av/2w+agmGtHQxdGtgwxLGobMJkKJO43
	zYOw==
X-Gm-Message-State: APt69E1FA4g2Uc5yaPraHs9xcj+i7BfsBz8Ty48DAVhmWKoOEwqvl0K7
	k8pBJfPob08nMuS0AoOQRO0=
X-Received: by 2002:aed:23e7:: with SMTP id
	k36-v6mr2852451qtc.20.1529698556284; 
	Fri, 22 Jun 2018 13:15:56 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	f10-v6sm2522175qka.18.2018.06.22.13.15.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:15:55 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-12-f4bug@amsat.org>
	<bcbba38b-7d1b-3a70-383f-69c0832666a6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f4a54fa0-c0fb-3cd4-8cef-3b7cef4d6914@amsat.org>
Date: Fri, 22 Jun 2018 17:15:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <bcbba38b-7d1b-3a70-383f-69c0832666a6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH v2 11/14] hw/net/stellaris_enet: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y+0sS3SR6lk9

On 06/22/2018 04:50 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> hw_error() finally calls abort(), but there is no need to abort here.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/net/stellaris_enet.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
>> index 04bd10ada3..f8edebdecd 100644
>> --- a/hw/net/stellaris_enet.c
>> +++ b/hw/net/stellaris_enet.c
>> @@ -9,6 +9,7 @@
>>  #include "qemu/osdep.h"
>>  #include "hw/sysbus.h"
>>  #include "net/net.h"
>> +#include "qemu/log.h"
>>  #include <zlib.h>
>>  
>>  //#define DEBUG_STELLARIS_ENET 1
>> @@ -343,7 +344,9 @@ static uint64_t stellaris_enet_read(void *opaque, hwaddr offset,
>>      case 0x3c: /* Undocuented: Timestamp? */
> 
> I guess it's trivial enough that you could fix the above type in your
> patch here, too (just mention it in the patch description).

Well I guess it depends the maintainer taking it :)

Since I expect this series to go via the ARM tree, I'll fix this typo in
another patch.

> 
>>          return 0;
>>      default:
>> -        hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_rd%d: Illegal register"
>> +                                       " 0x02%" HWADDR_PRIx "\n",
>> +                      size << 2, offset);
> 
> Why "<< 2" ? Shouldn't that be "<< 3" or "* 8" instead?

Oops "* 8" indeed.

> 
>>          return 0;
>>      }
>>  }
>> @@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
>>          /* Ignored.  */
>>          break;
>>      default:
>> -        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_wr%d: Illegal register"
>> +                                       " 0x02%" HWADDR_PRIx " = 0x%lx\n",
>> +                      size << 2, offset, value);
> 
> dito.
> 
>  Thomas
> 
