Received: by 10.28.71.27 with SMTP id u27csp4226205wma;
        Tue, 23 Jan 2018 08:12:50 -0800 (PST)
X-Google-Smtp-Source: AH8x227WsEthvDcWObNosbL8YD247e4wFQ88hZebpR6xg13y5ESUOJtD/otuLvVzn9o8bqD08N1i
X-Received: by 10.37.40.70 with SMTP id o67mr3013631ybo.262.1516723969860;
        Tue, 23 Jan 2018 08:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516723969; cv=none;
        d=google.com; s=arc-20160816;
        b=fxnnRZM+EtVVCkOS92vtx+ScKVKxVXZKDNrwW/N40FYmq8+ldiEGyv2jWMRcjYW2g6
         EdvuvH2wzL1bS5Ktxyxq4g4fHf54WRn8865JCL0ANE1pFWKJchGLAaGC6D4BpqwQ4Kwt
         W3TRjS8lkS11r1/O5VsZl/TPo8NP1hYflPdccMerMsW1p9dY7FI7HE4kbwUFjRLCMft/
         Y7EbRHyNwGsi0aHQMjocq8DX0TheHk92ncOCe8SJtijBNbUwW2Hxb4mLJ3qAV4sWzoVl
         U0JW89yAnYulaROUyrajUziyOjcHjyp0bAd1o86bsht4+JPlHSyR8DcmajTbTnizIhM6
         h6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=F7m10WrbrCHQ6lirzInk1pIFJL2bwS/O4uzra0gfmNc=;
        b=hDB43JK1OoWF7Holiu9uGL2Jt7RkITmQWQBUFGCSDfpv5Y2UPH1GnDB56ncREcDBJx
         gukx1hb8yVwS0kmjn8NBgPOWpXok03uJUgwrRAMWsXeqLgxR3G11IdVnBkGG0TrD2Zqz
         HjKLl8z69fZ6k55PkZ2w3C9CbuEN7lRNU1vfTG57lZSxgldMvHL9Cx1RkUWbj75sFpxx
         /7q85vTmNi9C/YnBqKR+eM4lVzr9/avz1GKVebaKxHzL2eOQlwXqKdh7VDBYkAAnEW+t
         kXvTJAPKtZOY6zqAzE8TDLKsY9UMwl5JMUqpomICGEijEhyCnWY4Bo3K235NoNkZr/Wy
         X7qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si987307ywi.767.2018.01.23.08.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 08:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee1Bp-00086N-C7
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 11:12:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee1Bh-00085i-6i
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 11:12:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee1Be-0005Lz-H8
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 11:12:41 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:55459)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ee1Be-0005LQ-7s; Tue, 23 Jan 2018 11:12:38 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LjLuJ-1fDc7I3K1P-00da1f; Tue, 23 Jan 2018 17:12:27 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180123145222.2487-1-f4bug@amsat.org>
	<20180123152339.GA23245@bogon.m.sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6d55a3e7-9d70-1ea1-2d22-65e136bda06b@vivier.eu>
Date: Tue, 23 Jan 2018 17:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180123152339.GA23245@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:Dq3KI5SYcfkueyJbO5O+jU7C9e/4mDX3hGfXtPfXQ7eJT26pdsG
	NMH0dKhShw+CF282BE6mxg9R6zFSgx3t/Pr92JS+qIKYQTR5OapYOwKROtxTOpkEN6R09fa
	LZit/q8ZEB/CUnRdFQUZJCsvMFXoPm8qzkjQHe7hMuODWMB1dbDEMJ8Yg2MOo8hwqLnih9T
	dtMvWG2E/OAMmYHjE6Y3Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:kO/bcliusyw=:+tslBEDbo7RalJIBLnOhKq
	dh1DceeU4MUl3NWIA8DHIidHfPsrpjaUWjB+Wc+0bQNMRs84f9/zWPzvC6AzKaIj5Nj+AI3qF
	KSvWaXix7bmGeO2I5HjES7M1/xlN/q9YPrkIJkm/gaGrFurUCgPqeouYjZICqQyg+3/5ILjox
	wMaJNBQbdjomZDq6rRN/qsEfOYVdRrlda/xoseUVEzJGTwf90orLxgyUjimfhy9LndnDRMFnf
	yrD28qp0YslM+j01Nz1vsbGzhYhS5bjTTVX5sNqV5NNZ6ZfSUdI9hF6OaV/s2TZXzUOUjQv7U
	RvgaRYrvj6owyyMfQLwh55JrzH9McgAOAY/ktAK9vVfwL3NMLIvD5e4kNuq6ljnIpW+IqL7Hs
	Fr51w4k+L48Qsq6EEU8tG7aqFSUn5QyzGeNkseh8HaJZwQBe8uNQNiDNCj/oi34D0PT4VIfCh
	RRrA31uo4ktIsfXNibAbCz+NpPNgtzTNufcRJCQ/Ku5JwpBbWg8DVFMY7/9roxgAruHvDH9OF
	N0sjSkrGAnQcwhY+VmYRFJl1TfJGmKH7X9EgJCTEyGz9epz1AvA2ldF0A4kwuzPcfIZxA2LTn
	D6rRYJhPRwuGv8FzY06WWKF+KIosPN7U0AzJsgyIjI7EXtgyqesZAVE2NyjTpJq/BONUwM41O
	C6vr3KVTRb9Hvx8PR7wexFnFeFmTg1ceVvUp+2fFCFfk4WJHEk3KlW1UKjXygozpeufhrHTEf
	O/dm6GVzCHTQ8CiPywkqjK4sp/m5HQXWs0kJrseuQf1Uyc02XNPTrp3gHjc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.10
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
X-TUID: mwQenWDVxo4G

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
> If you want me to report qemu -strace or s.th. please let me know.
> Cheers,
>  -- Guido
> 

Could you try:

strace -f chroot . /usr/bin/qemu-arm-static tmp/nl-bad-addr

to see if the fault comes from the kernel or from QEMU.

Thanks,
Laurent
