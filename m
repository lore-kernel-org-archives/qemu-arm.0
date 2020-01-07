Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24077254lff;
        Mon, 6 Jan 2020 18:08:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqyr3+tgRz3jR/kc1KyHCAxo3GEC+MdBepbTNHYSUwth1yuVvsF5Br1RN5emyvijCkmS6ACS
X-Received: by 2002:a17:906:ce38:: with SMTP id sd24mr108994229ejb.237.1578362898464;
        Mon, 06 Jan 2020 18:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578362898; cv=none;
        d=google.com; s=arc-20160816;
        b=KPYb00NkF42keTcVMPLvLXIwPOMx2LoMYRNg5xix5p40ZgF2dH4Acw/1cp7rM7GXGC
         HNMFuSDOCpP2qMy6nFrZa1Xx2a6ey9kSHDeU7RtoBr3vT5S7uooia+8FwgTBnAJkVcpU
         PBnCTH18H+6E3MD8xsE+uM7euG2S7HJvqAcHdc9SNpGl0sKXMWhX+OsfnE6z4hWI6l0p
         talqmvKFJxLyfFX5vKgySckguYirYduMyU8HI+xN6/UvoPirkzKN+9+4WNon3MBUNGAG
         OnFnAhPEd/AF4l6/6tYa8wJskfQe1kz+EztRdfGpA0VPLHy5upfJbFJ2qkal6e/CiNFy
         lFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V8ESGksRlQHUv0CJRwlSb78JSSfoh7CbMOqAAuvjtBA=;
        b=aAyDTTYXsZhNqWZ5RMeqedJ8VqMW+6OSww/e8Mek65d1ovMmYWcDHgF1X1gXZmLOq3
         LHMX8I3uEQYB40daCwb8ey683jQvWRdtTYxC+j4+NMJ12Iauec15N7x+v6RpOteR9jEg
         X8oWesgeyc87yLfw8AAnal/RQQ4JbJkmVjYIi9BtWcogdk9MpQqzInTZVCqv3higM1v3
         XkOUtMGqTAbw1o93uCtTo8cYkFHr214IojMtxU+jqLPOHNN9C81vqJ3T/iQb2YCaaFE9
         +Kn5XYot2Sb8JLSB4+deA72ad5Gz24EpFHYv3IK0454AtgF2iWutKjpXW2LwOrgPjd8L
         z3yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nCqiSZuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si44987686ejz.414.2020.01.06.18.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 18:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nCqiSZuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioeI5-00086M-6x
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 21:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ioeHY-00083k-VM
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 21:07:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ioeHX-0007yU-M4
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 21:07:44 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ioeHX-0007rU-FC
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 21:07:43 -0500
Received: by mail-pf1-x443.google.com with SMTP id p14so27798251pfn.4
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 18:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V8ESGksRlQHUv0CJRwlSb78JSSfoh7CbMOqAAuvjtBA=;
 b=nCqiSZuCWJb0Cp5vRUOybYhoJFpArOCewF7XfZCsLDLR1iJPSURycVBD2ePSAbHoWY
 Vue0A6awRWQoBDJTaLjjUmDLF2ED3i8X2INJ+Kz6Ot4ZVNF4Mn3Y9gOe+uQXdPkLBJpq
 CJryLe9URzBu3C7zsSIkwv14L28fcEnqC7thbZJp0mG7yFyZVp0xxzqDN1MyssLm8V5u
 qZakRM0SDrD/8SGbRr9Hia9gaXUchboU916NNNS51eZkbFa6fRsbpNIy7AVqsjRN6K3z
 gQjGx5x8YrlZzUcVQW6IlixkBbfewh+mGjJggC1+tYGiixmP2idXPXeTW5eqGzLDZp2v
 2EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V8ESGksRlQHUv0CJRwlSb78JSSfoh7CbMOqAAuvjtBA=;
 b=iRG59pgcZP82qgfCmT0XQdLTBpyVrDmcpqhjb8n/SXXqCTFO8+83lJFvIRLD+bICyh
 xup9HK0LD/mrTdn03aMygsTgvi3AzwMaBKDvyY3NFWVpPXc9/wUJ9cVTBPv/o00ladXk
 zcQdzq0ilw0HDgRKSACxG+4nICvefr5o6y8MoGcDPZCqKFqPlbkL20i1SY+46tPMmMuv
 Yx6fEwHM1E8bYBA08mbv5qAaepX0uxOmlo01GZOIlHsHUqmZH37xHNBFS7X0RMMknDsv
 h97uBnC8Fr82DcmEW0B7lSC0QzRuS8jRjvq9NRp5a01flhpgM7HVZ5RdqCLD92JvjkLN
 WgfA==
X-Gm-Message-State: APjAAAV9iVCpFQrd2XfOwA0h7Gk6ubwr0J8Aa0e6bSFsPYBz9IZBX1/i
 0yBBeWl2e86ERt1mCczRuIFMyg==
X-Received: by 2002:a63:1e47:: with SMTP id p7mr112256843pgm.339.1578362860949; 
 Mon, 06 Jan 2020 18:07:40 -0800 (PST)
Received: from [10.7.11.213] ([203.47.88.82])
 by smtp.gmail.com with ESMTPSA id l21sm59805504pff.100.2020.01.06.18.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 18:07:40 -0800 (PST)
Subject: Re: [PATCH 0/3] Raspi sd-bus cleanup and multiphase reset
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191220144616.911466-1-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70fdcb1a-fad9-c76e-2c40-429783b5a866@linaro.org>
Date: Tue, 7 Jan 2020 12:07:33 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220144616.911466-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ysUwq5P/n5zT

On 12/21/19 12:46 AM, Damien Hedde wrote:
> Hi All,
> 
> This series is a follow-up of my reset series,
> https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04664.html
> 
> I've extracted the raspberry-pi related patches. As suggested by Peter
> in the previous version of the reset serie, these patches do a cleanup
> of the raspberry-pi sd-bus then does the multiphase reset switch of the
> gpio soc part.
> 
> Patch 1 remove the bcm2835_gpio sd-bus which is only used to host the
> sd-card before the machine initial reset. As the soc exhibits the "default"
> sd-bus to the machine using an alias, we can simply exhibit the sdhci instead.
> Patch 2 prepare the multiphase reset switch by isolating the sd-card parent
> change. Patch 3 finally does the multiphase transition of the bcm2835_gpio.
> 
> Thanks for your feedback,
> Damien
> 
> Based-on: <20191220115035.709876-1-damien.hedde@greensocs.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

