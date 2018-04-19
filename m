Received: by 10.28.4.212 with SMTP id 203csp510857wme;
        Thu, 19 Apr 2018 04:00:41 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+Xb6V48FCkP1ko6MkCoDEwKyQWE4Au6TktfsF5+PqGuADaNUCx4Q2CohEat6q5Yr15Ifd/
X-Received: by 2002:aed:3fd0:: with SMTP id w16-v6mr5698404qth.315.1524135641537;
        Thu, 19 Apr 2018 04:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524135641; cv=none;
        d=google.com; s=arc-20160816;
        b=C8hFkgdNMPpF2cl88M49wh7C0NoDPcd4t/tEJ94MRxxALyB5Idv4R+gWg5OiiuUN4P
         eJqTUxFSzmvU3wep/323R7QOl5Yo/t5a97jffDDuUQ8D5iy7rdDI+86ermCI9L7/Jd+I
         88jeN1o9QRT8blAW6fOFOk9qwEJhiO1ibcHhJ+jLWRrRLxixjcCSLdBaSurrnVdYty9E
         iYZupZ8UdBoz6f1DTtCcvC2p1iVTMw/13/yqC96hCSxCEDoFxyIs+xB5EtzcvltSQ1tU
         9lqgrALczFJjiqwiD4ltdw8iTxxishX5Yhbz615JxIH8c8ZaXj7AT4IZ69dt7GyZpCHD
         WAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mVyiFc2B5QEbnfu78H3CUqYMK3au/GMX3M9BNASn1Z8=;
        b=LeSTzeXFmybuBkUzT+SGmU4rjCrCmT3bqwsCp5BW/kKsnB73AFZfSFx90PUidiMSzf
         NtDN9OOAjHTJ31PkFww4vqBoA0nyX9Yb8alQlwIEAmGtxkpkTGbKVjqCiogiuj90CKWE
         Fylnp41ccqaNGfg/mxgyX3upy/A2yAWIA+ijvr+WVQWJXOJ4A0tDq2oNsRq4wWj8yAU3
         VRWYseEpu68E0GLZ6yD8Il6juamvzkA6HZf5ynnJmHRUvLmVmU48WmD2nJmbPWG895gy
         BKGQk19RZlmGuTrApz0gunqUA0K7QLCUHmpjMqG73L8ItR5mjBd1PWQaIiZO3ZdXzL+0
         oDOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlWYbjhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k26si74616qve.98.2018.04.19.04.00.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 04:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlWYbjhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f97Iu-0008Ag-W6
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 07:00:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f97Ig-00089M-Ai
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:00:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f97Ic-0002Fp-6h
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:00:26 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f97Ic-0002FP-0F
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 07:00:22 -0400
Received: by mail-ot0-x243.google.com with SMTP id d9-v6so5342664oth.10
	for <qemu-arm@nongnu.org>; Thu, 19 Apr 2018 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mVyiFc2B5QEbnfu78H3CUqYMK3au/GMX3M9BNASn1Z8=;
	b=MlWYbjhFbBktaQ4xLwRAu0vjkjWHkhY9gS3pww9JPTNJtOrRqNsDOuOV4GW6LssPzC
	TzQfoJuQTaMJr9WtLja+0kh/F4Qpo0uG7BbQCjZrty4xMOHSpJH2i8C+pk7/67Qzzmbw
	+Its/oTl6SKpPZfcY/aMAowIfvB8USm1hc1hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mVyiFc2B5QEbnfu78H3CUqYMK3au/GMX3M9BNASn1Z8=;
	b=LnfVmatxZXs9yUlkhsJzR3BMait8kAk0NMMTGrN0YcO+UcthXuopbISdFStBIxSZDs
	l5s2MWB34NGj3I8jwRKvu0gBVda1vvEVirUwZ7x9fp6XZDNRDaiY+QinhaeDPj7wTGB2
	tt8A98/PKibsRpf0cIn7aqIAADYlPmDLTTbf5PkCl/xqTgJhDWqsGrpg/voHpvJUfXLf
	D3EY+JaFdmUieBmfjwNUWd/y47hkpHavW9s19QYIJKEq/s2HTy2H2rhcAFMTPrbikxKF
	VBCrNBtn7oucXzhwVMYTdDnhGaxuA7MuJXidsYqcyyxLxbz7dpFUu2XMYmrzuHJKcl4r
	dRrg==
X-Gm-Message-State: ALQs6tDZcCRu2dHZbBKQJF0qICEQR3M7wPeacfaQ0yKOYBt/ZMCGQm4O
	p0cS4earx11/eFFtHH5DxdoG1E2zp3xCzskOczfuuA==
