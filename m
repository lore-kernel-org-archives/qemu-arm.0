Received: by 10.28.91.67 with SMTP id p64csp2406754wmb;
        Mon, 5 Mar 2018 02:51:22 -0800 (PST)
X-Google-Smtp-Source: AG47ELsgT6RCNZVC50PWrr0GGyYKdOSzjkwb2+TIsU2H5MEA/yEO6J3nTrfcCcbB50e5/q4MlhaY
X-Received: by 10.129.175.86 with SMTP id x22mr8956284ywj.158.1520247082841;
        Mon, 05 Mar 2018 02:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520247082; cv=none;
        d=google.com; s=arc-20160816;
        b=lToGOOqIjbyzW0EsGOEbjdZSzPCJ8N8bR9RzHvbIbiZoqGcf5SY7N3N5YqQr2RQcet
         yh8cEoMJrTEYQlt82eQsjSNG1DafVPn5ZGh2YGJxDpTvaPwc8H9BfObwFQdG0OW82Y4L
         g9oQYKeVyEjdLzIKcp/bKnkv93vmhFWDd9qlbPBlr+hWf0EhPIf7QUzEHn8vwICjHjwH
         qsHYDMM5RKGfaDP2nWby50j8+2BBdQTSfKukHmL4K269qWPqmbhNlS35SBMEaK+SwE/9
         PtT8nfhv8C+UvUdzLLgl6N85p8guEA6NgxcIpWHn+V6/tOlxL2jQ3oM/0Q/1t0MEoaUw
         lUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=yDGoaX5u4f43vZDC8otyy9QCSKdmyYBBKQmL8NtWoC8=;
        b=zePJsZoAnwbc4M1yEAZWctA8G3znjN0qLfZs7TDpa3DpoPoMIiqivrmV45+kCNShcJ
         PxPFNd/yfJqoTh+so9i/0hPjzyad+E2u7RCXXbbLu8+FkRFvHOgF4zcUVZfQ4BX14cqP
         h16XSiqSiEB3vPb9zKzfGxWsxuFFhLyZg/A1q2pYGtknNmAQaFsTAbvRZzg4jotwSPrS
         RAM0/QAulRrnwPFz44NIHo9FgJLIFVlEX/a6kman3BK3DFhbG8wkQpgDZABShCfSVGUT
         5Vz5pvxeGGYpiDlNT+5nzUIAwQPZ1KdhhyUYTzMFzCUE7O8d8N9IUPdPEKPnpAbNWaNB
         YwKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NQRGGqxV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w14-v6si2022426ybm.136.2018.03.05.02.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 02:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NQRGGqxV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esniE-0005Dl-9T
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 05:51:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esni2-0005Bf-Gi
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 05:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esnhy-0005oj-K9
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 05:51:10 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:37794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esnhm-0005ik-Eq; Mon, 05 Mar 2018 05:50:54 -0500
Received: by mail-wm0-x244.google.com with SMTP id 139so14568147wmn.2;
	Mon, 05 Mar 2018 02:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yDGoaX5u4f43vZDC8otyy9QCSKdmyYBBKQmL8NtWoC8=;
	b=NQRGGqxV9/vabXXaukEauwFDLhQWMDSERHOOTPaEIaZuBKXh0JEniywaRmtuDQWCCY
	ljN1hEF0gvOrbvSMoe0klf+7Ch8Z8sx1an8S5ub/Y4RocV1Y4KIeZKE/wGcOdBPHWzmD
	LebcRTQLp7AtSNpjE0F/XbQAeN68CuT51GWziRTB6Xxz+vGDTHvvI5oC001hXT/V96qw
	s/sGlyEg/GpH5D1f3ng68j55xAb35aEB3Gd67QBSnYo8Je/7bhZ+EnRnSTxLCBBhMIJJ
	uefe/GDOgh/AlIWgcoY4/Kd8kxUm4nGBC2pttRLxxr9CRJlaPOIGdfg7jadqYowqFHR5
	EAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yDGoaX5u4f43vZDC8otyy9QCSKdmyYBBKQmL8NtWoC8=;
	b=MGhjJzYSVsNWIwNUu4TE2lAal1IDr/Y/lxkNVGoIlBLiUUpm4FSPcZPw5O7AHuCsKy
	bsONe6szQ10PejNsMPSsRlOx1xQczM9VlF3kD9VfgqIsIPNdgp677kTesYtCskVJJPmt
	wTItRIukpYYbHxQyemxr7z0LpPiOgde2GYxgUlLR5X1wxz+9FEIfAExlmA+e0tX5enVQ
	K3D8MGeEpnYyxDtx2BJHaUn6xN34W9VLbiW47Wp1J6aak5rEsSSdq3T5v6chrlip9+Nf
	72LTFZdaBeQgG5V+woSfiy+00oJN1Q+W8TXHcPe63J6baTPXKd5nuGPeFs29NWjAgnuq
	bgXg==
