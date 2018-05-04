Received: by 10.28.4.212 with SMTP id 203csp221015wme;
        Fri, 4 May 2018 09:33:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr2IzWe+Fm+VXRscDdLWOv2uUOhKn/PXBTvcTvaoU3ij5OGo/JtdF1aFPmPoGLeT3EX6k05
X-Received: by 10.55.149.70 with SMTP id x67mr21836157qkd.202.1525451632967;
        Fri, 04 May 2018 09:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525451632; cv=none;
        d=google.com; s=arc-20160816;
        b=wC+JGdPFqiJ3LwHizwMA18L451na03FSpt2mskWz9C+awrKX9NHINIx+NLH05seYAh
         7DSP6gImmDTOWN1rOSX6p0soW1cPTWLLBlcKvkUllfEdKYzO95cG8IuxP7Scx3PKKJfx
         Lio76QsCMZanvIkiHzrEIvdKZIu28B4he8mzJ/DNDJc/x9xSEC78kas7Hy+3MYf1nvdY
         a1X8b2qu+3/YgfKrPx4bvsdMaSZ0EPhiGSkSxswG12GLmD0mel9V5iSUN+nyX1NAVYLI
         MXabgwuZ5q7VdxwEjROOxFybJ8b1XpcIICapFRV41F+lrHjqHm+aPEzpMLyJy67CRrl5
         ypVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zGqFGQc5Czfb5QUXQ7NmdwU9wWURV6bhuTvqnSbPTTg=;
        b=wB2UNSTD3MrFiawFUAWxtr6JiayI1OObhSCi/F5DKP5LSIxcOIue2vcE/D0mB5iLfN
         ar+O0B1N+bBbBv/avvp3lRgcUatYHJNalkcLCMXT87B0UV8p+WUSFN/gq79IEYG1EpDy
         Dyc4tqKnTupH01FgunEErKKB1+aQT+WCCHneaadtQobKim7aRbxYlPabp8cA90m/pXZL
         XEr21XefdF07gKZzep4bkavIoQ0gS2seTjoFvu19eN3p1gnf079bYp5AN2a/l3rJ/obW
         F15vVpzYZWkHc1WFBUGWAPSHOFIOjlc6pBq0KD4kjglVcvLL0Z0rMXeV5sUwF6zPICiA
         F2Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XsHLkZgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h89-v6si980041qtd.54.2018.05.04.09.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XsHLkZgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdea-00065U-EU
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:33:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdeJ-00063X-O1
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdeI-0001P0-S4
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:33:35 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEdeI-0001Oh-Mm
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:33:34 -0400
Received: by mail-oi0-x241.google.com with SMTP id l1-v6so19664563oii.1
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zGqFGQc5Czfb5QUXQ7NmdwU9wWURV6bhuTvqnSbPTTg=;
	b=XsHLkZgDIyulFEVWXQH/h87J5oatqWuS31XlDO2/Xa+Yg8XfsaCnAZknVHtb6IDFZE
	72q0wzoyoao206UdWN2Q1Nk3y7ugfeidjfBwP9L+6tcrIQD7EtA8RojxDD/c3LILQiO6
	nzIiC2exE2fgUrPZsjbrH2qySRpnVn9kWFTR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zGqFGQc5Czfb5QUXQ7NmdwU9wWURV6bhuTvqnSbPTTg=;
	b=p0ond8ssHQ6aVoFJZRi076iamaTnR9mjq2JLsz6C15FCZTC2+0j3EFId3YU7KILyZp
	RPxGJdt+VPQrBdLC6e3t1JqXD178jWggbAp4FgDX2851SC8PC6BwnQUdM60vO9Cml9JS
	b/zaWLzMS74lWzaYJ7rlcL4HRLA9THCfBozxeD5ULdS7+AlD+JwQPlFL21Z8R3rJLN9t
	PaS4mvJRcTp+JkiBsL32vLI3Ei7rMpUYftJ5Y/jW2Qtcd8MvY8R/99R7KLo4+80iFdmR
	qQfrK0vVlC6VJH1oX89WEDJMU6bORpUGOIkEGLI6NOUCNpY/8xoqE3Hbi1Ep7D9LmCaP
	GVLg==
X-Gm-Message-State: ALQs6tBAuAXjN8+pg/6rQtFK79c998YyyAEE1ufj8+yUvUQce7knfGvv
	sTpIsAbExLybkIWADoMxCdifSsLDw07nrOj6W+EUSg==
X-Received: by 2002:aca:4ac7:: with SMTP id
	x190-v6mr16027466oia.11.1525451614075; 
	Fri, 04 May 2018 09:33:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Fri, 4 May 2018 09:33:13 -0700 (PDT)
In-Reply-To: <CAFEAcA-JF1aeT1tcmLnyayRaEtHM2bY=77kQ4pOO_wLgAKk1Sg@mail.gmail.com>
References: <1525326811-3233-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-JF1aeT1tcmLnyayRaEtHM2bY=77kQ4pOO_wLgAKk1Sg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 May 2018 17:33:13 +0100
Message-ID: <CAFEAcA8CVM8PL8Uxv2_h9L6GXfgJc-ptkNhOL_dDZ5rqJSUjog@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Don't fail qtest due to missing SD
 card in -nodefaults mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J9cPoTmVoBRb

On 4 May 2018 at 17:32, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 May 2018 at 06:53, Thomas Huth <thuth@redhat.com> wrote:
>> When running omap1/2 or pxa2xx based ARM machines with -nodefaults,
>> they bail out immediately complaining about a "missing SecureDigital
>> device". That's not how the "default" devices in vl.c are meant to
>> work - it should be possible for a board to also start up without
>> default devices. So let's turn the error message and exit() into
>> a warning instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/omap1.c  |  8 ++++----
>>  hw/arm/omap2.c  |  8 ++++----
>>  hw/arm/pxa2xx.c | 15 +++++++--------
>>  3 files changed, 15 insertions(+), 16 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...and added to target-arm.next, which is what I meant to write.

-- PMM
