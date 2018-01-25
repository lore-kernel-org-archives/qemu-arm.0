Received: by 10.28.71.27 with SMTP id u27csp1938241wma;
        Thu, 25 Jan 2018 06:42:31 -0800 (PST)
X-Google-Smtp-Source: AH8x227xBWqVu3N+PZvj3Uop6sSU2QqThNlGvT3FXa5wock0YzopPSUeMjPCFByStn5sosfCLWXY
X-Received: by 10.129.228.13 with SMTP id r13mr8686126ywl.34.1516891351060;
        Thu, 25 Jan 2018 06:42:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516891351; cv=none;
        d=google.com; s=arc-20160816;
        b=0edQeETqakn5W9m50PJbx5MF8GzPrXCCTrrtUTeQ7OcrZzqvuewsFVz8siPzFTEghz
         LmCIW8amMiIO5VUry8H5RDlfTKHx9Ok4GIt/NtCdBGlYUFAZhf3KQdMOOZLZT6zTFW57
         MuAcqDCqr5vZPcxuJbOyNC2EsXLZ/tbeQ7y2Vw7aWhCwcyA3nuwbYJv8/zL6aUNivoTa
         Q20q+RLnfdXy6QYy31Sau560YUM6lcZ+FpDBh5PttSVdSKr7aCA6wQ/JWzYSTREOoPkR
         ofbXilR0bvTTPO8rDVJtvIVA6cB/Wu6JY/AJ5Qm/+gmRRRFBdczStbb1tXE3gv6vck9P
         FZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fACIvFHJUsjKrNJakqwzS1JAlvpenWuN1w0eI+oac7Q=;
        b=eFIbd1bQEwT0NpKvBsw35aqerXKjpPUYXEx0Wg0DJ2gp1IDBoHvlh0n4Wl9NebSfKN
         SbndLPYLnt0HsZ+yyTRd1CrIGsBo1O4nP/fJdGp1chEmiygcPk2aFc2dPW5vR8VzgB1F
         uQY5vyRBtQnnLaAvyqzKgVnWnm9zdy7BMHPuybWVmek25m50UeMBoU7HftiVo5BMtYnz
         p5/btA5/FGkuzKmSBOjCfj5O6JFguM/SZIGTqBH6R9MMP2Bv+2/H4bHN1K35YqIJVkhU
         5eh0/ZjxaTvduM5RazTTBeli5TDQRjvpff6+LfDaxl/T/2ISafckxvzK58U6/SdT58gM
         +geQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KP+MVQ55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si487147ywh.548.2018.01.25.06.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Jan 2018 06:42:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KP+MVQ55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeijW-0004nm-Eu
	for alex.bennee@linaro.org; Thu, 25 Jan 2018 09:42:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eeijF-0004fW-O6
	for qemu-arm@nongnu.org; Thu, 25 Jan 2018 09:42:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eeijD-00007s-JK
	for qemu-arm@nongnu.org; Thu, 25 Jan 2018 09:42:13 -0500
Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c]:36167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eeijD-00007S-DK
	for qemu-arm@nongnu.org; Thu, 25 Jan 2018 09:42:11 -0500
Received: by mail-ot0-x22c.google.com with SMTP id f100so6875447otf.3
	for <qemu-arm@nongnu.org>; Thu, 25 Jan 2018 06:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fACIvFHJUsjKrNJakqwzS1JAlvpenWuN1w0eI+oac7Q=;
	b=KP+MVQ555ePCKoICTdSJltQ70u19P1otTTqBaIrZRABs3w8tmT9hgTBFjsY7Vlwlqy
	LEtKEgSl+aRzxRy71TyNeSouKJvltHzT0VmR8//MGLMQUL09fsGOAE4PN+1Gntq1o3j/
	sE33p6KiwRW4+402XhNY549sfkxZ6uvggh/wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fACIvFHJUsjKrNJakqwzS1JAlvpenWuN1w0eI+oac7Q=;
	b=fIwQQjeF7c5yw0b9/SaGyKKwriQeLrl7B7r9oplKyEFc0LdCp7Cub/hwzmQwF6tqQX
	wV7K0+EA66z4NrkUD1d2ZaXaRZldttg6M4Ggtb4JspfQ7KZSHKIBCccpdHM3KzklktK/
	0dNt9ZKOTVEbMPNdXzenXEJotgVBgZ5x7GM5LvSlswDrJiWGOxFDgDN+IKRi1bS881Pn
	HkRMYjs/toMRAcBOT7A2/WM/ito38LhLCEIAf9ktFrHyBAfMEOVvuqQGnFxuuUs9KP1s
	BtIUhvQ+8s9U9FTHEwt6HVi2qk0i1Atxz+DkT61MSk/dotePXpYxF043zF5t0MepYANp
	ghDw==
