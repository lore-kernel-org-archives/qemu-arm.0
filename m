Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp63478ejb;
        Tue, 4 Apr 2023 19:07:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqakHXnxh2jaQwHDTJFJ9NSczP+blrqKrOVbEtV6x8+Tkcgj59BGUGi5LS22CL2XTD/ZyU
X-Received: by 2002:a05:622a:109:b0:3e4:e2c1:9ff5 with SMTP id u9-20020a05622a010900b003e4e2c19ff5mr2580462qtw.33.1680660455608;
        Tue, 04 Apr 2023 19:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680660455; cv=none;
        d=google.com; s=arc-20160816;
        b=0mjsweLpy0LcVLppGMK8kKszblT7w4d1z0epfILiUhRZsl5WPHrwGq6H16refzgWCQ
         TO2XME8KPlqjvkMnBHiCgXfekFSU7WBfWNM0hiPMGXV5VD/2qZJMT6ByjG4x+ngRyvxG
         VBmJFFpA8Ft92UbniMW4JiVv3xH5ItCmfSgQ9eAhPN6AwjIGXj/mbSF0RqRKAyy+3ILJ
         GjUySnGbOelqrlrRWMcHJ6MZgSpN3yA4tfirIW7yIot2UBqYdaPJ561LT9HIn0CMU+z2
         PpdWvZ9YXw93TyeaMt5HjTfcE0/KR+y0bkNangPCDhqJpgd+8jrg1SEokvpbY/EAv1P2
         MURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=oPOiLsTGI6kKQoD6XYQJ6dXb8rUnPSB2OAPuaWxl/QA=;
        b=fJ/92IIq+Yb3WbUXzw31iX0e8artYE0RDB+mc57Pd7SD0rhX9lCPmc7+JcA/YVEoFf
         T5955oGPgPjzBK9laZGBk+3dXeadRaickHpbfSza+qvrTDlMMojLIZYIHNi/i2HS/u3M
         5nwqew8/A+i0uLl6VBvVs9kZhiPOmrqNCsHc9oFWfIuivnYWoByErMvdHcuaZcS+kNWb
         9DpZsVr5FdLot1avf6vU7XuW6ltQi5oZ5pHN1WlbuHTUbmrbErPnIJV8Maw2RVsqKz0M
         e/7KXXhhLKgsjzpqb3LOafOL2Op9lAepyNt72rIqf+r/2EP8RNS7qFSVfPGc3mYJHP3r
         BXxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=QByIUS2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp9-20020a05622a1b8900b003e648e2ce42si6685596qtb.447.2023.04.04.19.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 19:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=QByIUS2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjsYQ-00020D-NI; Tue, 04 Apr 2023 22:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjsYO-0001zO-4u; Tue, 04 Apr 2023 22:07:16 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjsYK-0000kw-VT; Tue, 04 Apr 2023 22:07:15 -0400
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 503B32009F;
 Wed,  5 Apr 2023 10:06:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1680660422;
 bh=oPOiLsTGI6kKQoD6XYQJ6dXb8rUnPSB2OAPuaWxl/QA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=QByIUS2FVB1JG5xFa7iaaZhD7sV2HrGdMCOU7EwlzJpCr4kSDIIlPnQDQYvs0pEpT
 99wO2viy4X4eXIYF7UJmacNIEB/lXt1yBRl7qq2CVs8eL4h9gA4rCy7GeEmalk5Tvx
 fJp4KqihBOrZ7d3TOJH1s66zN1FPfJdVy6YpEjgDUgourQZY5sEY/BBacVxlKTmCMN
 cLmxqQvBH0q9ti0Oo4sTWfrdm0rZAsLzCzB+Fthyrslz9ryLYmtq9QU6Bs6UxRjnRQ
 NPAeKReEKWC7wgkD6ZwxmtH8HfOhL3FXYyko1F318eCN4RzESM2DEJq2RPkJraIBfu
 2cEUZchu+hcaA==
Message-ID: <0f44daa680719e06071e3a56c61fff18f3918139.camel@codeconstruct.com.au>
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joe Komlodi <komlodi@google.com>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Ben Dooks
 <qemu@fluff.org>, qemu-devel@nongnu.org, venture@google.com, 
 peter.maydell@linaro.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>, Troy Lee
 <troy_lee@aspeedtech.com>, Graeme Gregory <quic_ggregory@quicinc.com>
Date: Wed, 05 Apr 2023 10:06:58 +0800
In-Reply-To: <CAGDLtxv3z69dmDMpA=7dk8ADHwTaMPT-a3BceTvyidXk66+8oA@mail.gmail.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
 <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
 <50b19eb8929da77f150c34585f805345e460daed.camel@codeconstruct.com.au>
 <CAGDLtxv3z69dmDMpA=7dk8ADHwTaMPT-a3BceTvyidXk66+8oA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0Lj9lmTVCtni

Hi Joe,

> > > Jeremy, how different is it ? Could we introduce properties or sub
> > > classes, to support both.
> >=20
> > The differences (at least from the view of the current Linux driver
> > implementation) are very minor; unless we want to be errata-compatible,
> > you could use the dw driver directly, plus the ast2600-specific global
> > register space.
> >=20
>=20
> This is my understanding as well from an outside look.
> From a QEMU standpoint I could split off the dwc portion into a
> dwc_i3c model, which the aspeed_i3c portion inherits from. I can do
> that in a v2 if that sounds good with everyone.

I'm not a qemu maintainer, but for the record: I'm fine with the current
approach. I don't have access to any of the non-aspeed dw documentation,
so verifying what should go into the dw model vs. what is
ast2600-specific has been a bit tricky.

If someone needs a non-aspeed dw model, and has a bit of documentation
about the underlying dw hardware, it should be easy enough to split back
out. Maybe just make sure any "known" divergences - like the IBI PEC
behaviour - are well commented.

That said, if you're keen to do the split dw+aspeed models, that's also
good :)

Cheers,


Jeremy
