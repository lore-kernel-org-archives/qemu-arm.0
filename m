Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6239794wrt;
        Tue, 16 Oct 2018 10:30:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Y9VxJXcE2nWDKq/jgyii8P4FdJFBvWk3JvMJ4+gAkSmjR3cQhwem/EghwineUNLazjOmo
X-Received: by 2002:a0c:adaa:: with SMTP id w39mr21506655qvc.149.1539711017595;
        Tue, 16 Oct 2018 10:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539711017; cv=none;
        d=google.com; s=arc-20160816;
        b=KepVWO2oCK+KX7/kWbo74sFS35Vo51Q+WPv+lNBcDb/X6M8fFr/O/uQ2ykFXvTv9Wk
         6YR3KLOxTo60csLnDW8dptQwujBB9UVYsMULj/Wirm50RMYqCQ7Z6Como8r7/qHa1vaB
         B+ObQGWZuRsmrbjgOg81eB9yNMXuVb2d9fsGt07ujzW7zgQ9GB+bI7jAgw9KZUtUuQxS
         bQw5WRm/wvSEuGr/93SD5zL/RryvkcSlQoyxsPat3NGy83zBL3GMoBSGjjquMZNeC7ZQ
         877CxdPZR1Z0TOd5YeBicMv+IZMe7OFrCjNA/SiZW6yexhMQDYVmT4sfu6MU/UsI4Y8a
         Zj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=+E6F5KwC1npBd70nUQGQXg6cWSfGu+RbhGfLQVIZtPo=;
        b=zXPjYJUAX3jlo0vwz8M1iiOLfwNlwV5oP/R5au4mEvmJNjU9+esTxjpI0WfWDwsW57
         LMnvkgaDPdXc1JzYNWdo4zpYaCguRv8fKgBGPamSZYoQUM+IdW84pRivpvIG7pNQ4qH+
         Z96fudh2f6xEo8nuGqaAoTv7ytiPelBJdRFPn+UdXWFr5jYxmwBA7JlMKddx2QWRivYY
         xYCqBGIQHOnj6iK3Q7+BTfx1BuN4jhj/i+QDTWwCHsReGv/wgKV5QE/O69pepbiHBG9s
         ONmd3zMc1CBmWdOPOdSQTiWfgEAgCK4OiKGEjGFlHNajhzRv6Zdv1nzPq3USr8D71ztJ
         OiKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KU9K7hVz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si831904qvp.165.2018.10.16.10.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 10:30:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KU9K7hVz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCTAf-00030n-4N
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 13:30:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCTAW-00030R-B0
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 13:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCTAS-00016R-Aq
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 13:30:08 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCTAR-00011n-LW
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 13:30:04 -0400
Received: by mail-pf1-x442.google.com with SMTP id c25-v6so11796414pfe.6
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+E6F5KwC1npBd70nUQGQXg6cWSfGu+RbhGfLQVIZtPo=;
	b=KU9K7hVzV65FTaMerTBpww8lFHm54j2YNJbEnKcgBzjTqOMG/InlgvyaFvqxO72kxt
	YNYWzMCGKbQaB0fSxpi2Os5kLNgG4M9hR/+QLe5rEgMjFOZTFHI8tfLm7w8zkCFP32o+
	i3mro6MHEBarPnJputSeprC0/mh7k4eu9FpEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+E6F5KwC1npBd70nUQGQXg6cWSfGu+RbhGfLQVIZtPo=;
	b=lVpg9HPF+HewUio9yRIoALpXUb2pciB2tG930wlFWFXpmvlTzu8miIaE0GFsL6ok9Q
	Wsb5zb0ruIawWegSZy6cFZo6X7qDHKwGf3b5cI5oc7cZX29qa2VerXGzHDHLBxjoo+bI
	GVA0HI8Tcfdf+0Fn1wLcivR4b756WKne4BSEvNJ83pksRHvd/wr06sfPp/wqwSpxKfvI
	VfABHloY+3KMaOX6zhWxbijEsb46gPWgcDsTmLb3ekaxoJDsJncFR1JQCSjPpBx4kr4x
	UZIy0CKcXNfkGfbBMcCMTwXh+q6YkOOn7yImrN+L41/T8i5G37kLsB7Rvdom+mIk0k/K
	0hkA==
X-Gm-Message-State: ABuFfog21pYyiJaK+x79xhf3pS7T/dC6jf1NsIIqFj8MG9Y4ndgRgH3j
	zsCcrFfZCzMC0VWXYeYaYmKXiQ==
X-Received: by 2002:a62:be1a:: with SMTP id
	l26-v6mr23515283pff.204.1539711002515; 
	Tue, 16 Oct 2018 10:30:02 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	u79-v6sm22646431pfd.117.2018.10.16.10.30.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 10:30:01 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<CAFEAcA9cACQa7A8VUdfuSk-FcmFeHu+4x5m7HDE1A-+LYcwvXA@mail.gmail.com>
	<20181016124648.GN3671@okra.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2dcd14ea-7fec-c2f0-09aa-017377b578cd@linaro.org>
Date: Tue, 16 Oct 2018 10:29:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181016124648.GN3671@okra.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [PATCH v6 00/14] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lm25iGCONFsT

On 10/16/18 5:46 AM, Aaron Lindsay wrote:
> Is anyone willing to take a glance at the final patch in this series,
> "target/arm: Send interrupts on PMU counter overflow", before my next
> iteration? I'm particularly interested in a review of the approach I
> took for detecting overflow.

I intend to finish reviewing the patch series today.


r~
