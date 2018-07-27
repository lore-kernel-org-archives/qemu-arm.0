Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp658672wru;
        Fri, 27 Jul 2018 05:42:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeS5weDOZRTX2qcsh69FfAfW9te4wIb4Y7TeWuXmq9IHQbSVjTLLzuvsMulpaPWjkzkwHFT
X-Received: by 2002:aed:21f3:: with SMTP id m48-v6mr6096531qtc.121.1532695334318;
        Fri, 27 Jul 2018 05:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532695334; cv=none;
        d=google.com; s=arc-20160816;
        b=ebma/TGltwyTFAMcyEyw7pkpop8FAoO7sVhu1ESs+vWAopQ1emsOyGaTH+fH7YDEqv
         BD27oIATirt31Hw42zidmI7/Fl9prFlkSeoZr8WJXrmFu5Xntju7n1FglmoyIk+YvD4L
         o+0Eq+ULlazX+Nc5Ok2kRXOM/HX03hV8jGVhbKXdDJ9Yr2BfxTIwEu/Or1R9b+1SgzjZ
         gGfuSPKOtXRzUL1Hj/8e9gzE+2r3x+Dk2TXkNq04ii4ARhh9zPZenmv4odo4Mgg5ub3b
         iYLBkyXj3ku23gPeI23j56gxYlTcGuTjJ4HJlAbVeTzzKjxfMUTal9DgEwkTX3Nj4rRT
         MTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=arRifTHpZoZ8k+EMcjSDaK3cTuvZx2l69kzcyn3yHA8=;
        b=vjalDkZfaCbG4SLekd/NGeEzHaiFXWjMYCwRuXPrqthzmVNLF9L0wyMrmVM9SqEP0q
         31zs1LNz0PrrMDJNZJLscnXaB+X31hXX11tsXUZYWhpnScb9cuHZ+hedRLk/ZOWHuM95
         bRwK1naALJKdp9nRjoQIA4+5j6ZDn2W1luHb3D07nnJy5RpubMbL/BXT1PVryrIQpGmt
         +2afVIxFYYje2df1q+MEqBiJHCsfkwlrWew83luOP0D0AeLJK2bCdwupOxYYDhj8DNfS
         seDd3uoqXSvLf1lpofzlBtzTG0IgVUEAUsBAAV8EqOLPjZzvj7PiuWhLBMRGIuVuP0LW
         WHkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mdxFbQWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25-v6si3932027qkh.82.2018.07.27.05.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 05:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mdxFbQWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj24T-0003kJ-PH
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 08:42:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj23t-0003Pe-LZ
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj23q-0006ur-J2
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:41:37 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:39835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj23q-0006uS-D5; Fri, 27 Jul 2018 08:41:34 -0400
Received: by mail-vk0-x242.google.com with SMTP id e139-v6so2364563vkf.6;
	Fri, 27 Jul 2018 05:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=arRifTHpZoZ8k+EMcjSDaK3cTuvZx2l69kzcyn3yHA8=;
	b=mdxFbQWjP9NxI6inCArnK+mEs24qz5XPGti/EYkK1HjShufxFTtvOKykJScvqXXHkn
	C0AOTIlqBHv9J9/4hnDoKQkF5y3DdCOhifP85pw/aJsXs5ycJC/XndjPFEel4BRqrRxo
	aiL5Gk778+0kA5d1tADTOFbtX6rsVk/4bsPSHHSOsLqDLGbdz5aPDOvM6myp/hlBG4tk
	uZ6I5UHEv3m78wdVY8yNwHy3IsJobQV25WdQkqwLsi5ibPwMu2oOCCYcQ75P24F9Wccq
	or85s7xDpTR6NfKkUHB5WJm53ak9eJT0vgUhyzkh9N1Zffpt8Uw9Z8AFmWXD4QTEXuFT
	TYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=arRifTHpZoZ8k+EMcjSDaK3cTuvZx2l69kzcyn3yHA8=;
	b=Ed9AtmyEZHq0QowltJxGYg2/u2YRLTfZQhw8Y4G6GZ3mWe/5Pk9gk11cXuw7fzX47G
	DaXYdA5G1dePcmiS2NmcipCf0Yrx/OKGNh/sZIG2Bbd+ViteZw0mlCxs6LEvjPfW4sVR
	j2n6tJq8CUGU8Qpmz/hS5AgkQMxLaY6TN+iq3NmgOetF6M9Vfi7i9gVkP3teJ3eB8mx+
	EjMQETsdeLpgfW+KOp6CY7B9HxaW1nU0vOMkTDHHttwVUnsbaJDGRPdy5tEU07CP8HN/
	sIKLIfSixm+yZdQj20KQO0yaBhCQHlv3zeJvB6TTUwraVyCvG+OPOiqmuhJ80o+XBLuu
	z1dw==
X-Gm-Message-State: AOUpUlEEWfZR1b7+XnN7ANyOQnFSbgsvPHpfWngajYH+cKMoGWni3+dP
	gpMQYK6kr+UQ0zIna9YY4XY=
X-Received: by 2002:a1f:3cc5:: with SMTP id
	j188-v6mr4026462vka.156.1532695293744; 
	Fri, 27 Jul 2018 05:41:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm758486ual.42.2018.07.27.05.41.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 05:41:33 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
	<20180727095421.386-5-luc.michel@greensocs.com>
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
Message-ID: <5f9537c1-9b8b-69a6-cbc6-4ca26125ef91@amsat.org>
Date: Fri, 27 Jul 2018 09:41:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727095421.386-5-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::242
Subject: Re: [Qemu-arm] [PATCH v5 04/20] vmstate.h: Provide
 VMSTATE_UINT16_SUB_ARRAY
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NbhzSHo24ouM

On 07/27/2018 06:54 AM, Luc Michel wrote:
> Provide a VMSTATE_UINT16_SUB_ARRAY macro to save a uint16_t sub-array in
> a VMState.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/migration/vmstate.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 42b946ce90..2b501d0466 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -921,10 +921,13 @@ extern const VMStateInfo vmstate_info_qtailq;
>      VMSTATE_2DARRAY(_f, _s, _n1, _n2, _v, vmstate_info_uint16, uint16_t)
>  
>  #define VMSTATE_UINT16_ARRAY(_f, _s, _n)                               \
>      VMSTATE_UINT16_ARRAY_V(_f, _s, _n, 0)
>  
> +#define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \
> +    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uint16_t)
> +
>  #define VMSTATE_UINT16_2DARRAY(_f, _s, _n1, _n2)                      \
>      VMSTATE_UINT16_2DARRAY_V(_f, _s, _n1, _n2, 0)
>  
>  #define VMSTATE_UINT8_2DARRAY_V(_f, _s, _n1, _n2, _v)                 \
>      VMSTATE_2DARRAY(_f, _s, _n1, _n2, _v, vmstate_info_uint8, uint8_t)
> 
