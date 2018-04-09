Received: by 10.28.71.155 with SMTP id m27csp2822544wmi;
        Mon, 9 Apr 2018 10:41:55 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48BK0Pyc16r2oMEgfpEa5k+8wQp3SgZbpqpu8u7GeUNHlfsEJibiuFjzzb1SKNJPkxv6CVc
X-Received: by 10.237.63.208 with SMTP id w16mr54992390qth.315.1523295715850;
        Mon, 09 Apr 2018 10:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523295715; cv=none;
        d=google.com; s=arc-20160816;
        b=uaLekpRlhcvf9ZPalHEPSJCp9oyc4yP2JSPE/Ks7ztqeFwrxTmZkd71vqWBM/whP06
         KkV5tWqwuFPS8LYdnp429WfFz377ub/aK09AzP1qWbSU8c5ltTpTJaHi6SBSszZ9MGTZ
         EkpcYfgMvicJlL/548AxAJVG6Y02qBQxdKWJ4JaE9v2A+sDCxlf2ScK2zQuiCJHyBM/v
         1ZsRhyRnBmQ6WqbEJ21CbsozqNFkJFe+1zJDVid7abp2iIjxe4eASScCjNA1R9XX+6SZ
         vlIOOFdPtqO/Nc16Fh7YQ7sbnvbhlKFjUsNnmSxLkx7KasmhkCoh3rwyPFzkYWIFaf0Q
         BDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=k6RaoNxvqusLfAEsaQBsVGSQ8EzGSUOaGHzfMvFIMZ4=;
        b=NQmM/MkENUvK4UsBJcKDZ6qhm3hWNsfM9ejsNkYmYSiWy4qXpR9uSgJkbr3uyE9FhN
         Wb/n0qaWX95a9JFfoCiD35xcz9aGI2Mfmwac8yNoNSdyH9clUMKQTIdzplxE7IOJikDO
         ailvl5aju5EeCFI0dwf/oh0SGAdtWpGPcO/EJ+EJbE0Cm6Mz4bAkyNfFFuUoDyHw9Ve1
         vchrz/eZws40bjxYJUuNI0di5nbH+Po+dkaTUWzmo9vnBlyw2OenPwaq6kyOLcv7eswc
         L0zzVWlKDxhn6ozh3uFELVliHSoWDpac1WNIUFfg01GWsryCI612UkEZi6MYVxYqVpT0
         T5pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M9CIJ8w9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si984809qtg.30.2018.04.09.10.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 10:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M9CIJ8w9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5anj-0007Bq-8z
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 13:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5anY-0007AE-IK
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 13:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5anX-0005IT-5I
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 13:41:44 -0400
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:46386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ajaygargnsit@gmail.com>)
	id 1f5anW-0005HW-Sk; Mon, 09 Apr 2018 13:41:43 -0400
Received: by mail-lf0-x234.google.com with SMTP id j68-v6so7782335lfg.13;
	Mon, 09 Apr 2018 10:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k6RaoNxvqusLfAEsaQBsVGSQ8EzGSUOaGHzfMvFIMZ4=;
	b=M9CIJ8w9DIBJ0AfnjWL5UsVAsVVUKsBNNXaJLR0OSITsRXd52bZCxKm60eyXHVv/Yg
	lfT1sJoGcSz6Ley0XuzoyJTar+frtWSiFlYh3JXzXDkYPGCzhK4FPkirvHsA1cN+fARA
	XdOr031ef2uBXO4J2Q+VlGHPX64+VyjafbRhq3Gc5kkhqvyFDMH6mvoKrXJzo6UUuzWt
	5qQ3W79nIrr+VxNXEst5buteirW/p/tWRc5V+9bWFaTczESbKPgwOzuJd4L/KuRcWwBq
	W/dgTk50re6dlO9OtUlhjJIUsW0PNS6opUpC0jUVl2T3wYG35WV6zQFlTtyp0mD6deKd
	q95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k6RaoNxvqusLfAEsaQBsVGSQ8EzGSUOaGHzfMvFIMZ4=;
	b=qSLwTIAdzhjvEjNSfkePRZnYkOqzUN0HmjpZlNp56YrP9qX1RQRJs4ZB/zD5+g4xWi
	qpbrUpqWnemj35HZ8C6WW1s4yigsNQEnFEeMK+MlGBxo5qwACzcKo0a7SmaZ88kAMM4p
	Z7c5lQuBnZQR6eJsXqq6iJF38aAAqrcElNuUtVxB1egnf/Y7BqZRKgLa/7ywn9HwU8rV
	Y6nSHF8dZzsjQ2shxGPWVtbs1+bUjv73w25S6PUJ7RyvhLhBRxKTQpu2JVyAcoYvjjT6
	9FHj+2Q89VDChaKcoX8M6161HRdtfL5lrPF1U5JrtF2LCIlMQUgDdWYKU/W0KuQLJSN9
	J8Mw==
