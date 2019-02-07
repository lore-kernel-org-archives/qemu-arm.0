Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp165359wrq;
        Thu, 7 Feb 2019 10:43:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZXNQHj+8viTfIYGpBNNBN3EA+2OCQbrmSMEDKdblEaKWYtG/RWP51gb4Sa00HeVJqILtho
X-Received: by 2002:a25:5cc6:: with SMTP id q189mr14859001ybb.506.1549564992442;
        Thu, 07 Feb 2019 10:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549564992; cv=none;
        d=google.com; s=arc-20160816;
        b=A7T9Z/IRR2MR/4r4uZ5ZQYiwCzw3C9j0DwNKT1+ws3Rf+kM+/wTp44EViWQ8QD0+9C
         w9qWs8RRcCIYwA82gq2HeH/OytffIRM0x5YwJoDqoDljt3jQgkh9t57wXxp8KKGZDRuo
         +kxsCT2M2Pokd2ScQf+Wut81XvbtwEeY6F2MNUhgiDdsoUNHj17vOb7hhmGE7l7bpb09
         u/dM8d0u1/jF0ZoAHv97Oxkik78k+PElOQsksmwhOwaOcM7zSped0Uc5s+iNbg67gAbz
         Sfn5YEbZF1KIRF4uafIFSVCWoqeHbWipWuKJzE1REUtn1G1UBl+SVNsxHqHgd5qpqI9j
         1Vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a1NU5zWOZ0WlC9ipebdb3WFnkJzrIAn42CJKnnQtYE8=;
        b=LuEkZ/x0cDaXKGRPxYfS4RDvgJ/GxpVhnmAUajkwAhbnvesHtIJmcktVK0+ng49TBa
         mdrpzj8KVhAvhAk9IQF93/OUmQpudCNuRtrb9F+OsByRHr9heMBsT+L/LWOA5pv2krnU
         5YD0Vr0Onwdd2u3j4vf68HMeM+p9io/fNyMupxsL2UBkyxvxxmFrAjs13zoaO6Fyxhzb
         pVIhU7DLYP8qCM8TW8BarRZcNFAO7VXsSaFcDdhO7TCYn1FdeAUQXdCoZ01B9lSu54jc
         uj5Fka0g+BfDuGCk0WS6skIAV9HkwkIGL//t9PJ94uG++1cZ0pkboMQvwXvdZN1IE/ao
         nxQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mwDHOL6A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si4561566ywg.267.2019.02.07.10.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 10:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mwDHOL6A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grodj-0003ro-QN
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 13:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnzZ-0005Mf-VI
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 13:01:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnzM-0003yO-Nv
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 13:01:34 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grnzE-0003s7-Ts
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 13:01:23 -0500
Received: by mail-ot1-x341.google.com with SMTP id i20so1396149otl.0
	for <qemu-devel@nongnu.org>; Thu, 07 Feb 2019 10:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a1NU5zWOZ0WlC9ipebdb3WFnkJzrIAn42CJKnnQtYE8=;
	b=mwDHOL6AL9NyM1KxiVZOxa2qL34eEvCC+1/p2A5EnAb8LVRSJftRAHOIN0Rubsegqy
	v00cKaZd+wuBk+tITwGxIu5BPoHA8TwZ1ZCHOLLkKFmfvL2yzk++RU4u0G25IPAEG2cT
	RTk4U83Vi8LUcB1gnLN5aODeQY/LLH9Ry0zTHr9ad5mgN/OFUDOomX/Ayf19ejZzEo1/
	byxDzdG2oIQ9XPvEQWNcEqTsp6yGVzJSK2wTifWXYIEn7cxyiz9780LOvi/M7QuOMVjm
	Umzypd74GKmw7wHaKduX+KesBHmSigfEL6H1aTv1K3L11x/IB2VT1WUUEfpCy4XPr4sB
	QBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a1NU5zWOZ0WlC9ipebdb3WFnkJzrIAn42CJKnnQtYE8=;
	b=aKbx6dnONUfkc/k7VBcnVRRIbjsBUl6LAOyyXxO6GJQ4QXthDg6OIthQVWxnTFbn2M
	D0XqT30eH133Hp3iIh49IEtnMNNNR6rgCh5om4fAbQVEZUkYJXHyfus9OpazO1VahqCX
	VXs0HLFBANAOU9VSIy0gmcFxWB8a/D9Qxx+tjFWuFr9xbN64ZIxTh7DudypfxcJlETWF
	tI01UjWaCfnilrJym/85de47LwN5be6kmeFmbfdRvVnnPoSBdQkI9T1yELNBqq0sej9l
	BHWhl2h9Fsonu/z956px+HKTHDhqtO3lYMZcVnjruf0r6AeBUkuJ4GMsYCIAMkxImqf9
	VV9w==
X-Gm-Message-State: AHQUAub2JWCV1QR0m78hP0knOJx3D4yDfwSq/AwUZ/HAXWICpTMi1ZeK
	jtmQzUX18RIuqQPr3gZ/z8To4tSPl+XgonwcDBm1uA==
X-Received: by 2002:aca:2801:: with SMTP id 1mr1017474oix.98.1549562478668;
	Thu, 07 Feb 2019 10:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20190205135129.19338-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190205135129.19338-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 18:01:07 +0000
Message-ID: <CAFEAcA_rZc6PHrUrJwn=wPFX95aF1CMKa5vKRg1bQ4E1f3uZ1w@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] target/arm: Fix CRn to be 14 for
 PMEVTYPER/PMEVCNTR
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGKzpw3inMzm

On Tue, 5 Feb 2019 at 13:51, Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> This bug was introduced in:
>     commit 5ecdd3e47cadae83a62dc92b472f1fe163b56f59
>     target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>




Applied to target-arm.next, thanks.

-- PMM
