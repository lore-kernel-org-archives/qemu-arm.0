Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6484793wrx;
        Wed, 6 Mar 2019 15:49:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyppZKkfVEx+clyWD4KqdBoKcR0wy1rVvnHp+hoXaO2YX26x4EKLV2u3qp9cZ6CknXjLInB
X-Received: by 2002:ac8:35f8:: with SMTP id l53mr8128588qtb.15.1551916172823;
        Wed, 06 Mar 2019 15:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551916172; cv=none;
        d=google.com; s=arc-20160816;
        b=0IQzmdlrpSGZrgLel+8xEAfu2/A7yvN9KKDoTmz6jpnTxxvAWUcCmD0uwzJx82sj0/
         B0YShW/+/6Ep+Io6vHRiGFpVPLfCyu2H+zNA/oYXpV9QvpQrEHvN6sh0kLFc7ckQ+mIG
         ZycJCW+I3LYyb4hDKrHclKh9YHtTNHxfIp59JBw7Ef3Uy4MHzoAaz7KTSD+7SIoiqr6h
         GEaDQs9Sr38X9RvlpgO4gbMVkYuDWyn+kJ1EhYUaD888P+8hibouUcNWbjwFF2It8HZ+
         J/a8QhSeiCZVzIXlOzYuLu32NoLY02BMXwxT2n/BN7q6UbqF4D0VtCX8W8JHyf+3+q/N
         epTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature:dkim-signature;
        bh=iB26MdNCYp6DZmLzhRFIhwRfqSIXUu8HqXykfadqT4k=;
        b=eScnnoWxqJIrbmmwqNsOz2O1d3D2+wzbQkJzXwcakVJ+96xKuY1zKwzgqtO2rb2f1/
         fKCG8IY0jTwUTmAjCpUUuP/b2hECaeDxqZRNdQBo//imaWY2i1OxZ+MCtV4MqIuA1W89
         tZ+dVCgC01OEAYe1hTplDnRdpKjCS49oraTBJUBvE8fWwob8qWqHKWTWiEXq3dpoV45z
         JgP9A9P3g2mciyIkYVuSS0P6DvzT140eDs64eHzTSEN0R+lHRCxZEY95CjwWww+2bVwE
         CUu7l/4EuTQTM2ldLVB+qIQfW2C9f7vm3lkzNQaCMizlNL6nZbe1yzb90eSsdgmDHi5X
         iWmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=PxCfxwAe;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=kxT71JpB;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com. [66.111.4.26])
        by mx.google.com with ESMTPS id g23si1803683qtp.400.2019.03.06.15.49.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2019 15:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) client-ip=66.111.4.26;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=PxCfxwAe;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=kxT71JpB;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EB1C42202A;
	Wed,  6 Mar 2019 18:49:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 06 Mar 2019 18:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=iB26MdNCYp6DZmLzhRFIhwRf
	qSIXUu8HqXykfadqT4k=; b=PxCfxwAeepnBxHEg2ue+HMhq4UkYbPoiThqD/muC
	3txUznznrxm24RavFiGvRUPW6NjffhMmiLB0fbXjcfJ5S0xRbnvHiA3CBrMlWFRW
	d3eKXUHmhWS1qHY+WL9Szfe7ugRo+iOO/Hu+2aPn2wAx4WF7kQpRbWkah8PM2bb9
	dRE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iB26Md
	NCYp6DZmLzhRFIhwRfqSIXUu8HqXykfadqT4k=; b=kxT71JpBAIzp08GleguRor
	AA0YK6o8MvLXFvrjSdKflTg+5VpUK9MCkwFIP7mtiZpGCYPbq1cmcjcTVF+pozao
	6ct10W5JNwsj3tdPNtIMYRdM+DgpFlD9C/dZ/QeZBqcgqEdsisFgEciFw7+ASXJm
	ZJPTOMkZj8NKglG66p1PdSwlQ2wtv/nzzUlmOUpLtLRuanoYqsuZwHGfCom5yID9
	rTL+BkN0ecFb4x7wNrMO8tPg80rigpqeapEYaq91jy6iBGFE2yKmzpajRCymf7K8
	il68ADwpTWl6rqr6QYd90ZcAJinYwQ+7/sT5VYHrOOD2Ge1aRR8dU7DHxSOfNtWw
	==
X-ME-Sender: <xms:h1yAXJ18EcTTdKpa1T7rX5BLx3bmW0utwEtjmLEzHIJPQVbgP6FcdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeejgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpedfgfhmihhl
    ihhoucfirdcuvehothgrfdcuoegtohhtrgessghrrggrphdrohhrgheqnecukfhppeduvd
    ekrdehledrvddtrddvudeinecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhtrgessghr
    rggrphdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:h1yAXGzuXroYwGrUomjP26Psjr0ozpTgY0Scqg4ND0STFuVJhri6cw>
    <xmx:h1yAXOXg3vlyszxYJo_8xfXGE7AzqbfY181zLqXBJOpz97Vs93fh6A>
    <xmx:h1yAXFDOT77iF2hNuHcXZFtrUWi0DU7Z3uaKOfM9h3431DlRo2syZQ>
    <xmx:i1yAXJl-38coUldH1SjUQoUb31jJe8Qr8dkN9JCuL1nIP3Y9A2ih7w>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0161D10335;
	Wed,  6 Mar 2019 18:49:27 -0500 (EST)
Date: Wed, 6 Mar 2019 18:49:26 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Alistair Francis <alistair23@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Chris Wulff <crwulff@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, James Hogan <jhogan@kernel.org>,
	Laurent Vivier <laurent@vivier.eu>, Marek Vasut <marex@denx.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	Palmer Dabbelt <palmer@sifive.com>,	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH v7 00/73] per-CPU locks
Message-ID: <20190306234926.GA6115@flamenco>
References: <20190304181813.8075-1-cota@braap.org>
 <2adf8423-458d-27c3-67bf-d4775104ad43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2adf8423-458d-27c3-67bf-d4775104ad43@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TUID: xI1vhs5swiu/

On Wed, Mar 06, 2019 at 11:40:57 -0800, Richard Henderson wrote:
> Peter reported to me a hang on the x86_64
> bios-tables-test with an arm32 host.  I have been able to replicate this.
(snip)

I reproduced this on a power7 machine (gcc110). However, after a few
git checkout->build cycles I was not able to reproduce this again (!?).

I currently have very little time to spend on this. Given how close we
are to the soft freeze, I suggest we defer the merge of this series
to post-v4.0.

Thanks,

		Emilio
