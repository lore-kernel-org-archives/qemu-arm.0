Received: by 10.182.105.169 with SMTP id gn9csp1097401obb;
        Mon, 9 Nov 2015 03:19:18 -0800 (PST)
X-Received: by 10.129.87.132 with SMTP id l126mr25306897ywb.251.1447067958769;
        Mon, 09 Nov 2015 03:19:18 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j68si7208245ywf.109.2015.11.09.03.19.18
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 03:19:18 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id D53318E233;
	Mon,  9 Nov 2015 11:19:17 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9BJCEN020214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 06:19:15 -0500
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
 <56407AC8.9020100@redhat.com>
 <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
 <56407D82.4090005@redhat.com>
 <CAFEAcA9YNOOXenTw=M84=ACXqV_VwRaUCS+P3DNswNkPkGg3Sw@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Patch Tracking <patches@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5640812F.4070008@redhat.com>
Date: Mon, 9 Nov 2015 12:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9YNOOXenTw=M84=ACXqV_VwRaUCS+P3DNswNkPkGg3Sw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-TUID: 5MwMfW/xnZYo



On 09/11/2015 12:09, Peter Maydell wrote:
>>> >> I could have handled that by making the CPU init code always
>>> >> register two ASes (using the same one twice if the board code
>>> >> only passes one or using system_address_space twice if the
>>> >> board code doesn't pass one at all), but that seemed a bit wasteful.
>> >
>> > I think it's simpler though.  Complicating the init code is better than
>> > handling the condition throughout all the helpers...
> It was the overhead of having an extra AddressSpace that concerned
> me (plus it shows up in things like 'info mtree' somewhat confusingly
> if you didn't expect your board to really have 2 ASes).

I don't think it shows up twice with address_space_init_shareable, does it?

Paolo

> But I don't
> feel very strongly about it (or have anything solid to base an
> argument either way on).
