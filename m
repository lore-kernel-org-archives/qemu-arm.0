Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp307352ejf;
        Mon, 15 Jan 2024 07:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJAzellh0XZ/j0saOOBHtiC8tiDLamf9I8RtMNDiQRpqeascbXHDMDKjNj5trBsGSv2bA9
X-Received: by 2002:a05:622a:5c6:b0:429:f547:53e1 with SMTP id d6-20020a05622a05c600b00429f54753e1mr1270281qtb.128.1705331864662;
        Mon, 15 Jan 2024 07:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705331864; cv=none;
        d=google.com; s=arc-20160816;
        b=um4WTEZjWYkKWWgMz0780v7YgCRY5Vcz9xXU+rpaP2vGUF4c+UsDpBrMDk3TMxuWkY
         do6hErPzzH8jKz3g0zAJ6+5suBD/swFBStRrq7dkXqDcmC/AxU1UHVQ7oPAW1ThZlyeT
         JYXLC8KhibdFOWnxl5Pc0xTzrURSHQrlgrUAjmDesMGzcHzOpbx7B4ldB1b7b53Mso1S
         Q2tIbKx1Y8M6dGVZ2F2/sbCFKtY8tWFn93meer04HENVPeWc2mqcrvdR6i+U9LbP4/M7
         FpTkN1s+3WkcMMMEGJAz1WExT17EbeJegPcNrrMu2L+zLSM0qhVTPeYGVuXxxl6W85py
         PsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AUrxafxKLR5/wvtuGfFq/JdvphF/czh2i03dDEKIHnk=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=R+a3Iw4dM20DNdluzjkeHdR/8k/RXqSrDwzPpY3e4UuzaxLos+KwqrwAHjPa8GBGsI
         Rin6zk6+f9foBQN2FWBaOPrPlTUsgPSs/FCqc65QwiWXGA15s/xBSS9hjGVtghhPip3V
         JRcPe1jnMoqpYFvQZ1CmfwpWKhk0sjIWUonRw3xzY/Cz2bT1wUgk7Pp9liCq7IrELxPw
         kriCQvOGvwF86Z9KQzi1LbY0M1JKinnkWOEortH+ZIdRurd5VM5xD3EZTChXn0ccmDhY
         WEPtvts3noPSe3B9UewIhEaHfR8Q3+mNreg54Sv/IpA1MN7hqwiskYNlxtajjA0fQoNS
         yGaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDGh7IgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a138800b0042976f74ceesi8224197qtk.690.2024.01.15.07.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 07:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDGh7IgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOiS-0003Kn-0m; Mon, 15 Jan 2024 10:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOiQ-0003K7-0g
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 10:17:30 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOiN-0002T8-Ty
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 10:17:29 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-559533e2503so1008280a12.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 07:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705331846; x=1705936646; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AUrxafxKLR5/wvtuGfFq/JdvphF/czh2i03dDEKIHnk=;
 b=eDGh7IgTaXJYr1+2oSyGdLNhqVU2/QdxCw8LlHrCmfdHijr/LJnSUoYMS0MWJ9Q/rv
 +wTWr6m/UONOcKb2pwM6eHTD9HlkEWXIH8ROFuH9yRAd2KAxHjvoHSPtrvjHzVZtKKT8
 77FCwHchOc2oxQ2xvtPbmn8pWXwt8p3C293t5oRfvgRxfy9qBK7hKXksfXZxPL/pct/j
 pZdYBaQUSUyQ+mygUr7bquuciOxFZz3EDP5lC9UL9ZxPQsVyzbnLc9XHRv2aTr2gF9oR
 FS3oA7inwHDaFVjqhndQQ6v4AGMXyFmGfnJ49J5U0B9frlgVuru5O8h2jR/pNd2prWgd
 UBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705331846; x=1705936646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AUrxafxKLR5/wvtuGfFq/JdvphF/czh2i03dDEKIHnk=;
 b=PqwDwcIo6ujTAeskkQy2MueCgCZA96w6C2UkTiiXIwyugZsgkBLBPxcviKkafOTnPj
 AYE1jGW23eNnGQZEyMMf+Mzty+GxJuxEcMKSqFjOmfsqR398P1OTR5NheB707XJ7t41s
 ER60zX+FJhx95fI18aMiAbw6vz8h6wk5+MQo2WXPBOjT6q9ZCmFewOeW1MgMCTR1KLY/
 EtIq6MtiYs2zLay/Z1YKoJ4b9QQzXqGZ6KCOm/GYN3wTMjBADKTsMLA0LnwNiqJWNNMT
 hgzxQfbdpdpXxmEBVBFzvaSd4mNN+k8kji6aSKuacEwpTzGerTncHFCipCpOFuV9K3AL
 bxXA==
X-Gm-Message-State: AOJu0Yw7i/FY+yMj5Rq4tbmZ2a6NDkFJzyU77JbVwKJRN9A9XfhdQPgG
 mbEbIcZD/nP3Z5HGXR8/qIOiDihruVvNr6nQoqIGpWYTsDyNZQ==
X-Received: by 2002:a05:6402:f8b:b0:557:40ff:b3bb with SMTP id
 eh11-20020a0564020f8b00b0055740ffb3bbmr2699890edb.38.1705331846441; Mon, 15
 Jan 2024 07:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <CAFEAcA_9yO8kY=fnT8+vn2AFtjyoJN25B4o2tcegaOxS41qhmg@mail.gmail.com>
In-Reply-To: <CAFEAcA_9yO8kY=fnT8+vn2AFtjyoJN25B4o2tcegaOxS41qhmg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 15:17:15 +0000
Message-ID: <CAFEAcA-fc_E7s9aV7VxgMdYAUzsbXo7XosuSK2hLPt2W+QD+-w@mail.gmail.com>
Subject: Re: [PATCH v4 00/45] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E24x4mGKdJBq

On Tue, 19 Dec 2023 at 16:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 8 Dec 2023 at 02:32, Sergey Kambalin <serg.oker@gmail.com> wrote:
> >
> > Introducing Raspberry Pi 4B model.
> > It contains new BCM2838 SoC, PCIE subsystem,
> > RNG200, Thermal sensor and Genet network controller.
> >
> > It can work with recent linux kernels 6.x.x.
> > Two avocado tests was added to check that.
> >
> > Unit tests has been made as read/write operations
> > via mailbox properties.
> >
> > Genet integration test is under development.
> >
> > Every single commit
> > 1) builds without errors
> > 2) passes regression tests
> > 3) passes style check*
> > *the only exception is bcm2838-mbox-property-test.c file
> > containing heavy macros usage which cause a lot of
> > false-positives of checkpatch.pl.
> >
> > I did my best to keep the commits less than 200 changes,
> > but had to make some of them a bit more in order to
> > keep their integrity.
> >
> > This is v2 patchset with the most of v1 remarks fixed.
> > I named it as 'v4' because of mistakes while attempts to send previous patchsets
> > Please ignore all other v1...v3 patchsets except the very first one.
>
> Thanks for the rework and resending these patches. As
> you've probably seen, I've reviewed patches 1-10, but
> I won't have time to do more than that before I break
> for the holiday season now; I will get back to the
> rest of the series in January.

I'm now done with my review of this v4. I haven't left
comments on every patch, but I have read through the others
(including the ethernet controller ones) and I didn't see
anything obviously wrong beyond what we've already
discussed in this thread. I'll do a more full review
for v5.

thanks
-- PMM
