Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp858971wrh;
        Thu, 9 May 2019 07:40:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjwaX4mpmhYKdfPFRCHoZuRMDqUDnbj+w1Y0S8VCVHEIIXI9Xy4zPfs3HNo0po5wZdaxph
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr3385255wrk.293.1557412839679;
        Thu, 09 May 2019 07:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557412839; cv=none;
        d=google.com; s=arc-20160816;
        b=dsuhj25p/2rNGxLndFzMplcVxusrWlSVNVEyzBNkiEywcCygnAYzs/rH5pJXj7LPq+
         esvUwCivW7DMljgdnKZWLaIeepgD2wIHxCwWt+XRywNqchUIwrOq6RLZ2GT4bJE/gl99
         EQXFG4gjBKjbL5INOL0kg0G+zQAN1DtPPw7A63lyEkiKmXlqEt9BN+O4PIZvNwxSh/J9
         j4m6v2u/ioePzKKLqKLn/se/BwPpLlL/AeYY551OoMunpT9cpYjsmIrsDwd6v+gKd51G
         Bpko7BGf1dA6LqJXxmV8oLKEDrLwUdOcCEtpjMnRYXA0AFEXBuILQ6ae8PuPRrwpU917
         kstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NS0oocDVqszWMblfeVAOtOTHAJZ0x43pJylXCCWxUMs=;
        b=zA8ApCkq4Jg/nSQEZDwD0W9n3hdwoGBeLcltpsdz+XSvxkO64shq9Hd4BP//62wSwC
         C01SDpWfq8yKqsRHO7qp8HaZ27zRg1lzXN/LsJTixyDLzAJ/A3s3MPDRGreiE/QeuT6B
         vDI4rNPbSlcmPL/3N5WJ9SeGHyPC4QEzamSkClCmEjjPULw8qPpygZRsYc6OZ/9/rAMu
         kL1jVolm7/bgOWhpqbimLtOCY3d71Ij6sm6ecogwNCSvWTK+u7Pv/KiRRMi5FelVmaC0
         s9YjC5mPfsiCyEuTEhLUo82vmdTxfFqVhWhZB0zqyUhHT/dsWjFzNmh9q7w4UxpUUXxt
         NhYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMCRkWwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j203si1706977wmj.170.2019.05.09.07.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 07:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oMCRkWwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOkDu-0003Rx-PJ
	for alex.bennee@linaro.org; Thu, 09 May 2019 10:40:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOkDk-0003RS-Ap
	for qemu-arm@nongnu.org; Thu, 09 May 2019 10:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOkDj-00016W-GZ
	for qemu-arm@nongnu.org; Thu, 09 May 2019 10:40:28 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35678)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOkDj-000125-Aq
	for qemu-arm@nongnu.org; Thu, 09 May 2019 10:40:27 -0400
Received: by mail-ot1-x343.google.com with SMTP id g24so2523484otq.2
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NS0oocDVqszWMblfeVAOtOTHAJZ0x43pJylXCCWxUMs=;
	b=oMCRkWwLhVXttRfTl7Cexjrv2RuoyWI9ilxK2W8enqhNq8s4eWBC9Jl+NP08drAzoS
	C/35lkOnLAy2LVaY6lo7tuutQLiLFAeDIQ5ejhVVxXoevXT/2QRS+pQAHgAZpUyuqD46
	kqSZ28tW3qtJSm2t5YF8t16o/NEKnCGL6XPPFtWbLbbZFduKj5GnSs2DWqsSE+4bOraq
	SMuqdBvrSK9BHaxBAzrjWuLFgNHe/HQgfOhX0OyCQCEIz9zEYhmyTNNnf5hGZtbcD3Fx
	LMTt2uAcYHfv8xlvbDcg8Q0KAerFa2qetMbIHnk45sao3bjyeDIw/jUJhCxU7WfCuvrM
	mJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NS0oocDVqszWMblfeVAOtOTHAJZ0x43pJylXCCWxUMs=;
	b=MuXzt1oOzadOWw4RAj0ne704IWtiWmStJXXYSbL73CGhDUiMHcRMkYtwEcEnfcyaRZ
	dnW3rVtHQK7cFHDX160r3iF59zIMkAChzm+rDUCFXWONkQRsN5pOmQJnoGGHwPM8tWb3
	fzRom5H8MYASJtjTkn7o5a2BQlR6k6C+hKBYj2LmcLHlChjVoLLmjoUFaXy9F8PBIUlz
	B0gTn+7RzoACn7IxHZmo8i1s1Dv4dUG2wDu+WjEH8LELRq1XfZng1a8KsvKGso2g9K6o
	R54/J9zJuA/ZgCB7hsQ0U+eM3sZ/ShJlmxVSqzwI6nKoh2KM31UDrRnu3C91tR+PiuUy
	6fag==
X-Gm-Message-State: APjAAAUFQQQOxJ6+PEz352RdCu3PtbIevftwCFlhAT7+qiRZsxLKuEfq
	DxWANoAVMA0m8ZRS9nlA+PxcLb8GJ+uGQGoXLW9gUA==
X-Received: by 2002:a05:6830:1258:: with SMTP id
	s24mr2796575otp.238.1557412826444; 
	Thu, 09 May 2019 07:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-2-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA9rTL_4co1JvHrpJcqJqdrBsOiHo8sZS6wKWJOWphCCSA@mail.gmail.com>
	<CAHmQWvAM3Jj_49Kq45jUgHnLmN-p3Yn-+GPQChpfTo1BS5hUJg@mail.gmail.com>
	<20190509162736.133418f9@Igors-MacBook-Pro>
In-Reply-To: <20190509162736.133418f9@Igors-MacBook-Pro>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 15:40:15 +0100
Message-ID: <CAFEAcA9wQwpWuh+12c13QYYkL6s7gUqGzfyMhh_0hxNGZqjjjg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v7 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q7wRAAQgJi2R

On Thu, 9 May 2019 at 15:27, Igor Mammedov <imammedo@redhat.com> wrote:

> It should be possible to add nvdimm and memory hotplug later.
> (I don't see big issues here, as long as it would be possible
> to carve out continuous range in address space for it.
>
> Considering ABI to guest, one could reuse QEMU's notification/enumeration
> code for that or implement their own.
>
> PS:
> However there will be the same issues that we've had with Seabios when
> ACPI tables were generated there (i.e. cease-less invention of interfaces
> to to pass information from QEMU to firmware). But if I recall correctly,
> it seems that it's intentional design decision for this board,
> where user supplies/builds in firmware a board description (acpi/dt/...)
> manually.

This board is supposed to be very close to real hardware,
where the firmware knows what it's running on and very
little is configurable from the command line, yes.

thanks
-- PMM
