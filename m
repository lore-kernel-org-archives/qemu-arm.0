Received: by 10.223.197.9 with SMTP id q9csp1653590wrf;
        Fri, 6 Oct 2017 06:31:23 -0700 (PDT)
X-Received: by 10.200.34.88 with SMTP id p24mr2874066qtp.155.1507296683221;
        Fri, 06 Oct 2017 06:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507296683; cv=none;
        d=google.com; s=arc-20160816;
        b=gZOT0W1oD3s+Mh8W4Mah4R/oax2xMJ6R0W6AUVeTiR6FjM5gC5JrX1JaFE9XpK+WeB
         5T8KEOIFgxZta1KK6jwgqHTvwbi8URXi3YoQpvohiVfxdpF0WDGoCuvmPJkgzIyW58gp
         LRSDhqeatuIm0AZ3TsQJBLRIwzBB5sig7EMCp1/ByJJXc2EA6KNTUeCah1srJKJzfSiT
         IuFyBdj2SBY4BrmnLoJh8sI1CR194Ky62zi8YLKR6dDAvseapy6oJ/vrfrHsROa6fhVJ
         H3EtZWdab8OMlqVYRRD4/cjBtaFkdfpSuv40226vIeQZz0JF82XEe6iKV/m4A1W9yV96
         zMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VihC1j/nWnyKHQfpWIWzdG2kjFto172G740C8asLUeA=;
        b=WbkB1+Xar9lEvKGlrttNgOvUlss9AOHmAUeb+mAmSIHbq1biKS7tlcSxhYsKztOhN3
         vRVRrZeLDk4meMMzjIjPr7yrAecSzYpLAXpZS5/6Q86v0eKqhrojnSiK5RHWSXEVl0ft
         gLMkO7Y6/0g3dPCzdaycR7WuDF+9dKLVM2Ns1+RruLb2kR9ZorgMWw0F0te788jKuv5i
         yG+zDtpZPV7wj3n74D8r3foIQu8RezoxviNrOrGQRsIuVK8Im/5PXrAL9dBTONtgFlZ9
         hCjhI0blWb+z5Uz3ri+aIoU/zIlCZVTv0xHHSLAJehUPrOWZwO5jvp/acwx2y53grsaW
         JAMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WU4qzO4/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c20si843690qke.185.2017.10.06.06.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 06:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WU4qzO4/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Sio-0000Jv-Pc
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 09:31:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0Shv-0008NW-HH
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 09:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0Shp-00026V-IO
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 09:30:27 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:43694)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0Shp-00025t-9c
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 09:30:21 -0400
Received: by mail-wr0-x229.google.com with SMTP id p46so10583266wrb.0
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VihC1j/nWnyKHQfpWIWzdG2kjFto172G740C8asLUeA=;
	b=WU4qzO4/mLZK+V0k8cJTY0FQNkq3/69o3S1sbSq/ZH8A1qEvbseCRk2+6XgQN/nBAp
	TQqw1akAKl8VRZAs730/iKYzicV2Ws+mjcisBfFSl2Kv0BqJOLCxdGz7dmpkUp4uBVAx
	3sLsaT6s24v3RR0DOXPK+ilBm1BbFwD+S7kBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VihC1j/nWnyKHQfpWIWzdG2kjFto172G740C8asLUeA=;
	b=VXABMEvDUbA2sE5GgwGP4i4DU3nl/ubNygE7KFleWX1DiQSTrLfDdWGGTXfUfctYzp
	1maKyARBpjz49FSsdTx1aAbvzLx7lCpzGcm8TDfM7xyoVWVipBcjZpmaTReh6NC/w3ON
	FbToD8fmIjbjQW+BqsjPcSlL9RJS7HrNR3MIeiq0T1BpZEbyvMtM/jOH0ZGSjUHPngeF
	OQXVmlOzr1xpSnbqKAhlQI53mGjXT2xdWN2Ot34XAmOZ+OyfUoKXvJ01nHVzihkXdwfl
	KFDz8fjcFuf9B1Wcj2Gt9dyGZMC0SSQFRirxECukhrVj6okJPUnh6C5EFAZZFOk7q2Gr
	DLFg==
X-Gm-Message-State: AMCzsaXNXb21AqTa0ZUnFZDNfthxED69gLxeu2W9nXW92nPvHREK6Azo
	5fh82Q0B3RzokhDVKEhtS0t98/KW/3m+OHWqxlp5fQ==
X-Google-Smtp-Source: AOwi7QDalfz606HK2gEheZKIsdaRvuv+3274qtYNxV1Dhv4DGds/YH3nzggen7r43Snj1kyqfpK8djPrPkfWM12V7Yk=
X-Received: by 10.223.175.56 with SMTP id z53mr2300577wrc.177.1507296619867;
	Fri, 06 Oct 2017 06:30:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 06:29:59 -0700 (PDT)
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 14:29:59 +0100
Message-ID: <CAFEAcA8sL6T2bGELtx_-i33mSOFYD4Wdq3mNjsf5Rw=BTarZ-A@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 00/20] ARM v8M: exception entry,
 exit and security
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
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ziEH0hjMwF//

On 22 September 2017 at 15:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> Another week, another set of v8M patches.
> This lot adds:
>  * v8M and security extension changes in exception entry and exit
>  * the Security Attribution Unit
>  * SG and BLXNS instructions
>  * secure function return
>  * and a couple of fixes for bugs in already-in-master changes

Thanks to Richard and Philippe for review. I'm going to queue
patches 1-16 and 20 in target-arm.next, with the minor tweaks
suggested for patches 2 and 8.

17 needs more significant rework so I'll resend 17-19 in
the next patchset (there are a few more patches cooking
which make a coherent set with those anyway).

thanks
-- PMM
