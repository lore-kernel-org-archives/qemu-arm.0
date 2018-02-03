Received: by 10.28.71.27 with SMTP id u27csp901917wma;
        Sat, 3 Feb 2018 13:21:40 -0800 (PST)
X-Google-Smtp-Source: AH8x227rnLjAmOtHE8MaeFka+R5XiojAACr1u4jyrdyaBKYg5T0Lxh+TXPNUARFZ88TreBxMoQNy
X-Received: by 10.129.124.67 with SMTP id x64mr30653452ywc.418.1517692900162;
        Sat, 03 Feb 2018 13:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517692900; cv=none;
        d=google.com; s=arc-20160816;
        b=vUfypxMJ5SPzDLSHy1Etg596bvkOdlVQBLL6eHRToTNtwW2xsYBtTapyBgkSo/87Py
         gdkwZntHjeGWoAOl9lvR4V9QFZgcQG6TGbEibi0N8TBv03u/x/ChI6Ocz+Cm7utomrkT
         Jf1kZWxH9FhS9pi7BbVuUOP2TvgPFe0mZN26iXre1SGJxUaewHbXVG9mSCBnWtySoaIb
         F9XHbPaLdRS3t1coryzkm5EWu6UVe4MwUL8n6gVsI8PLnzk+hucnj+sNc5Tzu+uInkoH
         ZeSqBFgp1AOIotWevSf5lcHeBHCfBOQ42Ij4nIWR7E1/oIadWkJ/E4rxhvB8vrJwEZGW
         BA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=P7Yes/W7xDE/8UNbu9/aK3eCN+Am+eBpCsceKQSQAW0=;
        b=e4cmvdrFh3cJAqdzOPiefMyvnjXGRf4HcBq7aPS3nItUGpNeTjDynHF9GKNuRkDH/9
         DwftW8U4GQLtljphA0p16qWyizQ3xL5qjnl1gfONAiHkZkvxvgLbKou0/FqV2AqbRn4M
         VAdf+bIiQMwVhkgIJGgDh/Ozqur9Zr+i1+yNylEFACd9f0ck4qtLsqa1ur/8st3dZJ9j
         Hdj8nIGi5qPm0ofPNDqwjqutzCcWHt8xgJDYjtLzbks5ewJLxtX4pumRpmpIEtBW7Ky8
         6inLFZGBlD5g7LwWUoAtWYxPH2C+++Z+P6jci/d47sjf6hXuvnmH8vGFe9x1vrm+kpD6
         FQAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QibhGszx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l30si237551ywa.141.2018.02.03.13.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QibhGszx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5Fj-00038z-Lc
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:21:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5Fd-00038n-2p
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:21:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5FZ-0004Es-43
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:21:33 -0500
Received: from mail-pl0-x22f.google.com ([2607:f8b0:400e:c01::22f]:36852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei5FY-0004EO-S3
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:21:29 -0500
Received: by mail-pl0-x22f.google.com with SMTP id v3so8964336plg.3
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=P7Yes/W7xDE/8UNbu9/aK3eCN+Am+eBpCsceKQSQAW0=;
	b=QibhGszxnNJyvyGAOMxi0JHhVgJV+Tsb/85v+08b4kPAtokSSoWws+uFpIkiJsA5FD
	RFNFLRAOy99nq6Uyn/L8W+oYqrDuNeC1MZoY8df628h0xgppzIY9pMqf/qZAYBHauFwF
	i4rvF3P8HQ+vgc5fP/JpcoFS+KI3GLcFAhddQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=P7Yes/W7xDE/8UNbu9/aK3eCN+Am+eBpCsceKQSQAW0=;
	b=XqD/JkOIo4FWfArQ/cenj6ieEDMt6N5RW4oZYiEJX3NZ2GgZZjpXVnOjQNwZCkfp/S
	r042BDz900cxA0LYLh5NVzDvDMdis9fcej9NRJr+AufcLINDWXTG5B1R9a91PqaTufqJ
	T2WOGUV2SCfuixt52q2Rea5kjMFGiMmuciRcTPXT74bHDD69TIUwM7NpnO7t0YHIw+YD
	ZkPk/jPKprV2ZHUZsXZy5BsjQZee878UE+QKbEtOIcRx7Rfa36HaOM/DRCMmY9nXptKn
	2GhvVFlxmFiezji8RC5mNfgA0i5aOS+HU7a6uJQvKgwkwgFh2hRcLlBPFs/IfBjAedYX
	omUA==
X-Gm-Message-State: AKwxytcfMtcZLWxLg/rAApFbVrfnaGnL336GWP/P9qxTb4fL2vy9kwj/
	sp94G6xHB1iZVaQppuN3cVENwg==
X-Received: by 2002:a17:902:44a4:: with SMTP id
	l33-v6mr30328537pld.115.1517692887825; 
	Sat, 03 Feb 2018 13:21:27 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	e67sm9508549pfd.23.2018.02.03.13.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:21:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <675ab9e3-80ec-97fc-5c01-ce28b2d2d4d1@linaro.org>
Date: Sat, 3 Feb 2018 13:21:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] target/arm: Make v7M
 exception entry stack push check MPU
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0xayRUY3ghu

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
> +                      &attrs, &prot, &page_size, &fi, NULL)) {

Given that you know you're going to call this at least 8 times in a row,
probably with all operations on the same page, it is worth querying the qemu
tlb first, and when that fails but the lookup succeeds, installing the result
into the tlb?

I know we don't have a primitive for that within exec/cputlb.h, but perhaps we
should.  Perhaps a more generic form of probe_write...

That said, this isn't wrong so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
