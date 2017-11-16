Received: by 10.223.150.237 with SMTP id u100csp579471wrb;
        Thu, 16 Nov 2017 09:05:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbrSpRXtsCvyzx553eBu5YkKug3hsSlD1zqOy8YxY5RlzwSjOaW8LqI10zXqh5pSFNHORk0
X-Received: by 10.129.72.136 with SMTP id v130mr1392370ywa.487.1510851902273;
        Thu, 16 Nov 2017 09:05:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510851902; cv=none;
        d=google.com; s=arc-20160816;
        b=ahFu9siiyhuJERQbOEiCyrHMJgInFxyMS/xnK38oKdp5p1bq4fydJwrwNbY2FMGX+p
         8cvmwPSKJXLkiCS4SaL2FDQOPphHaoaKqfeKFTrbG0NtSUTRHTjdwSR3iiFhkJatZcg1
         sZQgpaWJuzV0Ev0oZ42/sQyA8zFlz3+fSqWKG/n27qIbNPeOuYRbjvtK8ZubyCNjFTZy
         NYKeL/KeWQQEpT/n73dqlgmqFpeKmhtkJUhqYx7p+wCJurrs6aF6xAFPAV9SF9VCgYAS
         skK3IEiqomx8G8iOs32GDzHqvwcne75GMrP6WT0IXa8Q3PmvzbzzR8TaRMYEWlmRojTF
         m//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+Hf5AkSgbOp1xvhPJ8iu53uo+j1N7UVQxJm1Mwh7f30=;
        b=XnC6sjZcZaELTdClOqe/TvGfaWyFE2jottOC+C8onWy7rbzgq/3Ch3j/ICI6L/yDrE
         BeJeXReaf8tJ2B/Sl9R3ACtfpqJ4Bxp5LAaZhho6yiFX0TUWGVlrsbUPDfziEh7drunw
         H4G73WS7AlLqQiGkJ+8nVbxWh4iJSx0uTdsYYfv65Ul9WQw+/Z38NOHNjvetJnZgi0yb
         epcQV0O3tIktIEY4eZRimzWHFC7Ks0OpLVhc1UP4RhLlG1LZqBKtoVCkH2v6HuYG2/nY
         kcrA65XOIjEjUD+ZuEyey7ThqhpxAVei7qlnVLmWQsoCWCsUSwt6b9DmBl6NjBEU8GUe
         pkbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DLnnSAey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z28si300860ybi.4.2017.11.16.09.05.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Nov 2017 09:05:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DLnnSAey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eFNb3-0001IU-Mz
	for alex.bennee@linaro.org; Thu, 16 Nov 2017 12:05:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eFNaD-0000lq-B2
	for qemu-arm@nongnu.org; Thu, 16 Nov 2017 12:04:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eFNZr-0007z2-T7
	for qemu-arm@nongnu.org; Thu, 16 Nov 2017 12:04:09 -0500
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:52537)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eFNZr-0007wM-MS; Thu, 16 Nov 2017 12:03:47 -0500
Received: by mail-wr0-x22b.google.com with SMTP id o14so4534340wrf.9;
	Thu, 16 Nov 2017 09:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+Hf5AkSgbOp1xvhPJ8iu53uo+j1N7UVQxJm1Mwh7f30=;
	b=DLnnSAeya3S6oUMKkM72ofel2Mc7hpM+RknxOpF1kcxwUQC5CY8jf98rtb1B9+lWrK
	Vv+eGGzy4UWPpU0xhMayy/5J/aq1//YNbupTLPLRbAEr1Sx8tKH1gGrpG44xEh0RnDUU
	/AqyqiCLDSJWm+TDKRMtncKRTxgpMu1PKHY2TDu2K2s+z7C4f4+j82IPGpEZHb4GG6VH
	2+woW9ii01ogczulcIsCh66en7WIXTNGwiPv7kwFtkemFcZiWO8X6vQkE9ke1vcWxmtr
	rTr03yMPiF4OgdGwPkVPbagYNPZUEorfobpC0bI0vUmiXuyWZzM7CjVNulZRdIjmGkmq
	E1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+Hf5AkSgbOp1xvhPJ8iu53uo+j1N7UVQxJm1Mwh7f30=;
	b=eoD7NH0UKa6cCIicStrCSdhZfcOcbxme2pmgoxAWY5bwg+jpLlB0izbn0hpQ5hfnHs
	ydpNL/y458on7hOgev1+uWfuyxRPRULvanN/MJzrkvYlNZ1+Va/+f4UJeLUtwz5cnIc8
	r+c2HBXXRn/j3N8XAIQr0/k0Tg7WDHwDQ3Rd6vyZJ3M2PEFkw6whjJLT3tPNs3auXT41
	+H+mUpB8/ywfH3BwJSGTqtBlsINKN87X4PjQDtjfxeAN0J9HdwQIoDznbw3l1zLjBfli
	k46qXtGlsYHQRwLwxk1VENXeGMIwPnuFS9fsaHzXDOaZNvseP/FLogqgnsoJ0hjOg1TA
	v5hg==
X-Gm-Message-State: AJaThX6DZrvshVUFHuiTCJNFkI6fKUDmihSC95e1crBt7ys0EDh38tJj
	l6P4WCpPfyF2HhnDfjLXGfG+5qxOEHSSyMefOxg=
X-Received: by 10.223.182.3 with SMTP id f3mr2254434wre.127.1510851825846;
	Thu, 16 Nov 2017 09:03:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Thu, 16 Nov 2017 09:03:15 -0800 (PST)
In-Reply-To: <CAFEAcA-z_gfMr+=8c1kexo6iL--uxNVMzOnN0aox0FGAv3pHjQ@mail.gmail.com>
References: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKORH2jwGP4ULZv6B8=262OhznHkwOzONd9HFQoJkKzD=A@mail.gmail.com>
	<CAFEAcA-z_gfMr+=8c1kexo6iL--uxNVMzOnN0aox0FGAv3pHjQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Nov 2017 09:03:15 -0800
Message-ID: <CAKmqyKNBmPRMcQ=5mq-2xAOYMMEgjJ=nxVKrzCCTqxOqiVztqQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.11] target/arm: Report
 GICv3 sysregs present in ID registers if needed
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9zYR5PErRpI/

On Wed, Nov 15, 2017 at 3:57 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 15 November 2017 at 01:14, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Nov 7, 2017 at 7:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The CPU ID registers ID_AA64PFR0_EL1, ID_PFR1_EL1 and ID_PFR1
>>> have a field for reporting presence of GICv3 system registers.
>>> We need to report this field correctly in order for Xen to
>>> work as a guest inside QEMU emulation. We mustn't incorrectly
>>> claim the sysregs exist when they don't, though, or Linux will
>>> crash.
>>>
>>> Unfortunately the way we've designed the GICv3 emulation in QEMU
>>> puts the system registers as part of the GICv3 device, which
>>> may be created after the CPU proper has been realized. This
>>> means that we don't know at the point when we define the ID
>>> registers what the correct value is. Handle this by switching
>>> them to calling a function at runtime to read the value, where
>>> we can fill in the GIC field appropriately.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Is this going to make it into 2.11?
>
> Yes, it's supposed to go into 2.11 -- I think I just forgot
> to put it in the rc1 pullreq, but it'll go in rc2.

Great! Thanks Peter

Alistair

>
> thanks
> -- PMM
