Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp501035wrt;
        Tue, 25 Sep 2018 03:33:39 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61DDPj2flnU3aqmWgk6SHZfTEOGtJazB31SS7jraO0e5zwcV4wJnMrmpqQlhFEXE4i6jATf
X-Received: by 2002:a37:bec4:: with SMTP id o187-v6mr220980qkf.326.1537871619432;
        Tue, 25 Sep 2018 03:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871619; cv=none;
        d=google.com; s=arc-20160816;
        b=tbuTSbuit+O9ck5BdNE3EVD3n05KRtdJANUhuFiFsxip7LNQAsDaXeagsyB0k+tZpZ
         8Bf2nalIRu9B2X3exVu2lGTs49yPyu50cVFDV6CU7oQK6zvO4lHoPhkkl1jbQd78+42n
         Unyigl74QbzJ9Hu3DNFFMesnP5FWv9UY9ukWaYtak280hWGiCCSDatzKgjmZDW5cPwZV
         pvRwm5dWcBiFJ3G+H3CPvMC/awtBs1b5Yp+BMlzxB/N0xwrfxiE3ERW9ImU1AyiYO//8
         XOX7xtBoG1PJnP7kdnJIOGhEKJe/07baAPZ1Ecfj5sXeXy5kUgQUWHVETaG2Tr0plZUm
         8OvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=PgLD9kjecK7f04CUJaU0Z+v5gfXn1g0Llsq7z3lZrBI=;
        b=GaGbtEPV88XwJaroI49IKf+DjjX9DTSS2P6KNus2z+k0i1JSzwHl/AtT55+GbS+muI
         N1LnhxTSyCATKzHEKxeoStAf1PhTVn/Ns/kI70dasAyETuvUM/4Vk776xihnICvn7Wbe
         7Pdnr4ehCj2CqFLSFHK76CZjoDmyXinMUiRl+H/EJLVtd71QiKHPfi6Tg+HP0Bs9jjHv
         T9nNeX5VTaQuWPTca0pgWdA6WtphsUhxe5meCS9+Fp70GfFA0gSAEXpWa9r7Ds4LwN5C
         YvBeaCLtNvTZ6SJD3aEk0W5avWXUP3NSz0ZhXEykcwaaDuLYj0HtA4J/jwTbH7ehvEVl
         8XDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YT0oj7sV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17-v6si1454126qkg.9.2018.09.25.03.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YT0oj7sV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kew-0008GF-VB
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:33:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kZ8-0003Fl-GI
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kU5-0002bf-Od
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:22:26 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kU5-0002bA-Bw
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:22:25 -0400
Received: by mail-ot1-x343.google.com with SMTP id i12-v6so23874452otl.1
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 03:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PgLD9kjecK7f04CUJaU0Z+v5gfXn1g0Llsq7z3lZrBI=;
	b=YT0oj7sV8sPzKuXXLLjrKRuh6DIHJscGEr4Nqg7SbzIzymM9/rroKGmG7rrFfOFMxR
	lSDUBmWVm1K7l8GZFPS9zdt8MMWo4updqfvFEeq74KgJ4pgpy/9W//wCSFJX3MfNL6BT
	QDNUoETgMDXAaYGDUpKYLrMIpiyGM4P0CeI8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PgLD9kjecK7f04CUJaU0Z+v5gfXn1g0Llsq7z3lZrBI=;
	b=TcHkiMghHGLtMBkQXGx90elMBiu2zPNDTq73x93oW8nu7Xv40b2fvFPnZzLX+zsRkc
	KBHJ+iqPkpWzSluh4/dxK5EXgia+WM7rktOCCid7y4X/AUS4fMhj6DaZXh7dpVYE88kG
	0oBj4Ox6xDh4v4x+GrXzGZMqSVUcdCfwwel2zxQTVNNudQisKSPZeMDg5ynNhJaazaGb
	pzXlakHvjnPfZ1ymqk0UDIheQcztytZ9jsczP1jIVEt5+U/x1If2k2L83wBjzVTd8Axs
	T/dXEa+YhsUTbTBF+PMbwAC1TzGIi8vKA4DMRQ2gSzMeZoeDm/uxnhfirOrSEG1oDLEk
	rcGQ==
X-Gm-Message-State: ABuFfohSn86ULYTNLlJ6eOqrW8wm/1GaZvNTsgASHJi5lQZHIBIGYLbL
	7B6TPmOa50O9U2glDq0Rb/KCueGVxg9G1k4SPxfVxw==
X-Received: by 2002:a9d:640c:: with SMTP id h12-v6mr210749otl.75.1537870944582;
	Tue, 25 Sep 2018 03:22:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:22:03
	-0700 (PDT)
In-Reply-To: <20180914063506.20815-1-clg@kaod.org>
References: <20180914063506.20815-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:22:03 +0100
Message-ID: <CAFEAcA8aCKcZvmX6-mFUwKpa69Uz4sCJFfxbrV+6espjDvALwA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 0/3] aspeed/i2c: fix receive done interrupt
 model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3OdbNgmNt3RH

On 14 September 2018 at 07:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The interrupt model of the Aspeed I2C controller does handle correctly
> the RX_DONE bit. As indicated in the AST2500 datasheet, the RX_DONE
> bit needs to be cleared to allow mode data to be received. This series
> fixes the behavior and delays the data reception until the bit has
> been cleared.
>
> Revealed by :
>
>   [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq event=
s
>   https://lkml.org/lkml/2018/8/23/1366
>
> which fixes irq handling in Linux at high bus frequencies.

Applied to target-arm.next (with patch 1's TODO comment removed
and the commit message tweaked), thanks.

-- PMM
