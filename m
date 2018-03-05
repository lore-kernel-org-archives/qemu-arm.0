Received: by 10.28.91.67 with SMTP id p64csp2881347wmb;
        Mon, 5 Mar 2018 11:01:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELswtKoD1/rqQI1blGtjfLLU2xLYMUHV1SXv8y2aJ03qpVaZI/11C/qJAO3SuJCWABxzh/ej
X-Received: by 2002:a25:ea04:: with SMTP id p4-v6mr9516538ybd.431.1520276496452;
        Mon, 05 Mar 2018 11:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520276496; cv=none;
        d=google.com; s=arc-20160816;
        b=l9KJrl/jpbe24YjN+q55OoUqsHL1PC3RBrO9hSp8qbXZpWCBG2eJvP8SUxai8Tuwka
         ZQ//lV/E+GA2bKeMwp9ui80AN3w75A9NUsX6NdR+w3cptmr6KtMEy80xKcf6IDJCW2Py
         9CYvDkRhSik3VaTcB7TXv+w7dne6k229fisdLj7PtPbrtYuA2+KsuCvgqfnMFEk+AJ/W
         9gibaSGVQaHGmZZczHsu+RFJoDAHd6zA2irUjHiVQAkVq1q8qgmyzr784ljRvO7ISfXJ
         b+ZfwwGVH+rmTPJe5R/731Dg+mBuY3BL3oYotRUKeby1uRXukxPGghiVssOo++ZAGDl9
         gi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=4uag5knolMNI9/SSE9YG+JFW2q6UthfNRZtlecy9r6M=;
        b=NVX3I4xTvaBaYZhMGRITvTSQ8uB0mHh3mloXg+kZXuZxN/IC9nGs0iQcvcEFm2pexK
         0rjoy+lxe2TzHnw2o+p3rettH07fgVZ6O0cQeTdwT9b0WFxOHNVWAfk2r8InVyDc0MA7
         TeEWBQoA3Mkci94JhIMepuMx5oBee4YCfDjW4Pc0U4CKaZcU3ZQFaeF2Sb/iuYBr7vrH
         AtE+u0sPyPvzShGtPnjRfn839fCOVvJgBNmcxJbciVVx8YB3rAQJVEMUIbcatwVO5GUn
         DJT6xaYr9p0SzQrJM/adVbnZ3u1mirCO2XOjkf6/BeK5CG4Co5BtixD/yb2p0UKuTAq4
         cgjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fPZG0wJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b65-v6si2202446ybh.679.2018.03.05.11.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 11:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fPZG0wJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esvMd-0004mx-SI
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 14:01:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvMQ-0004lO-5g
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 14:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvMP-000895-BW
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 14:01:22 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:54768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esvMK-00084h-CA; Mon, 05 Mar 2018 14:01:16 -0500
Received: by mail-wm0-x22d.google.com with SMTP id z81so18023459wmb.4;
	Mon, 05 Mar 2018 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4uag5knolMNI9/SSE9YG+JFW2q6UthfNRZtlecy9r6M=;
	b=fPZG0wJMgsKaWFo+KrxMWuHntvUdGarFlTjFAEHgUhzxO2r+AORsxlYv30wU1YTypM
	lo+fmJyg+EzsiK1BfBkSLnXCjc05jsyfbZUv6oOpzauxzTman0oxEFQvO8B19yU4V4qO
	tW3bZ/KKP3FBdF5bAMcR500tlIoL8xe97TBbXf6KOez5o1+wgq0XUtRuw/IFXtA/lmA2
	ogn3IVKcJ+SLE+CGFj1VCd17O3td+GbBXR1rKRyjYGsOOtEuWDx0xeYm3Kf1MfCTUqRT
	BTWmrPSncsjXtruKRas4XeSnOWyBjUckN/RAkoCpN7+7R01Degr3h/GdYoUevP1Znpn3
	GU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4uag5knolMNI9/SSE9YG+JFW2q6UthfNRZtlecy9r6M=;
	b=nEUkFVKRdg5W/K6j63sVtcB6b9xQpNyvIM4UUhk28FX+pijJanx49Pg3oa5Vonnx6Z
	8ern71glk/IYWdb7ePOhoJ8HnIj9TzQ3Uhj4oyZGGyjwG+s0BQ1LDNcGKF214RkcRlYE
	lIif04uqANW0vAw8m+H5KWiWwcB5tR+ycv7eJ/oZg4fh7Jm0U1lk+5DhTuY4ZJIgLAub
	dXTG6Rco62Or/wyqoEW/RC3eICvYjkIAAi8uu59mYEgJP94dyZ7/iLsYW/qCu0NUj0Mn
	3eZ5ENzkJ5OB/i2vUb6I3qaNkcnZLohkhTL0Y4To5OYO1GWQW4Z15iWCNjrDRbAVH8zV
	Zk7Q==
X-Gm-Message-State: AElRT7EFjUvEJFyR/2uLOE09Oha3XrlaDQRi9H31bTL4Bd0wPDRr+o7Q
	5wAm2vBRAUBBM1IXy0iMefA=
X-Received: by 10.28.235.4 with SMTP id j4mr9767277wmh.52.1520276475086;
	Mon, 05 Mar 2018 11:01:15 -0800 (PST)
Received: from [192.168.1.16] (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	n23sm8075707wra.14.2018.03.05.11.01.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 11:01:14 -0800 (PST)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
	<20180305112732.26471-3-f4bug@amsat.org>
	<20180305185754.GE17368@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d64466e4-57af-ffb7-fb1f-837885e532dd@amsat.org>
Date: Mon, 5 Mar 2018 16:01:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180305185754.GE17368@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v2 02/30] hw: include
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
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Paul Burton <paul.burton@mips.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8CYVK3M79N9

On 03/05/2018 03:57 PM, Daniel P. Berrangé wrote:
> On Mon, Mar 05, 2018 at 08:27:04AM -0300, Philippe Mathieu-Daudé wrote:
>> These files were including "qemu/cutils.h" to use the byte-based size
>> definitions, now available in "qemu/cunits.h".
> 
> I know I'm "complaining" about bike-shed colour here....
> 
> Feels like just calling it units.h is sufficient - all our .h code is
> C code so don't need reminding of it by filename, particularly since
> we're avoiding system header clash by using the qemu/ prefix on #includes.

I like your suggestion :)

> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Regardless of whether you rename it or not though,
> 
>    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks!

> 
> 
> Regards,
> Daniel
> 
