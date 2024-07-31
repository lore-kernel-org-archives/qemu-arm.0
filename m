Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp224717njb;
        Wed, 31 Jul 2024 01:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzpYLzVRAdCyQb6ZMotbiGCdC4apovyJn+hswT++5n9RFuJxNoqaMvdaIzlFILhreKjD0NKXHX8iOLu6I/vo+Qe7Fsjpip
X-Google-Smtp-Source: AGHT+IFHeZnKEaoxM+wPJTooKQ/u2oRR3Bexc5wq80ck+/kXUcEvWpuiwg225s68ST28KSLrBXai
X-Received: by 2002:a05:620a:284b:b0:79d:21de:f80e with SMTP id af79cd13be357-7a1e52b59ecmr1431002785a.56.1722414459733;
        Wed, 31 Jul 2024 01:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722414459; cv=none;
        d=google.com; s=arc-20160816;
        b=wv0h9VUraEgNEblsle85iQCbARqe0GE9lQrAEICr9UujPV0s3WXFTuUlT5toFSyAHj
         DOP6DfC/TuBOvIziy67e8E0mKNLfsSTc5nRAXkGxgETdJSRyGxWp+SZ/5TZy1m7SzpTz
         6IjC0u7s+vt96U/WhlBHt1w/2BB7UNfw1dqEzMifOA06z0KohidRldyQAjpHb+W0SWGx
         /d5x8k1vIzMXAL8mz8MZfH2dkqZGZO+XSysWScinHZmeDiLe15n2ubAG0N4RBxuR/bKZ
         ZyY67mSpuV062CoeezVcWFxuETM1CKtb4F4E2TpOxRhddH2H9qMZs5Bb8TKg0maiVAds
         WErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uBqVN9xvtD1uH5jTjQebmW4+35/w0vGS/68vJqS8Ujk=;
        fh=bTY9L6PHSNJQRoSkMI4tql8esRpO/ZQmraEoyBDF9+8=;
        b=0lwq+LdfMwThl8LwOmfiVe1kptpXGlLtpJP9F4hhW/ywzG4b+oeXVWFqxb6IPxX7GO
         kxXXgBDMURJU1Mlynbj1zqlE2w3rPjnFDWxQETiQ6rzGf8It2eGcYCkr6Futggm4+kDG
         tG3wvRVJNP+cvvNJ2JhVriZtLZ5xcfHBSmXJDPaeHWyeNwLvC7NzXI4Ue5zP4swWEO1B
         k6NRzE0oAYqyRmweObAQ7MIuvL6cHvj1TBdkkIMzn7E3Y0xKjA1jX6/Twbzxccoc8mg3
         CgscNs/eKP8LnN3G+0P6fHUlwSx+Ppfb0PwrAN4TPG7tHjiW8Qn23IouEPhqSWpjoYlj
         hJRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYNKinye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7445ec6si1496951585a.253.2024.07.31.01.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2024 01:27:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYNKinye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZ4fp-0004tY-Qs; Wed, 31 Jul 2024 04:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ4fo-0004sa-On
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 04:27:04 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZ4fm-0000cf-Ur
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 04:27:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a309d1a788so7417254a12.3
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2024 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722414421; x=1723019221; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBqVN9xvtD1uH5jTjQebmW4+35/w0vGS/68vJqS8Ujk=;
 b=XYNKinye7uPgSJj/NcHocmY4n8+ojY2NHAXwtIZOF60bX0i11BSPLvejiX6TMjnkgf
 liQhHBjkn9SKzkrG4ug6ureECYHVflPjQwSfUEOarVz1rEmGZMVcr3H+rFAOIrt/sDHF
 4bpuNHtb5vb/FML8fErZwAwzyw2U8ZqP7DPF4/bT9lLgG/VCX99XtUErv0vsC2c/n6TK
 mV6cE+mFdFoQFbNLBy90MNBJ2lznq/SIm06iHZVmp34G7/Tq94TIVC1726mgdCRuRYKL
 yQyRRA0jh/CJIiAIx7MOWp+0Rrfy+bL7ChDUUckz9tsuhpjv/YEdVqCZzwXQ/SFwGquf
 BHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722414421; x=1723019221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBqVN9xvtD1uH5jTjQebmW4+35/w0vGS/68vJqS8Ujk=;
 b=BnGLR1s0zq5Cnb40cu7yUYErpXLZmiCi/nLs/m6jkImKJnfZADswqrQ8EEyRQSIb2V
 XokgyTozqOcVuj0Ye9UyTYAtcmsDYQ98BcaeQaJ3JIaR1v129jsCm7p6lemHxTRJt5di
 6istg2N8e1QTgyGFBm+DdIS83+baGni8KJLsP6FJHa68UfnytjbInXvlb4Ko0xY1bLvS
 hfwxXIWd6bgxjJQArAsHHeKMMAnoQO6ImrxH/VuJAOfaUR6prSEfBFrKJccbW3IJWd43
 zA4JUa8hRdA5ZSSwlv9CZtoHf61nxh8j3XHKCN98hDVKf1OcEvD2dc0UbMW1nNB6wifX
 vxYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXM1CQ+MNXn2ATFWjWZp3P7ukALLmlb6OfZZ1o5pomvkZ+Vjm5mKRzHMEgLQG1PKK7R7yBIoMnlEsBET/G+qvQFA8f
