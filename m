Received: by 10.25.0.23 with SMTP id 23csp503146lfa;
        Wed, 14 Jun 2017 14:35:15 -0700 (PDT)
X-Received: by 10.55.156.193 with SMTP id f184mr2745216qke.102.1497476115272;
        Wed, 14 Jun 2017 14:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497476115; cv=none;
        d=google.com; s=arc-20160816;
        b=lCIA/O6To11hpXpsPbMhjcCUaUGG2fehgxs2ZfuUs3ygAPb385bMtLKB9F6G8nhLmy
         r/r7kjQa16XnOMIFGPjWm3U4rh2aWega0/aCG+CwFDYscpjbp0LXgKJPP/qcGG30JdX7
         4rDxSErEmKbLdfWKinPTtzvMEsg3xNSZKHIaR1n3t6P6g0Hyxllfc9a5aN4lJvm5B730
         nfuQWJ1aY5FodWQzQDUkbew6BF1JzRQj8tmUe0eK+AU4izL+XYBZAbHGdlo9FIXDCNp9
         TCc3TJ8khp9kQPHmGOTk5e2ZDSZeGwuXEWPIvJEWnomUpJXjnWplCWe8K0USbAkxP8aS
         g9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=XrM6bC81JIqF+ob/sYrWw8JeZuiMb46Pu/zZ7cH7CEY=;
        b=1HjVvecUlgjf5zeEMZTdK2cY688d0FgImNWAqSD+NPIkgfLUtaeQZTdZOmyuSDI5a5
         wyerc//UMWlYiuG78TWiwDzhpI+2SKETPbh0+NB4U5ELAkE/WJNrShRsEhLON5w4QAF9
         F3XfBpf1/Z3DDkpg53SqEjxdtW1/y0Xy9Ck2cxP7HWxp3wooEWRMkdvBnLZiIAa0QouC
         cFpTndE/Q1ecgLcMrw2PqQgxhpxJKBZI4Pr5EEv+5AH/AQa2E/95JLEP7VZjT6luQWLR
         cvPTC4I8n0EYaDEN3bYMILO9a2ICu0wtuBXvGWr3YhDHRRgwwtTxuf1sgnKhZ56daa9Q
         4/Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <ehabkost@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y31si1057223qtb.221.2017.06.14.14.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 14:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D3D633458B;
	Wed, 14 Jun 2017 21:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1D3D633458B
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1D3D633458B
Received: from localhost (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2BEE8E533;
	Wed, 14 Jun 2017 21:35:10 +0000 (UTC)
Date: Wed, 14 Jun 2017 18:35:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	Anthony Green <green@moxielogic.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v6 1/6] Pass generic CPUState to gen_intermediate_code()
Message-ID: <20170614213505.GM5016@thinpad.lan.raisama.net>
References: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
 <149727923488.28532.12388479748363447374.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149727923488.28532.12388479748363447374.stgit@frigg.lan>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 14 Jun 2017 21:35:14 +0000 (UTC)
X-TUID: ef8IpRoLvzUm

On Mon, Jun 12, 2017 at 05:53:55PM +0300, Lluís Vilanova wrote:
> Needed to implement a target-agnostic gen_intermediate_code() in the
> future.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

For i386 parts:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
