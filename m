Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp274265lfp;
        Fri, 15 Jul 2022 10:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfRk3PLUuQcgRvRT0L9MPGTQlmQV8G8V6k3MvF5MkKXFbGmIkkE7LTfWFl/944vXcoiiS9
X-Received: by 2002:a05:6214:c68:b0:473:9621:1550 with SMTP id t8-20020a0562140c6800b0047396211550mr12050014qvj.47.1657907388565;
        Fri, 15 Jul 2022 10:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657907388; cv=none;
        d=google.com; s=arc-20160816;
        b=pCllSVDjz2Ff26NzBwHE4rTwggYTfSiARv8DzAkfPUycoK6IDUjQxj1g8Rely3vFx0
         ciHeRSg2bLDZkqyAIEZoyvcow0Rzjy9TIpnA6Q7PWkWDVAww5MZKjzfV7N2X2y6qMe15
         UaXfN3RWQ7i1gKTriHD/B7AmfLyjPvUQPWwA1C+zx+deEjkb5IgQEhH6J4yw5pCx52V2
         K3rx6lL/Li6Iwe18yEy3jXTXmIy4f7XOW1mPsXBp7Wssj6eowFLNZwpsz0KNV6HJzMAA
         PrYZWC0NEv2vT1NAIOGLumzd2bIlHIb8wvbig9yQaYuxZ1pYTVyCqvsjbMeFsxgJBbeJ
         Lanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=03l/wDsd2kiG51AwI6jc3ksKXPi/Qe/4W9rRlobhhs8=;
        b=zOQA4jIJBvcrd/yjRTpTX1cCl3q4YY5HpxMrgeNf6+UP/xMLDgnjHKbUoFDJ2meOE2
         lyrc4S8PA605pr5RWUWyTSoWTx5tniblpLhgXGDtoj3iO/fYGJGG18+mGTxnPNaNBTCU
         +JDHdFDddg43isohRIU7hUtszJ5BsdLvRhELx8XBY8n21SYjESaJtBk1QE28FQXYeuUA
         RMp27Ruc+LvrVdJuZ1Ioe1MzdaCxgCQf4mSqr+lZNsdA894325ZBJXfEm3ghplD4qaLj
         7WvNC/PKozklNjTXijgguhg5ZP2zZ4lw+L0dXiQ7dn984U3Ys6/Ew/+qztHGzYvta7pq
         cMsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=cHLd1v7O;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=S0FyBN2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020ac81e8f000000b003051a9c7f2esi3030207qtm.334.2022.07.15.10.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 10:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=cHLd1v7O;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=S0FyBN2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCPRk-0006S6-3Y
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 13:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oCPRZ-0006Rt-O2; Fri, 15 Jul 2022 13:49:37 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oCPRX-0000Jz-LZ; Fri, 15 Jul 2022 13:49:37 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id BEA4E580DF2;
 Fri, 15 Jul 2022 13:49:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 15 Jul 2022 13:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657907374; x=1657910974; bh=03l/wDsd2k
 iG51AwI6jc3ksKXPi/Qe/4W9rRlobhhs8=; b=cHLd1v7OJBUp5Zi5+5OdtD1PGS
 +q6Ce1J3xHdmqvvM+xSxz2SUDqb2oR0pshEG1P8nAltdamYS+q0aXtAloagNsDI6
 KsWjqt/kwrutmXMfBCqnP13Z5YvT+cRfV6rPZE+CcLdtOJXE85OuPrHzr5ORNdoO
 ROIWYPGI17tMG3UlEbNpuxqe1SaZYy/SGU0w8lyjthZaZU0v9QuJDfUvFeshHqGS
 l4WLfQk20hNv4BhsWfpXSoHmSkkmWIWp3FL/6H5DJPdzLfssGZs/UXY4TyNvK7xd
 ks/xoLkmwQ229isgnR/XHkLdEHU2KZ/GR97cS50e5+31rv1FqUBm/6VwABfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657907374; x=1657910974; bh=03l/wDsd2kiG51AwI6jc3ksKXPi/
 Qe/4W9rRlobhhs8=; b=S0FyBN2KZihLWOLC6ZtR6xmkszKhj/Ue0131Kpv13p96
 OL4T2pS/KrxfFMvZT1mfY+30+9D0dFKoq0vvII2mlKZx8o+Ir5UDjBUIu+k9g9EH
 HibEf6a5+lEyc2VRrfJ8Mx1eNCYlQxbYXnvh9s93t+umEddVEwjIvO3XbJGjQGSp
 zT34Sq7PJtNXTeM2RTJnxPKcEXPfeIu9qWperf07EYFwXyxMceTVJzoWQEY61l+2
 lIVqQTJ68fNs+9FiuMRrRVvIc3us7rqts6vrxm655Asp4+XjIRBdqbYtofNnN5GC
 mcWEi4Z3eKS1Pg0gnff1j+SIZv5wXSxi1i47cqtkQw==
X-ME-Sender: <xms:rqjRYjPoyzqeKxltro-q_v3OEwf62ecl6JLeeLg3tOk_UYYfeocZfA>
 <xme:rqjRYt_Lacyc5lX8zggP6w5j3EIaSLejJTu75hQBEi-IYx9KJhUIeZDoJEPhxEw4j
 TCQcIGR3B62HYzNz3s>
