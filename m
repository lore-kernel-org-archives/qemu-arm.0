Received: by 10.25.221.202 with SMTP id w71csp910610lfi;
        Fri, 11 Aug 2017 06:50:44 -0700 (PDT)
X-Received: by 10.55.214.138 with SMTP id p10mr12151484qkl.144.1502459444868;
        Fri, 11 Aug 2017 06:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502459444; cv=none;
        d=google.com; s=arc-20160816;
        b=nPFL4OdP810O16/z6KoeJMNYL+gKDKaJYpO7Uqtcqyc4kY5/yZItSIy3M509qxLljT
         iJQOHJONd3fDYpDzTYtoZcRYp9Ogd4C/p5QGHGVLB+9x9/bruDzlyZ2lDAXBpOob7Hnb
         dEE0f6vsXegpi+Ksmxq+FV0Dg84aA61jvrnEBf1SUBMPc6NBlo/c5OUWEJer+zb1n/YA
         mNhNQlKOzEfDEZ79ZIL5C23S4Xw9VWvmNp7R/ZXUg01CQ1MQIzwaif/hgvopJeaY80f8
         PKwmgIUbrAQ5mxqK8SqoFrJGG6b025/DasCL5WnOTPn+FWrEBLLgKUiciU+k5AATWOm/
         jLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=/bvP1GYhFYmk93rfbBwqZL9EYKOE7I8X8ebtn7cNLLc=;
        b=dUeyhP4ilnDH7kdXObgGr+z1ZlMVvGVmpCTGtVD3SzagqXaalWTEFBv4FmgN1PeKc6
         JFUDikFFUI3rVgOuWnIyb4mUWCIhO5Uj0sQaozBTU7vZ2vh4gaZmjHseZ5XszBgc7U1P
         WvwHLS6R/UmIWIyiS+h7WG2N5U94UHjTFVd8Dcdlu5cpwImWhq8ApfdGmt8x0n2vqwTL
         0qMJsdwwVDwne3ywRSdkWdDneWa13YlWFyiF+dimy8ttdvPsKvsAcomdFNYPH/aLcBsN
         bXinBoCHP0lL1hVmiK4kbQSOEhtstfcNtUvrZ+TCkYXbC2woDbCMaf3ZSaJSZwV3n3pj
         BCzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hLeNPpQo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184si824445qkc.67.2017.08.11.06.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 06:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hLeNPpQo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgAKn-0000NP-4R
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 09:50:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgAKi-0000My-FB
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 09:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgAKf-0000IA-5f
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 09:50:36 -0400
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:33738)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgAKe-0000HL-To
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 09:50:33 -0400
Received: by mail-pg0-x22d.google.com with SMTP id u5so15936516pgn.0
	for <qemu-arm@nongnu.org>; Fri, 11 Aug 2017 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/bvP1GYhFYmk93rfbBwqZL9EYKOE7I8X8ebtn7cNLLc=;
	b=hLeNPpQoa4gcOKHO1M8+ksursdpQ5ERld5sbYlEayNURX3otO2GfubjU4I4hLX9wH8
	XRPFeQvT/jajETeud+sgBb0o+LN7xy2O9XN1MY4ZRsxSw4e6HWtACG8Mp2MhC1EpNEPV
	ZfMObYD8A0skkf/aha3IDFyQl9A6pPGc4aA7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/bvP1GYhFYmk93rfbBwqZL9EYKOE7I8X8ebtn7cNLLc=;
	b=YPY/gIhkdL3Lf6OnEY9q5t+EE7ijwob4zoPy454aMYv2dDGVpKajryoEaFhsYeePVW
	89xsRik9HYJ/eP+TmAncTDMW6Tofj7bjppa8jz5f0kN88lLag1XPVjDrFEPktw2gtHlq
	hPMLym14Fo7Qm9VsSNbOCf7CLcEtM7GI0XGRoI3kbgo3wQh0oKxOU2Wy9JqtPnyLcxTK
	M1k1+Hw0QzzZm3xxh99Beb/9VwNMc0Cj/OE11xyYRGxZkxFEkfiyXX1r2qoXAqu5uPVl
	410daALruBd7YaZqWapk3MApftw31KpGUKN0q131gmr2NiSuU7IxEyfAb00SHbhsWNBv
	kU8A==
X-Gm-Message-State: AHYfb5hSUuQphJxoHyOcyXzgjuSxkax0Zjwmf3xlXg6t3ctJr02UF9+4
	GB5l1ChSB4L2P2xr
X-Received: by 10.99.136.66 with SMTP id l63mr15438396pgd.284.1502459431766;
	Fri, 11 Aug 2017 06:50:31 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	x2sm3177971pfe.129.2017.08.11.06.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 06:50:30 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1502116754-18867-1-git-send-email-peter.maydell@linaro.org>
	<1502116754-18867-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fda3a773-3bec-6de5-1e78-cc55f0e22843@linaro.org>
Date: Fri, 11 Aug 2017 06:50:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502116754-18867-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] loader: Handle ELF files
 with overlapping zero-initialized data
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
Cc: Hua Yanghao <huayanghao@gmail.com>, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7HFqGqXGzTsn

On 08/07/2017 07:39 AM, Peter Maydell wrote:
> For embedded systems, notably ARM, one common use of ELF
> file segments is that the 'physical addresses' represent load addresses
> and the 'virtual addresses' execution addresses, such that
> the load addresses are packed into ROM or flash, and the
> relocation and zero-initialization of data is done at runtime.
> This means that the 'memsz' in the segment header represents
> the runtime size of the segment, but the size that needs to
> be loaded is only the 'filesz'. In particular, paddr+memsz
> may overlap with the next segment to be loaded, as in this
> example:
> 
> 0x70000001 off    0x00007f68 vaddr 0x00008150 paddr 0x00008150 align 2**2
>          filesz 0x00000008 memsz 0x00000008 flags r--
>     LOAD off    0x000000f4 vaddr 0x00000000 paddr 0x00000000 align 2**2
>          filesz 0x00000124 memsz 0x00000124 flags r--
>     LOAD off    0x00000218 vaddr 0x00000400 paddr 0x00000400 align 2**3
>          filesz 0x00007d58 memsz 0x00007d58 flags r-x
>     LOAD off    0x00007f70 vaddr 0x20000140 paddr 0x00008158 align 2**3
>          filesz 0x00000a80 memsz 0x000022f8 flags rw-
>     LOAD off    0x000089f0 vaddr 0x20002438 paddr 0x00008bd8 align 2**0
>          filesz 0x00000000 memsz 0x00004000 flags rw-
>     LOAD off    0x000089f0 vaddr 0x20000000 paddr 0x20000000 align 2**0
>          filesz 0x00000000 memsz 0x00000140 flags rw-
> 
> where the segment at paddr 0x8158 has a memsz of 0x2258 and
> would overlap with the segment at paddr 0x8bd8 if QEMU's loader
> tried to honour it. (At runtime the segments will not overlap
> since their vaddrs are more widely spaced than their paddrs.)
> 
> Currently if you try to load an ELF file like this with QEMU then
> it will fail with an error "rom: requested regions overlap",
> because we create a ROM image for each segment using the memsz
> as the size.
> 
> Support ELF files using this scheme, by truncating the
> zero-initialized part of the segment if it would overlap another
> segment. This will retain the existing loader behaviour for
> all ELF files we currently accept, and also accept ELF files
> which only need 'filesz' bytes to be loaded.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/elf_ops.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

