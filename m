Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp830455wrq;
        Mon, 4 Jun 2018 09:51:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI+xTBM/lxDZ7EfcUli9Ap//l65VtM1VUQU7/0inCDPfd+XiHHJRT0/cL7d/mVBbihbFQQg
X-Received: by 2002:a37:654c:: with SMTP id z73-v6mr20128610qkb.289.1528131105092;
        Mon, 04 Jun 2018 09:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528131105; cv=none;
        d=google.com; s=arc-20160816;
        b=z1BVVHnvucnds/CnDPI7cYV7t6bbhH4ZDqyaSZQoI2KGTlvVEUrCGQJfGHGdst6e8H
         ycRIjtZzssZiUpjxG2xNzHnQx19KKQ8AUU4pDzoAouLb4hMKhu0Pl2aDf4Qp8GgWiCxn
         BT7Pmzw/XCJjUQ9kputklaT2GUT0Pp4v2Hee58/ucHUhDJ0cOsvKz62lu6zfxpCW6BRJ
         816NW76kVMIiagdTp+gGIAps9c31nWN0e7WALlujP339hgWdWDBxk03CkL7ac/XuIIOi
         jI8gqrqE7GesZOVu/AmAwQNwMOFQKlAURURV8039a3hSbrVwpSf3oSbURqAuIx2pZn5v
         uoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UwA+Meef+faf13zcoC2fYqjojGmJeyJp0SXijmDFfE4=;
        b=tS7beuaR57cPaMRl1xMzxpfzgWM+dJX58CGU0M+JwUU/45C3ohdLAAlpSiI3ISBWEw
         GDBG1hUlHO8PhBs8sBPpLr0SLhE0Tr8S6hAp62Kus0fACZjVQ59CJZStS0RsalibO0RQ
         djugEuUnuEmHn8BV+iizhrcEy//S6nXnw2oBbwCl3KGVeynoxQjseg3J1Kw4Om4V2RYX
         SS5792duvLSHjGp28FXz5kcxJCYNFl11m650vvcPuRAgeiicWfSufQLMxRYsjXpr6haD
         JEYBnBkpvDzvOAIIyeLmSoXRD5jBK8kOA84wG/4QpddUewNVmOVXMxWp6/qW0X2hb5D2
         stjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gMIdLgcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si12886276qth.96.2018.06.04.09.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 09:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gMIdLgcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPshs-00053e-Me
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 12:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPshj-000537-1v
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:51:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPshi-0006fI-Bz
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:51:35 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:44400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPshi-0006eQ-6M
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:51:34 -0400
Received: by mail-ot0-x22b.google.com with SMTP id w13-v6so11085806ote.11
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UwA+Meef+faf13zcoC2fYqjojGmJeyJp0SXijmDFfE4=;
	b=gMIdLgcUMB7DTOtQExS+oc8sPYvGTEo2o0PdxS5XVlgeBbmFyA9eLd4VwbQxzvIoRx
	x2yzyVDvDEkO+jsgds8GxYWDzDzt5v2dJiiROp2CfL26SVcXEAihhqb6AYyB7DCU1wZI
	pdPJdgzKW7o0yHZRlWeYWKrg12+3QEzpoFjC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UwA+Meef+faf13zcoC2fYqjojGmJeyJp0SXijmDFfE4=;
	b=MW3rvaMm377JPNLVKLocVqTrkW+E1RGNNhQ+ADce9RB2hjRtSJQQCsOF5Qy7R2KenN
	RAH9ynsEWNAgXOvdjPBOEiTIxeL/bsxxz7+0GFTmffGbf2VcYoD/MFq3W8W5x8AmhuHO
	WQK5S0+E1NjCcqcoug6uhSNhXWiqSbBzFnwlDeMX9n7uS/nIoqfazI84DPQsIytTmZR5
	S82SCcnD/mFXG3vBiCQigI9iw9Ci3R25NEGuKZVDJC7sG0VqYXOmudaTq9+JzH731bXj
	oHzxqdpZDqNeHWk+DJz3Zle5cZ1unbOgJ2S4RNJdSBxJDsjuGMPM2WX17ClXQ6AXse1B
	4PQg==
X-Gm-Message-State: ALKqPwdktKcKKULpXMJJlCzG6ShtuiiNsokNgG1Ff2xVW8ZNjHefhaRF
	n4FOpZV8hFo2cEjOXya3JjmHLyr+oFS1coRG+GX+hQ==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr16228873otd.210.1528131093486; 
	Mon, 04 Jun 2018 09:51:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 09:51:13 -0700 (PDT)
In-Reply-To: <20180530180120.13355-8-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 17:51:13 +0100
Message-ID: <CAFEAcA8p4A6FxtJZ8Lwnv9sGkhSqD0wr5TcpqZU-LUyJwQEuYg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v3b 07/18] target/arm: Implement SVE copy to
 vector (predicated)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99WwDE5xfwCZ

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 19 +++++++++++++++++++
>  target/arm/sve.decode      |  6 ++++++
>  2 files changed, 25 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
