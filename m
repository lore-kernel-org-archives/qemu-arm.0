Received: by 10.28.71.27 with SMTP id u27csp5251325wma;
        Tue, 27 Feb 2018 12:51:26 -0800 (PST)
X-Google-Smtp-Source: AG47ELs93shgwrV/STcQzdrFbTiO1a5qm70/ScooF6VERZsEalxJ4KeMezzN6cUSVe5dC11Q0MOi
X-Received: by 2002:a25:8690:: with SMTP id z16-v6mr7923496ybk.188.1519764686718;
        Tue, 27 Feb 2018 12:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519764686; cv=none;
        d=google.com; s=arc-20160816;
        b=fqQHuAHUB+4HNEDizPgtOmCDVvUNxG87C1fgIyoN1Eekn0KwK2zAI01jm2e22AhUed
         2L6aOHNzBYbVaCOr5jlQHTs3fOuZWK+ozQhqXCl2QjWvXvTvX1aarwcByK2gfjPkGnqD
         39UflZhEMdY9fPzsn2t0JFONdgjb6t6k6J6i23qf5xFNPWmAWSbDVbyxA7XqPtmkr0UM
         1Hd06YJfq3rbpqFmfrgdN60ylA343h2GCWOV7CefWNPU/c5FFCI8DOaHA/HHkjOkznlM
         iD8OERnoaimI/p7oOPsfS7+mlLw84L7LGzwDlPvWG57jUObSCObD0rQFtq7D0dwNYzo5
         0pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=M+XSROTTPbxNfzqODIiF0aSV0kP4TRDEFsdKGyUgqAU=;
        b=NC8AWs5VfzIyaqSgdO1LTga+mGoBHRoIIFb8LEDcxoTk9mMzJDYmLgB4VP7cCp6lkC
         tcxqZCeHl4Bw+u3EBA9nnF7U1eWdJ7ATTyglqTnhQ6DbTFnoGk1Ss+8UeP0g9vTEvhkZ
         gw3OcFbzFw3d/dzMfMcmp3rMhxMM6vj5dKvGDVp5zUvN4lU6aANkdUkuX2ZW4vYn6ehV
         wHvtrm8WRsAnipMfLJVSr3L7fawyNk75kFHOdy1D/5V80+t4n8Sf2Wx87h9+LEu0DnQu
         RFhTijnfLspakhguikm4x/NxMK5yiHz4jY47DQIttD9zadItBmFj3GrZq+pqLApARK9t
         UCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiBwKK+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h11si9228ywj.11.2018.02.27.12.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiBwKK+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmDe-0001J9-7t
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:51:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmDS-0001H3-AE
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmDN-0006N8-FG
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:51:14 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqmDN-0006Mu-7p
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 15:51:09 -0500
Received: by mail-pf0-x243.google.com with SMTP id q13so78308pff.0
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 12:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=M+XSROTTPbxNfzqODIiF0aSV0kP4TRDEFsdKGyUgqAU=;
	b=eiBwKK+OxXdlOKarqvJy7jvpG/5HQG7x5js+WvG/RJYj4fVXc/kDiN8KlV7NMn0d1I
	+jG9/sAC8p1rNWrplmAUA2vR7PuzzN272/OY9Mk2E00jaJicpD5t2W9lb/8ax87iSwA2
	7oBXxBzhTed1uMkHCIct37HX7HFX5U4Vmrc0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M+XSROTTPbxNfzqODIiF0aSV0kP4TRDEFsdKGyUgqAU=;
	b=LH3Vd+bFdX4+rys8rqaNxi4gPuojfnC1DB7FHaJTnZi5FV1fWpVbguTO7smpISuRe9
	2L76IXivPpcF00LXFrz+K41BuY8I2iGwP9C43BH3bwkV7H9CPAyZ3ojuEoZAvgrCaiKr
	JLJLaiR2t+By8gHyc/nKKnc693xJe/FdVlkcy8ku4MCsOjOO8yT5edx83PYobT7AbnE2
	NRyHAKlAKTDOMQB0Nmm7ZmN+JsYwxZEpt8XMM8uNv1tfyyIoPd2No8p/AUsyYmeCiz8L
	9GNvCec3ffxzJ3REaZwHYo5llACUlio0a/s0N3f1FVkpV5zCpAw1ppos2iNPg8qs4Ibt
	QVvQ==
X-Gm-Message-State: APf1xPBfnNs3RNuAfWkJ8KcHFkfipoa+K9xwR1ftKtwNxN7Ni/tjM3RI
	qRIRc8x4umG7nyd3ZpV7Wv+fHw==
X-Received: by 10.99.97.68 with SMTP id v65mr12403457pgb.104.1519764668222;
	Tue, 27 Feb 2018 12:51:08 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id p123sm56989pfb.6.2018.02.27.12.51.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:51:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc12081c-d5d1-558f-4901-cb074f00893b@linaro.org>
Date: Tue, 27 Feb 2018 12:51:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/19] include/hw/or-irq.h: Add
 missing include guard
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
X-TUID: RFgBPyjUCnW4

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> The or-irq.h header file is missing the customary guard against
> multiple inclusion, which means compilation fails if it gets
> included twice. Fix the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/or-irq.h | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

