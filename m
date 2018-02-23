Received: by 10.28.71.27 with SMTP id u27csp617753wma;
        Fri, 23 Feb 2018 05:54:51 -0800 (PST)
X-Google-Smtp-Source: AG47ELvrJWBwvySmaYCVxtNgvALWCatMm9hXvpdyOsO0yXlZc+h4uOeYRWyw5SLPi0nmkEQLYfwx
X-Received: by 10.129.93.137 with SMTP id r131mr1018252ywb.56.1519394091261;
        Fri, 23 Feb 2018 05:54:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519394091; cv=none;
        d=google.com; s=arc-20160816;
        b=X7UuDHCuU++9kCBaK9NzVdx1Nk+MWo3/u0X7LtVlmug/DpZVwYDjqt521cTRmXEmV6
         6VQ/u4cbUSeNW9/18EmKUfbLY7Uik0KUq6aa1COGcSpGE1HENHtwojAgR2A2v34T/BcV
         z8r8RqLrRbCmj0NNl0qr+UWjOhdQlVQzLYf6fUjZfHDVdwaiWEl0aQDtGtTl2Z+kSBF4
         TTRLxyNzAJkmL2oNrHJ6gOhsHzXPOPso7wWqlbecfc2wrIuIPqlbRU67Ja3WtbfH1DOa
         78UqhNremnXEk1WpbrZKhdacj+zQ6sxL6bgd0Z6eSrz2HprgQZMgoTj5HZivihelPRvH
         eS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zxPnKsStGEjqCtAVnWE04lotwz0tfVZVBzDhoPUeF7M=;
        b=wGajQpscwThQKgSMhSz9dRvB29S/uKmq2KoTbNVT9NFR4rtOIs7w7qI5AeVcgXxYjW
         bFEOka4LT8m7s+EpaufekKLejO+98VOc0b9Ljo6MC0i0obDvSeFiPG9BIJR/mH60uXEJ
         ruxGAF8s8CxqnVoQ6ykL08vC44ehlZvPIbqMIMVlbw9tj2JntcHSDKXCHgTrgmnStC4+
         EcwkrkcLdcY8TCN+AeY7rRNYiQTGgW5jk6F6Ko+YfQGTUX25cqHXb4k9QZGwp2qPejU6
         kcD6xToq8wapNwOLlEGIrF992oBBx7ue+8BLQ9diLAg6xXGjhlu56C+nYhaNWN7SjQz4
         148Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WEkQgEON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m65si399742ywb.779.2018.02.23.05.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:54:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WEkQgEON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDoI-0003OP-Le
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:54:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDo9-0003O8-Le
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:54:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDo9-0002uw-14
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:54:41 -0500
Received: from mail-pl0-x231.google.com ([2607:f8b0:400e:c01::231]:34921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDo8-0002tT-Po
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:54:40 -0500
Received: by mail-pl0-x231.google.com with SMTP id bb3so4933849plb.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zxPnKsStGEjqCtAVnWE04lotwz0tfVZVBzDhoPUeF7M=;
	b=WEkQgEONYin/9K280OElQL0jHs1Y9Gu3QTyBFk9TWDhNYrsnUBfiQlT/LVxzIpMcNi
	YXizUbwQLHT30tviWVcw83Ggf0yz5nsNx1eUdRu57PwzaEDsN7HQrxgOSnlkWfNSJbO1
	OMVrJj4lLcNxlNHGOI0TOX7TYM7b5nT25VEMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zxPnKsStGEjqCtAVnWE04lotwz0tfVZVBzDhoPUeF7M=;
	b=jX0f/V5fivLtM2P+5OtLsxniMlQTQzSsb1/Gl7DrN3ZkpjcO648UJsW4DNSY8TsQ7G
	bynAKdRA1MIKRv/AztrtI4eaSm0jLRts8BdeUmNHqrwN+WAYsb/Vb2YkY+mkffL+5pox
	PSlfOy18HdM3wmenZbZRCRzYpIJqjXZ+f5AY+PWBpF8g2ojEdGZogkGhQ0jsadkyLRlu
	ZFJOW5C8+800nvtywk5E28VkqlCO4P7zG3EQ/b8GmAMc3hp8Sa9QyN1zGXm+MnOCyzjh
	DvRtGeXZCn8Qvq+/NNKeW1zNwFyT40pKHbiY9EXQ9WznM/NCr0GeD986YW7twTon9iIo
	pjQw==
X-Gm-Message-State: APf1xPD+MC5/O/fsPmfkZKz2qiIQuVGFln2ao+FX9Itl6y+l4Eu+lYRt
	gcgc29x3Nj4M+6jYvMvx7idteJFCmDPdnr0FpRp9oQ==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr1842376plz.436.1519394079634; 
	Fri, 23 Feb 2018 05:54:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:54:19 -0800 (PST)
In-Reply-To: <20180217182323.25885-23-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:54:19 +0000
Message-ID: <CAFEAcA8OGxchC78-dS6XmLBb64n=+V06xUKfcq8D+dNd9Z=1uQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::231
Subject: Re: [Qemu-arm] [PATCH v2 22/67] target/arm: Implement SVE
 floating-point trig select coefficient
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
X-TUID: WvfXhGBrJedE

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  4 ++++
>  target/arm/sve_helper.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 19 +++++++++++++++++++
>  target/arm/sve.decode      |  4 ++++
>  4 files changed, 70 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
