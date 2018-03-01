Received: by 10.28.91.67 with SMTP id p64csp1786022wmb;
        Thu, 1 Mar 2018 04:44:33 -0800 (PST)
X-Google-Smtp-Source: AG47ELtna6RYC1PqOzrTgx/yNLihon8gU9xQUisQQfbHw9svtWI9Zq8Q7q/i766yREctuQt9os2v
X-Received: by 2002:a25:bfd1:: with SMTP id q17-v6mr903228ybm.283.1519908273613;
        Thu, 01 Mar 2018 04:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519908273; cv=none;
        d=google.com; s=arc-20160816;
        b=U0+VtCVuEeD0LULatJc5YeWkhUV+JBSJqaV7Vh/+m+sBINGdYHmznLV8bVczpjUuDN
         rWmrYfRP+pcwzD7CJ1eJWgX+tnfOQrULW+HGjZfx1Yoy85E3rnWnh2d3dndDPrGYgTuz
         750RTPYk3wtYoC4km0QDnzgj29YlLUPvpYjc6GEcKEU5+CtnAoviSuyhRG+spBj3vH48
         GsUcUpiRFe4dB3/hlhSi0eEZeWhEPchtnO0247cB2Fqj+UtpWCFpZ7TUUpWJtr5DVROk
         Lq3aQMtp5ABHC1KlfIK37iBd8mYwopfYUWhIKbf3XMviUe6JH1GgJiM8yWuleBiI0kML
         rJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TFTJYSvrE29HEsaA1ANE7zoAmWdWR7xakVp5FFsonYc=;
        b=Vfw8qkP5gwloyyRSvlWj3N07paKVzAUaeKtK7Y2pd1rF/Sdts70IeRbuj5NaRm5LxY
         4LWENqMUlz7+MEBLZLRUmBSAwW8OQ4jM26hEmZczd/6sZ7LlRjWz7yr6zw3dH7tn/isd
         7tCFHCFw3UoQJPyrgbU8dI8BMnmajuyZwsXNKZVPHyCmvenX40287k+rH7Y4pNePr4sI
         DBx/s2iyJYudbBfc32bsYHqC7v6INLZo8N8rO1NPzfBUd+6ndgVefQLHR0qrOhSedE5u
         7XtzWfkkEx3G0sOZxiehbw7l+rPsDXgFgLP95VGXCtX/gsyLRymGldazxyKc+XvCevIx
         DnXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FMd/ZJU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k63si318970ywb.181.2018.03.01.04.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 04:44:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FMd/ZJU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erNZZ-0002my-4h
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 07:44:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNZT-0002ml-EW
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:44:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erNZS-0003sV-Iw
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:44:27 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:34742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erNZS-0003r7-Dq
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 07:44:26 -0500
Received: by mail-ot0-x236.google.com with SMTP id n74so5430744ota.1
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 04:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TFTJYSvrE29HEsaA1ANE7zoAmWdWR7xakVp5FFsonYc=;
	b=FMd/ZJU8K0XUcESgGjxiCo+b3L6JKyeLB8zEeg1uK64lP9zR+XmT+UanpcO+v7roS5
	YdDHeIBMvlayACA52jk9YEiuZrqrqhZFWu5KOd4lvqQbkhrq7RckImhEweFzUbX0lA3D
	CQh4mqf6ggQq9EFffLrSSn0nMPpObJYYmBhVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TFTJYSvrE29HEsaA1ANE7zoAmWdWR7xakVp5FFsonYc=;
	b=DOZW09x7myWP2vfkrhzsApKbd9mSBtp5EImdj1vmV+1J+nkqEpKoaIJSP2eyOAwbpp
	ki6GbukGVxYC/sBnxjTXZEY4DSTbMY2qm6X+olQNmgl3OBK43G1gnOrhIK+tbKzr91Xf
	ZNcKxzXqZU1Yic0gFUX6fuq+SlitWpaV2FqQhCd/Fv9SeY6DwBfqlWL5SFfL4+2Put6A
	3GEiIzjlzWuSelmroyoYbFx/tvAzMcmCjq6/oFdQEBbInvJloZHcV0bsjmQ6kK/f/zFA
	nm6sXmHEZtSuqQ4qcIqNtebZrNmgtR1KN7ePELBhcebi28rwHo4WvJ4fS901sFSU+U31
	LGDg==
X-Gm-Message-State: APf1xPAQSsiT4vQgJQ7bRCJjUra0PVtDUWXv8XcBPjo/KqgDzSd3XbIm
	Z/dEA0sWPuMVB3cOX8ENWFqLBLKd3WQVQU6GjHdxjQ==
X-Received: by 10.157.27.17 with SMTP id l17mr1205293otl.294.1519908265599;
	Thu, 01 Mar 2018 04:44:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 04:44:05 -0800 (PST)
In-Reply-To: <7b95391b-2ef8-b664-5d23-15db04841e6b@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-16-peter.maydell@linaro.org>
	<7b95391b-2ef8-b664-5d23-15db04841e6b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 12:44:05 +0000
Message-ID: <CAFEAcA_xh+_3Uy1M9Uc8N+O-_MKoGcmn+JqHBgD5rXinV_Vv_w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/19] hw/misc/iotkit-secctl:
 Arm IoT Kit security controller initial skeleton
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
X-TUID: a48EES1c5b6+

On 27 February 2018 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 02/20/2018 10:03 AM, Peter Maydell wrote:
>> +        r >>= 8 * (addr & 3);
>> +        r &= (1 << (size * 8)) - 1;
>
> extract32(r, (addr & 3) * 8, size * 8) ?

Good idea, that's much clearer.

-- PMM
