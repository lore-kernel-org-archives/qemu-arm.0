Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1629723wru;
        Mon, 16 Jul 2018 08:28:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf79sLDr+OgxsEEiDVQwwPnA7bhvuUF4P2aB6RNaImrIClABRt5d7uJyNkIAflWQ0rYpsKd
X-Received: by 2002:a37:ae86:: with SMTP id x128-v6mr13169519qke.25.1531754882356;
        Mon, 16 Jul 2018 08:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531754882; cv=none;
        d=google.com; s=arc-20160816;
        b=x8uKdQKIBskzX6X01AaVKyl0JD61f34jq+GrkwCKZ5RiyvIikjxJv0u5EzNetXPDTh
         BTqgdaCFG0U0EFyi2jImTWouNW9PeERkSN8VkC9t084wJUdJk9qkpn7/4hI9MY9jGS3B
         bdWSY5vSwfE8uQYlpPf3uoBB72/1K4lMh80GRr4C338dc8xrcrdqp5eQOu4PNkxtEZ9w
         vJm+2yfxNPgYZtixhk78/xysNr/s686bGa3HdpVXL23jX9oVSJ1zw13R7twnNnBhJCeb
         +IblxV+JAGvg88LEpchXl6UHlIBP0FZPqmmr7ge/QMEvCi1C/HgpTSXSgUCH9JGd2Tt9
         kgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pUUE4mZ2Qg3VWCr2t1o5rpT0NtbopHdNTLacLcptb6o=;
        b=XGzKkajT8i5Lwfazsf4QMXPbCovvz4TLgXgwgxJP3IOpCmVhwNwFpUruHG6r0NY2l7
         AIxCPxPQy2gaaHLZLStrgnP4olWjdt00BQ7hwGuDp++jeE9jMAhWCsEXs2D4Bkoz2bCw
         tg5/rpDGkXcYAxbtqoBnzE+aJTmkG9Yd4srJ9q7NaTrBo8PXTXCUKAJ0HyA0dLN/Cjm+
         fqIVXMWS5h0ywODijD1hr41xhCv3bNYTGg865rYjnUMQGxoReKfSbDuJAZwtPPrhbwMs
         /v2v7EXQkboxuFQNqFBg/KxIcHtW+FBRWKmy4L0Ssq9tpMcER8aXLN0KvcVV4N1GVA+4
         EauQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=go5Q2B6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93-v6si23342037qkb.307.2018.07.16.08.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 08:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=go5Q2B6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff5Pt-0001Ny-Sn
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 11:28:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ff5Pk-0001NE-Kv
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 11:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ff5Ph-0006CF-Hi
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 11:27:52 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:41252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ff5Ph-0006Bd-9u
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 11:27:49 -0400
Received: by mail-pf0-x243.google.com with SMTP id c21-v6so21842514pfn.8
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pUUE4mZ2Qg3VWCr2t1o5rpT0NtbopHdNTLacLcptb6o=;
	b=go5Q2B6XOB1kLKlqLMd/+HkrgKRX6tjCFcqa9XOK80z4WErNT03pFFDYzLYiO+OOXv
	2A/wSj63Q9sp7YM3paHqJMbebglMTeCXO0Xmbsb9hOVj2QujC1ffKXHX/sb6q5M7yM+9
	2SVEtsmsjgXlAA3ebSQRdyalt+xsJ3Ofk7waE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pUUE4mZ2Qg3VWCr2t1o5rpT0NtbopHdNTLacLcptb6o=;
	b=agJmZaItuSuvgtgb5uI7qR/7CN/9S8b29U356ubt8e912cm2jAQSL2UuaKivAb/tdn
	8nnlsh+MPuGbwn8w1O4iitHabxbdUUBYkzNHLzoLbPbpc/RVs3WbWkTAmIh6Bso1DNsr
	Lqx1CEg7xbB51G8XOBLVY1lssht3dl2DrIb1JPpu9HKOdvsodgZzzpleSlsvWuEEUy3T
	XgmMFIuMEwGHNCACVN0PUWb61ZthVyeo1zbEhKJ4xRz6yAPnTAk77fW7oVtTNsr6j+Aw
	jA8IMSd4q1Ki1T8W/ZkrY9pTrXhacyOUzXeojM0lFCyaitJIunLTd6U1rNXP3jdk6V4T
	CoxQ==
X-Gm-Message-State: AOUpUlGTZQX0XhyuukcNoQI2HvqTS1+qzEjqclbX0io8jIkM8PH3X6eO
	nGisd4iXzipxHcZMC7f6GhcUAA==
X-Received: by 2002:a62:41d6:: with SMTP id
	g83-v6mr18334005pfd.219.1531754868140; 
	Mon, 16 Jul 2018 08:27:48 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm19095698pfk.125.2018.07.16.08.27.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 08:27:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180713141636.18665-1-peter.maydell@linaro.org>
	<20180713141636.18665-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bb637742-827f-1189-5da8-1fc6ee2b9c23@linaro.org>
Date: Mon, 16 Jul 2018 08:27:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180713141636.18665-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 1/2] accel/tcg: Use
 correct test when looking in victim TLB for code
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5bi40YNceMH

On 07/13/2018 07:16 AM, Peter Maydell wrote:
> @@ -967,7 +967,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>      index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
>      mmu_idx = cpu_mmu_index(env, true);
>      if (unlikely(!tlb_hit(env->tlb_table[mmu_idx][index].addr_code, addr))) {
> -        if (!VICTIM_TLB_HIT(addr_read, addr)) {
> +        if (!VICTIM_TLB_HIT(addr_code, addr)) {

Oh geez.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
