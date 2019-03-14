Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp629367wro;
        Thu, 14 Mar 2019 02:49:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzSQcOwwJIQxUWSTnaXqPlTEsQx6tmFXoBoMn/jAB1fe+xHGRyOO8+fKI/r4desx7OcVSy
X-Received: by 2002:a81:53c1:: with SMTP id h184mr4866000ywb.194.1552556973790;
        Thu, 14 Mar 2019 02:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552556973; cv=none;
        d=google.com; s=arc-20160816;
        b=v9OUgG7FSUH/iq+LPHWc5L2suLTUkXEU02fez/X9WM+zxRMwbEmQDLsX+Z85jyGYa4
         caY1/h4bVIi0pGz25865I+/CHbxhsbgizjfZzXg319BGbAbzvlWeflq7M3vXzE+QVUC1
         zo+YUPCy5F7pwQxy+Ttdp+CsPn/qlHhhQSwqPz4ZumJ9ZiSdXUSSzvK9nr6a2DdG8OxX
         rRpJkD217FTBXGLgaEVQHjtA9wS3z+E9cOLcZuSj+6jaAnkB/AcjApIKmqdvPxGD4Yhl
         l7Knqm3mTPwONzWQ3yWpnHFglItwhajZsU+zmHvma3r8wNUrqDXVB0M67isG40a91y9Z
         OJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=UOvkh9aRAvaWDAKHXLbvorTduYunnvQF4Yz7CADeFug=;
        b=dB6sYiFSltmHfPNwGi30wsY2N2Wiv91xCMsxo4e+uVFojLfFJN9+prc+v/xLADTg0O
         /k3ArX52C09HAf4N2PlW373bLkaeIvARxSECGdZwl5M/dLTkcL3+zCLq1iqMxMCPSvtj
         B4tDHz7EBZ53e2ou1nkDlpNbT1QLnGQw9V0o7XerlT8cUQ5sTTqfuKfOQoGQ1L2PfAkx
         mNYCMpp6YP2mS8TP0WtDqz7mqtRgMnWC7/+KrNfCOmepp6Dj0ZvuC9Ovxr8debPOI3sb
         QAp1QPqL93I7EwiMT5ZfCYV0VcTMc6XkdSiJKrzcpT6TnXec+RWQM180PE1IhozM5EX4
         rPjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sF5Dyl+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si7895420ybg.159.2019.03.14.02.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sF5Dyl+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4MzV-0005XE-3v
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:49:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4MzH-0005Jq-7I
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:49:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4Mwc-00050q-Nm
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:46:35 -0400
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141]:56037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4Mwc-0004yY-99
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:46:34 -0400
Received: by mail-it1-x141.google.com with SMTP id z126so794235itd.5
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UOvkh9aRAvaWDAKHXLbvorTduYunnvQF4Yz7CADeFug=;
	b=sF5Dyl+Uyf+qK70TASvMQtMO/u9cnuSD8mh8VmDA90mEFZhZQMwcoQuTLKudUbQjzG
	k4D5BHUhnpelj7Deo55v2n49ys9or5+wM3s286FjSh+80TG42EO34FJwykzcCIFNlGxH
	xtzjojkmzFw/QhmexmgYrcPnmrkDUue1S4dhYxq15+lEyRvCghRvaN7hFyH8gFWIrHIe
	ruBgc7MAL/D0bzfamHN/XYWhRH8uLMSyS7mJB2zmK/tXcBKYRwNZ9IlEDXJ0Ovc0BVFD
	AuxtmO72z7+AKZ6MHX9mwY2KyS3qLj76eX1fjroduinD5j6WBv7v89rqLXmk1pE1ykzs
	SL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UOvkh9aRAvaWDAKHXLbvorTduYunnvQF4Yz7CADeFug=;
	b=HkaZVPMXOqQJT3AiUZCzjm1Q1mbp2xpvl49XevUY4VInRZaYQeeP3RllfWuoLFqQwA
	+SxzHf+IN3OlDcXmYlCcsbWy3bBmU+NotwCJd8nzzdUY4k0n+SP5AqUMNAdSLXTcIGT6
	QyFlrma1+Y6XOCRvfgDdWuA9nI6E8nYKMd7k6mYavIiQGrLKYZtpt2+iHb1Vq1A+AeS5
	mcPIe8L3jBBv6xJ5sVkbe8J2DjTfMmf9Ho+gHrU0IU++F8eoR3PTHPYRFI4cx++A1af4
	Um7P6T5zG+WzHtwRX0HIR64m3Bdyt+Tag8ivnuwa5FkPhHI2jN9FVIyF2ooZplEoPTZt
	ByRQ==
X-Gm-Message-State: APjAAAVbbDvOOeQU6cPuiBMyM+0gxFiPBbXvxI4enPp9S91Irk7YyQTb
	DxJkLfyhkheX7DoAkzE3zzh9sywN2IJYgnJVmLDXVw==
X-Received: by 2002:a02:6f49:: with SMTP id b9mr27191490jae.143.1552556789807; 
	Thu, 14 Mar 2019 02:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190312071250.12168-1-kraxel@redhat.com>
	<20190312071250.12168-5-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-5-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:46:18 +0000
Message-ID: <CAFEAcA_04sdrC3vvOAE_=camjFEssdzMArRxTUz4LsgBM4zZLg@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::141
Subject: Re: [Qemu-arm] [PULL 04/14] audio: -audiodev command line option
 basic implementation
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
Cc: "Kővágó, Zoltán" <dirty.ice.hu@gmail.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Kővágó@redhat.com, Libvirt <libvir-list@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, Alistair Francis <alistair@alistair23.me>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2CItBD7Wnq/Z

On Tue, 12 Mar 2019 at 07:13, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: Kővágó, Zoltán <dirty.ice.hu@gmail.com>
>
> Audio drivers now get an Audiodev * as config paramters, instead of the
> global audio_option structs.  There is some code in audio/audio_legacy.c
> that converts the old environment variables to audiodev options (this
> way backends do not have to worry about legacy options).  It also
> contains a replacement of -audio-help, which prints out the equivalent
> -audiodev based config of the currently specified environment variables.

Hi; Coverity complains (CID 1399706) about this, which isn't
a change in this patch as such, but the code change has
probably caused it to reanalyze:

>
>      if (!done) {
>          driver = audio_driver_lookup("none");
> -        done = !audio_driver_init(s, driver, false);
> +        done = !audio_driver_init(s, driver, false, dev);

Everywhere else we call audio_driver_lookup() we check
whether the return value is NULL before using it,
but here we don't. I guess this is a false positive
because the "none" driver must always exist ?
If so, I can just silence the warning in the coverity UI.

thanks
-- PMM
