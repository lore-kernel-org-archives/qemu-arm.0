Received: by 10.28.71.27 with SMTP id u27csp5296563wma;
        Tue, 27 Feb 2018 13:45:16 -0800 (PST)
X-Google-Smtp-Source: AG47ELtY4aDHzuZ6QlsNvNckbrMqZHXdoav76rb8Zw241FK+0xqJGzHaz2V7E7M8d3/9DYbvMhO4
X-Received: by 10.129.122.85 with SMTP id v82mr241818ywc.400.1519767916676;
        Tue, 27 Feb 2018 13:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519767916; cv=none;
        d=google.com; s=arc-20160816;
        b=PEVsFm8io2YQv1dU2l9dnEkHUlCdkHgzx2dg7b9uA9ACWl3FdlEr1XiqUiLQEk/8yh
         nuvVdM+PjfYMxQ+qFUn5U7IEnbLaA3Z1N9AN314iZJrq3J+oYkiVZAc3I6WD2sTbv6Yi
         dI81uPKOBtBmNNcm8gUrRbU/6KAUA4OssA/gIuhPhSw/91WUH2Gx41271oIIHRT0T0GO
         roRaBtoy34EUbfCWFPYGYppnG9dRTyPsOkPP+EXAj9Wy3nqukmUiXLy9XU0NKA0pl1HU
         /Uf0fbem8DehmCy6U0zSC6by0YI6V0WHQbTaS4fRIzXWvn3TDrq41hCgCgapoZiR5iCD
         T3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=uoXieqkSYhhTpy3KjMe+Z+f6hNSGou4YB2KTDW4wHiY=;
        b=LiZ7tu9yp3WbkoDVYowRQzi5EOWfrRG0SJpBGiLI5oNychQZJv7BKPWcdK8cC4fRlq
         3m7deLTE7SNYAlaaHCILH8Y1z28FFmfnvX9u7luuwN2UiWQX4NONLwvkUIqn49XCseg6
         nWtgLoS1CxnIQOPE9UiRYIVSQUSb1REnjxTcQvGs0v2jU6SGRztYs35zNDPuxWvDjF9H
         Ry/PnPqjNVq57PEoAoi7CW45tyr+E0qeBgKW+j+JoyYyMbMgkXznGlgoz4y1lOiDe2X3
         4LXeUjBPFbNbQNLOIw5kXJHkfjAZxn2uv+7PkJtKhGbR1TOegqYSPhZN10OechuTiD2q
         aohA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T3aShPnC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d74si19267ywe.691.2018.02.27.13.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 13:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T3aShPnC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqn3k-00038x-4Q
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 16:45:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqn3a-00038E-G9
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:45:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqn3X-0008Dp-BP
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:45:06 -0500
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:38889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqn3X-0008DL-4v
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:45:03 -0500
Received: by mail-pg0-x22f.google.com with SMTP id l24so125773pgc.5
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 13:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uoXieqkSYhhTpy3KjMe+Z+f6hNSGou4YB2KTDW4wHiY=;
	b=T3aShPnCaaRZN07DynQ5M+59Dp6AfIjgCeKlPLVDmuCwzAOKnm1HbAMMbiOwWwvdeu
	ehtUSOSBIFiHK7/LsIxJB+16stVDclf83dTUBOAzLwTWa25rIU8FdbmSAF2B1JFyxeyP
	vf3jTJSU6mnb9mLsFroTS4N9B4F0itLolgUjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uoXieqkSYhhTpy3KjMe+Z+f6hNSGou4YB2KTDW4wHiY=;
	b=kp8xqy62acG06cTzpKiyXwGsKzDOZlbZVPLawiE9EJhP2PgBCJMPsqD1rXrsG9fEZX
	p6ZNF45FWnzl/KWW98llKYJ5V/Mp3XPlFf5yjV3Yom3kA5iDKQAQLdcarQOvS9NyTAuH
	L3QZ4abGlvNmzupQNKEkdXpDmNai/pPXgBNiwjJ4KVmUcu9FzFoB2Lf2bGq1wnUSTcZ1
	Izqx4E+nr1GK9ys7mHI4H3CDxRq98Nfvumh8WODCDVNj74XxxXya/zQsCRR+D75bChLM
	wL5wfrwbY6oCAeuZBkhOhl+OccwFErrZoW1t15R37xQzuHuzdFFCUuigQ0JsgUyiCUwi
	+9nw==
X-Gm-Message-State: APf1xPBTq7qXUuc2EqnByr2QlZLj+CWxC/bm4LihF9iRN+1GdPq6Vhb5
	KK6qPAEdZzrmuw6BMN2XvC8Ixw==
X-Received: by 10.98.200.80 with SMTP id z77mr15129653pff.85.1519767902120;
	Tue, 27 Feb 2018 13:45:02 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id 5sm125317pfh.133.2018.02.27.13.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 13:45:01 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b95391b-2ef8-b664-5d23-15db04841e6b@linaro.org>
Date: Tue, 27 Feb 2018 13:44:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/19] hw/misc/iotkit-secctl:
 Arm IoT Kit security controller initial skeleton
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
X-TUID: 0jzO0XQhB615

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> +        r >>= 8 * (addr & 3);
> +        r &= (1 << (size * 8)) - 1;

extract32(r, (addr & 3) * 8, size * 8) ?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

