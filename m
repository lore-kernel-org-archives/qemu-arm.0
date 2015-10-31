Received: by 10.182.105.169 with SMTP id gn9csp342240obb;
        Sat, 31 Oct 2015 03:36:23 -0700 (PDT)
X-Received: by 10.140.42.166 with SMTP id c35mr16412213qga.66.1446287783435;
        Sat, 31 Oct 2015 03:36:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d98si9763270qkh.121.2015.10.31.03.36.23
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sat, 31 Oct 2015 03:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:55005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsTWI-0001z2-Qi
	for alex.bennee@linaro.org; Sat, 31 Oct 2015 06:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsTWG-0001ys-Kp
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 06:36:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsTWF-0003R9-NG
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 06:36:20 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsTWF-0003Qt-HI
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 06:36:19 -0400
Received: by vkgy127 with SMTP id y127so61817541vkg.0
	for <qemu-arm@nongnu.org>; Sat, 31 Oct 2015 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jK9kUtAZnC/qGexDUW731Ud+Do5QOcEbAeHgkOj9Hfw=;
	b=QXiwXZf4j9p/SzPDNX421SednzDDh7XhIkwW3w92gH219YiAvBfBOaglg5RE4Y8dBD
	/cugLbNpX/6iaKnJe871oCUVAIfDuAA1Yd/RGsETEDWO2/gXkZ+1aYlCwCAtYdyZLR9d
	H4NfS+Wsec4LpIR64iKX0f8w7s0NVgdcOtH0IeFCY8oPslEiyEqUCI4djlSyJ3B2XizE
	4pyyPlwl2kLyH9UertBMNEl6c5D2OeOnr+75vdixLvmkWcOz7ekRrm5nca0YJ6CrXqpS
	pr9TP6vmvWKtkw2LyQDPNgaARwjBEbUTPbb+4zA0/L/BKeiwzlrlKgoYhHPA1GLgM4Or
	+6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jK9kUtAZnC/qGexDUW731Ud+Do5QOcEbAeHgkOj9Hfw=;
	b=MomksRTWSacP85NCIsObKPxceA6EzEezbY3ysAXkv+qz7d6at/t7U/ZaBK03x6HBcj
	U1Isz43MhugmAvp3OaWo1os9wD1njoUVIaL9tW8vvZN+p9vAu81Ajn4jjL/zxvsHI6E/
	l8/YZ5ZCp2wAAXw5Me/VPrVjaqeAGN8HffWwaEenwLfAQ1YHVaziL+D0vFOPpi7Ez3OA
	na/D9OCZ2+9oanZ3kSWILraDBe/7I2/z9A8Di5Jk7QVqO67yM+u38ovbmnohQcONIa70
	gXNRZXp1qgrhqqDLEgAqSdG9uLA7C5R15yuIqCMpzKpn4iW7xPGzcmJKeUBRYyPj2wu2
	tZzg==
X-Gm-Message-State: ALoCoQk4UZ4YsS9S0oFJnchVfCBKEVke+BlsM7vyxNe7uBNqVAZO9mvapCF2gCL0KJ1lqvXj+1UM
X-Received: by 10.31.107.18 with SMTP id g18mr8622261vkc.6.1446287779169; Sat,
	31 Oct 2015 03:36:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sat, 31 Oct 2015 03:35:59 -0700 (PDT)
In-Reply-To: <CAPokK=rLGL4PW_qMVA_Ve4xTm9Uzrm-FSPDtN9pdHv5iSohn0w@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<8f5368aaa0623a87797edc2305d7f7eac40b2e32.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9yMi1Ye7n2sQtQ8-fRoothTV=3TjeXmnQCJbE4=0AHGg@mail.gmail.com>
	<CAPokK=oiMULpbMWiCXLA+NVNgKd78vLWZnc4Sekrk+FYakFXfA@mail.gmail.com>
	<CAFEAcA8yZOfDhXG+u9W3xhSuMk_cwdGYJ6V-1NVW=jb8HA6RRg@mail.gmail.com>
	<CAPokK=rLGL4PW_qMVA_Ve4xTm9Uzrm-FSPDtN9pdHv5iSohn0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 Oct 2015 10:35:59 +0000
Message-ID: <CAFEAcA_k01hHEJK7GvhMu8f1CSm41moZCCSiSRSYn77Y0xCY+Q@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 4/5] arm: boot: Add secure_board_setup flag
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RuoMw7Ci/OGp

On 31 October 2015 at 03:40, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 2:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 30 October 2015 at 20:59, Peter Crosthwaite
>> <crosthwaitepeter@gmail.com> wrote:
>>> On Fri, Oct 30, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> Is it an error for the board to set secure_board_setup if
>>>> the CPU doesn't have EL3? (if so, worth mentioning in this
>>>> comment; maybe assert?)
>>>>
>
> Does the same apply to secure_boot flag as well? I can't see any
> guarding or erroring out there. secure_boot is simply ignored when
> there is no EL3, and the same if on EL3 will apply to this new flag as
> well. If we need to fix this, we should fix them both together.

I started off this reply agreeing with you that we should fix both
of them. But then I realised that the two cases are actually different.

Our only current board that sets secure_boot is the vexpress
board, and the A15 version of that can happily boot in
non-secure or secure, because it doesn't need any SMC entry
points. So it works with KVM. (The A9 flavour wouldn't, but
KVM doesn't support A9 guests anyway.) That means that whether
secure_boot is in conflict with KVM or no-EL3 is a board
level decision (and it sounds like on highbank it should
perhaps be an error, though I have a feeling that suitably
configured kernels should be able to run in KVM, so perhaps not).

On the other hand, the secure_board_setup flag means the
board-blob must be relying on EL3 actually existing and
working (otherwise it would have provided a blob that worked
even in NS and not bothered setting secure_board_setup).
So "secure_board_setup + (KVM or no EL3) == error" is always
true for any board, and can be checked in boot.c.

So I think:
 * secure_boot + KVM is OK (or if it's not, it's the board
   code's job to error out)
 * secure_board_setup + KVM is not OK

thanks
-- PMM