X-ME-Received: <xmr:rqjRYiSAKmHeqDiguRcBPCHb25k6qLV4BBEXYatayXnT2kk2T54w7Y5SQ2YLALUYkG4k5wEnjcmK0naqkscwtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:rqjRYntTTCwTlzpRYoGeMGLqiCFv2cTMi-ELJiP9tlkgwHsNc4ppVA>
 <xmx:rqjRYrfRJ0vfti9kM-j3n4zqEt_B_3Md6RnoGrexBiQpwaJSEyJDSA>
 <xmx:rqjRYj1R-U2fZ0esh1wcspsEStmiOqCAEr6AIupUHoL-hzdmJGWjqw>
 <xmx:rqjRYn7BEW0cvbRoZE6WeHG8zjQdPLcQnM5_avOnRP_iUzIZCUUSIg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 13:49:33 -0400 (EDT)
Date: Fri, 15 Jul 2022 10:49:31 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Klaus Jensen <k.jensen@samsung.com>
Cc: clg@kaod.org, cminyard@mvista.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [RFC] aspeed/i2c: multi-master between SoC's
Message-ID: <YtGoq/u+PhZHCg7n@pdel-mbp.dhcp.thefacebook.com>
References: <CGME20220715030653eucas1p1424b94eec7ad76c32ab478916e64d337@eucas1p1.samsung.com>
 <YtDZxbUWbqO9zIKk@pdel-mbp.dhcp.thefacebook.com>
 <YtEcJlagrpVajaeM@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtEcJlagrpVajaeM@apples>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM28=0.798, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XMxqQzuqmH1A

On Fri, Jul 15, 2022 at 09:49:58AM +0200, Klaus Jensen wrote:
> On Jul 14 20:06, Peter Delevoryas wrote:
> > Hey Cedric, Klaus, and Corey,
> > 
> 
> Hi Peter,
> 
> Regardless of the issues you are facing its awesome to see this being
> put to work like this!

Haha yeah, well, _all_ the designs at Meta (fb) rely significantly on
multi-master i2c. I think I've been trying to get this working for months now,
but we're really close!

If I can just get the i2c layer working, then proper IPMB and MCTP testing
between BMC and BIC firmware will be much easier.

There's some part defects that have a very low frequency of occurrence, and the
patches for those defects rely on a BMC <-> BIC <-> <device> chain of IPMB
messages. With QEMU, we could test those patches much more thoroughly, because
we can inject the part-defect behavior.

> 
> > So I realized something about the current state of multi-master i2c:
> > 
> > We can't do transfers between two Aspeed I2C controllers, e.g.  AST1030 <->
> > AST2600. I'm looking into this case in the new fby35 machine (which isn't even
> > merged yet, just in Cedric's pull request)
> > 
> > This is because the AspeedI2CBusSlave is only designed to receive through
> > i2c_send_async(). But the AspeedI2CBus master-mode transfers use i2c_send().
> > 
> > So, the AST2600 can't send data to the AST1030. And the AST1030 can't reply to
> > the AST2600.
> > 
> > (By the way, another small issue: AspeedI2CBusSlave expects the parent of its
> > parent to be its AspeedI2CBus, but that's not true if multiple SoC's are sharing
> > an I2CBus. But that's easy to resolve, I'll send a patch for that soon).
> > 
> > I'm wondering how best to resolve the multi-SoC send-async issue, while
> > retaining the ability to send synchronously to non-SoC slave devices.
> > 
> > I think there's only one way, as far as I can see:
> > 
> > - Force the Aspeed I2C Controller to master the I2C bus before starting a master
> >   transfer. Even for synchronous transfers.
> > 
> > This shouldn't be a big problem, we can still do synchronous transfers, we just
> > have to wait for the bus to be free before starting the transfer.
> > 
> > - If the I2C slave targets for a master2slave transfer support async_send, then
> >   use async_send. This requires refactoring aspeed_i2c_bus_send into a state
> >   machine to send data asynchronously.
> > 
> > In other words, don't try to do a synchronous transfer to an SoC.
> > 
> > But, of course, we can keep doing synchronous transfers from SoC -> sensor or
> > sensor -> SoC.
> > 
> 
> Yeah, hmm. This is tricky because callers of bus_send expects the
> transfer to be "resolved" immediately. Per design, the asynchronous send
> requires the device mastering the bus to itself be asynchronous (like
> the i2c-echo device I added as an example).

Understood: I was ommitting other necessary changes. Yes, we would need to
async-ify all the way up the chain to the register read/write.

> 
> However, looking at aspeed_i2c_bus_handle_cmd (which is the caller of
> bus_send), it should be possible to accept bus_send to "yield" as you
> sketch below and not raise any interrupt. And yes, it would be required
> in bus_send to call i2c_bus_master to register a BH which can then
> raise the interrupt upon i2c_ack().

Yep, that's what I was thinking of. I think I would actually call i2c_bus_master
in aspeed_i2c_bus_handle_cmd or higher though, because I would only call
i2c_bus_master once until the STOP command is issued (or the DMA/pool transfer
is complete). But yeah, I think we're on the same page.
