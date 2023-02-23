Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp865967ejc;
        Thu, 23 Feb 2023 08:09:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/RpPxgmcmwTnlEImOWND9PFs2f7sxA+kXaZWFux++pfjMRnxlRnqV0YcVmcibtVAEdlV+n
X-Received: by 2002:a2e:6e09:0:b0:295:97d4:5f4d with SMTP id j9-20020a2e6e09000000b0029597d45f4dmr2701776ljc.49.1677168556967;
        Thu, 23 Feb 2023 08:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677168556; cv=none;
        d=google.com; s=arc-20160816;
        b=pXbeYKDZA/dkjtCnEFvx7wm1hL5M1Ra3YKmUhcVLI3IPqmLuzMmobjT7TBAR7orEEQ
         /6ryDgGQCs0Q1nKGaKuGj6MsoB4W8upU+djsrjpGV8usSvaqnyeLrwXMuGypXNiuu0tX
         +xog99NNw7hMSMf2qf6I97R/sBI0g9BMmh0V5EItfngsDf/srGnyPcHZjoXVQ8reOpZG
         38lW4KLx+CDZ/tXa/4zhXb29jNCiU3C+XQSnGtM+YAHHBHOwwYXw6n3g+ELFlUgA/EW3
         6/Yhs4n4nnx2wPRLRYgG7kfSe+JhfLQBTKgwmiiwPLTBp6JTWDNl1fdd+OglzxZzORH6
         5d8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3wxqJjFuAtdMZTjznao6iO9+NagPS+Z1YESNjpmdP4g=;
        b=anvgeHfjW0NpoD3L1y7uLJOt1sWOvBQIx4f8MbxZoR0IBZtV8iaJip5ct4iwSSgS2B
         Drl3PRX9eZh3PI9G0NgRppzzne9d8djK3l8Bu2xa0TO/61Uw0lPgmHEx/zSrwCFlkk/P
         BLPkRTFkGhipsifRFjuxqaKRJYJk2/7DxBKhR8UWwzkQDFkv/y8kIWC1fa6l7x2hhR72
         DCZHT9L1xGIKZeXwgYDGItdC1+8K0Akttc2GCpi6Ww9x0HqH7aRThMBDS33Fvk4Boi4G
         frRvmDEyuO9QGGAWuXiOwBh5EEGCKpy/U9Jsw79F5FPTiX3Mw5yZAm11OM//pP8sATZ5
         qOKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pa7bVlWG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a2eb006000000b0028b60d2733asi8198075ljk.483.2023.02.23.08.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pa7bVlWG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVE9W-0000CK-UH; Thu, 23 Feb 2023 11:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE9Q-0000Bh-ST
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:08:56 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE9N-0007DX-6o
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:08:56 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so650936pjh.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3wxqJjFuAtdMZTjznao6iO9+NagPS+Z1YESNjpmdP4g=;
 b=Pa7bVlWGZSpSnZ6awNmyPHcwYb8C1mR2xGAlmwVdWpOof6z4UPJNFwxXufa/u0Q+v6
 Oxk4lPwhoB9e7CnD60SOKlxQ+eUg5hz3BxBK09c39OgOsgkvdmUqgAGUPWdGUcZ68mD/
 Uhabrh137610rWU3Vp6wpxMtLcLuvjhs+Uf+jtFOqzfqsmV44/D6Xvu/lrCQufUtQ5kd
 xeQT2pYSRjMelGoCOObT/U2h4fUWMjSr+6jYWmo63Nvk/OxKSKpxeHWJ+Q0FCeAh9LRM
 3JpqJ7E4q7VkJd0d5FSX3YdsvWkM8nPCNCSWv7na0P/1QWNopiyXDYoxE76+o/44KKN5
 4jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3wxqJjFuAtdMZTjznao6iO9+NagPS+Z1YESNjpmdP4g=;
 b=xpyaQW46lYA/UuArodpPMn5ybPo704lVrZoDQZqGAZPF9w178qXz7JXNcc+Szn5hCj
 aju6zx/LEN47d92MSYAPZEb9FlhoWV6aiReVRahKT7j+5Ns0hyV5lY5Hu9oJzKh3Uchy
 CBe/pcDsQ2sqkVIFiVG6C9mIaEbwKGVZsw6sqj2IiS9GCxsSE+w88zSTSp6LDBXW8OGG
 aZdkyhX+xBsbF3LEOhChoCYAWLiWYfPNths2u0Qpl/nR+CRLx9EFFSv098k4sZprk6FI
 RLuphc8BZd6n4UDWOeyeUNU2PvSUmPdVxtcN9nczcByV4dc2VP2ycpV/AsU+/BUD7sGC
 EaxA==
X-Gm-Message-State: AO0yUKWZYV1XCYS6Lm32G8MSI1ZbH9+5tIBlwr+StLgJbCO3mb7nQXLu
 hqqYkQirRL2uG31dHFx3hrNk6vJqVPEOwFgj7Kjnyw==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1247816pjb.137.1677168531431; Thu, 23
 Feb 2023 08:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-13-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:08:40 +0000
Message-ID: <CAFEAcA-zS5t-6e3fmjv-Q1maPJd4J7uSExa+_AgD-9oF6k4Ytw@mail.gmail.com>
Subject: Re: [PATCH v1 12/19] target/arm: Pass memop to gen_mte_check1*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: aTOpaq74ubRB

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the completed memop to gen_mte_check1_mmuidx.
> For the moment, do nothing more than extract the size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
