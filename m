Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp248182lfk;
        Sat, 14 Aug 2021 02:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLQwa/l7IABHMT5/fvW20HpaV0C5EW3S54Byy24dPLdVAxGcGH2YI1A1VtxUrMJ/9SdxR9
X-Received: by 2002:a02:8206:: with SMTP id o6mr6076218jag.92.1628933224522;
        Sat, 14 Aug 2021 02:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628933224; cv=none;
        d=google.com; s=arc-20160816;
        b=U/i6Rj6lLGvQjUSt3D0OKt1VpFg/hYDhq2rcTQgjKetqZ22Qq3EWI+/YmnrTiriY0X
         0SBBUApPG80vz52sks+d5dAlGXumBH98tS3OEIYZlOQyff6eCLMdpxeI7gF1N6zRLZ21
         nTk5kptgNzdr1oT8mYiQcj7Qs+h09765SIh5t4oIfnzbN4SGMHoRo2H1XgfErybbrTR/
         /LJiYBgXe9i3B/X8nXSRo6hD0MTWJa6IFjCCNY9TCH0vaxmblCMYIm7B7xUegHpX1ZXI
         zdUckIDToQ/8i1E/coAZzG7969u2MrCsRRfK8bIAPGu7h0BiPmEp6PoVFZjKQ3opBijh
         1E7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to:subject
         :dkim-signature;
        bh=v4fSUgJ9IHsrbfIqXVM8EGpLRegNoUDJmn1M5mWSQ+I=;
        b=viSqJwWGenN8FRGEzbBgbMbyZ4VOqS0R2g+CwnnDRWWyKb1gNajKXss9ASVtwdaR84
         ImzQJi6KozeBgD6/6HBpC+Iaqv3gY5VJpB628VxBFeKdAmGzFXgcnds7bujfVTPhpYVC
         TeUu+hq7X1UvUSUrLW1CdA0wMDLCz1Qy9Wr9Y5ZlRud2V0NboTDGYbY3KSUV+jFFHhNd
         DwGUB2G8XjsIXB6uxcmDSp5ENOycc+k2/k1/mXH7HXLSyApwn5NU86d1lVW448woP8cR
         uqyJ3vM7uJaerpOYYXuBRplnTPKpcf6KekLH4r1sr7hpFmLClXWyF0pDNakSVGomKZPG
         e1bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=BEIigRQo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si5671772ilj.10.2021.08.14.02.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Aug 2021 02:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@crans.org header.s=mail header.b=BEIigRQo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEpwV-0003jj-Sy
	for alex.bennee@linaro.org; Sat, 14 Aug 2021 05:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpwC-0003jR-TM; Sat, 14 Aug 2021 05:26:45 -0400
