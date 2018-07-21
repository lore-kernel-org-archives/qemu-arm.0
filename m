Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4080581wru;
        Sat, 21 Jul 2018 12:49:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeaXLT1dGbIcu80CHM0aXjrnsqgKZy2S0Fomf+48p7xPTkCOxZe0g5Yq620P/Tb2NX0Tj6S
X-Received: by 2002:a37:7a46:: with SMTP id v67-v6mr6076062qkc.188.1532202545561;
        Sat, 21 Jul 2018 12:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532202545; cv=none;
        d=google.com; s=arc-20160816;
        b=g9mfdopDn1SLN4131a4cz+59QKlxltsT2s9+TTa4Wdt4eBxGtM9Xmyn9t2KJvTm+29
         tTlsaOTBLtEV7l7GUXt1uhEy00UgKUWmF511Jz8jD7UPqmLuPj0X4jnRMwWgvKawzVAU
         4bibAI2Wo3yAW+vyYRgIaeVooEQGf8Ruhjx5p9lKSl9lPmzdJZam8qWTvLRPxUQmR6IX
         l+gM1kOreQHJoWCAjs66Axz2tApYaAcuxno46Lrd7kDlURCGS+sEAMgk5Yfjz+/QGu9b
         6uMbr9XRfTDIaELDO0gltVlzEQ+8GH+G5QfKrZxhdC8ixyQAew0xWR69+/ydyK7zf9uy
         8kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=xgRb1JIFG/lg+G94oVvNHBErMdyjOhTxuewJlmWK1lQ=;
        b=OOfRraPspSGxZXQRecZB+VCgxTu/8StJXZituvlir2iJW7QMjdOe5KIMBQJW9hP0T8
         LYY6JfGeZRpEq7UBkqnZ0QE4jhTu5aV7VgqP6/iMkA2Y7NVwARc9AwHQV51QNHqjWT2+
         PUEojnfkhffflAH7lHLAMI3pBdmNKiwHT+1dRJcHINjE9QZErfUBOvYApgVwz6SBxixz
         egPZhs8zEixXn7i7oMHLgh3IsncDlyBjmNqLoOP+aKzxtVXRnPIqhGjfobCSMKY5BTul
         OVpM9KtI/sQJjPEcWDLztA1Xz1vc8qisVhdGsElpypGoLN/jWb+9LmvHUwNUeIU0KPon
         rtmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nBQDmU+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p3-v6si4953061qtk.371.2018.07.21.12.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 12:49:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nBQDmU+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgxsH-00072a-2D
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 15:49:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgxs4-000715-Um
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 15:48:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgxs4-0005EQ-3D
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 15:48:53 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:42707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgxrx-0005Dg-V9; Sat, 21 Jul 2018 15:48:46 -0400
Received: by mail-vk0-x241.google.com with SMTP id t4-v6so7567427vke.9;
	Sat, 21 Jul 2018 12:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xgRb1JIFG/lg+G94oVvNHBErMdyjOhTxuewJlmWK1lQ=;
	b=nBQDmU+1o3sijyVhezskxoIAVpZd9e+PORV0ICcWzLRTGfheFFLomrJXuEIctedpot
	F/5n/zPNhaXqiFByua5RUQWEZAz5aqYPARJUyUKorSXGMWr+4nq0VpBgxMXXEeMcDJuy
	mFojU8/1oX0r4snipNUj/YneQsoGjpXKMoQR7XBcEGM3DF09qwgVqJbqqBuLJsHpWRER
	ZDTco8WTGWKnsWYga42IWta4r6Bmw1B2Y8GF3Kqsrq1g4nsEZY2qPfrK9FAwM9LpER+M
	4txOsmVWgBQTVVGDBzI0+/ITLQHmAXnzjFtZcyCQvmx2Gir/QFVQaXQ6HqqQmZeRrUjD
	XMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xgRb1JIFG/lg+G94oVvNHBErMdyjOhTxuewJlmWK1lQ=;
	b=FlJ+Xq+TAdInzCTDGmO8U7jSCdjzk/OxwzvNzmLrnLDrdK0IOlVdikvqnjFYQxYPLv
	oiXGQbxh1Cr07LrDzlYEhvJzZ79KjuNMBlgKfiEQ1rBkwIeBLKQbFHH8QafGJK+Ns+en
	QES17XUkfeAKmICqi66IZ/T96cSVogMhdQl62ewgqzGWt6GvXjFOZzs2GNvaqdExzdI2
	QIVy7HrAoj60sWeIRX2I8HOnn6eIAefsfCblVh6j7iP4NAmCIOfnAGyCp1vnOkMiiNIF
	8ys+K3/n5LUD2/u5f6hvnqwcxqQL0d6wggA5zhf8vMOmbnBxYq4K3ZPFh4gMmaCCWuK3
	SR6w==
X-Gm-Message-State: AOUpUlFg/sm5EupyI3yxGwriXlm9Zx1i53mlg8BH68FtTV0ovDKX1tV0
	9kt1AA7Bylot/tUQ28hl5IU=
X-Received: by 2002:a1f:3653:: with SMTP id
	d80-v6mr4223915vka.79.1532202525303; 
	Sat, 21 Jul 2018 12:48:45 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	h22-v6sm1142665uac.39.2018.07.21.12.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 12:48:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180720145647.8810-1-peter.maydell@linaro.org>
	<20180720145647.8810-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <e72f48c0-2335-42f1-87d7-d7635e5f109f@amsat.org>
Date: Sat, 21 Jul 2018 16:48:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180720145647.8810-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: Re: [Qemu-arm] [PATCH 2/4] target/arm: Initialize exc_secure
 correctly in do_v7m_exception_exit()
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
X-TUID: Tan9ixd+LQXd

On 07/20/2018 11:56 AM, Peter Maydell wrote:
> In do_v7m_exception_exit(), we use the exc_secure variable to track
> whether the exception we're returning from is secure or non-secure.
> Unfortunately the statement initializing this was accidentally
> inside an "if (env->v7m.exception != ARMV7M_EXCP_NMI)" conditional,
> which meant that we were using the wrong value for NMI handlers.
> Move the initialization out to the right place.

Oops

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3ec6114599b..efcadfc7fa9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7052,6 +7052,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>              /* For all other purposes, treat ES as 0 (R_HXSR) */
>              excret &= ~R_V7M_EXCRET_ES_MASK;
>          }
> +        exc_secure = excret & R_V7M_EXCRET_ES_MASK;
>      }
>  
>      if (env->v7m.exception != ARMV7M_EXCP_NMI) {
> @@ -7062,7 +7063,6 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>           * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
>           */
>          if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> -            exc_secure = excret & R_V7M_EXCRET_ES_MASK;
>              if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
>                  env->v7m.faultmask[exc_secure] = 0;
>              }
> 
