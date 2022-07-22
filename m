Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp114132lfp;
        Fri, 22 Jul 2022 01:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sv6QayQsAmPZYmgGAZ2Il2Ar4dfjDrFFOuPxLbR6FOukLXwWhMIG+EsJ2UFcQKxGPN1qd4
X-Received: by 2002:ad4:5ce8:0:b0:473:d3c0:5c2d with SMTP id iv8-20020ad45ce8000000b00473d3c05c2dmr1990740qvb.83.1658477457108;
        Fri, 22 Jul 2022 01:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658477457; cv=none;
        d=google.com; s=arc-20160816;
        b=olL9vLRWfqdf7PBZqCdkF2TKDim4fZumJPlXOfX3Me0M8cCPCI0tj7AGQ3ZnmdvcOA
         o6wr6jzPohhYuMoIynpQ1zgLAAvJCqrzuNN3osxvmVK/7TAfF10sbQ51VNl0h8DuRqwb
         4t4DQeAfEFZulS4M2V2iBUDvbTZa+SAOmHula47aF737dvGGrbLAsc37D1nnYw5uJLVm
         FgfPN9A1ZR82A3BdLGYW032CdHwK/tHtI3TMmVPWuRvBTsctXdJg+OfN5gWdtj795z4F
         9Rz5TV9472rxoUglhiXDya5WfXMe/hhE7rZMJ+MFy/TNqfEA0LybMYG5zyQe77M7whxE
         TRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date;
        bh=eY6FvcCnqMqvVMARQxKxsBaDK8Goqq/vXfkV0Ky8e8c=;
        b=w172g52tQBwW4MNX/uJ+1RTeqU+5i1snVoC9kJLKCb5XCdFZDRSLw+qn4sycvqSc/8
         v8eimxcBhzpViQ84fm4RTTW6tz2RR2c5/bbUATAGZ3QyC4KXAjG00W9n3b+4OPV0Ujok
         M/Yuouoyvfv3oPTE7vHXnewfU7/KLRbjE+mmwu2wUOaGVC9Jq6SAA2FTvGQwzgjVA2BT
         sHza7bHgpsXiucERo5uLqKpAMWFZBLmzJTcHdc400RACrVp1eMPggVNeL8dTJnjbAzEe
         z9ui0sicLzpX/VSqYxoKHn7HyU5JbY9/Y9VXo4a1H+HLrD4Ch1AwuIbrtn1+vQOaj/Dy
         nnlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp14-20020ad45f8e000000b004718d9a6e9asi2903411qvb.332.2022.07.22.01.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 01:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEnkO-0008PP-AW
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 04:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oEngK-0006I1-Mo; Fri, 22 Jul 2022 04:06:49 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:60152
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oEngG-0000Ia-6Q; Fri, 22 Jul 2022 04:06:41 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oEng3-0004bY-St; Fri, 22 Jul 2022 09:06:27 +0100
Date: Fri, 22 Jul 2022 09:06:27 +0100
From: Ben Dooks <ben@fluff.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 sudip.mhukerjee@codethink.co.uk, ben.dooks@codethink.co.uk
Subject: Re: [PATCH v3 0/8] m25p80: Add SFDP support
Message-ID: <20220722080627.jx2jylfhte3zv6ab@hetzy.fluff.org>
References: <20220722063602.128144-1-clg@kaod.org>
 <ae6d8345-5a14-3f1e-d544-5f07b0b76a9c@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae6d8345-5a14-3f1e-d544-5f07b0b76a9c@kaod.org>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6LEPW4JFAAvH

On Fri, Jul 22, 2022 at 09:05:39AM +0200, Cédric Le Goater wrote:
> On 7/22/22 08:35, Cédric Le Goater wrote:
> > Hello,
> > 
> > This is a refresh of a patchset sent long ago [1] adding support for
> 
> [1] was lost while writing the cover :
> 
>   https://lore.kernel.org/qemu-devel/20200902093107.608000-1-clg@kaod.org/

Is there a git branch this could be pulled from to have a look at and
test on our setup?

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

