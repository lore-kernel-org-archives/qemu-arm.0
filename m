Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1444810wrd;
        Thu, 23 Aug 2018 10:57:05 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbMtq/J6NiChq7Wf202w8mjue2hJfYvxV3JnvASXqzZCjq4DiOSHX0Ur78jlCniMkvl6e3n
X-Received: by 2002:a37:a456:: with SMTP id n83-v6mr2858019qke.160.1535047025372;
        Thu, 23 Aug 2018 10:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535047025; cv=none;
        d=google.com; s=arc-20160816;
        b=FTqM7QAP5oI5RhwW8jyIkdaL8E+6ZyscqmBnlt9HffZgDb6YyZeIXhx5pUFVDdeS9f
         u8urp5pbe3BshekXT29A+Im9cp236uNbH5xrGtHvcVoyW56QscjHQYoMeq3HYSAuYbOB
         IpAqNFiOH0oxNLqQoZfRYBLxVs0hWZplJUIq/PMUsMpe7KK5IUdI11iy+X4VZl6R9Hd0
         75ZrPeIx9kX70lzKRlMlkNmBi5S1LOl0T/3q5sxug5aiku+xd4XqIA7uhke5oHi2CrG7
         tF3kDYyncg4L0obqMB1dKMisz+Ps9J9NVAT8e8ckKTHQMb92AIQRzbxBJODmwlPBKZpd
         DICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=BDjUM9+wA89ptQCESBkDnIk4JfU4QCrzQFF/gAtVaRY=;
        b=Df+nYUXPvsKzVIEnCcyu/QNJU5ZT5qwNORdLs3tc0RQrXfVhdD4VGuCvP2G+UKe/QF
         XrkRL306IYmXCDcAWUJRzZlZy9Z1hztMMYpPTD/nT5faOqJ0JNUTZf3fr3WScvR/BYpn
         vCphY8fOFRP+dnwmlAMdcPdKF5ejK293X4Tf5DtDHpWsRVhg8cn+XxJR2M19YZ8/ShyC
         XxsbbPKX8Jwp5KE4q19MkY/RPbB62wbqHx1jZYC9r9G3LzIMBm00Y0QHDf9mvoejIVfX
         u59dE+4Cj0/yb00OSSuYcW9HLA+qnkaYLZpsUyOpgCoii+cSkVZPpp4+cmmIdkmVWkJn
         s7eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkUudqU2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5-v6si5064524qkf.160.2018.08.23.10.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GkUudqU2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstqy-0000nq-U9
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:57:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstct-0001pO-Iv
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:42:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstco-0003jb-Fe
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:42:31 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstco-0003jF-8Z
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:42:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d4-v6so3163210pfn.0
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BDjUM9+wA89ptQCESBkDnIk4JfU4QCrzQFF/gAtVaRY=;
	b=GkUudqU2ARphHvglpaGYll2agcLl7VeegP36JTMDqfl95zvfQCOmilW8BPlGdr9JES
	b31DpW5eCTvExw00CD1pe866iD4DFAbVlAl++BWmzega1fsoptS66ZriVccSzcoQVU45
	LRooAX559I87oahxV0UtAKQEG+ghrmY/hZ05c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BDjUM9+wA89ptQCESBkDnIk4JfU4QCrzQFF/gAtVaRY=;
	b=LQpdlp/qPPxbmiXzirmlouvcN0fxgQ3/EyeyePCir1k2lE+6UrqinbOVuxX0P4KcaB
	ea8m3gGdf0Kx0af1rXo9UO8TrLJlVEBNDqqkiRS/Favd3CG8tK7rGKras8BXDkxaV4mY
	0xDtuPi9wWy3sNxzPZ+Cr6/t2wegiiQvGXTExUJZOqSycwP99ni1D85GYwjeIICMrJbc
	j5hr2tufjO6VOwlqRzLAXDGAB7NffXDLdIGjpDaGs1c35s9QFJ4dYQs0ckHSovvOoBrE
	ZWYBCJRn2qWrzmOEuYdfFKjtJ3I+ow8hC+psM5jsUO4pos2L9JA/7UX3EkV+m1U4PP5A
	pfdA==
X-Gm-Message-State: AOUpUlGEHyJdJqGzAvTJDPmIug61wxmq/aNDCZYEdXhrHlIt6ICHX/yE
	hQxckm0H11u2W5kA/HxJChcrCXYtvbM=
X-Received: by 2002:a63:804a:: with SMTP id
	j71-v6mr15597145pgd.171.1535046145369; 
	Thu, 23 Aug 2018 10:42:25 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	e64-v6sm5305664pfk.87.2018.08.23.10.42.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:42:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <786e23f7-8492-477e-632b-10dc3ebd4576@linaro.org>
Date: Thu, 23 Aug 2018 10:42:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42d
Subject: Re: [Qemu-devel] [PATCH 22/22] hw/arm/mps2-tz: Fix MPS2 SCC config
 register values
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7yU8ExHfO70

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> +    mmc->scc_id = 0x41040000 | (0x505 << 4);

Is it any less clear to say 0x41045050?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

