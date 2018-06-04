Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp848886wrq;
        Mon, 4 Jun 2018 10:08:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLdHPTJQCZ07lCwT8P7DTc9u+nqyMaDLx7yCFoKrgOAVCOdTQkwO4/LLwWGQKTa9N1B8feH
X-Received: by 2002:a37:328f:: with SMTP id y137-v6mr19275792qky.198.1528132138191;
        Mon, 04 Jun 2018 10:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528132138; cv=none;
        d=google.com; s=arc-20160816;
        b=IaliGRfoKext1D7Zdcer9N4bOqUX7WMwq3O0dZBCoepNnVpP54DmTnsTnhhy5haNpj
         kwrqhY+PA9pbE2peRWJodmWI2uhkt9lfXZzs8xuihehTEKQ0HOl5thhYdGgVloyoEqKN
         4PnHropwuibONRKBygOaiCM2s/Q7McFd9EII5K0goqavBy+A0YxDUwHWi4qZ12iXsxsF
         JXHYwZk0WDp/tui1HfhCLhPxkifFNltcB/8E4VbJOehjkpM3yVwbbYJjmQXk9aMXatc3
         x0k1/0WGkhn9rgugG20AuIcFALqz0teW9unGiU6Q8XYG9AfCOnLzMgFWF7qhuf2yh3TU
         1P7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CnyVDGslnBaXJRD7d5hO+PFcVJTIgfP4LFuCVNemTog=;
        b=UF0BkxJbu2Prcsi9NcPpMEh2CORePBx9BOryI8EiBWqi6ufz09zmaIyqycjzfFldLd
         z9SXvjvQj1TY2MnD8FTbLE9j0sa3BcsHiw33Ll9yN8Jz2GdQDF2LW5RZ6tY8SWgVBcuj
         TsKR/3sv43H5h6PV779U8SFtuwH3UFAYyFeaAseBAD5hzZ4tMqltxuZMxwiw8icVRTcV
         x41pt2xjPRt9tb2VeeKzQwz07MwecTKJqrPdRSzFg66MMlBmqPD1C1emsv/iE8qbHvRm
         ameMRxFj4cThnoXPOQo9jPO5hNF9/Bz75SSrT3YSmhgFY/JlWd5l4UtCBua/laL5Onop
         GFjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M7nkfCFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k57-v6si3077916qtb.8.2018.06.04.10.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 10:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M7nkfCFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPsyX-0002Yq-MQ
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 13:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPsyK-0002YX-F2
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:08:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPsyJ-0006th-NG
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:08:44 -0400
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:43152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPsyJ-0006tL-9h
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:08:43 -0400
Received: by mail-ot0-x233.google.com with SMTP id i19-v6so7999941otk.10
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CnyVDGslnBaXJRD7d5hO+PFcVJTIgfP4LFuCVNemTog=;
	b=M7nkfCFT4sqLBhsWweUJid6nrIUfQrc0oyrphqGOq6SfBuxW947h0MELPQFIxRJYuj
	15e7+7gFiBRv9sg/UaW39qHYypl9WqZKfHO0COITkGxCbcaMc8yHxIzo72SyCO9dy1tG
	Pklb6wu8NZKPhLO9iVG+oSrub7JMcf4OjOBdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CnyVDGslnBaXJRD7d5hO+PFcVJTIgfP4LFuCVNemTog=;
	b=Xc2vUDUhgAUqAtPJLTKfrfDlWNLfCr88FuSXBBBtji0wz5Mgl/mQtVsd3yzc2RhrWe
	lI8+Wr4POGC7nWs7BtVryLxio026Isd6o+QLEXLaywYqZauyeBmFE06wVS+lYDg0hfUE
	ZPL7Qwrpg5/9zSxEM2HCgH7qpNgV9ix9KtbAhsYbHV9WPkHyG8wrAss47hUORCdBfKFv
	3Lk0wR24KH1vUN5ep0QKMa6NBkIpENvvkJiy/bACsYuYCyy4bzKrPnY2/H/IxiHpWjG+
	ShdGTk/XUi5mqQtL0lbKvcqISnyWzsest+LQgeVxSIgfrrFBGP0NLgAH6LnmiaA/iUxl
	dm9w==
X-Gm-Message-State: APt69E02GkNl0Kuc8/mgtwClBcWC/V3uKarssviwf3a0CrBBAYWWgvRA
	d1quOcskm+mALjl0fWeaPWSXXK5A8WJTN1WH7R5C+g==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr12685858otd.316.1528132122693; 
	Mon, 04 Jun 2018 10:08:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 10:08:22 -0700 (PDT)
In-Reply-To: <20180530180120.13355-10-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 18:08:22 +0100
Message-ID: <CAFEAcA9VaX2ZKdGQZ3oQnRR-sD1EswrQPPBPRCiH8g9P20428g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [PATCH v3b 09/18] target/arm: Implement SVE vector
 splice (predicated)
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
X-TUID: WThV3keeJIqq

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  2 ++
>  target/arm/sve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 13 +++++++++++++
>  target/arm/sve.decode      |  3 +++
>  4 files changed, 55 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
