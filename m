Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4093874wrt;
        Fri, 19 Oct 2018 09:59:29 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61B656VNfizxEMOdHES6/j0dn2CTlYtWNqNuy7wwTX9OU/Juac6y52bgOpFlHWwcosfaAq9
X-Received: by 2002:a0c:f90a:: with SMTP id v10mr35994476qvn.24.1539968369287;
        Fri, 19 Oct 2018 09:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539968369; cv=none;
        d=google.com; s=arc-20160816;
        b=iyuzMrJrehRdmMMABKfA6dtj5i7ToRHyp8yrtXQ5a9Os3JrGTyDM+Ufj2aHn08Znig
         LlC77qSrhWAswsFW2604caTqOirdWu8grDO3a0ZDEyl13MSn3BiUCnDO+8eGkZ+JPe/a
         mJ+doQ8jQQC5XvmfuWCAvYqzhj4X+ND8w4fQgRmwRQBY9SYbepSjl2U3h0/PWbTjNSd7
         zV04MoSzBsm1m+kiyD51ya3xPKC7R0LwKYRITlgKqieh7Ml8XOJPfTV3Szchf1p4gTnd
         8DAv9oAs2WO/P24D0DBuWYPv2k2ojTNbKBdiZO/cvCYrbDLH0A51x2ZEjS5I2pCbyCg4
         Sjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=DpWI20i3U8dp3VkmjGnGmKxIfIAd4xvPsa6LdPAtLN0=;
        b=TX2NYDLet0CHKtwksEYbj24kZoSZjoZiERZYhK7XT1V3tHGJ9fIm1ACXdI7Cc3axVw
         88+16tE99jRQpjqoyW0E578biXHKaW1Z9VLcZBCtIL+qlNwVl4x87xBw1sam6AMMFI1I
         nyQj5YOuOcx3pwDpIcPHXZzQUk8EB4V5ISZJDw5etKMEURnJz/+z33rFT5YJJkbyYvcR
         ERndzGSqNui6c+3XafFRRw8e9DbhIcHA7oMSxlS1pICK7yn3ngd9fGbRfwUqciGvH2cy
         2iebih0kDIAcVqfE5n2foTFDxo++gDQRXOrkSav/a4oBHn4S5/uuNMRdT79hWEpQN/Yj
         VOww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UQz5DXW3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i31-v6si1342412qvd.196.2018.10.19.09.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 09:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UQz5DXW3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDY7U-00026Z-PM
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 12:59:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDY3e-0007sW-Em
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 12:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDY3b-0005hJ-K6
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 12:55:28 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43416)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDY3Y-000589-TN
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 12:55:25 -0400
Received: by mail-ot1-x342.google.com with SMTP id k9so33837874otl.10
	for <qemu-devel@nongnu.org>; Fri, 19 Oct 2018 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DpWI20i3U8dp3VkmjGnGmKxIfIAd4xvPsa6LdPAtLN0=;
	b=UQz5DXW37SdwG4AE6S4xwOf/CDHI5OkNMAKx/YI7Y8wC71IHjQ0Ueizm/TJK91URXQ
	d+Bmdk1rQ4GY1ZYJxaEcurzhlHIGjKIdGasiO9n5NZaY+6a8jHL06kkNtIiSa4imj3qc
	bGcd+0j0KflnmXWdDHxBewNTXIayRdsb0l4Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DpWI20i3U8dp3VkmjGnGmKxIfIAd4xvPsa6LdPAtLN0=;
	b=HAjNHb4ThTO1JSjSPmZx7Z9qwVfhd8muz9oFFN29c8pdaLKvqmItb2mNZR8hC/IGYO
	yBA+Ut01WHJWT1QKn4m1AjU09uVM0ai1cJHt5e8G+/fv8Me+ar5QO8ePY+XQTa/1iUT2
	pVoHrNbYM7Dhtu7DyV9lK7uqn1/9X64WCvEz6wyWjQNcIO5Gy4NJ6329qQCXp263rrv5
	8M0aGVdskYaIxxo5kfuy7wNe3pbHrReOg3ESaZmITnpBOpHud7DyPll9hgdp1Cmxrirs
	9DcgKbMGSbF8ynVSwWZEmmhu93nz7SQ+V869otpspMVrFpJ5YxDDy2rzWipcXBg9Cp+G
	XCzg==
X-Gm-Message-State: ABuFfogTGCDD8Eajfalmiz4w/7Wo9RJ+zDsYhBb9ZAtuHgeh7QNTX2qz
	KRZCKSwKUI0JWN5wAlVB4CrIDNK7/UaqLqoCGNgqwQ==
X-Received: by 2002:a9d:3c71:: with SMTP id j46mr23557637ote.201.1539968118273;
	Fri, 19 Oct 2018 09:55:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 09:54:57
	-0700 (PDT)
In-Reply-To: <b43a36a4-bb35-77e4-42e3-d15aebd618f9@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
	<CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
	<a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
	<CAAdtpL4M9zD3LPOMgQNtN50pKzZAsoKn0c_uBe5vajPFwUMJvQ@mail.gmail.com>
	<b43a36a4-bb35-77e4-42e3-d15aebd618f9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 17:54:57 +0100
Message-ID: <CAFEAcA9QtLnFhPfgRgeduB+avJcC9X8Tea1Hi-2q3p9GtU_j8g@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for
 the "unimplemented-device"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T1XSEI0a99vE

On 19 October 2018 at 17:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 19/10/2018 18:25, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> First because I'm using it heavily on MIPS and PPC boards, when no
>> datashits are available.
>> I'll submit that during the next merge window, although the MIPS tree
>> seems now reluctant to that kind of hobbyist work.
>>
>> Second, because it is very clean when you implement a SoC to first
>> start with an empty UNIMP region and a cpu core,
>> then declare the mmio regions for each device (still UNIMP), then you
>> can slowly add devices one at a time.
>> This let you (me, so far) push at most a dozen of tiny patches in a
>> working series, instead of a small series of a dozen of huge patches,
>> or a series of 100 tiny patches.
>
> I don't see however why it's a problem to add/remove CONFIG_UNIMP to
> default-configs though (in the Kconfig world the board would "select
> UNIMP").

Well, it's extra friction for people writing new board models,
and the benefit of having CONFIG_UNIMP is all to downstream
redistributors, not to upstream...

I'm not vetoing this patchset, but I do think that if RedHat
wants to distribute significantly-cut-down binaries then
it would be worth working on a mechanism for making that
more conveniently doable, rather than just hacking up
the very creaky default-configs/ stuff.

thanks
-- PMM
