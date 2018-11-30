Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3718349wrt;
        Fri, 30 Nov 2018 07:41:05 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XIF8COkX/9C9OWAgHruQy1ekBQ5uUjrQvH1tiXD0HiutvMIpmqxYVpN6ctAOagGMRlsF32
X-Received: by 2002:a81:32c6:: with SMTP id y189mr6088171ywy.306.1543592465051;
        Fri, 30 Nov 2018 07:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543592465; cv=none;
        d=google.com; s=arc-20160816;
        b=aXaHF+H4kFcijolkqToG/abAHjUDtbJs0utG+TIjy5p6kmZjyLmzAWq3nHu2u++vOR
         AhWvC84qbxmYISy8E5frksHOQcB8GNb5WLfVqv6QsVB9Fmk926kJh48LerJ4s1FvnRBo
         7W6sUXymPkgG6REUBtNt9zRPhi5CBZsQ2NZI93uIvWwMY8P3KzR1flIW4YdmwiuBD82k
         a1Lm5+Uc2Rm4SHRwDTXkbmzYqYKLIOMozz2yVTiTt2RYHzwML+ef+bkKUhpVJWfKb5tG
         2Yb0L9Q25GllyaDZltQc24BeYr707JcdFhoA3k287kMUSD0niCTkZxtw74H1NABfl0Mc
         nIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=nJ+6GGbbDatacEmhDqtZXWhLm1dL1/N1czKpX/Xt2Ck=;
        b=GuogWkyC1piy8N6pmkGGxTQRq6gXeriNbsy0r91UHddtN0rNVu0wMbZ0MQor0hShdP
         pGprN2HpGr+yPkqRYAX4eZ001yZiqBTev3eCssi432e33MaPP1KcX3bMcC8BecpE4SX2
         06bxADfFgEiXQhjpUij5zr+GnBh1TezlWojc/QZT4MUqy3pmTeUWYwxFwn6QgLxI+k1D
         3oQR1M4/LvPfu02cCPjzvJ+/xulAYB+w1b+RVAzuXECIauSjW3fM9gzx9LSbsRpIzyfO
         P9UGeuJBEsNA8NtRkOjWK1GqvdI7smygaSZobQULB+Ce/js2QOMNu8Yff+bckZq13wY/
         t7FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kKfqH7Pz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n129si3195920ywf.400.2018.11.30.07.41.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:41:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kKfqH7Pz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSkue-0005ab-13
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:41:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSktY-0004Ws-1H
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:39:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSktX-00056h-3l
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:39:55 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSktW-00056H-SZ
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:39:55 -0500
Received: by mail-oi1-x242.google.com with SMTP id a77so5056399oii.5
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nJ+6GGbbDatacEmhDqtZXWhLm1dL1/N1czKpX/Xt2Ck=;
	b=kKfqH7Pz74H5/URDJFF6tDLZULTuTLSYBUPl7MOps8As9bRO6beW47jk8673RXiXTU
	EqQ27yZeLqekWoNQDTPFrneiNYpAEt+UqfpH4wBKa/dQKLYzo54/uwUdbL89LqXfwxVD
	of8k+SsBYeXz8Ce2xc1dzY6lruapLR7FO2G80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nJ+6GGbbDatacEmhDqtZXWhLm1dL1/N1czKpX/Xt2Ck=;
	b=bEwBl8U9ji0dF7gry3lTnfDuOAy2w3mdgCVhAR7bz17Vq04ZIB9UxSOE2vaR4ILS0u
	5VaMlc0Ud57iZHl7igex5oXuQ+8AjPPgNmK/WiwVva4Q4k9BK2M1weL0AeYXfWwL0DkA
	Twq2ZgEMjEp7atFjW6lstTmdTrgVM5kn4tB8gyGV3Q30gM7nN+pg3zy6Iu/Q4BFqpTDq
	2QS39kWFI8ytwEReZkS88pCJIBlFE4ysi3/WwLm7+IahqLmQoujU89kDtOBFKuY7xXpi
	rGn+zOrN0c20T+EIFL/clfS7IE0qWxnLE19o4gXkQgHRDIyX76G/l+GNjosi1pmLTEZR
	N3TA==
X-Gm-Message-State: AA+aEWbNpN056eqV9It23pDt+2gGpQFH9KKNBs519glwg01Ed4sXs/f2
	5Yp4flSVaEM4NUtiw0M21sBy0iryWrqWfWHCPGOfXw==
X-Received: by 2002:aca:c501:: with SMTP id v1mr3412007oif.48.1543592393904;
	Fri, 30 Nov 2018 07:39:53 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-3-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543407172-16175-3-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:39:42 +0000
Message-ID: <CAFEAcA8zYJQd=f3Q3BSPRHkxe6RgWDACwdRx1+hDiGJ1-cjuNw@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH V10 2/9] hw/misc/pvpanic: Cosmetic renaming
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yugWR3ztRhGt

On Wed, 28 Nov 2018 at 03:49, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> To ease the MMIO device addition in the next patch, rename:
> - ISA_PVPANIC_DEVICE -> PVPANIC_ISA_DEVICE.
> - MemoryRegion io -> mr.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
