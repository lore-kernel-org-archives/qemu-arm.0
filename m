Received: by 10.223.150.237 with SMTP id u100csp1053136wrb;
        Wed, 8 Nov 2017 01:27:11 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Rg4/JIPoV8oF6qipLFCl+2UT9iMQSWePDUJLtt3KOVo6l9fAJHYwbp6iEQFUFH5MsTmgUT
X-Received: by 10.129.48.5 with SMTP id w5mr934355yww.468.1510133231420;
        Wed, 08 Nov 2017 01:27:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510133231; cv=none;
        d=google.com; s=arc-20160816;
        b=Qd8ltVaHIHG9wF0gioUT15d7L2SBach0QeeMVed1NMbxRVTK7Oef5tr2CgkvN0gS95
         sCZSZhB7MN8HmnhQSQCawCyDCal7i9A9kL8fPd59spXQZlVJC963LkvSC76oOpYH+cs4
         r9E/Q71K7o0Ff+QGksFt+lbeR5mhKcK2V5XnYZ5cIuG7VpRahzp8wFa0KxBC0SwIn0Cm
         yq2dcOn8M57FaSVDszJuPg/dv8JyCGqh6G6cHFKmDzSsQxWcnXvLBsZ1Ff40Wv9sE2l3
         YhyZH2kFv1WQ4R/XNnOMqa0st0dQXJf+JgmVjKtGc9Dl3RtmJsUjTRzJRwdqvwpzDxmN
         1GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=J0ysV5RTu78otN9nQq2jVtd2jwo8n9UNpUGzmOjShtY=;
        b=Cfn7tSRzKMFfi/tf7Xz5RL4tzSWEN1F/2MvfXDJ/bO4RK6Jm0BXaQ6vycs5ZSQ8Q9/
         mFN6aecsMmjKiT1cowTxklQGvq3tgcT7WH5gI2w5NU0YzzqyNEfEw+vNEuwN8Ffssp70
         Z9QT8KenurAUXSaRiYXV1Ey/3jYMbq3fYYQcORk55NiQjV+4iYgB/vFPm7L55EbpOOtr
         1p6khjk93KcXYDdyyfseSLywHfZp+gGOl7JCjaJxz3wNaYLCUztRrXAGTGEVu3VL7fm+
         hTtr0cVhzSvdao5LoeWtTiQ/kcVh/XMMvyiwdlFvr4XKrCCw2WSP1NWgOYhYpCJTya03
         KZ5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHYhaR7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si841452ybj.154.2017.11.08.01.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 01:27:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HHYhaR7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCMda-0003j7-SA
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 04:27:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eCMdK-0003dj-HB
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 04:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eCMdF-0001Rj-LA
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 04:26:54 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:47185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eCMdF-0001QV-EU
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 04:26:49 -0500
Received: by mail-wm0-x22d.google.com with SMTP id r196so9007881wmf.2
	for <qemu-arm@nongnu.org>; Wed, 08 Nov 2017 01:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J0ysV5RTu78otN9nQq2jVtd2jwo8n9UNpUGzmOjShtY=;
	b=HHYhaR7yqxPdalZJV3BkVJaD7tpn8n2pkweCRmNQ7vvm+U7cXqg2zbDmY52XwcRHgB
	XfNhQfxyxt0cw545+SWIh3iWQg26diHg/hv42sfkco4JBd52AZamfqOezkxIsaPo3Hl9
	mElGAsGO0P9Ic+waYUmrdLGwfpp5Zu+TTXbOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J0ysV5RTu78otN9nQq2jVtd2jwo8n9UNpUGzmOjShtY=;
	b=Fn5Q9wlvYpz01OShVobGdP4SH/j4Q/+ls3fpeSdUhBpXRhTr8f4XjHnoRrpn85Qjw9
	AdWtZmXKxUASUTChm/uF7kZ8qaROV/Sizep22NDsMDOa3Sqt25JeTUPB6UE6UC4tezXy
	WihvGGiijzxnwNDCucjSiwXbSIwxuhWIrSjOeS2fC3QqCOLWlhEQEt9N8qiY62y3GxZl
	/WRw4VjpjnaYdZqFvLkZTupOYhBzK2JLt/N+c8Fc2dQyjT2Lp59q83nN6EDCTETzsUgP
	0h4GCv7d/e40UxGwjgqdvKVnVqqq6pXicTI5jQSxqEE9/aawihAz7tcmUNL50bBM9ojY
	wrJg==
X-Gm-Message-State: AJaThX5aYHPdLMoOKuXKDVGroZiLFcg5B7yauqn++IJr75V/iAF1mvsI
	8jMUdNS7p6LIeAr2iFlyDMCw1Q==
X-Received: by 10.80.212.8 with SMTP id t8mr2697505edh.89.1510133208235;
	Wed, 08 Nov 2017 01:26:48 -0800 (PST)
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it.
	[93.45.2.58]) by smtp.gmail.com with ESMTPSA id
	j59sm3086768edd.78.2017.11.08.01.26.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 01:26:47 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce4114ab-c17d-9797-5892-dc5e130fc0d6@linaro.org>
Date: Wed, 8 Nov 2017 10:26:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510066898-3725-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.11] target/arm: Report
 GICv3 sysregs present in ID registers if needed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YVbY5BHqnSKP

On 11/07/2017 04:01 PM, Peter Maydell wrote:
> The CPU ID registers ID_AA64PFR0_EL1, ID_PFR1_EL1 and ID_PFR1
> have a field for reporting presence of GICv3 system registers.
> We need to report this field correctly in order for Xen to
> work as a guest inside QEMU emulation. We mustn't incorrectly
> claim the sysregs exist when they don't, though, or Linux will
> crash.
> 
> Unfortunately the way we've designed the GICv3 emulation in QEMU
> puts the system registers as part of the GICv3 device, which
> may be created after the CPU proper has been realized. This
> means that we don't know at the point when we define the ID
> registers what the correct value is. Handle this by switching
> them to calling a function at runtime to read the value, where
> we can fill in the GIC field appropriately.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
