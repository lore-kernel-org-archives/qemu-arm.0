Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp717277wrt;
        Thu, 22 Nov 2018 05:57:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5cxz1Z1WII+NM73Glq6/ZiSvk+bR7GTCGHrtrDWYEzYF1a8M2ZUm/hZ+go9/VXZQZqB+rl2
X-Received: by 2002:a25:b89:: with SMTP id 131-v6mr10826217ybl.262.1542895027104;
        Thu, 22 Nov 2018 05:57:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542895027; cv=none;
        d=google.com; s=arc-20160816;
        b=KaFYYEybt0nQJMwKcs7El4NEIgHk3DLuNCPwaj9rF74ZfAf3VJLT8DGLLEMAlEx1r/
         OapEtA6OxrhoWSeT5tOptvaGs5En9PvTRXPaG77QuvIsWHnYA7Q+aH3y8TcZkNveXlVS
         E29M4f+8T9YkFDjAa4rA5qivZ+23zeI+o5to49nOjWwJTeeAOPXOayWOq6fCZUU/dDxq
         ng1dIQ5mlrkQkwqT3Gtt3+wmsV/Puj/31URtF9KE5Q26om9DOJwHl9WpyvWH1MFxH7AN
         RMs7bJ5Wiwyna6kHPOl4jKFCZAofuKsmEKKNOkz+IDZChTSq6kMb3NgIleuDh3AaQ/ad
         PBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=oVEou3cnEA81fmcTTeckocpV+OuNGizNMU/1Mo1qSrY=;
        b=IWUyFa16ssUM2f9+tunkILAP1hupOSQR4Pxv5bpVGQZFp23Kq+3rAnuN2mgqyzj7Ca
         am9h9nnyPER7n70/C8zJQS2DaOJ7Qf1akrxjOyMzsnysYXLhwCH6BRhufwvOq2mPYXG1
         HjG+flBmhfLvoVFEh9jb/s6iDrMTYEkdxungLwuJvWUpuMCKjrxf86Y5T02gT8VkpPvx
         QGXLEe5ojXb3BenMSM47c7KCNnSCgOPqXFCEePxL2uqI3uKWBlFUGOqaPSaIwJuF5+1q
         PEwgMyHkLNcfuuJggEOd8omzHULYGwjhIqmDTKqSRRjBJKSdy5JxSmxn0mYG057BHFAb
         jbfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="A5D/T0j+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n207si8991719ywd.335.2018.11.22.05.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 05:57:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="A5D/T0j+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPpTb-0007a6-1d
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 08:57:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gPpTK-0007Yn-7X
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:56:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gPpTJ-0004mC-Dm
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:56:46 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gPpTI-0004ii-Vf
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:56:45 -0500
Received: by mail-oi1-x242.google.com with SMTP id t204so7517825oie.7
	for <qemu-arm@nongnu.org>; Thu, 22 Nov 2018 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oVEou3cnEA81fmcTTeckocpV+OuNGizNMU/1Mo1qSrY=;
	b=A5D/T0j+VlzhQbEfjbq+aCCmqEhKUfZmMnhj9agpzVh0LVePmYs+Ao1sdwRK6przv4
	L15MxYm85mfLW5N0ygbu1ASUAmmgJs+vjSRj8rHm+qTIgZFy8SlXz2k5FFcf0uZENe9Z
	ei+Kvjhdyupe5JDFg6DwBh8vVCM6+pUK8zuUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oVEou3cnEA81fmcTTeckocpV+OuNGizNMU/1Mo1qSrY=;
	b=Th/EjEGpt0Xkvygyo2FqE/+iw11jJkqzmUS43Q4bUu/6AQQBOtwBBhZkUMB4ufrHWA
	pP/TTkOFTWs8OZ5ai44eeM4nA9qiTzagoGTv9+lbz6hsukECoDP+D07Gow2R6OEL0O8T
	nFTdqliwEObJGBfN+/qAk2sghlX4rU5LJE5sEnArCiVxLMJCc4swFSETS7JuVgfRqgYz
	bj5b/zj/nbZJPZRwmX3kqm77GqCLxGNyQKLMOBDDjoWo4O3wZXIogMjeblQ57JmcuYLt
	QjM23A/zRYq1Vpq9m9o8sM3Nm5dmF/siafwLGx+yddrS16q3eOIN9a/kR5HnA6xOmFbg
	jDzQ==
X-Gm-Message-State: AGRZ1gKcXkGq32KvHvZvO+lCwtsxei1QU+LccjJsWXjhHUMKK5IpLKRA
	NrN7cEcseXdxHCNMe3tLhOXXFd8AtIb6ejoBZVTqEg==
X-Received: by 2002:aca:5ac5:: with SMTP id
	o188-v6mr5830460oib.146.1542895004131; 
	Thu, 22 Nov 2018 05:56:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 22 Nov 2018 05:56:23
	-0800 (PST)
In-Reply-To: <1542782568-20059-1-git-send-email-thuth@redhat.com>
References: <1542782568-20059-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Nov 2018 13:56:23 +0000
Message-ID: <CAFEAcA_zeAgAcsVX3=4ZVOxp6Vye7irNABrdzad1HQOMHo6cBw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v3] MAINTAINERS: Assign some more files in
 the hw/arm/ directory
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9JFJ89DBRguS

On 21 November 2018 at 06:42, Thomas Huth <thuth@redhat.com> wrote:
> I apparently missed some more files and even a complete machine (the
> "imx25-pdk") in my previous patch... but now we should hopefully have
> a completely coverage for all available ARM boards.
>
> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3: Dropped "ds1338-test.c", added some more pxa2xx related files instead
>
>  MAINTAINERS | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>

Applied to target-arm.next for 3.1, thanks.

(or have my
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
if you'd rather it go in some other way.)

-- PMM
