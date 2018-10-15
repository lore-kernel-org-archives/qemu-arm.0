Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4871017wrt;
        Mon, 15 Oct 2018 12:50:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62NzPAAlqZB5YxGfbRtlJ33KncIT+4JCou+CCjMv5XorFrIyL+wohccLtZiRJaggPiKqL7Z
X-Received: by 2002:ac8:3a22:: with SMTP id w31-v6mr17575752qte.142.1539633059816;
        Mon, 15 Oct 2018 12:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539633059; cv=none;
        d=google.com; s=arc-20160816;
        b=mDx8zbLhWaqd3t7GDME7j2MlC/fFOBKDXLCmWYT747VuRBaBOOYWu6HVyZ67YaUhUZ
         Z0haSnmfDk2yenOX7VvHXuqPYpUn9mSqwOreTJrQXeod5U7Xzp/V//0KM+ZkZzWRdXeP
         W+MeABzZGdhCegvCOJ6GGVBIOEDsW1KyRIzClpUleMYYzz59a5CRQREzFsPLztgPbqt6
         21eoS9J3G0GqBq5j8KBypA5SWp9wSNbKBKb+Y7yhxOQphRLvTk1VCzKoqbP72SuNj+Fi
         7JHkfg07iBOZcolkZGh7QJC7ORoxlAZMAPmhRZN8QfL1F8DGDJ28FTUICOIyFKUcfYO6
         dz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=XppUfIDy6HNxNb/oKZYYzwns5Q86u9eNUm4jfSJtb6k=;
        b=PMiMwFUnTDbtMzps/rR/LDLiQOfEG9lksiSIUOH1FCquT/gALRLNnvtLRmtHvLLizw
         uVNEy61tH/cysw3IxF0/52W9LozzJHrvTZF8NK8cbUtGZe0EO4YgRgrpUiL5lNpqvZuE
         b5wQ0eV4VLD/Tj3bXKr7ZRTI55dD8aAGkDvg7wHTPKHT5vmxWsIwA1CvKTd9Bt/7Fu+k
         QFAaZwJx5Y67kuDy1k91ZrlzvQwOGARpok9JPj6wsQ5qwZ+pwo9G2az64+H6yas5DOQI
         IvOO1Vs/pdwDhaFnHBha6o9KlpVi4Al03znGno0wRwguQqx/ekbkgzyBL0Sd9bPCiehb
         9zhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A3KPKw+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2si448905qvs.188.2018.10.15.12.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 12:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A3KPKw+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC8tH-00012R-8q
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 15:50:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8t0-000114-3n
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8su-0004vQ-Jq
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:50:41 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC8su-0004sT-9N
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:50:36 -0400
Received: by mail-pf1-x444.google.com with SMTP id u12-v6so10187319pfn.12
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XppUfIDy6HNxNb/oKZYYzwns5Q86u9eNUm4jfSJtb6k=;
	b=A3KPKw+i6NUE8V3GTle5sxMg5UCcv631s2XyWJcNmBntwhUaltdgjXS4yhS30b2n2g
	rSXY7day4Ea8cAbmJBPlLST742TJZcBA6BixrbrGZo2mS4uq9u7f8bYFmudfaHh7HvPx
	FSZroAxutvp/LJTJZ+fo0bXEJY22sK4jFHqU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XppUfIDy6HNxNb/oKZYYzwns5Q86u9eNUm4jfSJtb6k=;
	b=K6jeLBPjPHPVn+SX/btCbGChwTt+npeTV9pJg/CJwxKLkZBducFJuVolqd5tjdQDNP
	Gvd0/EupQyTEaIDg0VruIEe1Co1UV3AHAZVxkye5Wc7LGFza/f9cJJn27LUpes39Lz0o
	HgdwMW2ysbY2AYtj/WETzEAcMEHu6dkbxKDAWQpnClTlGDq7eisgbiraN1xxnZK21zLn
	KkZcc6JL++H+WW6SbyIlgYaQbJR9QK4rTziixSu+cIybpbqGeIVCaYbqmxCpNFIu/V6d
	bBJVcnXzeIjNX+gPtOoNd9emVACculKYhDL7hjPtB5Uy0QgRrhd/+IeI6kcnpGd0g0dX
	XUXA==
X-Gm-Message-State: ABuFfoi23b3XUk9vv9V+LoIWTjnCR3Lg+1FU5fuSJX2X4g1Xo8TToMkx
	xE7MZTbHc1J+aJrysqx1W1uaxw==
X-Received: by 2002:a63:2a11:: with SMTP id
	q17-v6mr17258682pgq.374.1539633028377; 
	Mon, 15 Oct 2018 12:50:28 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	y131-v6sm12362202pfg.164.2018.10.15.12.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 12:50:27 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-6-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4fff310a-8fc6-91f9-6caf-315c84d983d0@linaro.org>
Date: Mon, 15 Oct 2018 12:50:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-6-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/14] target/arm: Reorganize
 PMCCNTR accesses
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eDz8Qcm7s0OX

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. Consolidate the duplicated code into two
> functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> c15_ccnt in CPUARMState so that we can simultaneously save both the
> architectural register value and the last underlying cycle count - this
> ensures time isn't lost and will also allow us to access the 'old'
> architectural register value in order to detect overflows in later
> patches.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.h     | 26 ++++++++----
>  target/arm/helper.c  | 96 +++++++++++++++++++++++---------------------
>  target/arm/machine.c |  8 ++--
>  3 files changed, 73 insertions(+), 57 deletions(-)

Ok, looking at this follow-up makes more sense than the previous patch.  Would
it make sense to squash these two together?

It also makes sense why you'd need the post_save hook.


r~

