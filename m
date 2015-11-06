Received: by 10.182.105.169 with SMTP id gn9csp1075991obb;
        Fri, 6 Nov 2015 05:49:50 -0800 (PST)
X-Received: by 10.66.233.73 with SMTP id tu9mr11606413pac.52.1446817790924;
        Fri, 06 Nov 2015 05:49:50 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x234.google.com (mail-pa0-x234.google.com. [2607:f8b0:400e:c03::234])
        by mx.google.com with ESMTPS id ba4si346585pbb.20.2015.11.06.05.49.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) client-ip=2607:f8b0:400e:c03::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pacdm15 with SMTP id dm15so99528219pac.3;
        Fri, 06 Nov 2015 05:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=L9eXupf521uGN5c2ufPXOvSzyNv148UVMm5DZCd+ECM=;
        b=sEflz6jBRwrsDoItWraNC69jQg6yw4Y+1jfJoADL6c27Ww3MFppExKapd971RwdlvG
         3cKb+tgbQmROfF0xokNd/y0xZ76kxMtA1wv+9sCK7Wzbc6OPDRN2dCVFCILP5upZehzD
         XYaBjwSKni9jzBO/wlzkQqJ/mp88hWGp2Hn/vzra2wg8ZgYwTRR47gh0/9apFotInmb1
         ebmfmcJAMeJFgugQS2P25+LDPr+rMCIdj+j/iJjioGlXAaCRNFODtOp7qBBU0JHB4Q8q
         rIhHlBYtcxuBgqmvwnGQ00XWH2582mEqiAl+YGxUTQ0NbMRNSwXtzjsK0noUVaqaDi1o
         nxhw==
X-Received: by 10.68.177.5 with SMTP id cm5mr18052224pbc.92.1446817790438;
        Fri, 06 Nov 2015 05:49:50 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id zk3sm293243pbb.41.2015.11.06.05.49.48
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:49:49 -0800 (PST)
Date: Fri, 6 Nov 2015 14:49:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 02/16] exec.c: Allow target CPUs to define multiple
 AddressSpaces
Message-ID: <20151106134946.GI13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
 <20151106132115.GB13308@toto>
 <CAFEAcA8Oh3s9JiMAFFQb6P_C3UyS3MqxrmAz0ASm4FJnbemp7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Oh3s9JiMAFFQb6P_C3UyS3MqxrmAz0ASm4FJnbemp7Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: DniNsczJIKb7

On Fri, Nov 06, 2015 at 01:34:44PM +0000, Peter Maydell wrote:
> On 6 November 2015 at 13:21, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Thu, Nov 05, 2015 at 06:15:44PM +0000, Peter Maydell wrote:
> >> Allow multiple calls to cpu_address_space_init(); each
> >> call adds an entry to the cpu->ases array at the specified
> >> index. It is up to the target-specific CPU code to actually use
> >> these extra address spaces.
> >>
> >> Since this multiple AddressSpace support won't work with
> >> KVM, add an assertion to avoid confusing failures.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> >> +    if (asidx >= cpu->num_ases) {
> >> +        if (cpu->num_ases == 0) {
> >> +            cpu->cpu_ases = g_new(CPUAddressSpace, asidx + 1);
> >> +        } else {
> >> +            cpu->cpu_ases = g_renew(CPUAddressSpace, cpu->cpu_ases, asidx + 1);
> >
> > IIUC, g_renew may move the entire cpu_ases area. The internals of
> > memory_listener_register (called below) seem to put away the pointers to listeners
> > so a renew+move would leave invalid pointers to listeners in memory.c wouldn't it?
> >
> > There are various ways of solving this, (e.g dynamic allocation of the listener,
> > static allocation of the cpu_ases, invalidate all listeners and restore them after
> > each as init and more). I'm sure you'll figure something out.
> 
> Oops, yes, you're right.
> 
> Maybe we should just have the target CPU say in advance what the
> maximum number of AddressSpaces it will have is -- my expectation
> is that this will be (a) small (b) known in advance anyway.

Yes, that sounds good to me.

Cheers,
Edgar
