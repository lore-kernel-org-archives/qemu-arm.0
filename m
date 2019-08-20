Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4050421wrs;
        Tue, 20 Aug 2019 07:35:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrGyvAwEJ3LcyA8Ujlh36Imc42D5codHpOmi4ThUx9bTkwiWBvQdsUnfxRrnrgZR4ORw4Y
X-Received: by 2002:a17:906:94d3:: with SMTP id d19mr26754609ejy.298.1566311706127;
        Tue, 20 Aug 2019 07:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566311706; cv=none;
        d=google.com; s=arc-20160816;
        b=R8vwwJPDvhCTnk0QUmw9DO/LSfpnbj2dBbKQxz48r1xyLTe2MPfyp+TPrYc1sWV5Ur
         RVugFhYgQKKEaF0PHrzjtGJ3R7HIFQcG8Cbzc8YUopDIJwLP21x/qtIJ8TXXVxMW1IN1
         131ulThozUVfrqQwAKmUZxkP8B/bR3XrJUnYNkqyc3G2xpwtDIIFIl9J8TTDnNFoM5bu
         9BucdwXlGTW3Bul28vVYDgfDMndY0OQOpcfCSUvqUTZfyrPFWkdYscmh6am6BASq4UQt
         TWbVTVyLQIh61lQWMRDDrFcbjMF1wtPGQ+QIQu2/tDEu6xtRiHZtAOlioxbM96eZ417s
         qzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aBvFS+9iLTqJNkSg0ypWGt8/xHtp3PsRc80fO5M8+os=;
        b=afnerES1Bx3X7962hHWEkkAHIu4feah4okRjOEFn4x/iC5JF6DkXLg0D79Tt6mB3AW
         Fb3rSKIEExKXhCUa2yPZ5MnJ0SHHrBuBIlDP9TY0XkAtNdNXKIdoQFnGj2gsMGRFSQeD
         y+aXRVo0KNtPamGjs81wHRe9aWmurAKN7XGghW8gvjOjT6x+XICxSWcHSe0ayHSDeKZ8
         9JFAKSnh2X/3k1t/UpmyiWak/SAoD7hPS45JALqCB47E6/KlNeyZjThHqjidAKMv7c5a
         RVub5Tx0mjLljbfXxiROdDN08c+BquP4n6wUZW0NrllqP0n8Q2RBU/IZpzU7O4WmMwr3
         uy+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SNpGk12l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si766888ejk.3.2019.08.20.07.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 07:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SNpGk12l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i05E1-0004eW-4t
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 10:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i05Dk-0004di-NE
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i05Dj-0004tM-Kj
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:34:48 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36017)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i05Dj-0004t2-EC
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 10:34:47 -0400
Received: by mail-ot1-x341.google.com with SMTP id k18so5227885otr.3
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBvFS+9iLTqJNkSg0ypWGt8/xHtp3PsRc80fO5M8+os=;
 b=SNpGk12lQM0jJG2i3K54NM+hOgnQW9skgJhRuVsZ1yYyO2UmDjNP5TwbMgcNfDSEXs
 yw4aeIJgFo5A1bV/PFNkSbbDx2FttNUdILeVmvbK877c1+H9dh8z/ZxygHO3ZS5bWC3p
 X+ppk9q107dYFg17onkUchHPF2gMhSWYUUSf/4p+SrXadF4Bh8bMLdkcT9JOEdfL/nrc
 CB1dcEul0N9mQNrPIsiCCVI7Txy2F11ahaKOAVupou7VTcT+cR5bA8IP/x3EtsgJJO36
 gSjtBRvDk9kPU40iiQFvzDisRSqen/TdD08JFCZhcR0+Qibb5I7htsoDe2bHkHD/u4zQ
 Q6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBvFS+9iLTqJNkSg0ypWGt8/xHtp3PsRc80fO5M8+os=;
 b=XuOFX0uLxJbLieux3rMaVD5VRuJkTLLV/8ABiLXnDxXA218+uLIBWOWGnJacLLb82O
 p+Lmq4/FJp6qN7yOhJYSkfiwf8QgwLjpftwvqMf4LY94do9OYB5OWN8RmIdEUL2N5HlZ
 YUQDhsTzNhBW8Fmpl7yYpLDxZRnoUXenCMX+zrFjMG3Nupi+fJiCw3O/7YomW2V1tFJk
 vl4mXxH7jLvs5XGKj72l1z/VDu5pYE0IWmvN5nVxZ0xvw1wOHSpAoMl8Vu0apFHtVUS8
 d25y+/bdQAHz47H28hZVu1RR1R+/r3VgYDJ6bxRy8XvXuOXkFPdVag5pyVE1AYVgBA95
 vSMg==
X-Gm-Message-State: APjAAAXDTQWacuykoWXqRyBfy4vnWQNPYUz/oYR8Yn+IhqNBIZwlcBHE
 S7+rWOh4uTkRQTAOmitgfh8HLw3Typ7jDQ+RD8R7hw==
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr17915945otp.232.1566311686638; 
 Tue, 20 Aug 2019 07:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190820123417.27930-1-philmd@redhat.com>
 <3e3fcb30-1e12-eaf4-07a2-47d09aea2511@roeck-us.net>
In-Reply-To: <3e3fcb30-1e12-eaf4-07a2-47d09aea2511@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Aug 2019 15:34:35 +0100
Message-ID: <CAFEAcA99kKzWL89gCQ8NZi4XKL=YzKDCJR1tLbXwQDLLmZyZJA@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full
 16550 UART support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dv2ERMZAdFpB

On Tue, 20 Aug 2019 at 15:31, Guenter Roeck <linux@roeck-us.net> wrote:
> I tested with qemu 4.0, 4.1, and mainline (with my patch series applied on top of each).
> One problem I do see is that booting mainline (as of right now) is _slow_ compared
> to released versions of qemu. It takes some 35 seconds to get to "Unpacking initramfs",
> compared to ~8 seconds for v4.1 and earlier. Otherwise it works.

Hmm, slow compared to v4.1.0 ? That's not so long in the past so
that seems worth trying to bisect to find the culprit...

thanks
-- PMM
