Received: by 10.182.105.169 with SMTP id gn9csp1088525obb;
        Mon, 9 Nov 2015 03:00:21 -0800 (PST)
X-Received: by 10.13.253.66 with SMTP id n63mr22190850ywf.163.1447066821556;
        Mon, 09 Nov 2015 03:00:21 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f63si7164841ywd.238.2015.11.09.03.00.21
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 03:00:21 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id D111FA4519;
	Mon,  9 Nov 2015 11:00:20 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9B0Ai1008754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 06:00:16 -0500
Subject: Re: [PATCH 08/16] exec.c: Have one io_mem_watch per AddressSpace
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-9-git-send-email-peter.maydell@linaro.org>
 <56407A2C.7050906@redhat.com>
 <CAFEAcA-W1forLUTHf=NdqoiBUDT35PBAzveKq3XVC+xZb3QtTA@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Patch Tracking <patches@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407CBA.9020705@redhat.com>
Date: Mon, 9 Nov 2015 12:00:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-W1forLUTHf=NdqoiBUDT35PBAzveKq3XVC+xZb3QtTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-TUID: d3R4Nwd+LqDW



On 09/11/2015 11:54, Peter Maydell wrote:
> > current_cpu is available here, so it should be possible to have only one
> > io_mem_watch per CPU address space index (i.e. two).
> 
> So the opaque gives you the asidx and then you look at current_cpu's
> cpu_ases[asidx]? Yeah, that works and is simpler. (Good argument for
> making "number of ASes per CPU" a compile-time constant I guess.)

Yes.  Of course it works well only if the compile-time constant is
small---but again, my guess is that it'll be two.

It would be even better if you can use the attrs instead of the opaque
to compute the asidx.  Then the only change you need is to watch_mem_*.

Paolo
