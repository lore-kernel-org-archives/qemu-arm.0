Received: by 10.28.71.27 with SMTP id u27csp4224260wma;
        Tue, 23 Jan 2018 08:11:12 -0800 (PST)
X-Google-Smtp-Source: AH8x226U6IB4lDuhdlfWGFDpQLPTZRWCXVcas7iZ8f4GfCPEzsymn7b+yp9pTb2Wdzp9JZ8eUmz4
X-Received: by 10.129.175.95 with SMTP id x31mr2954825ywj.219.1516723872135;
        Tue, 23 Jan 2018 08:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516723872; cv=none;
        d=google.com; s=arc-20160816;
        b=0D+Llscx2Xpbu0SrfNSdPhh9mFFcHSV7Euwxo48UXpaIZkU47Tx7aqP139+oa+nZ1X
         od0WlE09N+AfSeLsDXFt1MctcQ5nlA26ZR7nm2F0xiHjgOtq9e4Hkpxxa75n1MV/Lay8
         IwE9OZQqes4ypLfvwVEqWclbBp/D72Ewpx7Ue/Ih/Fwqs2agvVlJS5ePoTcf+zQbKj5m
         /OzJajupXPBzLjhH537q/q8NGlgONPBUCstZSwggIga4WD5Fr19zKlOCQ9a/zEcgDSAN
         ViSd4dtx6Vigvi9zj163F9KeA2mrEDSsHdmau5Ig2xGGX/qgCeDNgn9ybveRAHmPNto/
         Q8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=lbm+U3ayUacDGAUYglnWv75CoyPwLvYsv9yd91go7hA=;
        b=aKk3BC2dzVq5h24f2o4FbZVVHkNbzMItTK7J8LMCuv2tRi59/ZnO6xUm7jBiBSM7sY
         R6kiKioMO39fMoXX8mnzdZJlZl1vKGJ1V9OAADnXVmq2Zt/bTkmQnLUXDwfM3wD5KI0X
         725boHauXhmV6ANPa5HvKktapBxEhu0p/GVJLJLa6ER2HXWBcxSHDUg53gQDhWj/PPTk
         C7EmDOJ7ijq4kpvNAttWZeT3H3bA/VqlnjKKqag8uCuS23/V/lGpRTiOtoepC1O8Y9ez
         jg6pHN27LNIO1us3VFnLW/Fsk69h+rZ/mZzDDBLoMOzq5iEUilsXhH13xKSsRcMCiElV
         1uWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d133si4094264ywb.335.2018.01.23.08.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 08:11:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee1AF-00076C-Hz
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 11:11:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee19v-0006yd-WF
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 11:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee19u-0004O2-Qe
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 11:10:51 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:61956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ee19n-0004Gk-B3; Tue, 23 Jan 2018 11:10:43 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M1XmT-1exbRB2ow5-00tPdp; Tue, 23 Jan 2018 17:10:32 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180123145222.2487-1-f4bug@amsat.org>
	<20180123152339.GA23245@bogon.m.sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <052b681a-5067-6090-d761-94b26170c608@vivier.eu>
