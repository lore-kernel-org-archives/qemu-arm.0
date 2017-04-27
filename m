Received: by 10.25.0.144 with SMTP id 138csp572914lfa;
        Wed, 26 Apr 2017 20:32:40 -0700 (PDT)
X-Received: by 10.200.56.210 with SMTP id g18mr3012879qtc.242.1493263960354;
        Wed, 26 Apr 2017 20:32:40 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id m63si1453848qkc.305.2017.04.26.20.32.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B21E120840;
	Wed, 26 Apr 2017 23:32:39 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=y+Qa1gZ6WZLoJ8GzmPddawm9FkZOThA7/RNwGw
	uY/2Q=; b=xuKOAouH19QUBMR0oNnoPK71iNKpSfaIlbbhnEjMNjMS4ZkT6Q4Tkr
	pkp21fxQ5AkWUqB1W14ehUTdugqljHNDUPZkeCToAOPRFwN0smcXX3sYxQ9JzLLz
	tkvawR+wWgFNKDbwVcLJNRkPfCUAjEp8BqkY0vzHKZADE2GuAvD9E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=y+Qa1gZ6WZLoJ8GzmP
	ddawm9FkZOThA7/RNwGwuY/2Q=; b=o6ME8dIKaZe88TY77fQ3MKOb+5f1wR+wnO
	RoT/IYU+iSAyrX84dJnuGh73FQTjdE1pqq5vYyzaKbBWaDUSqBi0ILUaSmj+jtQ8
	zFdqZexG7htoWMR83Uc5/iRns6MIx+vJnrunVGanbhTjhqtJzgVHOqqTbDhm4Kuh
	txmWOh0OmqwdfzWDIxMLQZ8hQIMyjeAfcrEbWTMrq90LIrGyJe7ICtslrEqeIo5H
	kxPjRWii/aDVREN4s09ByxtfVkboCfUSJR+W82vhF826U3EzTvdZSX/TJAR9sfpq
	/10xwsRTzF9CnZd/0AyE/rnymyJTP5/Jw2IhkojmDWmK4fJjP91A==
X-ME-Sender: <xms:V2YBWY55yFZ1wFqVAhpbxrtmVW5mF0ZJWtlGduyetmq_27g_RGR-XA>
X-Sasl-enc: lU1KTM+o6M74VW8QzkkUid5GmEU24t8Wbhl6rlehm60N 1493263959
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 701487E0A4;
	Wed, 26 Apr 2017 23:32:39 -0400 (EDT)
Date: Wed, 26 Apr 2017 23:32:39 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org, alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH v4 00/11] TCG optimizations for 2.10
Message-ID: <20170427033239.GA19380@flamenco>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: eAvgeb5+qKbi

Just to avoid confusion,

On Wed, Apr 26, 2017 at 23:29:13 -0400, Emilio G. Cota wrote:
> I have *not* re-run all experiments, because it takes several hours and
> performance hasn't changed much from v3, as can be seen in these two charts:
> * spec06int user-mode, test input, v2.9.0 baseline: http://imgur.com/ME2eMq1

Here v4 doesn't have the htable lookup. (v4+htable has it)

> * spec06int softmmu, test input, v3 baseline: http://imgur.com/Clolu9Z

Here v4 does have it.

		E.
