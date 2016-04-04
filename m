Received: by 10.25.208.211 with SMTP id h202csp1165304lfg;
        Mon, 4 Apr 2016 07:22:55 -0700 (PDT)
X-Received: by 10.55.55.138 with SMTP id e132mr16624674qka.11.1459779775897;
        Mon, 04 Apr 2016 07:22:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l189si22418541qhl.13.2016.04.04.07.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 07:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an5P5-0007Vr-DF
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 10:22:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5P2-0007S7-B0
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5Ow-0000OW-O6
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:22:52 -0400
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:36806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1an5Ow-0000O7-GX
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 10:22:46 -0400
Received: by mail-lf0-x229.google.com with SMTP id g184so98716087lfb.3
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=CbkqYmlXV7+YGvekYar73IX7eQ+WfCpGrhBsjzE8YvE=;
	b=X/eUn7JL99Fj160Ke21aRgIxECq52zXwW6c1/g69x6nCXKPzjO0p7yOFYt7ANw9Hpu
	bGq4PSogkoF7s6LxTrnzVCcDfn6bBXfShNaPWj0engUDzBLCfefrh7/ExuE83asvyf/3
	F4OMLMwIx2/3V8dslbPn9HNgFsOLufOuVHfkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=CbkqYmlXV7+YGvekYar73IX7eQ+WfCpGrhBsjzE8YvE=;
	b=IhLXmRgpVnl7q4JhiVU7Xk87Mc+Ki1AkuRNi6SbndjYcwS/ja1/DZPly0iE20iq9yr
	bC7L66RG5JWPrza9l/xTsqUeoG0pHyARrKqn2aSxibDWgwi9FjTvY/UOcl8w8Jb320m1
	Q7GqoOaFpbWzAs9k9jxwYHkUXpBxsvvHT1bDjG58X3ZWN0KJV6EKGM6mbXER6ry1nzlJ
	AVbqD8NCSU9qgbUisy8hQEeAklV3GTb8/9Jy8ooNXWdrtbmeqZwhLfLJekuDuYZ2nDu+
	DrNjeQW0G8+EcqJIUqMo47/ijuRVKWedabcB+7dBJ0edci+dkmQgRdy9wqmWa7b6z/Ef
	vTQg==
X-Gm-Message-State: AD7BkJLgdPgpemdcZz5Sot34uMEOVMAQPz6s2I8ZiYU48qezbBFVJFHIWLhxbcLk3jJTH7BU
X-Received: by 10.25.85.145 with SMTP id j139mr5220462lfb.131.1459779765584;
	Mon, 04 Apr 2016 07:22:45 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	m64sm4647966lfd.36.2016.04.04.07.22.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 07:22:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
	<1459435778-5526-4-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <570278B2.4010201@linaro.org>
Date: Mon, 4 Apr 2016 17:22:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459435778-5526-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::229
Subject: Re: [Qemu-arm] [PATCH 3/4] target-arm: Make the 64-bit version of
 VTCR do the migration
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5+zEhQjisYvB

On 31/03/16 17:49, Peter Maydell wrote:
> Move the ALIAS tag from VTCR_EL2 to VTCR so that we migrate the
> 64-bit version, as is usual. (This has no particular effect now
> unless the guest wrote to the high RES0 bits of VTCR_EL2.)
> Add a comment about why it's OK that we don't have the various
> accessor functions that the EL1 TCR regdefs do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.org>

> ---
>  target-arm/helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 0e54d90..09638b2 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3564,11 +3564,15 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
>      { .name = "VTCR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
> +      .type = ARM_CP_ALIAS,
>        .access = PL2_RW, .accessfn = access_el3_aa32ns,
>        .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
>      { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
> -      .access = PL2_RW, .type = ARM_CP_ALIAS,
> +      .access = PL2_RW,
> +      /* no .writefn needed as this can't cause an ASID change;
> +       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       */
>        .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
>      { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 6, .crm = 2,

