Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1948596wrq;
        Thu, 7 Jun 2018 04:01:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKzc5Doel1zvhwVGJMlK4u8Nw3yNhGYqf9txtfUHeqbDZsb9pFnh8WWs6VG7rup/1XKeXRR
X-Received: by 2002:a0c:8601:: with SMTP id p1-v6mr1108108qva.184.1528369268296;
        Thu, 07 Jun 2018 04:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528369268; cv=none;
        d=google.com; s=arc-20160816;
        b=DGSoddC4JVvdZK4lIEMVyZV+Uef+fVE1VEkRgfMyc4xIT7Zp9K8YMprbOnKGtQuFG9
         6udk0jssgrMx1IuPoXJ4ouUMi4lDMDTpXKY8v0aDb/b81H6iqALwyMyGq6ZxMV7lZbh5
         5v2iNieykOmjTS8xFfM2Twj3phDKeg4taF2D1fKoXH7gXKiohxQVodnpj26vx9FJtRq6
         ErMzIfS+yECeFJUKFw/RdRXRL59NuFKZjAQdFq/pCuvKHCGbG+TE5pCLmKSjB0NcjaX3
         eMCx3qz1V4CKrvHWUadTaxDT471MEpTuym97ZEk5p1tsV4OTjW0aR9mTQ5bFyEqVmuBT
         NzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=z8ozgyGm3iDb4Bd0Mg/TZAE8gpba8JIbVRHRkK3npug=;
        b=Ag+MyM83QJO+HM6BTTPhAB65Iw4hBjlM9sUxJF38Sllk1oho/aA6XyT0B+kDJO9R8i
         xlVUElJIbiulwgvZ+2PuEBeauwfpRxl1uLaKkDLtIiM0h99FIQBgTsxsvp8qKuJ6czdm
         m77SeQGWp2ah3cJopUeWLXvtviTFG/dPaw72kiJ9o5wNdeL520MuRFcuVjVDiKrNitzF
         lul8bm5+n5eNkRFImFEmUxDUTIyEB6iPc7eEyfgpcpXkNXQpEkt3kr6PpJeMCivVcTUw
         ftqancKp/pz7RT/LsMDwxTO+lP3CpxHbqHwr2jfzMCAgcnx4iH7oqpgXtgW9Aj/dRHMn
         oxDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYjFB5Sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11-v6si3190002qtz.29.2018.06.07.04.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 04:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYjFB5Sj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQsfD-0000gr-Rb
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 07:01:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQsf1-0000gB-75
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 07:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQsf0-0002rb-BY
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 07:00:55 -0400
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:37482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQsf0-0002r1-5x
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 07:00:54 -0400
Received: by mail-ot0-x22e.google.com with SMTP id 101-v6so11003141oth.4
	for <qemu-arm@nongnu.org>; Thu, 07 Jun 2018 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=z8ozgyGm3iDb4Bd0Mg/TZAE8gpba8JIbVRHRkK3npug=;
	b=MYjFB5SjAEIj/wGkcL0LaICiHhBa5rIgwbNFXYRnH8bM/8TE+7/cebK9i9idnM/VHG
	jZLdbJfLBdpykFKjOyojBh8x23dLo6nrlMC4666w8XFnDwTZEiZH5E92vbfmBDw/40Og
	q225WsfzGaPOSeYo5rM6aNIXRmkPgvyS8uyV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=z8ozgyGm3iDb4Bd0Mg/TZAE8gpba8JIbVRHRkK3npug=;
	b=PuW4vfJ9LtHmoRyW13xYcsrvCJHuVe5NHEJ44HSRhnWVsIh/xhokhjHJekMP6EQkG9
	hgssCHkdqvSt3+HtqrB06d/XfRnS9vvWuReXJMlpTZkuU+p5sgIkwem+ZLPPpXZTLDAA
	jfxwc7aJZdzYLIC0P3l7kK/m8Y7iQEMJCw1RgnV7VWS+teMXtbqpOLoyE5GesTdOZnz/
	DN3yPke3hvFI5qfslWK+c4P5xR+5vxoz3ICC/i32CXNaUe3pFmKeQUml6baqeCMkCQRs
	KDL+mhve8fpFiSfjHZTpKye+J0qiD4nMPAwUymt8BFpe1w97JRWteVTVPOI5ulIGAFJH
	kKqg==
X-Gm-Message-State: APt69E1jgegWIQJcrzLX3QARZ8ofElm7pbJ0P0FTxzTR8GbAPe8NP8U7
	gmFRvSp5yao/aDoffAEaNiaQalNpXwo1I7BpYReWug==
X-Received: by 2002:a9d:3fda:: with SMTP id
	i26-v6mr635442ote.126.1528369253344; 
	Thu, 07 Jun 2018 04:00:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 04:00:32 -0700 (PDT)
In-Reply-To: <20180603000827.30872-2-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 12:00:32 +0100
Message-ID: <CAFEAcA_EDXyOHpdamg05=p35jazqgZsLKP2O+G1tg6BoR4b28g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [PATCH 1/8] sdcard: Update the Configuration
 Register (SCR) to Spec Version 1.10
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S1Mu4UsyBKce

On 3 June 2018 at 01:08, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> This register now matches the description of the header:
>
>  * SD Memory Card emulation as defined in the "SD Memory Card Physical
>  * layer specification, Version 1.10."

Can you provide a brief justification in the commit message
of why it makes more sense for us to advertise as 1.10, please?

(eg a summary of the 1.01 to 1.10 differences and a note
that we already implement them)

thanks
-- PMM
