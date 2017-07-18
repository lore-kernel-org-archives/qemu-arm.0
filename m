Received: by 10.25.44.15 with SMTP id s15csp5248327lfs;
        Mon, 17 Jul 2017 17:15:00 -0700 (PDT)
X-Received: by 10.200.47.93 with SMTP id k29mr231808qta.18.1500336900064;
        Mon, 17 Jul 2017 17:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500336900; cv=none;
        d=google.com; s=arc-20160816;
        b=UGh29oG04DflJWR5TVu42ZUahLITkqQ5nE4H3ft7yscGQRVX5Kzzn3oPyyYmxl3ReL
         fzbo7qU8iOxK99Kb2yR43V8YMWx9mdmEPlxaKtb6valfB7Y44Ura4tycaxlMf4J+iBC2
         MOcXtYpTbGgGpYZKEV+1zs6eO4WGmGa28CQY+EIpyKZIFWII8k1wOpSMSAYYIKnFQ7YQ
         3Ne5Entjs6QHZMiKGVJx7dpyo7rWPutOVv2aTEgu10X9dTT1C/EIcEGyBBVFzlPVIBKC
         MPbesHNBSHko2OC8gdPXzav3WkV5NpK51Hyl0SV2JgqoQl3ZbMHunvSw/M5jUq0DKJTT
         IBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=V+84l84UETLziB3E5Jo7/trb/v2d0qBfyWQTOLCe19w=;
        b=NRZOYg70YFgPauxI3gpjqNoNuEFhb9KLJ5Twmkl8MjLjruwr67U1cXYxNiFryQ9Qql
         pKN2rUqNFTyFk523vwTxWMSFosVtc0qmWo8MHjTwVi63vdbsVgeGKh770rTLxT6Zftkj
         JlfeRfaqZ4YvQ0a9rng89yufXOvW5uzzM0V4TlOJtVJseaTwPPTYnWHoD55NOJolZeNe
         9LIPtjPRatSr/lo4BRqiUpjRGbJYePI9z+qgMerKFr/ybhDiC2F56NAk/BXV0XgeTK3J
         UY1tY0Y0/Cjdn0hYO3/Ro/ljAmd4z9i1I/D02VxK3G/Zmbx4CAaAjQXt4dlbwHpOwK/s
         OQSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=UdkerirG;
       dkim=pass header.i=@messagingengine.com header.b=K3ZDAAzD;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id 21si599608qkd.262.2017.07.17.17.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jul 2017 17:15:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=UdkerirG;
       dkim=pass header.i=@messagingengine.com header.b=K3ZDAAzD;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5D51B207ED;
	Mon, 17 Jul 2017 20:14:59 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Mon, 17 Jul 2017 20:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=V+84l84UETLziB3
	E5Jo7/trb/v2d0qBfyWQTOLCe19w=; b=UdkerirGoZg9baJBN5gFzZx268IvT7c
	JGanijpUGfePGNh0KZj8y5b0UDqWQt4WGbOT4tvxy8yN245GhxifEHYbOLGo+qIv
	dKhzSjOOmumHBD9yP07D7fdb9ggDljJQh0TV6WjdhVrlNnx2EnxDDhV/jOk/B2Kb
	QMSsutlgJUPk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=V+84l84UETLziB3E5Jo7/trb/v2d0qBfyWQTOLCe19w=; b=K3ZDAAzD
	fP3KE2+Gu+79whqEBBRdSFIfAvhsISREcToQI0OSHqLdTNmv+c/dw8sN/NwvvFR9
	cFTOpnuHsX0wAHOBUZVFEvCIu438gq/GhZAMHb7zWswQGvQFHexcNLkVO5bzzco5
	7JnLyfKXcaO4qFhS/m7ni+1hXn/MaYchOL+NoQ4oXJUjsrjfJ3RjqBdaNEagRbLb
	zOatQ+Hy3TOwljw/kOX0pSRvnL/hAM2WHBkoToVyQykruAUSyyd9ScCr3d9XbXCs
	0oe0+jbPwsgXhgwSiu9sd0RSCLGc8qKZIpNRsP6pKyV8ItXdZ4xJCq7aC5xya+ab
	HXimsD3A468DCQ==
X-ME-Sender: <xms:A1NtWaT-JqvbmH9KnedabaQ6ymqZdSLe2I5kQUin0XBR-R75mZ3VAw>
X-Sasl-enc: aot96DnfKgyuMDp//30aOXmJ1/1bvE6McnV+TarcoJXy 1500336899
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1777224771;
	Mon, 17 Jul 2017 20:14:59 -0400 (EDT)
Date: Mon, 17 Jul 2017 20:14:58 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, rth@twiddle.net, qemu-devel@nongnu.org,
	Etienne Carriere <etienne.carriere@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 6/6] target/arm: use DISAS_EXIT for eret handling
Message-ID: <20170718001458.GF30851@flamenco>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-7-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170711175937.23140-7-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: E8wWbL+NW9Bf

On Tue, Jul 11, 2017 at 18:59:37 +0100, Alex Bennée wrote:
> Previously DISAS_JUMP did ensure this but with the optimisation of
> 8a6b28c7 (optimize indirect branches) we might not leave the loop.
> This means if any pending interrupts are cleared by changing IRQ flags
> we might never get around to servicing them. You usually notice this
> by seeing the lookup_tb_ptr() helper gainfully chaining TBs together
> while cpu->interrupt_request remains high and the exit_request has not
> been set.
> 
> This breaks amongst other things the OPTEE test suite which executes
> an eret from the secure world after a non-secure world IRQ has gone
> pending which then never gets serviced.
> 
> Instead of using the previously implied semantics of DISAS_JUMP we use
> DISAS_EXIT which will always exit the run-loop.
> 
> CC: Etienne Carriere <etienne.carriere@linaro.org>
> CC: Joakim Bech <joakim.bech@linaro.org>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Emilio G. Cota <cota@braap.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.
