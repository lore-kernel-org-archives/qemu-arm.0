Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp464640wrt;
        Wed, 9 Jan 2019 02:18:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7VRouMGaYrCVxb1IdinbHlYdA1omxqKoZViinvs1uoBKdBdM02XUA61Lds5jQPrrybw6hG
X-Received: by 2002:a1c:c10f:: with SMTP id r15mr4973375wmf.27.1547029134352;
        Wed, 09 Jan 2019 02:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547029134; cv=none;
        d=google.com; s=arc-20160816;
        b=mTK5dPJtph4Nc/iA23nJkm0LQEsBh18QQ8kjwPA2KFr/WtENdw8mUTczH0iUq/7/pF
         kZR9PSGeOxpsTxzTKPpo/HZU24mbCOHMyETkaa5AyvOdFqsJCwR6yfS4skP/3r4iFHcj
         7TRMWldXx8IDxBopz52vTT2Gkv1kWaKpk5QG2Nggpe0nN2RiTzZe3wNEVVHdGZuUi5HL
         etfgrULxO4g0csq3DbX23NvtmS1EWMORF+iQgHnzpMEexprCFFb/T8Sc+t0+4vt+pzQg
         0a2ryIsCBo1rruvWvGGdrjYGRDYBFIK/Tt7eA+MTe5kQ3bJTEoo1fwrlz1npxIrwOew4
         kNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=YwotW0+6JI6NQWqYULjNpNEBadMyV2rEiYMbL1BGX+g=;
        b=eO4wfl+lHtbOAzgqgvd6m/UPrdMWc8spaAgyBzfM0XDr7ruM035jMMGLaXZjQq1ASQ
         WQ6wgAn+5YNRb/pMTWAuwOEh8+qX29iugS1x+/Sm8bOorUSn5GSdGfCJXyz+kPkJLUz6
         SYPyZdVo4xsovlzrs4sicZAbn6ZxLrJ8DdhloVXIbvQK6MubVFektbQn7SjYZcr7oKQo
         IDdHgA5bZRE6fGFQnnlObSobMuyohY+ycOKnkgUUQWDcwQNriSqtKFzGMnOYsZuMs9NH
         8LGj5DhmcfiIEgRBifQ3VAjjxsc1DO5G28WLM2XRwucETs9Hm/pxUDmVS43bjK80Tk11
         SF7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si8543157wmd.46.2019.01.09.02.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Jan 2019 02:18:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghAwn-00070E-C2
	for alex.bennee@linaro.org; Wed, 09 Jan 2019 05:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAwW-0006z6-G2
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 05:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghAwV-0008Rn-Nn
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 05:18:36 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:53563)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghAwV-0008Ko-DJ; Wed, 09 Jan 2019 05:18:35 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mnac7-1h66M301VV-00jbpi; Wed, 09 Jan 2019 11:18:18 +0100
To: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
References: <1546614146-10525-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <17de2d6a-7b80-ca81-f517-25cf68b2e2d7@vivier.eu>
Date: Wed, 9 Jan 2019 11:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1546614146-10525-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:AvG53ojYOyLzP8qXgkFsw9MZ0lenil3rzc68VthfaF5s0q/j+5/
	g1/IPPtx/37k/nKsSeIjKKWPSnDkaWDvf69Kltk0DY9RFA/l6W8ATccIq0zyEicCz+Myqpl
	HMPH5UYOzHefwHztWd9GwKi5wz+cSfcbF5q7/QEp0GtNsCoc+gI/J8tghAKpby0yv8QWv9M
	BWZcWz2v5MyNg3MJy3mnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lzq/Zmevk18=:n3xwgILXF5WMQne8qljo0k
	3WKRlSlbsLlYARWjv5i4Vya1Rh+C45EvFCeUot2r54AKIFqR/mPFrh44EZ5FD5ykGoayL5Hhh
	qpEPAbpmBCQKj+q9/NmFbKHFANwUp+tba7w62c1fOboPPeyzUd+pnASk+s/n/MVElZmNAsRbJ
	XHID3Y+QRghrOX8kvTfr3gqwozDvpkCUDJwZtnkPWMAwMVkesNk2l7PZBLI4VsuOQuSz6Yhf2
	dcggSyCzNmvLOtTpHoiBQ7R04DVKshulX+MsuF3YIk8GPOhixmduWFLOYOhl3SVXQoH6wN8ps
	k+9rwJ4mFgB1mGaJsRoVAn+5tw2KBZeHVGTZRJmjd3ILwdkCYDwKPrgyrVaclMIvXxwNuqmB7
	XOupnWmG1dPN2jtU4WFp/bAbn60gTzO4IG6VLb8WhCuobaJBS+ezsUPBG680E1u8Q2IAqJbw1
	tj9f2rsoqzeNcI4ZdU57bn/exVPvd+8jMnBmX0sRRv7OPXS0DcSWrxGBsVt4C+4+bPOUuYtzx
	WXbTzGm8T1iNlNwynkmTmLXqL15yb4KfBS7TUjk1DfpwWGxu/U/75BILxOHUrqig1+1PbeI9h
	UL3qMOc/FaCDRpeF94EdCQDeSbs7hTwryEQMR2mgm+tCQ2z0PEOncNs0FlbdB0qNbaLuPw2xO
	KBWcrA2szcORAqtLCdaH4dle0hF7WkjJU6slz6duxdqQhVePbyKLm04fKSVcJYWo7NE/QLKFr
	QGj6yThK747g2lDMP6N7PgBEJ9bC1Z5dXgi4Zm4fPpHNlPUnes05wJ2xO5E=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH] hw/audio/marvell: Don't
 include unnecessary i2c.h header file
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FGX8bcN/d7m6

On 04/01/2019 16:02, Thomas Huth wrote:
> This device does not use I2C, so no need to include the header file here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/audio/marvell_88w8618.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
> index 6600ab4..035dd76 100644
> --- a/hw/audio/marvell_88w8618.c
> +++ b/hw/audio/marvell_88w8618.c
> @@ -12,7 +12,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "hw/hw.h"
> -#include "hw/i2c/i2c.h"
>  #include "hw/audio/wm8750.h"
>  #include "audio/audio.h"
>  #include "qapi/error.h"
> 


Applied to my trivial-patches branch.

Thanks,
Laurent
