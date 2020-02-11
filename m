Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4951555lfp;
        Tue, 11 Feb 2020 02:56:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyU4ViuFGmsu5FNKfLSMhKlWzmqJfEaai2HdjVvu6KknHmAFhV3QnNSIm7bp+gdYzWknmEN
X-Received: by 2002:a05:6214:118d:: with SMTP id t13mr2212232qvv.5.1581418610464;
        Tue, 11 Feb 2020 02:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581418610; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVEiMenPNCKYKpLyMAC+CH24eDH9F8vdBy+mNLe6jPAGkMBmS12pwmJOL7bfQX8emh
         XSdhMvb7O3Fha7dXcwOSDRb2vMHb9TiMfn0SclWy9V7m7T+wnu2TQ46lMmvnIzoScPT8
         Ruze2X+7vLL+TC4DWonI08dt4GKRBa3Xz91WcEnsMkvcxANZ7oZ7JiGbHDbRbrm96ofQ
         4Ebf4q24JLgM2JdtaVhCBj6uVddQrgA57F7bm7BW7XwC/zUkttstW6L4Q7Z6DNUQdBLu
         z5Y/D43uWSpTfZ+T7FbPIf9bHcOoALHjv84xJacp+qZxQGyKCeyYSk6N1XtJJsXiLUVn
         tvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=G+XEOGOOfB0mQPosFwswKb1XrazjLuBmq9VZcLpMzxA=;
        b=OJjzN37VAhUf9DGvfaVSgvM7H8x6pdy80AhTtGGYlZpC/2ZxWFDMNutZ5HQ585HuTQ
         9eEdpTCLm5fsGWuoOYiwCrR8JJL5o7KA3hr2Ye/1cO7ir7eYbBAj72GnBQQyrPCV1Vr8
         f9fbWYFtE2VznX+cA678qxcNgMqmlfTGWRsGvGPu+G4lMW/HQsdJyGjrUqpYaleJezbG
         YxXOXYbcEErHzNneuOwKE0zOWaoyygFRzg8in02MOgQikXeL4eLBVvS+D22p0VXBDfDh
         QrOsEi9tw7fBEmOsflTEUnaVtMtT5Kc+v/QdiwPgaW1nRqaBvIpEh9WI8vFglUROAggp
         yVPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="g/G4pFPY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r190si1773888qkc.6.2020.02.11.02.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 02:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="g/G4pFPY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1TDl-0007bP-SR
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 05:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1TDe-0007b7-Eb
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:56:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1TDd-0004In-8c
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:56:42 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46640)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1TDd-0004Gz-2S
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 05:56:41 -0500
Received: by mail-ot1-x343.google.com with SMTP id g64so9582075otb.13
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G+XEOGOOfB0mQPosFwswKb1XrazjLuBmq9VZcLpMzxA=;
 b=g/G4pFPY7yIvKb386fQU+eLr1jLQ3Ys8B6gTEnT8OTzD2VMUxtrBDXmYhBoXR5kbWU
 8J8f0r9SgEE6ipdP+eWdH7p5MiUPG9WeEFP2o1xULynX/0JF1qVB8ce1x1j8ZZhiLmTs
 KXQL8VHpX0XD2ge9GfyXBv9v2rLgJBTPUjDwEp84Xv8d6l1iP9MxLa+171Nx0THqb7rh
 tzmUypP3x0qLAJgpYIz8MEPTRVzj8wz/AeQMfe1jS8SZmA5k4Nsf6s4dxN+NbbxmNOGS
 CBZOVdQuDOGiDk9hGc8KmT8CYiHjrh3MND1g8W0dDjxthKkbsRrylWh/+eTzr9mBeyNK
 yiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G+XEOGOOfB0mQPosFwswKb1XrazjLuBmq9VZcLpMzxA=;
 b=bungojAVjLw3ixrDw27ZgaW8ukkBFVbrIDJvtoa+D1f/MRlaEiFY7HmF+jVgGyeLha
 8nO4qVOIFU2EewY1bktqCN8s4CFFCaZ0cp3MFU6YpcX7XKnswjN/bxKKVUZ6VG0WXGG3
 jiTJksiw/X2ehaolthZoWRpUrRaeoER/frM8yIEmpJdxvkFl08lPQlClze655xAygzuM
 5xjzzdTvKJRprypllfo46V9zGfTLKhq3WcUkxAYxse/HUo7BNxwG/irGMQ2jP4OwH3kE
 V32v9T5PI2DhDHYoKC5l+PzH/1aHp8JcKWCTPXyjD47PxqdJNx+cBmoVKBG9pJwyFVQf
 LwFw==
X-Gm-Message-State: APjAAAVabz2qipZTDDNn90d+fp5Yie6ZDYwvY9A8Ggq1pKaF/n/HC50C
 z8IJsWmfF3vRapt/TzsSVikkPNT/rbXcAL1k130VUA==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr4807806ota.232.1581418599540; 
 Tue, 11 Feb 2020 02:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20200210131523.27540-1-eric.auger@redhat.com>
 <20200210131523.27540-2-eric.auger@redhat.com>
 <5cbd1960-6138-f4d0-948f-1983cb0f93b0@redhat.com>
 <e69f69c5-40f5-1fe5-f298-129324cc7055@redhat.com>
In-Reply-To: <e69f69c5-40f5-1fe5-f298-129324cc7055@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 10:56:28 +0000
Message-ID: <CAFEAcA_TJ5gDMRNK=O-iaqksYL_aQFu7repo7wKi7pGb-A9cYQ@mail.gmail.com>
Subject: Re: [RFC 1/2] tpm: Let the TPM TIS device be usable on ARM
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, ardb@kernel.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DD59D+uvGhxS

On Tue, 11 Feb 2020 at 08:35, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Philippe,
>
> On 2/11/20 9:25 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > You don't need much to remove the RFC tag:
> >
> > - rename TYPE_TPM_TIS as TYPE_TPM_TIS_ISA
> > - rename TPMState as TPMCommonState, add an abstract TYPE_TPM_TIS
> > parent, let TYPE_TPM_TIS_ISA be a child
> > - add TYPE_TPM_TIS_SYSBUS also child.
> Yes I tried my luck without too much hopes ;-)

There should be a few existing examples in the tree
of devices that we provide in a sysbus and also
an isa or pci flavour, that you can use as templates
for how to structure the device.

-- PMM
