Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3221061wrh;
        Mon, 6 May 2019 22:20:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqws7gqR6sgMeLLIQbLBBww/WGA3BSe9Pmc+X7B3P0tGtGpJ98o7ohhCHI3sNaRmJs21ZIeB
X-Received: by 2002:a5d:4245:: with SMTP id s5mr11312212wrr.147.1557206439504;
        Mon, 06 May 2019 22:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557206439; cv=none;
        d=google.com; s=arc-20160816;
        b=Gq6afABLcmIMrM5rIp7ekpBRuUORwynhyOlpLDyRban7X/caC3/nb2jxONHKChRyMM
         j/QC1EcVPyLxp7rHPfBu2H3ahN03ga3OZPPKokdYVGkMGt3H9U8izvl1wbk3zzoTL7tK
         6IF7BH4suY+SbrcW1H6qmptHF29hoDjGVBpiJmoM2L6H2zu417vlUSePw9pW29X8fnZR
         LWolexJhTFkPFIpYt1aRlGGROtnOrZrGbGGXX9IHdIg/YK8WGh7K8KpOPEJmHhGHyCKq
         0yEeK4Zhua5Ns7J1BOcsvXReD8ycldpyaD5ZeKtsSK1z5RTOonWg5xpcXhxGUGLVK9cY
         0liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=gNF1guSC/XzjZL9VnCwYhAjrF52A9evcZ6a+F9k6uRU=;
        b=WHB8OJloZSUpM3D/d04oZiY+fX+2GQtZ4rwQsATb0MnAP6vbcuN1aH0ZoRuhqYnsIL
         17+iH0mToi0BTTmjw72rFqngfF6Z4EmziDusFXeM+lihra1ahQwm6f+4bWkvuXQmIPAg
         TYVfPnxWYxOM6ZGcTOLB5xexpxBAVpobk1+IsUfhqUuzMq9k1ePtBHi8VqDiZBlCqbTE
         PYe1eh3kgPi/cGSChG2bbjSw4cnIddOjAk1Are6uID8BAB07EwzthN0g7n2pWXKFqSTm
         ehLtcrh+bEeiXrk890xe2xQ0MfU4JuFayziHJjJVNMki1f5NLgiRB2Z+F/92UvoGDKaf
         MKng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=heIivDNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x82si8407533wmx.80.2019.05.06.22.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 22:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=heIivDNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNsWs-0001ko-J1
	for alex.bennee@linaro.org; Tue, 07 May 2019 01:20:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsWX-0001jO-LD
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsWW-0003kI-Sk
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:20:17 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:45554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hNsWW-0003j8-OR; Tue, 07 May 2019 01:20:16 -0400
Received: by mail-qk1-x744.google.com with SMTP id j1so3530702qkk.12;
	Mon, 06 May 2019 22:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gNF1guSC/XzjZL9VnCwYhAjrF52A9evcZ6a+F9k6uRU=;
	b=heIivDNnha9tVWo2TEugB5kgIpD1c4Jet3pGDaHtQx3qlccijUhxXXIYJhr3/mOwc0
	506Hc5uuaFJo4kMZ90ZSQEEdINIKEWA0TGZb29tHzr3jYPO5QzFBC97EOXNqwBl40UOp
	GO2IcZI35aediJdzCMCprGa3rCoXkivzRAoek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gNF1guSC/XzjZL9VnCwYhAjrF52A9evcZ6a+F9k6uRU=;
	b=CKmXdqSGCuT+n/YRVxrWcW+9zGVa5/IDeME8RQzWSiHiyO7RUe1VYqM8Y0WpkqR4Hs
	L3KmC+prnGv3y99hfHWU8Wo/IZ7y7kK9AsRbMP4kVqJDC/qmQ+VtIZ/mHC84+eLVdGj7
	YnKvLMIXZOzD8hZyXsvY/Weuugu+oT17pNMvQlxAVTsUEEjgJeObSzWva2bkIwXoFUOH
	jz48dD2fmh+nu3QfVS12zjYLyhK/X6Q0EReYOB8b8wvhWdyY93PWaRRhS179ZbRlFYdZ
	t+bvvpYqwPi1jtl0ZV2scezJ5k3at07L4vpjw5XLHCU0HTlqSb0itRJqB81VlvtTpBAA
	zfEw==
X-Gm-Message-State: APjAAAVyqYF3VvvqPQ1L7Nfnsu+F+Thj2Epu819iq98h+M9ccaUsLpda
	p7VbDJIrDKUpO9y4pAA7GZ0WwyljwuOK/oe9yJKJhCmf
X-Received: by 2002:ae9:f00e:: with SMTP id l14mr18396247qkg.127.1557206416237;
	Mon, 06 May 2019 22:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-4-clg@kaod.org>
In-Reply-To: <20190506142042.28096-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 05:20:04 +0000
Message-ID: <CACPK8Xe8XXx9af7LExd+NSQK8Jt+9Ca=ReP3xv94DV7vwTY3EA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-arm] [PATCH v2 3/3] aspeed: use sysbus_init_child_obj()
 to initialize children
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ns2ISx2kJjsU

On Mon, 6 May 2019 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
