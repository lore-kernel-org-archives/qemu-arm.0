Received: by 10.25.208.137 with SMTP id h131csp1467390lfg;
        Mon, 9 May 2016 02:35:16 -0700 (PDT)
X-Received: by 10.28.149.205 with SMTP id x196mr10650188wmd.67.1462786516761;
        Mon, 09 May 2016 02:35:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>
Received: from socrates.bennee.com (static.88-198-71-155.clients.your-server.de. [88.198.71.155])
        by mx.google.com with ESMTPS id p204si24978353wmg.101.2016.05.09.02.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 May 2016 02:35:16 -0700 (PDT)
Received-SPF: fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) client-ip=88.198.71.155;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) smtp.mailfrom=qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from lists.gnu.org ([208.118.235.17])
	by socrates.bennee.com with esmtp (Exim 4.84_2)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1azhar-0002GX-Vh
	for kernel-hacker@bennee.com; Mon, 09 May 2016 11:35:15 +0200
Received: from localhost ([::1]:40236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1azham-0001AS-Uu
	for kernel-hacker@bennee.com; Mon, 09 May 2016 05:35:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azhYE-0005DG-N4
	for qemu-devel@nongnu.org; Mon, 09 May 2016 05:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azhYD-0007d2-GV
	for qemu-devel@nongnu.org; Mon, 09 May 2016 05:32:30 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azhYD-0007cs-7h
	for qemu-devel@nongnu.org; Mon, 09 May 2016 05:32:29 -0400
Received: by mail-vk0-x230.google.com with SMTP id s184so58641578vkb.3
	for <qemu-devel@nongnu.org>; Mon, 09 May 2016 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SC2oNoDESWMX5/x2sFwKiAeCFkMRRPtT9mP8MLjLU8A=;
	b=VdzqM7mz21tR8wA9B+ytUtqZSuE0PAJjlztxubrkhYUlZYOVyhj8WEs/sdt6fjD4Bx
	smlnTITyqb72cjGjjrLYTieswC0fjfVgERMeAD93naXZfaH9lspGaRPMhrI2Mq/ZneVP
	tiC57yQ9Krbi1fY8/K6eb2+zwNgdjKVXp8/+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SC2oNoDESWMX5/x2sFwKiAeCFkMRRPtT9mP8MLjLU8A=;
	b=dBVlqjaq8wQjMdruo1ngM1W531hYk3JlgkdZyQv6480Dkm2rjdtU6UXPo7AzFTcPLT
	8x6k6tqzGScZV8GlqTJRhhyXN4uLivtgghJVDj4Tp5Jw2mL3CpES4Yu4wQDNp+qmKJrO
	NTid+M9yAQSJm7s73C25QMCpmp8fA8POm9M4t54qOLY7MHYSIeLou3KXDjt+FjFkRmZj
	TiWypjXzw7fHN4MJNOFbWbJqstD0QJVmo0k0YSE41JvS7zv+VkR3G2Sjqtnno5DOjNwa
	8SVb8ysTSG9q7mlnh2DyH/oB1TV8ij64fBtYahufRhHaQTg+i1dtYMCHSFJAkeOQRtlL
	1UNQ==
X-Gm-Message-State: AOPr4FX0jiCZbCBG22z368QtlK4khuRAkG7SR2IBR00zrrx40w8jummPBe0z32CBA4R9ut5N5iYVPYabuJjYjnjh
X-Received: by 10.31.81.199 with SMTP id f190mr5212464vkb.139.1462786348816;
	Mon, 09 May 2016 02:32:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 9 May 2016 02:32:09 -0700 (PDT)
In-Reply-To: <1462780092.22096.16.camel@redhat.com>
References: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
	<1462780092.22096.16.camel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2016 10:32:09 +0100
Message-ID: <CAFEAcA8fWeOinXg9yYvNgo3GsGWQnemskk+v8szXenGR3CfDvQ@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
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
	Pooja Dhannawat <dhannawatpooja1@gmail.com>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>
X-SA-Exim-Connect-IP: 208.118.235.17
X-SA-Exim-Mail-From: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on socrates.bennee.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,T_DKIM_INVALID,T_HEADER_FROM_DIFFERENT_DOMAINS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Subject: Re: [Qemu-devel] [PATCH 0/2] hw/display/blizzard: remove
 blizzard_template.h
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on socrates.bennee.com)
X-TUID: v0k3I6+07rOP

On 9 May 2016 at 08:48, Gerd Hoffmann <kraxel@redhat.com> wrote:
> On Mi, 2016-05-04 at 15:15 +0100, Peter Maydell wrote:
>> Now that we can rely on the display surface being 32 bits,
>> the whole machinery of blizzard_template.h being included once
>> per supported depth is unnecessary.
>>
>> This series expands out the DEPTH-dependent macros, and then
>> moves the remaining code into blizzard.c and removes the header file.
>>
>> It applies on top of Pooja Dhannawat's patch
>> "blizzard: Remove support for DEPTH != 32" (which you can
>> also find in my target-arm.next branch:
>> https://git.linaro.org/people/peter.maydell/qemu-arm.git target-arm.next)
>
> So you take those two through the arm queue too I guess?

Yes.

> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks for the review.

-- PMM
