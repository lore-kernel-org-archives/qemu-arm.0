Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp989201wrh;
        Thu, 9 May 2019 09:36:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHk6+r1pELE1daI5PfjM6Bq7IxfckYedVnD1Q4Hbf07OT+tigC/ROHo3yXeGOzejwUBri9
X-Received: by 2002:a1c:f910:: with SMTP id x16mr3592758wmh.122.1557419807157;
        Thu, 09 May 2019 09:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557419807; cv=none;
        d=google.com; s=arc-20160816;
        b=bGLsc6BRnk53otG+osNWXDZvGol9n6sVhi31uP4CyxnIrkvLe2cRU+OE8q8R4IkZS3
         8XzTBpMBoQw1MxDfO/TRQR8x91VWbXXBxs0h5TQnMMRxuogKdiuySEnU2BGDMtJSAptc
         DlpEJer+/FI3KRAb9JvJmjDeZlemo2LPO8Rk5NpuDiEOmGgu2+VTU0LlZvE3G6F0T4Q+
         LTVb0YrxLoSF2jf9+Iw8UfRJbyxeRB9mgDE82fNcNWq4GHbv1ERc4qLN4xq8Ypwb5Tl/
         uqDuPPOkPRc7NMA4xODghYvquMTU0YY73j3yvN8BOibe5hvjOIHFhhKvCWrN3XUS/cM9
         adtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=USwMgKR3qK1UzA1ot6Exc2pSo4mQFUcnIsEZ3LSGKHk=;
        b=ATlZTkQ88RW96Cm9kovlJVDF+mSr5+NA46IEDjKW3bYw6KuQJYaDWI6egpMMXxe+/A
         7sFUDV24IXUKoSdcG2T9uwOL2B/IvGtLTv+lFCVjI0aXW6S92dl1lyDSRiLuGsMTbZW0
         bwzuOsjsrbr7h5JNyt1g4VGWeO0igwx4RvYTo6KdLzZnv8okRKBHNJWViSD7v8rwz4Yl
         8nkw+bEArNVleEUKxCHVKBJf0hSYINUvH+SaeTU3cnZ4vZ/iMzQ0OoP3zIU/URAVO/JS
         dAmKi4XaBnUhwu3oUG6+oP9UeVi9M4SICR6F70Ct+2vA+yfxJxWazoxS+iRl5lnE8QMJ
         fwBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si2061841wru.245.2019.05.09.09.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 09:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOm2I-0001mZ-8w
	for alex.bennee@linaro.org; Thu, 09 May 2019 12:36:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.rutland@arm.com>) id 1hOm1V-0001fe-R1
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.rutland@arm.com>) id 1hOm1S-0006aj-G2
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:35:57 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:42550
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.rutland@arm.com>)
	id 1hOm1H-0006OU-V4; Thu, 09 May 2019 12:35:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F060374;
	Thu,  9 May 2019 09:35:40 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55C53F6C4;
	Thu,  9 May 2019 09:35:39 -0700 (PDT)
Date: Thu, 9 May 2019 17:35:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190509163536.GB46269@lakrids.cambridge.arm.com>
References: <20190503171347.13747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503171347.13747-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [PATCH 0/2] hw/arm/boot: handle large Images more
 gracefully
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g5ijoXvMiWGW

On Fri, May 03, 2019 at 06:13:45PM +0100, Peter Maydell wrote:
> This patchset attempts to fix https://bugs.launchpad.net/qemu/+bug/1823998
> which reports that we don't handle kernels larger than 128MB
> correctly, because we allow the initrd to be placed over the
> tail end of the kernel. AArch64 kernel Image files (since v3.17)
> report the total size they require (including any BSS area that
> isn't in the Image itself), so we can use that to be sure we
> place the initrd sufficiently far into the RAM.
> 
> Patch 1 in this series adjusts our "where do we put the initrd"
> heuristic so that it always places it at least after whatever
> our best guess at the kernel size is. (This might still not
> be right for images like self-decompressing 32-bit kernels, where
> there's no way to know how big the kernel will be after
> decompression.) Patch 2 makes load_aarch64_image() return the
> kernel size as indicated in the Image file header, so that for
> the specific case of AArch64 Image files we will definitely not
> put the initrd on top of them.
> 
> I've given this a quick smoke test but I don't have a very large
> Image kernel to hand, so testing appreciated.

I've just given this a go with three very large images built from v5.1:

* ~113.6MiB raw, ~134.5MiB effective
* ~131.0MiB raw, ~152.0MiB effective
* ~225.6MiB raw, ~247.0MiB effective

Prior to these patches (with pristine QEMU commit c56247e55bde4386) both
would silently fail to boot, and with these patches applied both all
three begin booting and produce console output. The first two get to
userspace, and the third crashes due to an unrelated Linux bug.

So FWIW:

Tested-by: Mark Rutland <mark.rutland@arm.com>

Thanks for putting this together!

Thanks,
Mark.
