Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1630DCCD193
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 10:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBsIU-0001Jw-QV; Thu, 23 Oct 2025 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBsIO-0001JB-34
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 06:11:52 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vBsIM-0004MZ-54
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 06:11:47 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-63e16fbdd50so613809d50.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761214304; x=1761819104; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKxYFfGNkjI9hGpU58EpqnK6yOxpmJM2oAjZUtChVxI=;
 b=RD3a08uOZ7/QsqC0K7F9iwUyw/B896I85OvaeJaCmRZcNGWoSga6VWVDg3Zvj7ZyRY
 pgpABLypCR/L3BLnSRudXrcuVnJKP+jP2OzsA5dbec21dNRP4otnfEKbT3qsVe33wXQ3
 5J9UerJqoyd09hSdePAwRRLnAOn5u00JTvO1Y3rgk8zZ9ar1aGTKuktdFaUF/4ysFLgL
 eSDU9tjmbd7DfnogGRoqJuEdWj1RTblsEu9/ENxWyrzzZEPsQ+Dui8zy+5FixcS92fSp
 RI0b96lDUyMx1/ytHhs1GuOVaK/vHFB3XnmvT6Yt/SDMOi+Lx1Ak6nzqfYmVl1tUdEZ0
 PYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761214304; x=1761819104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKxYFfGNkjI9hGpU58EpqnK6yOxpmJM2oAjZUtChVxI=;
 b=r+bQOdu2FQ0FV9pn4Psb63oi6w/ii1rSkOx6CeWy4DQFQCEdX1yqVNwN0kC/DLWS5o
 AZjF7nvUYJ7uoCgFayBd7j5LpV+EWAisw3/T5X52u9Z/K/6XmPkBLH/Gg5I6SIevvwgL
 mQMetjDaCruneRwJVFjBqsdqhc0R+9lc47oQOlwUOVn8FjibWuWjRc3NeEhnOvxzEt2n
 tGk66Pom568vZPSiqufc+LJuJCTtY9ddU+CWf2GbbJFQyDWtjfd+uUnbLh5IPkWcLakR
 0n+KApBc4wYplnnjOqQWL0QSU6w7GleKb304jF1+XAtPvDSTqs3Lg2tnARcJdTgU/gBL
 cBpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRwRYN+VDRcY6+U6MbEZhSCNpSldJP+OMWDtZN4NNDyFdoVq27vZL7wUVcvrs4ekFNtybETnYTHA==@nongnu.org
X-Gm-Message-State: AOJu0Yx6i3MZUcKmVU10gPmMCjD38Lpc7gKJntZFlTP9yDhyjvr6A1qN
 Izd72nQemOI6hT6D6/KkirnrxFD2594rovvez6xutenaW/+H6zAbonvjS45KgbrezRrkoiWSEfl
 tVCoAmwJOGqSHbjWwkPIh58Lnl9qUh9nFCY3rGGntXg==
X-Gm-Gg: ASbGnctG62rQyUGy0L0++9nXY+b9t5S+jK1cBSm5YjJqx8lTa9Vh7ID8lB/R1Zl6ZNH
 J6uutHLCWQ/B/j9zjJ1xAUs/tytWqqNCBAXpXOgnNo/YN1aKjGEEZtiuBzXQy2jdPtpWQc5XiBl
 SeXbqCX5X1UBgCW9bk++SxWUhUzamjtkAoysUFx4TleH7WDpegx4PIkrQ/hZG3GTbVZLVeuF8c1
 Xb5cP4l6h7hvbLe3QmBXkzNqCs7BCjeC952zQogdJu8KITTo6f0MLUFiuS/RBJTfDyZPIyk
X-Google-Smtp-Source: AGHT+IHWPNuojs/jLJrvjRctSOkR+7n25n4N4Y5q68i2XgIzIUtyCo3/5dr+Rl5jdxyActvFhkqgvDL06hTaApWZcyc=
X-Received: by 2002:a05:690e:11c4:b0:63e:1ca0:be73 with SMTP id
 956f58d0204a3-63e1ca0c207mr16568146d50.37.1761214304226; Thu, 23 Oct 2025
 03:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250930165340.42788-1-tangtao1634@phytium.com.cn>
 <87v7k6lyp4.fsf@draig.linaro.org>
In-Reply-To: <87v7k6lyp4.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2025 11:11:32 +0100
X-Gm-Features: AS18NWAKgXHEFcGcGXUbdQQKltzxbSNfZGogFu2-vMqOscpkn-BkVassP2jBEZY
Message-ID: <CAFEAcA8uMe1yxd14Zk3gpV=jnMQ1RMLzSCXD=Ep3ROKOXNKPDw@mail.gmail.com>
Subject: Re: [RFC v2 0/2] hw/misc: Introduce a new SMMUv3 test framework
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: tangtao1634 <tangtao1634@phytium.com.cn>, pbonzini@redhat.com,
 farosas@suse.de, 
 lvivier@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 23 Oct 2025 at 11:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> tangtao1634 <tangtao1634@phytium.com.cn> writes:
> > From: Tao Tang <tangtao1634@phytium.com.cn>
> > A key question is, "Why introduce a new smmu-testdev instead of using a=
n
> > existing PCIe or platform device?"
>
> I curious what the split between PCIe and platform devices that need an
> SMMU are. I suspect there is a strong split between the virtualisation
> case and the emulation case.

I don't think emulation vs virtualization matters much here.
My impression is that SMMU is almost entirely for PCI/PCIe;
the exception is that for Realm emulation we need to do
granule checks for non-PCI devices like the GIC ITS, and the
easy way to do that is to have the ITS accesses go through
the SMMU as a "NoStreamID" client.

(Linaro has a JIRA card for the Realm/GIC interaction:
 https://linaro.atlassian.net/browse/QEMU-606 )

thanks
-- PMM

