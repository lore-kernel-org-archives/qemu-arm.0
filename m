Received: by 10.182.105.169 with SMTP id gn9csp1078218obb;
        Mon, 9 Nov 2015 02:32:11 -0800 (PST)
X-Received: by 10.129.87.132 with SMTP id l126mr25115331ywb.251.1447065131471;
        Mon, 09 Nov 2015 02:32:11 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f4si7107231ywc.301.2015.11.09.02.32.11
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:32:11 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B9D028E50E;
	Mon,  9 Nov 2015 10:32:10 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9AW2Lq001535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 05:32:04 -0500
Subject: Re: [PATCH 02/16] exec.c: Allow target CPUs to define multiple
 AddressSpaces
To: Peter Maydell <peter.maydell@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
 <20151106132115.GB13308@toto>
 <CAFEAcA8Oh3s9JiMAFFQb6P_C3UyS3MqxrmAz0ASm4FJnbemp7Q@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Patch Tracking <patches@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407622.6020208@redhat.com>
Date: Mon, 9 Nov 2015 11:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Oh3s9JiMAFFQb6P_C3UyS3MqxrmAz0ASm4FJnbemp7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-TUID: PtXA7VuxiZ7H



On 06/11/2015 14:34, Peter Maydell wrote:
>> > IIUC, g_renew may move the entire cpu_ases area. The internals of
>> > memory_listener_register (called below) seem to put away the pointers to listeners
>> > so a renew+move would leave invalid pointers to listeners in memory.c wouldn't it?
>> >
>> > There are various ways of solving this, (e.g dynamic allocation of the listener,
>> > static allocation of the cpu_ases, invalidate all listeners and restore them after
>> > each as init and more). I'm sure you'll figure something out.
> Oops, yes, you're right.
> 
> Maybe we should just have the target CPU say in advance what the
> maximum number of AddressSpaces it will have is -- my expectation
> is that this will be (a) small (b) known in advance anyway.

I agree.  Or even just allocate room statically, for the largest amount
that all targets in QEMU use.  My expectation is that this will be 2. :)

Paolo
