Received: by 10.25.205.13 with SMTP id d13csp514329lfg;
        Tue, 17 Jan 2017 06:08:57 -0800 (PST)
X-Received: by 10.237.60.218 with SMTP id e26mr17886782qtf.271.1484662137522;
        Tue, 17 Jan 2017 06:08:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x34si11894811qte.67.2017.01.17.06.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 06:08:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTURT-0005k2-1k
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 09:08:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTUQT-0005Fm-Mh
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 09:07:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTUQT-0004Ze-07
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 09:07:53 -0500
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:35257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTUQS-0004Ym-Jg
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 09:07:52 -0500
Received: by mail-ua0-x234.google.com with SMTP id y9so103737986uae.2
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 06:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=698ewiiT6UlDtsntnBkD5BUp9kSgU481SDp+3G7AEyY=;
	b=Ad19FxvcvyjhuxurE/zaBRmupEXLlXtSO9DEJl4GHYKSYC8Yqg6qbracErh5yYbgZi
	jh9Zdq95rw3/NBVxoKtW4moCqny41an1IMA1ziJdnFAFIw6Du8jUNPD7XWIPq5UgSXOi
	TUBySfsuMHOz6HVmtbFycEi+vShig2y+UzsbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=698ewiiT6UlDtsntnBkD5BUp9kSgU481SDp+3G7AEyY=;
	b=CR8/2udGu0d24y5lQ8Lxowq8GGX1GHolcVolqhpWJhDfZlrwaWNFBD+Mcf9k+xzPxD
	kZUwfNc4VkRI5bSKHsknIxK7FaDBRwzyLrBLoheQvo9kvxOv5Gouc3Th2Zc/98f8g04C
	f4WlPgz07qUF+CAgVvrKw4Iqy0MWsGumJtjkQiN1loAMRMHHg+Oxq0PvP9b/72Nhu7G0
	okknDyM9z9l1jbuermh/ZZblddbupDo02TFIHkkbSXa0Jk5nuZsxn1PXZWWiS/jG3Lv4
	H2sHcIbKL5vnZ8Qmmh8AXoPMKob5Pb2HAeAFDa+hTH++/T8Jg3KbCsunuFzvcXoHlsLn
	h4mw==
X-Gm-Message-State: AIkVDXK9ceAR7BTieGSf/MmAiiXJP/LCTIuRSr2ufUgGi8sHT/nxWmhfmnIL03q8HWC5ivIosckIToGLCWwwRPBl
X-Received: by 10.176.2.14 with SMTP id 14mr20964649uas.8.1484662072093; Tue,
	17 Jan 2017 06:07:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 17 Jan 2017 06:07:31 -0800 (PST)
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2017 14:07:31 +0000
Message-ID: <CAFEAcA9N_YXFCPo8ja-Nan3roL=gdNpFQHoLk_aw6tDixwoT3w@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-arm] [PATCH v2 00/18] arm: Add virtualization to GICv3,
 and enable EL2 on 64-bit CPUs
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: InZTNkyxMrEk

On 9 January 2017 at 16:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds support for the Virtualization extensions to QEMU's
> GICv3 emulation. This was the last missing piece that was stopping
> us from turning on the EL2 support in the CPU model, so the patchset
> also adds support for enabling it all on the virt board via the
> '-machine virtualization=on' option.

> Patches 1, 4-13, 15, 16 still need review.

So is anybody interested in reviewing the complicated
bits in the middle of this patchset (5-13) or shall I
just throw it into target-arm.next? :-)

thanks
-- PMM
