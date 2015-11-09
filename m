Received: by 10.182.105.169 with SMTP id gn9csp1066485obb;
        Mon, 9 Nov 2015 02:02:29 -0800 (PST)
X-Received: by 10.55.74.19 with SMTP id x19mr28558835qka.28.1447063349735;
        Mon, 09 Nov 2015 02:02:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j73si10467409qhc.31.2015.11.09.02.02.29
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 09 Nov 2015 02:02:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:51283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvjHR-000577-GT
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 05:02:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvjGW-0003jn-PI
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 05:01:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvjGW-0004cC-0j
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 05:01:32 -0500
Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e]:35559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZvjGV-0004c0-SI
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 05:01:31 -0500
Received: by ykek133 with SMTP id k133so255963876yke.2
	for <qemu-arm@nongnu.org>; Mon, 09 Nov 2015 02:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8xEKgBZKakt/HVQFk4DqtzNX1LvcC4KHIxOYbbIAQuU=;
	b=Zl+VmLp+WPYG1XluuSahkbgrFVnZGOLvFFEnE+9ef83lklJK5XT9f5ycA+wSQveNjS
	9R9a66mgXCN38AsnyxigwpJz5cxlir8d7VQuUuc8RNWMNegjzeVYUKrTPmK9KxSnpa6N
	lu27sJdOfTs2cfzEf2SLfJ3+3eYfZeQ69aa6l742b0ssx0/r3/YM3ebbujR5EqtWf1Tg
	UyyCHjrMdMZ6NX/7LBECpGKrPL6hxh9949lZ3kTxY9BNZ5QrhLZUjFTP9YNx5iHur0g6
	C85jB30ILMhhrTJ9LhcQw+JEO/UXZiKlzARzXJiV5yQusvqZRnj9JNb10wAQ494rGaxR
	28DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8xEKgBZKakt/HVQFk4DqtzNX1LvcC4KHIxOYbbIAQuU=;
	b=LKmEO1A3K2S24t3OSY63tC/48sKmFphwuu+yIerRH5eGY7Zqi8LJRtk9gImlMDOaB6
	YwSnqFIcQzWJfjWbqdYXDJHHrZ2gbAyt1LdDsGBBXOfQ1uLjjUeNzz2XwjOCF0/CXIJ8
	RPr7Tz5MwNIr4w0zzdtvjbWIIC9rletzx5we5pB81Me+i/AtsRnVuJbTRYcqgYYRtrtx
	L4S8Pt1CC0Ja4oPatduNvtJUO4I5W+dl4zN+ol+XnM2fZwxc7lIMI2SWBcRlPG59Qpsq
	H5xK51WBLShgjGd0BMrhSpRkyGSngJKYCprg4aiResPGesJUujssIvqeTzky9m4PHFG7
	VnYA==
X-Gm-Message-State: ALoCoQn5nXxjxeZFWP5EcCmTPCJjvMLwwTXI8cA02AZjPmPjUOyGcd+d2wADBFna+f2KLJm949FX
X-Received: by 10.129.75.131 with SMTP id y125mr25191074ywa.48.1447063291410; 
	Mon, 09 Nov 2015 02:01:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 02:01:12 -0800 (PST)
In-Reply-To: <87twovpqg1.fsf@blackfin.pond.sub.org>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 10:01:12 +0000
Message-ID: <CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22e
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RiuZmL76/88J

On 9 November 2015 at 07:44, Markus Armbruster <armbru@redhat.com> wrote:
> For consistency, error messages should be a phrase, not a full sentence,
> let alone a paraphraph.

This is in direct conflict with wanting them to be actually useful
to users :-(

thanks
-- PMM
