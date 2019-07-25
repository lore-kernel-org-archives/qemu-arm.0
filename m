Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10305435wrv;
        Thu, 25 Jul 2019 00:45:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykJv0OQLN7rSlLisRBH8vXWOFo2BJPrFluSOsuL1qOf42AuC6ADkKcFF/uv6kY2/r8LF+2
X-Received: by 2002:ae9:e64d:: with SMTP id x13mr54334261qkl.445.1564040712033;
        Thu, 25 Jul 2019 00:45:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si33033087qtc.334.2019.07.25.00.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 00:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="NtU/tbff";
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqYR5-0005F7-J3
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 03:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33030)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hqYR1-0005EQ-Tn
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 03:45:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hqYQz-0001YK-QI
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 03:45:07 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hqYQv-0001Uk-TA; Thu, 25 Jul 2019 03:45:03 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B712396F50;
 Thu, 25 Jul 2019 07:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564040691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E/dhIJltMKsvvszGWl2drzWPRH6NjYDH3AC7WIXk1U=;
 b=NtU/tbffUUgcGbYu9EZMw8S155Now5/AlBRQVsgT6+CNyGymse6o9jk9+aIuX/KNm7PZQM
 S7ijCDk1Almlqh4CdLGiT+l0lOOvLSPDphcOtXd4H8FxjeOjx065T/y0y4X4U0BGyQGOas
 ntjv0fdKsUo6y8PtgGH7FWymL6EZBuw=
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190724143553.21557-1-damien.hedde@greensocs.com>
 <543de194-b4e9-de7b-3dab-55fcc0976bc2@redhat.com>
 <20190724163812.GJ2717@work-vm>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <e66cc73d-d185-c52a-b9fd-5081f960f0d8@greensocs.com>
Date: Thu, 25 Jul 2019 09:44:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190724163812.GJ2717@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564040692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E/dhIJltMKsvvszGWl2drzWPRH6NjYDH3AC7WIXk1U=;
 b=6c6srf0CoY3WfJDYWdB8b7IrxUe89Ygx6OoJPzmRpuTQbO0S0wywb2LhuThD28G21VzmFq
 lDR4I5GTeXdc7HV3BwWHJtvgPKfW3lwumQnciMphKpiFxPHcwYtG6iST6hqKcHdeSxSHpr
 uh3w3qZX2z8ptS7jrdiETKB1W+/nBao=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564040692; a=rsa-sha256; cv=none;
 b=ObpsSoqfbcOkU/9u9ly0hbZonvK4yHIgAChYkhPkYWMAQPUtfJBpYbTGG5dQ/Tnt0MffSB
 Gn850GXSxyiKsiIt7XJhrf2JWlhcFkHnAhJ2ulwKfEIyKHwEuCXkE0F1/p5l0nn9E8nw3x
 VQudHCdYjkQBeCzZ0M6HaOEzrVi1yxM=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1?] pl330: fix vmstate
 description
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zCmPbpLuIeb6



On 7/24/19 6:38 PM, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
>> On 7/24/19 4:35 PM, Damien Hedde wrote:
>>> Fix the pl330 main and queue vmstate description.
>>> There were missing POINTER flags causing crashes during
>>> incoming migration because:
>>> + PL330State chan field is a pointer to an array
>>> + PL330Queue queue field is a pointer to an array
>>>
>>> Also bump corresponding vmsd version numbers.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> ---
>>>
>>> I found this while working on reset with xilinx-zynq machine.
>>>
>>> I'm not sure what's the vmsd version policy in such cases (for
>>> backward compatibility). I've simply bumped them since migration
>>> was not working anyway (vmstate_load_state was erasing critical part
>>> of PL330State and causing segfaults while loading following fields).
>>
>> I still not understand versioning and migration
>=20
> Incrementing the version (and minimum) is the right thing
> to do if you conclude the old one was hopelessly broken.
> Migration to and from old qemu breaks, but who cares since it was toast
> anyway.
> As far as I can tell pl330 is only on our zynq and exynos models
> so wont break our versioned 'virt' type.
> So from a migration point of view:

Since switching from VARRAY to VARRAY_POINTER does not change the size
of what's migrated, it should be possible to accept migration from old
qemu if we can ignore the data in such cases and default to something
(but what ? put the pl330 in reset state ?)

Thanks,
Damien
