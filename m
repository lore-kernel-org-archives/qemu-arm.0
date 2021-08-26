Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp646576lfb;
        Thu, 26 Aug 2021 07:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDWPV3rvH2yStcpjD2AnhIEvfvkOC405fKGWRxaSl9P+nWHyZP+wbhsuPFCjIBB/G8yUGO
X-Received: by 2002:a05:6402:1c1e:: with SMTP id ck30mr4464557edb.103.1629986927400;
        Thu, 26 Aug 2021 07:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629986927; cv=none;
        d=google.com; s=arc-20160816;
        b=W79cbRx3Xc4hjnDvAJsO6vzj3b0zxawo1oLwJfSyrBT1E/s8ILsxOC0aK1owZmTw41
         FLtxJJtr2LcqjHWV38vl7dCc28JIrG3viJRdYKfj6VjTsUjAntcXa4xjHlDLed1UHcKZ
         /79C+H8Jh3RMSZOXuLh3MQowg5YryQAyKiIcohpwDtSGG4zT31QmI1ps+nVIJy3YBaZA
         Kh2z3kzT3Uo3Rm6p4F6mwdrZHmIJf+1MGs5NlJDps5gG1NGneywf28y/TTBtbWRzajLx
         kl2PeWVIDicqn1asO+AkzEjMhDejMpEYdHNGICiqDBW0/krQe5CoNQppj8jY2C6RRwAu
         9+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BjKuYdswOqSy3z980LflDXbiUQ4p4k3SDJCZrTQ02YY=;
        b=bZ/Az6ttA+E/H37Ccpu2O44MCshDIFuZAk/cQ/O+n34eMgWy0h38iGszSCtQEVyt2Q
         ISq7V8BG9wyn8P5P6gMISu4eSNRcG5OS3tToBK4dmM9277uHgArd14hIqF5BgVHC8j7h
         MtzlKt6b7H2ppfeEtX0CzEkKhlECas1fAgOR0GAQu6J746o9k+VSBq6sCuxNge82agoh
         eDEwjxqAFkJF7o+8AlyUXQMNIR2qROo98kYbwJfyYxkVU1EkxwEJj48odFMgRlUbf4Zu
         6mVzyVOQ4TL1Hhgnm89pQ6w9ou4nO+cVggZ955lg0qsB44SH9BvrvAfyWhLa7/h5Pvmv
         mkbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YZNrI6h6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26si3107229ejk.661.2021.08.26.07.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 07:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YZNrI6h6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJG3i-0006XV-FT
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 10:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mJG3a-0006XH-BV; Thu, 26 Aug 2021 10:08:38 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mJG3Y-00073B-Rg; Thu, 26 Aug 2021 10:08:38 -0400
Received: by mail-lf1-x131.google.com with SMTP id r9so7166005lfn.3;
 Thu, 26 Aug 2021 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BjKuYdswOqSy3z980LflDXbiUQ4p4k3SDJCZrTQ02YY=;
 b=YZNrI6h6Ib4nKMbOwwqfDuJXIBC6uOdAbeYMqiluF5+cv6O97A7CpdsC8XsvkLl+Gk
 ivYs7cYBYfu0QzjW257b4/EcTxPlDida2NF4ffKHKXjahVQYyZfom0SauqJdj2vnj8RZ
 iGGXXVpk4fgBRjz4YnSvwwPslll99EgzWF/91/oihQmI52KY5Y43UPoJrHBXYfmjOaGi
 IgHEiG2H5kVn1bBJxCd7SFxRqCmNDn675Y4L8FQGnFLICgg/M8W2XY1jqMtN5g0mv+yF
 CuM80MlJS1TlnpBqhAp6VgpFeoQ74RH8vV5HMYWvtjMNTMm4z6y0U0LuqyL4jhDrTjPm
 6/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BjKuYdswOqSy3z980LflDXbiUQ4p4k3SDJCZrTQ02YY=;
 b=s5bx+tUnsmww76Vz+v3uRNGEvwvCCszqB0NB7vtaG2ZKMxEH7rLIl65AgjYGRsjcwh
 p5+zjNpwS2VwwAUr5TdHEQ6RV9xrZxs5z97Bf3juq3Vs/H5P1sVqWRA0VVvB0LqHiszf
 JiETHWLKekB4OCrdjFJr6VSIBUldpS5CIUJCe4NtOyT7RImS5qxskSMfuKdJZQtES3cW
 67AmDCg169pxJ9KqdLTjVDJW9JFDne4pLtlH102wv1D382UGetGfhiBc8/Gd/AwRWscL
 2/PbDxGnp/vb9R/VT/Z2jknAyyyWFel4zYDH7nhuC0hkpNoylcMGxUl84n8In90r0mtP
 8xeA==
X-Gm-Message-State: AOAM532lo7y7cEXJzUTNhWRyWaV5StCGcGzfUOEg7bceuk8e+GrpJWfD
 txxvDwrdzpEzzsp2xiB3YmI=
X-Received: by 2002:a19:c197:: with SMTP id r145mr1986192lff.276.1629986913077; 
 Thu, 26 Aug 2021 07:08:33 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 131sm354848ljj.52.2021.08.26.07.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 07:08:32 -0700 (PDT)
Date: Thu, 26 Aug 2021 16:08:32 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH v2 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Message-ID: <20210826140832.GL3586016@toto>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qoUx0SjjJ3If

On Mon, Aug 23, 2021 at 10:49:15AM -0700, Tong Ho wrote:
> This series implements the Xilinx eFUSE and BBRAM devices for
> the Versal and ZynqMP product families.
> 
> Furthermore, both new devices are connected to the xlnx-versal-virt
> board and the xlnx-zcu102 board.
> 
> See changes in docs/system/arm/xlnx-versal-virt.rst for detail.


Thanks Tong,

On the entire series:

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
