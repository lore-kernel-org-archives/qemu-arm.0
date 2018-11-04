Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1335325wro;
        Sun, 4 Nov 2018 01:50:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5f1mxaiTvNrOGX7l4rJUUcwowymfRWy/dr00ZFTgEOWLLHUczgS0yJ49A4xlfLYPHYx038j
X-Received: by 2002:a37:3cc7:: with SMTP id j190-v6mr17122491qka.268.1541325058592;
        Sun, 04 Nov 2018 01:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541325058; cv=none;
        d=google.com; s=arc-20160816;
        b=Wd21Vse/Xvqhd/Wci0PMnnk2jUrers98gFmQyu4vwwkebrrxFEaCPLvesGiIano9mP
         YQdITG7xn1MI4gQg3+dYhqH6/YfZ9VqtN7PZFbwCll8ZjDMe/VgWRZGhS5c5w+AZ2Dsb
         xJINLH6BCfepQpp/W6IFIQcfThi0vMICmlnFH3Xgz0J7AUBOxztNdAmOaFEExfwSSnuO
         R6crekE9tYgiBOJqK00Fxh19SzAXahpEbsnPzIXHDrb5MKov9hu94UavUFJ4J8HpZ+vl
         t/k4MZbj2geGNwgJCW0SFP/7Biu3GgzJ45GgE0skSSIIuDQmBixPmSDjZ02meM3DJ0nO
         dI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=KAvyCob+JUxKHb1DjS3zT/aGb835FBFkeWoTjg5QfOY=;
        b=o8fPjbSJviqJ1y9TtGFRWz1aqOkRZ6M1UpVoOvtLyWbRXTbVwgQh79B7le4o6x/7y/
         P+b9TG1HQqh8Rw6qmyd9lpbuDX80ayVcKYjUryMvBB5atBpcbHLSfIoEyRSxBDp6YY2g
         uttv6RliAFfxQpBXvpuZiOtGcHBrGiLYMI88MwvOLETZADa1u++7XOr3pALi9vUHdMoT
         lHrgCNQfYe1K7KI01UCF1uTAp0u9W1zrPBjLX4mz8TW2IlWO7KXEHQaeVIEXYpRMF9YJ
         jeqcbchQZO9utinc5t2fcsxn7VLkhDtGa8B1pOiahnAhOn/cvxQtBnqnTCHZEfdgni3A
         bKWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ti/vFhQ8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3si5915615qvq.169.2018.11.04.01.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 01:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ti/vFhQ8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJF3a-0006oW-5c
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 04:50:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gJF3R-0006oJ-UN
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 04:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gJF3O-0005SN-Pw
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 04:50:49 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gJF3H-0005HG-Aw
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 04:50:41 -0500
Received: by mail-wm1-x343.google.com with SMTP id q19-v6so5466301wmc.2
	for <qemu-arm@nongnu.org>; Sun, 04 Nov 2018 01:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KAvyCob+JUxKHb1DjS3zT/aGb835FBFkeWoTjg5QfOY=;
	b=Ti/vFhQ8l0Ebz6yn6KQYF8khREOge0WxxBx7VQkrXj4hF7gNjdugD4YG/hYlmBVwrq
	wU1suii4xH8wvI/V6A8E1GThAtqawt6f7SgTy8Zt5X+QPJKe0FUsLD/ct4u3ppqhDqSK
	/VlXCzuQB/JLNBgw742np4zct6i+fW6AAvD2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KAvyCob+JUxKHb1DjS3zT/aGb835FBFkeWoTjg5QfOY=;
	b=qF3NQFQa57gQuC3R7/cj1HprVLqQaM13r6OI2l+K210PwjJNQ01vE+2MZljXIMWImp
	+jjuD16Fk9QFYoBtUMTLn5ePOtXNWufENo5Mh8S94NcAY39KK7gNbHLRMCOULPcxqwMy
	/df8jxFfhAkI5rVcR7AkjPnH95n8xEXRucFDiDcHSrSzL+SuQOz+Y1Bbstf55QdKeuhj
	YJl1vCcSNSu52oKAxvYmhglNZe9WmdgH5wLHZDG5urxTQzGV8SJuz1SyqpDLsbYPkZFt
	4IrJbV2QM7ht0jOnqvjjNP/yfZHVWI37sk8MkpgDmM0AgkaBAcEoAMr2vANlFBPx5KJD
	Yk3g==
X-Gm-Message-State: AGRZ1gIHqqpOE5ikXO0ln4NTSj2MoDi6xiyuyvABpu34ZQQvox9wtGQd
	HAyzfBco1U/WP4QYbnH8a4dKjQ==
X-Received: by 2002:a1c:e355:: with SMTP id
	a82-v6mr2985457wmh.74.1541325033557; 
	Sun, 04 Nov 2018 01:50:33 -0800 (PST)
Received: from cloudburst.twiddle.net
	(cpc92880-cmbg19-2-0-cust631.5-4.cable.virginm.net. [82.27.106.120])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm7656412wmd.26.2018.11.04.01.50.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Nov 2018 01:50:32 -0800 (PST)
To: Marc Zyngier <marc.zyngier@arm.com>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
	<CAFEAcA_tcR_33Q+2ZFHdzo4_9khXggum=gRfZ8+L49KmP3hHiw@mail.gmail.com>
	<20181102193529.GB12057@e113682-lin.lund.arm.com>
	<effa3839-f0ab-e6ab-e034-a1a6d1d06923@linaro.org>
	<20181103123246.16b5b101@why.wild-wind.fr.eu.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1ee4127a-aa3e-4e19-1dde-af83147f8bc4@linaro.org>
Date: Sun, 4 Nov 2018 09:50:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181103123246.16b5b101@why.wild-wind.fr.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 0/5] target/arm: KVM vs ARMISARegisters
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Dave Martin <Dave.Martin@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHyMHMLPhVog

On 11/3/18 12:32 PM, Marc Zyngier wrote:
> We actively hide the LORegion feature from the guest since
> cc33c4e20185a391766ed5e78e2acc97e17ba511 (in the 4.17 time frame), so
> you shouldn't be able to obtain these on a recent host.

I don't think that patch is ideal.

In particular, LOR is a mandatory requirement of ARMv8.1.
The OS can rightly presume it is present in context.

Better, I think, is to trap the LOR registers, as you are doing,
and have them act as RAZ/WI.  This indicates, via LORID_EL1, that
there are zero supported LO regions, which is a valid ARMv8.1
configuration.


r~
