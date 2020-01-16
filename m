Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8731790lff;
        Thu, 16 Jan 2020 10:26:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzYUUrquatA8BHhqMLHjPuwGdnNKbNNCULLxyncPjg088EJPUnJHauJUd4jJpvC95rtbWx
X-Received: by 2002:a05:6402:282:: with SMTP id l2mr37804384edv.187.1579199183851;
        Thu, 16 Jan 2020 10:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579199183; cv=none;
        d=google.com; s=arc-20160816;
        b=Ju8r5zeezO6xcfQVElpdUXYgJqLVvcIOMS9OT1ENuBzSm7Q6V5uhR82T+d4xdXhUeU
         dxge0rZbeKuhLatr4S5ULG0kaqI0s0ceoD19uWnfyfYlZUU03SRd84+OUAyrYkDlNfQh
         sOhMZga6nvLRrIugU8JPaJleY6jv43WhyqvxrdEwTjoD0Uwaeu29ik+9vCwpDGUG2aRo
         Tpv2Px1byKJk5HgQnU77y7TqKh8LKuNKtl0uKbdOqu3bBqH+vvpvkcG/nkqEWo9b10Mk
         GNFOtPKEO+QfX2K6iavPWL+T6xBB+cWYBTX2CYt55HBsQvVrsFN4UF/TBXgIJ/Z+ijw/
         tDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6wb3uvWE//pbl5HIWjx8Nx0ie/6KPJsZZo9m0HmU93k=;
        b=Nw1m5ZrT0jR7eBiQKtbWHdWfVcFVP5tCpekaS6qxzkk+0An+xoY2UPGqgK97+x9f6q
         uRF/F7kOTB1KqbT6C/p2SBGDlrUpD7G04XgwnIh46sNM/HieVIkD7Qp6jS68kAcCol4q
         GPeCySrSlO5vS0HFW1G8CmCaavIqkEYyj4Oow3SdO4FqMOlI0NtHwnwAHndkF9wxbHrK
         Z3YHruBGhUHks4KdzGPTWRxxP7pV7XXTlb1BJsAxjOSJn99X/eyxX/lk6ZNT7xKByVYV
         o9IknWupKteNzFRmypQNX2lu6fankjpi0lo1KJ6GdVBy5tg5i2scdXKAjbRnavINuLo9
         orsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HCwhsc0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si14700391eja.399.2020.01.16.10.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 10:26:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HCwhsc0W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9qY-0003tP-Nj
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 13:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36865)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is9qH-0003pv-93
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:26:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is9qD-0004jf-Sh
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:26:05 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21563
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is9qD-0004ir-Pi
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579199161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wb3uvWE//pbl5HIWjx8Nx0ie/6KPJsZZo9m0HmU93k=;
 b=HCwhsc0WQ/+7gAmeGnhoMtdD/CK4QlTCScw1ym3J8fjzkz0k+iT5ok3M2IvnenhknAKfsi
 YDn+ChVlRJ1eXwSKojgOBCLCpY1DNnyJp3tdJkM3Hf0G6xAD3IjbRZ1BOOJhFp24SYSXLX
 YSkUNwGS/tCbGMo022L3Do/fuZ2Q+uw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-E5TQbyF-PLqv7LtqFmDnRQ-1; Thu, 16 Jan 2020 13:25:57 -0500
Received: by mail-wr1-f72.google.com with SMTP id u18so9511353wrn.11
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 10:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c/c8V5rf2/aAXQloIrsK2RPGfgbVJD1aae0hGkuaRUc=;
 b=om9Pcgi/OCgsaSm5wODnakxZCvTd2YD9eX6rFCZvS1PtSEhuvkxfogi7ZDIKT2h1up
 vXkmKLQqsMq/H+Bftw577Jo7DI4LOlzD+VvpeNTemO1tiRDYOuRrHieeqRJxoaNnPkUa
 VMFtfVYcR0kSzauZ1Y307cEvVKu73GqFc/yTDLjDrtpgtf2m3/kX2a4ViEKF5jdqgfk2
 CMA9KdwZ43bnFjPeB5ZHQHsLXD6Q8ttfPf0lmENkL8pfA8oex/dXLIAaaKFM5J8hl/Wp
 I+Q/ikW0qdOA4Vr4rEXwwHUeennTprrCWflAgG5rwai7ciwX/X3C3cCtMHGqW5TXqVQT
 DiUw==
X-Gm-Message-State: APjAAAXuVE5X6IqVUVQeivfuGDAGppuWz5N5Cpt72t4I490m6ij9mrc3
 iey7Q+gEaW9AQ3OAvgvyxJ3Rcpxn5auqD07uOMVjYNSKLb4QQ4XTy21bbD5tFoxdIjUQ+/6nI3a
 HwQRdb2aQBP1F
X-Received: by 2002:adf:d184:: with SMTP id v4mr4652800wrc.76.1579199156879;
 Thu, 16 Jan 2020 10:25:56 -0800 (PST)
X-Received: by 2002:adf:d184:: with SMTP id v4mr4652773wrc.76.1579199156615;
 Thu, 16 Jan 2020 10:25:56 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id v17sm30106941wrt.91.2020.01.16.10.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 10:25:55 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: update Leif Lindholm's address
To: Leif Lindholm <leif@nuviainc.com>, qemu-devel@nongnu.org
References: <20200116174226.4780-1-leif@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a2fc8a4f-0b56-7868-0e52-51c2abfd97f7@redhat.com>
Date: Thu, 16 Jan 2020 19:25:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116174226.4780-1-leif@nuviainc.com>
Content-Language: en-US
X-MC-Unique: E5TQbyF-PLqv7LtqFmDnRQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fO3gMIzksL0M

On 1/16/20 6:42 PM, Leif Lindholm wrote:
> Update address to reflect new employer.
>=20
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 483edfbc0b..3c8653f26f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -735,7 +735,7 @@ F: include/hw/ssi/imx_spi.h
>   SBSA-REF
>   M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
>   M: Peter Maydell <peter.maydell@linaro.org>
> -R: Leif Lindholm <leif.lindholm@linaro.org>
> +R: Leif Lindholm <leif@nuviainc.com>
>   L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/arm/sbsa-ref.c
>=20

You might want to add yourself a .mailmap entry too:

-- >8 --
diff --git a/.mailmap b/.mailmap
index 3816e4effe..a521c17b44 100644
--- a/.mailmap
+++ b/.mailmap
@@ -44,6 +44,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com>=20
<aleksandar.markovic@imgtec.com>
  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori=20
<aliguori@us.ibm.com>
  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
+Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
---

If you ack this snippet maybe a maintainer is willing to amend it to=20
your patch :)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

