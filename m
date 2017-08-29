Received: by 10.223.188.70 with SMTP id a6csp6173087wrh;
        Tue, 29 Aug 2017 09:10:04 -0700 (PDT)
X-Received: by 10.55.157.212 with SMTP id g203mr6101599qke.347.1504023004798;
        Tue, 29 Aug 2017 09:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023004; cv=none;
        d=google.com; s=arc-20160816;
        b=KMEbNJEle2rYhtOLw74o+wDx1Z0c3uABAyC4NcaCtQfcrdBMABuDTT9CT7rr8MXqyv
         5lmwYVpfrSBJkbU0gJ3SA4QlYzd4iPkJqkBPk9FkwTaDg3/L6YBRe565n5ud2yzFQ70l
         tAkR6134PafEhlJKXyiFseIaJMvYaABbvrntlM0f8GfNZU/J/KRR6G7sqPP6h2vscw0Q
         10tUch0Z6eBP9fzOuMg4PQMg8atQWw5tcQ3Ou+UItWtFDx2/F6SPWQmp5yg5DT7kg0Ls
         Mxj8v+I7L6CJxtjMjYMnHpOX823MNf4qhlybJfLHwcdqQFsMpTECzZa3+GcQUoKkWszf
         q/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=3O5WB6Sbl085S5/uhB7w/vp+BUovSXHq/kTXFlAnPjM=;
        b=kYfY4ggymY64AGY/C/yB/7k9IYmhj6czJ/nxomlMnpjyyMbeyAZKTDE/HMgAJX+aER
         jM2Akn199vc9rBImutlMMil0acjmCCJ8mSfwJzAwDolvioqbeP+pnyrk3im0V2leA+r3
         HAhPQ1zjXTFypBCc+JV6vjizgEK/pN+obm/prBgwI8mLuxxiuQ2wUqdYd6P+CeahHwey
         b+9LXJcXUqL9hLIdiQKjIKc3S123IYYwFGPWFNaH82ngJJmlBTF2zk5VUviA4HsTWQ+n
         5pLiFpP8B2KETQTpQHWANctsUb3Xt7gIOqotUmg57csL13ttZxsUJ/Ua3keY+IteT8pc
         Ppnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GM78ayJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o45si3233909qta.416.2017.08.29.09.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GM78ayJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj5W-0003IU-5l
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:10:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj4M-0002Sq-QN
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj4M-0004JO-1B
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:08:50 -0400
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:33324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj4L-0004J0-RY
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:08:49 -0400
Received: by mail-pg0-x22e.google.com with SMTP id t3so12141564pgt.0
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3O5WB6Sbl085S5/uhB7w/vp+BUovSXHq/kTXFlAnPjM=;
	b=GM78ayJ3GRZqF/ddXzm+MPg3tUUtcHedGgpukvWakPi8Tn/oBlahRZTuMAgzusfk3J
	B0PE7HoUed5vm73THtFzmHxXvLp1BTTQQZCwQcEUxLsG1V3brOurfn9tECHZ+fvw+Jzf
	J7/kLCtppy9jM+Gs0ynlLGDFgxOZ8duKOzmoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3O5WB6Sbl085S5/uhB7w/vp+BUovSXHq/kTXFlAnPjM=;
	b=qcEEm4d7b8Xn1Rk+woIYRgVO175w21AsNGrttt3Ztn1lG382lugwUt0My7pIDUljdn
	N8JIqTtkGujbtEV5FhnfoAfYY6nd0HF0OMHaNORjCRSh3cQNQahzf7Bcwdg3CnjYtmLg
	wK4eZDQm1Mb9HIUH5tQcUIQnZHojTqGyZUm1D7UBmFe4li5W8ALlAIUEuE3Jy6jOzFPJ
	QQcF6JRikTPf52Mr6yvPo6J7LMpnzUVi/XcoGpu4PLVHisgvwfvEAaEt1K6IKQ6rswCg
	dM3JLYyHjhSvjli8FftAaGHUrTs7KLEXxdKyzz1G7ckl3ZqmKAJSc1NJFDdPwD2qxXon
	tjGQ==
X-Gm-Message-State: AHYfb5jh1Q3Dz1f98dhHTFjywl49wg72IEgXhriWhIrcvbR71vXPLxLi
	jVbwj73tr/xT6YDB
X-Received: by 10.98.35.89 with SMTP id j86mr862770pfj.232.1504022928993;
	Tue, 29 Aug 2017 09:08:48 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	c9sm5595941pfe.155.2017.08.29.09.08.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:08:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-17-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93e924b9-e8db-124b-8a17-a16f6abf5e0a@linaro.org>
Date: Tue, 29 Aug 2017 09:08:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-17-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 16/20] target/arm: Make CCR
 register banked for v8M
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
X-TUID: VxLrqJlJTJAN

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> +        if (attrs.secure) {
> +            /* the BFHFNMIGN bit is not banked; keep that in the NS copy */
> +            int new_bfhnmign = !!(value & R_V7M_CCR_BFHFNMIGN_MASK);
> +
> +            cpu->env.v7m.ccr[M_REG_NS] = deposit32(cpu->env.v7m.ccr[M_REG_NS],
> +                                                    R_V7M_CCR_BFHFNMIGN_SHIFT,
> +                                                    R_V7M_CCR_BFHFNMIGN_LENGTH,
> +                                                    new_bfhnmign);
> +            value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
> +        }

No need to extract and then redeposit, just use the mask.

    cpu->env.v7m.ccr[M_REG_NS] =
      (cpu->env.v7m.ccr[M_REG_NS] & ~R_V7M_CCR_BFHFNMIGN_MASK)
      | (value & R_V7M_CCR_BFHFNMIGN_MASK);


r~
