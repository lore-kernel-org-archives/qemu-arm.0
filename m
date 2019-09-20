Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1946464wrp;
        Thu, 19 Sep 2019 21:55:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJFxSQVf+3sQcW0LfDjmVGnHgWvWCYra8LJdC66m5s2U8X3HSbg+P7Rxb+EQGwANtYhP+p
X-Received: by 2002:a0c:9952:: with SMTP id i18mr11611101qvd.202.1568955348456;
        Thu, 19 Sep 2019 21:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955348; cv=none;
        d=google.com; s=arc-20160816;
        b=iUB5tUtvb8i4MdO3+zeXqo5Dbv9D70n85sdWl+FQHNuclivHTuKIFClBcVIpJx7hTQ
         W7chcT5frhRCA5fkX/xzaPUQtQUR1OV48wyV6MdFMZ/zDN9rooocWBYaFSpGSlNtdJxx
         TRoeUTwdOaQam5BRqoRsJieoRSRu2uoEoL8ktM60T9r65F5mlJNc+B8JmEmnE7UosDHO
         pHm9k/ZNuTH/+xGoih4uhnrz7TLOeAo+LI+ZkStvmqNGmw3obF8p41kNOv5PZNDHsPNp
         6/fG8wch8z5+VhqPvgfakus2/kLRQWUSZFueHChSQBqPG/zbXJm3nVFV5hkpTsA/1NFc
         wYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UX9omtw5itv3tNBtOezj1OfJf4tePpoWq8qKz4OVfiI=;
        b=MNeW3NBHBo7jO7GiIUXoavPdafYmB65wnUwanFk+KBSAEMHLt+qsbaXUWhrYwUeG1q
         Gv86gr6eJtiFCVy92IKzTt2TeA9vka99YARLwy9f/8G/hWke2JACyJ0x8W2Oo5o7CkBI
         6hPXuKTUa8L4pCr3h9OM3bcoJU1yU+YV8vOpvNt3TkEnUt2gnpsyhZPuwDFOgZd4YS8k
         Z1tCOM/gx8gkOP0JCJtwAGMyaVCvoYqbHdhCFKagFyeNTQSB/tK5MlrbVP42spWIoxBG
         B1hr1XM/6umNoZypGFCkMArchv1Ubey0/drKje+dtbWSINRIRJD2oUg/0E1G2g7BQ7BZ
         WbUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=XPqXce5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p48si1211816qvc.84.2019.09.19.21.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 21:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=XPqXce5u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBAxP-0006nX-RI
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 00:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwA-0006mn-7F
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAti-0001eT-Rr
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:51:59 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:43914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAti-0001dT-OB; Fri, 20 Sep 2019 00:51:58 -0400
Received: by mail-qt1-x844.google.com with SMTP id c3so7191595qtv.10;
 Thu, 19 Sep 2019 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UX9omtw5itv3tNBtOezj1OfJf4tePpoWq8qKz4OVfiI=;
 b=XPqXce5uz/YhNtMnWj9dgmqfJRxioyzMZQyEZOa9qNF50aN/GEeZbtyUKeAEAquJ4x
 C3sOdlpBGpgB6S0jDFctbRaqGawlbwuTNrqES2YrNPWSD/wnCpZrH9fpgbkZLKI4ZXAw
 OjsjvkQLxGLbPjTjTSHYWA8lMynfY9ex2uQDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UX9omtw5itv3tNBtOezj1OfJf4tePpoWq8qKz4OVfiI=;
 b=pXQX/mjvqkUf8TVwGHTPu0sC91FyCxA8SDlFNJKXEDryzBdZmgL/awtjp8D2TUuFZV
 9DOOxyiVSObCtRf+dM7mNp2dle6qnx9rb/pBGYTc8qdQo812/HZVS19tmBPdIaP4YN0r
 3E45wqiUyFxKCV49tbOK7y8bewe3sq+hloWaeZjgugQTbYSaWclt93PIuMxTvCSbraA5
 gOasfiWGQZttzVJqs213FSI+GspmZR7dE7ClDfFlE3UkNHLJl7H29TuerAe30Aj5v1J5
 Td9vpITlJizTkH5ySt+W63TOcofoPjNQIRy0Ct8AxO5pK7zieNKabNfRs4emel3tBMjT
 qxdw==
X-Gm-Message-State: APjAAAWLXVAiOTBqYrvmmsJS1oxbvCajLQtWlFnw8xw7PktCswNmg2SF
 RyhcHCnapOIl1ncT2HzfeKD2tgfU/5Eg2emaqxg=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr11696061qvl.38.1568955118058; 
 Thu, 19 Sep 2019 21:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-9-clg@kaod.org>
In-Reply-To: <20190919055002.6729-9-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:51:46 +0000
Message-ID: <CACPK8XfWdraTOhoFYttoe3jGTCG1vKQB2nvt8sU1SwsF5OO2pg@mail.gmail.com>
Subject: Re: [PATCH 08/21] aspeed/sdmc: Introduce an object class per SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zjp87nM0XRmy

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Use class handlers and class constants to differentiate the
> characteristics of the memory controller and remove the 'silicon_rev'
> property.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
