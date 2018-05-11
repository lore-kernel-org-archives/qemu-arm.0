Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp970515wme;
        Fri, 11 May 2018 09:31:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpyI6K7JEyZ0Yf8lw+91vRHCoSpPgEuYgrVdj9dzoEiF59T6zEHaxT0UrjqZF7jV1YJN3p/
X-Received: by 2002:a37:b0c5:: with SMTP id z188-v6mr2824169qke.133.1526056307166;
        Fri, 11 May 2018 09:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526056307; cv=none;
        d=google.com; s=arc-20160816;
        b=YQYdmXl9orLxhybhmuak9SUjG0JlGgvOXypPyP4XYxJz2i7nFVHCZC3ULYedOg0/M7
         woQZtIJi9AGVf9thUnYniQvdc5pSJku3qiW4hOW2PM19njPOGY7dWhQF3YdNXXe/Ob50
         FG2Y2b0Zx62wPrmyWDL9+rF9Aov3+uLJN3BU6GfFQYBakr+E6NwYalZf3GEInOL1NreP
         SA/0BvVhd/FM88BqWbw34CESwJff7P4LUg/nQctZ4Du5kPu2sfYU+SU02xNb81/CArSV
         o/jnI17yw9UtNHeNXtQRRKcYwm3pg3C/Egj6EPQWlHTwcGU4LqXoHin7Gg7pO6mv0DNh
         8f0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xYX72o9aBJeGhfT7AISDZSc6a0ga/4HaVfHMGq/LII0=;
        b=J+uoiBCm1my/syLQvP6OQ4cDsR6bcHjLnWLP3gk/rynkSfLhNaQwL0e4zm3Ud7MhIq
         xTNIQwXquoYcPh6cUIys4mSc+EO6v9ISI+61LIGCgmw06ObCVcPM7G5APqVaCDbFH8BR
         PMMH5I26YBjeYGORxlmuOvWIdoBbWbxG2I5GK43f4HsJ3XEelMiB3E3WjGE++kWVF3aO
         rokejEk3NS+kawRYHQyE1secJqn/0bIMFBTEcc0vron/fDPIt3QFwHNz6LaVHCkLtL+R
         3YQ/rd1PMlLRjefeH/gGUSDN/+jLyfXW8uiT0m9RKVmcjuVHby/+eq4BVF495rhG3F2g
         b3UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=haBzTsGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p19-v6si3445277qvm.42.2018.05.11.09.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 May 2018 09:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=haBzTsGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHAxO-000855-Hl
	for alex.bennee@linaro.org; Fri, 11 May 2018 12:31:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fHAx9-00080q-D9
	for qemu-arm@nongnu.org; Fri, 11 May 2018 12:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fHAx8-0004MM-G6
	for qemu-arm@nongnu.org; Fri, 11 May 2018 12:31:31 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:35700)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fHAx8-0004M7-BZ
	for qemu-arm@nongnu.org; Fri, 11 May 2018 12:31:30 -0400
Received: by mail-ot0-x22b.google.com with SMTP id h8-v6so6896941otb.2
	for <qemu-arm@nongnu.org>; Fri, 11 May 2018 09:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xYX72o9aBJeGhfT7AISDZSc6a0ga/4HaVfHMGq/LII0=;
	b=haBzTsGBCmTqua8jzS9jkFisvROMYSBdXTPOOltJE9jzlAEd1cI8pA0eZcA2dH/WcU
	tkZRtyIqsxlrc9Zif/hPaC7iQUJsdGaqZZJNuQEYlXlvEqumu3YM2FCkEveJt2pqSxQV
	GoJ94rW0+DnIrWXiW65vlLy540uGgxV3RJs7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xYX72o9aBJeGhfT7AISDZSc6a0ga/4HaVfHMGq/LII0=;
	b=NY+VmREq5DMkygO91GTpvfhPokapRAfJfnoe2RCXNXDak1mRJYeh4SJLP6IpU3kBpy
	HHUGIlUJMcptnl21LPran4wapp2SMZsrw6x4Guysz4s7LkQDvd9t6vTk1OvfuDoofRz2
	0KagycgkGRmAjzXRDbEPC2ClIiW/iHzCQqT2r6vnXRtveaqbMtGrzE/1PhWaB8ivEymg
	9O0xVEaUnHEWD6U0ZedRAMaei5q/moT0Tot0JBiYodo14czcnEfqt+2rNGnRWau2JJgU
	5EFDKNN1MO4LFONdDKVgsAdMyIHGrniSq7yJA6jPHCoPVp/6D3hxDSX4k881QIVhfaJZ
	h6Aw==
X-Gm-Message-State: ALKqPwcYCPXr/nINdRLAaqphneSuz4A8Y8ZYNepYZge+8Y4gsr21vp0v
	nbMe/knH41dSC1LNPkhRlAap5B7j+2lZ7CKG5+iUNg==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr4631957otd.316.1526056258614; 
	Fri, 11 May 2018 09:30:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 11 May 2018 09:30:38
	-0700 (PDT)
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 May 2018 17:30:38 +0100
Message-ID: <CAFEAcA_Muga-rMERftcQREnmgXxVHYOoF6dNJYsffvggbemwFw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PULL 00/28] Bulk target patches
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YkrrzoR90uiD

On 9 May 2018 at 18:54, Richard Henderson <richard.henderson@linaro.org> wrote:
> This contains two related patch sets from Emilio Cota, both
> touching the translation loop for these 13 targets.
>
> I promised Emilio that we'd get these merged early in this
> next development cycle to avoid conflicts.
>
>
> r~
>
>
> The following changes since commit e5cd695266c5709308aa95b1baae499e4b5d4544:
>
>   Merge remote-tracking branch 'remotes/cody/tags/block-pull-request' into staging (2018-05-08 17:05:58 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/cota-target-pull-request
>
> for you to fetch changes up to 5b4f1d2db9fb0e24549054ee58c7a7d8f84ddd6e:
>
>   target/riscv: convert to TranslatorOps (2018-05-09 10:12:21 -0700)
>
> ----------------------------------------------------------------
> * Fix all next_page checks for overflow.
> * Convert six targets to the translator loop.
>

Applied, thanks.

-- PMM
