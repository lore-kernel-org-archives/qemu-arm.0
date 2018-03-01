Received: by 10.28.91.67 with SMTP id p64csp1788970wmb;
        Thu, 1 Mar 2018 04:47:57 -0800 (PST)
X-Google-Smtp-Source: AG47ELveyxM3UEr5I7vbIaeA9fnFPgRVMM4GwucguGy2GkbRUZTB3Q5dWVyvCgijjs1og7ZxSdUE
X-Received: by 2002:a25:b94a:: with SMTP id s10-v6mr949871ybm.207.1519908477450;
        Thu, 01 Mar 2018 04:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519908477; cv=none;
        d=google.com; s=arc-20160816;
        b=ddHBXB3xUfJkZBNUkoT0ikRz1YU3nIK0qsdK323MGP2MQ59Zz/lAT4HB88a50Gndlj
         kEJMhbdOy5AUDTpkZHXFRqe6zRplM9i5X+SKjbhEIBOWGoc80v9B3Tp3uDTxnUaQynby
         8j1FeKfFP41EaBimnJv/b9nB1nQXuNQ5A9mhOU5FLycmz4UiWSAC1fVwYeOEqDq9ZQJx
         TOlNqgoodMotr1FWep4qnxihhcXwYF+uHHw3ockPKqVm31kpHPH2RPGjiouORwA230UG
         7Y6soDXvNMKju4Abcsq54YPC87IPmtEeedEAsrgWX/q9ZlF/5xVre6S4xj35rZWnuv+W
         lJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QA8xkl9YY4uiYNRkPHAHUlLyM87eu3N1K6YtWLqU3ec=;
        b=E1mDCzvvF0h1LyxHDL157Y8Woq4PsmGW2pp+UP2FzFuuPdC2apAp77mAI/IY22I0ms
         QuUH+ghrKbW15/nWNLFns6EvTa2zL3hypCI1ghqjL030RUkQY65tw177MZVkyg1Ky7ba
         la1A3/pN6GC1cNCtQqyN4HXYVmPzVQ+laXY4TOED0RNmN4ZoNz+/Hr35foB6xQDbIgVx
         ji+Q69hbHsyGxmVFGDP82S32b9oPMhFd8xRB4AqmcMvKXwgCF0MI1W8FQfikCl8MuaR4
         r0pVe6M112ZflWWK1P8Aq0Lf4TxwcZlx65Fa89pLu89dvQvQj66FnMGg7V73nCCZ1nPf
         eqfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KiZktIC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9-v6si622939ybj.737.2018.03.01.04.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 04:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KiZktIC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erNcq-0004Se-Uz
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 07:47:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNci-0004QE-Ek
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNch-00069G-Qw
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:47:48 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erNch-00068u-KD
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:47:47 -0500
Received: by mail-ot0-x242.google.com with SMTP id w38so5420087ota.8
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QA8xkl9YY4uiYNRkPHAHUlLyM87eu3N1K6YtWLqU3ec=;
	b=KiZktIC8BNhimYkayWFAPbIrij7rNlOP7nvx2XKXEbJhczx9sAZOL73Yq58mJJWHQO
	OYcAj7Nr0B/vpWZ0GIh408UiljbT9pcWaUYIT2tA5E8rdtQO5AddtmZ47mi2vNdRbQzU
	1uY7G4uhL20ZQVS+zGS0JNOGsqq3yICr7m6xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QA8xkl9YY4uiYNRkPHAHUlLyM87eu3N1K6YtWLqU3ec=;
	b=fx5E/oCInZx78fx9afpTrv6nWCn4PlBO/km0YhNeO1Vs80NtqO6E463QpXNmT1toit
	1X57B6b5pgW45UcI3A8cV9Od/i6beVzQGhygYfN6U2dT4nLiLZAvuGB2eDUgCPZyoslB
	NFmfV2HyOlPyI7Omj902RsoUNYsE8WxFaXP1MOhFDXH1WODinOpcnU9dNt8hWZGTrDUQ
	6BC3CRfwTgNwdCyL6SyM2HlVfesrst7RGrmn7VcN5Q8oRxKWeixf0suMuDhX9N3ANcGP
	VqIhFcZh3ipaXF+3dL+b8x4HN8mPEg+iE1agzJSSGWu/TdaGzsjwt1VNJo6x/BwSok/a
	mkaw==
X-Gm-Message-State: AElRT7FDWzhXiK6yb1ubOM09nepvWCiCEp4OOHt+CA+HQ/qUQwXsJUFA
	8wQo2uuIGoFvSAJ0imoOWFjhVlZerDXSSdRqIsqC8A==
X-Received: by 10.157.69.152 with SMTP id x24mr1105252ote.126.1519908466875;
	Thu, 01 Mar 2018 04:47:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 04:47:26 -0800 (PST)
In-Reply-To: <98d79ce8-3ab0-3c3e-f4ef-9ad381015daf@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-18-peter.maydell@linaro.org>
	<98d79ce8-3ab0-3c3e-f4ef-9ad381015daf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 12:47:26 +0000
Message-ID: <CAFEAcA9Xm6iFg-QsOOL__s2vdSRyRWZZTGb5xegbJrvCccdkyQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/19] hw/misc/iotkit-secctl:
 Add remaining simple registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dqW/sPuf9Uzt

On 27 February 2018 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 02/20/2018 10:03 AM, Peter Maydell wrote:
>> +    case A_BRGINTEN:
>> +        s->brginten = value & 0xffff;
>> +        break;
>
> Looks to me like bits 0-15 are read-only 0x0000,
> so, that 0xffff should be 0xffff0000.

Oops, yes, misread that. The relevant bits are [31:16], not [15:0],
for all the BRG registers. This is the only place where it makes a
difference to us, though.

thanks
-- PMM
