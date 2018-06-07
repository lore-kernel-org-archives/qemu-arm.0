Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2057811wrq;
        Thu, 7 Jun 2018 05:47:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJFUwlRwaqZYzr+9zxM5mzqlbFXwCa1XG8EF3VzHQ1rWhcBiizaAM41Ri7vJLi46wp7l0E6
X-Received: by 2002:a37:5203:: with SMTP id g3-v6mr1268754qkb.238.1528375678441;
        Thu, 07 Jun 2018 05:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528375678; cv=none;
        d=google.com; s=arc-20160816;
        b=sPkhdc18oc6lW6kY4U9GRy0HEeLz+367mQH+IexVXMywlXK2Eg/QWzPHvpOj1sN44u
         lX7kCQNmfmpFiPO8kn9ARTepqTvxqRhP1fUywQzWLGtXaHxGruQvt6CMF8CxnxivCBww
         wbpn+r2bDnP6ZqMNgKIkyVZwHEYCznYAyCGn5WblV59Lrd+ruWo7hxVOJu4OG4+AuRRE
         E46rIusQ8+ArKcezNBg7PgBXCkANb6rDKQRllc5AM6exjwbiVoogLmK2uhoHs1TCl+i3
         3jcMubnreT4Qumk+MIl3ak9LQqSBlefzEtr05kJ1Hy7L3220qQ1DaDJf7n7kwNNZDEol
         7bOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=U8sBXY3MytqluRoDwokSpzuWoBq5GxyvKVNNB0/mA5A=;
        b=pbO4X/jO5niC+Lg9/mso22avHg+9QiKk8C+LlIGrZmCkOzmLzYCUrQnk014nKf78k1
         +OWfi4ABWy/E+Yoz2Njvo3+AAScjOOPdv3kXjKgOC+01YbyNp+CTHLzTa5BN3O1laT/i
         3A/o3o9JDxirsMOSIDz4xpPPaD+EbQP9SaRwe65dAYGIKnfaChyJAWwdesQ1zdOF2Aj8
         4+OFyQohgm3KV/oW2l9/CjkV8jYJwUWxIjJGr9Lz/fMIEsAwCqUGk/1GLpP8cWvVVvxi
         HXnwptxQ7XBHWhs+9wJO/ffnZx+w8e1WEZeJDX5k55k2R7SZbwMuO25FYY6kRQimfJSc
         eRTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYhj+GR1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b126-v6si8559857qkd.320.2018.06.07.05.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 05:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYhj+GR1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQuKc-00042C-2m
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 08:47:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuJT-0003b6-Ty
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 08:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuJT-0000Mu-1L
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 08:46:47 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:44812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQuJS-0000MC-SS
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 08:46:46 -0400
Received: by mail-oi0-x244.google.com with SMTP id c128-v6so8452922oig.11
	for <qemu-devel@nongnu.org>; Thu, 07 Jun 2018 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U8sBXY3MytqluRoDwokSpzuWoBq5GxyvKVNNB0/mA5A=;
	b=FYhj+GR1ZH5qyoOcLPQQKxGhcA6R7NkDJOIgpAQ5Z+sQD1/3h2dbD6ftXX4SD6PzJq
	yyphUbHKdXxmX615PEqjEZBxRIhyxfXBz2CrcLLHG/BH/UzPeztCcvWfoRGd+xLjRpql
	O2ptX4PxLnwLLRKcKCXT7KF5D1QJ30tg2WXVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U8sBXY3MytqluRoDwokSpzuWoBq5GxyvKVNNB0/mA5A=;
	b=reEjUtfEB3AaEfoW7ATrPnlQQJvrRJVn1uko64/vYtEQkYSvMPY4Ln91VkhhnWBbup
	C1vH5rw3QpPAJLveIMQVA80JOd3pb5X0fvBNtqo/L3RD0cs6/FlxTGFpSgAALnhL7vQS
	tw2WcbxNtZWtDl1x3bPTw/m0tyB4Syx81YoLixkUyq4qUEXOQIiU0NKDznXHu0Ta5g9g
	1ZSzkZaD7gcsdOTxAi8u9U5yrKn5Qn50ji7CnzQUFnOZZ7SjoP1NVaY1D69bS5wY2r5N
	q0OOfrs1K5lyQKgmETCZNqLNE38tAG34mV107GalUrvJiXCy9ansjd8CFFjxM3tiOCL4
	x/0w==
X-Gm-Message-State: APt69E1o0xERvtpDIxqwHFalmF0fstsTcUGri00hRSswolgwmcHQ9Uuh
	Bnb9L+4AFvcVzeOEhlo0ytzL1aVcrXUtEmMzYkPR+Q==
X-Received: by 2002:aca:a846:: with SMTP id r67-v6mr841321oie.12.1528375606241;
	Thu, 07 Jun 2018 05:46:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 05:46:25 -0700 (PDT)
In-Reply-To: <1528233505-25842-1-git-send-email-thuth@redhat.com>
References: <1528233505-25842-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 13:46:25 +0100
Message-ID: <CAFEAcA9kb-hjitW45FgiVmmUoyH=zTctEc0Z9ktQZOz=F6_eCA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH] hw/arm: Remove the deprecated xlnx-ep108
 machine
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLASpQ6fJlTe

On 5 June 2018 at 22:18, Thomas Huth <thuth@redhat.com> wrote:
> It has been marked as deprecated since QEMU v2.11, so it is time to
> remove this now. The xlnx-zcu102 machine is very much the same and
> can be used as a replacement instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to target-arm.next, thanks.

-- PMM
