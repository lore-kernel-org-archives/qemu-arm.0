Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5337288wrd;
        Mon, 27 Aug 2018 07:49:00 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb7f62KuBI8qd3hRJGC5BnY+67Ixffl9nkh9t/UidlGVPEGQKc5GoC8OXFW3F7+gfu68Hmz
X-Received: by 2002:a37:d0c:: with SMTP id 12-v6mr13664653qkn.148.1535381340903;
        Mon, 27 Aug 2018 07:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535381340; cv=none;
        d=google.com; s=arc-20160816;
        b=oqBW2DeiasrKjT7Rvv3FwP/JL+Y52wWH1DAg3NUIq+ArVsQpQdKgwcPbojNJmjAfZy
         nDf4VjW1E5xOq57UemkA1qtvAxe2iGz+PAmO1iEIXCDbjRtY/z3wEDwR7GcM/kxgqEwr
         +wioDNDgKJ/rh5GCzAA+f3zq+nOrtH6Pk354fTBxtt4xckjPo1hncwVbIS62pFNp2w/L
         Xs2JmzU0xzqoTmB1bjyFnmpkzOCezFjghb02qC8wvK82h0n5XDHsR5sLbCQL6+sADHyI
         xCqXlQRKQhvcozStsp8YGRieNB5CuTPv/ZiRiCJCTQySJ5GSPO4E4YSm6uTbj/xxSCI8
         G6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=eSaBYdb1pE+CD4dTsCUPAQRZqFjE4jlGH9o6cI51IVM=;
        b=YhEEkloSf09ToncPYjYGhpLbFcj0oLWKkDeJ1OiA0e/5u1crdB3dEIZrhwDI+LTb6O
         tZViuyvPkN5/bwvaqyfjTBNtzjRFz/EOei2irymTtqXPzJMwWHGCqixuVUV/RxVzxnL4
         bV9dJOXCC+d+8c8+HZ5vftF5VkT0fNTC64miGOweadN+kp2fWTn7+fgsixv694Vs3JXH
         XqzVcFoEi8UM6nS5nJSgo6e6TMMLpUfvBrchoG0w3/MsgDpLzk/plsms6yfTpiNfSZMs
         moHdmNoJLVfdTR1bw5SgAwZhEhbwdiykFWd8RDXxaGPpLRpoCcNJ5G1gxPIks7f2VYcM
         LXwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B68yS0Dv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9-v6si10139775qtk.133.2018.08.27.07.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Aug 2018 07:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B68yS0Dv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fuIpA-0002qN-AA
	for alex.bennee@linaro.org; Mon, 27 Aug 2018 10:49:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fuIoa-0002nb-P5
	for qemu-devel@nongnu.org; Mon, 27 Aug 2018 10:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fuIoa-000621-42
	for qemu-devel@nongnu.org; Mon, 27 Aug 2018 10:48:24 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1fuIoY-0005zw-7r; Mon, 27 Aug 2018 10:48:22 -0400
Received: by mail-qt0-x243.google.com with SMTP id d4-v6so18244266qtn.13;
	Mon, 27 Aug 2018 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eSaBYdb1pE+CD4dTsCUPAQRZqFjE4jlGH9o6cI51IVM=;
	b=B68yS0Dv4ngZBV/8Q6O6eC8k9hWjjwJDBML6By5nKwQFOVyrXaUNOAT9MjQmbTgq0e
	wO7SBtqYQdmzkDYJcc9xrb4zGoOMcCU4/txFsCccBXhP/Hl0XdtqH1B+QwErpY/6/D+U
	mC54kmdiR7LIHbSPfMyU4LlAYoGJQIIWMhO1z5F0cz3TGkbUeZlqMSrDO0AclNJxqSst
	CgJUDgjIQQowJ3UIIFWo2V/k3vkUSLn8kKyylAKOerCFMCAenZ58v6qHnvJ0NjbxLVJe
	UniF1siF71RlqduzHE/b/i7Je4G0SO1epNvNgpF4NgqSljpDT7By9uWIrRpx7AygDk/D
	TZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eSaBYdb1pE+CD4dTsCUPAQRZqFjE4jlGH9o6cI51IVM=;
	b=aMoUkjTtuipA68lmMEqvJUvmIXu7qzeYvUq1Lmp7oSKJN74gi7ZysUcHM+B9My+b8Q
	pG32waLunws+y14rlaI3ZT4DptlW8wFbRtBD0vV59dI0jWhQnxx1s/LApE7pYsWtNhyT
	gEElbosY7SbWEeAQKCtqXSHL413d1fTS6OATRgLSTWiuzi/4ukRicQAh1GV/pQy+h4R3
	STonGqQrY+XahXdB188x6nMVmxKjf7lc5M26ELOfovtON+EvCCaukHrrCQjHLYmBwbIi
	d56Vf/ScopYvhVAGwKpFUb1+pu23xLFuhxFxOblvLLZAISkJj1CJZj0wQHhqSygp2WkV
	/aOA==
X-Gm-Message-State: APzg51CVleNfwaWUWUbb71tNAQln4K1LMvy2JZ2j0nQmLTw7d2hD00XJ
	jnKr4BNoY6ApWUo/Utb0OC8=
X-Received: by 2002:ac8:488d:: with SMTP id
	i13-v6mr14650826qtq.235.1535381301290; 
	Mon, 27 Aug 2018 07:48:21 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	k126-v6sm8153044qkb.91.2018.08.27.07.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Aug 2018 07:48:20 -0700 (PDT)
Date: Mon, 27 Aug 2018 10:48:17 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180827144809.GA3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-13-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA-dBq8vTB8sqxJ7_FjeHrteS58J-+2i_iYFH6iH6GWXMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-dBq8vTB8sqxJ7_FjeHrteS58J-+2i_iYFH6iH6GWXMw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH v5 12/13] target/arm: Mark PMINTENSET
 accesses as possibly doing IO
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
Cc: Wei Huang <wei@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Aaron Lindsay <aaron@amperecomputing.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Spradling <michael.spradling@amperecomputing.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: slTKY+ASO6f4

On Jun 28 17:25, Peter Maydell wrote:
> Shouldn't PMINTENCLR and PMINTENCLR_EL1 also be ARM_CP_IO ?

Yes, that was an oversight - I've added a patch addressing this for v6.

-Aaron
