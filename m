Received: by 10.28.91.67 with SMTP id p64csp1893996wmb;
        Thu, 1 Mar 2018 06:27:50 -0800 (PST)
X-Google-Smtp-Source: AG47ELsHTPA54y8Bv3qdkP9PvGUFngoIyrxfWYWD8WT8683Y/ZOSNP90S/2nk+8R7ieg7i7ygGgT
X-Received: by 10.129.146.206 with SMTP id j197mr1180085ywg.199.1519914470366;
        Thu, 01 Mar 2018 06:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519914470; cv=none;
        d=google.com; s=arc-20160816;
        b=wkiGp31hKoHcHwoVjOX1g6oT8ZTto+4Hojq2qbNeVa19kB99tldyPyMSx7KEa9x0OD
         UhCMGbsAWJFeMt4EqwYgpXZRnHBpXQAND4dc7wGK9l1nwhtSK2ukCC8XsDvkNMtJ5R33
         Gugyd6+fDQQmlFQNHjKOVDYDiwOXxTy8EVDnOklbbqOPzcZlDMeM8ecSlSpsuG/AHNMC
         WlQwlqfnR3TjRNTh5dyi9Jp4V3QW6F/a2jiCihDzD1odk4roohjc3Fuw5FI/sJGIv7AP
         eHBX42yOQaByCHj7jP/xE+P7zxUxpxNY4HZL7k3mYpFAJfnibqbJ24UflKYD6bTvb+6D
         H1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=g730AQkHA7N0+UuFOU1QONFlUqY5j+GVB7YJR9XeOcI=;
        b=voRR1Iv1sjo2o2qWzxtQAUswY5KlDu6WGZnlTC8As/vPKpcrW/+eaSLwVImjSOfmH/
         3vH5qhcyQ08p4hxUAdJRhlqpjPKfgaxlvd3vkveX0O8jMDHmWiyYBGLjk5QmVeural7f
         WM06+46qjoulvXP4Tl7gerwLBo+fqEpG7ixJFu+B2CvqWAL3m9oKko58EfGGMgLEsI0L
         EWQ9Z2zCEB4VSNkAhAn6hrDeKGlYtwcPOhkrR+3IcZHqhNvcFGRmEmQmf7ON2EsxH93d
         LkaukYHOHQeGiZkxBgJH3ObGSGt+uUntOXEPuH4ryvw9Zmrlg074Wtv3cUJZbIhudZCg
         0mCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cL6YvlZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m124-v6si662887ybb.725.2018.03.01.06.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 06:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cL6YvlZS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erPBV-0004pA-QP
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 09:27:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erPBN-0004on-IY
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:27:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erPBM-00078O-SR
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:27:41 -0500
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:41164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erPBM-00078F-MO
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:27:40 -0500
Received: by mail-oi0-x233.google.com with SMTP id g5so4572436oiy.8
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g730AQkHA7N0+UuFOU1QONFlUqY5j+GVB7YJR9XeOcI=;
	b=cL6YvlZSTMlaufB40GgdAUd5GAuhzhl9I+A/ljfidygBcOWhFmdeaWouz61fUQ/mZm
	Ba1jbfnA66KA4XoMXUsU9J1QZHt/QfzVuZQFMjgTv8mBr6d6GY7BLdNDNJpMgsm0PqGw
	czUesZq2U1hHHN1iqXLjaMusvpZqsxoGEjaW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g730AQkHA7N0+UuFOU1QONFlUqY5j+GVB7YJR9XeOcI=;
	b=DavOeoTaz4ocfkyEdkuG3X9Wq1BGEqq8d+n+j4XWg0q7GzqTB/HYlDQte9WWKsLMUi
	YAyUdorVNcKeHmonjwP06VA0Tn0eKDMf2+J9gTv6ROAa6eRjo6M87gv7D01u7GLkueau
	aC3qZN+es4ya8YYV/f++mxaCJ3qowyoXvm8vDWrhKdPufhjZeJMdqHdL+R2Pjv3h+HGJ
	I0tUDowwR7AC3wF3jXzQri/5SWq3gO7I0wvZ9/UE3Dpbq9siZAcfFlNkdUHr+sKrg07o
	4Uf20UrrS1I/XVU6rsez+i5eRcUJn3pu2lzD/Lbz1W103Ddyk2e5tbn2O/r87wvgJbs1
	kjtw==
X-Gm-Message-State: AElRT7HG64JDbK5BfhUgYeSfTjBW/L7UrVdwjFchMGBI1Wh87SgMLzQV
	gjw6nxjhVR63yomhelJfFDt5AXp2DTRfhuvwkuBjzA==
X-Received: by 10.202.216.67 with SMTP id p64mr1232433oig.337.1519914459940;
	Thu, 01 Mar 2018 06:27:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 06:27:19 -0800 (PST)
In-Reply-To: <CAFEAcA-pUMgUnR0cWd9j7n0EyTeXkMTzhPQU_fqhyaXy1hMfxw@mail.gmail.com>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-13-richard.henderson@linaro.org>
	<CAFEAcA-pUMgUnR0cWd9j7n0EyTeXkMTzhPQU_fqhyaXy1hMfxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 14:27:19 +0000
Message-ID: <CAFEAcA-+ZDFE6s7NYfkhcc8vxMD=R-3gt5gL1NPhr6gWX8pmoA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 12/16] target/arm: Decode
 aa64 armv8.3 fcmla
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: okUJx01pXIip

On 1 March 2018 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> Shouldn't there be a feature check on ARM_FEATURE_V8_FCMA somewhere
> in the three_reg_same_extra code path?

Oh, there is, because FCADD &c are also (feature bit name
notwithstanding) under that feature bit.


thanks
-- PMM