X-Received: by 2002:a9d:4a90:: with SMTP id
	i16-v6mr3828584otf.294.1524135620953; 
	Thu, 19 Apr 2018 04:00:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 19 Apr 2018 04:00:00
	-0700 (PDT)
In-Reply-To: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
References: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Apr 2018 12:00:00 +0100
Message-ID: <CAFEAcA9d=oEKfnW0Jr2vrSD8mu0xPbUYk6PAk7dxUqXjJUTooQ@mail.gmail.com>
To: Henry Wertz <hwertz10@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000004726c6056a317a38"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] getdents patch for 64-bit app on 32-bit host
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dqPzmfI8IGVm

--0000000000004726c6056a317a38
Content-Type: text/plain; charset="UTF-8"

On 17 April 2018 at 22:53, Henry Wertz <hwertz10@gmail.com> wrote:
> Peter Maydell has raised a concern about possible buffer overflows in this
> code (which was meant to handle 32-bit app on 64-bit system, not 64-bit on
> 32-bit).  I must admit I haven't gone through the dirent-copying code with a
> fine-toothed comb... it appeared to work for my use case.  That said, the
> code seems to be careful about using offsetof() rather than making any
> assumptions.  In addition, the dirent-copying code appears to have an assert
> that would crash qemu if it was going to write past the end of the dirent
> buffer -- always nice to have plenty of sanity checks!

If you build the attached test program for x86-64 (which is a
minor tweak on the test program in the Linux getdents manpage):
 gcc -g -Wall -o /tmp/getdents getdents.c -static

and then on a 32-bit Arm host take a qemu-x86_64 with your patch
applied, and a test directory like this:

$ ls /tmp/testdir/
abcd  abcde

and run it, QEMU will abort on the assert that we don't run off
the end of the buffer:

