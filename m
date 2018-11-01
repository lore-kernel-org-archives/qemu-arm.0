Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp891049wro;
        Thu, 1 Nov 2018 07:39:45 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ds5njL5rwbB064I3k5Gzj8oLxx/H/ZOdiUyeMjgcumcmE8x34ibq7qgrZFe2liYZoULyc9
X-Received: by 2002:aed:2741:: with SMTP id n59-v6mr6922133qtd.380.1541083185375;
        Thu, 01 Nov 2018 07:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541083185; cv=none;
        d=google.com; s=arc-20160816;
        b=YJNTlNJ17CHV8k4K8j63jTVC/XO9C10wxFk09VtytHovctQlvBkBoyXQYw+T/AHCPj
         5Gh1f5oglzFcqKNgonm3RwEN6WEiK35PUZmwMS3wEItyCx8K3kf+dCNQkGkf8+SeTgF7
         izavMnP6ArmBEfG+ieSP4xLG3LpEoOXfdAgmJ9CSq0+7M90gNyRnVYOawA4YOBWxo1tj
         PBP8pBPB7vxBDaI8tnDMl7135u2u6z4rRL2WoVFEqAA+iSJ6jDeVTu66K6wzHByroAVS
         XjpZ/6WckzvSZ7KHBxUA+89WxCR1+OieeKhMUINUdm26qHPtJUXQpha2qBK7+GGHb8y+
         4gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=JfSSRaPKbIwO/ySrq/eumuF/pAMe3fXe6F9IdfHNZ30=;
        b=hEwsbp4YFkSeGBDNUCN6zXLwAgHVEIL3bfWqo+iytM6s/5Jyg2+3BHr72CVJrJ66Vh
         DHprZiXxfbLAkHDfyV+50oVpnQDei2P7eb4VPSekj7GDCvbBUKp8iDRmvdk/8CtCf6oZ
         rVapDfOjCmkwhXX7kb/1XF/5qo4XYfSATaQBSJ+IDYojI8CYGwhEGzk3sm7cAjIBG+U5
         nbKXMld7uegv7FJDrsT53O74l7x7ZXtHODnqDE63MBqluG3HC/x8F6FVBZr33ZrmyQ/s
         yzlL+6LVp8AyT2NMipz1XS64Kef0py1prtmyIsqeuzEdycAGp+tj1LDs2M08C5w/KfJs
         xEZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gRBGLScP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si1942074qtm.381.2018.11.01.07.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 07:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gRBGLScP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIE8O-0005Rq-RN
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 10:39:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIE7H-000589-Dy
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 10:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIDzU-0001Lb-12
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 10:30:33 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIDzS-0001HK-Rc
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 10:30:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id o14so17915011oth.4
	for <qemu-devel@nongnu.org>; Thu, 01 Nov 2018 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JfSSRaPKbIwO/ySrq/eumuF/pAMe3fXe6F9IdfHNZ30=;
	b=gRBGLScP3bEPtlyCMdJAIBIynDAtX9+WnVI+tjMFE6eOMOUBkrQIZ7D/+8vDW/w/mh
	r5tpUvFTFyogxTq8EG6xRH8P+h287ueshKZeL3iIGxj3dyFNSsAnC5sy/p523COwEk56
	BuQ07pI44zu+I/Ee3O4tAjMcVMs8LcczzSEu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JfSSRaPKbIwO/ySrq/eumuF/pAMe3fXe6F9IdfHNZ30=;
	b=rGrW0KMFlsbmvoAj9DNYTdz4JmBq4hJcZH/MrsEbHjhvqu7IOG70qDIJ/3OyLEPJgc
	9UrGzBl1KjRTJ+8YOncorDo4gypeWPwNVDvJAgBp/0jgtCG3PWZAN7ntsP7Ujw3L7ow6
	pmF66nlh+W/3eg194eIpbiKzz6ZTuFC+O0crOJXTBN6445fRsKfQDRcL9wGmZ3ISyJAw
	Q8pufjmngRFxtu7xUNnYlmic5DSd6++M1fT6gkW3FSQPTuGmvrTpU0wUA7Ut5dRNLxiO
	XxD4vBRO4Mt+pWk8AqA2yu+lUahkpb3k9mTuPPjTC3J0SIj9vUgsOr0aBG9HNmPwfQxt
	a9Zw==
X-Gm-Message-State: AGRZ1gIFj3/SkQNduktMMPDb6sbYce3OSsSFnTMg9TFRT2qnnN1pBpsr
	NzaN1nol3ZBgRtN2x9XkWrXGX0KT5dzNggsVZGsMeg==
X-Received: by 2002:a9d:5f81:: with SMTP id g1mr4916382oti.317.1541082629053; 
	Thu, 01 Nov 2018 07:30:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Thu, 1 Nov 2018 07:30:08 -0700 (PDT)
In-Reply-To: <bcf1457b-8f0c-3d02-cb40-529eddb19316@redhat.com>
References: <20181030001841.1658-1-philmd@redhat.com>
	<bcf1457b-8f0c-3d02-cb40-529eddb19316@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Nov 2018 14:30:08 +0000
Message-ID: <CAFEAcA_p9oTtur8T1Zz5J4hzV2Ly7Jd2Y0xHODCZu2vm-QXx4A@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH] tests/bios-tables-test: Sanitize test
 verbose output
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tO6+vywF0y2r

On 1 November 2018 at 14:26, Eric Blake <eblake@redhat.com> wrote:
> Umm, this prints a blank line even if I run 'make check V=0' - do we support
> V=0 as a way to disable verbosity

Empirically, we do not. Our rules.make defines
quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))

which will suppress the verbose printing of command lines
only if $(V) expands to the empty string, so V=0 will
print verbosely here too.

thanks
-- PMM
