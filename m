Received: by 10.28.71.27 with SMTP id u27csp4256417wma;
        Tue, 23 Jan 2018 08:40:37 -0800 (PST)
X-Google-Smtp-Source: AH8x224+s7rtaeBNzGBh/HVpVxvzzdruLrAhRrgGfnN+lsiCvSMQ6SE1AeFchd+oeaUZBRUxIfHD
X-Received: by 10.13.210.69 with SMTP id u66mr3071159ywd.183.1516725637656;
        Tue, 23 Jan 2018 08:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516725637; cv=none;
        d=google.com; s=arc-20160816;
        b=h1f6dwYs6c1AuxXZ+dlFfaLBbHRIq+gDVnEV4wJD+m4Wu6bV636e5pqwE78hXn+X3e
         tpka0JBWV3DoHBDniRmbFqHxIi+wvvUaES+HvCMuOlwHwAKjYvpbCgmxhiuR8J9RUqet
         wHpEvz47Dpxc226tNiQfskJ4yIxzQ9fIj8JBmwJB2rnX0548Qm6QRbW5Fy3KPEET2vXL
         4xo2MpInGEF28iJhoDknepIQlKTTL6SZHsXg6ZcDdxnO6f9Y4sqZa+8GN3MTmvo6Hw6a
         vsR+6cdvLTuPToilSt3wRmGpCTOHo3cNY0rYaiZTXPRPcwigpf0mHVu7aorIP3m4G4i7
         FLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=6vBAoTPZ4B9y7LFETE7ogBx2iBua3uDTsuH7Tl3bU1Q=;
        b=OtMPrYh+CLQlNfjpAQJj5D6lItILGieraQDI3lW3+HSJUAO3OjnxXwaivEebYduV5P
         6OdwAjJEdIg7N038WLj9uJezb80hkpeZuoBiqdylbPtocxbcGE4xIpUOxdGmkhyTBSrR
         s2PDHVCPotBBb51UW0S4Ekntkz4rq4uXiOpNm/0CLfefmgepUNLpTbCw6MAicxZbGXHp
         XyDHFMsyMVFO+bCyNAtU7ZVBi8wybQxI09C279QF9VoiOBMusjWqZgMFJSwv8+q6JcfN
         lzTKfoJvUDHh2lxvDLs3kp8ExvnUPzBQGD74AZRGCMI/rGWzwDkMvt63a4ZldJXBW3gP
         wYIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r83si4106547ywb.752.2018.01.23.08.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 08:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee1cj-0003Xo-3y
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 11:40:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee1bP-0002nE-A2
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 11:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee1bK-0004kv-9C
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 11:39:15 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53221)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ee1bJ-0004k5-Vd; Tue, 23 Jan 2018 11:39:10 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MCx2B-1eUMoS1Z6h-009f1b; Tue, 23 Jan 2018 17:38:59 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
References: <20180123145222.2487-1-f4bug@amsat.org>
	<20180123152339.GA23245@bogon.m.sigxcpu.org>
	<6d55a3e7-9d70-1ea1-2d22-65e136bda06b@vivier.eu>
	<20180123162718.GA9252@bogon.m.sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ed79d5f8-20da-6ec6-f26f-3bfb9736483b@vivier.eu>
