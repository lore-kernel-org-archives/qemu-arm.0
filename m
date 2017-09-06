Received: by 10.223.172.38 with SMTP id v35csp1443026wrc;
        Wed, 6 Sep 2017 16:17:29 -0700 (PDT)
X-Received: by 10.200.49.87 with SMTP id h23mr1130604qtb.13.1504739849383;
        Wed, 06 Sep 2017 16:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504739849; cv=none;
        d=google.com; s=arc-20160816;
        b=bY7r8ntG5Fj7RDB7Ms6mIOV2VbWZ8fLugV32sELIfm6Ara7/oulVStlET4BytCedG6
         +FFbxpbd0EridW0KCQalQ3rhDSFD8agz3xMaCfRFJKwKQD8a/gfkBD9Cl2iiOY+X1uLz
         QBKz5/nX0nZ6/GpEjzd31yVQXtbc7RXaMXzhktPpCYc1L549yoMOu9u+uo0buhdgO1B/
         T+AK0Z6P6opGEbxrYrhKwOr0ItQMClZRRHr84xKZ83FPIutjwgrmTyInj179WMv6hDzD
         hSXaHR18OyTaKWD1NywlFBPsEHN6C/MIecg71RzhyDU/qe4FHB8tdxMO3i7xasdjys+2
         0Q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jutMsoTE9EgUngAVwb2V5YO1m9Q7xArlK5A0+lEi4zA=;
        b=sjsvQZeEMALhQpU8E41JBV0bYDwm/3glnxNY+YX8Euy68MSl+DVM7vxx0hbu48gVdi
         44I2PU+0UPSBgC34C9ri2BM1yDg8UkyNPbgOsjhMHATZK6vX1NVyKT6H1RViUcjMSBlx
         UBd1NojnV3Fe33zIE9qIcuGY4UxMd5eWOSb6Gfu6c8gD12vG6hhJfF8ZQTE8szvIMgg/
         o2tihU5e7MK2d+dniMns/yCzbqq6Ywsm/m9uqLO19IiwWdHlVdI3QxDMvS77hN2xJhM0
         2INrsCCKl62RSJA0CbErOlPWBB74/I8mUBUUp8K5Vr/hUZ+HJX6BdHodmagoVpP4Otd/
         sxag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qUj9ksMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si1227361qtb.281.2017.09.06.16.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Sep 2017 16:17:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qUj9ksMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpjZW-00062n-Sq
	for alex.bennee@linaro.org; Wed, 06 Sep 2017 19:17:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpjZN-0005zP-QU
	for qemu-arm@nongnu.org; Wed, 06 Sep 2017 19:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpjZM-000251-OP
	for qemu-arm@nongnu.org; Wed, 06 Sep 2017 19:17:17 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:38856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpjZM-00021r-Ii; Wed, 06 Sep 2017 19:17:16 -0400
Received: by mail-wr0-x243.google.com with SMTP id p37so1547213wrb.5;
	Wed, 06 Sep 2017 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jutMsoTE9EgUngAVwb2V5YO1m9Q7xArlK5A0+lEi4zA=;
	b=qUj9ksMUKAYBh0t/0zVZjqAUOUel8QuSHimNJKWpQGcsvHrFnVw2QxbnEfbwDvN89u
	zAACids3Ot7yD2Lv01DqNtEBXLYJIL5qxm2YRlu3eHRyCkJZRBuJXRLJcmLOuCCGbhoU
	+Yhog0tky63Q2/sPgHvNiOqtHWal4S5kQ6R0i2ux3d/rdaLkIk3Rvu+v9ChqnyuUvRcr
	zlx0dq37acyiica+s1VI6KXW3fMoTTdeXS60K4lHuSpgKFD07nvDhj8qj39jk3LPiTz2
	55wB9nCxYH7LnjYHI3IrY5aUS6Awhlom+7q4EBTyZJJPqaTkHXCwKNGdyX70xmPGeDzj
	fHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jutMsoTE9EgUngAVwb2V5YO1m9Q7xArlK5A0+lEi4zA=;
	b=Afje1iqQcPTs0hNfIBHM/azz26S7qBdrR0DqjQssgA3cpIoTaOlY3mafW6OdbzKI65
	c5CkEtNOeD9j2sidD5NSZeiBW17HltcH4UzvKMG3wnjXg1G4PJpRiRWSuTLQq2y5XVIx
	2eF680gSVnQCNVAqwyioabxBk3lu31zfxO+LDq9riixwiVfNZAsYuADT0gVsM6aAnqxq
	l/9z7uFlpza5wDoPtJz0z+pwTMX4mogCoVtygB1k7lpyY2Zo4sljnbPorxxo6qnwEHou
	YmBEM4KctZ6ZaR/eGosOiTzgPt9z5oH/3M9PUKiy7t2kgJbE0h8wxJpgl++1dOBpSD+t
	GnDw==
X-Gm-Message-State: AHPjjUi9hSA41cYxpHBZC+mmsIdRp4Jdm0GIxwmIiSDQWM808ZdPj9eM
	8C2n8GkEhL1qqlxLh3AjXNtzTiBSwg==
X-Google-Smtp-Source: ADKCNb5tIO75iNszEpNN/t3Aurggz3trd8ilNW3gJlY8B85t0rIpjoZ4eY7SiqQmf3F5Nfzg7IltT/VJRv8hD3Q3m9k=
X-Received: by 10.223.175.100 with SMTP id z91mr492251wrc.177.1504739835447;
	Wed, 06 Sep 2017 16:17:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Wed, 6 Sep 2017 16:16:44 -0700 (PDT)
In-Reply-To: <a0cce589-b6e1-d17e-34df-f8232c64e5fa@linaro.org>
References: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
	<1504626814-23124-2-git-send-email-peter.maydell@linaro.org>
	<a0cce589-b6e1-d17e-34df-f8232c64e5fa@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Sep 2017 16:16:44 -0700
Message-ID: <CAKmqyKPy=Vja7Bq6KTWKh8mrHyJht8rHxcRzC+vHY5DknXjC=g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/3] boards.h: Define new
 flag ignore_memory_transaction_failures
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTfOpmYG9TsW

On Tue, Sep 5, 2017 at 9:03 AM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 09/05/2017 08:53 AM, Peter Maydell wrote:
>> Define a new MachineClass field ignore_memory_transaction_failures.
>> If this is flag is true then the CPU will ignore memory transaction
>> failures which should cause the CPU to take an exception due to an
>> access to an unassigned physical address; the transaction will
>> instead return zero (for a read) or be ignored (for a write).  This
>> should be set only by legacy board models which rely on the old
>> RAZ/WI behaviour for handling devices that QEMU does not yet model.
>> New board models should instead use "unimplemented-device" for all
>> memory ranges where the guest will attempt to probe for a device that
>> QEMU doesn't implement and a stub device is required.
>>
>> We need this for ARM boards, where we're about to implement support for
>> generating external aborts on memory transaction failures. Too many
>> of our legacy board models rely on the RAZ/WI behaviour and we
>> would break currently working guests when their "probe for device"
>> code provoked an external abort rather than a RAZ.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/hw/boards.h | 11 +++++++++++
>>  include/qom/cpu.h   |  7 ++++++-
>>  qom/cpu.c           | 16 ++++++++++++++++
>>  3 files changed, 33 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

>
>
> r~
>
