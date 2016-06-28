Received: by 10.25.21.96 with SMTP id l93csp1502648lfi;
        Tue, 28 Jun 2016 01:02:13 -0700 (PDT)
X-Received: by 10.55.125.194 with SMTP id y185mr2073668qkc.201.1467100933225;
        Tue, 28 Jun 2016 01:02:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n61si2858839qtd.25.2016.06.28.01.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:02:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHnyG-0007Hg-Jy
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:02:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bHnyC-0007Eu-Bx
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:02:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bHny8-0005nW-8T
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:02:07 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bHny8-0005nQ-0U; Tue, 28 Jun 2016 04:02:04 -0400
Received: by mail-wm0-x241.google.com with SMTP id a66so3572121wme.2;
	Tue, 28 Jun 2016 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TgfbLlOARjcDOzEtQbj5FYHIRtD9M9oZYmfIGtfr2S4=;
	b=1JcNMZN9iGYwHkp3ZejvCJ2tEkteqlD7nLkHTLxgpsogq6BYdIY+DvCCEatVp1QxYH
	NL1BKjpIc+dbjD+ETQKgJCvf8Bof5sgwSpJiD/TPlckxUZ8OsfZ8ji35NxhLPHtIewoa
	BsWJsk2RL9NQeR3/MLvVJTdTowe67tjviSX/74lajAjdPdQUNc0NzQrj/9BLAfQyboPA
	ffzPyxqWdHPkiVqu5hpNKTU5lQGD5Qo4qr2clb7Z9RHc5GWsjH4yt0DGpPwgSQrPmleP
	3sDIG9wqIEfpb1WkEFP71FoBdKZRKxLbMSk5RtjEPtBUoeLz2T6itb1BzMOHZMHShZfT
	F5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TgfbLlOARjcDOzEtQbj5FYHIRtD9M9oZYmfIGtfr2S4=;
	b=RyzPIabviLJqRB1qHZA1sQFhUho3PKiFOM/nn7NFsKIBIf7wyiehQzJnGaOoxmypa6
	Hm/DxR8DhP8Ivvx88wlzcsg20xnRXShwqwG3IwjEaLG+D/H+KUOyXg9I631jc0e+e8VJ
	tiZcpnDSz86587XfcJORaSk6CUpOzxbdxiez/kKcxtFib2ZtdCiIybE2oN2sB5sIRPV9
	Nwy03AQH6JXEmEtQTmJ1WMDISBINciK+0c8RdegkxlYepRe8+lhjNcDPIzhL2SUz5a+Q
	XFIj42VZLLi2e6pzogsdjyBssj5STAuW3OTn2qrnVsCbzgLetixt5AVPTwyGC/QtgkbP
	uVBQ==
X-Gm-Message-State: ALyK8tKj/AR5iI66yIThbpK3y4pH63IueRmGr4/40yBM/9RFLqQ2Q8/gjrJWxZlo0i3Ulw==
X-Received: by 10.28.31.140 with SMTP id f134mr13935481wmf.69.1467100918797;
	Tue, 28 Jun 2016 01:01:58 -0700 (PDT)
Received: from [192.168.10.150] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	v200sm9237813wmv.4.2016.06.28.01.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jun 2016 01:01:57 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bed58244-e877-aeda-d7c6-76d01540beb3@redhat.com>
Date: Tue, 28 Jun 2016 10:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1467045813-18144-6-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH v4 5/5] tests: add a m25p80 test
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zIyuOY0SRTe7



On 27/06/2016 18:43, Cédric Le Goater wrote:
>  check-qtest-arm-y = tests/ds1338-test$(EXESUF)
> +check-qtest-arm-y = tests/m25p80-test$(EXESUF)

This should be a "+=".

Paolo

>  gcov-files-arm-y += hw/misc/tmp105.c
>  check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
