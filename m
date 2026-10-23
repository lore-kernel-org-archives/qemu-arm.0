Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2E3606A31B
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sE/hJgCW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKEI9-0005kL-1L; Fri, 23 Oct 2026 08:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEI6-0005iW-4r
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:22:34 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEI4-0003ek-E1
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:22:33 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8726acc5eadso7006857b3.0
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758151; cv=none;
 d=google.com; s=arc-20260327;
 b=MEe52fZwsQR2vEIVf9E/r7CyRrE2+SG9g29Ilsc1UArgkZ2VOGYyNybjVUkm4EuQ28
 azaO6TXroK0MAacr406RtEivgckLhVP2cP+Nn0Zgy2uxqDMR+mYHhRXu8gwHWhTtK1Ue
 vPmJfaSjldCiJz9JSYKzpvMB1He8CHQF7LF5DurJeSQ0bsI9GuQr2fAMWz4PbOiBxJHw
 t1YcZBLJjmYAMR9OqyZO2heBaSxz5729KiqKp/oT93z97mYFNxleJjPjxlreuSP40uM5
 +u/Oq3ciDhGcVSD38QaQTDtT6n8AMUyH4xS/7rVzlVOG7H6uLNcaEk0gSnBT77bWEHxL
 eI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Si/zMrYbvAA1FBGBmaojS43YWyPfsmCfr5xq6CLJxHE=;
 fh=BLpUe8mV3soBX9iMd/g2diqT+9c1SPW2W+IyVAwUeIM=;
 b=ND/l5EFBBhRC8uXzi15mR9AXNIwlT/RCJe3y9hIPbCWKqlOe5KeKCy40hlSRX9vGRa
 KgbbyUmIYIdrJD+AYmwnc+pf9/OKO3DXfnWYJLxYO8grR63sv3H5Nfg1oHiz49IWNgGg
 3Z5Nohv0wcOexR1Ve2CzmJpuisDlXl3k5YhYNXmGpBhFPicvvyy8gTDS9MVwT/zyGfCO
 m2Vvt0h4NAPYRx5pcZv9kvCGourwDQqc5rlL6ixWFcEUh1Fjgg1Nzyq7Lc4zga1GQXkJ
 1KITAEgOZJvCBk95SJu1z3XzRi6m3HWxfrOiQAaFCJ2c1+Ara/YAgHHTpLps4XTmM0T+
 8Ung==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792758151; x=1793362951; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Si/zMrYbvAA1FBGBmaojS43YWyPfsmCfr5xq6CLJxHE=;
 b=sE/hJgCWJErTBDdKQt1XByFTlZ6B1qP/7+cwtnSNL22egyM27vhp+424i5zXPsj/Lk
 TA/bkxhZHD/C0pMv0C7fRePaf8ZB5YBDYxfJDln61FXIPW47u6WEjzAXxmBA20QAUXcP
 xuy/26X/rQD05rSohaFvzs4rg52CA/Dt4MRItlA1OUCeIXZYMJy6rXnXBWWT4DATu+rj
 rzKe76Y/IXjwlOGvcezKfXe6zbsqt2LUymcE7DFtYivLPVPXtVia4zvd/MX5N6HwkVpB
 dCMM/7LnO0peOzahBNFWKifqtKDssC61N6DAvMOQe3UvLLzuDOD2BtDyDLSby4yJKan/
 n61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792758151; x=1793362951;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Si/zMrYbvAA1FBGBmaojS43YWyPfsmCfr5xq6CLJxHE=;
 b=RdkA4hrXRnwc67qYpemmX4D4ttKGKWmqKRslatJpgAQXGnkoILvJY0UIr9G+2KD62y
 Ql/1DlujjvzXlo1S2jKII45B6t5bV5Cqsy7N/XAiii3+0sQrMz1lX448UeOWNWYo2jNl
 pL/aNdVLQLvxqyH0m1ultZ4mUocU0lQbnHqAD54IjP2AWyehVVSIyeV8BMIhIhgUdB32
 dQtiorBOmZtyiNIGS4Pr5MsMwRz9IEucac9xCb6dsT1gNyQa/8fPq8OtCu6qJ5g+rD3y
 AJ901IZYaeSS3NvEf1tBu7QyYf/lMtu8FLZQ50PTiXFtBRdkE+QHmfOWHwRu3C4pfQLa
 inCw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw4fNFDpjI/S7wg2LMHpGs7s47Dla2AVYP07y+vzKVI0mGFYYD91kgDlzJO5BFn9f3NqwFTiHVK+g==@nongnu.org
X-Gm-Message-State: AFq9FYJU73uSJzhI8WEZkz0DFGb19iijPPo3rAB17b8al+1DY7wB7h4S
 OKaEI1FwEzyUicQkNJb79LNG1haFtBQmM5e58ZYx0exGkk1SyiMdqdmBUyPsdLJXpF4D4Y5oLzh
 Sr793QOnAafpfNhIRp1dXXb8d01c9vyibqZzMkDRXiFrF2rDcggSFEcU=
X-Gm-Gg: AYBFou1o2JkmnVzR8VJOKFbnsWsVYI9jglaPYyZ4ZHhflJ4CDUBxWrGZd2uVxUXX3XC
 piCSyHhUiJHpRPerg2GDd2P6/jgKh+nh/FbdNXQ7G3V1l8kkGRUBmrTMTJO+AzFOgVJUIsiHVcA
 mQ6TznTKWDI46/vaQwBNW0QSvtnOGj6fwie3h74tloOq0C3dUyGDsg+9faBE4EzQSKjKhckC0Xd
 pl5XREwpOVg5eQCK1CM+fR6SWhNJRXdHiz/ffQy1VuvF88LyjqeO/wGl7l+rGSw21u4upB26zWx
 HRdKXML5UOzUGFt42xwLDnaJ92nLnuJVF3/dSYpZmC5v32hIZy5yAG6GmCm54wlQmGohA7v0SnO
 CGDbB7EQcTxUqV2PVmeCwf/r0doxzKaRKVPnQyzI+Dvvh2cV7piqQa2EDToNvsgK8+CjwR8aH3n
 ti+KsrdCos7szvZU6tjSsEpDoHdTbOaNqzpsn/EfYLeg==
X-Received: by 2002:a05:690c:c505:b0:8a8:c71e:d83c with SMTP id
 00721157ae682-8b157da8f62mr17192697b3.14.1792758151161; Fri, 23 Oct 2026
 05:22:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022213647.21665-1-mohamed@unpredictable.fr>
 <20261022213647.21665-5-mohamed@unpredictable.fr>
In-Reply-To: <20261022213647.21665-5-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 13:22:19 +0100
X-Gm-Features: AclHuK9iBuR0ekiA_HJtYvV8btVvIBsUx7iXXm1qL7f0P09OUTY9vDkbVDrlKJc
Message-ID: <CAFEAcA-Vw5z1qe-=a-JPLSX4q+8b+Fet-7ek7taoBEd6Mi117g@mail.gmail.com>
Subject: Re: [PATCH 4/6] hvf: arm: remove broken ID_AA64PFR0_EL1.GIC sync
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 at 22:36, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> The GIC is only realised after this executes
> in arm_gicv3_common_realize.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