Date: Tue, 23 Jan 2018 17:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180123152339.GA23245@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:74tALRK0MHaTgEUJxqLROxC2AhZ5CbO4fcISCSBxuthfg87cULo
	+rqMMqnuepzyfnToJsSEhRc1izIJaL46QouCLtJCSAgKWzuWzOhR6DPO7B9ju2aDQEO8bOi
	/1vXMvduW5Ag5fQNxccQBER8mcFml1bFgv5ssVUbpiYzQE7qJHZiil6z6pKpaNuojTs7A5K
	mlwuzEuUMoySR/onLgGHg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:mBdESm2fI7c=:eVEv0T0OpY62vKa+4Lss2U
	ixU+vaG4sFu0kGde0mQKSXocZAqJpbA6CaS7wCI/Z62TjI0t8MfgCJGuZKOe99CJF4d5/fbRS
	xfclj1QZKcn79Dl6hFVIcN1Y5z3bMsGiQbF6GNBkW6Zquf8M+5RigVxfzHieC2wsed7UAyHg6
	3etKUjrNW0iZXoqBlGbTqRqltQakU6iZPVFLzoH8KuQ/zUnKmyQRNz4kZkROGlHt5006wkGpo
	i4JVD3zksstuqFHmaqyRSRs/vYYw370ZanghELlhvq8ZtwvsUDyktO8bpnDASFjoELKY/S8/F
	C0KKNCsnOZsFHYwY+o9ps7qeUzKCWDf0sn0veajne0QeU78WeJ2HqipZHheErM53miY92PkIM
	+4ON6Pi1pUEyHgQCQtvQWk3sPG8jaD3IP4Z3JS+J0yqEv49D6bsy5mEL2P//HouxA4EcBrRmZ
	x9XwHTAmu+jRM+KkIIaxFic3KyWAQl3nX+Kr2Z2EdknFegdJvfU28jBSaU81JwLiKKpDa+1Qj
	4pbIcXF9idBRbZBJ/KdGXIzd6QKXY125tkoosqIV20ebwKBHDz79KwE0L9+YjkzaZGnrv7Oqp
	lHlS/Si8e+u1nniwkcxkkQx3AhgqeqqeuSNZzKTcoz5fS4EijRn8up2sZU2ldvO3BECihZSlK
	gNzq8n4XuQX0oymtBH8WMebOz1myMZ+Y4AEDUhBdsTekJUc2BY6/7+deJH+EPapYh1KUsnlMz
	zbsqqZKcQ9EC7qrApIY66v7G1L9pqQJatcUldQ+65ZUZCU/2k5p9aNouvOw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-arm] [PATCH] linux-user/syscall: let recvfrom(struct
 sockaddr *) use abi_ulong
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZtcezbYdtlva

Le 23/01/2018 à 16:23, Guido Günther a écrit :
> Hi,
> Thanks for having a look!
> 
> On Tue, Jan 23, 2018 at 11:52:22AM -0300, Philippe Mathieu-Daudé wrote:
>> Currently recvfrom() is restricted to handle 32-bit pointers,
>> remove this limit for 64-bit hosts.
>>
>> This fixes:
>>
>>   31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) = 3
>>   ...
>>   31572 sendto(3, {{len=124, type=0x454 /* NLMSG_??? */, flags=NLM_F_REQUEST|NLM_F_ACK, seq=1, pid=0}, "op=test:message acct=\"?\" exe=\"/tmp/nl-bad-addr\" hostname=localhost addr=? terminal=/dev/pts/2 res=success\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) = 124
>>   31572 ppoll([{fd=3, events=POLLIN}], 1, {tv_sec=0, tv_nsec=500000000}, NULL, 0) = 1 ([{fd=3, revents=POLLIN}], left {tv_sec=0, tv_nsec=499993180})
>>   31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa3897e0, 0x42) = -1 EFAULT (Bad address)
>>
>> Reported-by: Guido Günther <agx@sigxcpu.org>
>> Message-id: 20180123120541.GA14216@bogon.m.sigxcpu.org
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/syscall.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 11c9116c4a..28805b1785 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -4032,7 +4032,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
>>      if (!host_msg)
>>          return -TARGET_EFAULT;
>>      if (target_addr) {
>> -        if (get_user_u32(addrlen, target_addrlen)) {
>> +        if (get_user_ual(addrlen, target_addrlen)) {
>>              ret = -TARGET_EFAULT;
>>              goto fail;
>>          }
>> @@ -4053,7 +4053,7 @@ static abi_long do_recvfrom(int fd, abi_ulong msg, size_t len, int flags,
>>          }
>>          if (target_addr) {
>>              host_to_target_sockaddr(target_addr, addr, addrlen);
>> -            if (put_user_u32(addrlen, target_addrlen)) {
>> +            if (put_user_ual(addrlen, target_addrlen)) {
>>                  ret = -TARGET_EFAULT;
>>                  goto fail;
>>              }
> 
> Ahh...I saw these and was wondering how this would work on
> 64bit. Unfortunately the patch doesn't change things:
> 
>     4824  recvfrom(3, 0x1401f8eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xffffe10a8620, 0x42) = -1 EFAULT (Bad address)
> 

And more, I don't think the patch is correct.

get_user_u32()/put_user_u32() should be correct because in kernel this
is an "int *". And "int" is always 32bit. Only ptr and long vary.

Thanks,
Laurent

