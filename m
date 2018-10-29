Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4383367wro;
        Mon, 29 Oct 2018 08:47:36 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eY6mMz/cwQwdTTd5IwEHv+2hLwkLEzT+S+D8TMH5JKP6FEa3q80iAYIyHNLrmddg+rpPo0
X-Received: by 2002:aed:2510:: with SMTP id v16-v6mr13069784qtc.211.1540828056209;
        Mon, 29 Oct 2018 08:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540828056; cv=none;
        d=google.com; s=arc-20160816;
        b=pZuZu4mtfmS4mZDo0tNWFPgKWCPGfjSKBFewH96hSfBxf7obMLoZU4yt2yvp4tCz6L
         c+N7qRDSgVcbfname+9HK/m2xx4SNllRofdYeMk8rclvXfwyzcZJgompXnQiPdrjZQi5
         Lk1nT4fKtjTxeyAKyodb4ID2s8ddzWKcdwjqz4mqyDXOFDUbro8MXRnMbmuuYs+61AMW
         WqTceSkWdJD7lmF9gpQhHjtskpNLBkgJn3xtjNDGJamM1W1fHIpFk3WLAeMRJK6+0O77
         VgLBmLL5w0gB54vRoCEP0xgxMOpuRwn7RH2I2FIREg2EUon08/Kg8oU3vt6VuBOHOMBH
         tgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature;
        bh=r2IPcTMiQeQExeQaW1oYQpuZkIFRsIBxTTP5esN6eAQ=;
        b=DW0SEbyyXu79oU/1yuiN36VGiMPVny75eCl25qHnWFdqy9XGksfaKHNAVV35W6rT9s
         /y9B/N35kD/yg+wnkY+HtyqZwvtYJthOGC2oSyzkTC/zMxie9CU5cm60Dyz2AeEfrevZ
         bgdx0/f1KgvBzbZ3nkM7FufLCluWcCEUf/05BuE7CalXIudMxffeWvpjHvfZH6id2d7P
         rsuI2ke3ihiEoP9Q4lQbcQ9LNmquLSRfvfWiNMoA3+iacjINdaBMiPhlTehkb4D+2UiX
         Bgf1G7GA1DU1IanHIyhtwF3GeKdL43MBEx55GdsS3dnVBLsT9MeMkTKZYoRTqcSMxPxI
         3XrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=zxBOKYue;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=b9G8ykyM;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id k5-v6si5230723qte.125.2018.10.29.08.47.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Oct 2018 08:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=zxBOKYue;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=b9G8ykyM;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CCCD021E07;
	Mon, 29 Oct 2018 11:47:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 29 Oct 2018 11:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=mesmtp;
	 bh=r2IPcTMiQeQExeQaW1oYQpuZkIFRsIBxTTP5esN6eAQ=; b=zxBOKYuevqYN
	S+qjFh6X2kvqLj8i1X1Xl5HYZxtrnSO3FuK1bwt2KHglXcDQMVdYdiukug1ERLo+
	5yaYLcFcrSMH5CGCa/drin96BKFNHHrSduxV2w9XLu/pHB1mOjLmfVeHVZmi7NCK
	oMVda2KzNLwlLKVQqEMvmvNsElWv/V0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=r2IPcTMiQeQExeQaW1oYQpuZkIFRsIBxTTP5esN6e
	AQ=; b=b9G8ykyMjXhq/7ueP0PLVMeWtMJRUgCSG5kc5NTL0eBpCWYAH0xY2PgUd
	yQd9d05Riwjwmo5p273RssM8IUD4DZ7gVgJqx9aBHljCcImCB8YR+hPD1PzXqdni
	em6+ehbMj8q+mriY42hPHRV0mpy5xWBsLaoD39s7J9wlGBWOnwxp510JTgi+m+Zk
	TQerxhtWkuzEHy5BxwHAz58hUFEtqHN1lsW7jsg1oFY6qzgvE5cnPjHKjBzsgqfc
	pWZweiZ97pzrybGeOlDU3/5ikxPuLPJBMLpoM154L2wx4JZVSi1ScdXNWvbnX3nV
	WOaYYH8wzOSi3F8/TTKSyTMnghvPQ==
X-ME-Sender: <xms:kSvXW-L1TAPkxmK8kNFApLgZUozLMpqiJKM3Bm9txqLT1CflJvk0TA>
X-ME-Proxy: <xmx:kivXW_7X__xZ6w23c5SiTM0OOsUH3e1ldbC4V0ABgCS8UgjDv7ApIg>
    <xmx:kivXW8Ga4S1WDE41pbLumrvDFQMde4wOB_AaYKjBujTgpAqDyGwBEA>
    <xmx:kivXW1qqUCSZTBp9I2lJlyJMZdbhYo2uLHF8_xFdHqXku6V1H731Aw>
    <xmx:kivXWxmFKfAVcJFGt9EeNUxrbfYkaaCe8m5Do7929HzoIG1-TIgyrA>
    <xmx:kivXW4hLec4U1vqlpOjPQRD1015P-T4UErpvGo2Daf9N8TrEm5QsaQ>
    <xmx:livXW6U5hfWOmJCrVsw-Z1ztAhPDfI26y33jE0Bza__Q_ZlheKPDKQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9EA36102F1;
	Mon, 29 Oct 2018 11:47:29 -0400 (EDT)
Date: Mon, 29 Oct 2018 11:47:28 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,	James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>,	Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,	Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-arm] [RFC v4 00/71] per-CPU locks
Message-ID: <20181029154728.GA17805@flamenco>
References: <20181025144644.15464-1-cota@braap.org>
 <20181025151103.GA19931@flamenco>
 <878t2j21ko.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878t2j21ko.fsf@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TUID: FoLE9n1TmGy7

On Sat, Oct 27, 2018 at 10:14:47 +0100, Alex Bennée wrote:
> 
> Emilio G. Cota <cota@braap.org> writes:
> 
> > [I forgot to add the cover letter to git send-email; here it is]
> >
> > v3: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04179.html
> >
> > "Why is this an RFC?" See v3 link above. Also, see comment at
> > the bottom of this message regarding the last patch of this series.
> 
> I'm also seeing his hang on check-tcg, specifically qemu-aarch64 ./tests/linux-test

Thanks for reporting. The last patch in the series is the one
that causes the hang. I didn't test that patch much, since I
did not intend to get it merged.

Over the weekend I had a bit of time to think about an actual fix, i.e.
how to reduce safe work calls for TLB invalidations. The idea is to check
whether the remote invalidation is necessary at all; we can take the remote
tlb's lock, and check whether the address we want to invalidate has been
read by the remote CPU since its latest flush. On some quick tests
booting an aarch64 system I measured that only up to ~2% of remote
invalidations are actually necessary.

I just did a search on google scholar and found a similar approach
to reduce remote TLB shootdowns on ARM, this time for hardware.
This paper
  "TLB Shootdown Mitigation for Low-Power Many-Core Servers with 
  L1 Virtual Caches"
  https://dl.acm.org/citation.cfm?id=3202975
addresses the issue by employing bloom filters in hardware to
determine whether an address has been accessed by a TLB before
performing an invalidation (and the corresponding icache flush).

In software, using a per-TLB hash table might be enough. I'll try
to have something ready for v5.

Thanks,

		Emilio