Date: Tue, 23 Jan 2018 17:38:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180123162718.GA9252@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:azcumaIAUNZ/u4n8qQb8m20xVUG+ylUZeNK6TyWlX6ttN+u0RXO
	BGS0suY3JAbm4SUkDH+tSf5MCoZPVlEiIhUerDqAFNdkhTIZx9Tke4Mskl31tfskHY2biJk
	rjdyGnk7Sl0gShS/DtJu1lpUXSZnfjTA5sfMVInDF0Vxa0gK3AkTnulS4YAACqR4bNS6Pmh
	6gRoVosc1gGRhkkRwgO9A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:eo+ExPG/g9s=:62FSQ3ROP4nRMjfrhMfJCM
	LMyMCqo36BrxB+2FNrRU5vi8SRz3qUv+1h6vx8DiNcfC3GN1rxixP7KooQRmpQslONH3nNjAV
	YSONK8ZVpM6uVhKGYuVJZA2KN75Lp7B1Ngf1xoF7W3Gh003qf92kxuDPYIgKx/bPhTwH4wAnd
	3RO4cA0XAIcEIvIlhxO4VznXLF3koSL7z9eutHKO/QhzCIshPHxdJE0b8n3UhPaZ5HN4G6QLC
	N8MyXHAc+NhgoF6NDZ9zZNxIsEdz6Gz2f8GyMW3KbJIK1lUNjmhMwCnsLqPFxEkjqVHz4FDJU
	222rPuGPqjcIE+j5xXQLnWv6+KyHtZdHnVMgUmlNwyafRO7qqFkdc7YfyMUwst6R/tVr0vx6o
	FEaRgtM4FF1KOYofsn9ae/qX+A91PZUNg7LQWa9jNqdw7+psK5plIVIvFurrx/Q0eX0N7yVId
	WuomW7W98HhxjjBMdNHkcUOFvvU7Sr869x88jL7hzJcmGnSLbBaoa2oYmNO77bSN3TZxUggbm
	iJ9t30PYEUWBWnPb4wtCZYL3P93i48vKzELbdj67IRYeuQoQYfnc+W+PTF+PQcjnlBZXLETVg
	25qpfhcwkCy7Us4JoKtqM4okY7x3BmFyXXpb1czK1+03GbuMhlP46SI1X7O6bqhjnwGTQ7ZDK
	Q7uFAy46OsojvQiKoNP64/skRkK7fth+6sTORqh4B+5+SsxpUTyKwE5/P7QUzzsyjT0VxIFlh
	Dhtic1GgvcsDRJ2JnifSb4JjgCPmxxDhuAMdnutasSEa1vP8oWPPtQJIZl8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-devel] [PATCH] linux-user/syscall: let recvfrom(struct
 sockaddr *) use abi_ulong
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rhiulizNnTwu

Le 23/01/2018 à 17:27, Guido Günther a écrit :
> Hi,
> On Tue, Jan 23, 2018 at 05:12:26PM +0100, Laurent Vivier wrote:
>> Le 23/01/2018 à 16:23, Guido Günther a écrit :
>>> Hi,
>>> Thanks for having a look!
>>>
>>> On Tue, Jan 23, 2018 at 11:52:22AM -0300, Philippe Mathieu-Daudé wrote:
>>>> Currently recvfrom() is restricted to handle 32-bit pointers,
>>>> remove this limit for 64-bit hosts.
>>>>
>>>> This fixes:
>>>>
>>>>   31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) = 3
>>>>   ...
>>>>   31572 sendto(3, {{len=124, type=0x454 /* NLMSG_??? */, flags=NLM_F_REQUEST|NLM_F_ACK, seq=1, pid=0}, "op=test:message acct=\"?\" exe=\"/tmp/nl-bad-addr\" hostname=localhost addr=? terminal=/dev/pts/2 res=success\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) = 124
>>>>   31572 ppoll([{fd=3, events=POLLIN}], 1, {tv_sec=0, tv_nsec=500000000}, NULL, 0) = 1 ([{fd=3, revents=POLLIN}], left {tv_sec=0, tv_nsec=499993180})
>>>>   31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa3897e0, 0x42) = -1 EFAULT (Bad address)
...
>> Could you try:
>>
>> strace -f chroot . /usr/bin/qemu-arm-static tmp/nl-bad-addr
>>
>> to see if the fault comes from the kernel or from QEMU.
> 
> Full strace is attached of
> 
>     strace -f -s2048 -onl-bad-addr.strace chroot armhf-chroot/ tmp/qemu-arm-static tmp/a.out
> 
> is attched. The error is at the very end.
...
> 9559  socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) = 3
> 9559  fcntl(3, F_SETFD, FD_CLOEXEC)     = 0
...
> 9559  sendto(3, {{len=120, type=0x454 /* NLMSG_??? */, flags=NLM_F_REQUEST|NLM_F_ACK, seq=1, pid=0}, "op=test:message acct=\"?\" exe=\"/tmp/a.out\" hostname=localhost addr=::1 terminal=/dev/pts/2 res=success\0\0\0"}, 120, 0, 0xffffcdb29840, 0) = 120
> 9559  ppoll([{fd=3, events=POLLIN}], 1, {tv_sec=0, tv_nsec=500000000}, NULL, 0) = 1 ([{fd=3, revents=POLLIN}], left {tv_sec=0, tv_nsec=499951056})
> 9559  recvfrom(3, 0xffff9404ae84, 8988, MSG_PEEK|MSG_DONTWAIT, 0xffffcdb29850, 0x42) = -1 EFAULT (Bad address)

So the problem seems to be with the pointer/buffer we pass to the kernel
(either host_msg or addr). It's weird...

Thanks,
Laurent
