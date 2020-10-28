Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp480315lfa;
        Wed, 28 Oct 2020 06:08:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFQ1+xxhaRBEGMR0hxSUyIt4oT7GtTKUXRt/pvLVltuPOeuiEPdeiZnpyvnn/vjdXhJdRM
X-Received: by 2002:a54:4199:: with SMTP id 25mr4982882oiy.50.1603890497175;
        Wed, 28 Oct 2020 06:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603890497; cv=none;
        d=google.com; s=arc-20160816;
        b=RF8kQFdlEm+xsm75fbi4ZUuuWX6CAiS/19ooKCQNnHWROHi7CR0HY3mhdIEWA36jLn
         yKwpDphTTqMHHWNF+EvB1OHAXnucabvV02xAFXzvsse+uloIby9sApsg73MdKM5K7ixO
         FKko1PSuzWPp1/vPTH5e6l+YYurXlzILyRFrZHdltE+m4QwQwnROuBrdyTI94JSD8bF/
         MGIHpkC4jNnx/c/vSSQA6qt8iZixE0UaKA60ug1fcZRiKP5u6P6jueK3ohKPHx6KKFUm
         HY7Vem7ccFRW3vNkFuoXpnHpE3x+vyyddyeCnVrENWPuBJMPSaqimE3hoZOY2tz5a4y/
         kAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jLIm5qwowyaNOtDHvKZ3loVnWhxmKmWaHmOXmo650Ek=;
        b=MAzeGbi2n+v5/O0bsdA4NgJZ4FEYtNwmSo9fqHJBAZMYaPbcq0F6l8j+k+ZMJU2bK8
         mbuSkq06zNR26r2Y0APYYpsG0h5dji1i705wLULztwR4DMKwN+JiFbPyrCjjzoapLXDO
         2YYHmxXpdN+wNbY5tRnYqaRhbsJvhwH1jdOJNf13aky67Eu2NvYoAzBMXiBxz1fP/Rcl
         fYqJQxsqR688zTaDUdHwp/+1KXmxPnL7jpzSdPO5qopJEJSD/HGjOE3N4lR4sP01HYez
         YNCNUA0X9Ceq2JsOG9QEceDjbv5jJWMvFHqzFBRuadFbWEwUcOsOT5IV9YtbLbLxgYAl
         wMsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lR1UI+Yt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si4229955ybm.416.2020.10.28.06.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 06:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lR1UI+Yt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXlBY-0000q1-Ff
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 09:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXlBP-0000pi-OT
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 09:08:07 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:34213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXlBN-0004vQ-Ka
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 09:08:07 -0400
Received: by mail-ej1-x643.google.com with SMTP id gs25so7121361ejb.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2020 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jLIm5qwowyaNOtDHvKZ3loVnWhxmKmWaHmOXmo650Ek=;
 b=lR1UI+Yt1hxzxMnAPC+AH0+zEl4DRLWdYe7SETqoVPQXBQM3WT9L6O7l0uwfphyDBE
 x7By1UJ0ZYgp0mJF+kCfi53JbXlCfe1XdPLJoW4txBO2iV1TfU43t9b84cTTH35PG1J8
 82QfzjYP4Dv/J/XQSzdYO6K4atIIwS+6zvGvzP8gq+Z/JWoHz7Iq1Y3Ww9fudTZvTZlu
 H4hMoZPOLxCcvovDIMroZ+d0wAwdS26qAzysurDt+z6nzRVV5l2+R+IB5drArtE98G9O
 hzaw3VBw33G7Q0pb83J4kZmTAe131tq5iJvvxewm7frEU1ElsNe5ZTTQzSgXxAhBSn14
 IsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jLIm5qwowyaNOtDHvKZ3loVnWhxmKmWaHmOXmo650Ek=;
 b=Vj04FGh6LVA1CGRT1+XIKktZNB+qxR60rbjUYJLQ+ncyOSkm0bADZ35NnOlkXXTlsA
 cHNMBqk5GpCXRVX7Yt9UdTI/9GvIQ0jne83FcQP1Mf5Izpx9rGxRCIF8OhxLYNcvXfxX
 3zb1boSMXOZaX4yx4YnDTPH71wOK6750Zj/KduOOFnMrPFPfDwyx6b52+nKOYDN1oWZX
 U9rjXVx0DSw0dZF0IxtVrfni47bCh0ytClPi8txLrR6IceyJXSzBqYTFl55pQaPGm7aJ
 L44zZknbcP2EysrVUQwokp24vPwDL06lpXEv/k2QPM1sneKDsxj8jXv0KiMa+QFSx7Ko
 ftGw==
X-Gm-Message-State: AOAM533m3QIdAJGPqPUacL2iGDWrD7dNeLF9eUfGxqa8M7qXO1ldHw5u
 xR+fdBQhmGE5GI190KQujumlOgDHSqALkVUAd9uHqA==
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr7417488ejd.250.1603890483827; 
 Wed, 28 Oct 2020 06:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201026220624.60878-1-f4bug@amsat.org>
In-Reply-To: <20201026220624.60878-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Oct 2020 13:07:51 +0000
Message-ID: <CAFEAcA-2+FerNXySJsUMesSeg36b7iuHYJN4L5CGE-VU+VHx5w@mail.gmail.com>
Subject: Re: [PULL 0/7] LED API patches for 2020-10-26
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZ9yRh0H9Ncg

On Mon, 26 Oct 2020 at 22:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit a5fac424c76d6401ecde4ecb7d846e656d0d6e=
89:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
eque=3D
> st' into staging (2020-10-26 10:33:59 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/led-api-20201026
>
> for you to fetch changes up to 06972067c48fc21a47445b5d706368f1129f216f:
>
>   hw/arm/tosa: Replace fprintf() calls by LED devices (2020-10-26 13:44:5=
8 +0=3D
> 100)
>
> ----------------------------------------------------------------
> API to model LED.
>
> CI jobs results:
> . https://cirrus-ci.com/build/4879251751043072
> . https://gitlab.com/philmd/qemu/-/pipelines/207661784
> . https://travis-ci.org/github/philmd/qemu/builds/738958191
> . https://app.shippable.com/github/philmd/qemu/runs/891/summary/console
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM
