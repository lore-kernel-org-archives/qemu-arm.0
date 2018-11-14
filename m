Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5950832wrw;
        Wed, 14 Nov 2018 08:50:36 -0800 (PST)
X-Google-Smtp-Source: AJdET5e4uZIFc8WspqF6vYwFwMOC9ftC8/NhZgWHN03Ka46nZI4dnMyOLLucl8JtDxQEzSjRk6eV
X-Received: by 2002:a37:d994:: with SMTP id q20mr2488019qkl.116.1542214235985;
        Wed, 14 Nov 2018 08:50:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542214235; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9aNPWmmVqEWAHTDs8S8/K9h723FVBRfJtYI44mP7yMcPZez6m7TWQAZ2RCa3yv2Wu
         VCbkvokr/bAQjHojaa/VjGbKCr8ykXnhHudoyhd1ADH9qCwgrNI+mi5Iw78Q74ng+NiD
         MZDG0NaFSmVZrJ+XFr92txSTpaWvltCsRMQVQszWPtK650uFriwftmdAcyIVcXFIPPd+
         7MGyOEgMIMdoo6U6OEH7RJt2aQAZXu8gVsYhHIEr6bTIS+WPw1QlAg/CFya90ng/MVwU
         6xzAAh64Qoq8zeyvN50xCOmznKAJ6smgHyFmk9HDoXHovh5b3zPdtl8wtTEPKHMq52w9
         WG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=D+8gDHbqCIlprRJaBi3BOQVf87MY0tyrLJlqgJxjhlw=;
        b=WMZ2TDVNmDUZUaWCz+NY+QmPJALyDyhBLP+KDN/VERPTbQgakgnzOxPIeomONyYGhg
         SmNGHIo437uZBpJ6dRz2BWtTHLO9y56gxDjIxbp0tc4S+f3NPykYbSdyVAp9Xoo5lTRN
         6CUhYRtwyX64DAKFXZR2yFZLNzLwyt0F4T5A6DD0Gq0LXEdKaXW9Jf6RLD6fZZYhCfQU
         j+miEOTt6nc/Vg35mju8kgNgnHjgzXf9rDJp4T5/i5VeOKZEBIMoJw97DnlwMqOjUXEz
         B5pW/hZwowj88Z57Xu+ArP8x6K5Hbo5wAI3+iJQG4V44YN5qIjq+QiFpJoZHNqOkyMMm
         3htQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I7DEiE1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n37si1295000qtc.72.2018.11.14.08.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 08:50:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I7DEiE1j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMyN9-0002Ud-2Y
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 11:50:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMyMw-0002UR-0b
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:50:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMyMu-0001wc-R9
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:50:21 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37377)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMyMu-0001rC-FJ
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:50:20 -0500
Received: by mail-oi1-x241.google.com with SMTP id y23so5041700oia.4
	for <qemu-arm@nongnu.org>; Wed, 14 Nov 2018 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=D+8gDHbqCIlprRJaBi3BOQVf87MY0tyrLJlqgJxjhlw=;
	b=I7DEiE1jh+0lJn1JHIbpoY6sdtbb+Fxf/+r12B6dOGVw0n/cWK32zaekRqEUXRnjqx
	5IAueckY12hr1o/yJVbTth0CGimXC4PZWwS/BkCWr/H8ApVhPGiLVwMhIzQdgLh9RFHN
	nzMBtXRQ3hwhfSRIYB9bj5qHkN3p64y2al1TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=D+8gDHbqCIlprRJaBi3BOQVf87MY0tyrLJlqgJxjhlw=;
	b=U47WmqUw0M2lxJmxx8JPYtFjruGZxtM8VS9Q/4xPUZz6VKZlLyDzrLJnxzKvH6rpZo
	4LKDCutEC7BHAQ5HccyblNaxUX1FzVSsr6DUaHGo6qzV3atasc3wcxJI1152qWUYj7FT
	qOGwoauX2jzQNyj5IQOtSR4RED2ZcrS+jiWPuP8gYKu421x+zbg+zu1pJL0iLmurD7cS
	sLXaxcQQtsSzSUkV/hW5tImvGxHfN0KKHMHSJm9w7jpFaE17bXVHH94R8Bhk/8scq0en
	CZ0ILvcZavEYLb73hYE1AE2Pxgr5Mq1NQflCUu3i2Ab2kEa8sfTAJ3BBqU3P2WNSNJWr
	tzHQ==
X-Gm-Message-State: AGRZ1gLe0BaiiZH6mrN9mq+hLVISAXcLbBXPmrXhqDfF1X+G2gtKUrgW
	oTXqpV1MkodLTI8aMJ8oc9I5htfkwa/nBcGTVJrwpQ==
X-Received: by 2002:aca:ed51:: with SMTP id
	l78-v6mr1421086oih.112.1542214212357; 
	Wed, 14 Nov 2018 08:50:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Wed, 14 Nov 2018 08:49:51
	-0800 (PST)
In-Reply-To: <c0601dcb-142f-3033-b11f-1b951aaf0e3f@redhat.com>
References: <20181114132931.22624-1-marcandre.lureau@redhat.com>
	<16b78816-f2cc-a1e5-0d21-906fc2dbaa3d@redhat.com>
	<a2d9a2fd-2c1a-66e3-86ba-17da9f564e79@redhat.com>
	<c0601dcb-142f-3033-b11f-1b951aaf0e3f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Nov 2018 16:49:51 +0000
Message-ID: <CAFEAcA85vaAoo9wJLC25kF00MyPrAoTu_TSZ8NXxym8q7EhArQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] vmstate: constify VMStateField
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
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <famz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FzuQw+GZfM2s

On 14 November 2018 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Hi Thomas,
>
> On 14/11/18 17:29, Thomas Huth wrote:
>> Please don't. For rationale, see:
>> https://www.kernel.org/doc/html/v4.19/process/coding-style.html#typedefs
>
>
> Thanks for the pointer, I am interested in understanding why not do that.
> However in the link you pasted I don't see a rational about enforcing
> constness, I understand that since this case doesn't match the 5 rules, w=
e
> should use 'struct VMStateField' directly and remove the typedef.

QEMU's coding style is not the kernel's. In the kernel, yes,
they prefer "struct foo". In QEMU we generally prefer to use
a typedef for most structs.

thanks
-- PMM
