Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3769300wrg;
        Tue, 14 May 2019 02:10:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy24Wg9HxRrecdeZFH9FTVyoRF+nwUUuUrjaujXYsl49uytEPx2pwlJcPud6BwG1C7c3Pvs
X-Received: by 2002:a50:a535:: with SMTP id y50mr35267248edb.249.1557825013280;
        Tue, 14 May 2019 02:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557825013; cv=none;
        d=google.com; s=arc-20160816;
        b=glwYZmnGYQjWO6fYV1C6ScY1st4Q4xkluEMCHgYHcO79L1a03Stm4wW3xINnOrUKxN
         5OAjG3R8Sl3YO5d8A8WPrsJaTK4EWEY/ZNG6QE2xYEiR4QOZ4fZ0BLCVZ4XWjT8cFrfH
         L1w2FRSw5JRotxo8a1te9pQqT+F0n5HoLMcEqFwDAavJPN9REyETZWOY3uowJkwwCZpg
         xyIdtFu5S12gKk2oPz29RBCFVdbXhqjhp6qzzpEY7qTiJv8wKVspwxGXyBs3vjbNiIOF
         n3BaihlW0myBlGRZk68L2ilK9T8lpz1Z5wQsUMYeHRQwM51pyjIs3hQ1DTJbnA3/zEzN
         /xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=w6L8HWRn/mzh/XLhBJ8gFqy2xT1h3LpExtKpKfx2S3I=;
        b=wfVT2OcsQV35lDMMKaaCYo8IEp3I7wmjw4/sBIpIRDe8hiJxQTc5Ttiu66e8zfO+0v
         f/11omEULh29PByxYsavvql6MGnUsbarDjAKwkTVy9Gc2lJRkHY/Y7SQLta+/dUwxwlf
         WnIvRmSZ6sYV/Q/gnFdy3+GrvfIwZe5cSk1jVWCt5QV4pGPvnJFBJzMXBAfmzTEqsgxe
         avFHW6nCwQ3+4wWsOwGv03HzHqbdipzyoUc6TRzjn+AC36oxxRvncHTI6cpwXbmvCbfm
         MGHiO4NPsyVpaiK2HEGxLS1FAZil9jB6hkIMdUpmuLc7IJhj2sNON5+S39WjrI0TfV4R
         FtNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id f27si5642195edb.255.2019.05.14.02.10.12;
        Tue, 14 May 2019 02:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B911374;
	Tue, 14 May 2019 02:10:12 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94ED23F71E;
	Tue, 14 May 2019 02:10:10 -0700 (PDT)
Date: Tue, 14 May 2019 10:10:08 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add
 kvm_arch_get/put_sve
Message-ID: <20190514091005.GN28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513124356.GG28398@e103592.cambridge.arm.com>
 <20190513140726.vpmenrfw4uocmtnc@kamzik.brq.redhat.com>
 <20190513143929.GK28398@e103592.cambridge.arm.com>
 <956f9bc9-1024-b02a-e792-98b01d016ef4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <956f9bc9-1024-b02a-e792-98b01d016ef4@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: bwk4eRzeIK2A

On Mon, May 13, 2019 at 05:58:59PM +0100, Richard Henderson wrote:
> On 5/13/19 7:39 AM, Dave Martin wrote:
> > On that point, could TCG easily be made to expose a larger vector length
> > to the kernel?  I'd be interested to see what happened.
> 
> It would be easy enough to extend the maximum vector length within TCG.
> 
> Increase ARM_MAX_VQ.  Alter the couple of places where we manipulate ZCR.LEN to
> extend the current 4-bit mask.
> 
> How large do you need the max to be, for testing?

Anything upwards of 256 bytes is interesting.

The architecture reserves space for it to grow up to 9 bits, though it's
unlikely it would ever get that large in reality.

So if you wanted to go crazy, you might be able to go up to 8192 bytes.

This is just for fun, since it goes outside the architecture and Linux
officially doesn't support it today in any case.  So definitely not a
priority!

Cheers
---Dave
