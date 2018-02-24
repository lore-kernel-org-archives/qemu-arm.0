Received: by 10.28.71.27 with SMTP id u27csp1383204wma;
        Fri, 23 Feb 2018 20:41:25 -0800 (PST)
X-Google-Smtp-Source: AG47ELuIW/2mf9kbqb927QWtORhkeyRd1VDOm0fqf1GmQ/zxlSbWY6GcjuYz4+E6xc/i55cyMIyM
X-Received: by 2002:a25:81c9:: with SMTP id n9-v6mr2649345ybm.50.1519447285040;
        Fri, 23 Feb 2018 20:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519447285; cv=none;
        d=google.com; s=arc-20160816;
        b=sU6M5abNQ4X9gcpNkIvEqIwzIf9UkWHpHfH0lZGct6RmGt+yjGwpoJ0Dk8pHyrNZou
         N4vHLTKe4rVO+ikuWor6JTV/iXLt32PNY0slEvK+fbGPe3h433RIVkn5KzhgslGfgQ1j
         fEAvlzLvm3iMnsvxhnVy2MY5nDHYEUX6rJOnqpTpIBUrTKn+SDXHdz9jrDbkBnj4cRl3
         mqSVDkCA5LnVXgFxSNQ/a0f2MWMc0M3g1ZgyvPUl0k7nEie0t0gnU/N9qUICK4VERdVd
         HAyysE1yvrS+SdqROZHr9SePSFMJ3onp9djNny+3zddqMOQRHWZbHd+R8A7qYJS/FBa5
         ku4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=2HVFRKV0Pz8UWTtfxiXQuQIx2m543/S/bMAfQSJmxDA=;
        b=jL6ie6th+5s6YXEfCwHYOPLElV2kbxfi4hWRhc+TaqvY3bTu9/LjfUZfdDkBx6lcTO
         SVDTZ+lcmcSDWYHRGFTBuWaLHAZAJEI9tY9TrOvZmY3Wf9J7L4bzbBx6fSC7R+Mw7n73
         bEClcjbu1l5r+HoKUTJmc8Ol/cWlQxeoOMaq9xI4/IF53zdzgBX4BZcH5CXOlMP54i6c
         0QFXcPsDn5vgebazCV8BI4HozO8nGZzPWyy5YkRxyMftLyRmWmJwY533TedGtbXfYTJD
         7znqipZIhNcsfJysWIZQ45Fzm7wgM6v/Qe3ca4yRgteOhSx1CKoYKiLCKzDiz72vTHmr
         ggVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jQCbJ8i+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 128-v6si691154ybn.214.2018.02.23.20.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 20:41:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jQCbJ8i+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epReG-0000Xb-Fg
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 23:41:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epRdw-0000XN-Cd
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 23:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epRdt-0005OZ-8J
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 23:41:04 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:42809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epRdt-0005Mo-1O
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 23:41:01 -0500
Received: by mail-pl0-x242.google.com with SMTP id 31so6076719ple.9
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 20:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2HVFRKV0Pz8UWTtfxiXQuQIx2m543/S/bMAfQSJmxDA=;
	b=jQCbJ8i+MhnALOqb5GGkedpa6hOQtk+nFTqjwlkdi9Gs+z/RTAm3p0yUaXaJe/4UnQ
	BZhyutcdRAaBMbdmDXufib7ces+QxccBwcZGopOnA7+XGGMvWO/TdVwZmjOCd36/uyog
	Uc5NFijZl8015iAurpYnWC/YRCxA9NYWpv5bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2HVFRKV0Pz8UWTtfxiXQuQIx2m543/S/bMAfQSJmxDA=;
	b=VaViprnp0GXzqCcHEdrBVKYlcqvuTn2wMBfIhjAhvsSyOnaD2KGvCcc6Dc7ktz6HrH
	rNQp6XXO6p2xGsd37BOM1MefAWmi15y5J6u2mbq7jDb43L7a0s//euUC0EamzB7C3md1
	Ji7AAOATWPms3FwT+gFvmwlrq7eS7cQDDz/MgP6iZp5LLKOJBTtfqe8w8AnOgY+LarLJ
	JFh7LLf2EswZbt+sBNx382EJpf9TocGiZC/VU9U2zd/dacn6g8kZd7yb0YGll3iFXttA
	oa2DC4+JXrOWH+mOGI+DH8cGg8XdP2xtxobJ6BFcpW7IS5Q9XwmcQTZeLJKX/ZkwTYyB
	dquA==
X-Gm-Message-State: APf1xPA7H3560fXQGj2TnGCHmbMChntHf1Gc2YcdEJa6/DmC3Gnn2DvE
	XxN4HA6aDOMxLXslidFHoV+3Iw==
X-Received: by 2002:a17:902:28e3:: with SMTP id
	f90-v6mr3829593plb.355.1519447259786; 
	Fri, 23 Feb 2018 20:40:59 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	o64sm7342260pfb.143.2018.02.23.20.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 20:40:58 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16ee379f-16b3-ab78-edf2-0d1e005221c0@linaro.org>
Date: Fri, 23 Feb 2018 20:40:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/19] loader: Add new
 load_ramdisk_as()
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
X-TUID: lsEuDbqe25+o

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Add a function load_ramdisk_as() which behaves like the existing
> load_ramdisk() but allows the caller to specify the AddressSpace
> to use. This matches the pattern we have already for various
> other loader functions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/loader.h | 12 +++++++++++-
>  hw/core/loader.c    |  8 +++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
