Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2725265wrt;
        Thu, 11 Oct 2018 09:20:39 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60d8Bpcwm2WkTRc1tt0jQcfSv0Ojxd7VmxhkwTFQyNmYu1Yl5D02LLOOvvoONPq4FKDPjrU
X-Received: by 2002:ac8:1a95:: with SMTP id x21-v6mr2227588qtj.44.1539274839241;
        Thu, 11 Oct 2018 09:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539274839; cv=none;
        d=google.com; s=arc-20160816;
        b=hO+VB/xgheFGX9v0jC+XSgZBZFIVbGDVOaAgcTVbOk+utuYh8k0ZB0XDn7BaHY/Lp/
         BrUsWgk9e5dsru+OHp1mE5XTi4AHyXmyMu3XPYjKYZUnGhRFAREqGY7p0XwJyLg78x2I
         53gPO6MO++ob1SUOYqdAcaXniHY2CO88CaXQsENTewungB+VhcAONw8oilPjatD0IKpE
         VvzlZObLtGLJFZ20Mx09vYRGmis8a3k01DvcO128kb2Zoz6d7T8w8jE8q9gLFDE2BmZi
         6tDH151+mvFs8K54biFXS91nZuWlT7d4A3n2Us2Taa2V8VrgwV3Lkd9qMfXX0X+CCjAw
         HLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=Mxim8UKpYB36R18DBfNzbpKG7nVwLhDEFkykqIF6mIY=;
        b=K+jV7JRUaczFDBjiUjv17HSQyhhTbtrP6noZa59E75O9CaQRKwA3BQpihbpi9IeBif
         cGVB9PK33qFImhFcL3NhQxb8BFrvZC38/TIeQaafZX9/eF+COfNsx2Aj0ebHzKHILHjm
         7u+7I1MOKBynyeASjgIpdMRKlgbAvGKVTEbWYrdIzrL/rPrPYK+BpzobD3AjQQafuzCF
         XiXFBLbrKNpdw6I0d7tvvxlRl+v5cnExrHWn1FZoNyZsnyTocGZy3PsJ9KnyPADT88y3
         uq3hmC5p2P0Qqm0usVr3Wz5M/uBUUu+yFWTrsvwD9W6BE8y5wvivFejEUkfiifIj/l/d
         rXvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=SR1VuTgr;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QkdIPeeA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QkdIPeeA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d54si2596999qvd.147.2018.10.11.09.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 09:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=SR1VuTgr;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QkdIPeeA;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QkdIPeeA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAdhW-0006mp-Nv
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 12:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAdhP-0006mc-5a
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 12:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gAdhL-0005mS-7O
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 12:20:31 -0400
Received: from greensocs.com ([193.104.36.180]:49507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1gAdhI-0005fh-HS; Thu, 11 Oct 2018 12:20:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 939DF6FD87;
	Thu, 11 Oct 2018 18:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539274813;
	bh=7AK0WfmqhkbPU6UOj7O71WJnGz0MbSRyLGX18PT8UUU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=SR1VuTgrf6MQmm6l7MgNpwVP3lQuBz1JlpLGkFsJQ5huqoR8QtM3Cm7pZxmrYJXJ4
	0OVIav856LeLlIJFJDo2DgPKWFaK7M+KjllHf65gvQP3QWVxNdaO8RMpPfT9QyCjiq
	OlAsA8TZTSGA2nJF/JKPER2oaZ9FDHZnh0nVfQS8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QkdIPeeA;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QkdIPeeA
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JP8wEUsyW8j; Thu, 11 Oct 2018 18:20:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id C708A6FD8B; Thu, 11 Oct 2018 18:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539274812;
	bh=7AK0WfmqhkbPU6UOj7O71WJnGz0MbSRyLGX18PT8UUU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=QkdIPeeAipqV3/Og/bG/3I1/suvTLnWxCoXVNiceyRvHIQQI0MH4iZIG8NgnUvAUp
	tpFgF2nfbIV/0bM01Ozk8d4hqXofT4uvQM6ql1M+H89Mx/Ql/lITdmDOmr490nN1L+
	vJSqlwSdbxKZ+7xY5TDsr2SG3rZnvoV4+dWBQuog=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CBBD16FD87;
	Thu, 11 Oct 2018 18:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1539274812;
	bh=7AK0WfmqhkbPU6UOj7O71WJnGz0MbSRyLGX18PT8UUU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=QkdIPeeAipqV3/Og/bG/3I1/suvTLnWxCoXVNiceyRvHIQQI0MH4iZIG8NgnUvAUp
	tpFgF2nfbIV/0bM01Ozk8d4hqXofT4uvQM6ql1M+H89Mx/Ql/lITdmDOmr490nN1L+
	vJSqlwSdbxKZ+7xY5TDsr2SG3rZnvoV4+dWBQuog=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <2dddf6d3-4362-9ed1-18b5-f927e850c10f@greensocs.com>
Date: Thu, 11 Oct 2018 18:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/9] Clock framework API.
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	Thomas Huth <thuth@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ifrE10Gbioa


Hi Philippe,

On 10/4/18 6:13 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Damien,
>=20
> On 02/10/2018 16:24, Damien Hedde wrote:
>> This series aims to add a way to model clocks in qemu between devices.
>> This allows to model the clock tree of a platform allowing us to inspe=
ct clock
>> configuration and detect problems such as disabled clock or bad config=
ured
>> pll.
>>
>> [...]
>>
>> Any comments and suggestion are welcomed.
>=20
> How would you instanciate devices and connect their clocks from the
> command line (with the -device option)?
I didn't not thought about that. I'm not sure to understand how this is
done for a gpio for example. Is this done by setting the link property
manually ?

If that's the case, I suppose we can somehow add a link property on the
input side to the output side to achieve that. The other way seem not
possible due to the fact the output side has a dynamically allocated
list of inputs.
>=20
> Should clocked devices have DeviceClass::user_creatable =3D false by de=
fault?
It would be a solution, but I don't think we want this ?
>=20
> Thanks,
>=20
> Phil.
>=20

Thanks,

Damien
