Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3947740lfm;
        Tue, 30 Jun 2020 06:17:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA/CKYkSdjxX227+4lqMuPsrSEcnLbXl9A/b2ob30CkI672GmPmDszJ58J0VbIhOhiK3zo
X-Received: by 2002:a25:d1ce:: with SMTP id i197mr35327271ybg.296.1593523029905;
        Tue, 30 Jun 2020 06:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593523029; cv=none;
        d=google.com; s=arc-20160816;
        b=ycyf+RJRKOeIQM29pP+410iCKj8YAlAMDThLw8+In3HkE5IbY6Za2GJlpCBLD2Fc37
         U81cJJ06K1nT4MjyY1m2N2J60Xq3eLN5BJbILV1OFS8sljsgSuZZ0IBPTzCZpSYsy6SS
         P4rcIRogQ0JH/PHUkjFd7+Qb5Vy97LuIdxmxcmnS9epJIYwENtiSbKWS/E9yS7dZoRsE
         0nh+Ox1n8Pzi6XmX8yGbAZjKQE7WUqeLjbGo4WnNlyWYGnpg2XlgrscsSe01I/uww/e5
         IiEDWdtE51LxDItvtHEb5gNZXhGRTpQ66b2B38bwd2gSHAQIQ8ZTvhF9LzATUAsva7+Q
         IfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KoO8IdXRS1Xvt3wYeZX5y6sGdbVy2nRfMEpFfU+MFTs=;
        b=PYWmCD4ozecOXtxUYL4O1twplVVGfh/GVUvffPBT4Srxo1b6wCUrjNmTahyfCWY4uo
         51o+pXlCj9Vnf5LTmfyAV6Qohycq/vxhSOZukDzv1qjBOweCW5ZF2ItGQXd+AWw6dela
         9kdxtJXqvf5z3mL75t2UGtxQ8m1rCFvtuF/DpMrEKdbFh5iNPBgeKQv+a0lsyamml2OJ
         EeK3jWSSqoRLqJyCbjAjjDAielv9+BKBdCysvLND/+tUrU/hhvcDd8OoZcRXysF/Ccr9
         UGeTC/RuvHcnsO9qb0rvqrSyBHDs5zfe2La/CBfSF/c9ZPojq8OhzzWonjCkZN9o/r3D
         +tVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=szR1BTiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j190si2677328ybg.208.2020.06.30.06.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 06:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=szR1BTiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqG8L-0000a0-8P
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 09:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqG8C-0000ZV-FL
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 09:17:00 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqG8A-0003Ag-KV
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 09:17:00 -0400
Received: by mail-oi1-x244.google.com with SMTP id s21so17388684oic.9
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 06:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KoO8IdXRS1Xvt3wYeZX5y6sGdbVy2nRfMEpFfU+MFTs=;
 b=szR1BTizkRu4VPdBh7wfp0IIIsMeulpZ8QJ8wKoi9+pbWaeAfcfd6/BZwT74ljjKDg
 89EEXBzWXYrry9F9BvLrg2329r2e3MUPiHlO8+GQd1uZls2GgYcwqHpCAmCKnFjkZvTB
 qASa3DS40FzsieXcF6y0J0N9DzEEWbgKRVu8tWmMcTBMFFUU/fRHmx3nZMD2+XKW2via
 9/kCSXbV2aazSNcndWXNoEMPIQ+r+ogJp44rhQ1HdD+206z6coSloLrHeHOrf0S/YQPg
 oQj5ZgazPBongvWhJn+CqHJEsg+ubPI/wpvtmydYRpu/FxS8wAZTbZFavUE1xyw+ym7B
 5l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KoO8IdXRS1Xvt3wYeZX5y6sGdbVy2nRfMEpFfU+MFTs=;
 b=cS3zqo5t9vEDsphLK0qhO/VDXo7OHOgDr8vFgxqGQtoMo9FQQ/apoYEUBWA4TiFNcx
 JkeHc6+EHLgRkagIRFMbLIFuom20xn+9JIr+SJ8ejkK4DYVcxdz37LtUT9ZBCmp/b3Nl
 ZJs/uohemCVDajvlhr/CdJEN4r5Tu/8Egjs/ZZ2kHf+bzJIWF60D5CtqBggP9nCLq94T
 c0VIGDltLKfXDCqaOB8pQSu2A6AfYy8qNX5/T89U1KpLa1FVWxvtsFT4VHEsorLzFqxD
 fmLAzITvAvklb2BJ0HLYLxAYSjMPqI6zXhnvGBrVKbP7Kw/lpDspVW+l6GhLDWq8ASo7
 YOww==
X-Gm-Message-State: AOAM532GiJJpXoW5Kxt3YnAYi26bffEjdwuT1tGTNuX2eQ+sDVX8RjlB
 HEAvbDjAd7+lMojZCvUOShF+NpG2v2h8PtxOv3uRDg==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr9415502oib.163.1593523016956; 
 Tue, 30 Jun 2020 06:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200629173821.22037-1-f4bug@amsat.org>
 <20200629173821.22037-6-f4bug@amsat.org>
 <87zh8kg8qu.fsf@dusky.pond.sub.org>
In-Reply-To: <87zh8kg8qu.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jun 2020 14:16:45 +0100
Message-ID: <CAFEAcA9cajf=MKv4ZD6ivyDTrK4hWLfBP_9T2mJ6LrWjwGMFGA@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/i2c: Document the I2C qdev helpers
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Q5DfqrKS3u+

On Tue, 30 Jun 2020 at 11:15, Markus Armbruster <armbru@redhat.com> wrote:
>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > In commit d88c42ff2c we added new prototype but neglected to
> > add their documentation. Fix that.
> >
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> > + * This function is useful if you have created @dev via qdev_new(),
> > + * i2c_slave_new() or i2c_slave_try_new() (which take a reference to
> > + * the device it returns to you), so that you can set properties on it
> > + * before realizing it. If you don't need to set properties then
> > + * i2c_slave_create_simple() is probably better (as it does the create=
,
> > + * init and realize in one step).
> > + *
> > + * If you are embedding the I2C slave into another QOM device and
> > + * initialized it via some variant on object_initialize_child() then
> > + * do not use this function, because that family of functions arrange
> > + * for the only reference to the child device to be held by the parent
> > + * via the child<> property, and so the reference-count-drop done here
> > + * would be incorrect.  (Instead you would want i2c_slave_realize(),
> > + * which doesn't currently exist but would be trivial to create if we
> > + * had any code that wanted it.)
> > + */
>
> The advice on use is more elaborate qdev_realize_and_unref()'s.  That
> one simply shows intended use.  I doubt we need more.  But as the person
> who wrote qdev_realize_and_unref(), I'm singularly unqualified judging
> the need ;)

If qdev_realize_and_unref() has documentation which gives
the use-cases similar to the text above, then we could make
this text say "This function follows the patterns and
intended usecases for qdev_realize_and_unref(); see the
documentation for that function for whether you would be
better off using i2c_realize() or (the not-yet-existing)
i2c_slave_realize()" or similar. I originally wrote the
version of the above text for ssi_realize_and_unref()
as essentially the documentation I would have liked
qdev_realize_and_unref() to have, ie including the nuances
which I had to figure out for myself.

thanks
-- PMM
