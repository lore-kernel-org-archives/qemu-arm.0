Received: by 10.28.71.27 with SMTP id u27csp2287285wma;
        Thu, 22 Feb 2018 10:38:53 -0800 (PST)
X-Google-Smtp-Source: AH8x224IGns4wpgTq9yoQBC9/lY+CvGusNwskV7H1S9YLX0YmV0ZWmOnTEvDb8rFnJ5Icdp6AwI1
X-Received: by 2002:a25:42d7:: with SMTP id p206-v6mr5672251yba.27.1519324733243;
        Thu, 22 Feb 2018 10:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519324733; cv=none;
        d=google.com; s=arc-20160816;
        b=J2DlDhUHeLbnJ2O6WwIiQ2bbvehsycW14fntGo7SZznxmSu7PNFvSTzhfMSlu1uCLq
         siw6xkenb0DGkcrke5cMSCLMB76KZ9Ubx/mJs76kANhimSUPoOALZNHR65VX32ZDHGSy
         2nr6DF7g/+tl0EUMYMDgZtx3UKDLYXm+EWPO7fvRUfwePGJGjGOheMQSVkkirq2F91x4
         RPrjAL/K3TmwRac4LU2SJvupHJH7yzrkSIRNXzlOg9XT1Z+mvAFF+3BGRLUP5UUIkZ6+
         RxSnESechMQRpdIENBqIZdg7HyiVB4WKSYuoy1Amrb+bn6Fp+/ZMp0zA5XlU9PH7tg+j
         PDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=k+JstwqiDkAxUCYIC8k8m56AKTrS6YMYGR/6wAbKf7I=;
        b=MtLTGTb2QDjhgNgANkfB+QDTikMt6sN1ym85I30oxFdO4bXCHeN3fkcHVOni+l5HBa
         NYq+9dMsWwthSvaQ3bG80tU8AS8BB0TAyV/jZ1/hn9JQQNobF0keWohIZluMJiWQ9v3H
         2xQ1NrNeSjYVJ1fdhgyYgkt8Wkii3eTPdE4gv8PQlfUL63CAq5bKp6X4ub45gVpVMfNu
         i4yaSrFHE4N53hQcuMOPxv/FsbtHYe20eoXRaRTIok2rFyWcsxmcmV60G3BFO3niy/4l
         cStWvewVcZVHMTs9SIBp3qyvu5Ziu+gcwT00eFGB8TSp/n/QOGnPKztt8EQW8MP5oa/u
         khNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hw76KErM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 205-v6si109564ybd.23.2018.02.22.10.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 10:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hw76KErM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eovlc-0000yN-Jy
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 13:38:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovlP-0000xG-Tp
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:38:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eovlO-0002Nq-Lc
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:38:39 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:40885)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eovlO-0002M0-FP
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 13:38:38 -0500
Received: by mail-ot0-x242.google.com with SMTP id s4so5508096oth.7
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k+JstwqiDkAxUCYIC8k8m56AKTrS6YMYGR/6wAbKf7I=;
	b=hw76KErMgL2neGFzwujDvgwP37tLXZ4iI4R5Ss1a6u4x4yh9RZAOvmLeqgAik/Ars1
	slAS87LqTxSMdXAOX1i2IZPLM2GMAxudUXm6CNpfQAVEqx0Qa+U9SMNCbfqexzsE37vc
	0lEh6ih49ePnBffWtFRQ59WboKn1xX4nuj8uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k+JstwqiDkAxUCYIC8k8m56AKTrS6YMYGR/6wAbKf7I=;
	b=Afm1gnDPQxSGzXPQwnFFj4ev4IAO2w5kUq1X5mLV6brxfj/i0Zkj3YlvDnq35D8lTB
	iYMLKnKIzYNVCa6gZ7Yv4wsHtp+N0cueQnS+QOckFb2A2sKQurwym7VLWFDj6HUmkrdT
	JilpzuYNZnqoBEY46+qGcM8oAVRLx7PWSa1Foj3e1dza6hxy1NiWcYvzYQvDV4/NnAwQ
	RIHpv6fuE3ailcoqECN1OTsJI5bPEthMvX5HTFQUT+v5d+G/HMySsE1tZkzIBIVB25OZ
	q87Oicg013Y+gMtcHvAipLVyP/W66CreGqDvXI1YDllr7oNmhGhrmdEM5XwaZfRFSyKB
	1Bfw==
X-Gm-Message-State: APf1xPDOtiJM9IKATa2MmBt75zUD5ak4A/Xffgp/l4SW9lzSUB7ZZbDq
	Y4ekzVFp03s1eeuSuuO0j13aP3kB/u+T1KtUtWmivQ==
X-Received: by 10.157.23.34 with SMTP id i34mr6245040ota.210.1519324717594;
	Thu, 22 Feb 2018 10:38:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 10:38:17 -0800 (PST)
In-Reply-To: <20180217182323.25885-7-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 18:38:17 +0000
Message-ID: <CAFEAcA9_pMkSAftSO2y+CXy37fK-NcNypZ-cYzxwAYYq1R+qEw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v2 06/67] target/arm: Implement SVE predicate
 test
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
X-TUID: uR82jo6yLe0U

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 21 +++++++++++++
>  target/arm/helper.h        |  1 +
>  target/arm/sve_helper.c    | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 62 +++++++++++++++++++++++++++++++++++++
>  target/arm/Makefile.objs   |  2 +-
>  target/arm/sve.decode      |  5 +++
>  6 files changed, 167 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/helper-sve.h
>  create mode 100644 target/arm/sve_helper.c
>
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> new file mode 100644
> index 0000000000..b6e91539ae
> --- /dev/null
> +++ b/target/arm/helper-sve.h
> @@ -0,0 +1,21 @@
> +/*
> + *  AArch64 SVE specific helper definitions
> + *
> + *  Copyright (c) 2018 Linaro, Ltd
> + *

> +/*
> + *  ARM SVE Operations
> + *
> + *  Copyright (c) 2018 Linaro

I think we prefer "Linaro Limited"  (cf https://wiki.linaro.org/Copyright)


> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 9934cf1d4d..452ac6f453 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -19,4 +19,4 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
>           "GEN", $(TARGET_DIR)$@)
>
>  target/arm/translate-sve.o: target/arm/decode-sve.inc.c
> -obj-$(TARGET_AARCH64) += translate-sve.o
> +obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 0c6a7ba34d..7efaa8fe8e 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -56,6 +56,11 @@ ORR_zzz              00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
>  EOR_zzz                00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
>  BIC_zzz                00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
>
> +### SVE Predicate Misc Group
> +
> +# SVE predicate test
> +PTEST          00100101 01010000 11 pg:4 0 rn:4 00000

Shouldn't this be "0 1 01000011" instead of "01010000 11"
(just a spacing change)? Bits 22 and 23 are op and S, so spacing
it like that makes it easier to compare against the encoding diagram.


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
