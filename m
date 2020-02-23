Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4421930lfg;
        Sun, 23 Feb 2020 15:27:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtLIrK07sFfAc2Q9oD2lOMrgK7jz0UCoYExzYujZ71WkqjAIrZ3jtHs4b7OKBMV7x7ZVVY
X-Received: by 2002:ac8:c4f:: with SMTP id l15mr44146973qti.177.1582500434787;
        Sun, 23 Feb 2020 15:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582500434; cv=none;
        d=google.com; s=arc-20160816;
        b=wnwpne0DxEJSHM9hcVE0AqVwHKs3/fvujc5gFOzQwRnUJJCk9YizYdQYAN1E9I2zhr
         smy75tysha94x/1W2lLWwwrFMYIFWvHtROACoKVgdIVTT7+6O1DVAMxOnawA7takb5x/
         XXrpt4ZjqJbZSAgwPBxqvjuE9JK9hTDg4vj72C5r0Id0rsC4PTF+wwSSA4b/tpd8D/3u
         OYqlgGxlFdIsPtyMEHOAzaf2j1iCt/yPCZtWuXD8P8Ws/klNlJyp1qNucrvJKd4BVfpI
         1A3oSl8u9NK3H6f1oYu3wPMcN/0fdCge+zrcSOfkaHtOTjURUJ8b5236npBl7wNWIaoJ
         jfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Et0xnT4Dd2+1xs5746sA2+lu/7kJsWgbt6oV2zmfOx4=;
        b=hL0YcmpyRg0tQYD7sU/RGx5vAOibB/03zMPm7KSSavHa1DswgE+wjmbvyV17P80680
         QG9CXlUxi4HX+wOB1r60HbsgvASkkQwWWgM6kNLOFmrLH5XLP8RdRxSU02CTSTuyDpm4
         v34hcyYBZsZLn/UxE9VUrIemxF6dC9n1XfR0AvqfGQMPJzgLBzHlEfZDqvgHt5kUbAcU
         Jl86ziaDfzhJ9uu6k14DgfSsrtmW+QcjXGyEonBjT+Q3m/798c1BmNVBCdy4X5FgzqQc
         Xvmg55cKmHhFy+AHrOBctv5aBDUvIedHFf4m1wH7Knad6HQpnEoQwca+siRiv4MSJHQP
         rQwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JaLjW9P5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si5599470qko.218.2020.02.23.15.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 15:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JaLjW9P5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j60eY-00089S-8Z
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 18:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j60dz-0007OF-IJ
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j60dy-0004tB-Cp
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:26:39 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48690
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j60dy-0004so-9X
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 18:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582500397;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Et0xnT4Dd2+1xs5746sA2+lu/7kJsWgbt6oV2zmfOx4=;
 b=JaLjW9P5Lm7OAcTXVqlh0ZRJrjQuLdm0FHONd6sjZ0CZkNUF0N+g7r6gKFoDW+NRNllO9n
 uZiiP2p+f5yz4MjgVRd4KIn1pEbhnT1eZsomRv492gbMv66X1gMxOrAVJACwvFSrN+JuDe
 1oTgOrPdAK1vEAEQInQ1SKlhIe6LumU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-A6HlEBD6MUWyc8e5oV0eKw-1; Sun, 23 Feb 2020 18:26:34 -0500
X-MC-Unique: A6HlEBD6MUWyc8e5oV0eKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C283A107ACC4;
 Sun, 23 Feb 2020 23:26:32 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-48.bne.redhat.com [10.64.54.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E33391855;
 Sun, 23 Feb 2020 23:26:30 +0000 (UTC)
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
 <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b0d768c8-83db-fa8b-8ad1-38a31590ed12@redhat.com>
Date: Mon, 24 Feb 2020 10:26:27 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ntSdyyeffrPz

On 2/21/20 11:44 PM, Peter Maydell wrote:
> On Fri, 21 Feb 2020 at 11:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 21/02/20 11:21, Peter Maydell wrote:
>>> Before you do that, I would suggest investigating:
>>>   * is this a problem we've already had on x86 and that there is a
>>>     standard solution for
>> Disconnected sockets always lose data (see tcp_chr_write in
>> chardev/char-socket.c).
>>
>> For connected sockets, 8250 does at most 4 retries (each retry is
>> triggered by POLLOUT|POLLHUP).  After these four retries the output
>> chardev is considered broken, just like in Gavin's patch, and only a
>> reset will restart the output.
>>
>>>   * should this be applicable to more than just the socket chardev?
>>>     What's special about the socket chardev?
>>
>> For 8250 there's no difference between socket and everything else.
> 
> Interesting, I didn't know our 8250 emulation had this
> retry-and-drop-data logic. Is it feasible to put it into
> the chardev layer instead, so that every serial device
> can get it without having to manually implement it?
> 

It seems 8250 retries, but never drops data. s->tsr_retry is always
1 when neither G_IO_OUT nor G_IO_HUP happens. In that case, there is
always a asynchronous IO handler (serial_xmit()), which will be scheduled
on event G_IO_OUT, apart from G_IO_HUP. I don't think the event will be
triggered in our this particular case. This eventually has UART_LSR_THRE
cleared in LSR (0x5) to hold upper layer. So there is no data lost if I'm
correct.

It would be very rare running into successive 4 failures in 8250 because
serial_xmit() is called on G_IO_OUT event as G_IO_HUP is rare. I doubt the
logic has been ever used, maybe Marcandre Lureau knows the background.

Thanks,
Gavin

