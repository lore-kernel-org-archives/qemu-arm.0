Received: by 10.223.161.27 with SMTP id o27csp4016326wro;
        Tue, 31 Oct 2017 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SJrd0PrkMNDk8fEUbpFDFCMZX4hQ59CyAOgPtY6rUD9oiCjqX348Ufx4j+RDB5tpIB2w99
X-Received: by 10.13.212.196 with SMTP id w187mr1826798ywd.316.1509473787726;
        Tue, 31 Oct 2017 11:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509473787; cv=none;
        d=google.com; s=arc-20160816;
        b=qaaDFpNz3xa5qSCuLM+1ip0kU2Ms+TUWHEtiJBa0Zk7CZ7uBbaszn7QYnP/nXu5c1x
         Xgs9NSfoBSIHedNGxjc7KnxP31koms50PpnwM3vqZsPTLfCediADNciKJabM7DIpjJec
         oScMWh30PKWZeBPoTzIKN+XiwY0zJdkUeLFJzlKHa5vDuUjgBxEBtbeQ2RgXIb6gZvf8
         y9aAaJCxPQA/Gcs6mssTF+rEPnhldSD0a2KfQruAnBHezYuDyyO1f9CbxAqQCDq3tXOJ
         IC6mHBiKSGbUkRtx9LLg8vDf2uFLb6yeagZ/BtOavl8p4mVG2kR20y0sg+jTqujlSQbE
         RfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pmbRNggJMVOj9cK+jUhM5xRrPkiRGV3Wlw/ux2LXmwY=;
        b=xZtJ4LY4DjN+nxPSGh7U+sIZS3RVSFrmA9rxL0JPaH/D1BuBtkFbOx1Hf21BR7ZlX0
         Yvnw4El5PmpqSZgK/XChuY0ZC1/YUsU46jIQWzI1QBXFpePRp9StEzg3waVdI3kQFJ8g
         HrgLUtBQZ4nhIgRsvkTKhERZJbIYFXj0liZ1RWvb1tc48zToTucWo2d4l9BPzTJTLxbt
         NiFu9UpolAY3L9m3p6ECyxA9VnoZJ+HKDB4rWMKObArYVteWV0IkdcHTHzoNU+dwe4C2
         knmsJZMgROTFJNn2qI9vwn8vyaQD7C/WOjI2Ryhf4kQjJqBQ2HO72k4L9R8DSl3jigrc
         2ysw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KiwGaQrg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v143si506376ywc.215.2017.10.31.11.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 11:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KiwGaQrg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9b5P-0002zX-6W
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 14:16:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9b4T-0002ex-2c
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 14:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9b4S-0003jP-0x
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 14:15:28 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:47972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9b4R-0003j4-Oi
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 14:15:27 -0400
Received: by mail-wm0-x233.google.com with SMTP id r196so596460wmf.2
	for <qemu-devel@nongnu.org>; Tue, 31 Oct 2017 11:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pmbRNggJMVOj9cK+jUhM5xRrPkiRGV3Wlw/ux2LXmwY=;
	b=KiwGaQrgNF+NNDEGjJEfwDCQ6XHekaV/vgFkwafdI47kKqbjFUt1OeK3YEZD0CcIAm
	yJm2lAgyCkAiLZA7exhPzxq0nWIYVOxwRG3uFHZDpeZLujDAgtsnSV72mEQQyhMQwudL
	+eIfG8LC1nmAZgJGSiXW5LIHtNohgA4lyFzkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pmbRNggJMVOj9cK+jUhM5xRrPkiRGV3Wlw/ux2LXmwY=;
	b=p9YKpLabdKofSjZtJgdrCUkkQtg8vFYfEWTwy1sytLmKDKQvEzC4QQlYbQLOVttvpq
	Hg137YU21dCq4Uk1WJSJ3nLO73FCI5feeLlRL5FoAdZ6kAPtvEVtSW5HxdBsnh7M4R4Z
	HvAGTSE9qYB1lg7kr5d6Tse+8zPVTKYtxGVgeHMcpnyTUg0Wxo/wjiSxc+0xpNQss8cT
	O0XK3Ciim2dX26n28yC7yRPxuyvxxqYGX95/w9TsV+PSMyLNw41NdLpq0aZydNPyg4dz
	GzOdG3tcEeClrWyRXer+DPsnvRquN8reNVtwIR9sF7qZlLkiHG6p4QcoUMkyl0E3DrHx
	JyGw==
X-Gm-Message-State: AMCzsaXxWNlZapm6BKcHNEfhk1aT+7Dq+1yRKKbcm37Qb9RL+3f1nz2u
	vW90ax9/JF1oCTS8/IXqbIECDUtlNYY7Xdx45/b0aA==
X-Received: by 10.28.112.22 with SMTP id l22mr2511480wmc.35.1509473726779;
	Tue, 31 Oct 2017 11:15:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 11:15:06 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710311035560.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
	<CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
	<alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
	<CAFEAcA9GEpxHtPpe3OSZ5eycLB50i5Q_us8dzOjiUj1HxoFnKA@mail.gmail.com>
	<alpine.DEB.2.10.1710311001380.13766@sstabellini-ThinkPad-X260>
	<CAFEAcA91kisKT_wCj8swwJzUn52YycpigpGwv9Djsc-Q1Sq2SQ@mail.gmail.com>
	<alpine.DEB.2.10.1710311035560.13766@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 18:15:06 +0000
Message-ID: <CAFEAcA9JrZCk3TUDsMPa-KrDFFPnZeNzNPMrqNJdx0GObzcAeg@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-devel] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BI52CNVkc5Ix

On 31 October 2017 at 18:08, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Tue, 31 Oct 2017, Peter Maydell wrote:
>> On 31 October 2017 at 17:07, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> > Sorry Peter, I copy/pasted the values from arm32/page.h instead of
>> > arm64/page.h in Xen :-/
>> >
>> > Xen is running at EL2, 64-bit (aarch64). The ATS instruction is "at
>> > s1e2r", used to translate Xen virtual addresses into physical addresses.
>> > This is what breaks.
>>
>> Thanks. OK, so if we change the line in do_ats_write() from
>>      if (extended_addresses_enabled(env)) {
>> to
>>      if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>>
>> does that fix your problem?
>
> Yes, it does! Thank you! Are you going to submit a patch?

Yes, I'll do that Thursday.

thanks
-- PMM
