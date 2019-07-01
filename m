Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2692164wru;
        Mon, 1 Jul 2019 07:07:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyb1lMi6NJGGOCxxOEFjOV+EpVOF+S/uNWxcTWATnnER2qaD6kR5/IeAtIayJuavHnVGnHL
X-Received: by 2002:aa7:d297:: with SMTP id w23mr28871340edq.128.1561990044998;
        Mon, 01 Jul 2019 07:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561990044; cv=none;
        d=google.com; s=arc-20160816;
        b=Wb3Q5h5TT1jlx5Orxs55TK2JoH8pyOOo8n6aVrCOpuMedg7IaGeZIEw2P9W3KV4mZh
         9DHoPpDQeQ02epJbX2re41dKEJP/uMTUwRouQZa4UQNL049RQHzXfMzGJrgwwmcEaGOC
         OpIYhCTqbCXHXBiKCDDDoOniv3QTXe27JG6w6BkW6kO9U/gz6GCqPwkpYV7CRGvjKV6E
         X+Ik+Qz5Y/YiCQc7S3+Slxg4KG9KgMDckmjL5Z1PZVNWb8F2IYALTFXKb/h5Gq1ii1K0
         gWmWdXZumjKl9IKWr9VYRoL5yYj12lOmvpFlbkhcE07fIhEZzxjvsaxPx9CkF/y0tSsn
         /vAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=PVjMmpPwdek8frF6rNFPjF6DDS9IuYy6pojPPHcGSgk=;
        b=xkoNmAyVRLqGhh1EKVcEIeTAbTpJlSfSrguCaZjLRiKM7VMAYXcK60C2ImfGZq4jCX
         m3oI5M0m7YWqRQ+0sfIKnBOMcqxauuKs6diUdA57kAt3WEog4IHEJ9BtvgpkUQ+6kJFw
         WMnYoulhfjZcI64Gh7zR54MCmeCd7togCCOkfSBRM3I6BK02FeBfOIRkSczQg8euEjz1
         wQn4dGEe6SyjGz9833zzlVBtOGg4HyqpJ5e1FCjhVp/xQ4PB+GRxxMaXwlhslgnFg5M+
         WYYep/CbOVgyaFec3RzL/8/gTGm+C/ZxqZHKOwYl39Ai9dMp228PVgwOJhhfEctAOa+r
         ZwuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bRiu0vdd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si1575933eje.74.2019.07.01.07.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 07:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bRiu0vdd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhwxo-0003ja-1x
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 10:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwTi-0002k7-V6
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwTh-0000FI-UQ
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:36:18 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38311)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhwTh-0000Ei-PV
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:36:17 -0400
Received: by mail-ot1-x343.google.com with SMTP id d17so13516527oth.5
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PVjMmpPwdek8frF6rNFPjF6DDS9IuYy6pojPPHcGSgk=;
 b=bRiu0vddosM8bldq04r9MnXHYz7aNQFTu7Us063tbrs0G1OoJCFoRJ7UhlZqNiXcPS
 XyBTtv42i/ZYbH8lgbWDRxWUe6jWlvS5j1j6JJHlVNqS9URovAB0axAWqSZRYHkXaNVh
 dtmIC2QM4NA0pzSabKtWrmqZ1P/ZdxrW1HB9+x7EQQSZCyFAMuPpC4KCuZ0af/uZVRhy
 8LFp0tgnILW/otCwdZrL2kKoC1xFj7crSQUAtuOa8rb2+gwO14Jd39/Hu7seEJOx2Nmp
 sRN6u/pbNJ4VFAAJbM6Pm495WpV72pzDHrm+iY1I4kEdqqA2GfkYZwIqiX7Zn2o/B2PR
 FF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PVjMmpPwdek8frF6rNFPjF6DDS9IuYy6pojPPHcGSgk=;
 b=AWfMXP2hH+yZA280OTuZWZwU8XNL6gEKo0ZGL13TyEe9t2qtq1efE3hV8uV8SH77k2
 OvzdihVe/OSfIHkkoxIx0sNRSeZCk2fTYfjnA5mA3IST+y0bs7Em5japr9x4STJZO3qv
 QF1F2fb6MpM88URmQc1tkUlPFXWKzDfablMwRBFLrgaD46TbbmEQfGoEBUHZA2jIXNy1
 77KuxwfPTnDdtDE5n19TMXHcOKY+bUg85+57pd+z8MrOOn9R6Yim8TkkGtTK6Lhs2EOs
 wcOkkfFXU2bpP1zbiLKnW4R9kRtzkm7zfvjcdRM4wC8w8NonSaH8Z2SqMD9jnfpCm6ue
 buPg==
X-Gm-Message-State: APjAAAX14ap1YG+WaSrISfDTb+DR6a71yr6sv4Pmybp/RO6WKQ0WVCwn
 whcomu+7H8V75A6gwirZZgcww4iEp7J4Io3bxS9GTwynDrY=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20589831otk.232.1561988176854; 
 Mon, 01 Jul 2019 06:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190621065242.32535-1-joel@jms.id.au>
In-Reply-To: <20190621065242.32535-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:36:06 +0100
Message-ID: <CAFEAcA93PEEsp-6Ko_ELU+0QYPuYQFJLzX1LT+5+LdPjh-jq+A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2] aspeed: Link SCU to the watchdog
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdYQLSSwVIAT

On Fri, 21 Jun 2019 at 07:52, Joel Stanley <joel@jms.id.au> wrote:
>
> The ast2500 uses the watchdog to reset the SDRAM controller. This
> operation is usually performed by u-boot's memory training procedure,
> and it is enabled by setting a bit in the SCU and then causing the
> watchdog to expire. Therefore, we need the watchdog to be able to
> access the SCU's register space.
>
> This causes the watchdog to not perform a system reset when the bit is
> set. In the future it could perform a reset of the SDMC model.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> v2: rebase on upstream, rework commit message



Applied to target-arm.next, thanks.

-- PMM
