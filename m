Received: by 10.182.105.169 with SMTP id gn9csp1089611obb;
        Mon, 9 Nov 2015 03:02:26 -0800 (PST)
X-Received: by 10.13.251.2 with SMTP id l2mr23050300ywf.44.1447066946364;
        Mon, 09 Nov 2015 03:02:26 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h7si7173090ywb.58.2015.11.09.03.02.26
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 03:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 7E9308F26E;
	Mon,  9 Nov 2015 11:02:25 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9B2Kk6010653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 06:02:23 -0500
Subject: Re: [PATCH 11/16] memory: Add address_space_init_shareable()
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-12-git-send-email-peter.maydell@linaro.org>
 <56407BA1.3070304@redhat.com>
 <CAFEAcA-Ss35K8B2MfYTEjgi3RMyRPqsiZmJzoLq9sBbQO=gybg@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Patch Tracking <patches@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407D3C.9030501@redhat.com>
Date: Mon, 9 Nov 2015 12:02:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Ss35K8B2MfYTEjgi3RMyRPqsiZmJzoLq9sBbQO=gybg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-TUID: DTBlmmQHJ1Xr



On 09/11/2015 11:59, Peter Maydell wrote:
>>> >> +    as = g_malloc0(sizeof *as);
>>> >> +    address_space_init(as, root, name);
>>> >> +    as->malloced = true;
>>> >> +    return as;
>>> >>  }
>> >
>> > You shouldn't return a non-shareable address space here, I think,
>> > because it might be contained into another object and that object might
>> > disappear.  I haven't thought this through very much, but adding an " &&
>> > as->malloced" to the conditional seems easy and safe.
> That would prevent sharing the system address space, which is one
> you really commonly want to share. I guess we could make that one
> be alloced-shareable.

You would only allocate one duplicate of the system address space
though.  The second call to address_space_init_shareable would not
create a new AS.

Paolo
