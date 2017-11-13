Received: by 10.223.150.237 with SMTP id u100csp2344198wrb;
        Mon, 13 Nov 2017 03:32:09 -0800 (PST)
X-Google-Smtp-Source: AGs4zMare7Tz7TeUlg//eMivxdRd8CFQqmHRUj4QouM2dQvwvI1scKuaOrOUwP29/P7Dv3A4DkEf
X-Received: by 10.37.13.129 with SMTP id 123mr5285323ybn.416.1510572729371;
        Mon, 13 Nov 2017 03:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510572729; cv=none;
        d=google.com; s=arc-20160816;
        b=NWNnI/lWOzHHxprNNCdUrCdi29m94RwVMqNiFG7y6TZjKzPaRUO2fIIqiwFMM31tPn
         fdhwKSYfB2b9zJqLN0MRiWGRPtWuqHOu2PyDV1tC/aEov4Aj465GhFUhqR4oHljVWQjz
         6xnHDWBUY0yBkpHe33DjxEnC1EqIiPwFH8klKrkITMtVRGD38V8mECtVUydaOQJEN7/r
         dJzSjdzDSyPm9OXgYVgptQUpFmt5V4Hvd0er1ad0Zh/3UIZ4XBPg2Y+GXU1zsytE7MYZ
         u1mCL1kSBssEkG1fWDTUg08w2lIMfYP6RzSpfBfB7qcVVcrdxeIzgCPAhJJPKHT2EtpP
         xd4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=tNiqILQCBv4EtuMnN43xVZgvu9qjH9kia5UtEblWl5k=;
        b=REaZe5frzBxvFMU6+KoX8wxxGe37NsqJi6ixNOEgIQUZfE2wFkYZqG1bFTVdHgsyxS
         xXHLa51iFBJK8CCArQuCLaup4zeJ8G36iupOQzG3hE4Q4PQiqxFLJbv7C04MwLcluuup
         1XjHa2cSKizkfNX7UoxFg0pLMl37bCipHonisPvS909p9LZxnIrCvef57BCO13MNbYDW
         I2VWBQjEThq0Mz2s1aVapseu40LwT4ST6GYWxn/KrcGTLO/vTdZdLylpBlVlUFazA19M
         InVU0TxSiA342klviO5Xe3Bxf3j6QSju8n/+wVG7EZ7f/qxLO/u+MWnyIBxnEvansqVg
         V6Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bzuk9WbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b198si837538ywe.153.2017.11.13.03.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 03:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bzuk9WbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eECyG-0004aY-RR
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 06:32:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECy4-0004Z5-8l
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eECy3-0000bS-JN
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:31:56 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:46622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eECy3-0000bA-DQ
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 06:31:55 -0500
Received: by mail-wr0-x244.google.com with SMTP id y42so14139450wrd.3
	for <qemu-arm@nongnu.org>; Mon, 13 Nov 2017 03:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tNiqILQCBv4EtuMnN43xVZgvu9qjH9kia5UtEblWl5k=;
	b=bzuk9WbP2/ZK6E2j+1w2L7eXrIYNJtOzAzIAvrqBRxqK/fSKiPvKELFMwjRfICyVoQ
	6wrKf5AMB+2Tsl2qXGWSGiyjxtsxwN8qfXTlEV3ctTZQlCwfbxwZxso61p6axAHqPlNe
	f4P6zhUVzZ83MQ7TWBMpab05QAoN2V43rf0iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tNiqILQCBv4EtuMnN43xVZgvu9qjH9kia5UtEblWl5k=;
	b=AojXMKY+UFntFgbCZ7IYLNBj3TMF5k+jEwOF1XyVG+MlZl80gSPh1g7FfuhOZif61p
	zRHOwyru5xQhUV096V0JUk6zfE4hYxgMvEriUa+QQoEfRPNvPFRBW8oHBch0k2oDqGwN
	EeZK6JO8GDqkk/uEWEzMgap2Lwn/YaXmbrVH8OrcIyoG/2v2KZdd9D+50PDRw6xqnhkz
	gKzJVFXo2WJYc3dVU2goTxIawAxlp1kmNy6+AUKFgHZN23C4U4HMs8OfccmRPp40dRlR
	bS2fsejnDuELrnq/KYhu9bK+6cUDyI0cgWpCnAQa55uqEq2KM3yOeH9LGH+ohWxTa/JC
	4+iQ==
X-Gm-Message-State: AJaThX4iRPz6XaWNggq2AwuoClOm5ggQtFKCJZpyExwZi83XecLZHO3K
	oytX+gdQefo89Yd3EN6vNR0bTEHZ79EfDxVFF6zgEQ==
X-Received: by 10.223.169.80 with SMTP id u74mr6560626wrc.178.1510572714419;
	Mon, 13 Nov 2017 03:31:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 03:31:33 -0800 (PST)
In-Reply-To: <1510552520-3566-1-git-send-email-sundeep.lkml@gmail.com>
References: <1510552520-3566-1-git-send-email-sundeep.lkml@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 11:31:33 +0000
Message-ID: <CAFEAcA8TUn6e-bdcDXnUuLpQm5PWBtOqN1pJbxZPO5BJ-rdABA@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu devel PATCH v2] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ifoaYnNUZLZv

On 13 November 2017 at 05:55, Subbaraya Sundeep <sundeep.lkml@gmail.com> wr=
ote:
> Voluntarily add myself as maintainer for Smartfusion2
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2:
>         reframed commit message as per Alistair's comment.
>         Renamed MSF2 SoC -> SmartFusion2
>                         MSF2 SOM -> Emcraft M2S-FG484
>                 as per Philippe's comments.



Applied to target-arm.next, thanks.

-- PMM