$ ./build/all-a32/x86_64-linux-user/qemu-x86_64 ~/getdents /tmp/testdir
linux_dirent struct size 24 bytes
buffer space 32 bytes
qemu-x86_64: /home/peter.maydell/qemu/linux-user/syscall.c:10197:
do_syscall: Assertion `count1 + treclen <= count' failed.

This is because the guest linux_dirent is bigger than the host
linux_dirent, and therefore just because the host syscall
successfully fit the record into the buffer doesn't mean we
can fit the guest record into the buffer.

I don't see any way to fix this, because the records are variable size.

thanks
-- PMM

--0000000000004726c6056a317a38
Content-Type: text/x-csrc; charset="US-ASCII"; name="getdents.c"
Content-Disposition: attachment; filename="getdents.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jg6ez6p61

LyogZ2V0ZGVudHMgdGVzdCBwcm9ncmFtLgogKiBKdXN0IHJlYWQgYSBzaW5nbGUgZGlyZWN0b3J5
IGVudHJ5LCB1c2luZwogKiBhIGJ1ZmZlciBleGFjdGx5IGJpZyBlbm91Z2guCiAqIFRoaXMgaXMg
dGhlIHRlc3QgcHJvZ3JhbSBmcm9tIHRoZSBMaW51eCBnZXRkZW50cyBtYW5wYWdlLAogKiB3aXRo
IGEgZmV3IHR3ZWFrcy4KICovCgojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxkaXJlbnQu
aD4gICAgIC8qIERlZmluZXMgRFRfKiBjb25zdGFudHMgKi8KI2luY2x1ZGUgPGZjbnRsLmg+CiNp
bmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4K
I2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgojaW5jbHVkZSA8
c3RyaW5nLmg+CgpzdHJ1Y3QgbGludXhfZGlyZW50IHsKICAgIGxvbmcgICAgICAgICAgIGRfaW5v
OwogICAgb2ZmX3QgICAgICAgICAgZF9vZmY7CiAgICB1bnNpZ25lZCBzaG9ydCBkX3JlY2xlbjsK
ICAgIGNoYXIgICAgICAgICAgIGRfbmFtZVtdOwp9OwoKI2RlZmluZSBCVUZfU0laRSAzMgoKI2Rl
ZmluZSBoYW5kbGVfZXJyb3IobXNnKSBcCiAgICBkbyB7IHBlcnJvcihtc2cpOyBleGl0KEVYSVRf
RkFJTFVSRSk7IH0gd2hpbGUgKDApCgojZGVmaW5lIENBTkFSWSAweGZmCgppbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCnsKICAgIGludCBmZCwgbnJlYWQ7CiAgICBjaGFyIGJ1ZltCVUZf
U0laRSAqIDJdOwogICAgc3RydWN0IGxpbnV4X2RpcmVudCAqZDsKICAgIGludCBicG9zOwogICAg
Y2hhciBkX3R5cGU7CgogICAgcHJpbnRmKCJsaW51eF9kaXJlbnQgc3RydWN0IHNpemUgJWxkIGJ5
dGVzXG4iLCBzaXplb2Yoc3RydWN0IGxpbnV4X2RpcmVudCkpOwogICAgcHJpbnRmKCJidWZmZXIg
c3BhY2UgJWQgYnl0ZXNcbiIsIEJVRl9TSVpFKTsKICAgIG1lbXNldChidWYsIENBTkFSWSwgc2l6
ZW9mKGJ1ZikpOwoKICAgIGZkID0gb3BlbihhcmdjID4gMSA/IGFyZ3ZbMV0gOiAiLiIsIE9fUkRP
TkxZIHwgT19ESVJFQ1RPUlkpOwogICAgaWYgKGZkID09IC0xKQogICAgICAgIGhhbmRsZV9lcnJv
cigib3BlbiIpOwoKICAgIGZvciAoIDsgOyApIHsKICAgICAgICBucmVhZCA9IHN5c2NhbGwoU1lT
X2dldGRlbnRzLCBmZCwgYnVmLCBCVUZfU0laRSk7CiAgICAgICAgaWYgKG5yZWFkID09IC0xKQog
ICAgICAgICAgICBoYW5kbGVfZXJyb3IoImdldGRlbnRzIik7CgogICAgICAgIGlmIChucmVhZCA9
PSAwKQogICAgICAgICAgICBicmVhazsKCiAgICAgICAgcHJpbnRmKCItLS0tLS0tLS0tLS0tLS0g
bnJlYWQ9JWQgLS0tLS0tLS0tLS0tLS0tXG4iLCBucmVhZCk7CiAgICAgICAgcHJpbnRmKCJpbm9k
ZSMgICAgZmlsZSB0eXBlICBkX3JlY2xlbiAgZF9vZmYgICBkX25hbWVcbiIpOwogICAgICAgIGZv
ciAoYnBvcyA9IDA7IGJwb3MgPCBucmVhZDspIHsKICAgICAgICAgICAgZCA9IChzdHJ1Y3QgbGlu
dXhfZGlyZW50ICopIChidWYgKyBicG9zKTsKICAgICAgICAgICAgcHJpbnRmKCIlOGxkICAiLCBk
LT5kX2lubyk7CiAgICAgICAgICAgIGRfdHlwZSA9ICooYnVmICsgYnBvcyArIGQtPmRfcmVjbGVu
IC0gMSk7CiAgICAgICAgICAgIHByaW50ZigiJS0xMHMgIiwgKGRfdHlwZSA9PSBEVF9SRUcpID8g
ICJyZWd1bGFyIiA6CiAgICAgICAgICAgICAgICAgICAoZF90eXBlID09IERUX0RJUikgPyAgImRp
cmVjdG9yeSIgOgogICAgICAgICAgICAgICAgICAgKGRfdHlwZSA9PSBEVF9GSUZPKSA/ICJGSUZP
IiA6CiAgICAgICAgICAgICAgICAgICAoZF90eXBlID09IERUX1NPQ0spID8gInNvY2tldCIgOgog
ICAgICAgICAgICAgICAgICAgKGRfdHlwZSA9PSBEVF9MTkspID8gICJzeW1saW5rIiA6CiAgICAg
ICAgICAgICAgICAgICAoZF90eXBlID09IERUX0JMSykgPyAgImJsb2NrIGRldiIgOgogICAgICAg
ICAgICAgICAgICAgKGRfdHlwZSA9PSBEVF9DSFIpID8gICJjaGFyIGRldiIgOiAiPz8/Iik7CiAg
ICAgICAgICAgIHByaW50ZigiJTRkICUxMGxsZCAgJXNcbiIsIGQtPmRfcmVjbGVuLAogICAgICAg
ICAgICAgICAgICAgKGxvbmcgbG9uZykgZC0+ZF9vZmYsIGQtPmRfbmFtZSk7CiAgICAgICAgICAg
IGJwb3MgKz0gZC0+ZF9yZWNsZW47CiAgICAgICAgfQoKICAgICAgICBpZiAoKHVuc2lnbmVkIGNo
YXIpYnVmW0JVRl9TSVpFXSAhPSBDQU5BUlkpIHsKICAgICAgICAgICAgcHJpbnRmKCJCdWZmZXIg
b3ZlcnJ1bjogc3lzY2FsbCB3cm90ZSBwYXN0IGVuZCBvZiBidWZmZXJcbiIpOwogICAgICAgICAg
ICBleGl0KDEpOwogICAgICAgIH0KICAgIH0KCiAgICBleGl0KEVYSVRfU1VDQ0VTUyk7Cn0K
--0000000000004726c6056a317a38--
