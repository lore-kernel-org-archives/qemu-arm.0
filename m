Received: by 10.223.159.74 with SMTP id f10csp3173265wrg;
        Tue, 5 Dec 2017 10:59:28 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaY/SHtgoyGLGY1vBGKUvFhT8UCNQ4EgmX/ObjoRSwD8PqcTfyVV107wNqPh5rHSP+l1unW
X-Received: by 10.13.223.138 with SMTP id i132mr13581776ywe.452.1512500368638;
        Tue, 05 Dec 2017 10:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512500368; cv=none;
        d=google.com; s=arc-20160816;
        b=mGAueLShO72G6XLEJAIVSXr6BlaxjYmpevxqLdr+7sNqVYRyUvDDILRs2ggtb+DzZg
         HANlP+lqRkf8E2OhLNmCfWZ0ZLveJ4F8ZcP2alnt5cEO8FKgREy+TjFWc2hmzRaZnT9z
         xj4MKKMndPPew+zioddVo22eZ4VkC5K2VXGPCHIL9AvBeZPjGXs05XX/1XHL1iGRtOk4
         0KcHM8Nr3dBad11BcW1aGlW+bgDtPTM8RiW0z3Ip7tcTDOaPWTF8v/Lk/C3HYwFHuWVp
         8xQxv2K8zGySoTn8g6IjD6U9D+uI/Hb8SN4qpJD3Fj2nmEl9CQqq76xQIHGulWcBZpCQ
         FGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=wKorkX7V4rI/qUzTbc4srZZOyd8YHFyDwAvIg78SA18=;
        b=EcCIUbMPM6oQ+m0SlYYtqaSZnyJ42+96C5ZIehaVvskHbfLeGlCh1+UmpvgPmwZkFV
         +6qxRckrKK4qSM5N85+4UJen7IK6HC9sT5NzZuRRjv4K+zHiKpwPyfiPiwwFfvbnWAdA
         su9UfrLSGp8cGvwhxLz585QVSjKCOzizr63WSf6CWnYiAnivc2yUnoDb+93NN3+lAW30
         DO2IMM7uIrLfOm2ANsTijTsT7/oynkL4OrWo8UiHE/96u0hpe1rcv8352JRe1nRsId/z
         SHcWdG2W3K0WHi71R1vlsgteKULbQjiBrLgGr9m/mcRm6/NoEViYOZsgF59kGih3NJyQ
         7S7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PdQHFrX/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s129si206991ywd.549.2017.12.05.10.59.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 10:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PdQHFrX/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMIRE-0008Bl-4W
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 13:59:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMIQz-00089P-Kq
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 13:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMIQw-0003z5-Ld
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 13:59:13 -0500
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:38480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eMIQo-0003lp-Gf; Tue, 05 Dec 2017 13:59:02 -0500
Received: by mail-qt0-x234.google.com with SMTP id d4so3253682qtj.5;
	Tue, 05 Dec 2017 10:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wKorkX7V4rI/qUzTbc4srZZOyd8YHFyDwAvIg78SA18=;
	b=PdQHFrX/KZWVWQy51eQ67Fnfg592D6DkKSJKHTKdzQwcNwc6uPRzY3HEwRWoRupTqp
	2qQfZAUW3g64olqnCHnC2BApXbvijewKwqXNkmzY8ljU7JzGuXbYFb2jgMD+Wv2aK6Ps
	0bLOHKXt2ib3XOsTRJGuDFy2NP4uz0nfgJ4M3ukAtfZx0RlkEH46k4U18+pUGOnXEdyS
	QdRThT5mq3nrRs7IGH9xbhpU00iZlcwyY4LYtNQDtRDxS98WMB5ivmjIWUjtnQgejJOr
	fzVrUDGrknuxP7AoeNIMhTx3hjx7wo+ziOkmSN639tfm1pzgDqlMBQK2Xc3X4US1Dkd1
	si4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wKorkX7V4rI/qUzTbc4srZZOyd8YHFyDwAvIg78SA18=;
	b=lxuISZuVRcpWLX5z2fJx9AhV+jkpxGIUgMSjzAld0HSsEOQ0iTyUY+wEaQF6qdyvZR
	aGu9XMExMbuoiTES/nhB7nbsBNFoXodb+HZt0A6a2dYRxuSxzaBrTOx/v5qox8WyEDg+
	dSgw8s7nt/iucnc8MFkbhQtPHJOgbhwRjlJbf9gSMOg4oQOrWOdLmYfsXTHtxTd2tPyx
	IsWf4unsh8gO3muhD1BDygD0+aBRnIyneMRymT22bFUjUBDMNn+3Wju3/f95WXryenfZ
	OW/W/D+f8nmwH/RyrxZf/fpxoVqWtYlajhlo+vrNYvtdyIiRFukYirzKNH3Msouflls0
	S8fw==
X-Gm-Message-State: AKGB3mIf5Jwz04UApiuDqTNhNUXooKAP4bgf2+WeNnevrkCFlKJkd8fC
	Cu4KZlK7ZQmAabX4SNCp4ws=
X-Received: by 10.233.237.212 with SMTP id c203mr23410436qkg.323.1512500341822;
	Tue, 05 Dec 2017 10:59:01 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id y9sm433750qti.63.2017.12.05.10.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 10:59:01 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
	<1512153879-5291-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5b802a13-3422-8e53-3b98-8f916af8505f@amsat.org>
Date: Tue, 5 Dec 2017 15:58:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: Re: [Qemu-arm] [PATCH 3/7] target/arm: Add missing M profile case
 to regime_is_user()
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IaDJoTQbHPDt

On 12/01/2017 03:44 PM, Peter Maydell wrote:
> When we added the ARMMMUIdx_MSUser MMU index we forgot to
> add it to the case statement in regime_is_user(), so we
> weren't treating it as unprivileged when doing MPU lookups.
> Correct the omission.

Eh commit e7b921c2d9e wasn't reviewed!

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f21c142..c4c8d5a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8016,6 +8016,7 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
>      case ARMMMUIdx_S1SE0:
>      case ARMMMUIdx_S1NSE0:
>      case ARMMMUIdx_MUser:
> +    case ARMMMUIdx_MSUser:
>          return true;
>      default:
>          return false;
> 
