Received: by 10.28.173.206 with SMTP id w197csp4114738wme;
        Tue, 16 Jan 2018 08:01:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBosA6viXjrq/153JmMHljvgumpGiGRcg/GHjlWgoJqgluJI45Zb0mR411zRCTAx0EFTy5qUo
X-Received: by 10.129.67.14 with SMTP id q14mr18834534ywa.501.1516118481641;
        Tue, 16 Jan 2018 08:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516118481; cv=none;
        d=google.com; s=arc-20160816;
        b=O6c5geziQ+s4t3xxYzgH6CMLqz4sXg0gzI5LLCuEoKE5A5C1aynz6rlTLseYKiVTrP
         vEKPJ8eM86LnFesVPkN0Nlfk8VVgTiIZeoorZzfiUqa6plEc48jFvf0KF/B1rIYY4UXl
         /E6h2KDQXWzzDFS1J0Wf46uEODbBLM95MmEcuiylqDRgLWgBbJ8IiSpTwXUBgCULZBBz
         xt3N22AspJ6ztMyEkrSpfaMVYDsxzSiPmyCA8fN6NEH/c8ioVNRbOnJ6XNT892IBciQg
         JMz9D+8S7p+eerEj56Zo+5cD5TvK86xGCzPHEBHC5TZTvbR4FX/8aDLnjD8/PJ766yqb
         1PvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6VnMj5EdFxa8xepS/oC7RSi1XSD5Yi0R8PdBDLeG3Go=;
        b=jW1voY5d1/0XPhzKGD02h2Btki8mndIG5EsjPt4/niWmFl5orx2V3jMXTnw8rDyxb9
         V3vpd3f9oim+OZ1dV50kxngWgNT7h9kMSElvLhjUptoUwzbdqH4O2kAMShkuePT31796
         nR6XhOOXonfGSzD9x++z98VWQz4oFiC9dY+XdiWMpyzGskgIGuKTBFipRZ1pxBX7Zfat
         NUDLNOHrrJ9/lhAjEIxqxv/RiP9Io9KMyCozQCHjfLvkJuhrFK1e1vGzFEezjhBLzX24
         R5F/JbqbOUZJel5QBo7JXVp0FmFTpzSsc7TJw3cU1x3lnvuljWpH98/rsA3kmx+8+hGz
         +gQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DTrEIM/o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l20si579766ywh.417.2018.01.16.08.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 08:01:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DTrEIM/o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTfs-0001eK-N3
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 11:01:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebSzG-0002j0-Rq
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 10:17:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebSzF-0004pK-UZ
	for qemu-devel@nongnu.org; Tue, 16 Jan 2018 10:17:18 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebSz2-0004kT-DI; Tue, 16 Jan 2018 10:17:04 -0500
Received: by mail-qt0-x244.google.com with SMTP id s3so18607927qtb.10;
	Tue, 16 Jan 2018 07:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6VnMj5EdFxa8xepS/oC7RSi1XSD5Yi0R8PdBDLeG3Go=;
	b=DTrEIM/ol/R8Z2GSHTsQgj5sNfFqVDvZDi+1d8vnSInoS1KdBw9c4mgqNKYJqq2mqj
	oqNtNpbqno1S1IGaE8KDpdl7hjr5yrCifNg+/qkIcG8bW0l0mSMb5OsZ9CPFkbgmEXlD
	k101JP9nmZie9JnX/xAFJwlqCgSf9xSGaZ9B0QMk3vZXNZe/rfuLrTKi6KDbBv1zEGGc
	MKpUxiC3N/c2TiNgfy5i/RFayYlVNYictHNf6/RmW9s1BG39a6ySszt5nNf60fNSuHT3
	yJyhq7IoSMOvfhjyNh8AdUssiPYcHVKl0s9/kEDF2uvl6MDUJKMKF/jJb0QgGbgI7L91
	nYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6VnMj5EdFxa8xepS/oC7RSi1XSD5Yi0R8PdBDLeG3Go=;
	b=RVO47pto5U8MZf1v+ZvG6U6vJwhlrvtidNs5dVzIRbWA8ARdAhkBIWBjT8qunlY1Kr
	ArehePdgrGE5FUpDXkzYphmwl8aV2++pzqFnhDrMuz+wNpp4kwtUYFfAoPXEe6FDe0ou
	xxadjnTG/0B6M5JB4ib5DS1qDrQI8Im1DTVtpPToi7nJ5J4L6umkUny7iIG61OgiZ/Gz
	+yVFyPtifRfjS5as6xUvajqmNTEz8ndsxAECZwPDJ9oupEjdPK7TKXI6oT/8TSS1ZPYf
	dvZIIz+Kr5bgbPZmtDjzQwT8aOz7AkRkIbL+CrPS+tDrwYDc7XFSid7aXM2ysVLy1szM
	8upQ==
X-Gm-Message-State: AKwxytdKGPHOXl2wjhRCaWHtREu8d+WUD17x/eh7VEor2eVGN3WpiU3P
	SPSHAWCBvEu9gIVtVvvotk35Sz1Qxy0B085izTU=
X-Received: by 10.200.63.155 with SMTP id d27mr23822071qtk.299.1516115823588; 
	Tue, 16 Jan 2018 07:17:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.39 with HTTP; Tue, 16 Jan 2018 07:17:02 -0800 (PST)
In-Reply-To: <CAFEAcA8uJpwwVSAMWY+rFm1+3YFdtuShAyz6PB4yNto_YOVCbg@mail.gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<CAFEAcA8uJpwwVSAMWY+rFm1+3YFdtuShAyz6PB4yNto_YOVCbg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 16 Jan 2018 07:17:02 -0800
Message-ID: <CAHQ1cqFbjTgrW7VF9_7npSqqx4qHpbB7=DGjzJ2O5ySBknJhAA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH v4 00/14] Initial i.MX7 support
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DUOjbeycTtsR

On Tue, Jan 16, 2018 at 7:08 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 16 January 2018 at 01:36, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Hi everyone,
>>
>> This v4 of the patch series containing the work that I've done in
>> order to enable support for i.MX7 emulation in QEMU.
>>
>> *NOTE*: Patches 1 and 2 are provided for the sake of completness and
>>         are going to have to be adapted once Philippe's SD changes
>>         land in master. As such, they are NOT ready to be
>>         accepted/merged.
>
> I've just pushed a pullreq including Philippe's SD changes to master,
> so you should be able to do the final versions of these i.MX SD patches
> now. I've also I think now reviewed everything except the pci patch,
> which is a bit out of my competence area.

That's great news! I'll rebase on top of that as soon as I get a chance.

Thanks,
Andrey Smirnov
