Received: by 10.28.71.27 with SMTP id u27csp3738437wma;
        Tue, 6 Feb 2018 04:45:00 -0800 (PST)
X-Google-Smtp-Source: AH8x2275+5+gfgUs/Uu+gQKHa911Sefjbz03U+z+OlylD1wcDqqDmCEk2KDttq9X6bFRVVgUd7qf
X-Received: by 10.129.159.17 with SMTP id w17mr1303103ywg.23.1517921100309;
        Tue, 06 Feb 2018 04:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517921100; cv=none;
        d=google.com; s=arc-20160816;
        b=QK5b00IpQjqMnxE7AcX0T2es2MJQ4fugK4eVCG2reqVvbEAeldhaCx2xPKzJOlDK97
         /PwmKRO+REnsPzml2eJDFUAnG86f2/ieEDrqtQS2jDD1QUv+pDUd9J/dF9NkjqkjXave
         bQ2axb5tIDf4WWO4SjAUKJ0rPYMFnfgRgB1lV5jf2GGR3AgY43m/YvDvbWn+Df1wjaRm
         b72ldu7lHipUPsaK4LcVuIWzg4AiWph9u7NegkxdPMpMfSJoBMVSb3gWrcJNA/mT7YJq
         gLbNmzPcnonN4Vqrae7XIf17IWQTLCsVqSrZLyBQSa7bXHRzuqK6zeZM65WQlN8FD9J9
         beEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XuSBrx7+xwH3s4OU7abBgBKkG6jbdqfyyhHS3CqjYtQ=;
        b=xlpztMZYn0YuKQZnR0RuRy/W39xPPQMZlV2sb/W82PVsjazHNoK5qNohHesE6O/Bwg
         rkXkV8DPAjIEk+UnQ1e+QE2EOMfemTkYMW8qfgYvIFNC0l4oskResSDqAM5dU8odCaCy
         IvwkqD5OFWvVBdPOv67eE4b2ApoRl06zg19oLGDNg0Bez6VGfBsVoqyTpLxYxZ0ZatA0
         o9e3SaM8R8DXMdaQ6H7fjcaSz82T7a6Mvz1oxCrG5B939QsHY/mRCA9F4a51tWpthSbv
         q4E4kMwlRUoI5oZ1wX9VzmBEV5t9a3oNpENneJh/t5bAS63HTFpdK2HaAegeCJEFXe4S
         DzEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T9WEvpCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l28si1804465ywh.414.2018.02.06.04.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 04:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T9WEvpCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej2cN-0004rs-Jl
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 07:44:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej2au-0003jw-Q0
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej2at-0006Se-SS
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:43:28 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ej2at-0006SG-Nb
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 07:43:27 -0500
Received: by mail-oi0-x241.google.com with SMTP id c8so1210156oiy.9
	for <qemu-arm@nongnu.org>; Tue, 06 Feb 2018 04:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XuSBrx7+xwH3s4OU7abBgBKkG6jbdqfyyhHS3CqjYtQ=;
	b=T9WEvpCtInSJ0l5b5rf6HouHnGD3r/fujZtxcxwk7j8HGpYNEYaxnMHaLRL50sFUZ5
	cwCeZPGMk/FptTXoth6Hy0DcO8+PzQV9bk7pXG/bJBl96AGUoNpWPACae4Vit/UTm448
	C3srE2s9QaWjUm1Q/9inEFvMW7RakOvJAnxTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XuSBrx7+xwH3s4OU7abBgBKkG6jbdqfyyhHS3CqjYtQ=;
	b=RlYwb+gWG2uM30rsa6CjjIsb3qBaXCZAIZr1yqbdSYJVXzuDuRNPA86BBE666Shxgr
	WqhJL0fB/spT9jMvtVz/3FMuf2lWP29c9yD5QE9cTX/ccL/D/9JsuKFeF157+Jey6Cz5
	CK/I1Gw8wT/pyLyvcNlEGhYZkg4iDPwH6zXU4SQDN+KQy27XJ/Up8iUrfm6H1v3Ql4PT
	puAskwUZIy8taKrSnBrzezpivpmTIf1TUlj7UUBr3/Yn/Sminkz07VZsUdUihrcQfNnC
	XiSz3gyMUrQUs0WJVCDaaj0xiWm8Vdtn2eAgzKYorovJ/wlAg/CWNHN3bVCCv/np1h92
	E3oQ==
X-Gm-Message-State: APf1xPDgbTQJVTlK/TMK+b0LQwlQ+V9JTDGT95z9PBVyZeaejJs9pVEq
	BrlpZXZbj1U+P0422rO+emEzL1lbGixHwhGEXHydDQ==
X-Received: by 10.202.105.84 with SMTP id e81mr1229731oic.305.1517921006932;
	Tue, 06 Feb 2018 04:43:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 6 Feb 2018 04:43:06 -0800 (PST)
In-Reply-To: <bdb379f2-5272-dd5c-056d-da487dd21500@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-11-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-40ucm8WZOEJC_1r4MdFXEPuX=GM2FC3hKZamLbijM7w@mail.gmail.com>
	<bdb379f2-5272-dd5c-056d-da487dd21500@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2018 12:43:06 +0000
Message-ID: <CAFEAcA8R5zYM5ppcx4wJk4jkMbCekjZVyL+m7R6mekf+nA6O+g@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v7 10/20] hw/arm/smmuv3: Implement translate
 callback
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, Will Deacon <will.deacon@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BzODtGaGZweg

On 6 February 2018 at 12:19, Auger Eric <eric.auger@redhat.com> wrote:
> On 09/10/17 19:45, Peter Maydell wrote:
>> Incidentally, the spec requires us to perform memory accesses as
>> at least 64-bit single-copy atomic (see 3.21.3) -- does this do that?
>> (This gets important with SMP when the guest on another CPU might
>> be updating the STE or page table entry at the same time as we're
>> reading it...)
>
> Among all your comments on v7, here is the one I am the least
> comfortable with. I was not able to figure out whether
> dma_memory_read(), which I use now for all the descriptor accesses
> guarantees this 64b single copy atomicity.

It doesn't -- it winds up in flatview_read_continue(), which will
do a memcpy() from guest ram into the buffer, and since it's
using an arbitrary passed-in length value the chances are high
it won't end up using an atomic access on the host.

This is a nasty issue which we haven't figured out at all yet;
see also this thread:
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg03067.html

For the moment my suggestion would be that when you need
to do guest memory accesses that have atomicity requirements you:
 (a) use an accessor function which specifically loads a
  quantity of the correct size, rather than one which takes
  an arbitrary start-and-length
  (when we add APIs which do have atomicity guarantees they'll
  be "load 64 bit word" etc, so using our existing APIs of
  that form should avoid needing to restructure this code later)
 (b) add a TODO comment noting the required atomicity

thanks
-- PMM
