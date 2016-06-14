Received: by 10.25.21.96 with SMTP id l93csp43023lfi;
        Tue, 14 Jun 2016 04:53:51 -0700 (PDT)
X-Received: by 10.140.37.21 with SMTP id q21mr18465851qgq.69.1465905231236;
        Tue, 14 Jun 2016 04:53:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 185si18096637qhw.71.2016.06.14.04.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 04:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCmuk-0000Ns-Jt
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 07:53:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bCmuF-0008Qm-8b
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bCmuD-00064K-5W
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 07:53:18 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bCmu8-00062Q-4c; Tue, 14 Jun 2016 07:53:12 -0400
Received: by mail-wm0-x232.google.com with SMTP id m124so119333437wme.1;
	Tue, 14 Jun 2016 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=jWqDVvE4ZaOa8COcBrXw+j0+ZS9mLrrp9H+Yg0C9IBE=;
	b=iirIO300suoreJr3ma/5cVtqvpGTUfM8iZmTEDQ4ziqO2c5SSfZYTipVLMFYJMIZJi
	yb6zQDAmZr6e5LN2O0SQO6bkathd6UHkhK5soRy/wrsKc3r412VtBmgmFq3OxufpfKra
	T1vHAWWXAJQzhulJfoC9hMnwYS4QB5vSEzslVZaSa75DhYYx7yClG7srNojww7/yl3Tg
	i3t+NvPxtWtpBTTVy0yxIGaO1OSJGP6Mhm6oeh5aqOIN94JIENaebWjkiYWXyROFF3UJ
	QrwY33dJrFkanrb5/uCrFQf9cTyFd1al8Z9zdryqBhgDi0Kel6/rXgEH34FpHYaT4aoQ
	f5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jWqDVvE4ZaOa8COcBrXw+j0+ZS9mLrrp9H+Yg0C9IBE=;
	b=Zex2L73v+yiQpvLKHnEUA+qTJKxt9kpOGM6lh8HeGa6plCsj3xjMBdpSFQTz/WRquC
	KIQuaavtdQTOBC6IPitsC+0Tt1mBVC3LW2EDy5pmtGXGjuhdc3EVVKyT8lr2nGg0mjBA
	L+EFm2O+EXGooG7MIteYowat1+eBPGWd+krvsnxh4zENt1TKLPeZfesMD/ywX7XlN+zB
	DYc4HckGtEwi8Wyy8vMpgtkcoetoOWDxu5iVXNACHIEltgndWmZp9u/noa3rgjsZiZJ8
	GmC9nrzDxsFNLdusFeWNtdvukJ3FT29bqwLzNHXvQmt/RO7zY5qQxVSC+HJAo9a0Uxwz
	QhmA==
X-Gm-Message-State: ALyK8tKqd03uQDut4HZRnhoq/x/f75M5E4pp+vgkK+uZRxY5XIwst38auzI1b3GkHzWGbg==
X-Received: by 10.194.186.179 with SMTP id fl19mr6484005wjc.2.1465905191124;
	Tue, 14 Jun 2016 04:53:11 -0700 (PDT)
Received: from [192.168.10.165] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	ue1sm11753523wjc.44.2016.06.14.04.53.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2016 04:53:07 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
	<20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c1f094e3-c41b-88d3-9bf2-91b334d9513a@redhat.com>
Date: Tue, 14 Jun 2016 13:53:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH RFC 06/16] vl: move smp parsing to machine
 pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	dgibson@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I6cUA5vSvgIe



On 14/06/2016 13:39, Andrew Jones wrote:
> On Tue, Jun 14, 2016 at 10:17:49AM +0200, Paolo Bonzini wrote:
>> On 13/06/2016 22:35, Andrew Jones wrote:
>>> On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
>>>> On 10/06/2016 19:40, Andrew Jones wrote:
>> They should just not specify it and get a default of 1. ;)
> 
> Yeah, threads, the only one we should never calculate, could be
> optional. If not specified, defaulting to 1 makes perfect sense.
> But, threads=0, which is weird, but in a way specifying that it's
> not specified, also makes some sense.

If it's weird, let's make it invalid. :)

>>>> - cpus % (cores * threads) != 0
>>>
>>> Hmm. This makes sense where cpus is the number of cpu packages,
>>
>> I'm not sure I understand what you mean here.  The point is that the
>> machine starts with an integral number of sockets.
> 
> OK, s/cpus/maxcpus/ then. By using the currently online number, I
> thought you were starting to prepare for cpu packages, which are
> indivisible sets of cores and threads.

Yes, that's what I meant to do.  Isn't cpus what you call
"total-online-threads" below?

> But now that I think about
> it, cpus % (cores * threads) isn't right for that either. It should
> be total-online-threads % (cores * threads) != 0
> 
>> [...] you could just specify -machine cpus=16,maxcpus=32 and expect 1
>> core/socket, 1 thread/core, and 16 to 32 sockets.
> 
> Or 32 cores/socket (only 16 populated), 1 thread/core

Does that make sense?  How do you "populate" parts of a socket lazily? I
know it's all virtual, but... ;)

>> Though I think that we can at least agree on defaults for threads,
>> maxcpus and cpus.  The only sticky point is sockets vs. cores.  We can
>> make them both mandatory for now.  That is: cores and sockets are
>> mandatory until we decide which one to default to 1; threads is
>> optional; cpus is mandatory if you want hotplug, otherwise it's
>> redundant; maxcpus is optional and always redundant.
> 
> Agreed. I'll do the following for the next round of this series
> 
>  threads: 1
>  cores:   required
>  sockets: required
>  maxcpus: maxcpus ? maxcpus : sockets * cores * threads
>  cpus:    cpus ? cpus : maxcpus
> 
> If maxcpus is input, it's redundant, but should be sanity checked.
> Maybe the user wants to use the QEMU cmdline to check their math...

Yes, all this is fine.  As to the checks, here's my list:

>>> - any argument < 1
>>> - any argument > some compile-time value (1024?) to avoid overflows
>>> - cpus % (cores * threads) != 0
>>> - cpus > sockets * cores * threads
>>> - maxcpus != cores * threads * sockets

?  The second, fourth and fifth are fine, and IMO the first too.  What
about the "integral package" check?   It needs to be disabled with some
ugly global when using -smp, but apart from that I believe it's better
to have it.

Paolo
