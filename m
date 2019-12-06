Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp869066lff;
        Fri, 6 Dec 2019 07:10:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuR0GUDCCyQCi8R0XrrkB11ipBaPvXNZfi4yPvBOX8OqQt+/2cooitZ5Q73P1p7IiY5y5D
X-Received: by 2002:a37:4d45:: with SMTP id a66mr14455168qkb.65.1575645009331;
        Fri, 06 Dec 2019 07:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575645009; cv=none;
        d=google.com; s=arc-20160816;
        b=bOq7mOUSpSj+i7c5g9qphTF9vwx4h9V9MBO3UnjjT1BBhIjcpklZhYGo3513VggK57
         vX/moelk9MNrkBhvQl0HoL8qUt+gorcjvjdlYZeHlbA1dsKHx7qFQc3SyA0Ddm1LLyrj
         1z39GxnhWQKYWSJm+bt9nF1rJvpRkGfRsdOS41TilM7pMvs+5OjuBZrXCJfzisC6BvEJ
         g0HnXFBJzJtZdNwOczexQnmhoeo0Gu5LAdDlJrTxtbUb1eBEdpLm8rBURTmg45IcNuVC
         CfQdfVJhPyEJQfiFDeCNgvGce4oMfWbryKXm47d59D/reyTxEJGoAdxo1hui+Ff+0tMG
         dp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ylrm/4WFZx63ZkzH1Zw02+jjVl0M7w4X80tYAXrwsE=;
        b=dAxnp5CDqrBsxJL7aNNOqcMnROsYKwhmYF3yzcHBi3Zi2pvtuUDWiNGQBpm/WaOeTs
         cDAVbmJlOA2YR7w9fJdr8+XDHeW43RYVjgueBRneol4LubbSX8ClSlgXskvmczsLZOla
         NMHdiCTkJ2KRhY7Mj7RyHY5ruhhg1Jwj0T2lA9LFfcOEOiAuJdZNL0BNLI7DT0dOc0wq
         Zi3YfVASPD+QszcKzrW0jO/nA2IJB7K2ftyBgcPgxO8mHE4RYCiJwxoJ7UlqYyT96Q2v
         6WkQRWKkprChb+gsHp2NlXUmEL8ohG6UKFvqUOE5ZblA81kEHm9M2lIalxxltY5FVYF6
         iCWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KG55XHkp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si8198981qvu.9.2019.12.06.07.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 07:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KG55XHkp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idFF8-0001kF-NB
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 10:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEaT-0005dl-RG
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEaS-0006O9-LP
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:28:05 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44935)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEaS-0006Hl-Eg
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 09:28:04 -0500
Received: by mail-ot1-x341.google.com with SMTP id x3so5886331oto.11
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2019 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ylrm/4WFZx63ZkzH1Zw02+jjVl0M7w4X80tYAXrwsE=;
 b=KG55XHkplS/f4DvDbIEnkmjz6kb6kvAAhxUvC5FcOqf2uHt6f4TsXG57JhqIVWyU1F
 U0LC/tm9QlUFXnjQ+NW62oLjTtUwrLVvkd3MRoALvsqpX9tuFgOww8oNpSbV2jAWQkQ9
 emioOvBKvylPD7wmv2MBZMPT+SivDEM/cYxlN82luFIO0Tex7Nb2BwgoyR5kbVIa0IOo
 E0UzHSEfpuYqTcDtAkvpn67HyMyXWi5xK8XYkS/strHQu7l+Yr8Rf1oxlcLhE8bzfvWd
 LKKiM9dC9V/0Z5uGCuHhYr3RC6seNqfV3ARvvsqVpyAFOXHO+RMEpaeAlKpcnkrxEccX
 9CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ylrm/4WFZx63ZkzH1Zw02+jjVl0M7w4X80tYAXrwsE=;
 b=H4HKpKwSkt7jQcxSGajj1tBAJ1IH15tEgqdS/qLZC9BOuZt8djKJLPsbt3ITEGeKhP
 iy3sHkOPMTMekZo1Xzxir4wMMXvqRJmRCdIKgG7exl6SrB7Vmi0DU8XeCfENksMY0Mf5
 0h9Ei2nBWImj79VZKHHYou78nL6rIzGkBwXOVk09qIkStZgCDfbTaCv8Stx+Gi/k/rVR
 eaoHr0RbS20FHCsme7k5IRgbst+PLqMpmfbN+8INeramQv0T1DeP6vuFVl/p+fyhtp59
 Fjsgu7h3WJlLB5Vb7dCi4wvOjuBN1DCXYyaTND258DkEW9Jtk7NFrE1eaP5YA5n20ieA
 jTbA==
X-Gm-Message-State: APjAAAVIU4YVxZu3B/Nwg31/EWyJlUYf9ZuywSv8Br5OtRMJEAX6J8hw
 8rVTs6wvMW4XecrMZMRoTLuG8upYKCRXZlNvT0qTtw==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr11279749otq.135.1575642482817; 
 Fri, 06 Dec 2019 06:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-9-nieklinnenbank@gmail.com>
In-Reply-To: <20191202210947.3603-9-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 14:27:51 +0000
Message-ID: <CAFEAcA-1Re0noxPN04uXqRYX=-g97jtiweZA=WcFo1OwXBoN5w@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm: allwinner-h3: add Security Identifier device
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jk0n72B/vtuh

On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The Security Identifier device in Allwinner H3 System on Chip
> gives applications a per-board unique identifier. This commit
> adds support for the Allwinner H3 Security Identifier using
> randomized data as input.

If this is a fixed value in hardware, I'm not sure that
having the QEMU model pick a random value is the best
choice. If we just set it to a fixed value in QEMU, is
that going to cause problems?

(Generally it's nice for QEMU to be deterministic, so it
behaves the same way every time you run it. Also if it's
always the same we don't need to bother migrating the
ID value.)

thanks
-- PMM
