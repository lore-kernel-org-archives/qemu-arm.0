Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp170076wme;
        Fri, 18 May 2018 03:35:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqqq5z3/WeApADVu9V/peoNP0UNJXxwWBKW97tX6ZPJ+26GntSZn+HhlC4wErXyK/wKwJyu
X-Received: by 2002:a37:82c6:: with SMTP id e189-v6mr7821427qkd.322.1526639712092;
        Fri, 18 May 2018 03:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526639712; cv=none;
        d=google.com; s=arc-20160816;
        b=XzlikO/RiDXSuZdMDaoRIftHhDEdbbgvsRjCezdbfC/eA4Gr23ivY2Nxcnez5v7fss
         EBKcy3RMw7igZt/aCLDA8YfSo3qhFIpeS1PL7a1m+TqIq59kyrsWS+LVJM00kIH7O9w9
         C/WP4tTOJ1dFlWdVaturngkNNgy08EDP/t/zuDu/23g0sLf/Ms+k9rpiPYgSQPaCjuG2
         aAR1G4KnIq/sbBoMQ4D6JJGkQQX4/coHFqMH4liQywFnRzWL24u3F4L1xTSrrzAgBhJr
         q86VJxQCtzw5Nj2KlXAJ7uVibSI58qclItiFHyfhAGqMpt3GZoTkslUOSxMgsfjrlbSH
         MpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=B6VLlzbmH/yzojhbLmVC21orQGMhrmUS3cqO1HBEpM0=;
        b=CjMDOCaX/5kRihkf9C0psjkKpYye01Qi3+bOON7EYn8ZAb5hGYZ1SzH+/tkW6vOEXp
         cKruN7YmJfwfEA6dicerYcr4SwW4vo71lHN8FkEoqpkEyPN/8ZYNvAAKPnQIH0ptNrsO
         XEZxBXWaO7u9ZsqgQPFAeZUoIV2c4/b+Qy9UPtpbTzuaYfauqYLMBuZZM4SQhC5vgj81
         Poczb5qmgBcEek8mUafV9qOxBJes8m6l90fVTmSfk+eGcDD0MwXuhmw6FmHXAjfmY3LG
         VMQySC/z1qr1CggMnkmnr0XMkqFBHoPCTsKCsNVD4iMi7lViLaS4Eis/oMSvO3s6h16r
         S2yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grbha7PV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a67-v6si1993372qkj.306.2018.05.18.03.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 May 2018 03:35:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grbha7PV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJcj9-0002H8-Ie
	for alex.bennee@linaro.org; Fri, 18 May 2018 06:35:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJcir-0002Fx-Py
	for qemu-arm@nongnu.org; Fri, 18 May 2018 06:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJcir-0005To-0g
	for qemu-arm@nongnu.org; Fri, 18 May 2018 06:34:53 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:46976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJciq-0005Tc-RV
	for qemu-arm@nongnu.org; Fri, 18 May 2018 06:34:52 -0400
Received: by mail-oi0-x241.google.com with SMTP id y15-v6so6661381oia.13
	for <qemu-arm@nongnu.org>; Fri, 18 May 2018 03:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B6VLlzbmH/yzojhbLmVC21orQGMhrmUS3cqO1HBEpM0=;
	b=grbha7PVGvUdoeueWfGM0vP4cZ22z9voOMzx3M5QqSibj5Xg2Hzgg15PQX3qdNWiOq
	tmnfzsW65DbzPz76zBgevEAqTk7IYh6pQ/qH0yXdGgzSiN9+K1NNRPzlM3+lntQfIr0t
	eRUBpgs4/eGxAgC5S4BRwZ4YpPIdhu355abro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B6VLlzbmH/yzojhbLmVC21orQGMhrmUS3cqO1HBEpM0=;
	b=UDPWn1LC6s8+oP4hmeAOUAbkogZ9mx762lG6VyexSOySZfv+fl4+7kJdQYhLUtPoHT
	xkH2qAm5uiVrO2YKLK1jf0U3Dgl84KHyxtTVlPHLwKWzmhSJXAxoxqt1sjrp5PFXPbpu
	NT6XaCGwm8N3HGy6Da2jZk371PcFuqRY6GD+ny2jLZOfiRIWVX/UZmAFzjMp8J5KKB2S
	TuGsgPt4ra0GXDrdZkO+02TJkRQ2n78r2JyJlvoXzZGCH5CcgrorMrQrM9xDQIrsuwaC
	NGnokmDot/JGrMfElZ6tNhyndIaxzBR2ohn0YsOUTaLytRZuKxrJ0B1k6eH52LJtl4ER
	EmiQ==
X-Gm-Message-State: ALKqPwdXrESj36m1OQgHv37kdhbWp9mMhWUkBV4373Xxx7yLlQseKABX
	IBsIl2//3mcl1kA62hYGvYC6ERRcWkcM3iu4QQfwwg==
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr4981569oig.337.1526639692023; 
	Fri, 18 May 2018 03:34:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 18 May 2018 03:34:31
	-0700 (PDT)
In-Reply-To: <291b8b6f-1692-a5ee-f44c-4f8c4dd614fa@twiddle.net>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
	<99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
	<CAFEAcA81y1r5N2zi5fPoV5iZ9dd0YBeThcX=qXdJXdNSNO8nsA@mail.gmail.com>
	<291b8b6f-1692-a5ee-f44c-4f8c4dd614fa@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 May 2018 11:34:31 +0100
Message-ID: <CAFEAcA_REPB2kdppWCo+YbBekLp+FfPVr_rvWVQU2F=H1EsOCA@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LkrpU5cNvm60

On 15 May 2018 at 15:46, Richard Henderson <rth@twiddle.net> wrote:
> On 05/15/2018 06:25 AM, Peter Maydell wrote:
>> That said, I think we're planning to deprecate vixl now we have the
>> capstone support. Richard, what's the status here? Could we just remove
>> the vixl code now?
>
> We could just remove vixl, yes.  I'd like to see updates to capstone to support
> instructions post v8.0, but it's not like we have those with vixl either...

Just to check my understanding: with QEMU at the moment, you
always get the capstone disassembler unless you specifically
turn it off by passing --disable-capstone to configure, right
(since we provide it as a submodule)?

We put that in in September last year, and we haven't had a
pile of complaints about the disassembly (or indeed any
complaints that I can recall), so I think we can consider it
a success, and remove both vixl and the ancient binutils arm
disassembler.

It would also be interesting to try interacting with capstone
upstream about adding support for newer instructions (for
instance they don't do the v8M insns). Do you know if capstone
deals with new insns via resync from LLVM or if they've
entirely forked and just make changes locally by hand?

thanks
-- PMM
