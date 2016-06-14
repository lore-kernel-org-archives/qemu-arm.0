Received: by 10.25.141.12 with SMTP id p12csp94178lfd;
        Tue, 14 Jun 2016 01:20:15 -0700 (PDT)
X-Received: by 10.55.154.136 with SMTP id c130mr18140966qke.79.1465892415560;
        Tue, 14 Jun 2016 01:20:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s84si17629007qha.63.2016.06.14.01.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 01:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCja2-00026u-TB
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 04:20:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bCjYC-0000UI-Tc
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 04:18:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bCjY8-0001ET-Im
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 04:18:20 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bCjXz-00019O-Vh; Tue, 14 Jun 2016 04:18:08 -0400
Received: by mail-wm0-x22b.google.com with SMTP id v199so109467985wmv.0;
	Tue, 14 Jun 2016 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TvvJ/e8YneZMgztynYL3ZCcpep22tIRSRiaBefbpNfM=;
	b=zaigb7dsQsNj18wm5d/idDMseC6JEFup9SsR4PJaRPl0k5hDp+EEjIjWMzzJTouXDq
	giBXPDCxekPslQIl2+L55rGBpPZjBkWex7f6v9+7GqpjdVxRoB7EkTMyLGDxJoeDbZDR
	bAnDy4VLWUOAJln8UfRuMKTqAI5iAPl3KZ85/+ovN2+35jRP8VwW6ARAEYdKkkxIJcYf
	GhhLQDBNw5HGpa5VcR28O4nOCl/kAcMYQyRoOVrzdF6pK0Y3GkbIQSfQMyCKHD0BPJKO
	IXjW3wU8K+Ac41q4hkD0p6SRSc0p1g0N4PU2/DQp4VxBA2LDbAeQ6B9Rlc1Y1sDXkATz
	c++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TvvJ/e8YneZMgztynYL3ZCcpep22tIRSRiaBefbpNfM=;
	b=mIjbLe4kU1RbGXK/n+xIN4Ay1zo9txVrtC/zSTv0AZL/16gb2RQB1NEJy+raVsOGtE
	zMHQOySuevR/6QGZqgXayI91w4BnTqeHyBxwR0D4RY28CqzVNrqlHDaMuXGD6o4OgPy7
	acd5mxlJOYH68CR5rkcY568BjmHkxWqrPZMpdGW8bGf96oXqFaEdnQrsLnFF57krsTJ0
	GhN46SpFOrfdqhOwOMQiB7JDP/HD7SRs67aYGEc0ZhUCCtDXpKkm6upTOgi4NdxN6Gxm
	BvCVrz/9qNsQ/M0eQw/qFFfiaUo7vXzhKctolLDpjhsvk0BZ7q5F3l05jUlArItLrjmj
	gAvw==
X-Gm-Message-State: ALyK8tLf6uc1dICd+fj57nIuOtizohO1vEi9lSaTPmocZZ7kIkO6NACAbzv+mO9CD4ucqA==
X-Received: by 10.28.176.7 with SMTP id z7mr4782681wme.17.1465892287168;
	Tue, 14 Jun 2016 01:18:07 -0700 (PDT)
Received: from [192.168.10.150] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	b4sm5897602wjd.16.2016.06.14.01.17.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2016 01:18:05 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
Date: Tue, 14 Jun 2016 10:17:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-devel] [PATCH RFC 06/16] vl: move smp parsing to machine
 pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	dgibson@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Ow/iZYCOwnA



On 13/06/2016 22:35, Andrew Jones wrote:
> On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
>> On 10/06/2016 19:40, Andrew Jones wrote:
>>> +    if (sockets == -1 || cores == -1 || threads == -1 ||
>>> +        maxcpus == -1 || cpus == -1) {
>>> +        error_report("cpu topology: "
>>> +                     "all machine properties must be specified");
>>> +        exit(1);
>>> +    }
>>> +
>>
>> I think it's sane to accept some defaults.  It must not be the DWIM
>> thing that -smp does (which is targeted to Windows's dislike of
>> multi-socket machine on consumer hardware).  It must be something that
>> makes sense, and my proposal is:
>>
>> - threads: 1
>> - cores: 1
>> - sockets:
>>   - maxcpus / (cores * threads) if maxcpus given
>>   - cpus / (cores * threads) if cpus given
>>   - else 1
>> - maxcpus: cores * threads * sockets
>> - cpus: maxcpus
> 
> I think some machines may prefer
> 
> - threads: 1
> - sockets: 1
> - cores:
>   - maxcpus / (sockets * threads) if maxcpus given
>   - cpus / (sockets * threads) if cpus given
>   - else 1

smp_cores is only used by pseries and x86 machines.  I expect machines
that must be single-socket to disregard smp_sockets altogether.

>> - any argument < 1
> 
> What if a user says threads=0, because they don't have HT, and assume
> that a value of zero will get them a non-HT system? Or what about
> machines that don't describe sockets, so a user inputs zero? In both
> those cases I agree we should just use 1, but from a user's perspective,
> it might seem weird.

They should just not specify it and get a default of 1. ;)

>> - any argument > some compile-time value (1024?) to avoid overflows
> 
> Agreed. We should do this regardless of this series.
> 
>> - cpus % (cores * threads) != 0
> 
> Hmm. This makes sense where cpus is the number of cpu packages,

I'm not sure I understand what you mean here.  The point is that the
machine starts with an integral number of sockets.

>> - cpus > sockets * cores * threads
>> - maxcpus != cores * threads * sockets
> 
> We check these two (the 2nd added with this series) already.

Yup, I was just making a complete list.

>> Alone the last relation shows that requiring all four of maxcpus, cores,
>> threads and sockets is unnecessary. :)
> 
> Not really. It depends on if you assume sockets, cores or threads to
> be the N in maxcpus=N. We could just require sockets, cores, and threads
> to be input, which allows us to easily calculate maxcpus, and then set
> cpus from that. In that case maxcpus would just be an available input
> for sanity checking.

Or you could just specify -machine cpus=16,maxcpus=32 and expect 1
core/socket, 1 thread/core, and 16 to 32 sockets.

>> -smp should do its legacy magic and assign all five values based on it.
>> If the results do not match the obvious s/smp/-machine/ command line it
>> should warn, and perhaps suggest the equivalent -machine command line.
>> It doesn't have to be a minimal command line, just equivalent.
> 
> This is a good idea. I'm just still not sure what the -machine command
> line should/should not assume.

It's okay.  Adding defaults can be done later, as long as strict checks
are in place from the beginning and there is a clean separation between
-smp defaults and -machine.

Relaxing checks can be done later, so I am much more interested in
having strict checks than in having defaults.

Though I think that we can at least agree on defaults for threads,
maxcpus and cpus.  The only sticky point is sockets vs. cores.  We can
make them both mandatory for now.  That is: cores and sockets are
mandatory until we decide which one to default to 1; threads is
optional; cpus is mandatory if you want hotplug, otherwise it's
redundant; maxcpus is optional and always redundant.

Paolo
