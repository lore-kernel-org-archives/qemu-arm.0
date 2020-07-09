Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1715052lfm;
        Thu, 9 Jul 2020 12:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYA/Uyd/AC+Av483teO2TDVSzU43068TjLrEKSewQeirZ4B/k4w5dpq9gND98t1T9BQI8C
X-Received: by 2002:a25:800a:: with SMTP id m10mr38999975ybk.41.1594322070903;
        Thu, 09 Jul 2020 12:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594322070; cv=none;
        d=google.com; s=arc-20160816;
        b=0K+9bV2nLX24SQ4jQhMaaso0jDAlTwtvflZamTEQ+8oQCrcD1fNFiwPF9IKFepfqu4
         jsluJjW8gWMMXU5h8XQeodValQV22UyF7+UL/xrMZfCfIIm2S1Y7AiIYuW1hu4AWUjRH
         CsdD+WAHmY6MpuXOP6zriMdX+icdu1arWvFvptoBofdkBzncgL71vZXjatsDBR1znIIB
         V1MeeOqXNYLPbAMedbBUrTogzo26mZcGEo/5x01+5Jo0tZmyE+l4ZPVHcnWq8Zh/PtLn
         EhLW+7hQb9h3OZhZx7XhPz1m1acfLHC3VhdD4PSD0hZNGaK6a8K2aqj7FEJz5OivtuLn
         BIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3tmiRfBlz6AR5ERL/X2E9qzH0gGmzWuAAimpyQmTUSg=;
        b=ZZ1LfXszqJ0UmRsdF8EEtl8FG+xTNBVMdv0JZoTVv3Ft9gOCPH/DmaWWoRZ47KmYnP
         h6J/0wX/W2Jqj3AE61DNywIKCWtITDCDCTiCAT01yXLgk6fUn7uIibnSJw5561DApg+5
         nkKto71lKh7xgkPBCVqwaaitx6SGpNaTachCWx0hRGJUz0CM2lEk0S8f+9wvkzepG43F
         7fz/FOE9mdRa9jTNsHBBBbys0jIslY6l6ouLdfXeMqqt3ASwSbZK+VkCnnCwoGJNMQfd
         JLGdO1WgWTJjUhwPtYF5Agi3iKaciHDZtR1Str0zX2m4oaoLfIkBV/en5KaBzEXeFpC1
         VLZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiiSf2hy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f88si3568275ybi.79.2020.07.09.12.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 12:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZiiSf2hy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtc06-0007kA-7L
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 15:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbzy-0007is-J9
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:14:22 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbzv-00053R-Ir
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:14:22 -0400
Received: by mail-oi1-x243.google.com with SMTP id k4so2793140oik.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 12:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3tmiRfBlz6AR5ERL/X2E9qzH0gGmzWuAAimpyQmTUSg=;
 b=ZiiSf2hyZ9pxd/Vb0cO7sutu44m9AB/YFoqXZr9b2ihtLoV0uIZcjnIlK/8nN4EHi7
 fUOq85oxzu9AWnUKAPUg3e3zhY8SuPjNOmceFZVhl2uO+HLGXlHFxK/NWETJ4jrpjA0o
 2pQXLFMknpqs2urmXAauynbh04v80ZE+1lscFPzUE+q7KVzT7k2RoVXeWWL6bHr5yg2+
 o4uAOEgqHirczvQLUGQBb4hI2iy3H2M4rv66zZKBzHDG22HUpz4gWd3ssmAtMUMCqk/J
 jZk3dSfvy0XelxaWz6AdKe+zutme3RD0vRWBO/5yNtMwWzQM+YvVKj9HrOn9tclSJ9Qx
 nAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tmiRfBlz6AR5ERL/X2E9qzH0gGmzWuAAimpyQmTUSg=;
 b=LvejI7mDl7gvZhPmZiTe6Z2tPfCMZyJqXKOObA7KBbmb5VS5TYAHo2WNw07MsBeBxF
 0gUDkqWpUlsrfvCy3J0ySwh5WRBszi1tpmGuz6Ul/XLe0wwTNA8kJfTDVnYPwoc7RCy8
 OvUB2b58XOWwiIlgt9fCQ6W3+30ViK2wWlFntzDY4xxM1T7nUtjUoi8hMElvO6cB0xer
 1bmt7m9gAILwWNguOTIAaOvtIYaYEyP4hOPsBYz9sAxWlKLghM2h5IxJXNKrveAgXWDH
 8NOwXkS4aAi/p9bP4qV7EhhnTJBRjS+ZxsXVzN0q5/o/VoyIcn6N9TqK813OcFo2fbme
 u0+g==
X-Gm-Message-State: AOAM530cirjKrBEBADNi5fyKbEXT7QwdZ0KKHe8IyHKa7eTqQRXsCLFT
 5Rn5hFSeTAta6Xw5JuP1coHD5PoHtKPNLqotjyo6dw==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr1375678oib.163.1594322058138; 
 Thu, 09 Jul 2020 12:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-19-f4bug@amsat.org>
In-Reply-To: <20200703201911.26573-19-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 20:14:07 +0100
Message-ID: <CAFEAcA98Wz2URx3Pt0YfaoQSPnnMT4wg6HBfzdDO4Zq+4fgT5g@mail.gmail.com>
Subject: Re: [RFC PATCH 18/18] hw/core/qdev: Display warning for devices
 missing migration state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xhedWDHenskB

On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> When built with --enable-qdev-debug, QEMU displays warnings
> listing devices missing migration state:
>
>   $ qemu-system-arm -S -M spitz
>   qemu-system-arm: warning: missing migration state for type: 'pxa270-c0-=
arm-cpu'
>   qemu-system-arm: warning: missing migration state for type: 'serial'
>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-pcm=
cia'
>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-pcm=
cia'
>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-i2c=
-slave'
>   qemu-system-arm: warning: missing migration state for type: 'pxa2xx-i2c=
-slave'
>   qemu-system-arm: warning: missing migration state for type: 'ads7846'
>   qemu-system-arm: warning: missing migration state for type: 'max1111'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because there might be something simpler than --enable-qdev-debug.

I think where we'd like to get to is installing a migration
blocker if the machine has any devices which don't have a vmsd.
But for that we'd need to be pretty sure we'd got all the devices
on machines where we care about migration, and we're clearly a
fair way from that (eg we need to do something about the
devices like the CPU which don't have a vmsd but handle their
migration some other way so they don't trigger the condition
for warning/migration-blocker).

I don't have a strong objection to this --enable-qdev-debug, I guess.
Another option halfway between this and a full migration-blocker
would be do a warn_report() for the relevant devices when savevm
tries to migrate them.

thanks
-- PMM
