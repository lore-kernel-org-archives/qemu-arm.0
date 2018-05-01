Received: by 10.28.4.212 with SMTP id 203csp5200074wme;
        Tue, 1 May 2018 12:17:16 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpQESrR5BiUK4yK85vMnuA1coarkCi2jUpYO0lKzkghQHXlyxo8h6m3kHuJScOPTEUaiU+w
X-Received: by 10.176.10.26 with SMTP id q26mr15603614uah.23.1525202236860;
        Tue, 01 May 2018 12:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525202236; cv=none;
        d=google.com; s=arc-20160816;
        b=R05JN29TDnK+fTAqJ7qVamHmI6PUSGK3eQ8GFk4E8XCd8xRLF9M3k9AqZ3g6Ucv6Oh
         Sl8E/ANn1ESTMn2hIsM4NpJSSdyrwxcwsViKdCRXlNaOAhp0S0y3G8My7zAW+b/TpKTw
         cSaQLp9mXm62Ifw+DGFI61QOx1+qNiUXUUpT42Yfcf2NrdhOYjJ5bYUiGNPS1cMvmx9a
         XN2XUNvIQcVBJiqS4bLs9mA5GLVMDIw0bWbdNaTXB/Q6+VhJT8/fKYndzdrMRwEOoJVa
         MNgFEQuK4tV6lRVvA8+g7et27PUAhP9TAlLNcdkeb11izx7mOGcj3VViptpqU3hUEiT7
         61IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pJ5aoeiQhyb5dNezyvnbnfM8nvU/DZT2+3k5mxrNW/g=;
        b=gISDvYyWYJa9mIS2YxttwhNMSZYuu3NMflTJMHsTeQ4n+P3decVaTEeR6gvA/zpNly
         ngqzE4gYIv5E0s1+Cm8jGSLk4SpCU/uSYXwi3waogbBCJ6KusPHr9wPo3nTmm0YMfQXc
         inqmj4SaePfXrAXCTXRo7galOJq8REnCBIHqzh403G/6uPxYiXfSHZQVOa5f4Xs7FMPj
         oKJ4FTbiktXD1subZr3hLF3GkySKi8c1F7ouu1TVCB666P+8MegEcAz00+yyfV7MhXyy
         xzegpMmOKXbo9u62JKXwqPWhtkK8siiX0L7M6yXGcc9EECUv0wtyH0/r2IaI9oh1MVMY
         84sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=THkHr80j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o188-v6si4968060vkc.262.2018.05.01.12.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 12:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=THkHr80j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDam4-0000ZI-6Z
	for alex.bennee@linaro.org; Tue, 01 May 2018 15:17:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDalw-0000Z7-5B
	for qemu-arm@nongnu.org; Tue, 01 May 2018 15:17:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDalr-0001gV-BB
	for qemu-arm@nongnu.org; Tue, 01 May 2018 15:17:08 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fDalr-0001gB-1k
	for qemu-arm@nongnu.org; Tue, 01 May 2018 15:17:03 -0400
Received: by mail-pf0-x241.google.com with SMTP id w129so4325776pfd.3
	for <qemu-arm@nongnu.org>; Tue, 01 May 2018 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pJ5aoeiQhyb5dNezyvnbnfM8nvU/DZT2+3k5mxrNW/g=;
	b=THkHr80jwnuhdR9+pRQP1qaEwgxc8m4idWLYpjlZbS+q9gQVHviir1TRxM5EMZikCC
	oCwAjJsvcFQxJye+r54AbrSFsFZHF7eyG6dh3RHCEfXrk/udoG9lsN5uIJiKcYQg3j2Y
	XZzMkyjsLGsKglQ6CZfrxEYMH6BLG6n7rJGhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pJ5aoeiQhyb5dNezyvnbnfM8nvU/DZT2+3k5mxrNW/g=;
	b=WTn2tsPQMfOdX4npygfxzVCooJim+M18yPLSUJR/Ebgc195WNxbfXUXHcriHN4eiuF
	9lkTL7lY5R6avfjCONUbQvMgroyiNEAP04b1B11SPvsaVnfipdhfRtbwuiLk5xs+9L85
	jkU8Lu9/SQ5zmKbEnr3HKTFOPwEDJU3lPQoIWod6tgqwpNO7knAp1jkpixPO1sI6Z5W9
	XZ4Hay/hOUKowsNOzeX0DoTn2sH3aFTjfxwWayA05vwQWlEkTsDJqiUEVTtx91zrH/dO
	mjG+JZRz8yp0q1z2DhHw2CCk3H/TSoItD7HRdDqX6gYXvVt8UIaOSyR/OjQKECEw8nQx
	Z2Vw==
X-Gm-Message-State: ALQs6tB2EDcSGCy+aNrxNoCUwy5l8QVaVgesR2eLNgHo19G6KigXXT8H
	MNUoIVLTj4RcsCpkYepAllEaJQ==
X-Received: by 2002:a17:902:6b09:: with SMTP id
	o9-v6mr17748337plk.256.1525202221609; 
	Tue, 01 May 2018 12:17:01 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	z8-v6sm7799835pgc.13.2018.05.01.12.17.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 May 2018 12:17:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180427173611.10281-1-peter.maydell@linaro.org>
	<20180427173611.10281-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <61fc82c2-2b86-db56-7029-608082b92a36@linaro.org>
Date: Tue, 1 May 2018 12:16:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427173611.10281-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw/usb/tusb6010: Convert
 away from old_mmio
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
X-TUID: VDIAotlejCP+

On 04/27/2018 10:36 AM, Peter Maydell wrote:
> Convert the tusb6010 device away from using the old_mmio field
> of MemoryRegionOps. This device is used only in the n800 and n810
> boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/usb/tusb6010.c | 40 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
