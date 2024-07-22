Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2167097njc;
        Mon, 22 Jul 2024 15:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8dVNRZ2svDLSD2MEL8127B+bmi7w5xnQxVGHdtw4J6apcAwMlyF3eOT9bthsXNgG1VmWE248Cmi7dqxx7XTY/2vDISDwE
X-Google-Smtp-Source: AGHT+IEZ3thooEQwiQNTkfCfNStH3BIF5WdjHxy3uVHMKt5v+2tgPG440bwzFPAOhusQfwGGGotN
X-Received: by 2002:a05:620a:3192:b0:79e:f9aa:8746 with SMTP id af79cd13be357-7a1a1352d09mr1226523685a.40.1721686504158;
        Mon, 22 Jul 2024 15:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721686504; cv=none;
        d=google.com; s=arc-20160816;
        b=agBy6faNO612PXOYvua9U2A2ok80erBHnqYLVBLXbIExkw2Gveifn+J9oqatm+sWbO
         4jCe/qg33eXTP3cEYuHWqd6+98mStwCyW9hcItxTAXLpaCXQAYgfq9CxULDDLqCMo4dS
         thqa3SEU78pSRL5uk9eubfrbzMIZJsYPPfYYwl/cBZ+t3OvyPC+HT5AogUZQS/4n9Q5p
         Ii/XUV9DjZsEprri3E8vSoDZxdWhbiaDi0aRLEJEF+NoyLAKkYt5TFOXMyhz+h7J9NCC
         wT7O8QEsjNre4GxzsgmXQ/XQ3OL0VvznBD36GAxcBCHs3Oq1HnCqWp67eE9Z5dH3eSjr
         Au4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9bm5ZHfIENt33oX18YmEAbA4/5twgdpC+ydOn+Iec70=;
        fh=zbSDDJkG2t00R+vWdTGAZe4RyEeRBdzzqw0/91dyP3g=;
        b=M8+sDR5G5j7wV/+fZpgumwfY3i3CxESOhdOY+HgLE/PMdnDZC46eA3o3E/VKgf76qG
         dctTKoqg6s7D9gq2p2WvVdMG1FabX1AmiPCH5Vni5NaREAC9Z9eHnRTj5jZSUYdk1UPc
         erIXR9nT5jmx4LaJtdfvXkLFLO4e3g17uBwYEWNUn1u07xhvJ4QcGP6PS64oE15v+Yf/
         SSNzKpG4Iw9oG9CeBbLU73kl59UI+0RJRaYq/q0hMSprUbYQ8ixdfXPrGiAN/t1IpzW1
         nbzi97KmFQRAbpITCibqUZxJBkLlx1veIHF2aMfm+BwwNAGGhBlYorsAO48hRgPRQdAi
         CdDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p3hCWuHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990b178fsi868077885a.713.2024.07.22.15.15.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 15:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p3hCWuHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW1J1-0002hw-86; Mon, 22 Jul 2024 18:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW1Ix-0002el-N1
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:14:51 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW1Iu-0001Oi-Hm
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:14:51 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70d1158d149so890644b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721686486; x=1722291286; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9bm5ZHfIENt33oX18YmEAbA4/5twgdpC+ydOn+Iec70=;
 b=p3hCWuHQ8UcA6KCdWeFsq3AUoRjrjvXLJC8lBXH44b3fck6WBE9bb8bjv6kvHbKKbz
 qBvAKIKuq6AB7G+0yEYAFeJ3iMF6A3En41w00ci/DVav1P4UsvpES1ae5yUdO/GC6iMV
 hpb9efMxlSwpPBGCDTwRCmo/KO6QyQegSDxAMiWj2kTA7kEkKGpB+sTK1XypQ7dKrGZE
 Zpm4QyXRkq5HFUYyGKAcqciW96MN5duEWVSakfevF1bIa1pysrYOkftnR+PWD/ZeOXm6
 G+WG24KVmth7We21WLzqE9IYvhZGWyMMwZhJ60pq79HTfGtXoHsbfSDQAVriVfTUEPzX
 5OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721686486; x=1722291286;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9bm5ZHfIENt33oX18YmEAbA4/5twgdpC+ydOn+Iec70=;
 b=r2jP5Dt+V4/6t0jT9ukIOBaXvY6IeQV7QHM2L0oFm4DgSOS4GmZBgimLTBzEzyEDEu
 k0njoQeM4jk5448CgvdtGD4ohdN91RBC4qcQheDoRMrI4IpFYUpNw5rdKxkNnWr4H7yJ
 VU0N+XLnqq5R6lfOJMEkkpediKM7t61hcuBKnoLpXp+rwIDnXk3ApbYnj1uhxC7w240I
 NeNuI3ryIXmAhBnLQlyzWpBzj4PN2S1Ukf4XPn9nWHAx0IHm3FNHHqristVs4qNkHXok
 Eu0PdoBfg+l74cxqOQ2BOqrpqf1QIqIY/gUuvG5ljDUBlkmQfe2mu7vSj9cqLUcii80f
 7zQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqQtP7hYQmxp08X+blFKyCHMdau+1dpWe9loMZUh9BPrqfNVmWUJb63uq/85Og71lbaDe+bnvtTjR9IiUrplVzYN5k
X-Gm-Message-State: AOJu0YypnDXayQPlmm3Kq3m09FyHvdPKlLA8JJpNyjJEayVOfrumnQ+L
 GZ2O5HOIDCHrRBeFBdE/4tRNQoHmcVLACdYkhBhvcQVPTFKT5qTQTLi+w3gfozw=
X-Received: by 2002:a05:6a20:2d23:b0:1c3:a63a:cefc with SMTP id
 adf61e73a8af0-1c42285f614mr7066636637.11.1721686486160; 
 Mon, 22 Jul 2024 15:14:46 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f31d2bbsm60096285ad.132.2024.07.22.15.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 15:14:45 -0700 (PDT)
Message-ID: <10a16394-ac70-4cf6-b72e-b39749d64871@linaro.org>
Date: Tue, 23 Jul 2024 08:14:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: Various minor SME bugfixes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240722172957.1041231-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722172957.1041231-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UU/LQRFKYVfF

On 7/23/24 03:29, Peter Maydell wrote:
> 
> Peter Maydell (4):
>    target/arm: Don't assert for 128-bit tile accesses when SVL is 128
>    target/arm: Fix UMOPA/UMOPS of 16-bit values
>    target/arm: Avoid shifts by -1 in tszimm_shr() and tszimm_shl()
>    target/arm: Ignore SMCR_EL2.LEN and SVCR_EL2.LEN if EL2 is not enabled

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
