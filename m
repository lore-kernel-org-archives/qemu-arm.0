Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp685478lfp;
        Thu, 13 Feb 2020 06:40:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqw0G1bH1eCf+8PlZW+f3/ENIenbXQ8WkpjpHAKRzF8/8XrOOLNxAsWkvN0occwcqz/KNNLo
X-Received: by 2002:ac8:740c:: with SMTP id p12mr11796876qtq.286.1581604815178;
        Thu, 13 Feb 2020 06:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581604815; cv=none;
        d=google.com; s=arc-20160816;
        b=paBcuWuUf9uWUpjBkahmhuJpYCgQiH2jJjp5RWh92wVfMbq0yTz3aB/Pn0KzkPkgyU
         z6JwnHBU98MiATG87wdji4IgmbpRJksBjXLAXUc8CXUuPtVBbd59sIqv6ixNtwi0BV4a
         ECNoNEY69NcPkGasE069rETca2i+q1e5f8Z1CTX1TQDXP6qvMm+O/dxzMEcBXMnRAPgT
         M/fJ9YHk03RCDwXAsTnKG0HA8MAyNPrfmdrKTswfu8+SyY+7tC6JPv8ak+jeVA6E2p9j
         uzmaIk5eH08YH/F4YQ0l2TMMj+LKLcM531jV9U1xs11dU5fVD16ntn4uyMEWf/1Oj/Z9
         q1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A4EPPn1XD+DrC3EutJ1d+JoZYSjW6TenIzcHdxfjf7A=;
        b=utBS69hek2Vxt3Bi0AZpKR/h0M9ik+VqSZLO+rzAeqAq5MRpSNhfU/8g5hskdElKLZ
         OtyFuALaeUxWwXHrSUfltM0GCOpdGJpuXCY/YcCX8JigJdXyV5a57ttX9SGXDODurUCd
         z6kLGQRoV5lnGCRLI3vsUF/Tg2VCHwQeqiI6//7vlqPfoS3gZL+Jsu1b1QKIi6b+1Boo
         VhA8b0a6DbdTxdVWLwd+rAglZwfVj/Hvyd2M9PWkhAvtmM9dy5LzDqQLvyxfZqMwr+Hq
         +cF/yuHhJQ2b/knrxqjVr5ot7lRlnLsfmBydS2aq6Wv7Z3mUamnYDDLWyTKqDFtS4sfZ
         qfvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WP+5Lnmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si1231905qtg.313.2020.02.13.06.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 06:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WP+5Lnmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2Ff4-0002Xi-Ik
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 09:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Fes-0002Vn-7M
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Fer-00067n-4B
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:40:02 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45852)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2Feq-00065q-UA
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:40:01 -0500
Received: by mail-ot1-x343.google.com with SMTP id 59so5735867otp.12
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4EPPn1XD+DrC3EutJ1d+JoZYSjW6TenIzcHdxfjf7A=;
 b=WP+5LnmzPYpCz1W88JoUB3XPljfC+Y8gXRoZakD0QsCtzfuBycN0/X6D07SflZQzCb
 IQLogAZ5rX/hGMw2TJ6jnI9/r6z0YxK6sMD1Bjqxj4yTPeeweVLslHSW63m17T/eoHCZ
 IjAo3GMVWWsE189yVidUxOKy56SNv8kLO76+x+hjXp9Nqop0dfYQkLFjgZCYsyZgr6tf
 YTxw0JquFLwP+blpXdXFGBmWdFh9ikNYofnbAAxEgAL8gTxLR/qBVXgDHSV5eslBaRDZ
 qk2ov+BkDppxTBGMVUeK8FsCLRNQ2pDGeHhKwUniOUP8P/ikNjvQ1ORnBOo3F7nA5SPA
 ILTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4EPPn1XD+DrC3EutJ1d+JoZYSjW6TenIzcHdxfjf7A=;
 b=MfH6eiqqGyYqJdvruiznbth8ajUgTF9AHkjo8b6bhTTs82EiSkX6MJ8chfeOi1lhHq
 20VBhiYHrN8BANe2z8Ijr82bqN6o9rgBoHWGc8O/Z90XxUHGQZl/4g1sFR77x9GA7lCA
 AEaMByqs8Jfe8q/iS6lzTBBRSaPkfLlRWo02a2mPDSrw/89uj23S//T2IosZXZDDTqkI
 x2uqgGhRg129AMm/Wpc4fhH0641bYM47cPbl+lUNnseShUCEYjgZpOhIWrszy9sWJEI2
 TwWjinIU+flh4NB+tXSRRS02qcj/8VTNFVyzkPpdjktWqp8/BTAxgcnvNtC9CFQsTvHz
 0ESg==
X-Gm-Message-State: APjAAAVrNHm1qNNQcfuUF2x3lPZgD8aZyiMFw7EggWvjqYLLlbptF7Qm
 TpAJxjTMrgBfVvRa5/kdlYcn4dkK7MnQtHfc5DoT4A==
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr12900017otq.221.1581604799968; 
 Thu, 13 Feb 2020 06:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20200212184648.GA584@roeck-us.net>
 <504e7722-0b60-ec02-774d-26a7320e5309@redhat.com>
 <20200212230918.GA27242@roeck-us.net>
 <560224fe-f0a3-c64a-6689-e824225cfbb9@redhat.com>
 <279d959f-f7e5-65e1-9c68-459f3fed56d3@ozlabs.ru>
 <52f0b829-151a-3dd0-0ec7-c3155185510c@redhat.com>
 <9f652340-1277-0eb2-bc2c-402b4209a220@roeck-us.net>
In-Reply-To: <9f652340-1277-0eb2-bc2c-402b4209a220@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 14:39:49 +0000
Message-ID: <CAFEAcA8CyTqdqvT6xatkxb9EN49zD4OBaKrbaLpkyZg+eMoM6w@mail.gmail.com>
Subject: Re: Question about (and problem with) pflash data access
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fGnJvxhB8s4H

On Thu, 13 Feb 2020 at 14:26, Guenter Roeck <linux@roeck-us.net> wrote:
> What really puzzles me is that there is no trace output for
> flash data accesses (trace_pflash_data_read and trace_pflash_data_write),
> meaning the actual flash data access must be handled elsewhere.
> Can someone give me a hint where that might be ?
> Clearly I am missing something about inner workings of qemu.

Probably the device is in 'romd' mode. A QEMU MemoryRegion
can be:
 * RAM (includes ROM for these purposes) -- backed by host
   memory, reads and writes (if permitted) go straight to
   the host memory via fastpath accesses
 * MMIO -- backed by a read and write accessor function,
   all accesses go to these functions
 * "ROM device" -- a mix of the above where there is a
   backing bit of host memory but also accessor functions.
   When the device is in "romd" mode, reads go direct to
   host memory, and writes still go to the accessor function.
   When the device is not in "romd" mode, reads also go
   to the accessor function.

We use this in the pflash devices to make the common case
("just read the flash") fast. When the guest makes a write
to flash that puts it into programming mode, we call
memory_region_rom_device_set_romd(..., false) so we can
intercept reads and make them do the right thing for
programming mode.

thanks
-- PMM
