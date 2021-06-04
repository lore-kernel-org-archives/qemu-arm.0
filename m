Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp962584lfa;
        Fri, 4 Jun 2021 02:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytzVXEntfBqaqgu54SvpeJKjFWYV80Co3s2Kh8Xn1WJ0COfgEzT5XbxkNWMLhATm6xaT7b
X-Received: by 2002:a92:6b02:: with SMTP id g2mr3113986ilc.23.1622797262974;
        Fri, 04 Jun 2021 02:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622797262; cv=none;
        d=google.com; s=arc-20160816;
        b=F5Nd/UIA6sdC9bHdx2U3lq2FdmQmDEWXemeDX8kUk1x8eNkgyJf19Z3HbwEm1g5xic
         E4Qz85CCcJZoyzU3MXAKKVIZFpiKaJWAhIWC4QRvz2LdSr8EmrGEzp9fXS+F/da/d3/3
         Eznaiy4OrRDmsrwvqU8DxUAUyufascXP6fbIMr75VNM3qtpl2B3SFc520WZyERBV+QE5
         58SS4RUqZVo0J2bSItYxw93upmBIwFq6ZZn1Hy5YwUQvCjEWStDTFCcdh3Zs7EB869RE
         HPeQujf2w8L6xHuKLr2hKEwjLr+a0Ji5iDatpMMaFUZ6fs3nYAspJV8HGvfZMT9kOnox
         XMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FyWepY4JjoUfuJ0cMElhDPZ/gV3eWFbuJU2+7J1omBg=;
        b=DSX4TrX9FmdaEqYjVzGImHmGUy+8NE++qRQOcZ/Ds0MK0O87Q447USt4VJXVl1Gzx8
         B+InIQRYffsYwFrG/ucWpDF7s+o+D6dINN6OxKljnq41mQXyE0/qU5BrlpdHnteQcNcE
         Lrc+w5QoO8wAqTQmTOR8/rGxoxtjoZu/p11iycqeFxIVI6UvHTYTiNdlhmkPAorayIVj
         oJ0e2ZDffZUTrk61DbdeEUR7fdW6dGQnGZ0I7ejAFJRKz1mWS2pgCxxflqKzMlHyNANk
         8Dpcx6NZlMkCbR1SD1q/FiWQsEDDlNb+l3D5DSIioFpMy75T8++arVX1sOvoYZrr0MRw
         lUQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0xvKqFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si6439913iow.84.2021.06.04.02.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jun 2021 02:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0xvKqFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lp5hO-0002XK-A6
	for alex.bennee@linaro.org; Fri, 04 Jun 2021 05:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5h8-0002Vq-1x
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 05:00:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5h5-0007tR-8m
 for qemu-arm@nongnu.org; Fri, 04 Jun 2021 05:00:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id ei4so5188767pjb.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jun 2021 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FyWepY4JjoUfuJ0cMElhDPZ/gV3eWFbuJU2+7J1omBg=;
 b=c0xvKqFQ//gW4YwFjlC7P897izgTCE73MjRlNgKa42VTz5R/vlWimkWNr1u9u0XBuE
 jmRhrp8NeMIQLndkc5PeS/bgKzHYypeWhSb/loxUYDJpoiJWeUdZ115wbf/4l1AqEVyt
 ximiEWedOeIJyLKImYtVZFH1eoF8ceTI6fXTeuWg4edBwZ/0poAPkR3+M3tM3lZVkaQw
 ZprC+bCspJP19AbO32jI7g9S/emQjJCxj3gTYUttJ5nSl/2GwC4EVNiOy0ldfHrRZRZW
 qG8qZqdGiB0cONk64+Bsi9+V8aSqibaHaSgi2SI1Onca3GoYllRQvtge6WzRAG7VFUh4
 dPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FyWepY4JjoUfuJ0cMElhDPZ/gV3eWFbuJU2+7J1omBg=;
 b=D6rcY8UT2km+UIRi1fC5iSmN+luQfnRdwgMEd5ufcdH2Be25czwRMco1Joy4UjjI+L
 3dPkuVZKvgKJJF2IYafvXXO7JarGGtPeLdyC+xkwYtXHqwN9hrgrIVmP+RVzDGAdStGj
 BimDk9Vr+MdHGGK5NJo2qluMqX+ptCm0dA0KCUZHHnfW+xUQvzjLGpoD0waKXSMIcTEm
 u34fkSDwk8qcgGpkQKL4UOVy+mJvWZ8TVqE1sNQQbyUfoU4ku4oNZRz/QcKRm2gE+hIg
 DeRkimqiFssO+122WwBxIe4jkysi+KRPWrDfb1YM61qy2WM06xyw2JnxwmDCnk9CdrJ5
 XLPQ==
X-Gm-Message-State: AOAM5319PbSLP/F8/Lc1QcdW8jsUHpe58wtDsNt82XRp6uDkdBo3Fmc/
 foeHjWlku6fxtcKuybCDF3A2aeLzZm9RNALMVu9+ww==
X-Received: by 2002:a17:902:f68c:b029:102:e6b5:f8c8 with SMTP id
 l12-20020a170902f68cb0290102e6b5f8c8mr3412678plg.70.1622797241579; Fri, 04
 Jun 2021 02:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
 <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 10:00:07 +0100
Message-ID: <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLOUEK+lf1mF

On Fri, 4 Jun 2021 at 09:29, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Richard.
>
> > Well, Peter disagreed with having them enabled by default in -cpu max, so we
> > might need at least one extra property.  I see no reason to have three
> > properties -- one property a64fx-hpc should be sufficient.  But we might not
> > want any command-line properties, see below...
>
> I understood.
>
> > For comparison, in the Arm Cortex-A76 manual,
> >    https://developer.arm.com/documentation/100798/0301/
> > section B2.4 "AArch64 registers by functional group", there is a concise
> > listing of all of the system registers and their reset values.
>
> Thank you for the information.
>
> > The most important of these for QEMU to create '-cpu a64fx' are the
> > ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of
> > the
> > standard architectural features,
>
> The values of ID_AA64{ISAR,MMFR,PFR} and MIDR are not listed in the specifications published at this time.
> Of course, they are listed in the A64FX specification document managed within Fujitsu,
> but we cannot tell how far these setting values can be disclosed
> without checking with the A64FX specification staff within Fujitsu.

If somebody has access to A64 hardware they could write a minor kernel
patch to just print the values...

-- PMM
