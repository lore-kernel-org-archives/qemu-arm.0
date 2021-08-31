Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5374431lfb;
        Tue, 31 Aug 2021 13:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynoXtYjR3a2Np6595rXiqQa/2Pirmpb3e74TLmg2FdyLt0STldse0JdfWw09p830e02UpV
X-Received: by 2002:a67:d91d:: with SMTP id t29mr21589848vsj.32.1630441939886;
        Tue, 31 Aug 2021 13:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630441939; cv=none;
        d=google.com; s=arc-20160816;
        b=SLjUoaRkHNFxDQD0Fwl7+ucbl6W/Xh1iykmwJhPOZhBxD4fgWJjufAq6qgYEYAnbBq
         HblZKfqt/j8FWruZseJ/i/VkMvjB9CMOfxQTC4tJ4DS6hGisMONiMIsCkzOdcsvcQ2vj
         HKBmlEaVMVFG8BKU1IRgaQQo2LyF46YBxuu02S4MzGnynwJa4+zL3vzYBOUrBADE19Sg
         Ea/JTPY9pbFeTCW6yWCCsSAO+vOEF1u0uC//OQ6AtpAwCLQJfD1Py9kMeJ2/v4ImFO+U
         ey0fapdwAbx5SxVeCaeMASp5v6oSllBbrZDzOjdM6OTqPK5iRtUjIZs1yhYcvJshdFvm
         JhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=e5ljDCKhy59uB8trbeEyv+Y+2yItWw06yiAxXbZrekc=;
        b=eAuyjFSZcoazjWduw7fincoReL0DEZn+bpi9g0TbW+2N80rH46yi+CrgsXhLPE84No
         CCNxzLotzKJbfxIuY5EdmI+IpRgs994/evL30CkGDP+u0WqgQVVKzBJuvtey/BDKBO4Y
         b2lWQRyUVSyrO0oFa6H1KQmNJM8ZUAuvUgvwo5tDVxszb6M08VMGkHpeBGkDYabRpXhD
         yFDcbP3jwW2nEzDZMNfYg7dHdBbAAv9ET76vpXpO2/FNTQM215araeRdVYM7OdJV8wdI
         lD7NteqNJECIzv9X2NmmCqN0R1JiSb0KR1Uka5mD/lhL7n897W2Hp2CCHtt24nXbSJ/G
         9EPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UHLeV2+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27si786004vsj.282.2021.08.31.13.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 13:32:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UHLeV2+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLAQd-0004av-7H
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 16:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAQ1-0004Ji-LD
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 16:31:41 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLAPz-0001vN-Ve
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 16:31:41 -0400
Received: by mail-ej1-x635.google.com with SMTP id x11so1787435ejv.0
 for <qemu-arm@nongnu.org>; Tue, 31 Aug 2021 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e5ljDCKhy59uB8trbeEyv+Y+2yItWw06yiAxXbZrekc=;
 b=UHLeV2+8fVstXowiOiOhGIrOj6Pk8kNy8a4GlOlfHnjCmMcHdypKrBSK2Q8HDIdsVD
 LSIxTSPMHgMcOsgqA3ddDUnTRZ82ysclI+yqpgBFNaTAJprujcyVVk/fhMiFwiUbemko
 AXmsy21i4honNi/z9BMdoSTg6gD6G3ZUdaGvIL8o2VLatFvezNHNkJG09UHzgasSiMF6
 dVv0v0cVTp/BUvfYMqE/ZlV94L+v4+n3fEnlLAbhQZHBz+5UXl84WszCM6hdAXs5+DNB
 R2JPNp0Fpb8/5EQvkLCoulkiu8sTDEcVgTTPMnZDzmJGaPQVMFoTND9UdvbR6n31lBmL
 eFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e5ljDCKhy59uB8trbeEyv+Y+2yItWw06yiAxXbZrekc=;
 b=l8Ro6jZ0X93K8/tquYN0cZmLkNjugH8C0EXJI/MPEQ5dDl7h/nAXH+a/2kd4uzpc48
 OwaJKSRZpVCi7IEjYhjxNcCVXLpzzCp+05H/cZDwIxdHHs4ru9V4Gl92W31e80+/nhmQ
 WOHUgZNpN/HJVDvSs0/8HaQfObovLove8RBN3m85LtoqieBjnPuXIcLVNzUWroPpcaJ1
 1FisTyBzvbvAKyZ+m4f3D7KAvoteX+C7PB60M61lVd/otv8N4X0L8pmJClywVXjB77jg
 1XTevfoDBRjZJebcMqdq34JQr7UDgkFMlQnvKdjf10i/nf2Jy3lfuFvRgKRRlGQ188AY
 ACiw==
X-Gm-Message-State: AOAM533Qc+XD6mvzITJVtxwQKa/Q8NdtIZd7xaSaUlQ7YbcEmpF7r4Lb
 jlVIDdczsqOxbAhJcW8uhHV02BnxBHDmKNmw4VNbPA==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr33414020ejn.56.1630441897584; 
 Tue, 31 Aug 2021 13:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210826180704.2131949-1-philmd@redhat.com>
In-Reply-To: <20210826180704.2131949-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 21:30:49 +0100
Message-ID: <CAFEAcA-mLpJZed+oV_TnZP894OgACiSFiEDPgG4g8O=fx8oQXQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants
 by booleans
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cDqS7JTsLR+v

On Thu, 26 Aug 2021 at 19:07, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Minor cleanups on the GICv3 distributor common accessors to
> have the overall codebase better use the MEMTX_* constants.
>
> No logical code change intended.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/intc/arm_gicv3_dist: Rename 64-bit accessors with 'q' suffix
>   hw/intc/arm_gicv3: Replace mis-used MEMTX_* constants by booleans


Applied to target-arm.next, thanks.

Shashi, would you mind updating your ITS patches to match this
cleanup for the next version of them, please ?

thanks
-- PMM
