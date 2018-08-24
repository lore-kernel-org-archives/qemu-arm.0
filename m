Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1906174wrd;
        Thu, 23 Aug 2018 21:32:08 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYGmOUqWVKqRPLlR8MfWt4t0VGwsJkNBFmAd1U1nsXCAvnuJHfB6GeoCyIdSb68VRpzmTxI
X-Received: by 2002:a37:f71d:: with SMTP id q29-v6mr21803qkj.254.1535085128637;
        Thu, 23 Aug 2018 21:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535085128; cv=none;
        d=google.com; s=arc-20160816;
        b=Pd8Xho9Vn7upyAVTFIVxnVsA4/JEIokMQ6/IWgHnGUdJsh9GhfGA9UV01L8sR3Pcol
         Q6IZhyQ2ay3ACaWx/laQj6q65SEyDGNYPJjDRjAJjWAn35jbP6X1n0Qmo7Iod1ZeO7Vg
         rPlLkWNSySQ+tWgxZfd6NtDAAB1LwMz/DBpGUlu5iwLag9/Lmzug9jj9exjAmSKvU7hw
         VN2BY7oWuCi4VmHhTFuva5xSWgO42Jj7dO4PqajpM1iGE8lAioWnhOmbN/xGCa0ZW3iF
         GXJ9x2MSPtaVtMUnUe/Uv8conxqlumcfpUsIQSQgnMPP4T+nqJB0WUSfEYoC9QfKFDgV
         wpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=kDcTXb1Pqd9DSdP91zmcfwz4zJflGq/EHsQNhSWXXZw=;
        b=qHxP3TENBGKtxJDkHnsLiub2hs49IZLefFal0T0X/u8trmQ28k32+9HSrB9RwhaSZ1
         pbow9kRCSbK8t0IL4Mtl/IpqqKpgm2F/Tj1m90n9IN9PPH8p0jQkOCba3CnP/djacNVZ
         PomWDOntDpM4Vb0HLbzICvKqYWFOk9x7V+nw4tTySDV/xlduSWAX1mnnzQNnz3SH5cPC
         dPP1Lcc7vyNGeKYg/RMq2BrwjRf0z6TJQ/RHewK4JcSvg7MGGFkf0mZQku+23cxk+Y/H
         KiH3yhb6LV+sbPhjJX98Zw+tOBLWB1p5h3Djh+Vu/JTqnDWAWRgUspXqOW5cwhF9X8Gv
         ySug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PkV1MFTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189-v6si6089639qkc.266.2018.08.23.21.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:32:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PkV1MFTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3lY-00075S-6I
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3lM-00074u-1U
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3lH-0004of-0f
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:31:55 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3lG-0004o4-Hp
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:31:50 -0400
Received: by mail-pl1-x641.google.com with SMTP id w14-v6so540102plp.6
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kDcTXb1Pqd9DSdP91zmcfwz4zJflGq/EHsQNhSWXXZw=;
	b=PkV1MFTU8sPlK0LjqOIAGhQnDOdQU6Hvi/AbNSukJqeHdQGPlqYTO4mvR8l69kgKaJ
	Nb0uobgT82H0CcTaxBAAnt6/P/gPKJygtcTQdZUTAqnA3OxyRhO4nDKWsWI1geu6G/l2
	pzRGpQPvH/gNAb5QHdKClgfWVwYx/l/kcNL/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kDcTXb1Pqd9DSdP91zmcfwz4zJflGq/EHsQNhSWXXZw=;
	b=M460edRXmtxInuOTc+6hlOyfxpwe4OAxSAk1HyHqq87C3WaUOEEq+s1g/QlAArTmA6
	rq4F5Vwe6bB9qaw+p1mrYbmXGHlGEbzmprgvzgHMVuRnskBQfdxVoQwu07l/68GwdxX+
	3+u43FcVyzYl9vtLY5pH+t9GXsP1GzgenbHIlkPiJrSorUiWALanlcpKsIYDc4f8r02h
	ceRMBVB2AxTpAnoiF9qBfTFsU3PvmalNsnzszIp4A4tJFgvegchols/DDkl4/cxRy1cY
	iJvx3BZjoDUSzzM9f9R2KJ3B7db3RvxQs2T2UAvLLacNeMwm/MkmsTPlg5nFrjjwSE/L
	cdpg==
X-Gm-Message-State: APzg51AIDqtqcX5ZZ3OdZp9HOirrqgTsc6fNYBfRg2J0cwHBxN0fVuf9
	6zOER4AQcMO7C+0tu1XJlwbIBQ==
X-Received: by 2002:a17:902:7b97:: with SMTP id
	w23-v6mr39263pll.66.1535085109445; 
	Thu, 23 Aug 2018 21:31:49 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	x65-v6sm9408244pfk.140.2018.08.23.21.31.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:31:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b73437f7-bbf7-7175-69b3-65a2d1635447@linaro.org>
Date: Thu, 23 Aug 2018 21:31:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/8] hw/misc/bcm2835_fb: Move
 config fields to their own struct
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
X-TUID: Wi3e2NJ38Cib

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> The handling of framebuffer properties in the bcm2835_property code
> is a bit clumsy, because for each of the many fb related properties
> we try to track the value we're about to set and whether we're going
> to be setting a value, and then we hand all the new values off
> to the framebuffer via a function which takes them all as separate
> arguments. It would be simpler if the property code could easily
> copy all the framebuffer's current settings, update them with
> the new specified values and then ask the framebuffer to switch
> to the new set.
> 
> As the first part of this refactoring, pull all the fb config
> settings fields in BCM2835FBState out into their own struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h |  26 ++++++--
>  hw/display/bcm2835_fb.c         | 114 +++++++++++++++++---------------
>  hw/misc/bcm2835_property.c      |  28 ++++----
>  3 files changed, 94 insertions(+), 74 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

