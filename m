Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3808452wrq;
        Tue, 10 Jul 2018 10:16:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpddi+fkQivHfoaK4M7puO5SrPlkAV3YpCX0V39UaLiu5qUlBTHk0hh/zrVe7V4P5m4BeeH+
X-Received: by 2002:a0c:81ae:: with SMTP id 43-v6mr22721294qvd.129.1531243008465;
        Tue, 10 Jul 2018 10:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531243008; cv=none;
        d=google.com; s=arc-20160816;
        b=wJqiClVsHBVH8i9Wid3wYlWGoZTM4H7hawRTzww0wBZG7tN/5Ly9KgtdU+H0iKwONU
         bEuZGEQ0KQ8meIlrl3l61H2AGkh78tXOk0AFM0QfYmyJRFGcOV0eB4ZFgRXAUf+IJ9pA
         MsY1HMfLcvimu7NXP46v0adBj0UYRGnvsYlGKzx8grJf/li/FiILEtLsOxSsMQzSNa0m
         7A0uN/wqUpv4KQXPk5MfHcxbw+M/ppIwt6JZcwhaNIO35CR1XFj7/TWCJmNF1t0zHsZh
         3w7310/452sF/FMScXvRTTpHsXmVeJl6rkCGuh0xhUTwLwM0fpEXxdDvRq1f7CsjC0xZ
         Wsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bc1fIFyoE5FfUK190CSkscRidJ64zMr8nt9IrD43mYk=;
        b=vH5/uphM16lX6ZwreiIQYvvBx8vJgwxuxwQN0Xatq9/m0pVK3QcupAWYN8QNrX6a/A
         diVU7MhNphjGEZBC35B3phCEAB4Qa/ip3dyUH1AVXJAyLZe/nTMk07K2UqES+kv3lCAB
         MHIY/YFV4gKFzBEIy6q0MNjZpF7aG4VVnsB28hB+qX+BubOTuvsBr8hyqK/oCXEUEXUI
         mTuVnpc/YFYjyhCuLeoYuQrmbSlekx0SpQpUQMwZeo4wb3DC8DK4jlE0Tm6wOgrCAOuB
         eFYx8v/FMR7vlgjrMBe9Fm0o4iEdFBTAvXKOGjmq64ZcGLbF/N7kv1bAuagzmbC8gR7i
         xzKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CwpgIGcQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o20-v6si5725279qtb.83.2018.07.10.10.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 10:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CwpgIGcQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcwFs-0000kz-0w
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 13:16:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcwEp-0000Rb-3D
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 13:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcwEo-000450-9n
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 13:15:43 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:42541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcwEo-00044h-3C
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 13:15:42 -0400
Received: by mail-oi0-x242.google.com with SMTP id n84-v6so44055415oib.9
	for <qemu-devel@nongnu.org>; Tue, 10 Jul 2018 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bc1fIFyoE5FfUK190CSkscRidJ64zMr8nt9IrD43mYk=;
	b=CwpgIGcQnA1byb4KrwPa7N1yt8wCwyYnHRel6+JnyP1fViC8HBGljnGMkeYfD7YrIx
	k/4X1xIF9OS9bEM3hGZNry7czF7y8E3g5NweCRwmStCYDtBUO3O3JmfXgP+OaPMe1mYi
	UWGxZ87AQBVnstnwDnjoIQh7HTSqtiIgW33u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bc1fIFyoE5FfUK190CSkscRidJ64zMr8nt9IrD43mYk=;
	b=ROcV99bdWhh8h0tTiyqld3wHde1cyvPKsu0xu8h3t+M2Eca6mnUCNXh0MlJgYrk9eB
	blK7GtSle7DKgar7F7cYA3LRHQ983TJ5szmeQ/kHpKbOoSYziDio/XKm/VIa2MbKokXa
	Le8CdK/MOEQRAKh/HbzLt/Za5I0XJSB4ieaxLQsoR0iRYuELHFctHdSU3g2H2DC0u/Pg
	sRi7lUV33VmxFlxQxJw7WV0uu23JlN+RNf3VukRQ6+7ux+eLqSba/DbtpajdicVarKMM
	DAYzWxFZBR2HyZw1tZKDf0x/EwoLcCfPCWqcTEEvQdTkrw/wiYlTleWm+Tp09ejIaYb2
	eQ0w==
X-Gm-Message-State: APt69E0QBFSyXwsv0V6FEtJ7P06sxazAYpV6tFG4Fwd4bZ8WReW1cMt2
	7j/BZi3cNYu4Fc1RE9AppIbTfGJSrYbLQbkI/CfeyA==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr25942503oia.11.1531242941256; 
	Tue, 10 Jul 2018 10:15:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 10:15:20
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-7-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-7-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jul 2018 18:15:20 +0100
Message-ID: <CAFEAcA-ghbRQ0Dhw0cgN_43VVFDtpfw2jYPp1y5daEqs1vOxvQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v3 06/20] intc/arm_gic: Add virtual
 interface register definitions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x7rrjRRqYRl4

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Add the register definitions for the virtual interface of the GICv2.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/gic_internal.h | 65 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