Received: from redisdead.crans.org ([185.230.79.39]:36872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpw9-0004kE-Kt; Sat, 14 Aug 2021 05:26:43 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 65239467;
 Sat, 14 Aug 2021 11:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628933199; bh=v4fSUgJ9IHsrbfIqXVM8EGpLRegNoUDJmn1M5mWSQ+I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BEIigRQorO15cDLW34pKHgC5aS+GLb6OGGhHVtw0VNAjjPchekamPdkeUUApYTBDP
 YKLry6dhgKqYecuXAUK7E9h2BX6YjcE1cHlXyqdcNHyYIzbJzRR3q4KiWZg+bh9d4Q
 qiw4TjYewtw/z7+5h78b1wKmeV8qF/rvkrORqupNx+TjNb9dWwRqoT1qCnZqLdh7kt
 dnzxqBEJ4b96ZF3+g3NPi7uBZnmpsMwGJ6JKNpoL4V8YIcL7gbklvaVh4+DlvYJL+/
 jNCkKJFmh/QJir2CaU7pX+bqRLPOTdizPgNfVGI5XCk1OaurM0Ok4bOWPOuMR1iFti
 +JIoTF8Mgzj37/b5lcBMyqD/iQca/vnYnNV6Nqul0AzegCSocIxP4xKX2SgOeGuBYW
 rufnoAm1WRVOEifzUfQCxvbhWhZ3wt0UOdWCFgSVfClHTYclNpAwPf8/VXWqB3r1lD
 TNXvmwq0HFYie63IbeIvBnViA5B/ZkT8IEtudZLrRXGgSaJ+QJUxQAE/dJ2bYneJsw
 Y8v47TB2xOki6EBbCeplNhSzMy8vaMzoTRvmM6XmSKdICuWVCJXYbdXoyRnVKOKxjw
 ybVWyvvuhtRIbD9jY5Zkrvyaeq28AZcD9HIRkelLTmJLZqimrTjhP/vYcrnz4IwXii
 zvQrxhcUYMfDcINe3SzJ7494=
Subject: Re: [PATCH for-6.2 22/25] hw/arm/stellaris: Fix code style issues in
 GPTM code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-23-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <e11f0b40-af4c-886a-fbd0-119a7b84640d@crans.org>
Date: Sat, 14 Aug 2021 11:26:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-23-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DxJYGsFIoGYMpxA7IWQeiKKOOiaHfUsYz"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IwakNrfyuswE

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DxJYGsFIoGYMpxA7IWQeiKKOOiaHfUsYz
Content-Type: multipart/mixed; boundary="fyY15POor2HMcQ1O79BAvSoBJ58dT40MV";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <e11f0b40-af4c-886a-fbd0-119a7b84640d@crans.org>
Subject: Re: [PATCH for-6.2 22/25] hw/arm/stellaris: Fix code style issues in
 GPTM code
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-23-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-23-peter.maydell@linaro.org>

--fyY15POor2HMcQ1O79BAvSoBJ58dT40MV
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Fix the code style issues in the Stellaris general purpose timer
> module code, so that when we move it to a different file in a
> following patch checkpatch doesn't complain.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

Thanks,
-- Alexandre


--fyY15POor2HMcQ1O79BAvSoBJ58dT40MV--

--DxJYGsFIoGYMpxA7IWQeiKKOOiaHfUsYz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXjE8FAwAAAAAACgkQbHknjz/NzAI0
rg//QHy4yFV9KQ4HFLsDLbFQsMRVVXMOgZtUOcSFqIAvqoBj5tH7DrbWol2DS+rU7eLWDVmogQqX
bV2LzbPtTFzDpjwZh9XZ3WpkJP2cKhHwd9EsS7q5ndNXq+DD5jGbAdY4feqHEzQE5xsyS7O22HFl
VT3e/SDWiwwVv0U4RkDDQa1uYVUypyWbn7P4VFHv8MgAdr4J8pfA8Uf8PFpFsJpCdOIf/Fva4MCa
RoDpefGdbbOG+pJ6HPCfhYrruDdpXgVbL9tqNfFLUkhzNjsvM+SNPmjAU10dviajCAWzo+rHiFdl
Wk52ppVf41YndHzHIK0Pt4QvWTBrKn010574KO7VzRNiXiDIG3bifRPPAlaBaRP2/Gh4qP7iMd0A
mUGbGE7J1evQz2PWE/bUKPr/dqq9rXqQaVnwAqKAzNHU9xd8d29MUmJ4ddfmjrEXnD0h9nDlDV9j
tSVqcdS77IVCSSfOFk/wpN+4GZ1XHAcOi37c/fTXEFRza0l9R1mEr+U5ga8H5b1URf7l98XRBPvl
olCjU7ow6pqCyFPmSxHLcDv6bxLFtgXVNaMImvXGhzt4bFTeepsKlrx2nvNQwo9o1bkarU3vu4pU
TDxwxWIPR6A8fFWu+bNighgAFEc3DOW5ZqGUMyTbWI4WGyJL9IP/Bh5M24V8cvRAuak6NTA5d8dA
NMg=
=TkFQ
-----END PGP SIGNATURE-----

--DxJYGsFIoGYMpxA7IWQeiKKOOiaHfUsYz--
