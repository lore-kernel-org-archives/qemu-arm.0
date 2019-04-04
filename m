Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1225005wrx;
        Thu, 4 Apr 2019 01:48:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2gigRV0R4IOM4/lM6bE90RQHAtTFwQQjPRrcsY8p3gn7N8fVRWFpUFFi8GLlTSj4EyPqR
X-Received: by 2002:a0d:ebc7:: with SMTP id u190mr3642190ywe.20.1554367706918;
        Thu, 04 Apr 2019 01:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554367706; cv=none;
        d=google.com; s=arc-20160816;
        b=ntIXeYX+a1wfoe9WlTP0vl9TAXuq8lUjd/ARG4g+wPdM2bd/EQYWI2++M/H9TShbOb
         PV4lT7PWHbGVc/VO7whC4rB4wbfFQeXP8O0W9r7jOwXW33j+MiF3FbSX/QG+m+XL68iM
         oNYCrBq9ij1vgD6hGUCVgQ3DXtAw9kjXykVWYfVB/SlUBYpdn5i0ydyduMFjjduCWT0a
         i4CYGJuDPDZNOuWtwCNlV2dhmOHwRNFUJ7/NJNTq56CMLzpgBeM3UP9sv/8uB6b2w6Vq
         PgtdfhwAuLfnpabgb3Al9dN+iVNTz84+MrQCN8ZrzCGo6yn8TuP8M4TajITcdHZsxvxH
         5NIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUNYE1H4SAKmMgUdAVEfue0XrTkNTpvQir2jVtqq+Uk=;
        b=ohj59YCOzjeSqjrfa7BCBCnz+rV/3SGF91asu3lfKZnt1DCH8mGRxSBYq5GMw6ikXI
         po8pATY3qVGShgIh966CCki/fQHm5d8hLNTXxFW7dhIHwNSYxGYF8eLCSNqE2EPPzY57
         kso8Fo8wBvvZFDmqWv+rRYDLs0Tfy3NcVJUN7Fn8hh30SDstjpSjATPJxBXa7FmD4trl
         fZj8wDbC4nz1VnhNPUS0yjfUCP+i33yv4EFAyPwFAbXk/hKivw8TxZwrKIRCp9E+TjL9
         4o3rHNx4vcUZ6V51SAU6uVuwYIuXYcel731i/jK+m+TnzRZUl2zvuU2c4z4IKC1gAGqH
         xKcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mNsirA2P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124si9804764ybf.0.2019.04.04.01.48.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Apr 2019 01:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mNsirA2P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBy2s-00026s-FN
	for alex.bennee@linaro.org; Thu, 04 Apr 2019 04:48:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBy25-00025B-H3
	for qemu-devel@nongnu.org; Thu, 04 Apr 2019 04:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBy24-0006Gw-KP
	for qemu-devel@nongnu.org; Thu, 04 Apr 2019 04:47:37 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBy24-0006ET-AH
	for qemu-devel@nongnu.org; Thu, 04 Apr 2019 04:47:36 -0400
Received: by mail-oi1-x243.google.com with SMTP id w139so1213252oie.9
	for <qemu-devel@nongnu.org>; Thu, 04 Apr 2019 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kUNYE1H4SAKmMgUdAVEfue0XrTkNTpvQir2jVtqq+Uk=;
	b=mNsirA2PQFsqXwKQbtxZqL5Iwxr0i8jgHI28WNy/X/CiFC2qWi/HHqYfs0UBDTzAgj
	GEdIAXjzL7bXsWHaP7W+ftaciRGkM3CGWBhhFziBZfVC8rqn/m2sHIsS4cjUIxCfICX8
	5tY6OA1BsixyV3/2eP0/e7KSj0LelEtpFstQLpZpK8XQatAS2moGFK+yJDCPqmqSTRGn
	kRYyO16SS/7nBp71UJfm2wrDkEHMcDwVAfUrIUVDmT7zjVvu6kpRT0zXq5GSH5jzmIYQ
	Ydv4lD0BNXUREndfRL1AR7s17DrGLGmvDc/enefBkmlql8EACc3GQO/jjf40mh7mplvz
	UAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kUNYE1H4SAKmMgUdAVEfue0XrTkNTpvQir2jVtqq+Uk=;
	b=hEK5nZob8iwPzg6x0vktIhRG2FXjDoNdDjyIGM1R6nqGjw4pLvIukMHrhZE1noYhQr
	BGiIKpx2825WlwkucaZHf9d288/pN+jn1ceBV9oqwLnbHRC7Ew4vsoENeyVf8OXiBfPZ
	TzEjYZBF+MKVKTWbaRubUHAcKn0MhJEpaQQCZK/PlMjDcAHNEo0nIdhPDS5MgOL8hdBC
	3iIeh6mmYS1AgD1IYkcv0qB0NleYB1z+ik54UrjMEJ6Fayh5gKLPKDs7gDViAiTtZUnm
	QdbDW6nt2BLRz0zxGbMD+xJf743+9bUkWjDwdxuB998cTwGYK2OGQSKjBFIHax5phm0P
	A/gw==
X-Gm-Message-State: APjAAAWhAJrHuSWZmrHC7ZxD7EYRW7/Q+JI78x5NstQy12CnO/0lSIyA
	5O+kc1YoL1/+bulO/3KIj1+YJCnNLOPgbuAOI2xylg==
X-Received: by 2002:aca:e054:: with SMTP id x81mr2572192oig.146.1554367655290; 
	Thu, 04 Apr 2019 01:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
	<1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
	<CAKv+Gu-aZeYwegzFQ7pPqvm28ySR5xC6rZh8FBvQaWiNykgPEg@mail.gmail.com>
	<CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
	<CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
	<CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
In-Reply-To: <CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2019 15:47:23 +0700
Message-ID: <CAFEAcA_gA0Z1+K=TiPHbNz2XaCexujYvuqWBm3BBXHTtip_2Kg@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v6 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/UzTBKaOGVY

On Thu, 4 Apr 2019 at 15:27, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> I would like to wait for more days to see if there are any further
> comments, and if no I will send another iteration with memory map
> slightly changed.

This is on my to-review list, but I've been a bit busy with work for
the 4.0 release -- sorry I haven't been able to get to this yet. I'll
try to have at least a first look over the next day or so, but I can't
promise I'll manage that, so please go ahead and send out your next
iteration whenever you're ready to do that.

thanks
-- PMM
