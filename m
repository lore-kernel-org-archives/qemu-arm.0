Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2596050wru;
        Tue, 17 Jul 2018 05:19:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcEgiURrbHM/8WapI1NbHwHsre+1TZO564k68Ql6Dy53EI2dRDLJDf2xVYIMfkcXTjghWII
X-Received: by 2002:a37:7e04:: with SMTP id z4-v6mr1094496qkc.298.1531829997584;
        Tue, 17 Jul 2018 05:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531829997; cv=none;
        d=google.com; s=arc-20160816;
        b=NnLB6OwhM6k+grRKkHhpBIkCenWwlBBf3LEqmTXReTNVID67HE3Gar9L8ISJUN+Cya
         KfWh3wcYjDnmR82rwT5Qkh6xKp/k2bunB+/bjcGiqSLc1ZeDGvg7ibPcOrrb4BoszWKr
         PxXE+r6ITXgVoTU4QdxG1h9WLKuTQ4EjUxluWGILz1gqsXWsS/nTG0z0LtYtFlimQcYP
         /DClAiXVjjv6nVZRI5a/V74KX8CDzrFvJsKWwpHTiYTZuY4kz6YjJcHkDHrarzmmw9md
         BdmGjE1MULIz8urBLSD41AESrHHjr0f+SA9t+jdKN3kf1OlxkfwzH5V6FvSDvYu83/bW
         J16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gcB/UEowv6JJ9igBZzS6PjtnAH0fVUUJ5367Z0lDfAA=;
        b=GfUyXiX7olYNix0eKeRbGdNHRw/OrNI0A7AZefwDgAvZtcFeRzB/naFiZr/lja4OfS
         agK4oHlwWcYQAXLYPEwJnzKyUQMaL5UB5gpElF2w+NJsJIhZq1YtWnzNOFyTxo8DYOk0
         d9L4mJJwqtLlyUFW2hVQ5ZHKntguOE8JPf0be1TdhkT1Cv/kWVTcoFLr0YYbxRh2p9Nf
         J94AU2+ol1GgnUeAt8kd7i6NTDXUHm9nACybdOZU/IxCPnvZrehvV6xXRNwGbsPKqdAE
         Z5QaynZL9eEl8KYveZhNb56o4G6cn0IhVyyVJ//6asCcj4RmdWdYh4DVoHPDx2SwRCTX
         UiNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EdIpoqAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m23-v6si624279qkk.261.2018.07.17.05.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 05:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EdIpoqAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffOxR-0001cb-2w
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 08:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffOsy-0006G5-QS
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 08:15:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffOsx-0006ue-Ul
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 08:15:20 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffOsx-0006tf-EI
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 08:15:19 -0400
Received: by mail-oi0-x241.google.com with SMTP id q11-v6so1531973oic.12
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 05:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gcB/UEowv6JJ9igBZzS6PjtnAH0fVUUJ5367Z0lDfAA=;
	b=EdIpoqAWdqHtYig7G6ytzixTRPx+Y20KX5mTQmAAzhEVY6Qm5RSTTH3PSnuqsavS2h
	Nn5RW32m1R7+ATSm+fQUsU1FailZLPX9nR0z5ENtUv3Y0CT5brLhGkq99zD62uKLTjH6
	M1phQ+YS0Z7DemVz52ohq9PsIYYhadkUgYENo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gcB/UEowv6JJ9igBZzS6PjtnAH0fVUUJ5367Z0lDfAA=;
	b=J0TY0M4KQl6de0FhoCreHfsTGmy1Bz6WqQP9DkMH2CR0N643LY/0JKho5nk1TZCmP8
	xmYhlPgs8uLP2jNv+ny0t5VV1sBF5OqLkvdiMVx2ooEEUlMxCWm8Lh8s6YOcvW7NEcHG
	LriYZQtPtP2108d5Vbp1NuRdg87o2W9l7JADdkRW1jCNkhdyo2E46IfEc3bDpcCupGAe
	K2MSSqkCsixCqTBVrpjtsT6snsceyyrm2qX7US494xsAYqz18nHYxRQ5rkHWQiP732X2
	IKsWkQVwRCUXo4/G+iLlEFV1lZqE93oy6BFJKRc/IsKptYiKjTiZBaFXnM7cjq7SJEjb
	BXNA==
X-Gm-Message-State: AOUpUlFT2wTXkM1qY/6v4uF3/poXLkwxodGMWFy5LV0Io+KxEAlEkS7G
	0LqLGWnPt5fNAJ/XqojQ0GRrhpEGU61Se3bOWs6N2g==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr1465462oie.80.1531829718766; 
	Tue, 17 Jul 2018 05:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 05:14:58
	-0700 (PDT)
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 13:14:58 +0100
Message-ID: <CAFEAcA_to+a58OaJ1Dray31wr8wg9XefE6wD8Pa0Cg9ONqZ+Qg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 00/17] Fix crashes with introspection of
 ARM devices
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hoDXpvMWSVfR

On 16 July 2018 at 13:59, Thomas Huth <thuth@redhat.com> wrote:
> As discovered recently, you can crash QEMU with a lot of devices
> that do not get the reference counting of child objects right.
> You just have to run 'device-list-properties' and call 'info qtree'
> afterwards.
> This patch series fixes these problems in the ARM code. When all
> patches have been applied, I now do not get any more hangs or crashes
> when I add a hmp("info qtree") to the device-introspect-test.
>
> Please have a look at patch #1, #15 and #16, they still need reviews.

Everything seems to have got review now, so I'm going to apply
this set to master for rc1. Thanks very much for digging into
what was going on here and cleaning up our APIs.

-- PMM
