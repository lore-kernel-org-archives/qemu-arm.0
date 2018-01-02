Received: by 10.223.134.117 with SMTP id 50csp11139763wrw;
        Tue, 2 Jan 2018 11:16:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBosQWO/Blhxus05omvpUjGvPL0jWLOXbnI1JgjXWJozrwqLgqNTnktkG3ORiQ/sflHIW3PLu
X-Received: by 10.129.44.214 with SMTP id s205mr34015171yws.53.1514920568688;
        Tue, 02 Jan 2018 11:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514920568; cv=none;
        d=google.com; s=arc-20160816;
        b=t1bwWzD1mcAgH/0KqJ6Tk5UX9oqL4u1RwVg0bfV504+r14CbWQSa2Ywxe+n9hT5Jen
         uJ9ToCqovdP7MkGo7Ktp3A21i3ybQwhk8aWr0wm2I8NdZp+FMrR7S4Eu3iUcamhZrzCp
         kHBLDo9MVl+XR7JWWCbKvXsy5pOrkZnuXEP8fJSJTi3fhlPn1joDeSOR7XiFxUtD4afx
         qxEHdA79WwGGJjNsYcFQOJfhOB0W/HQWMxcurSC5yOzTq1k6WzWnfb4TLRemLMb+RmAo
         A6uy7vS3U5crwzq8qyGNyOwKGUriGpzhzKOMnp5z+3oSs7+z9c06jMOEZbaLbeL2/kjn
         rDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ZTmAgr92UPx9beSPIEmmTF6po6PkWOBhRCNQzQcQTUY=;
        b=MuvrwZklyocqdMh3fTGFtaUybywtHOwVugGn6n5tsz3uDMQeD+3Nd0IqbAcukYWVn9
         HzJBLrYnNJjPzVCbdmY8JBWZHWI0ZY2sSbQr13xsoxqPC22U2NXAWEM9xkzzXVbDeGTv
         fnnkepWHfI8OO5O4q2ideVZOJeSl1toW56rYlNU80oIdguGvnxj17Irl+XA4XxqUp9/o
         3rFHDokeuXpYSumobBQdDDGiP5l4o5Tj1i8B0/91UgEpltgirHx8Gwo5i/M4JbzDvWXY
         c4awXD7HSL85rpjcygUOF64M93JYcZUWs+/MFAhDmyYvvfPMrrkCjswNxZMw+pcIIAFf
         AYXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z28si3620210ybi.337.2018.01.02.11.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWS2i-0005dF-5Y
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:16:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@weiser.dinsnail.net>) id 1eWS2W-0005bN-1t
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@weiser.dinsnail.net>) id 1eWS2V-00042k-B8
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:15:56 -0500
Received: from heinz.dinsnail.net
	([2a01:238:43b4:3200:9392:5dcc:2f0e:a960]:54840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@weiser.dinsnail.net>)
	id 1eWS2T-00040J-IG; Tue, 02 Jan 2018 14:15:53 -0500
Received: from heinz.dinsnail.net ([IPv6:::1])
	by heinz.dinsnail.net (8.14.9/8.14.9) with ESMTP id w02JF9Bn000427;
	Tue, 2 Jan 2018 20:15:09 +0100
Received: from eldalonde.UUCP (uucp@localhost)
	by heinz.dinsnail.net (8.14.9/8.14.9/Submit) with bsmtp id
	w02JF8Bk000426; Tue, 2 Jan 2018 20:15:08 +0100
Received: from eldalonde.weiser.dinsnail.net (localhost [IPv6:::1])
	by eldalonde.weiser.dinsnail.net (8.14.9/8.14.9) with ESMTP id
	w02J2hr1001935; Tue, 2 Jan 2018 20:02:43 +0100
Received: (from michael@localhost)
	by eldalonde.weiser.dinsnail.net (8.14.9/8.14.9/Submit) id
	w02J2gKE001934; Tue, 2 Jan 2018 20:02:42 +0100
Date: Tue, 2 Jan 2018 20:02:42 +0100
From: Michael Weiser <michael.weiser@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20180102190242.GC31343@weiser.dinsnail.net>
References: <20171230225622.97409-1-michael.weiser@gmx.de>
	<19080078-e96a-cc33-bb02-97f9b726d080@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19080078-e96a-cc33-bb02-97f9b726d080@linaro.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-dinsnail-net-MailScanner-Information: Please contact the ISP for more
	information
X-dinsnail-net-MailScanner-ID: w02JF9Bn000427
X-dinsnail-net-MailScanner: Found to be clean
X-dinsnail-net-MailScanner-From: michael@weiser.dinsnail.net
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:238:43b4:3200:9392:5dcc:2f0e:a960
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] target/arm: Fix stlxp for
 aarch64_be
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xVAaVualwz9d

Hi Richard,

On Mon, Jan 01, 2018 at 03:06:21PM -0800, Richard Henderson wrote:

> > v2:
> > - make it work for MTTCG as well by catering to the 128bit expectation
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> > +     * 128bit store but two doulbewords stored consecutively */
>                                ^^ typo

Fixed for v3. Thanks!
-- 
Michael
