Received: by 10.28.4.212 with SMTP id 203csp2008356wme;
        Thu, 3 May 2018 08:04:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrxgOyF0l5Gl0NAp8mBqwdsCyY6IVGZ3/Els/TEgYYkcHajfwqhvkfxAAOigJWg0xxB6ZUj
X-Received: by 10.55.12.13 with SMTP id 13mr17962940qkm.320.1525359849397;
        Thu, 03 May 2018 08:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525359849; cv=none;
        d=google.com; s=arc-20160816;
        b=GKLvOzsK5oSuH901L+e55CRmEMbUWb9OWjqtwjuwE9xSLkRPXhIi9AK/7mb0TDx8VF
         WjAq+9wX3tF59yCfaPd6CkBuw+IrrVaYm4biGg7lr5lRFsi3mAwRjZBaE4K24GzvmuQh
         yNBi/rNlSLnT27WanctJaHuMkznm+wkLjYFXPjw0F1+dJaELpEd0slPyybL7Cawhl8cQ
         H7X/vo8/6OC3SCS8c7xpSifW7++QwzGOvEXofQxx4B1KLSnsveOpdxOnc+k2XzfWkEUL
         BaO+l2KE9l02VdjCO5i5DGvX25ulICzBSzQXcJ4dx6dagytam3RALzPvyk6KiDeK9oyh
         KWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=b3hJJaRPrOVwoBGwn4Der8UGIA5UGy/D5C4JikSYAt0=;
        b=N7TS8vdCucgAp8thXEhYMHSKCe7V5wE2bdsU8p09ZafdmXabM5cCzETt12jLxfVWVl
         VvEOePY1KApD7ppl98r+S0FZKBK+Q4ny3kO6zAyLp62mVSFI8a+kUh8deiu780E0Qgsu
         /TadIhnfra6Q8THRSh4gYCkRtjmOXOq2sY4zohx+KohwAULY7OXw+6OoJmQ7GJ/nfQuW
         yOkReK4ze1OwCbjEuM8Zzrzuab23Vt9UcJgjAZLYEuGcEKEoX1SEdYGLNqY6/oxMaof/
         UM8ztS3oGV4IbG5N7FydTWPFW5vbvdyxcmbVp3DaPiqJjRRg10YAw4+N0e7TeBgzLnwF
         C2Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VIR0Za8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17-v6si1184955qvl.117.2018.05.03.08.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 08:04:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VIR0Za8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFmC-0006Ti-UN
	for alex.bennee@linaro.org; Thu, 03 May 2018 11:04:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFlz-0006SP-GV
	for qemu-arm@nongnu.org; Thu, 03 May 2018 11:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEFly-000540-Ft
	for qemu-arm@nongnu.org; Thu, 03 May 2018 11:03:55 -0400
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:33955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEFly-00053r-BJ
	for qemu-arm@nongnu.org; Thu, 03 May 2018 11:03:54 -0400
Received: by mail-ot0-x22f.google.com with SMTP id i5-v6so9304242otf.1
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 08:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b3hJJaRPrOVwoBGwn4Der8UGIA5UGy/D5C4JikSYAt0=;
	b=VIR0Za8FZzhtA0HzWAjeA8HbOSp8BAkw2b0Po1e9hiOjeHXhIISHsA+GVq8pRfAUCN
	ypu0T487PNqsLWzJS3avelFNlmwIWUTn3OUXJhSqdwuxZAAD6zeI7A8Jh2JkVSZVCil1
	TIr3LCN5qPteixUImKvFn+kAm8bV1Pma3ycJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b3hJJaRPrOVwoBGwn4Der8UGIA5UGy/D5C4JikSYAt0=;
	b=hFyh5IpilZw16waJSLh85vN/y7yhS5nylX+xbDzhAUrO/9PdfAQJ/KHsDZlwxXZJmv
	kGG21iqdsN7bWCVz6zPYutci2sTeMrijF1n9KpvA8n1YYTel9QMN2oxcPv/jG5xaowoW
	8AEPxoefDg1GcQrlQKjuJ3BSgeBVBgWXzJ/FCrPL8UyXYjCdLNP0XjeJflt24fFcc2n2
	uV6bsz0WJ6DEX3rieLS/rB7r/081qVaLpt16aUXqQCAD/9g4/TIgWtcZ4HuFTiyIF982
	6Qprf/xni8akRGjj89dtq9HSNiMw62BOAOBHlRjGhqH6Ylst4QRCcJq7kcAFYbifpQ0z
	ToIA==
X-Gm-Message-State: ALQs6tBhJQ4nCL5Qu1BPbb4xo0B4XJDy36kBDgld/iq08TFbewCtHBuY
	MUwVvLAKGog031v/g19863Inu21j6XYKFFpw43TBuA==
X-Received: by 2002:a9d:3bf5:: with SMTP id
	k108-v6mr17252700otc.308.1525359833704; 
	Thu, 03 May 2018 08:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 08:03:33 -0700 (PDT)
In-Reply-To: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 16:03:33 +0100
Message-ID: <CAFEAcA9nG0_Eq1QWsCJMA6TKbZ_tf6mXWCVTrkxrFO5-UkmEvw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [PATCH v3 0/5] arm: isolate and clean up dtb
 generation
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x9Lj3y3ek6D6

On 1 May 2018 at 13:08, Igor Mammedov <imammedo@redhat.com> wrote:
>
> Changelog v2->v3:
>    * drop already merged patches
>        'arm: always start from  first_cpu when registering loader cpu reset callback'
>        'ppc: e500: switch E500 based  machines to full machine definition'
>    * add small not related cleanup
>        'arm: boot: set boot_info starting from first_cpu'
>    * add extra suggested patch
>        'make sure that we aren't overwriting mc->get_hotplug_handler by accident'
>    * make sure that dtb_limit initialized to 0
>    * drop stale comment
>    * drop not needed line movement
>    * drop not needed extra new line
> Changelog v1->v2:
>    * drop "arm: reuse  arm_boot_address_space() in armv7m_load_kernel()"
>    * move "arm: always start from first_cpu  when registering loader cpu reset callback"
>      at the begigning of series and rebase
>    * add "ppc: e500: switch E500 based machines to full  machine definition"
>      and rebase 4/5 on top of it
>    * fixup typo in virt_machine_get_hotpug_handler() name
>    * add doc comment to skip_dtb_autoload field
>    * 1-2/5 are queued in respective arm/ppc trees and are included for series
>      completness so it would be easier to test, I expect series to go through
>      arm tree
>

Applied to target-arm.next, thanks.
-- PMM