X-Gm-Message-State: ALQs6tAyKnhNQYuSeWdrfryFpD37Xd/2l7+NcqnEe2kqFd4EQAFGK8Er
	XBxDrie/PXvtdAn1U5XP4q4GnDKIWuDRWL8c2/g=
X-Received: by 2002:a19:e418:: with SMTP id
	b24-v6mr22081602lfh.61.1523295700989; 
	Mon, 09 Apr 2018 10:41:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 10:41:40 -0700 (PDT)
In-Reply-To: <CAFEAcA_1X1AQ6j9pZQ8fEHmQCxRNK7EhGkohuLbTMpoPONe5PA@mail.gmail.com>
References: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
	<CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
	<CAHP4M8X-Dus1Z8UegDTaab5LvaiDAgQa8upsx_KdnPO+A-XoTQ@mail.gmail.com>
	<CAFEAcA_1X1AQ6j9pZQ8fEHmQCxRNK7EhGkohuLbTMpoPONe5PA@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Mon, 9 Apr 2018 23:11:40 +0530
Message-ID: <CAHP4M8WUd9QKTCETaKNa+VQ6hMLcND8dfdDAZ3QutieDaE1WKQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::234
Subject: Re: [Qemu-arm] Use of -machine when running via qemu-system-arm
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6m3jsQsMXlGo

Hi Peter.

The link is pretty good, just that I am a complete noob.

Maybe a more concrete example on the following, clearly specifying why
things work on x86 without the need of -machine flag, will make things
crystal clear :

Because ARM systems differ so much and in fundamental ways, typically
operating system or firmware images intended to run on one machine
will not run at all on any other. This is often surprising for new
users who are used to the x86 world where every system looks like a
standard PC. (Once the kernel has booted, most userspace software
cares much less about the detail of the hardware.)


Sorry again for my zero knowledge on the ARM world.




On Mon, Apr 9, 2018 at 7:31 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 April 2018 at 14:43, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>> On Mon, Apr 9, 2018 at 7:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 9 April 2018 at 14:35, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>>>> Hi All.
>>>>
>>>> Not sure if this is purely an ARM-related question, but I will be
>>>> grateful if someone could point to some literature that explains what
>>>> difference choosing a  machine makes (when we don't need to have any
>>>> such flag for qemu-system-i386 or qemu-system-x86_64).
>>>
>>> Hi; this is a pretty common question, which we talk about on our
>>> wiki page here:
>>>  https://wiki.qemu.org/Documentation/Platforms/ARM
>>
>> Yep, had already been through it :)
>>
>>>
>>> The underlying reason why you need this on Arm but not on x86
>>> is that for x86 every single piece of x86 hardware is pretty
>>> much identical. For Arm (as part of its history in the embedded
>>> space) the general rule is that every board is different.
>>
>> Yep, perhaps I am needing a more layman-kinda example-cum-explanation
>> for this, so would be grateful for some help in this regard.
>
> Well, the wiki text is the best explanation I have; perhaps
> you could suggest what part of it is confusing, and we could
> improve it?
>
> thanks
> -- PMM



-- 
Regards,
Ajay
