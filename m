Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4050294ejc;
        Tue, 17 Oct 2023 09:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEso+EGC9WKWfUpg7nLnGJ49U4maJRB10s6nAL9R9qrDabuw5bAtxX2phZBgVpyhGBJ0V/a
X-Received: by 2002:a05:622a:1356:b0:410:a249:bee6 with SMTP id w22-20020a05622a135600b00410a249bee6mr3407828qtk.14.1697560390713;
        Tue, 17 Oct 2023 09:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697560390; cv=none;
        d=google.com; s=arc-20160816;
        b=tDBnNPbVqyeivyPw/lhdO0BpAX7fRiLIat/ERZMWapGFMUkHIUWND+vXPN49b/vVR/
         kWFaRC1LZBC+g34nkRcGdtD3lt73bPAB/OUuKSWft1LXngW21el6/ZZFmqT/JNbQtOKh
         GPF+hG9nzO4jDF6whReB4yC15yY16aYD020e679A7iyGt4HGuEvBfIE6TdWHKI1NON9h
         XofiG7RtH4Wdm+7EBPplzDGPdPL4kUsjzZJTSFJNnmuX28qI9fNn07LJWb8jFQGmNmuL
         hIS9rCnPu6V9wpwU29kFBFrj2y0Pv2IdGikBQ6U0FhffDtkSvBSU3UaiHB5fJULFJ6Qe
         VyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ql92iJJQLLdBGoUHg9vKE3mFXjGvSH9dHCTbGnc2INk=;
        fh=SK5x4hx8wvzk6BSdv/2ji2hc+6Da5OLpfcqaB6Bkztg=;
        b=Ie/+062v3f2IQ0ZyvwO2sZItEa0maj2ovIX0r6em0rhTdOYQKH8pJIBPjRNA0NupAD
         Jem+SkpoKCGvfzr7C+oBvWdaMwNrg0jDGmVNK/Si6NSy85eWemO5C3O51Kq8WnLq9j+H
         ALJJ5eNUTpoDTQlaez20kZzUuS8Qj/bIchUtjiNTulrfnBYNmHf+3V5be0hUG7UroirO
         qH5VjoauxDLK8S384g9ElTVh4BRS+BG9crQnpnplufcWUW4VOJRjIEicnKUm4QXhsjLu
         nUfeFgY/ffA1fd6WcSJQ5OGk97v8iWOgkagyETPUtDmCiIfSGPb3iaLK7rrsZpdHtshi
         w5Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RslZHHIu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a05622a1a8700b0041805d0969bsi1443162qtc.210.2023.10.17.09.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 09:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RslZHHIu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qsn0A-0004xi-83; Tue, 17 Oct 2023 12:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsn06-0004qL-AJ
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 12:32:58 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsn04-0003R1-Lk
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 12:32:58 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e3b8f906fso7986166a12.2
 for <qemu-devel@nongnu.org>; Tue, 17 Oct 2023 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697560374; x=1698165174; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ql92iJJQLLdBGoUHg9vKE3mFXjGvSH9dHCTbGnc2INk=;
 b=RslZHHIuHr5TqUdi4tLoHn5XXsx0c4K74pPZTqYiz0IUOTA/S3Wu0GKPVvRLw1m7Mu
 GN5GO4JEInUGZ8bHqFRZ8SAc0HNj09IrfQa8PPrmniPGSJHC5Ujb9tU0kj7MlpPoLf79
 A9dgr32m/DSWfUSX91YFHjbGhPivM6d+PbN2qyCPhvs3qRylfSJbKdjHCkuc7aS53Cdu
 +eVFlXpK9oX+ZwwI282887sihl9D5ETKnUf+SwJZKdGWRxNLijoA7WButIV9ext3TbHn
 z3r+qaT6cjcBqeyhl43QUmLwB1a1enrD4hrpVP5XHnWkksUUC7A/OdrP0Ok6W2D6FULF
 bWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697560374; x=1698165174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ql92iJJQLLdBGoUHg9vKE3mFXjGvSH9dHCTbGnc2INk=;
 b=PEAQ/KkBkvpBlsG9vrJTFNRkkKYybM1DnvIVrDV2OWrDxW1wIEAoUHgqGNwHgazeWe
 /IgFde0uNSROL/QXK81qAi352E/tSwa5YGuBEWYCC6MCGnm6Vwp/0oKLh7tMdDO1y6ov
 c97hvPsGX4Im0caizbXw0hI5BRsadrmyc6pY6p4kqZPKFoBYpUaUmzkXKFY7ZTTcShmi
 SJp7RR5za9/viUGxPsvdXYP323a+xpFDa7FBj05CS8JmA16iR9NOsXl/NbvyE9MPxLKs
 aXBZ8Dtcn8pgwfJdiscsAd4DdQRHTybboWg1FV90yGjwwhu15vpe6N2YCSQS7rJYx83Y
 /oBQ==
X-Gm-Message-State: AOJu0YzYiTuGa7e0w6zouNE872CyhjhttYzwE8z7ErfIHii/CnqSoey4
 HtGxBVslHzKyCbJxlLAzBqoPYeRsawpLua2e2zBefA==
X-Received: by 2002:a05:6402:350f:b0:53e:468c:8c49 with SMTP id
 b15-20020a056402350f00b0053e468c8c49mr1700499edd.35.1697560373974; Tue, 17
 Oct 2023 09:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-3-philmd@linaro.org>
In-Reply-To: <20231012121857.31873-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 17:32:43 +0100
Message-ID: <CAFEAcA9ft44fEp9eGDJC7xCOXmW4Px-XO8HEUSyci_x5sh8XQA@mail.gmail.com>
Subject: Re: [PATCH 2/8] hw/pci-host/designware: Initialize root function in
 host bridge realize
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IdW3EulBdhaa

On Thu, 12 Oct 2023 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> There are no root function properties exposed by the host
> bridge, so using a 2-step QOM creation isn't really useful.
>
> Simplify by creating the root function when the host bridge
> is realized.

It's not necessary, but on the other hand "init child objects
in init; realize child objects in realize" is the standard
way to do this. Does not moving this to the realize method
block anything in the rest of the patchset?

thanks
-- PMM
