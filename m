Received: by 10.223.197.9 with SMTP id q9csp1768151wrf;
        Thu, 12 Oct 2017 08:01:49 -0700 (PDT)
X-Received: by 10.13.201.196 with SMTP id l187mr1952606ywd.83.1507820509882;
        Thu, 12 Oct 2017 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507820509; cv=none;
        d=google.com; s=arc-20160816;
        b=Lo3HZlsaBa/uG1qeGXn8nZgCEuCjVCj6Na+Fn+glnlOE6Hm9xROzHNkkd/vMHyKRPp
         XYJg5ncqksfoc3CkVQ9XpGjQtdBza6YrhJsT6LKJNMc3GyaVt7Xvb8ncVxSDLoT5wnyn
         a2h/8aChrXqIgF8xbC9u2TgfyDLjw/d+ECktu1yluWeGjKKRz5c7FwqXvnuzIPLzJ/so
         wL1NO9dD+6IF95Grudnz65kw9iKzr5ogqbR33RN6IGmab+aoDCGk5CTHroXA1YA1gJj0
         eiblfbi+W4peacNoLlfIEyulYr1M5JfxQouzrJuN4jHnnPE5I+Qa8xMsqcessIJOC2ta
         DH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=NFLo8QekhkRN8BiHlZjL0LCr+SbqJJXY/f53ksRuZgQ=;
        b=Eb81ylBXyk+jTpR/HH9eXHGDihzNChq7hz9ZlYL6kAZXZqTSFAfJRnHfXtIKqxPeBZ
         VA8Rk9SOSJqkz+YjIdxY9lehzrvEau/nUIqxbB5a2fAlvZi/gluQRJetza4n2QjagT8Z
         c4hCNXkDw8Ixet766h/JOzXZH56NZuAUa4GepRWs1ahaarZElguopJBeaC1c+dde+rXI
         A1Dru/bwkzRbTf8YyQv5IRijq61UAq3D70eu3rrOa1rMqZQEZrSyUKqlCekpgAvVz7aH
         VqE2bDoMvtr9GkyMxNDGm7RZvztVHBzFMjjeIHzHJWyvuy6vfx2W/wlxt7oxEvISErkm
         ufrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bt+ruGqn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i22si1847111qkh.6.2017.10.12.08.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 08:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bt+ruGqn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2ezb-0002CA-Nj
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 11:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e2eyl-0001pX-Ma
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 11:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e2eyg-0001q2-3u
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 11:00:55 -0400
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:50296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e2eyf-0001p4-TV
	for qemu-devel@nongnu.org; Thu, 12 Oct 2017 11:00:50 -0400
Received: by mail-pf0-x233.google.com with SMTP id m63so5188843pfk.7
	for <qemu-devel@nongnu.org>; Thu, 12 Oct 2017 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NFLo8QekhkRN8BiHlZjL0LCr+SbqJJXY/f53ksRuZgQ=;
	b=bt+ruGqnhB4M6FkwnWCOxvGDoBwdZw501/Ivc45H1ms9wA/IrOrm2wDX3PzPUKYdo4
	2gsh6tvcGTmxBSNAZ0P2LSP98pJbeut475p4XPHirsC8mRuAfcfu/ACuGIOkblg3bsjU
	Tj+LGTnk+R/x3njdTkZZRd5zJdUV5IW3aauio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NFLo8QekhkRN8BiHlZjL0LCr+SbqJJXY/f53ksRuZgQ=;
	b=SUs12madaMjTsae0TVDZH25Coo0xDPGSJI5LLU+gGH02fu8CBdq7J6+Mi4ueecaVFF
	WfNiB6WPG/bBqExFMVpkxBDB2YsZV4tWAueZuWnCuQC6M7wVx3GfF0gWZZwvG9Qzn5di
	iqfHe4v9UZ3Frsu6loNSmGO6kInKU7jeA6XlSWIitTtpFb/zP3kginYXBbnS9XsmRs7I
	aCSEE50PoKd2LJ1Bu2XR3phwtFou99Dh495WhQ9eJptjNNhGwcEzJ7ZrNtmW1+xwHSwj
	WiuiOlfJ7F6jMVpNuI6Mh+/cFlCbSJfAq0lmse3p3G5W17Ut6GZ8dsO+9gLGlYiFt4KS
	PsHw==
X-Gm-Message-State: AMCzsaVcncETK8wROwDuAdUafBHvcBTbW6vO0MTLh1SYwac4lr7xHuhN
	AzMoBbZ1IAONgrofFR3DKgFTLA==
X-Google-Smtp-Source: AOwi7QC1xP2tfopNhRqgJohN1clzRmE95Pq9gCoX4R248uahtvMCEhIxIwK3mLRaVSM+qE6COdIkDw==
X-Received: by 10.84.240.12 with SMTP id y12mr462157plk.215.1507820448790;
	Thu, 12 Oct 2017 08:00:48 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	v14sm27597032pgq.72.2017.10.12.08.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Oct 2017 08:00:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507650856-11718-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39cbdaa6-a900-bfd6-4bea-2eaf4b862b00@linaro.org>
Date: Thu, 12 Oct 2017 08:00:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507650856-11718-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: Re: [Qemu-devel] [PATCH] nvic: Fix miscalculation of offsets into
 ITNS array
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h5i+XhCeNFJL

On 10/10/2017 08:54 AM, Peter Maydell wrote:
> This calculation of the first exception vector in
> the ITNS<n> register being accessed:
>         int startvec = 32 * (offset - 0x380) + NVIC_FIRST_IRQ;
> 
> is incorrect, because offset is in bytes, so we only want
> to multiply by 8.
> 
> Spotted by Coverity (CID 1381484, CID 1381488), though it is
> not correct that it actually overflows the buffer, because
> we have a 'startvec + i < s->num_irq' guard.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Oops. I guess this is what Coverity is there to catch :-)
> 
>  hw/intc/armv7m_nvic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
