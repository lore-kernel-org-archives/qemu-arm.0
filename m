Received: by 10.25.221.202 with SMTP id w71csp2428008lfi;
        Fri, 4 Aug 2017 11:42:43 -0700 (PDT)
X-Received: by 10.200.8.188 with SMTP id v57mr4327947qth.213.1501872163634;
        Fri, 04 Aug 2017 11:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501872163; cv=none;
        d=google.com; s=arc-20160816;
        b=W6EaC1vuKX7MeVSqpFYPVx2F0w6NtRaw9IXQYCnnF/f6K5GnAwBF1XAzcYZqSG8k11
         c3PdVbcqXDxgSLX4mJIYUJXW50HUuWckDoDZVEGZTCcK+u+1PmpcFxayDn7HRktXNiso
         N/wIgXSiFGjHkACpivQ6NuSsJs5ogbhdap6nKn3I6uknv5sOlV7d/eiMh+5BUA1mW5lY
         SjRqrnwwXMqgtjJZFGyvCbMR7/o3UUmj3Z2GvMFnLpGxrAbjLhwITWwk1x18oDNHtfJ0
         ddxeAbi5fFfIDsUdLLvw6ffoepbmnmul/J8wemJ5UiovzSU2eW0dp1v6hYxWcAVJFJ2S
         jytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=TkAuo+qH9ozndZfBZe2mJoO422cRzvaWKcVXSAzdPVc=;
        b=RgLLifSgkV0LUX5d6jHGCBbhYwZP7eISXozl3Eh8psQKonuoaCxAXPRxyNyfQFGBqu
         N3gsJZbk4L0yix/PKsimWlgPE597/o8sdLIruuJk6g7Y9INVEwyvR0G/wBtLoJEysqrZ
         CmdMZwZwv91YARHReA3lklOpahvIoelJYEz/C1jCHxkc2xCOKD4OyBfpFXAvS9G0ogea
         vE11XfDIzcAWMqjchZnXoyxUPpB4ra0WYtC1GFbhXOL2lpqbIe3Cas1LPhFOZPt3fujT
         8sX/PqynO67zlljrq3bwr50wa8SS2FD7dWI6o0q4bj6XFkoqKB3tFpcuuB9+OOojUfIB
         R2Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=W1TQUcZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si2268688qtd.451.2017.08.04.11.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 11:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=W1TQUcZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddhYW-0004SE-QV
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 14:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddhYP-0004R8-14
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 14:42:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddhYL-0001pZ-T6
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 14:42:33 -0400
Received: from mail-pg0-x229.google.com ([2607:f8b0:400e:c05::229]:35783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddhYL-0001o1-Le
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 14:42:29 -0400
Received: by mail-pg0-x229.google.com with SMTP id v189so11110283pgd.2
	for <qemu-arm@nongnu.org>; Fri, 04 Aug 2017 11:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TkAuo+qH9ozndZfBZe2mJoO422cRzvaWKcVXSAzdPVc=;
	b=W1TQUcZ+48f/YQVRR0m1hjjCQDDUxxsHI+U0XykEcMUGGUR62qAH3D6rBV/t5blOVY
	CcR0BR8aRYBd7RMCcrXxKaewAmTOeADCyFxdCaMkUmCj2b7f6pGeFyaB17SY+Zih3MSH
	T7H84F2ylrL3XeUhFBlry3VckqUzXEZDavba8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TkAuo+qH9ozndZfBZe2mJoO422cRzvaWKcVXSAzdPVc=;
	b=jQTy11HxoA92uUZBVtoPxpE1CWgJLG1Z94C04++j58SkUh0PeyHer5rVPC7DYQvTuW
	bu1tGhZAhcWCMWWEIAF6B3PONyZm2wfxkTx0CNNAR0krxKtx3h3j537UrSGw6Qs7JxK7
	W1HimmXpzgCOQzH46XzTINjzPp7SWcspbebiPmzmL/f8B0A5JMpXIkUPoBaTteNYL2NC
	iD6Dh+J/YnVRM5EESDcWP1Nklyv0RThMQ1jFTJkrYWc4D4DbIru5lW3j5pui5mz53NIq
	s8V76XoRzfBXSvndgFk1oEgoNmSWaA8zPIQCr9cVVX9bCKOCWSu5thP4OTwr7Y+EQ5xe
	hq9g==
X-Gm-Message-State: AIVw112R+RQl1tOqYtPPjbeavIu9a4AAkR/o7eJiZAC9chx1GAJDzkoI
	atDKVcYlv1J59HMz
X-Received: by 10.84.208.236 with SMTP id c41mr3951071plj.244.1501872148469;
	Fri, 04 Aug 2017 11:42:28 -0700 (PDT)
Received: from anchor.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	n19sm4442278pfi.35.2017.08.04.11.42.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 11:42:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45d91dda-55e3-0221-d56d-66fbecdb7d9c@linaro.org>
Date: Fri, 4 Aug 2017 11:42:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::229
Subject: Re: [Qemu-arm] [PATCH 2/8] cpu: Define new cpu_transaction_failed()
 hook
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IoOsyLh6mq4k

On 08/04/2017 10:20 AM, Peter Maydell wrote:
> Currently we have a rather half-baked setup for allowing CPUs to
> generate exceptions on accesses to invalid memory: the CPU has a
> cpu_unassigned_access() hook which the memory system calls in
> unassigned_mem_write() and unassigned_mem_read() if the current_cpu
> pointer is non-NULL.  This was originally designed before we
> implemented the MemTxResult type that allows memory operations to
> report a success or failure code, which is why the hook is called
> right at the bottom of the memory system.  The major problem with
> this is that it means that the hook can be called even when the
> access was not actually done by the CPU: for instance if the CPU
> writes to a DMA engine register which causes the DMA engine to begin
> a transaction which has been set up by the guest to operate on
> invalid memory then this will casue the CPU to take an exception
> incorrectly.  Another minor problem is that currently if a device
> returns a transaction error then this won't turn into a CPU exception
> at all.
> 
> The right way to do this is to have allow the CPU to respond
> to memory system transaction failures at the point where the
> CPU specific code calls into the memory system.
> 
> Define a new QOM CPU method and utility function
> cpu_transaction_failed() which is called in these cases.
> The functionality here overlaps with the existing
> cpu_unassigned_access() because individual target CPUs will
> need some work to convert them to the new system. When this
> transition is complete we can remove the old cpu_unassigned_access()
> code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qom/cpu.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

