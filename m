Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1486582ivh;
        Tue, 3 Jul 2018 11:21:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpehdBrPvP2k30QcUlBKP34/Ut5vM3aVi+2jBLuL8uQpSOrSGm18rHCCnd9YJ6a7DumPxGBy
X-Received: by 2002:a37:b281:: with SMTP id b123-v6mr25542129qkf.377.1530642116971;
        Tue, 03 Jul 2018 11:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530642116; cv=none;
        d=google.com; s=arc-20160816;
        b=ab+GNF66lEx9pcW2tsezU1C9uj6sQ/UgpnDmd32/sPWnXP8K078yxQT+DwTpML0drw
         ScgjY13Y4genw/ayxEMKZT8MkmMOqOUxiHuvDB5us+JpTWLwXTP0vwogcDQEqRQ5Zy3u
         C6ERVcjx2HTttsiU9Oh6VtHNq7VPKUzTZEnpxyLNSamtpBczzWXbqbhqsL7B0S3qnmUS
         rZ6WsMa9B5H057ENnw4xobVVZMVIgHUZxm1biZmdUMmUdhf/3CGVnE5bOMfA2dpU/ppQ
         zkljX2AL3FlNsdcONFhLAyJulhy07zwJN4iWmXOqhD09mUcd28wne74EzxGHZWSy61MN
         S9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=MU5qVOMZDYB4E/fLEggEvcAXPkIn+ExP6X1TkJzo2jM=;
        b=E4gyVGoViZqcrOIiDYJuNGpCryZqnhF8OB6LBnq0yaAlDbQ+SuddM0KPhU9Rn7uAjD
         IdEQ992vSSUYum/vL2JfS9L612iGRcXfs10XyHx6ex5hpP2aQACGYwKIGJzAZsCJGBq9
         veh5qsWx/0TFd2aN1+3i9JRxYzgpicm3FmLmTrG1NOzc0smGGPfvG0Civ/0ZPyuxU8vU
         IpAg2HBwGCKs1ChclEDyVrXrUJSkLybNdZHsFbrrhJOrDZvuXAXxD0LQ8yVItq3VQlR6
         xBW9Y+6N4Mz2mOLDGXm+QqhG90JrroiPgcO8XIwxqw/SLTedhgpTTd8mqMHJyQjT283L
         r6dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KVY9x8Sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10-v6si1837493qkx.258.2018.07.03.11.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 11:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KVY9x8Sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faPvi-00029Q-1L
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 14:21:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1faPvW-00028O-FJ
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1faPvT-0005Ig-8a
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:21:22 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:40691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1faPvT-0005H5-0o
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 14:21:19 -0400
Received: by mail-pl0-x244.google.com with SMTP id t6-v6so1416132plo.7
	for <qemu-arm@nongnu.org>; Tue, 03 Jul 2018 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MU5qVOMZDYB4E/fLEggEvcAXPkIn+ExP6X1TkJzo2jM=;
	b=KVY9x8SjIa5HRkFoSjogMGOxuInIenl0XvdDuHEZYW0UQbxoRnewr0g9PNjCk1YlBP
	g0vtiSUGbIHpk+0bkedex/SPl/nbTq0tK6xrmYqDeJfEgMKHnMjVMkaLegEXxFhyugFa
	a3m9XPoXXyQG+INfx2uEEGtEFJWpTCICrswIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MU5qVOMZDYB4E/fLEggEvcAXPkIn+ExP6X1TkJzo2jM=;
	b=N25vECcPbqVPw2e10eD5I0KEGD4bs3abLS0bZN4a/dwwZJmAyz7kSETFgYjoZNxnCt
	4tYm61s1+t4n2uB8LKgZ/wc4I6HvFYM5rfDZdkacpM4WhF5JwJq3Dik0YbcupdYeDLMc
	39Pt3/wTk3l82NdUZg8my35cm3Y7CETKyZaPoecHs5i11oqkwD4GSIdNtkBdDZ7j3Cex
	+RMe5nyrDvOaCuGKUBM/SsaIg+TvNfKala2QmWp9SUVY1vPz04ZEgES2GYBgimx8q9Uf
	d4YjJBI6TefedOIlHGPpmB43VXf6H/nZLeIlZY1vFaCN1Mt7c62z1zM4EfGLAcqASA7/
	Ou7Q==
X-Gm-Message-State: APt69E1scvlRdUuF3qX5pcm4NKhgQhMkMhc0/AhCGh26IwBTEXM4oTNn
	Mb/zBrHvPxTngP6fx2uPoVbMvA==
X-Received: by 2002:a17:902:d716:: with SMTP id
	w22-v6mr30963946ply.98.1530642077946; 
	Tue, 03 Jul 2018 11:21:17 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	e24-v6sm3057076pfi.70.2018.07.03.11.21.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 11:21:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180703171044.9503-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <823c2db8-22f1-a7be-1684-a2c012286b25@linaro.org>
Date: Tue, 3 Jul 2018 11:20:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180703171044.9503-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 0/4] cmsdk-apb-timer:
 various bugfixes
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
Cc: Guenter Roeck <linux@roeck-us.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pc++K+LVN6QU

On 07/03/2018 10:10 AM, Peter Maydell wrote:
> Guenter Roeck (1):
>   hw/timer/cmsdk-apb-timer: Correctly identify and set one-shot mode
> 
> Peter Maydell (3):
>   ptimer: Add TRIGGER_ONLY_ON_DECREMENT policy option
>   hw/timer/cmsdk-apb-timer: Correct ptimer policy settings
>   hw/timer/cmsdk-apb-timer: run or stop timer on writes to RELOAD and
>     VALUE

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
