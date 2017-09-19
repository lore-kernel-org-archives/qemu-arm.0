Received: by 10.223.172.38 with SMTP id v35csp5270523wrc;
        Tue, 19 Sep 2017 11:55:13 -0700 (PDT)
X-Received: by 10.200.55.234 with SMTP id e39mr3511316qtc.73.1505847313357;
        Tue, 19 Sep 2017 11:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505847313; cv=none;
        d=google.com; s=arc-20160816;
        b=Cdh4Uuy0uhLIMXNHQZDIcrazXbbScnnwsOpwLLQuL2BS4X+PetHj3+NlSIFq7j0GQS
         5DfSA6AH6xtUvvWLx98HC8ys9G3/0vnQSuCXOU8TQ+VWsdMvP9NmD7hj9STqt2R4Trdy
         JA6vcQiF0WZ41KrS4x+jm00wSALcyPfdN7BGABLAU7n3hhY2B6iOPAanOd93yz/jslgO
         NOarJnDn6xLrBAHxZKuM1H9vU9n0uYkpmLJ5hC1faV+9X+NLBOepKoKJP6Cm/x1pEMLl
         QJydbILvFMXjgWveWC+IjNenNHdAgvdVFUwGsyQQw7DxuOSCPhDq6sN9rtT8h3i8qV70
         VoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=2RsdhKkoq1/8F85JrfEyq9TLwjaN4Zz5oIWJlM9ECCc=;
        b=DWpJ7+c0owKZWNGk+nedefMXvdzC6W+u3mw81KZII7ikRDLihRKWBtmkEQGoLw3Fng
         ZqB0A28XeIfRiIDkTKoMjDFdvv7Z3ndwTb+QbbEye4LdxnJaoHu4Z0zwGBHATho5LkJE
         0VPn+fMKU5iTfP5AeRA63KwEodgRdtpZaUEsrTycUzDal+wut55fq4SMDeNB2OS2rVx+
         i4HmhAHPf5X92+NhLuwnDE6POxdCRXAa+ch4dpPX5xHtpty0FDsgc2fr+zUofKvgun5k
         ZCjs7E9XsFO0StBnDZQ6UDQUhoKvjL7TXijXUsBL8gRddgEcXl+gRFhNilUAYdqweDIO
         Dgrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P9yG2Ev2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si9876386qkl.513.2017.09.19.11.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:55:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P9yG2Ev2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNfr-00021w-31
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:55:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNfd-00020N-AQ
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:54:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNfa-0001Av-6I
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:54:57 -0400
Received: from mail-io0-x229.google.com ([2607:f8b0:4001:c06::229]:46562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNfa-0001AT-1N
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:54:54 -0400
Received: by mail-io0-x229.google.com with SMTP id d16so1400338ioj.3
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2RsdhKkoq1/8F85JrfEyq9TLwjaN4Zz5oIWJlM9ECCc=;
	b=P9yG2Ev2s2KBDmUnRjSTWUToJG6xb6lHtbIdDcN85Lui1exd92oB2GMFZP6eql2+K1
	yRWNLEqNbPXICm+pFGUyd+0ttdeDvspTd/JyZIk9wdOwJ+B34P13kz9QBHwvO2pgy74W
	3IOsKwRe6Lc30ymtBjwOH9mClUpe/ng19lyrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2RsdhKkoq1/8F85JrfEyq9TLwjaN4Zz5oIWJlM9ECCc=;
	b=S1cdG+xp00Bg+FWyeEF3kYMyJoPoLIPez8Fq56bBhzliqUQ4kPdfQV4Z19CJksH9zp
	vWTCcqHCAGyv1MvX2voBQ+xCoY2zr3tk3f5q15Yf34Xu5W99gNlDf4XOI739GPd6MWUf
	1R8Av6w4DYL2Mapy2z8iVKXOXlUTnQ42EsQqk2NEDfZvIbvy+OkNQO43QYi0LnAinI5c
	sPr9rYW9XdvW9yiLIIucGvxDkOEonCQYd20O6/gnPlLuWvEG15mO9augwRqKdWdF15CY
	+yg/8nTsViVtU/x4R8xcl4jKM1pWzFQLOAsYgtFPzhuUrAVWH9cy3SPYg2b/xwi31dSq
	Zx8g==
X-Gm-Message-State: AHPjjUgrscvuOLkFXlHtX72ItDKyj4JuijxEsyDdteMcT1NrlNHq05GX
	FCbdCTJkKRcFYECpU3KRCmijfQ==
X-Google-Smtp-Source: AOwi7QA5MFEHbiIONPpT1C9hHh93PuZFGyd5VUuFDpxeyscATEUyuLeCplP6jI49C7LbbPx2E3THWg==
X-Received: by 10.202.87.208 with SMTP id l199mr2653355oib.225.1505847293169; 
	Tue, 19 Sep 2017 11:54:53 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id t16sm668231ott.79.2017.09.19.11.54.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:54:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-14-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b80ed6a1-dc49-c5b8-1e76-7afcf1b3d4f2@linaro.org>
Date: Tue, 19 Sep 2017 13:54:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/19] nvic: Implement v8M
 changes to fixed priority exceptions
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
X-TUID: +kKuFjLteidA

On 09/12/2017 01:14 PM, Peter Maydell wrote:
> In v7M, the fixed-priority exceptions are:
>  Reset: -3
>  NMI: -2
>  HardFault: -1
> 
> In v8M, this changes because Secure HardFault may need
> to be prioritised above NMI:
>  Reset: -4
>  Secure HardFault if AIRCR.BFHFNMINS == 1: -3
>  NMI: -2
>  Secure HardFault if AIRCR.BFHFNMINS == 0: -1
>  NonSecure HardFault: -1
> 
> Make these changes, including support for changing the
> priority of Secure HardFault as AIRCR.BFHFNMINS changes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

