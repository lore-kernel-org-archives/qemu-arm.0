Received: by 10.25.15.230 with SMTP id 99csp837441lfp;
        Thu, 6 Apr 2017 09:37:55 -0700 (PDT)
X-Received: by 10.200.54.161 with SMTP id a30mr34037711qtc.167.1491496675221;
        Thu, 06 Apr 2017 09:37:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a45si1824822qte.100.2017.04.06.09.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Apr 2017 09:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cwAPy-0003CX-Mi
	for alex.bennee@linaro.org; Thu, 06 Apr 2017 12:37:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cwAPu-0003Bu-Vq
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cwAPu-0000Cq-65
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:37:51 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:33061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cwAPt-0000Bf-Vm
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:37:50 -0400
Received: by mail-wr0-x22a.google.com with SMTP id g19so27230801wrb.0
	for <qemu-arm@nongnu.org>; Thu, 06 Apr 2017 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rLNu8Xrz/qoFDaVsEVsULrcXR1JP1p3IltS4mcuZ8+Q=;
	b=BD58TytB+uuwDQW3Ae2FS2C/BaOJUyPkq5kt7QdJd/pFBak672vob/jiIJhbnTES5Y
	svFA0ZLmxQIIdzupNJrUb55jIIaHjQp5E+3KaiNMtX7AI/CMT6pmfLFqcfWql9HdDJ/X
	8mDjiams0iI9pfc1nV3qRSO0yl0NjNn22qcfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rLNu8Xrz/qoFDaVsEVsULrcXR1JP1p3IltS4mcuZ8+Q=;
	b=MbWKswv+6TW87sn0dG5MCLT+H9vh5drVhj9Adco4KyZNUaAa+zs7czR1RF6dn7Xc+D
	KFJFVg6cQHNMqKhJYza+i7QchMPpLL3ztskf6zEHibLqJhFoj1vS1uUIohXLS1Am+dDF
	A5VkaJgBfxzPFv8cTsg6a5LpbYbNtUZwB2dpkY8jCEtbC61/8N/PG7VDyeAaMAREM0k/
	uBkWtXzRh1uQFPcM7sUpxI6IhVw5ieNgGIkvfsnu8PASIEPLoO+WFoAbUeZIeEccR7sX
	GAkM5vFjFRGFmTA14+gYUPXU9iy6j7Wk3NXPn+GSQokErQAB1Hflof0OWOMlbMnDdwec
	rdjQ==
X-Gm-Message-State: AFeK/H3JD1l+/IdtKYKAJ68xIyUR1As1uNzJxrvDIYdHUXIoFm07IOAyTh3YXnZFrIg/HKRqjQlfUVMegtEk67Mk
X-Received: by 10.223.150.149 with SMTP id u21mr11811305wrb.195.1491496668806; 
	Thu, 06 Apr 2017 09:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Thu, 6 Apr 2017 09:37:28 -0700 (PDT)
In-Reply-To: <419a5b1f-5442-0105-d5f3-e2ab08f461bd@amsat.org>
References: <1491486314-25823-1-git-send-email-peter.maydell@linaro.org>
	<419a5b1f-5442-0105-d5f3-e2ab08f461bd@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2017 17:37:28 +0100
Message-ID: <CAFEAcA8a4a-dm5K63uJJCWW3W2JQOrmRKWFFfiyb0_v_G_yf5g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-arm] [PATCH] stellaris: Don't hw_error() on bad register
 accesses
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vK+DN+QuaTej

On 6 April 2017 at 17:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
>
> On 04/06/2017 10:45 AM, Peter Maydell wrote:
>>      default:
>> -        hw_error("gptm_write: Bad offset 0x%x\n", (int)offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "GPTM: read at bad offset 0x%x\n", (int)offset);
>
>
> use HWADDR_PRIx to remove this unnecessary casts here in following change=
s?
>
> ie: "GPTM: read at bad offset 0x%" HWADDR_PRIx "\n", offset);

I don't think either of the two is clearly better for this
sort of case where the offset is known to be small, so I opted
to leave the code the way it was already written.

> either way:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks.

-- PMM