X-Gm-Message-State: AElRT7HuJUv0yuyLJTtkWdSnT26RzKTlh23GFNMoSYOCvGCfTDUWFOfa
	7BP8FfQiAJXL7SS0Mzxm1l4=
X-Received: by 10.28.128.137 with SMTP id b131mr8391063wmd.121.1520247053317; 
	Mon, 05 Mar 2018 02:50:53 -0800 (PST)
Received: from [192.168.1.16] (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	b30sm24076137wra.34.2018.03.05.02.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 02:50:52 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>
References: <20180215042900.16078-1-f4bug@amsat.org>
	<20180215042900.16078-3-f4bug@amsat.org>
	<8fd4272f-8c40-3804-8449-752aea88a7cc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5036928a-f7dd-ae77-9ca4-0aaa9d5b8673@amsat.org>
Date: Mon, 5 Mar 2018 07:50:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8fd4272f-8c40-3804-8449-752aea88a7cc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/30] hw: include
 "qemu/cunits.h" and clean unused "qemu/cutils.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HDvZA++ZTvr0

Hi Thomas,

On 02/15/2018 03:10 AM, Thomas Huth wrote:
> On 15.02.2018 05:28, Philippe Mathieu-Daudé wrote:
>> These files were including "qemu/cutils.h" to use the byte-based size
>> definitions, now available in "qemu/cunits.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/hw.h       | 1 +
>>  hw/arm/msf2-soc.c     | 1 -
>>  hw/arm/msf2-som.c     | 1 -
>>  hw/core/loader-fit.c  | 1 -
>>  hw/core/loader.c      | 1 -
>>  hw/core/machine.c     | 1 -
>>  hw/cris/boot.c        | 1 -
>>  hw/display/sm501.c    | 1 -
>>  hw/hppa/machine.c     | 1 -
>>  hw/lm32/milkymist.c   | 1 -
>>  hw/microblaze/boot.c  | 1 -
>>  hw/mips/boston.c      | 1 -
>>  hw/misc/mos6522.c     | 1 -
>>  hw/nios2/boot.c       | 1 -
>>  hw/ppc/mac_newworld.c | 1 -
>>  hw/ppc/mac_oldworld.c | 1 -
>>  hw/ppc/pnv.c          | 1 -
>>  hw/ppc/prep.c         | 1 -
>>  hw/ppc/spapr_rtas.c   | 1 -
>>  hw/sd/sdhci.c         | 1 -
>>  hw/sparc/sun4m.c      | 1 -
>>  hw/sparc64/sun4u.c    | 1 -
>>  hw/usb/dev-serial.c   | 1 -
>>  hw/usb/dev-storage.c  | 1 -
>>  24 files changed, 1 insertion(+), 23 deletions(-)
>>
>> diff --git a/include/hw/hw.h b/include/hw/hw.h
>> index ab4950c312..8249448cac 100644
>> --- a/include/hw/hw.h
>> +++ b/include/hw/hw.h
>> @@ -14,6 +14,7 @@
>>  #include "migration/qemu-file-types.h"
>>  #include "qemu/module.h"
>>  #include "sysemu/reset.h"
>> +#include "qemu/cunits.h"
> 
> Instead of adding this to a header and creating yet another possible
> recompile-the-world dependency this way, wouldn't it be better to
> include the cunits.h only from the .c files that need the definitions?

I was waiting for other opinions but I can change if you prefer;
meanwhile I'll respin this patch as RFC.

Regards,

Phil.
