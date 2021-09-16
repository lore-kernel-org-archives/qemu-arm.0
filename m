Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1157062lfp;
        Thu, 16 Sep 2021 07:08:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUUp0lTJ176jb9WiMulnGEs9DwfJQE5v5Tqu0M5VQ7p+xLU4PUxJGzldOUftvfNtjuP8m3
X-Received: by 2002:ad4:5591:: with SMTP id e17mr5435614qvx.50.1631801303885;
        Thu, 16 Sep 2021 07:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631801303; cv=none;
        d=google.com; s=arc-20160816;
        b=JATifL9f5BjRMW8h7dSk5JNkg/cW3WsfhFVVpYjPgeE+TVC3UXZbFJmbQkwN4bmKfX
         lSD0FLwdJAwFx/IQwxvRyKwhtBzachBsi1oAo6w/nMcmJ6LUd7lsp65NWPrbFLVMJ8yz
         eiOvaDsXv4yK0v3gXRi+5IdFAKK9AotpwtOZ+z4MszIl+yrlWrgQg5xeW3RVbs8ieUVK
         OP7OLyBif+bed3EQiwC891/fspyHEFaGNQNaVeZiFShdEHUCqAlExfW8YzsArrSLz6Z+
         pLmYkBGDZ7dpP19FloccstMd5ZfiolegyoToB1CQC6kPENpe+xXvn3hq5E4qVcFwH96n
         OO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9OcG9R46gWROcs84De+kGo7pBwcho3/LbxQ2XLKdnIc=;
        b=ugdw7VmDVCabHNzxFu9QofxAht+ZggEmJDtzqMFK1XGdvCLcOegihFppCe0QwOudGz
         CcnozSPtdeds5wpIorUSA8t2dQ5pNtaL8kH3SiNWHAHg+f17E832QHVADe/eMD7WkX16
         O6r56sicGTMeepGQTE+Q9XodvcZXoO/qjyORmGe7ttzN28WV/3hQTnhmhrB5v7VPFXDF
         KxtGl3ZVRA+fmfv+8KbP1yDn4Rd+g0w+kq0Zv75yF0f/K0SWcMrUSOO9meZo4YXn6uv0
         2AZ0MvMvSDOHancS7EWh56IG0FyQvzIT4N6N7EcqcCFTrapJrMM3PMXpXqBahJyHGGAD
         H4sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iy9+8W9y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed14si1730314qvb.40.2021.09.16.07.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 07:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iy9+8W9y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQs3r-0004Yn-01
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 10:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs3b-0004VT-JW
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 10:08:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs3Z-0003dr-4C
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 10:08:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w17so1553326wrv.10
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9OcG9R46gWROcs84De+kGo7pBwcho3/LbxQ2XLKdnIc=;
 b=Iy9+8W9ypaW9PnroEXdrcgexwbA6VJxtTTkdPvB21LCv1rdn5jLH1eLdDYhBZ8Lcmx
 fG54wwmJGi0NoOiMO1oNzr2ticjZYrSSz7IUuhC39KOfaumcuvWKjOOHiF4CkbMx4Ovc
 8hfJYgXIAEA6gW8Jut03JYKcNdphCi1XaymaEVrdR+qKBr09KrWsnV7Kbg/exnClN2Og
 pZdYrLTLzU52QNwMP6NKBsu34j6UNNrlJNASL0VCZPfOq0gz5nMExGHrxqBcbj0MvD1T
 uuj7d2wZl9ByhYtieFDx7G56FhESYTeiXw57B43LqZr/HPm+aBfglq5d0uKK1FMOCNvi
 eO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9OcG9R46gWROcs84De+kGo7pBwcho3/LbxQ2XLKdnIc=;
 b=f6tlBwN0zM4trEebEAKpJcfj7aAwgmxnlXDDS+4cGr8xiiS4IOU1KMCJA+OsPbRofC
 TalbZ0OwIHZ/tIHuTT9WvKTFfCnGC0xMuI2zJ9abnkzp0KpZMDQ3zFsGVQRXQi2yWI+i
 ODme+8iQ1e5IJ6kOANKZOmTkjGRcAOoAMKPX2Swzc0rClXfNsfZeWEy2EnlbNOKwxkjD
 erg7t0j6sPh2Np2Nfht8HURGJ9IAs1q/5JSs9Mr3ZC5WEVAdlaL5c1BaX0pYWE+Ia8fi
 IWjlhpcid1/vFfe1qO3SN8GcLwrmTlBChXF2ZqtETadzAetaYB8hKCvHP+QrPcHjA9Al
 pyZw==
X-Gm-Message-State: AOAM531YdriXR7RResyHHHb9982371Dqv2TAb4j+Q6xwSiRN0FLR8YpK
 Jms9WEYUoJOMYFxn3sjLLUMn607ettix9amMu3BWobrgVNs=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr6175060wrr.376.1631801283779; 
 Thu, 16 Sep 2021 07:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <d00d7eeb-a50c-c039-046c-7749fde25af8@kaod.org>
 <1d6fb312-ab21-ca9c-d7ec-1043ccc65b10@amsat.org>
 <7ae560b5-e719-0b6d-1fdc-b231af9d6a81@kaod.org>
In-Reply-To: <7ae560b5-e719-0b6d-1fdc-b231af9d6a81@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 15:07:12 +0100
Message-ID: <CAFEAcA__dFt-WjNdazA7eVK88uLnXzkQ+mKp1Jq6dM0va+uyLQ@mail.gmail.com>
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XoEISsFo5eyb

On Thu, 16 Sept 2021 at 15:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> OK. The patch I had prepared was a bit more explicit :
>
>      /* On 32-bit hosts, lower RAM to 1G because of 2047 MB limit */
>      mc->default_ram_size =3D (HOST_LONG_BITS =3D=3D 32 ? 1 : 2) * GiB;
>
> I even have a version with a warn_report() since 32-bit hosts are
> not that common these days.

Using warn_report is likely to get the patch bounced because
it adds a new warning to the 'make check' output on 32-bit hosts,
unless you take special care to suppress it when running in qtest...

-- PMM
