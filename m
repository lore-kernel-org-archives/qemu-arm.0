Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5160464wrt;
        Tue, 5 Feb 2019 12:06:44 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbdFVNDD9KaZReES7JkqwTz5TcGijRmV9nKQ0sjjCPKMp79m1dTbO082b7Yepb0+OJCDzI8
X-Received: by 2002:a5b:449:: with SMTP id s9mr5376364ybp.57.1549397204079;
        Tue, 05 Feb 2019 12:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549397204; cv=none;
        d=google.com; s=arc-20160816;
        b=KMkKSzgCYtOCvPpIAi3tc0flHQZPjz/xsP2hc4e7dlCRfb3haN3PrymxveIDW3A67J
         mPKxL/U6Pe5+E5ZJNM09JhLUwsAYFPAkpv1yW9EqXdqb5bEDBz4uJMHAJvJ4KiNMb9sa
         B8LuU6qWUhZcCwfcijq4FTokWxJoFdAmmpQycH1/mdsfK0WuL/C7K+7yQ6Hs5CCdbzRL
         /ZExiSaJUbE+OEv3SLNZZKHYM/ZZjip7PQHl9DPmfJ8LTcNaGmpdP7kH6kE3rL8A7dpE
         yh5Po42NqMHYTZe16Vm+lkaiOFphasha5/upBXNLC/KYxl2Yagb6yZdn/ENgTq5RPl52
         1c5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5p3YLgryXcDiQKunnqLVkVgvMEtg2dAgiLUSpv/E/zw=;
        b=oGI0cGcwQQQZB86vtyngyDRH4CnI2vzToOcIySm2bB7tK58XnvtVJxckBaDbrPLH78
         /dgKHHCpdCWwuTzng5++H4mpDTs9nzXvCRq8S0KhnjjiTn4sZ/ncZl/u+GqBEVFTLpuV
         mVBJeMeX1Dbds0sFdspn78M+NaGr8rgj3VONFZadbklUmiKCX8a8LnbYYpRvU/DzNNGU
         l0AlELT//9hEbmtraHoYs9xHBW6MzK5BIkLfOl8mbMNACKEsn7dx4wT7rOjXn1N5+tuK
         ZLMblOcUqzOKnubnfUk8p5Ni8Jz4t6d/JXhRSzf3/En6+FrQvMOPGdOGSgkgSoBA6hEf
         CZfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ybfuxNYu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l207si202333ybl.303.2019.02.05.12.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 12:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ybfuxNYu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr6zT-0000xI-Bh
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 15:06:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr65Q-0003ux-4K
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:08:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr65M-0007o8-VF
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:08:46 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr65I-0007mf-Ce
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:08:40 -0500
Received: by mail-ot1-x342.google.com with SMTP id k98so7681381otk.3
	for <qemu-devel@nongnu.org>; Tue, 05 Feb 2019 11:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5p3YLgryXcDiQKunnqLVkVgvMEtg2dAgiLUSpv/E/zw=;
	b=ybfuxNYuiUTuW4B6qCbU8v688zZcorkum1C5K0IfvjGDQA5WlifiCGUfFYmYsDSMpx
	epdGoIYpbCSZXz9510huoU6FQLZDdcHN3aybH0mmx7dDgU1kbUmJdNf5zXS1SJygy0Oo
	TZ2kmVEjX+oIuwcCOHzmfA+ruELlCD5PVMM1oyK6pfIGXgzfhLbn5LpDSluhZsjkTJKT
	/LFo3htARWI4gXkb1yFVUGzWEKbY3t2rhHoNUy+2hZv/ZvR7WVE5tDPvlT3fzXNfOd+M
	nJQYHi0LnCM6WyMmouT+XvvkNBNFiy5YcNl8om1tOZvzGc1aZp9FkxnULX3fat9vFWhq
	hKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5p3YLgryXcDiQKunnqLVkVgvMEtg2dAgiLUSpv/E/zw=;
	b=CP65ma4uWwJemGkVpITzD0huHqmtA277zV4BtHPHXyQptm074oUz4DGWVObHvHO4aO
	SzGEgJF3owB2CSB58ZFA1QE4Q7P7F4X9/KsrODhgFUt+ESLo/6vnJksx6zgqTo4w5h11
	vT8dOLmuoj/s32zjmND++9IRWHM+k88c7kPaslPke92flQkSFVkyFtHyeLJx6ZyMenPM
	jxXtiRHI+srjg3CarVgRjgLya0vj0NiyaeJtp8ptPznU79qHHYS28t7GGd7LKrfEjiXD
	cFv3yXyQhEJ0Xod57Ec4dGDb/dGtSMwHvZL0iXR1hrQip1H1rq3UCI7Y50fxFAzU7jJv
	q+OQ==
X-Gm-Message-State: AHQUAuZgBGyfF2L8feFYb+BZpa46WTYlXtL+TDPzJHbYURInARoyL+yI
	dLqjJQJP2UhwSvSUSQxoFasIi/GwerffhMFuzV32MQ==
X-Received: by 2002:aca:4f11:: with SMTP id d17mr541607oib.337.1549393716835; 
	Tue, 05 Feb 2019 11:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-3-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 19:08:23 +0000
Message-ID: <CAFEAcA-yNdB_f4p33tyyC3b4kSpFhqegqu4d+7RGCKdNbSt_og@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 02/17] target/arm: Extract TCMA with
 ARMVAParameters
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YcPZl6weEB4p

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 1 +
>  target/arm/helper.c    | 8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
