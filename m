Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp540232lff;
        Thu, 17 Jun 2021 06:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9NxR8e/fEEmZO72X+BPEHIILFmkUZycVwOhtLUHIdO4d9GO9F0aj/6Pywk1mX/ZHzNqeM
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr5336753ejc.9.1623936353061;
        Thu, 17 Jun 2021 06:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623936353; cv=none;
        d=google.com; s=arc-20160816;
        b=FVAwjmfej3nqMYEd/cFre4Znc/ZHhLSe9zvZuTAqMl2OeNj5exULi37is81yIGtUGj
         8YEPF8C8eRB1LMDOliqw+mxdx1vjQvKuxoh63VdO1CjOk6VxBfavYB35+SCS0JCDuh8u
         ogbZlGB/0cbV03yvHAs6WPVWPUZ/QwW9o9NyjSb/Mqung6LUJeOWMRX7cYlbOFacknqY
         kQ76uwE7FBQ1E7NZ0EJNKD5JipL+vdhw9K+5A5aY430aMas96974wo3kSochFPX+7ilV
         ifwiI9yg44Q0AV3xxwmHtkRsx9JmCfRXCD4L3CmFoxHiasFKNvT6Bp+u62MGOBXsBSKS
         fYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xRQcjT2cwM0/VPiO9P1eTnmzyIZVCOPyKu/hBcTXmJU=;
        b=Z85NRnvYtUIrjJMl0lXyLqcy1Mkc1yYUO727AqUbA9Opkilj+mv2ZgKqhFE74/zWE1
         xabMQ5mGMVTxR6LMOORHsmgc4m91GBYlRFjGz45Ot6di0rBq0qRlaCVly4G2TWujZ3Mr
         6CJS4y/mECGQ3kleMxBmwoDD5pJrNAx8veX5p5o6eZ59y30NxuVwF0LWSpQ6wNeetSDF
         mmEmd53V2vxg2cDGTeetNfv7qlrK+ZNFpMo4ulp/C6OtsLu1ESpPKiirn6ex3XllyhCw
         I7831GYzzxdy7ov2CUfczdLKPV7Ru0BZdNR+or6sXeFqJuXAyYHHYOhlD4mFASa+kTXY
         rzHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qGwxCSdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si5093784eda.198.2021.06.17.06.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 06:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qGwxCSdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lts1o-00031O-4Z
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 09:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lts02-00008x-Gw
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:24:03 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltrzx-0006bi-GE
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:24:02 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ji1so3740122ejc.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRQcjT2cwM0/VPiO9P1eTnmzyIZVCOPyKu/hBcTXmJU=;
 b=qGwxCSdIIaemwdsFO8YCNrJ4kfsG6ZSPoSajdjQmlVGubygUGEtvuUOdFs9AYrhKs0
 aEWI3hcoztG7OF50SzgKi4GhnO3HQS3KHSE5MIw+kmO7BdamzwfFarzRKQRVj0iZQTVk
 ATF1sxuznbS9mRknphFPh+8tXmM2xFgpnOcox2+qri5k6NhpuLMtGyFxu5HKwyepsvGA
 ZxFmT4leBIhIQpclV5Y61O/WraO/nBDj2CmIT3Jn7DcAsJXY5Ifz+GngsXyFZmH1YT7k
 Jx0JR0pZBY3LenKPvUnuWbR1yNm13OI4oJgaZ2b9tdY/Idqsc5T5+fHCGmJoYJmWLFFn
 v3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRQcjT2cwM0/VPiO9P1eTnmzyIZVCOPyKu/hBcTXmJU=;
 b=tUJDe51S7mb4TROeNRp9JgpOujSXJhMT8cr1ZvE6ZoMo2FNtG/J8yT5va9IxAYzP/N
 kp3nCqtJjTow2DtRZ4si9+VHHhoTNHrmEZsZAy5J+VLj6T/bVgohpJtVw13NCWtqC9BC
 gmsZLB8v+MF+4GHuMGoUOK6juryScD6GMjhks/vt9Nb1lo8wOzh3okO/bgbdxgKIcD6Y
 5drMiNj+Y148t9GDAEyVAbenOiJ1JEwMjFOeXYiM9+fuPFdgl+6c2+3TJF4cLQtQeVtN
 QC8XpN71loQ4eNk+k1G1kW4AsjekF6a4A/UGzGtojkHM6zFjxvtQ0DVdPSDOqdd+ZvNr
 XZTg==
X-Gm-Message-State: AOAM531rwZZmTyiwBvT/iDTpAam9FOC8ItmwDKqjL/SyRaEIj6MPHcyW
 nVT2xvJRWyruwvsG7c2nBkqccp3M8J2nT9/lCI7a9g==
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr5224849ejc.4.1623936235491; 
 Thu, 17 Jun 2021 06:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-36-peter.maydell@linaro.org>
 <54fdcf6b-2498-feaa-f977-f86c567c8dd1@suse.de>
In-Reply-To: <54fdcf6b-2498-feaa-f977-f86c567c8dd1@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 14:23:20 +0100
Message-ID: <CAFEAcA8h+p7=Dy5uQEs0O_9vJge6hbNeGwv-rJV0AxGdq=biKg@mail.gmail.com>
Subject: Re: [PATCH v3 35/44] target/arm: Implmement MVE VRSHL
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 44EHXqRzvsWc

On Thu, 17 Jun 2021 at 14:20, Claudio Fontana <cfontana@suse.de> wrote:
>
> Hi, typo in the Subject: "Implmement MVE VRSHL"

Oops, thanks. (I have a feeling I caught that in a previous
version but it then slipped back in again.)

-- PMM
