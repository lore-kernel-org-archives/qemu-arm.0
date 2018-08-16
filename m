Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1802303wru;
        Thu, 16 Aug 2018 05:39:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwk125dvaW9/USoSDTysGzBPmJmTMGMzh7O9XISXglygjLbzC6WScgyReCAbNpGQoW6vI0h
X-Received: by 2002:ac8:304f:: with SMTP id g15-v6mr30037204qte.279.1534423171845;
        Thu, 16 Aug 2018 05:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534423171; cv=none;
        d=google.com; s=arc-20160816;
        b=uFrRNuyDEEacPd1gLyD/3WdWi+2lZTHgp19sPeAjcNVxQ2y4uCmZRVoo+enX0xIIHx
         FRNV1M4vhowvLffD2SIQNgkNnqNZQq2z94+C8FtmN4KPD5YMgr9YViRvwusVOTrBo8JC
         oAoLUn2yMqJEaklIjAsUm8rAcBuTO2iDM1k6cAzp3pjyxi7ei2SDIay4B5BGczais1fT
         uETzLVMkLQ3qiuP+GznirBPsQX2dXBKcs3h98rzsneORMxroGxV9sH88dNhROOPIAc3G
         qohR/tLrOjqAlip+73gby3WYUbPmW9H8cBr8kD39rBoZ4YYvVCt319qFS2gg/KnU5X9x
         FeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7NXSQvR4MBH88RQiVlqub/ecInWrFko4tOJBiR9uBfw=;
        b=zSd6Tf4AfBSslqGMHYgXps2otTKURiCe7fDlfDfPBvOTyLUsAuC8LjVP5ADCaG8Ead
         kQls9J5+Yrjy9VYKoH3eGklpyNMITbT6M5ov718b4AxCXVCC7Eu/3rx1J7iV87/odV9n
         FfS/fuSLwNz/irhILTwQQAhjCjQrTbLZzUIn0kedMwHCqAf8h4DD26XM/YoCi6CC0dsc
         zRmCSaNCJcRt1du+PyhPRPseINBPH9kt7TXrRiY/OmmzwytVu2dIX8CEYBHai4vs3mK5
         GR7EfUgoqNm02G74ayHnRVnCjcxkS2y+qL6mkExS1aOaqTSiFlNnAkbgPI/xLkRESktZ
         NLUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bRI2SocJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1-v6si13922210qvm.176.2018.08.16.05.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 05:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bRI2SocJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqHYp-0004Db-BR
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 08:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHYg-0004DL-QP
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHYd-0006be-Vj
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:39:20 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqHYc-0006Zt-8j
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:39:19 -0400
Received: by mail-oi0-x244.google.com with SMTP id 13-v6so7718559ois.1
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7NXSQvR4MBH88RQiVlqub/ecInWrFko4tOJBiR9uBfw=;
	b=bRI2SocJiVIJPWy43bZuIq6QULufJLbT8cKLFOdkL6c4Rk+y8RSYophXQltjtFmZfZ
	+R/9hp+kpMWbyVjTN/ngGeZrfSUP3UazgJ8EwNU+cHmIy1YRc7Gs13UL6be66GxcKxvK
	QL8chiLuCiJEq9ONKnFyyC6k2rCJ87OAoQjdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7NXSQvR4MBH88RQiVlqub/ecInWrFko4tOJBiR9uBfw=;
	b=kaP9co9wlBAbKOXTjZAaAN2ijZ0PQes0KT9Fuz8JcqT8ffXP2Ni9uaxlY/TqEz8QHM
	fktoTKIl2JZlF2vkdXeCQcJB+XwqZDfu+JOeKqJDnY4BVTyPHgyn/DtBgP+Z9zqD63kn
	Jw6Tjzqpdya5T6IagNHmen35/yukTRJeNdV0SO87DEE9JbgTOslS7pticZr8fB1aacfr
	jIJzCilupABEpt68t8lTKpDbM0gBHH7wpTrJFu2VRT9eutm6XgOtLcBp5Y5Zl7QLr92K
	jPeRH39lgWFPeX7+DFzuaDw1lxhM4WqKwnAhCrBmcVwVAkYlF2oPErCXYGfCHHcrmycs
	XEyQ==
X-Gm-Message-State: AOUpUlEFVjp13YmOqLOwlPj+znPNhwQL37cKxJ1bNKCHfCgySonM8cLM
	go4MPFpDpYZCRMKhx90sPlaZjHCfsXzHSTNn9q2WEw==
X-Received: by 2002:aca:2c89:: with SMTP id
	s131-v6mr29775146ois.171.1534423155221; 
	Thu, 16 Aug 2018 05:39:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 05:38:54
	-0700 (PDT)
In-Reply-To: <20180814162739.11814-1-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 13:38:54 +0100
Message-ID: <CAFEAcA8p=e-C_U+wqjLjLyc9-nCC7R094_xD-xY06tzJCOz8dg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v6 0/6] arm: add Cortex M0 CPU model and hex
 file loader
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRCsGw09G50m

On 14 August 2018 at 17:27, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> This patch series:
>  * Makes bitbanding optional on ARMv7MState.
>  * Adds a "cortex-m0" cpu type which can be used with ARMMProfileState.  This
>    works thanks to Julia's Cortex M0 emulation patches, which are now all
>    merged.
>  * Adds Su Hang's Intel HEX file format loader so that micro:bit and other
>    microcontroller firmware images can be run using -kernel.  The micro:bit
>    development tools typically only emit .hex files and not ELFs.

Applied to target-arm.next, thanks.

I notice that the change to generic-loader doesn't include an
update to docs/generic-loader.txt -- could somebody do a followup
patch for that? Currently the docs say

# The loader device also allows files to be loaded into memory. It can load raw
# files and ELF executable files.  Raw files are loaded verbatim.  ELF
executable
# files are loaded by an ELF loader.

but looking at the code we also support uImage files and HEX files.
We should mention all of these, and be clear about which ones
require the <addr> to be specified, and what the PC will be set
to in the case where <cpu-num> is specified.

thanks
-- PMM
