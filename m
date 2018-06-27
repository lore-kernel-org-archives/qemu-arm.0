Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5831184wrq;
        Tue, 26 Jun 2018 23:04:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe6PtaSiSTWoRNHj/S/wxVhvOPZ7Kr7HCdrvC0tM+gfVa/zClBeLquOJII48tNtSdOXrs0/
X-Received: by 2002:aed:3ec4:: with SMTP id o4-v6mr4163815qtf.252.1530079481050;
        Tue, 26 Jun 2018 23:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530079481; cv=none;
        d=google.com; s=arc-20160816;
        b=xzZJk8KkAGweoWcvXWOfkSqzsST5SDKuM0HpH+scxqcAaM/pJPKIT9FesVb1y0qZaS
         on92pwMn6PI/pC/dSq6fymcFTwV6Cs9DeFz/mklvIQB02NFxxa1U1YDAluzTle/frZuN
         cmiVBbPKvQ3n4HPPmbfK+mVClVAI9HPhiYOvCCwTis1pq0SNa2EDkjMqMiHp94Gqtl0B
         iQlAxYDp2TYZNVWdPed1+DYISZbVP7snIs2gaWw2Tj7zPx/wBN3qxSrCy8UOTrntNwaI
         iQSxPNsH00ulUBV6AeGFu2XZDOUHZ98Z+jCWh3oEy2/WtZpiZeJ3+vd3VEUSMHn6Netl
         gXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=5uhpoBxRzDKUBz3dgiA+xgijQsJhMY/j68iX1jNTYYw=;
        b=HHOhQnlN8yoHzzTPM7FMOiQj7eWIXFV/Z/EWoljplXJF+vshikykF6tN6mDTMzQFiw
         DNUncRG+ZfVNh7NrJbvUcsRRN0aqyqzmfYEjMbSAgPZnGPIDbn9/P7SFWwrux7kddN6J
         vOKWhA9LVVdHIZ8MwQa2MvFlYF9nVLcjRSdzoOa4E19tvzEFzbQFc9Tw6Inr3R0SlzFC
         GCEZOlA3hlopE8vDRwVaVYgZSgp7dCQVUBcWhmLckJfof8PLBFp8zAcBjqyQ+rO9DY6k
         wMjCC680CKYF1MDvYLPbTEROnFvrrVg2wlBs1JXMip74s4r75MM1Du4GAUVa4Dt9VSzS
         WQwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tr85/3sG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si2732305qtg.231.2018.06.26.23.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 23:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tr85/3sG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY3ZI-0004el-L6
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 02:04:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Ys-0004e2-3R
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 02:04:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Yo-00084U-Vk
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 02:04:14 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:36628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3Yo-00082g-Gi
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 02:04:10 -0400
Received: by mail-pl0-x242.google.com with SMTP id a7-v6so533935plp.3
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 23:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5uhpoBxRzDKUBz3dgiA+xgijQsJhMY/j68iX1jNTYYw=;
	b=Tr85/3sGU883PoJ4psUmvJTKhDdUgyd0Oz8RrexglZi5JatKcPW3V53CBcps/rksPK
	At8qpV31HtedNNXXYMeO09nOvOESzN1NEamJHew5wwKvq5CZ3DxNYlvjiBwJBcmfhySO
	NTngbd994WclDmIo16X2YM4FxnWdVajDqtunw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5uhpoBxRzDKUBz3dgiA+xgijQsJhMY/j68iX1jNTYYw=;
	b=YfEO6xN6Hi7jx4qMF0ljBvTj12c8ArCoCyAJaLbGxRc1EqKurrXYXBN7aoWdUGWURX
	zF4LUfRNqW/m4H994A/Rji2cYb3tx02zrD8X1ie8hmBj13SgvtsmSSWELSmZUb4T9Y5f
	6tsoCrim9h3enJaStpDIyrmdl/WQXAApWzmakQERjBL7hwwiyOj6GbjyNp1q9dRTu5kk
	ODyGByvpznvliCCw+VssjOLLO2spePNW0tJlEHF9w7XISJjUEXUAe45+lFAx4NFCXhHJ
	JQY1OYs8lAFu4jDIstzbnzGi0LY0UKw7DPzS2LPyTHWr4Y5KLPImDJFgo94LjVRr/Qvl
	QnHQ==
X-Gm-Message-State: APt69E3NGJ+7R4Uos/Cw7wtpwKbzPYLeJLqu015GooRFG2wvQ02E6Wvw
	TwgnPlsmO0qtynw1sHybSHwgxw==
X-Received: by 2002:a17:902:1007:: with SMTP id
	b7-v6mr4641240pla.277.1530079449497; 
	Tue, 26 Jun 2018 23:04:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	x2-v6sm5854069pgq.33.2018.06.26.23.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:04:08 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4b975f8b-681e-eb6d-9c7b-baa565ee4a52@linaro.org>
Date: Tue, 26 Jun 2018 23:04:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-devel] [PATCH v5 06/46] hw: Directly use "qemu/units.h"
 instead of "qemu/cutils.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Hf8NCZ2uLri

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> These files don't use anything exposed by "qemu/cutils.h",
> simplify preprocessing including directly "qemu/units.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc parts)
> ---
>  hw/arm/msf2-soc.c  | 2 +-
>  hw/arm/msf2-som.c  | 2 +-
>  hw/core/machine.c  | 2 +-
>  hw/display/sm501.c | 2 +-
>  hw/mips/boston.c   | 2 +-
>  hw/ppc/pnv.c       | 2 +-
>  hw/ppc/ppc440_uc.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

