Received: by 10.25.221.202 with SMTP id w71csp1311252lfi;
        Fri, 11 Aug 2017 12:46:40 -0700 (PDT)
X-Received: by 10.237.62.156 with SMTP id n28mr24111229qtf.203.1502480800118;
        Fri, 11 Aug 2017 12:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502480800; cv=none;
        d=google.com; s=arc-20160816;
        b=ZF5cWVwS+TPo8VMntcrtIfoTqeG9NvZ2fuee5W2NX6OBMMXJEPQL0jio4liYTFfX6z
         k3F3qlkWDqQZkXvAds+mO78NKFa56tdEAGZgjNvw1BP7yNrKQnkPaAfJrQNK6jdMBGlo
         RXkV0c68U76WPiWPDhR9zaJWFGe5gx5vg16uejqVEyOcrX5nuwjdNo+MeliZnxQoyioH
         Tyz6sS7XrHFZ2Un/B45OY4DEUnD4/8Gyu4Fpd0G1XK3+0cx5FzhjwzczvZcnL8pDt3Fk
         R1VfOgDn75xR14Y+yiKCruQ/mCbI+ENMjT6VIHn72snwlzBtJcBk/pGTdJCFnGTp72z/
         f6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=BvANXtcJkApSraEtTi3qeWL0bnCZRoD0WaYP2GNhkw4=;
        b=D/zERJvcUjge65C1v7aVqgJ2fGgIp222iHNtnCRK8G8ASNW/bkeCSDMOxTcAnXQhmC
         s6nH6G4S9na+EgPAaZj7gkQx/5Kh2GxSnF+ngO3c7qengIC+ilGCItrwJeNmhxsUCQp/
         HHi1L4FkZo4XH/NjiS5JXij7fXqPfHv55va4lP458hFgglBzrcrVdAhDC30W9UMuHxRw
         KV0Bx+HflxWtSRRavGntxAlHUh2fgW1/K/R+8dVJOb800/CZXBxy+cu0JvHtHPZdyhAr
         AXzX6VzBtk480d6MUDs7BdBeXGdYrFaPNI9Mi+o5FdjlE4e+OOtDCYiYu5yZ5yHCwbbc
         CjXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L2D543jE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g44si1446785qtk.133.2017.08.11.12.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 12:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L2D543jE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgFtF-00052Z-JY
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 15:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgFtB-00051z-MM
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 15:46:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgFt7-0004jw-P2
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 15:46:33 -0400
Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233]:35887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgFt7-0004jJ-E8
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 15:46:29 -0400
Received: by mail-pg0-x233.google.com with SMTP id v77so19148398pgb.3
	for <qemu-arm@nongnu.org>; Fri, 11 Aug 2017 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BvANXtcJkApSraEtTi3qeWL0bnCZRoD0WaYP2GNhkw4=;
	b=L2D543jE1QAYLN92NknTNrtUmd7tPOlK4SBc67vR3Ww6mLdhlJg4FhDSotKQr/+PXD
	5+id0Wa59Xyg9LH4h71psbHsE1fYEecwwikCUzfzm10tmHlppVugIWRpRXTnykvCUScF
	mMQKpKluj1Elxd/+ra2sUuVrcdAJ4OvHKJD5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BvANXtcJkApSraEtTi3qeWL0bnCZRoD0WaYP2GNhkw4=;
	b=SfLBX9FwlYf0YyL2Kei+wc/9Om+OfWhHqnbS4hXsHC3DmIIWCMbp4zU/pzyEur3CTr
	GjBDWe6XHr2lbzk5I1SdDEYkgRzOJk8941KriAu1C9vxNiNl/5Yn8DWHt813WpFWlEuU
	9MRIY909a0/9SQSWuDUsKITc5tK1gM8zLcAHQlU1enY3SpumIOAivUzheSqzrbRcDA9k
	PwnfNs2yAd5ZNI0QkF9mjgC+beAERI0TPSSc4JX236NARU7wqxlNpzjvrra++qyuQ/g+
	43rqf69lM9Lzchkdr/EUTZivi5wxmM1CwYZe0+UvsL/G5ORcLg2oBhtYRQ5vkZM5XpUU
	JShQ==
X-Gm-Message-State: AHYfb5jgvLwtF6DDslwGDuJBDU8lovPo8CxhQQFT0Q8CFBXWDlG+kgT6
	zBy9ZDtV+nl/g344
X-Received: by 10.99.95.200 with SMTP id t191mr15997426pgb.237.1502480788257; 
	Fri, 11 Aug 2017 12:46:28 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id q3sm3992672pfl.89.2017.08.11.12.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 12:46:27 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	peter.maydell@linaro.org
References: <cover.1502474835.git.alistair.francis@xilinx.com>
	<2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de3609ba-241a-6df8-b5c3-30eb4535735e@linaro.org>
Date: Fri, 11 Aug 2017 12:46:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <2fbcf76e4ff63d8527edd3662342948276e2cd37.1502474835.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::233
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v1 3/3] target/arm: Correct
 exclusive store return value
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RPc3T7ikbnYA

On 08/11/2017 11:19 AM, Alistair Francis wrote:
> The exclusive store operation should return 0 if the operation updates
> memory and 1 if it doesn't. This means that storing tmp in the rd
> register is incorrect.

I'm confused as to what you believe is wrong.

>              tcg_gen_atomic_cmpxchg_i64(tmp, addr, val, tmp,
>                                         get_mem_index(s),
> -                                       size | MO_ALIGN | s->be_data);
> -            tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, val);

Yes, we load the result of the cmpxchg into tmp, but then we immediately
overwrite tmp with 0/1 depending on whether the operation succeeded.

> 
> This patch updates the succesful opertion to store 0 into the rd
> register instead of tmp. It also adds a branch to fail if the memory
> isn't updated.

Since we use setcond, a branch is not required.

> +            tcg_gen_ext_i64(val, val, memop);

What is this addition intended to accomplish?  Because of the position within
the code, you know that memop contains MO_64, so that this is a no-op.


r~
