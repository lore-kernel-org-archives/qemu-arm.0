Received: by 10.28.4.212 with SMTP id 203csp3962750wme;
        Tue, 17 Apr 2018 08:38:18 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/HjpTvh6ZKHwxs9zyl5S/5mRauYg16DDoTWXuKCZHO+d7K/dRYHbP56fm93VWOTA6AyyAz
X-Received: by 10.129.228.77 with SMTP id t13mr1597608ywl.92.1523979498107;
        Tue, 17 Apr 2018 08:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523979498; cv=none;
        d=google.com; s=arc-20160816;
        b=QKMjB5YDhSL07Y26ujyYIiX+qk0Ta6QHMaXqrpPMwJAR4mXl4xDGb85T38nb9YC/s3
         JFSUihQ5NGnI2VN6JUEcLbCHoYtzj9seuMySMwFg91FkkWvXS1lHYGE/h/Kce49kZATS
         KApSi6dNH+yVwZXa+YT7KQ2O7pXmCKaSQlLYCxZIiCtztWq+x6ddgjztQX2SQc7aRdvB
         F/4N5JUU9Yccf/kwoi3hwZdclcjB7i2K0ltz3GH0AL19nplz+nElT6XolLe3YC9lAn8N
         MDknVx1oU5F9Q+IBaEi3GEyWvgXer92+oy6RcWyh8LOhKYW236F84DyI+RKRczQtV14Y
         +F3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hI2eGS4YCESD5i6DtqeIeIjLOPfeTSdYZw+fiil/8/w=;
        b=wTWjeMl6ulMoY9I8Nnr4wJ6LIreo9uzFRFEIYpWFEIyZLsILTWBuptVTWuOHrLj0Pl
         TI8S+jBN5PrbUzSehoZ27NdOawdmpT/oi0yxP0Uh9k5Ck5m2+bQbWZa7E3D6MLdazSIM
         A+DefidRhx3nJ86jXYSgTtzDQ46p6IQWyuuRHJD8YEZ3vKLClDwdZRdY/wgY6g1DnkQi
         pDtE6SI8Nn1waQ3oDMZ50tgk4/Q5wFqeC641oKU6sV/QwD9DEWIz2ek6um6CmPEFwYKz
         sZYuMU6M9gS8EFKOkNdyxd+U6ARzmX67DoPasgU+4/PJh1TTtJ7GgwQcCMbnzeCSTjfD
         vcKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bdIYfzwc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1si6154946qth.145.2018.04.17.08.38.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 08:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bdIYfzwc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8SgT-0000GP-I9
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 11:38:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8SgH-0000FV-LD
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8SgG-0004Rf-I0
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:38:05 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:47097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8SgG-0004RN-DB
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 11:38:04 -0400
Received: by mail-ot0-x22b.google.com with SMTP id v64-v6so21844716otb.13
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hI2eGS4YCESD5i6DtqeIeIjLOPfeTSdYZw+fiil/8/w=;
	b=bdIYfzwcHKi9jU7BmUU4vNG5PgiIkJcCG+dpmjOWSilqBJIrrbVy/3ogVj6O/CNPSq
	BKGc01y6sJTiuOC2mLwC43vnZ+XIXsSPwFvOWrJRYoMeQR4CLOO9oLn4CHmk0e9lMZ7W
	h/QGrSede/M1qTo8CY9TNs2h4WF29UmnmJ30k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hI2eGS4YCESD5i6DtqeIeIjLOPfeTSdYZw+fiil/8/w=;
	b=NHU0JJyg1kjzahtLZ/ic7E/YeDS4F1Ildwy9e2bs0ki2oVoLZAwT3mp1KhBCV7MZPR
	4g9R8ulMQRDZKsUcXP1TL6GqoAvklS7/qLGy5yXX8xWyFJviz5BdFFyFRUIFsvmdtTfK
	fuSQQRxvb5qxLtxTtzr0tnoo9BcJ+GxMTe/9rtO2eEmGMyjm7NF7ipZSMF8B1P0i/q7z
	XDDc84tAoxoM4bqZcpBC8nvTBphrzqqP04K8brUzZ+UYrgRXqy5NzmilmoxVuVLzpYVb
	ehVblA4YbFYYTL7zfvCN8pnoKFEx0pqSbrAyImCgx6FzgF6FUreT7VlLzFutltS5licw
	iHPw==
X-Gm-Message-State: ALQs6tD/8xs7vY2SekKigpS8HM05tvt4EhwJ1ohl2W9woF6Aqa0IYDEo
	uQaw3HuY47yAryh0ZfCIp21Z0qWTA749bXXoFEqc8A==
X-Received: by 2002:a9d:1b46:: with SMTP id
	l64-v6mr1660843otl.316.1523979483483; 
	Tue, 17 Apr 2018 08:38:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 08:37:43
	-0700 (PDT)
In-Reply-To: <20180417152101.GP24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-13-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_UP-DgPZPL8-sMAs9TFHiUrfya8LAxAnO2U_WJAMH6yg@mail.gmail.com>
	<20180412173625.GK24561@codeaurora.org>
	<20180417152101.GP24561@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 16:37:43 +0100
Message-ID: <CAFEAcA_QdPChiMPtZt7t_aqQTUcSDweGVG0anchKYH6KtEgEYw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v3 12/22] target/arm: Filter cycle counter
 based on PMCCFILTR_EL0
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksKEz5vQvgmB

On 17 April 2018 at 16:21, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Apr 12 13:36, Aaron Lindsay wrote:
>> On Apr 12 18:15, Peter Maydell wrote:
>> > On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
>> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> > > index b0ef727..9c3b5ef 100644
>> > > --- a/target/arm/cpu.h
>> > > +++ b/target/arm/cpu.h
>> > > @@ -458,6 +458,11 @@ typedef struct CPUARMState {
>> > >           * was reset. Otherwise it stores the counter value
>> > >           */
>> > >          uint64_t c15_ccnt;
>> > > +        /* ccnt_cached_cycles is used to hold the last cycle count when
>> > > +         * c15_ccnt holds the guest-visible count instead of the delta during
>> > > +         * PMU operations which require this.
>> > > +         */
>> > > +        uint64_t ccnt_cached_cycles;
>> >
>> > Can this ever hold valid state at a point when we need to do VM
>> > migration, or is it purely temporary ?
>>
>> I believe that as of this version of the patch it is temporary and will
>> not need to be migrated. However, I believe it's going to be necessary
>> to have two variables to represent the state of each counter in order to
>> implement interrupt on overflow.
>
> Coming back around to this, I don't see a way around using two variables
> to hold PMCCNTR's full state to make interrupt on overflow work. I
> haven't been able to find other examples or documentation covering state
> needing to be updated in more than one location for a given CP register
> - do you know of any I've missed or have recommendations about how to
> approach this?

Can you explain the problem in more detail? In general it's a bit of
a red flag if you think you need more state storage space than the
hardware has, and I don't think there's any "hidden" state in the h/w here.

thanks
-- PMM