X-Gm-Message-State: AOJu0YyCGjZStyK4Qv/GUpShcUYW2Qfc94GJytjt+T2nkEnlo8+g5Fjq
 xHt9hFxoqw5Z6F7Pfe781Dirc0MG2+DZP1yzkbfC1u4yIwanwJ50V7/+VuluEqK3MZRdrKL+YB4
 Eulw91Ws8oJ25sJwXPbpC/vLADID3A6ejyswfGA==
X-Received: by 2002:a50:a683:0:b0:5a1:faf:e5ac with SMTP id
 4fb4d7f45d1cf-5b0224cef4cmr8203761a12.26.1722414421096; Wed, 31 Jul 2024
 01:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240718230031.69641-1-danny_canter@apple.com>
 <CAFEAcA9Y3yNoOQp+Ei3M4mtOyeMKAh9fD9_WBimrSYETxFkUhA@mail.gmail.com>
 <8CEBAF31-2582-45B5-B391-DE4F392EB932@apple.com>
In-Reply-To: <8CEBAF31-2582-45B5-B391-DE4F392EB932@apple.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 09:26:50 +0100
Message-ID: <CAFEAcA8WN5abC7wARmMd1+ePr2yaZ61wVLpJMcZ-5TUnvxQXFA@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Allow creating VMs with > 63GB of RAM on macOS
 15+
To: Danny Canter <danny_canter@apple.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Cameron Esfahani <dirty@apple.com>, rbolshakov@ddn.com, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QlhpAEAJLQKI

On Tue, 30 Jul 2024 at 22:53, Danny Canter <danny_canter@apple.com> wrote:
>
> Thanks Peter!
>
> For the macOS 13 comment just so I=E2=80=99m clear, you=E2=80=99re saying=
 the minimum we support is
> 13 now so the conditional compilation for those isn=E2=80=99t required an=
ymore as well? I suppose
> that tracks given the wording that we support the last two macOS releases=
 at any given
> time, that kind of slipped my mind when thinking about what actually need=
s to be ifdef=E2=80=99d
> here. That certainly cleans things up a bit for some of the functions in =
this patch.

Yep, that's the idea. We tend to leave the conditionals in a bit beyond
literally just last two releases, so there's a period of "not supported but
it probably still works" for a release that's fallen off the end of our
support list. But in this case since we already have code in QEMU that
requires 13 to even compile, there's no need to add new 13-or-better ifdefs
in this new code.

-- PMM
