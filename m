Received: by 10.28.71.27 with SMTP id u27csp4153542wma;
        Tue, 23 Jan 2018 07:06:10 -0800 (PST)
X-Google-Smtp-Source: AH8x224Uge5VhIHZqpb3GU6ILLCQl+hRyzSbWrgXoNt1OqMoxgapEl6r4LzMn72jdnjy9P9wBxPr
X-Received: by 10.129.159.17 with SMTP id w17mr2825431ywg.23.1516719969359;
        Tue, 23 Jan 2018 07:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516719969; cv=none;
        d=google.com; s=arc-20160816;
        b=1Jfknxf8t/9y3MwI7hXUYchRg0QBlKlPyq4Fn9ObFZRYFJ79TETffURpLnk+rvHUDi
         RkY09zvt7sBvTyKJyP9GZg7CyBbbicy2mbLz93APuJIk9O/td2+NsEtbZSyfG2CQjTGq
         UujnVaMDSN/CwHf5HRPEGqodlnI7IT9yRSrKSMVfNty667/fznTNmsQYqtkm1U0zlvLL
         nCBlzmDnkC6ny1l1QwD84T5Wrs7zvVNghSe16DlDIIPuEs1Qv5nBJwKoQzq9xzlHg2bl
         uC7qTQ1vKKrN9J2I5GEI6f4SCDFKX9nSNorTbU6IKVbr7h14+PYyvHkRDet0ZYopjce9
         mQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=JYxo94Oxo2hTBn+2mqPYZjQuJ8KxCC/aWXObBWLwiTM=;
        b=ACmtxakbB+aPqeOME8EV5H7W3MnMPObiNMNhteeQkC6UhMl6XGHVatJvgdRvTcYuvd
         EH2oxGrQuMcOiWnM/2kwoJ7Dlux6Y835Yw6foshoB+bHrPh9PEyoDqZlj0aDLZa6uSa6
         FdWuFK+qsHlrsobhpWAsx+2bkDB7dpnAsmI+unHO5XAqZFlVPzwQwfwavSRBBtYTFqtz
         1gzLu9b2AACWGwEcDphbyoPz6QpjvCNDxVNpUiEBd3PuhDYQISprqiQH45gHjgU3btL7
         zVjbTDjEu0NNzeRAOAicfHltExFBHp/Z02ljY3C6Wend/MZcpzCao2cKE7yQ5KfxyTYN
         PrLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ehaYWWOf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o126si2467599ybb.56.2018.01.23.07.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 07:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ehaYWWOf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee09I-0004zY-Ay
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 10:06:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ee08r-0004yO-Od
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 10:05:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ee08h-0001mU-TJ
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 10:05:41 -0500
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:44098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ee08W-0001XB-LW; Tue, 23 Jan 2018 10:05:20 -0500
Received: by mail-qt0-x230.google.com with SMTP id l20so1969508qtj.11;
	Tue, 23 Jan 2018 07:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JYxo94Oxo2hTBn+2mqPYZjQuJ8KxCC/aWXObBWLwiTM=;
	b=ehaYWWOfdDhVAZbx7h6r1vaN9h8yHs3TgRI8EN1UtclYtbRoXaWbyVkgV4UFfi05he
	JrKjNqHiRfnXRsIdqCDWwT0v58+lKpJdnRlru4qo9tnZW9Wx9DSjG7j9xRWvB3ON8DwE
	zUA2JIM4WBLyHBaWLGcps9+ofpJGCKjuzcwsMqGlQ3jNdotjFVP5xrggPQ+Ws8Z/vriy
	73ezut15RuPJY+ughVIAbSVYsBZwktrFTRDivemXNF4HztWqMEZrQ0zfQQEe5+YdPB7p
	fk+Jcomi9Ao2GQmETDhBd7q/AWWdmzYIjU0SWlPY1PARR6Zo/3LxS+m4sS04kluufh2Z
	YvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JYxo94Oxo2hTBn+2mqPYZjQuJ8KxCC/aWXObBWLwiTM=;
	b=g1jogkZJdOE8OicaApfB4ru5P6WAv5nR8PkJs4Y1MyTDJeiK+4l0izw1Lud+WLqFL+
	TQM2YweTpcceUjUBEUoKHOYdq0kxZ30TOW3qk3d90SCog7/9+CDC7yMpoNTyAeBqqn4g
	mMQeTAlJbHU9mONN3JwoVfW/IeqFgBjs6V4/nww5lYPfBnha/EhLjnvxPPp07gCAozlC
	Z8+JpXnU5PHAUqodq54+mofd5SOiTd+IhHKgujWX6e7cwG9KZ/1KeD/uCDImFLc91BSf
	D8lEZvioEwROwEPvbcSYZJUdzhINeTY8fUfD/OdM6FO/upXI9s2VCWmmUiliiNsJLTi1
	cAUw==
X-Gm-Message-State: AKwxytem3LdaHK7e6fG2ohcifl7pNK0G8z2PWOtwK25CyDEwXf/THzCH
	28ob0+jY7BdxDU4XOpdoQtzuxrJl
X-Received: by 10.55.188.131 with SMTP id m125mr3671123qkf.251.1516719919818; 
	Tue, 23 Jan 2018 07:05:19 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	k1sm12034583qke.15.2018.01.23.07.05.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 07:05:19 -0800 (PST)
To: Laurent Vivier <laurent@vivier.eu>
References: <20180123145222.2487-1-f4bug@amsat.org>
	<f3ef3c07-33cd-bafc-635d-13c66732ffe2@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <42af52b1-12e3-cc4c-6fbf-c58d82bf2f02@amsat.org>
Date: Tue, 23 Jan 2018 12:05:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <f3ef3c07-33cd-bafc-635d-13c66732ffe2@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UaCUUGQIwbZE

On 01/23/2018 12:00 PM, Laurent Vivier wrote:
> Le 23/01/2018 à 15:52, Philippe Mathieu-Daudé a écrit :
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
>>
> 
> I think there are more problems like that (accept4(), do_getpeername(),
> do_getsockname()).
> 
> Could you check and fix?

I'm currently reviewing those ;)

I sent this patch first so Guido could start trying.

> 
> Thanks,
> Laurent
> 
