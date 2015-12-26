Received: by 10.182.158.201 with SMTP id ww9csp6966371obb;
        Mon, 28 Dec 2015 12:24:55 -0800 (PST)
X-Received: by 10.140.44.38 with SMTP id f35mr541007qga.49.1451334295489;
        Mon, 28 Dec 2015 12:24:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si66355748qkb.37.2015.12.28.12.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 12:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@treblig.org
Received: from localhost ([::1]:46119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDeLe-0007jC-T6
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 15:24:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dg@treblig.org>) id 1aCuCJ-0007e9-Bn
	for qemu-arm@nongnu.org; Sat, 26 Dec 2015 14:08:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dg@treblig.org>) id 1aCuCG-00065d-5w
	for qemu-arm@nongnu.org; Sat, 26 Dec 2015 14:08:11 -0500
Received: from mx.treblig.org ([80.68.94.177]:60591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dg@treblig.org>) id 1aCuCF-00064W-Qq
	for qemu-arm@nongnu.org; Sat, 26 Dec 2015 14:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org;
	s=bytemarkmx; 
	h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date;
	bh=BgGY0HO6RqoRqS3wto0476mwRZ6pgwSGOHG46Qu/+UI=; 
	b=EgktXLl7tpBssk5Auaa2ZqEy2uQzy84Oo+AVtklSdS39HKogLgCvOd5r0k+athLuBI2heIWHPcv6HTVZNPTNFJjwJJy1NXup8PIZ2UHNvihf29z72s7SEXGbGKc/UigIDgD6o+DDxZHJrF3xfHSJ2lzlpuKfFVUw8iPB4bBVwUbI5dGTQts2Ow36RuW13jyyRNjUcDhusF5hEfzVph76QSF7+qFFZV0RMiLW5rTTgS1T67JNDOOmg+CCnO6nrx91MmlvtFmrW514o5G1rhUWAGFNjPBotY7TFFvXMNleefxZshQSuESVTokBoyjAUJkHWKi7SPnUzD3XABN6FXwcJg==;
Received: from dg by mx.treblig.org with local (Exim 4.80)
	(envelope-from <dg@treblig.org>)
	id 1aCuC7-0003EM-SE; Sat, 26 Dec 2015 19:07:59 +0000
Date: Sat, 26 Dec 2015 19:07:59 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: qemu-arm@nongnu.org
Message-ID: <20151226190759.GA8638@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/2.6.32.65-kvm-i386-20150205-hg4accef0bb82b (i686)
X-Uptime: 16:58:27 up 155 days, 23:12,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 80.68.94.177
X-Mailman-Approved-At: Mon, 28 Dec 2015 15:24:53 -0500
Cc: alistair23@gmail.com, mdavidsaver@gmail.com
Subject: [Qemu-arm] v7m reset vs rom loading ordering
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
X-TUID: KmwkI7y0kkU8

Hi,
  I'm having problems with the v7m reset code happening before the loading
of the ROM code, and hence getting the wrong starting location.
I'm using the stm32f205 model (modified to take an m4 and change the
sizes of ram/flash for the 401), with a board that's the same as the
netduino. It has the stm's internal flash and an alias for that flash at
address 0.

arm_cpu_reset does:
        rom = rom_ptr(0);
        if (rom) {
            /* Address zero is covered by ROM which hasn't yet been
             * copied into physical memory.
             */
            initial_msp = ldl_p(rom);
            initial_pc = ldl_p(rom + 4);
        } else {
            /* Address zero not covered by a ROM blob, or the ROM blob
             * is in non-modifiable memory and this is a second reset after
             * it got copied into memory. In the latter case, rom_ptr
             * will return a NULL pointer and we should use ldl_phys instead.
             */
            initial_msp = ldl_phys(s->as, 0);
            initial_pc = ldl_phys(s->as, 4);
        }

I seem to be ending up on the bottom half of this (because of the alias?)
and it ends up loading both 0, even though I can see load_elf has already
been called.
The reset gets called after the realize triggered in the netduino board's
init function; but all that happens before the rom_check_and_register_reset
is called and gets the ROM data in the right place.

In Michael's world he has the extra comment (from 'remove extra cpu_reset'):
+    /* Realizing cpu calls cpu_reset(), which must have rom image
+     * already mapped to find the correct entry point.
+     */

so it sounds like the same problem, even in his world.
(I've hit this both on head and head with Michael's patches from the
start of December applied).

I've bodged around this by adding a call to arm_load_kernel to armv7m_realize
so that the arm reset handler is called and then doing a system_reset
after I get to the hmp; but obviously that's not the fix.
What's the right fix here - is the 'rom_ptr(0)' that arm_cpu_reset
doing sane given that I've got an alias?   Or does the load need
to be delayed?

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
