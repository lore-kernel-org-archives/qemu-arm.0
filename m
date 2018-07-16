Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1536622wru;
        Mon, 16 Jul 2018 06:59:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfRq3zp3gaJp/8tWluSglCTLvlDx6puu1ant0EVu/uKvKumgBLl0sgcXPD3RS/y3CMIVvDs
X-Received: by 2002:a0c:ada8:: with SMTP id w37-v6mr18245110qvc.107.1531749557057;
        Mon, 16 Jul 2018 06:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531749557; cv=none;
        d=google.com; s=arc-20160816;
        b=ZD2PMdKuzhzCa6TzLA+739VR5Z3iTEyZookBtGUP6Jim4Xrv49DOAUAphgnoYlScJv
         E/f+guJgKkgPFQ7TkSttAutMbYLbng1hE75MtXBKYmr6GCKMNQoKPzpXuBx9WitpVFbV
         ghbYhJAkymVLKolC1/9RZUfh/wDFhS7d1ghzR94WmCweUKaIMIT1AzYN8fIDJwQpxjRC
         EmR8pi9q3ud767U7o/lgyavCjugt6rsYh6s6m8Lk1bS/rhtjt0UnDOPUOm3zcud4dDHu
         CL6KaS4lgkMITdoyoW/DAhrvFrIfs+tB/WUTZwglMo7w3uOhYfsDg5C6qe9Vt4GuGat/
         Rk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Y31+YEBw4tBzxeQowTb1aBgX8G2YvmPpXXAdKyxPMSk=;
        b=rnHanRF3q7CAxcxonU9eVujZ58JuvgyUaNwiS1xB27NJ9/DH8ymhRD73ZIzd+5QXqQ
         f0bhYFDy+8dHft/vxy1MRCuikDRtE+okbxJ3hD1j7v93sGPYuxtvA9to1E2vP3SJn9nC
         +JrZRuIx/aEYkzKOIz20b8p47Z2LB7kuBDPvoZ+iu+Aaq6jWMhB5wOnfxh9+LUGvAvQT
         EmfQLgk8lvI+BNd0aBMGNtMwxnNYez299wSg9q8x0pwiReykcuDC/qVjxQaD3vWkx8rS
         qJ3i2BcUTB8o/AYW522pWjkEThGvf0HZ6RpHWfxHlXD26+gz9j8QnTTthCPd3ESld/lh
         /QNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d03EubZl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w127-v6si2779435qkb.5.2018.07.16.06.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d03EubZl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff420-00085D-Jp
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:59:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff41m-00081J-Fq
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff41l-0005Is-P8
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:59:02 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff41l-0005Id-Jk
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:59:01 -0400
Received: by mail-oi0-x242.google.com with SMTP id d189-v6so74902938oib.6
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y31+YEBw4tBzxeQowTb1aBgX8G2YvmPpXXAdKyxPMSk=;
	b=d03EubZlB7eqIdqwAYFp4DCYxPoOOrsYzoGhAa5s6pnP9beP5N+7AjqpuLqd17NQih
	Y7NPehjO3r6pdTygzvde+NJZnGMkHxRjJwMo8xKZXAWhmPgTbigGm/lk3aBegz3MZoqf
	i8sCllUgmEF7SuPT+rP7oaQkbIqYkTBBKZiiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y31+YEBw4tBzxeQowTb1aBgX8G2YvmPpXXAdKyxPMSk=;
	b=b1d8q67LvZTH30l4srmsrW9iG/tiLZM3o9DFKtSTi7yTGI0jTBO5lk/BHI4pd+CJkk
	R3JW/df9t6j6ohuJyOWXh8wxHgd697M0k1YtJUnW4a08o/SM7qCds9pfFgl8iU4AAFah
	9yFWZxtxPkl7ONa58R+YThZIESa6Zuo/3kFQllKvZIT2Hbsq4x/OABVL8Eva1klpOa8z
	sIVdbOQJnfQ+gsJuJScJ7cSehTVBVewhDidc7yUMkqYPAotbCd8/AAH3hqFXsLvphwCG
	vqrnihk06EzuF0Bfr+eCXZ4/VIC9Zucz+tuYjXyEDL956jnZynGA5aifjYM+YztHUSaE
	FZXg==
X-Gm-Message-State: AOUpUlFwepb7ZmcZYrk3JAsh/OiSL+VVenoXdBjcs7NkCyrgdAvDuUX6
	mkoPs99T07Mr8WasemTKuO7AaaJK1do17eWIq7k9ew==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr19171879oie.80.1531749540876; 
	Mon, 16 Jul 2018 06:59:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 06:58:40
	-0700 (PDT)
In-Reply-To: <7ea6a810-1216-b45d-3c25-9d843769b051@redhat.com>
References: <1531415537-26037-1-git-send-email-thuth@redhat.com>
	<CAFEAcA9_TrSTrcHBGS1mAd0-w2VSQ0AP3z=EPM_U3dTF3k_R1w@mail.gmail.com>
	<7ea6a810-1216-b45d-3c25-9d843769b051@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 14:58:40 +0100
Message-ID: <CAFEAcA9pOeqbPNOMUHNtv=H=hUwpDWC4Ohx-aHJy=_P=s9cbCg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm2836: Mark the bcm2836 / bcm2837
 devices with user_creatable = false
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
X-TUID: f6jYUv232aZb

On 16 July 2018 at 14:44, Thomas Huth <thuth@redhat.com> wrote:
> On 16.07.2018 15:39, Peter Maydell wrote:
>> On 12 July 2018 at 18:12, Thomas Huth <thuth@redhat.com> wrote:
>>> These devices are currently causing some problems when a user is trying
>>> to hot-plug or introspect them during runtime. Since these devices can
>>> not be instantiated by the user at all (they need to be wired up in code
>>> instead), we should mark them with user_creatable = false anyway, then we
>>> avoid at least the crashes with the hot-plugging. The introspection problem
>>> will be handled by a separate patch.
>>
>> I thought we'd changed things so all sysbus devices defaulted
>> to not-user-createable? Am I confusing that with something else?
>> (The set of user-creatable sysbus devices must be very small...)
>
> You remember it right, but TYPE_BCM283X is not a sysbus device, it is
> declared with ".parent = TYPE_DEVICE" instead.

So it is. (Which sort of makes sense I suppose, though we're not
entirely consistent about whether SoC containers are sysbus or
plain device.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and I'll apply this to target-arm.next for 3.0.

thanks
-- PMM
