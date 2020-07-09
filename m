Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1707204lfm;
        Thu, 9 Jul 2020 12:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxELQdnrhKzO5BLMcnfagcdgY6moUjAdLp0tXwO+tumxzkEIb49xeOBceHiC+V52wtS7qnV
X-Received: by 2002:a67:2f43:: with SMTP id v64mr27662975vsv.128.1594321484469;
        Thu, 09 Jul 2020 12:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594321484; cv=none;
        d=google.com; s=arc-20160816;
        b=XfH2p02XzcN9AXkM7HcsGpRKYHtsWD0rF8grBkUYF9BAQph9nWKFOmoKH9XIgkERoY
         DMw01X5AE+j+X2JQZtOgamUVJevowKXFKet3nDChf+AtYphHrVGXymO8TT9DY+Gvmps7
         NuCvLJYoQLwEfrYGxge0q4dJO50gMPxqMBePzkRyK109qiDHpC6BtcVye+T6KwY39Vpb
         66v+9+yegVpc5fSLnYUWmevThz2VrYceCfXVaD0dvIpuzprdA4J7hrkEVuZeUATO3WRV
         yUEK5GwSLmbw1cyRM9p9RiOa4ufusN/Bj+yzEIj3Cd/s6FD+XZDr7vhpIReF95W24q5q
         +nXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J2eeil11Dp8L21Nn5ph9GH8uW7TeEfvf8jiDfM/NIMY=;
        b=aqaHqinE40oqBO0PSVnw1q8XYDYK18r9H8Ozy756T6Qg6uXqLNho/gkvTf5iK4pUNA
         hux4ahjzFSdDWlawmAxvM8EifviKcIGWEp9DBEZrLfJWA7EzhFgdL82mnGXqIKKA6pF0
         Bhs1I9teC1rFtBvoYegkf0edy08uF/bwY2sLNfoQsnCp5n2AMAuswY5a8+CU3qA+wFsO
         c4HY5et4jlFrJK11gSXD6Nm6X3Njz36onmSFFK0esVJVAr8gwhWfnVEFhJnbghUO2A/N
         mXx+pJZ7CK5fDJ5ef+o6SxpeB17h6LhQNBRYFmmijAOGlBIkWcqCz0MbSdF1rihaG3Jd
         KnKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U03TCP4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si533296uan.257.2020.07.09.12.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 12:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U03TCP4I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbqd-0003aM-F9
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 15:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbqN-0003ZS-J3
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:04:27 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbqM-0003tG-2g
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:04:27 -0400
Received: by mail-ot1-x342.google.com with SMTP id g37so2444988otb.9
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 12:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J2eeil11Dp8L21Nn5ph9GH8uW7TeEfvf8jiDfM/NIMY=;
 b=U03TCP4IQ2bidnA5mdFofgkt7yVuEnRY64FMdHQqsEuAz9WM87Nksbg1hveSfrREs6
 T79vSZyb/gvqcPYCDXbP/6LwB90Edy8AexZ9cUxxhnB0IBa5fFJ9V83XmLQ0mXHSPzC8
 a1utXvK0YvMgRBUUhVnSvBIn8kTUbo6ugpqwq18V/JMxgc+QGrcEob3uAnpld688NGLA
 AYM1JtjipQ22mTV0kguQAWii3PflVt5Assrge72J65/YGn6HBteNNnbl1F47i7eUjqzE
 xAL0EiK3VaVj5YZWjwLGvGkmF5TL9vW+xvs6huqu6aI8nLkEhqwb/PUTpvr6U/hZwWml
 nuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J2eeil11Dp8L21Nn5ph9GH8uW7TeEfvf8jiDfM/NIMY=;
 b=Z45xxKwyOia7ENnJu9pp1UTuqhcbm5OQWh4ojlu5QsujMmB4tAHmMPrffrwXDAXTAO
 qaDHkLluu9QfDAx1Uy51LZEMHp/cXMvL8aXsDljV4SEJVSXkNtuaQSQa2ZxUwOJFK0QF
 gfH8UyKDcXBqL1zIXpfG9nZd96n72R2AVnb3HmVN4hSi3U/Zfn5MB+gZP7wHHlddPusn
 /wlf2pe+cWOpZimxvHk+ICmlWqIPVJPipeuLAJGEUgvnXtbm8jQeGlLIxT+RCU1XIbhh
 CMxML/K9BVRYq6xPKtwfnl4Hz3EZY5N3v9t49Hcd0T7hTLDkTTS2K9HUOVC76fCtSF7V
 u9+w==
X-Gm-Message-State: AOAM5308EIEDIFsVr6tLTle7dY/m0C+jmAmdSVSdNj0pO7ARCKbwPlbT
 rbwr8JJ11tGdpKU2jclMdlGIf4PybaFgpLOYRBOfiw==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr47557016otk.221.1594321464982; 
 Thu, 09 Jul 2020 12:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-9-f4bug@amsat.org>
In-Reply-To: <20200703201911.26573-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 20:04:14 +0100
Message-ID: <CAFEAcA_Eis4KXhM-ZKNUP+o0qLQM3Xsx9QWmnP4j0eX=Dj5ULg@mail.gmail.com>
Subject: Re: [PATCH 08/18] hw/core/split-irq: Mark the device with no
 migratable fields
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MlYNUMtbjwHX

On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This device doesn't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/split-irq.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
