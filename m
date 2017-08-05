Received: by 10.25.221.202 with SMTP id w71csp280863lfi;
        Fri, 4 Aug 2017 21:47:44 -0700 (PDT)
X-Received: by 10.237.53.83 with SMTP id b19mr5849837qte.312.1501908464594;
        Fri, 04 Aug 2017 21:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501908464; cv=none;
        d=google.com; s=arc-20160816;
        b=jdT2GZcI9stt51laIJA2C+w0RrwcsbKknToCNqNE3YjGXOFUN0i946HR2jvRWh33p3
         w3zVCb1HoiifZAZrnPR5M0uizR8iiwI9DKna9MbZ8hDjhrDjqSJV6J/vYhrSr+5W7cKZ
         tjV0LL/uPY0OfrfznOEvGi5u93vFN0QoowXwRF8Ok4dq7aLyrkCTtylbTdV+pmtt5QJA
         NzHxik+9xW8JrNSN44h2bDVaUNrdrwqjW0t6x7I5LZiE5K7N686r5tmN7Kl2gfQxoRHe
         8QTbVgTDY6lBaIAlscGaa73mKM8tWtSRvJEqlQA0LdmJShcREUAke7jT/q6BnDMhOEGc
         PKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=tWDRJn1xzqJ2iiX7WaO5HK45MwkHVedTdss0s/17EKY=;
        b=zNNwGernMrJMM3gwCVpVuoUd5yclF2vQA0ZGjFJH8Ro/oipPwqazxGxHKWUAwJ+f3j
         jBdOgWSJCxnsfGCeDjp92RWUTJOUkspkB53QHaiLqHCZ2GA7YjrOl3MIHqozfuRsnFMT
         rHkypY7/8ucWJ2aWQtTKw9znqD5lM/gMYi9zC4SpK6skypUKNIxzM4VtkfOfR9oqNbv8
         tJFWsDVBLgGpUd+A+c/cc52e46QK+k2FNf3I3SrtzKSySm3vXKtbkKtf2UbpG7/HRGsq
         +z3vPqUao6mA7Ug4LsBxTquzZGPmglk4BjIimXhcHG12yX6TDIXfombSKx/Ij8xL/VG7
         ryZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=VxXbSShq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si2915748qkc.199.2017.08.04.21.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 21:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=VxXbSShq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddr02-0003eV-01
	for alex.bennee@linaro.org; Sat, 05 Aug 2017 00:47:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddqzr-0003eJ-P6
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 00:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddqzn-0007oQ-QC
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 00:47:31 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36819)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddqzn-0007nu-H9; Sat, 05 Aug 2017 00:47:27 -0400
Received: by mail-lf0-x244.google.com with SMTP id t128so2168293lff.3;
	Fri, 04 Aug 2017 21:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tWDRJn1xzqJ2iiX7WaO5HK45MwkHVedTdss0s/17EKY=;
	b=VxXbSShqCNwSxcM0sQcQXXZNBmPXryt6eaJEruEgmWf9nRKXPBcKo6QKmbf5M2oNyU
	fAusOylaOeDv+ROUAPt0W86Azn7H5OAPUwatHKszfwW8xJ8KKRIlz80CBrwU3fWDf+4w
	9EX21g0MdD7nr9xy6NjvhlcNdbqvxsekg6vVcYR9svuAftlFsBZF7NV/W11d3ORRpK+U
	98VBeHihVkE1+grASCme1/cbGRDiSFbB8EFzyhLWtZONc31jPjyLjpbAB+f5drluCuVZ
	TUFhdldXuQwCDfJSKH11BkJbDpal0wEyPqaHhlhMxIlNGiqvt9wOPaImsk9QTq0EHf6t
	8LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tWDRJn1xzqJ2iiX7WaO5HK45MwkHVedTdss0s/17EKY=;
	b=V3CB7ORFl4/xMWLhzIquTWaAEOyg66kOG19GDlyFrC2xw1hF538DBRgJC2yv+hCLDR
	IqjRsmgyp+bwtBKvbxO7ki75YbZzG8kIs5ANCEgpAdDpi3Poa17vdV65XS6MYuGC+LH4
	iWBSwwRZdmRAU2Vgvk4BnrilxEq/nKH56Zmo9P9OHS1aX2h6Sns4iQcycS9uhdEP/5HY
	zm0gcpgcES4CelTUpNQCq0xgQKMht0kFbZvkj9QAIhV0jIk1/hPhLLN5F1oaD135PzqU
	JQqGZ4ITlYUl7HwV/vuopQGYSmqljpe4FN4CmA/PzBXRHXyVmZrgDL+YFjdepC5FHo42
	dt6g==
X-Gm-Message-State: AIVw111oJEBw4C89lxsSK0cMopfg2f1wz4UtAeSZdLFViyMXsNhTMosd
	fIF86mUUUkb7YQ==
X-Received: by 10.46.80.11 with SMTP id e11mr1600204ljb.123.1501908445927;
	Fri, 04 Aug 2017 21:47:25 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id z66sm888854lfd.3.2017.08.04.21.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 21:47:25 -0700 (PDT)
Date: Sat, 5 Aug 2017 06:47:24 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20170805044724.GH4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
	<20170803153800.GR4859@toto>
	<854126f3-84da-087c-f35b-480165871e7f@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <854126f3-84da-087c-f35b-480165871e7f@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/15] target/arm: Don't store M
 profile PRIMASK and FAULTMASK in daif
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FeMH+/nBj+C5

On Thu, Aug 03, 2017 at 03:05:17PM -0700, Richard Henderson wrote:
> On 08/03/2017 08:38 AM, Edgar E. Iglesias wrote:
> >> +        uint32_t primask;
> >> +        uint32_t faultmask;
> > It seems like these could be booleans?
> 
> I was thinking the same thing until I read the v8m description as a 32-bit
> register.  This makes qemu match the spec, which has value.
>

Ah, I didn't check the spec :-)
