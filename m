Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1889084wrt;
        Thu, 17 Jan 2019 06:28:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN66eFJ38lDLWirisyXkJCG/LniP7KOqqCQOBunl7AggtScVeJtNErWDa7lR2qt/LrR4zyhs
X-Received: by 2002:a1c:c58d:: with SMTP id v135mr12436773wmf.88.1547735336045;
        Thu, 17 Jan 2019 06:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547735336; cv=none;
        d=google.com; s=arc-20160816;
        b=AdLqtTmYEch952XRac1fYKrb31RJCRd8al4/ojoDq+4eToRdG0VpkAzR9+aPHftWi/
         jhJyN+k8ygid/fglvlvwDxB9GGcjsGw3hIL9NqtvuPJYqhmQOIaVW/+cFLK3GNl9uHAS
         xPcYaYVXITXoIylwa83BpcTtfs2xJNJnw9Ipo3nHtjW5lbbAfDUSQSbdNXP4twBYdNrB
         Oj7LT0FKQOzs/vmHUyIpU2jTacHW3+jd+AAzBtwOdXkumwqzzj8XcoD6wSHKyi4CiaCB
         S/SVKNaVICqgXl/ZPFx142GDOa+H/SIbMkBLm7rfHcy74mPaDFL/wVjLBHvHkUlTrjW/
         fJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=gWFuiHV3H7p0LYLBBX7Nd2Fg9tTISPKCpB23Fyys9g8=;
        b=BDGjYM/K75TxA9xWmQD4+YOw/uk/N3mvP0CIqVo6yZzEGQKvVIQW1Dyap1EdDgqMt8
         oP+Jlo71/+tL9jl+3N+vWbmjJUQx4mzX5WlQiMMd8D5TQcxY/TIspCxCCd/NxPveSGPi
         HDqK8V/jnVhhEFueMrTzBc0FaeJEz1klZIgt/ZpGX8QGfuG8wPA+W0EBpqcTGKDdBdXg
         qyPBWN6JS8VGJO7d/jGLN1wVOPkYorigTTUpPve/Eg65qucbjfuaD7K460tgB418v0j5
         /I1/l83eOAgz1HgtmMxoLVS4lqDxwFXniD0iiiiP5j7tQ5Rwzz/ons7iwlStLm2LXUIf
         3E2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c72si27088494wmd.180.2019.01.17.06.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 06:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gk8f9-0006HH-67
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 09:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gk8ev-0006H0-St
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 09:28:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1gk8eu-0006sd-Mf
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 09:28:41 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1gk8eu-0006ou-FW
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 09:28:40 -0500
Received: by mail-wm1-f68.google.com with SMTP id m1so1275104wml.2
	for <qemu-devel@nongnu.org>; Thu, 17 Jan 2019 06:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gWFuiHV3H7p0LYLBBX7Nd2Fg9tTISPKCpB23Fyys9g8=;
	b=Wav+COc4TJOClMVWtxaXGGrucZJm3B0AFyCOjXSNAOpE/420n5o+880YNqYzkk2Z4m
	An/L6m0HHPgz5AVTsaENJdnQQHNUJ7efXzZtXYPxVl15d2SAGSgrX/i98WHFQ2F6UqpN
	NeUCyDpYqwdjL849qEJP6KSi3Sb5AJMDYMonjgrb6WCnWGuSwVIR+1AcFcPo4Fx1Ow4T
	R5cFW8Wmu+WNtEG4zMmI0WGUzfi1Hi+3J2i52kDYqRnAxQQOExSAKXIUauWYT5acscie
	DP9xQI3OZ24fA5BYJmTOU4icMddnx6Q49t5opAcwPqdbQbJgRfvlBanSBNjaXGj1AaaM
	3XQw==
X-Gm-Message-State: AJcUukfIltGB5jqk4oVHmk6mSB5rYob3s7gQUmg57cqmc5cBdfqjSyq3
	c9nIc+hRgE3ys0cz/+efuYCWNQ==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr11311944wmf.17.1547735318998; 
	Thu, 17 Jan 2019 06:28:38 -0800 (PST)
Received: from steredhat (host126-229-dynamic.248-95-r.retail.telecomitalia.it.
	[95.248.229.126]) by smtp.gmail.com with ESMTPSA id
	w18sm73087968wru.54.2019.01.17.06.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Jan 2019 06:28:38 -0800 (PST)
Date: Thu, 17 Jan 2019 15:28:36 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190117142836.g2izbqvimkzl62wd@steredhat>
References: <20190117133834.7480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117133834.7480-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH] exec.c: Use correct attrs in
 cpu_memory_rw_debug()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gfSSAB+qle3z

On Thu, Jan 17, 2019 at 01:38:34PM +0000, Peter Maydell wrote:
> In the softmmu version of cpu_memory_rw_debug(), we ask the
> CPU for the attributes to use for the virtual memory access,
> and we correctly use those to identify the address space
> index. However, we were not passing them in to the
> address_space_write_rom() and address_space_rw() functions.
> 
> The effect of this was that a memory access from the gdbstub
> to a device which had behaviour that was sensitive to the
> memory attributes (such as some ARMv8M NVIC registers) was
> incorrectly always performed as if non-secure, rather than
> using the right security state for the CPU's current state.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1812091
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  exec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
