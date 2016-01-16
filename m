Received: by 10.25.159.19 with SMTP id i19csp776868lfe;
        Fri, 15 Jan 2016 16:21:40 -0800 (PST)
X-Received: by 10.140.109.33 with SMTP id k30mr16945052qgf.75.1452903700638;
        Fri, 15 Jan 2016 16:21:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w80si16112503qhw.30.2016.01.15.16.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:49495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEce-0007HS-53
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:21:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aKEcL-0006zm-0z
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 19:21:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aKEcK-0006pX-8J
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 19:21:20 -0500
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:33944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aKEcK-0006pP-2t; Fri, 15 Jan 2016 19:21:20 -0500
Received: by mail-oi0-x22e.google.com with SMTP id k206so146556863oia.1;
	Fri, 15 Jan 2016 16:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kLam1DdeuBbzqq8MOgdtRUuIsmpCSbTl74l1Fmu8hSk=;
	b=Jd55xYPgDw0KhG6+sPUAnYrI7y/fiJ3/Ivj83sbO/xYYUuJJCe683/ObTToOiRTZva
	TZZ/qXVpQe+veC3ya/XaTOB8TZizypCFc0MlN0uWTaHPb8bdtFVCaNusJRk6A39Amibt
	bFGIhwbblq4m5magAMHPaYzZNLHJ35siPn3Y8FVEfO+r0NY0W2q6K2Io0aGnHwMsJQv0
	eJhsvvqqU5oKI7CEXq1J43LT9CXXjjpGgkdq/IuqRIoYzwF9ByfNZCTqJlLPsDG0x97g
	Gohy6/1m5B5yrPlwluE/A8+EiPHgm92diQVbQj0bS9AgPojBt1PYPzADcY3LgbTh/EKl
	3HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=kLam1DdeuBbzqq8MOgdtRUuIsmpCSbTl74l1Fmu8hSk=;
	b=VUlHl5V57mTD2E8GFOdW+zsNi4XOGupX4d7p66YSSfeMbHlbYkCui7Q4w+UuckE8qH
	urrl8cbKKJ+8j6YC7j7C73s7jA4I6Nkg61OdFQl14sXTmDLO0erJUmsmnDF1/62WWMxJ
	rs9kqRlW66hRMYC9q18F5Alr6cS+6PUr7EzxyuoCGRqQijix0jQu364tRWNhbaCNjN2X
	NDLWhN3tPtyrceWVSN6+bGpA5zVdFgEefQJNfH7JEkJbrnbENQf45DM/Nd6iEbNg9uVp
	JaU5SV8Rtx910UgrnrOen7ul1CRbkfyrVcHHNw4O/NThl53I6ksKrq3Yzu5rR8TVrheH
	GvlQ==
X-Gm-Message-State: ALoCoQlFS3Lm9hOwXjSMy0ckSGJH5o2ZvrY+k9AHD4Oz0yiqZdqQdn80aJItwVlgTlW5q1wkGPSKMUOXyIN1Th6QsS+FUGMH3g==
X-Received: by 10.202.83.139 with SMTP id h133mr10365063oib.127.1452903679611; 
	Fri, 15 Jan 2016 16:21:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Fri, 15 Jan 2016 16:20:50 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1601151327570.363@wniryva>
References: <1452764448-17953-1-git-send-email-mst@redhat.com>
	<CAFEAcA8yjfMdRtYsmdR=vbSmm0=6wdiFff2oUzYxwoT=CMbxyA@mail.gmail.com>
	<CAPokK=reMoLQ_CF_LgtmezkFZyUrSB3Oh_gB9kKZ=0Ztspq5Ag@mail.gmail.com>
	<alpine.LFD.2.20.1601151327570.363@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Jan 2016 16:20:50 -0800
X-Google-Sender-Auth: GWFa2Fh__8DOc-d4tCFM4XRvSI0
Message-ID: <CAKmqyKNAHA1kWEJWTvn7RhAhXc6ca6VHUiq72unA_EA7-9_=SA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?5YiY5Luk?= <liuling-it@360.cn>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] cadence_gem: fix buffer overflow
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yjOwT5f5UjZe

On Fri, Jan 15, 2016 at 12:06 AM, P J P <ppandit@redhat.com> wrote:
> +-- On Thu, 14 Jan 2016, Peter Crosthwaite wrote --+
> | I guess QEMU needs the whole packet before handing off to the net layer and
> | the assumption is that the packet is always within 2048. The easiest
> | solution is to realloc the buffer as it goes with the increasing sizes.
>
>   Yes, I was considering increasing buffer size with view of the jumbo
> packets. In gem_transmit(), 'tx_desc_get_length' returns length masked by
> DESC_1_LENGTH(=0x1FFF=8191) bytes. But thought dynamic allocation might lead
> to excessive buffer allocation, not sure how constrained the Xilinx platform
> is for memory.

Won't the allocation/reallocation happen on the host?

Thanks,

Alistair

>
> --
>  - P J P
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
