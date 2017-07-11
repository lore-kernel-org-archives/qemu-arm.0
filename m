Received: by 10.25.44.15 with SMTP id s15csp5146775lfs;
        Tue, 11 Jul 2017 10:41:09 -0700 (PDT)
X-Received: by 10.200.48.147 with SMTP id v19mr1505038qta.84.1499794869859;
        Tue, 11 Jul 2017 10:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794869; cv=none;
        d=google.com; s=arc-20160816;
        b=M6rWovvlYHM4boTqziPxzypvKuf6nieOc/zp4bDuCNO6+OT/NqbHGjjmzQf6x5dES1
         NO9lGNFFZ5CqMdeP5Mw8ItQyagkuTlWOBz/kdBvRgAW9RGab9bSw+yQlvsSdIuAq51KG
         CWUyAnragqL5hX+tpshUT1cF4wRzg2cG/LRIUgzbf1o5CmLDwcLUyc+4ROAaROTF+QE0
         uzUJdAAdZKR1Y50y1EdG8+UmEu6g7ytHK1Axqdw2BLlkqN1DZo/sw45CChitWNS0JTzX
         Jn1QMj3RPbZ01EpTu+3yBOVAmtaX/LinZU40yyNkcdDE0w6xdMHZE4GuV2QObaxrPpG2
         GJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=V/apKeVDaVkSiI0QPNZ69FX7pGTNv4GBo2fuytpVdXs=;
        b=n12Y+yh1LqSQ12EYJWU/Xa1hTNNe7xErcYjRStB/97CPC3i1+l/JlZ3UCIYuM6cAcz
         u1H3OrwBg6yAGeVAVB1jcTmJiRbylDE2R5Yv5ygoCp6XMKvL6K7Wr1j46fzs7V9Qhq8n
         bz4Qt6GLBwP9vgLbIE9b/0Mne7L71u8Ff4WA9rsagXNtzqKU3mn4cxphZXcROQRFjS/r
         Zm9xt3iXOOUobwUu46V7U8OnEMx9eHnsJenUW/0pyKdFLZb89mkerbx+2c517bUziPjB
         BvjJRxf0uffR18iBUIxjIs2DaMTcxY1PUzkL7l4HVquEUqKPL+ynbOTzNCIxcCryqbmK
         uU3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=cpiLo4Kv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y14si487504qty.347.2017.07.11.10.41.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=cpiLo4Kv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUz9n-000139-7j
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:41:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUywn-0005dh-QG
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUywm-0000CU-Sk
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:27:41 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUywm-0000BE-NB
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:27:40 -0400
Received: by mail-wr0-x22d.google.com with SMTP id c11so8291536wrc.3
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V/apKeVDaVkSiI0QPNZ69FX7pGTNv4GBo2fuytpVdXs=;
	b=cpiLo4Kv7dhubTwDH97qsWEYje0zwjBoj2ip/QJACImaqx0AU/HIBZEzn4wHfukTWg
	ejhKE5vxmlQxOvULOKlWTI1B3HSDz/JYTRoYkVWIQ696P9CueBoIwWZ8ldRsG/6xHpob
	PEt78IF7qgHBPmXP42yA+zzM01z+fVSQd9puc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V/apKeVDaVkSiI0QPNZ69FX7pGTNv4GBo2fuytpVdXs=;
	b=ZSWJLNFmKClxceTguitoYPJttzHM137T53HxLtO0BY37XFBTrZ8mbUEbR6JgYwXyP7
	s7WQlwoR1nD6QRLn6RDJujiKGwkooXs0EOk8yV2K1dQLt4comvLfCYBGNMqKWKk1b5t+
	tDw72kfmpwKd8B4QRo1ePTVBT+T63V7DIFMmQSETfLsi1QTgL8+fgJU4tV5SFhmzdNx4
	ZsizK5n1zTu2Kvf396gmmcVL9G32kjJ1+L0migIg75L2IxlhJ9ga0cx56GDq36TuiZQI
	QUOY8LYDD/QxkIFtnmZYK1aH6fyQrb4kwl17zg0rWvcv9pE5aCUUMvt3MDc9qlYOb+PW
	DI5Q==
X-Gm-Message-State: AIVw1139ndEsw9Bd3gzgc02dCj3TsWHghJHm8ERfApBaex5q3RZ31p0Y
	sZPRvlbC0gYGzhyqjF8vp2HboCGVJeeU
X-Received: by 10.28.228.85 with SMTP id b82mr12409600wmh.65.1499794059615;
	Tue, 11 Jul 2017 10:27:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 10:27:19 -0700 (PDT)
In-Reply-To: <1572293529.49604420.1499793538326.JavaMail.zimbra@redhat.com>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-4-git-send-email-peter.maydell@linaro.org>
	<1572293529.49604420.1499793538326.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 18:27:19 +0100
Message-ID: <CAFEAcA9Hv_C-w9hVO2C5WYw7SFOerHPsGb1-B44fQiy2Ud+CCQ@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH 3/3] target/arm: Make Cortex-M3 and M4
 default to 8 PMSA regions
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0YIO9i6sMCAG

On 11 July 2017 at 18:18, Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.c=
om> wrote:
> ----- Original Message -----
>> The Cortex-M3 and M4 CPUs always have 8 PMSA MPU regions (this isn't
>> a configurable option for the hardware).  Make the default value of
>> the pmsav7-dregion property be set per-cpu, so we don't need to have
>> every user of these CPUs set it manually.  (The existing default of
>> 16 is correct for the other PMSAv7 core, the Cortex-R5.)
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> So until now that value was wrong for m3/m4 if I understand correctly.

Correct. (It was too high, so didn't cause a problem for
guests typically -- a guest assuming 8 memory regions would
just not use the registers associated with the extra
unexpected ones.)

thanks
-- PMM
