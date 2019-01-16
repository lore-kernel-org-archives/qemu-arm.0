Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp382458wrt;
        Wed, 16 Jan 2019 02:03:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7yDpFnrkroFFXUbCcOs8fMCB6f8HGk17pFrkZCoShKwCyvYwqBFH/EHzsKRNdDGQ3hjMn0
X-Received: by 2002:adf:a14d:: with SMTP id r13mr6540895wrr.169.1547633023670;
        Wed, 16 Jan 2019 02:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547633023; cv=none;
        d=google.com; s=arc-20160816;
        b=oCEpzHheXgFVYtg9Zni0Z0l/OlSnP7TS/EVI2lxaUYXvJYhRtAmzMMku4YLHU8Z8VH
         43cgEz43au1CE7DEX6Idp1jGhPSt/CWRkeCbeRm/tF/LenDoM4kc6GjeUIqyoBPsy72J
         Dw5Hqyqr5NtfBaGo7R9bdPTOB5/p0HVFK3RiiwaCXoXayvqvSKlFIv7vEDVhFN25MsoJ
         VPlt7Qlmaf10lXquLv29Zuw5cFfnl8I2S//bQNIrtiNWwyo6cj+1hhKBC6FJHbCsOhwk
         rzct2i0MW7hjhk+HOk2uCOwYRCUDN/bRvc3FWndju1soNOO/16mXchaEywgOA6X5FvXQ
         5WiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=ScEG0qXo8K/s74rzt9UPirQdwQIkOpvpShqNO7MtADI=;
        b=BEUpfdPFxwWXeOeOxHQ8n6RL7/Jsguo2vQqnqNOk+vmVI9mJwhJN1OOHEwc2czfQnW
         VwGi4wUJ7IoOGlKxE1YJO/W5sfMZCrZGr4hCFoCTjz+i1oHe1lp9twHyGNWy1qWy8FUv
         do6LlHJVJ/PRgF0Yy8TMIPiZQ2TFmND0mQZI9oW1q4XdFFwoE/jk3HqyX+/jVsunpaTN
         Zk9EeOqjPIGLNw4wrNEe/d0wLrql3QPiHACDspDH8O43Vhz2cM9hII62cGgj3NAN+XTF
         AnW5pqxFVq8CeZpFNbNMIn2FYNN7iccC1OJStMTqwCFuvdQqk2ZPgpbDkRusgurIP/9o
         AB1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n185si23011198wmd.86.2019.01.16.02.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Jan 2019 02:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gji2w-00018Q-KU
	for alex.bennee@linaro.org; Wed, 16 Jan 2019 05:03:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gji2h-00017C-Ey
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 05:03:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gji2c-00085F-Ud
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 05:03:24 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gji2a-00080b-MS
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 05:03:20 -0500
Received: by mail-wm1-f66.google.com with SMTP id y185so615482wmd.1
	for <qemu-arm@nongnu.org>; Wed, 16 Jan 2019 02:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ScEG0qXo8K/s74rzt9UPirQdwQIkOpvpShqNO7MtADI=;
	b=VXINEjPEWZ88U/cpgfIoVxDixPOt87SY4cne9Esz8UQdQNA2rfhyx2qoRspYY4oj3T
	/Io7w8PAZxV4jqY+zxmFqlD0ikfx9utWozAFsBAgU80bO4hFthY+KcN5tRk2ZhQBG+M6
	Nq0b0aBKAbAo3WzY+zZ77TbNsDszx6KtJtZMqaU1PDHcyMr3Z48p4Oijae2c9nhYNr3s
	45AYk6B0FoLvSHuI2qm4Ud5PNS/zVu+bo30LBeMqLfFU/0zKO0dz3W7J64otFtAM6tAb
	WuZb1sAHPX9rNXAIvSlxyDkPhCftK87KERClIqjTYt57Y/q7rPRoeFZlvoDP/pNIHHGU
	XJkg==
X-Gm-Message-State: AJcUukcuvmHVe1qMgmahxrTsnIx5FVnwHaei4WHoMiba1zYy7vw1F4tG
	F1xMWP1FAOlTj0Za3P5/z+4DkQ==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr6852774wmc.0.1547632998189;
	Wed, 16 Jan 2019 02:03:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a42b:b3f9:ec44:7a68?
	([2001:b07:6468:f312:a42b:b3f9:ec44:7a68])
	by smtp.gmail.com with ESMTPSA id
	g129sm32916072wmf.39.2019.01.16.02.03.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 02:03:17 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
	<be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com>
	<87sgxtatod.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
	uUHgL9dKIfvpm+rNXRn9wAwGjk0X/A==
Message-ID: <4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com>
Date: Wed, 16 Jan 2019 11:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <87sgxtatod.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus
 from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fWOD64ry2c35

On 16/01/19 09:33, Markus Armbruster wrote:
> What problem exactly are we trying to solve here?
> To the best of my knowledge, typedefs.h has been working just fine for
> us, and I can't see why it shouldn't continue to work just fine.

Patches don't have to solve problems.  They can just help long-term
maintainability, highlight code smells, etc.  Nobody is saying
typedefs.h doesn't work.  But it's a tool, and including headers from
headers is also a tool.  Each tool has its purpose and it is useful to
question what are the exact purposes of the tools.

typedefs.h is useful to avoid rebuilding the world too often if a type
is used many times as a pointer, but rarely as a struct and rarely has
functions called on its instances.  This is already a relatively rare
case, but here we're talking about files that are included less than 20
times; many of which also already include hw/ssi/ssi.h for their own
business.  So we're hardly rebuilding anything more often, also because
hw/ssi/ssi.h is not really changing fast.

typedefs.h is also useful to avoid circular header inclusions.  Here
hw/ssi/ssi.h is clearly a toplevel include for the SSI subsystem.  I
agree that includes in a headers _can_ be painful, but sometimes they
also tell you a hierarchy of what uses what.  typedefs.h doesn't;
forward struct declarations also do, and I all but dislike using them in
headers (Thomas, can you send v2 of the HACKING patch?).

Therefore, typedefs.h is not particularly useful for SSIBus.  It doesn't
hurt much, if at all, to leave it in.  On the other hand, it also
doesn't hurt much if at all to remove it; it makes the SSI code a very
tiny little bit more self contained.

It may be that it's not particularly useful just because SSI is small;
for example I2CBus is also in typedefs.h and it's used a lot more, maybe
one day SSIBus will be the same.  In doubt, let's drop the patch---but I
think it's useful to have the discussion and there are cases that are
not controversial at all in Philippe's series.

Paolo
