Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12610464lfc;
        Mon, 2 Dec 2019 03:46:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBHKnl4z6Jc64udmlExmBMUMzYNSRRyJ3ilgLGwf6LGlJnkMxYSrX+OuFdcLUtXIqMOOwH
X-Received: by 2002:a0c:efca:: with SMTP id a10mr32695824qvt.203.1575287198437;
        Mon, 02 Dec 2019 03:46:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si10475633qkj.318.2019.12.02.03.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 03:46:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=AORW9fsF;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibkA1-0003hJ-NA
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 06:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1ibk7J-0002GE-Qm
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1ibk7I-0008OL-ID
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 06:43:49 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1ibk7I-0008NT-6Z; Mon, 02 Dec 2019 06:43:48 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D5CAE96EF0;
 Mon,  2 Dec 2019 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575287022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hU90s+NFHEXRn3VjyWITYrFg1NmjzzO7O71eODyuVMw=;
 b=AORW9fsFHNcLSiYHSAhDg3ykTt5o54RrTE6pWtKyaypd3oq4V5oT5DIEl4vYjc2RuyZbZY
 XIgQbyII3NsrhXsE0qf8WqoXzatgs+vLjGJKRlXkAi37RzLoeuqNdW9KcI0tJF25CckRVT
 t8vO/x57xHA7nnpS/oVmcc3lk9cooyo=
Subject: Re: [PATCH v5 05/13] hw/core/resettable: add support for changing
 parent
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-6-damien.hedde@greensocs.com>
 <CAFEAcA-UV7rSL1mPD=NLyLtan60WNsc+MDjR6p2aDoz34bq8dg@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <02003f2e-38f5-2ff3-8160-e0bf6063839a@greensocs.com>
Date: Mon, 2 Dec 2019 12:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UV7rSL1mPD=NLyLtan60WNsc+MDjR6p2aDoz34bq8dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575287022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hU90s+NFHEXRn3VjyWITYrFg1NmjzzO7O71eODyuVMw=;
 b=Did3pQhHLza7i5pYC+rI0Gx3bb7g9TeE+DDv4mBgTLcnCNsmEn5+f4uBWFml/P9HGpNiCT
 12yMnL64LF0KDsVTOJX8loR3CrRjDwgERvarrnY97se+o+qsLf7OIJRjiI/xda8cjnlaUP
 VTWrQt1+zOJ7+WngsrqRI/f2Vs+5rMQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575287022; a=rsa-sha256; cv=none;
 b=P1O+eFriWFeGMbriDgzgaJYoTf0hrJebLLcJjOhGZZTXZOpMX7kE/qMCaMlilA5RXj4gXW
 Qq2hHaWUcIHFF4rskJ6U8Fywa5ISsYUgtxsrhLc/rFUK9RuIM/wJ3xWK61/rcseXlAXXLQ
 Cov7dmMkGJfdBcuw3pGWkja6jZgWEOA=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: du75bNJG1k8k



On 11/29/19 7:38 PM, Peter Maydell wrote:
> On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Add a function resettable_change_parent() to do the required
>> plumbing when changing the parent a of Resettable object.
>>
>> We need to make sure that the reset state of the object remains
>> coherent with the reset state of the new parent.
>>
>> We make the 2 following hypothesis:
>> + when an object is put in a parent under reset, the object goes in
>> reset.
>> + when an object is removed from a parent under reset, the object
>> leaves reset.
>>
>> The added function avoid any glitch if both old and new parent are
>> already in reset.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>  hw/core/resettable.c    | 54 +++++++++++++++++++++++++++++++++++++++++
>>  hw/core/trace-events    |  1 +
>>  include/hw/resettable.h | 16 ++++++++++++
>>  3 files changed, 71 insertions(+)
>>
>> diff --git a/hw/core/resettable.c b/hw/core/resettable.c
>> index c5e11cff4f..60d4285fcc 100644
>> --- a/hw/core/resettable.c
>> +++ b/hw/core/resettable.c
>> @@ -32,6 +32,14 @@ static void resettable_phase_exit(Object *obj, void *opaque, ResetType type);
>>   */
>>  static bool enter_phase_in_progress;
>>
>> +/**
>> + * exit_phase_in_progress:
>> + * Flag telling whether we are currently in an enter phase where side
>> + * effects are forbidden. This flag allows us to catch if
>> + * resettable_change_parent() is called during exit phase.
>> + */
>> +static unsigned exit_phase_in_progress;
> 
> This is another global that I don't think we should have.
> Is it also just for asserts ?

Yes. It's only to ensure we don't miss-use the api.

--
Damien