X-Gm-Message-State: AKwxytctzjNThLIXh+NoZJzVwR9AC9mIwpdThWd6SOglqSL3a4qH9ZFp
	kUBxpk+Uyqbh+wJ35CYt++cIRstKaLq4DB+7XXc1cQ==
X-Received: by 10.157.29.247 with SMTP id w52mr12305394otw.91.1516891330673;
	Thu, 25 Jan 2018 06:42:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Thu, 25 Jan 2018 06:41:50 -0800 (PST)
In-Reply-To: <20180122183301.GA31237@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jan 2018 14:41:50 +0000
Message-ID: <CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22c
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2R9BeSzi5Ktq

On 22 January 2018 at 18:33, Eduardo Habkost <ehabkost@redhat.com> wrote:
> About QOM type names:
>
> On x86, all CPU models are resolved to "<model>-<suffix>", and
> i386 and x86_64 have different suffixes.  So the QOM type name is
> "max-x86_64-cpu" on qemu-system-x86_64, and "max-i386-cpu" on
> qemu-system-i386.

OK. Looking at the target/arm code we do a similar suffix
trick, but we seem to have cut-n-pasted the handling in
aarch64_cpu_register(), so it uses the TYPE_ARM_CPU as the
suffix, rather the TYPE_AARCH64_CPU.

Am I right in thinking that we can fix this (changing the
QOM type names for all the aarch64 CPUs) without breaking
migration? (I guess I can just test this easily enough.)

If we did that then we'd have, like x86, "max-arm-cpu" in
the qemu-system-arm binary, and "max-aarch64-cpu" in
the qemu-system-aarch64 binary.

Does x86 provide a way to say "give me the max-i386-cpu"
in the qemu-system-x86_64 binary ?

> About how it should behave:
>
> An important expectation about "max" is about the
> query-cpu-model-expansion return value.  Having a property set to
> true on the return value of "query-cpu-model-expansion model=max"
> means the corresponding feature is supported on the current host
> and can be enabled on the command-line.

On Arm when I try to use this I get:
{ "execute": "query-cpu-model-expansion", "arguments": { "type":
"static", "model": { "model": { "name": "max" } } } }
{
    "error": {
        "class": "CommandNotFound",
        "desc": "The command query-cpu-model-expansion has not been found"
    }
}

It looks like we only implement this QMP API for x86 and S390
(via #ifdeffery in monitor.c).

I'm not sure if we actually support command line setting/unsetting
of features for Arm CPUs -- is there a command line option to
get QEMU to print the features it thinks can be set this way?

>> (The code in this patchset makes '-cpu max' give the same
>> QOM type name for both qemu-system-arm and qemu-system-aarch64,
>> with different behaviour depending on the binary. If that means
>> we don't provide the same behaviour as x86 then I can change that,
>> but I'm not sure where the difference is exposed to the user?)
>
> This is not how the QOM names work on x86, but I don't think QOM
> type names choices have important user-visible side-effects
> today.  Choosing unique QOM type names is more important to make
> the code future-proof for when we merge QEMU binaries, than to
> make user-visible behavior consistent.

Good point -- assuming it doesn't break migration I can fix
the aarch64 types to use the right suffix string and then they'll
have different QOM type names.

thanks
-- PMM
