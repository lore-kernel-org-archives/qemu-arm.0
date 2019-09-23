Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2664172wrp;
        Mon, 23 Sep 2019 06:27:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPMxzkOyNpDkZG99mYijK1SPoCc/OFKKRBGQ6Me395wl4kyND/Cya8f0e6ls3fI9xJUNg1
X-Received: by 2002:aed:2842:: with SMTP id r60mr16796553qtd.142.1569245250506;
        Mon, 23 Sep 2019 06:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569245250; cv=none;
        d=google.com; s=arc-20160816;
        b=XYCv42TH4BL49rJJNKpbDMZTcuV5iHt/Kzt41bg9cEK2Fqy49pNH0zjT7yjdQHHHHg
         6jnOntbV0lX9BKd8krEr67/w/o/2zAsegfYy34Z/lApXvga5KE1jKgYhMjtAFjWPvP0s
         BkBzTrGM5My0580+dDIepfkj1hs/Gd1sR3mTLERuqV4N+vxx9lOx8wcLUh1ySA/nkSmI
         T2yAq2+MpLxj5qdS9WIhoAhGm/s/v95/E3xbyLRHWCNzl34aMuUSPF43UH5OrsYUY6/T
         pTDgO78Nrq3V3V7ExyBV6r/5IrTL7LU4qWLoIWgChamL+jVcfjweVqMi9SRlOvDqli9G
         pq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F+tr8JAkIln9crXUwZeQvtxtEKb7O7vjGbgEId9s0W0=;
        b=M1qNWsa2I9g3HAnURenhTFRjAH/TndMEqRA9pyCAb1ZFUuPy4sUC7HyaYuKpI41+yB
         3Zj5+XhTTfs6gvw/Ogwr2orzlTgNteo9uLaGjM3QYRSVECvymJRRWZgzfcExP9B78Xee
         lenOQwUoC3X7uI8eCcMOpzKhKHGGYGxGu+OB0/xIoGzlVr0ljXVPjlrOtbLULmULQEhV
         C09tTInujbbwUsHrfmc3L28HZmUlSVImxkGfW1q1iAPsYbkH4FHWYRByCF0nPgjDEwbO
         JZwX815SIeTeeWpQAl2insSXle8bHXBQJVqzMU/4XcIn/Rx0D0LnYncVUo5/KHNa4pJ5
         5NyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GRQF1ylt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y79si8038272qka.236.2019.09.23.06.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 06:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GRQF1ylt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCONG-0005GA-0w
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 09:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCOM2-00044C-NW
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 09:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCOM1-0000IR-M8
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 09:26:14 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45760)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCOM1-0000Hr-EH
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 09:26:13 -0400
Received: by mail-ot1-x344.google.com with SMTP id 41so12029374oti.12
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F+tr8JAkIln9crXUwZeQvtxtEKb7O7vjGbgEId9s0W0=;
 b=GRQF1yltQKO/GgSZlvQCsJyvUTVxQ8aUMGbpjQ2sS6c6oZq5AMibDjS/Q3iwMGIMqj
 +WOVROMH4dvLurE1uGW4UJEmVq9e+0JiMywzVL7RYm0K9Q5GG/zGgX7MTpmp9alcVUOg
 EGWkmi0ficsqU0nC52SabiRESA4Xv0zrV4MVi3mBNvCssKXP44A+aFbQjsylnA7HmFoc
 xNHe8XZkVqYhmYWyKx1l8nYaMmMKZmlsD3WgUsJckz6HA4V/jmbanTusJ9dgeIj3yelR
 l22JIkid9L5bmLzBLhuaDnxl2iLdGsg+SZK2+hnGlznWlTuOcVqJazwPweXs+hl+16Rz
 /zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F+tr8JAkIln9crXUwZeQvtxtEKb7O7vjGbgEId9s0W0=;
 b=In8J/S8/lMUTDnz51h+skyYY98AMIygDaag+ruIS9vH9pE9ih9DhlGpNfzbOT9G90d
 OEtH9D8HN0+mvHR7rIXC9uw3sn9bFO/N52a+6VveZdK/WkwiFUkcmH9gJXo/HK/jGoPr
 O3EzWIFDyXIf3h45Qx1nDktzJVRrImPd7oJJoEC7GE50TiEBqvGWg1qxJcr60ORBCccd
 3ANlQMZ5QoPe9WB9AHjU63vdAb9Tmn0GizqL49VqYz2QciIm8wHCQUSKiGT8286KQVkT
 a9Sw7ATSA9K9tvpGcY3XZHhjyYmCaE2CXUx2ANmKsVFmiJjV4m2S8s2cOyLED6hD2qlT
 gxtw==
X-Gm-Message-State: APjAAAUd2ct71JiHLdAJ9+QirO/QNZJRw7EdE43HRnaDCXj+ZwuLpII/
 bnZZiF8/iTMG9WHzWkzI/JSSxHf0oX5vwgU+R2FcAA==
X-Received: by 2002:a05:6830:1357:: with SMTP id
 r23mr4007137otq.91.1569245172069; 
 Mon, 23 Sep 2019 06:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190820123417.27930-1-philmd@redhat.com>
In-Reply-To: <20190820123417.27930-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 14:26:01 +0100
Message-ID: <CAFEAcA_6uBtREzj2UaSwDp_VWd=oPsD-dARcOPeJdcMpO5kaHw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full 16550 UART
 support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bV+a90qKrn1Y

On Tue, 20 Aug 2019 at 13:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Since there has been some activity on the list asking about
> Rasberry PI USB support, I had a look a some previous unfinished
> work and rebased it to share, in case it helps hobbyist interested
> in improving these machines.
>
> This series is some proof-of-concept on improving the AUX UART
> support. See the commit description for various TODO/questions.

Apologies for not having got round to looking at this
RFC patchset sooner...

I think my question here would be -- is using the 16650 emulation
really the right thing? The BCM2835 documentation says
"The implemented UART is *not* a 16650 compatible UART. However
as far as possible the first 8 control and status registers are
laid out *like* a 16550 UART." That suggests to me that it would
be better to just improve our model of this hardware rather than
to replace it with a 16550 model which isn't what the hardware
really is.

thanks
-- PMM
