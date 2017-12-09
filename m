Received: by 10.223.159.74 with SMTP id f10csp119511wrg;
        Fri, 8 Dec 2017 17:08:33 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZwnWk/e9bBZy4vDK4R63lUriRPG6ZPBfIS4UMaEdW27LlbEOQAZQmBylCqUMvkkfkX1vRY
X-Received: by 10.37.118.78 with SMTP id r75mr18698529ybc.134.1512781713668;
        Fri, 08 Dec 2017 17:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512781713; cv=none;
        d=google.com; s=arc-20160816;
        b=erp3YeWBaVPpCi0VH5VP9eRlVZSRHQCe/azcmke+3vaQZ+7KmOoXKnbd1z5aMDjXSs
         +MI+kwxkdh4NefKoeGPAb5Q7KBqJcOOkeou0SkS/mkgsXEqYijkFFQS16qsZi/49h+R6
         Yaxs6wr8zBv4JQcYj/93dB4UydKY0UqJUSTYVXDG57HYXKZPAMAgao22ZKtXqT7ehxob
         Q1h7pRk5tnW5UrSjrU3tMISbcDfU1AQ62GyMC0DgxJ8aQINIO3LyqpiteDdriMo93egy
         LXgrwFTLtUMMKg2wntKHVvk18J0CMix/vviFqclrgDLjCWwjzP96CB0u6VtQmyXa5gCV
         HrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=cu5YMAoF8M/Z9IJ5g1lIUSYJuaZ5FFVsI6IMagzIVts=;
        b=MUwzGMFugRSdEHoqoujQJ9u3KoFmJkldpxMGCqUux/unz3rP677Dy2eBUinTjxXfkC
         QhC05AmuQwiAIthhFuHtp/rMlxruhQQ9VY2I2cx0jiwPX2WGZJoeyAVkq3eGJjt5Bup0
         AOgkK1qeBLKtxtkDJb4eK6xJj0S76eXA0/DNb76GriFeOb52o8ylMm4rDbP2Zmw8TIcf
         BnfXN8JwFOv4VsuRa3ovi6unUib/8U3VYq9yoSglsFCwKbSZPt0ObfI0tfSUKQKyIw93
         0f0RP8O3MvNvxHVLklIh74LM8K5GrdHr6iPex4r+JuG5ayaUApWCSeU5tHaVfs+0lRzj
         1btQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l13si1862233ywm.797.2017.12.08.17.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 17:08:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNTd3-0004oX-3O
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 20:08:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eNTcr-0004n9-89
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 20:08:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eNTck-0008Lr-Jt
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 20:08:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eNTck-0008K4-E2; Fri, 08 Dec 2017 20:08:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9BEEFECF;
	Sat,  9 Dec 2017 01:08:13 +0000 (UTC)
Received: from localhost (ovpn-116-24.gru2.redhat.com [10.97.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4135217CD5;
	Sat,  9 Dec 2017 01:08:13 +0000 (UTC)
Date: Fri, 8 Dec 2017 23:08:11 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171209010811.GJ3037@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 09 Dec 2017 01:08:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0/SfcKVLn5MF

On Thu, Dec 07, 2017 at 07:37:31PM +0000, Peter Maydell wrote:
> On 7 December 2017 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This patchset adds support for '-cpu max' to Arm, along the lines
> > of the existing support we have for x86 targets:
> >
> >  * under KVM, -cpu max is the same as -cpu host
> >  * under TCG, -cpu max means "emulate with as many features as
> >    possible"
> 
> Forgot to mention: -cpu max for qemu-system-aarch64 will
> be a 64-bit cpu, and for qemu-system-arm it will be a 32-bit
> cpu. (This differs from all the other TCG CPU types, which
> behave the same for the 32-bit and 64-bit binaries. I think
> it is the same way that x86 -cpu max works, though.)

Are they going to be represented by two different QOM type names?

(In the case of x86, all the CPU classes have different names on
qemu-system-x86_64 and qemu-system-i386).

-- 
Eduardo
