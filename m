Received: by 10.223.172.38 with SMTP id v35csp1146206wrc;
        Wed, 20 Sep 2017 14:02:42 -0700 (PDT)
X-Received: by 10.200.24.117 with SMTP id n50mr65380qtk.6.1505941362400;
        Wed, 20 Sep 2017 14:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505941362; cv=none;
        d=google.com; s=arc-20160816;
        b=zCLyeBwJTX/qubzOmunm1uI0+YMf13U+s/EveTlGzkOCk4L3NnanHfVSEeAtRFeyoh
         +gQEnUIfE8qG8HNp6DaUB4A6TWV76SdqG11GA7SV0LuovvAf0tS4q7kfzn72556G/1pN
         BeCS4AeZuMEKUrGbxrh7jXxRBMDex35dvf5ZYfiIDYrd9WkCNA3NZuZaGq2MrGYX2EoA
         3LmZ7E7KDDgVvuNimz/YOrmmDlxuERy9MMisxMdegIXHhYVTYf9RZ4ln2QzNrXkySH4B
         Z6a+yE8gie9jVte45RrjWgbdzFZc9bSBcLCnSL1080JDNLjK0UErxI2cqDgPhdV+u2Nc
         G30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=1NHkwCLMdZGxxbNUGTQpUAtTo/lLdFdKFohHJNgtDFk=;
        b=MWMN6izFVtSlC3ExbLC/EOUd+6qvbOrwiNVXe7TPb1drzGD7rDFrV+a3vUj9pou+I9
         3DnOFasJPxR2LGYqW1Huc14C0cXG53BCf8/7Sx3n9tSY8tjDRw0HiW3f0OT8dMRt6liq
         v251IkyIkjOXxoVJg+Xhwwpc3ldUEPc9B0xjrTxvBUqvewLSiAB14amMq//M9wip+bgH
         CdzmGbgimXxOQyxmHTlaToWuHH1kxbCZATFCnl1lHO9VW0yyLB3fFboiziq8upTilCiy
         h7l6T0XUocQuWAm7UuqaetfATFwdB3hnGvd+pjCAWzG67EnA3v1cWSjTpVg+pB6YUAPb
         X1Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QZUnWD3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si2717759qtj.33.2017.09.20.14.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 14:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QZUnWD3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dum8m-0000hZ-5r
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 17:02:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum8e-0000hG-6M
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum8b-00017E-2h
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:02:32 -0400
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:45019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dum8a-00016z-Uj
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:02:29 -0400
Received: by mail-io0-x22a.google.com with SMTP id v36so6614837ioi.1
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1NHkwCLMdZGxxbNUGTQpUAtTo/lLdFdKFohHJNgtDFk=;
	b=QZUnWD3uTuI6s2KbfRiqerY2XZEdxLtUWBGgKdgAYkVwU2QLAxL+oxieCs+DR2Ku1y
	dlSkPEHxrSSRe1bzrNjmdFi2PGf6n+QiSnZ/w8GBmSl9doy+bmHJfw+Gv0UQgJM9g+v9
	m8jleujPr16g6QctUVxA7g3HrK3vO6VqSi59M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1NHkwCLMdZGxxbNUGTQpUAtTo/lLdFdKFohHJNgtDFk=;
	b=aoknPenX6bUUdOuC22wGPmcvNoWhMMlp38mSjj0w8Ii3vfgwYU2zlx2ml9EGNtCbdH
	euiPB//K+4EZ6c6LW+fJtDuwVjyJLXu9sd7Z7e3V8HkknfEslb9pZvfetmzU4elkc3ea
	rnnud7l3v96qDfRa31nkUPx/Ur9hNZPBVNMnCBMy0X4AHoI978GLdXETnMz8NW+J30wY
	13BfKLwddrk2M1FdGskZMMADuEcqeEfSqhVFi0mYadxrqJ9UBQU/sOtMEq+aL+6f7ZUW
	+Xy6mOC/TaqL6IfYFJ5ZRkoP9z6AGwejn2MzBlyPO1Rr+wP0vQw82xjnNNe5obu5soRL
	3Xfw==
X-Gm-Message-State: AHPjjUi/H5B/KmTzGVeXxZmBc3h/PO3QrpxtyV4eNBvKwD6QZWJyf6P8
	d3M/w6kc6Ppprknae/U8e6NI0w==
X-Google-Smtp-Source: AOwi7QDxF1fagY6w0mDLbzWwncACbZj2dMKfRkf/Wcs2C/UMhjCptFBG1ciVgV2XrD1Tlei7f5w/0A==
X-Received: by 10.202.218.69 with SMTP id r66mr24647oig.250.1505941347768;
	Wed, 20 Sep 2017 14:02:27 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	d135sm814979oig.29.2017.09.20.14.02.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 14:02:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
	<1505580378-9044-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9481c523-ff48-2c78-9e02-9feb9f2a5e90@linaro.org>
Date: Wed, 20 Sep 2017 16:02:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/6] hw/timer/omap_synctimer.c:
 Don't use old_mmio
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
X-TUID: rDmtReGQ2dFE

On 09/16/2017 11:46 AM, Peter Maydell wrote:
> Don't use the old_mmio in the memory region ops struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/omap_synctimer.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
