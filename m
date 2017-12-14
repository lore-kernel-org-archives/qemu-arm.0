Received: by 10.223.159.74 with SMTP id f10csp6281434wrg;
        Thu, 14 Dec 2017 04:59:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBovMF65FxalgYp20oGWqSW6BrSF6KkDmfrohubL934aeSMyhcpPWwWq2erOLbUfg412dKPmX
X-Received: by 10.37.78.130 with SMTP id c124mr4128028ybb.383.1513256385658;
        Thu, 14 Dec 2017 04:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513256385; cv=none;
        d=google.com; s=arc-20160816;
        b=FEn1mPlBfjQKZWvvgF/OSSUFdcBxmgUIFFhnd3N6SClrSH+CNeaQQpOAncaqEpuE8q
         W+sicMmLgDnhC5KpYcoOAzIoVOwk1XFY3mBltL8Oc8AFTMJxsMImufCbauFljQiCVkHb
         MiCXn/OR/nWugggpnERtDlbe1eAhPOTzwOx4n4ryHomVmhbEeANDrHR7oUWCl6YZaM1F
         pXxS46tqGq2wogzKdZeRZqt6GSoM0ew/VyMmZKMosmyuwqa/lTDSFH1J9YMMGYEFS2pk
         UBxkN44jv3kBa3JoFhk5ntXoBq5i5B3xLbUI7NNUgf54SIDaMYx5+iQTUCPUIinuauMF
         ZMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KtAFaFeLSzn6o2z3nKP1MN5QGCyqrPGpUP9e5owjqd8=;
        b=YZPH7FFgDP0qOFHWsesusyILEEVSWGeyeEAT7ddY+wjlqVTq+LQwd3EzBYLUtP3I7L
         58/8U7Hosrf1DSWGymLtgCj41iEUhDtVEPEB24xv2LgKmHwAaJoX9KB0PbZ0yvZ9Jjrb
         uSg3KK7mR/RLV3E1/mXJHUmH37OGlLufVdkc8VPj/AWqAtoSFP5X7qPqf1N6TieMGm+g
         K7a1+0ih6a9mGC6yDKZwAfdqTVzSI+XOgR1Gpnit3vzfdjdmqpSok0nzIVrr5hr/1t2c
         pnx9PX1UdJFAOKYZEtvbyLwNoTH2UrSMcd4YFaW99UfHxzeO1FxPcwgXukExJxe0KvL7
         /l1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Prsl+g8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v123si803495ybe.829.2017.12.14.04.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 04:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Prsl+g8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePT73-0000Ce-46
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 07:59:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ePT6q-0000C3-El
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 07:59:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ePT6p-00018c-Jg
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 07:59:32 -0500
Received: from mail-it0-x22c.google.com ([2607:f8b0:4001:c0b::22c]:41962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1ePT6p-00017j-Dy
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 07:59:31 -0500
Received: by mail-it0-x22c.google.com with SMTP id x28so11251580ita.0
	for <qemu-arm@nongnu.org>; Thu, 14 Dec 2017 04:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KtAFaFeLSzn6o2z3nKP1MN5QGCyqrPGpUP9e5owjqd8=;
	b=Prsl+g8SGWCLJajnMLYwiNKN5CuSqZq5Cl/etthBH0GHhJg8Krk9ZR5Qo02HYmmzOW
	EsN7VZGDO7bdcnbLLY0sPSdl/oh3dRkiUNjRoLHCza5sPI/zTcXMyKx96fL5SMfmZKVd
	RSkwp4JfDP3bMOukMbk4Nwe7N9SslhcT5YaIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KtAFaFeLSzn6o2z3nKP1MN5QGCyqrPGpUP9e5owjqd8=;
	b=Anz0xcdJ5iIN+OOWI1WMRIP9xxQLQDGaXSrXjMi7vJjZcW3oyf0DTLdgqUe3go3J/q
	91uBhE+4IDTqnEeos0yZrX43NWvwFeOWSUcXxj0QgyoptUV5ied/e6r/t6i+f1aGhm3b
	+dxyCbf0qeHxFA2+xhz4XFpK/VODzafBZ1adb6Bhjbz7O8bRlo3Vqa1oWE5ixx8XHHiF
	egWncHPT+rZQ+wtuzub9neUwewLSlirsa42zla2+XjOkwCX0yuN9q7H6KtxodYyIYYIj
	QyGkhXTwf+GZweYENVfyofoRuTDXylk7W7o3MWOwjol3MG67DTgYW2u4/xqB6z8z6HVO
	9kqg==
X-Gm-Message-State: AKGB3mKRDPluIMfEmPAW0p5BfQ5PmK3AEx0lWljmqIhERM0h9A8bg7jv
	nmrgCmEHxvoAuHw7jKYTGw2ZlqNtorvbvciOrjnRlQ==
X-Received: by 10.36.78.212 with SMTP id r203mr3229232ita.58.1513256370607;
	Thu, 14 Dec 2017 04:59:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.52.2 with HTTP; Thu, 14 Dec 2017 04:59:30 -0800 (PST)
In-Reply-To: <CAFEAcA8HswEKDPpj=cM711rNU2zwPuDXW7886=Oa2HBDmZxdCg@mail.gmail.com>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8HswEKDPpj=cM711rNU2zwPuDXW7886=Oa2HBDmZxdCg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 14 Dec 2017 13:59:30 +0100
Message-ID: <CAKv+Gu970cDwifDV1kz=kBWTWzxJyuT+QUAVNkFawun5psgYVg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22c
Subject: Re: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
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
Cc: qemu-stable <qemu-stable@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mg0ORRMv+jIU

On 13 December 2017 at 16:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 December 2017 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The GICv2 and GICv3 specifications say that reserved register
>> addresses should RAZ/WI.  This means we need to return MEMTX_OK, not
>> MEMTX_ERROR, because now that we support generating external aborts
>> the latter will cause an abort on new board models.
>>
>> In particular, at least some versions of UEFI try to
>> access a reserved address in the GICv3 redistributor
>> (at SGI_base + 0x184) and fail to boot on the virt board
>> without this.
>>

Could this commit

https://github.com/tianocore/edk2/commit/28f8d28faabf50a82ef8d137308592c64ea9e2b6

have anything to do with that?
