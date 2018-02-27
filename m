Received: by 10.28.71.27 with SMTP id u27csp5308420wma;
        Tue, 27 Feb 2018 14:00:49 -0800 (PST)
X-Google-Smtp-Source: AG47ELs6mB8TFhKJWN1GryLHX/DTeTw5mIk6WZjYUpeBj7PUyt5cHW3sM9olML7D9bMRp7Qvu2yF
X-Received: by 2002:a25:596:: with SMTP id 144-v6mr859738ybf.119.1519768849849;
        Tue, 27 Feb 2018 14:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519768849; cv=none;
        d=google.com; s=arc-20160816;
        b=irG+PmKFf9scZUTDtjgQ3c5hLHdpmhcB+0YjM/CRNjJITp7NHZ15t5cIbpj5tKPp0P
         Mvd9J+RAzjUqM3dOQe5CQVvx+Drl7ch1P7S/zfPLj9Uh6QSjskuctv2dYhJzPi99qBt3
         Yp/Nsv+L1pOKHlCsmiy6L9PuzVnlHVk5IaHSdF2UtG33oy4WY5hvBrb7qXiDs3ajQCUi
         Sdp1/35fATJASaGQtHMiAuSi45bX0wgN/+OmDBXk3ro8sqWYimxEgKUzbidRUjM/fusQ
         ScsYY2CA6iAFK3u2WxerncFq5aVVFf/eO7V6GIX6b1mcg9MIaQFd1SwBeOJiofLuZyGZ
         ywog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=piLnNVnMwBskVh194UBFAUHj6va+lJ/h8VDGO+K797c=;
        b=uZSA01vd1fa4be9AWtYmB9Qx+33rADw2Jqlf9HJ9Fo4dvD6UE90KhtpIKFib6JVwul
         dgddkRSYQ9frAdnWBLyVeMSzGlWk07STkos+T0bfjQSJwg5/Tk5KQUIAfIDWQ8XayOot
         gFFARmlvWcGadlB6tCVksa6JhLRkjJn9RJgqe2dkGxCgn4g0LN9eNdLMAawOV+Lx2IGf
         69KZmSfpS7LoYCajx3DsNz5QRlJ8/yjYqSnwBSaWK7Yrj1IMSkBV6E0LfUbgx6H1QJAg
         CGrHdRUCkrhcABdWekPLx4UQ1auQVwBDYLxrdh5SAQ77OFGnAZd67pQqpDr7SK6fuEhV
         7XTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HF3fESZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si25894ywb.448.2018.02.27.14.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 14:00:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HF3fESZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqnIn-0000A9-Bt
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 17:00:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqnIf-00009o-K4
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqnIc-0006GS-Kc
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:00:41 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:33736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqnIc-0006Fg-Dt
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:00:38 -0500
Received: by mail-pf0-x233.google.com with SMTP id q13so149494pff.0
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 14:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=piLnNVnMwBskVh194UBFAUHj6va+lJ/h8VDGO+K797c=;
	b=HF3fESZt5RHXU5q+0+3ifziqXjQLEptuu5U8PSa+iQNYaBpOBjtCbKJsNNiiXygVxm
	1LBrw2+oTPv5z6+ySGALtu5ki0JROPt2vc7UAb6uGga/EWZu8C5B3gwdmemSHezVPwDm
	oX735leO7ZtSfZii0o9YH8Omjj7HDjckJ4YRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=piLnNVnMwBskVh194UBFAUHj6va+lJ/h8VDGO+K797c=;
	b=BXdavVCRwjF3PMfccuhUnyUkqyVyaC0cdEA/XpbYO653atQelHXuGFe9sgFTdGORja
	d48SWw7QaPvmQfNef35j2hu7tG3uM561Uhldm4vuy2jviFBcsDdPD3PWmiTXADMRG4Sm
	59YJul7p1pwHB7jc/SUo2MTBvCxq+ijwNDbUiTb+r++26htijHIsliVJkd1TkyTqu4dW
	pxZPTAuggkopENhtmPgHk5FZP8vewR2iTChSsNg7WEeE2yX+zwlsFw3RMb+ZM4ShaPX8
	agAxao2oa/x3fgEcVM1LD7J2H4Dat61k6+uAmJKyv8Lc0f2fYeHhKV9hu+jwea7BLxLW
	toSg==
X-Gm-Message-State: APf1xPAh4jJaflrLnK8zngXBTYu7IX/TCKhY6q0CoaK+OB6dGrCVKgE2
	lPXGZYZgVoxJZV6Y2N+66XEwwA==
X-Received: by 10.98.131.4 with SMTP id h4mr5734467pfe.156.1519768837221;
	Tue, 27 Feb 2018 14:00:37 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id q87sm175341pfa.29.2018.02.27.14.00.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 14:00:36 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98d79ce8-3ab0-3c3e-f4ef-9ad381015daf@linaro.org>
Date: Tue, 27 Feb 2018 14:00:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/19] hw/misc/iotkit-secctl:
 Add remaining simple registers
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
X-TUID: pO1Wlc3j0CRY

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> +    case A_BRGINTEN:
> +        s->brginten = value & 0xffff;
> +        break;

Looks to me like bits 0-15 are read-only 0x0000,
so, that 0xffff should be 0xffff0000.


r~
