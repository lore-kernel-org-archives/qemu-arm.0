Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2830371lfc;
        Mon, 26 Jul 2021 05:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwth7HONuibBrM5Z8/sxCxvKMSZk5+Z4MwHH3bJ1sXrLV6vDc6jIh2LCW+7LEvqlvnXFVmB
X-Received: by 2002:ab0:494a:: with SMTP id a10mr12305121uad.90.1627303419532;
        Mon, 26 Jul 2021 05:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627303419; cv=none;
        d=google.com; s=arc-20160816;
        b=Ukpl9WkKeQdBTAIFbCdLdh+i44cPCukctYtE5d8GZ8BSMRfyGWccOSJOaWuQqKfcTN
         Opem4QBrFjcliME2+DoCaXbF3M1sMbKbs/u9NdLw8d4Vfm31qbC5JlR2E8WRVhU3iwyd
         vLzSGCAZ82W302ERHadhfWEysT9TO+sy8SIXzISuPSYG0vDEZzKhlUdlqSEkB2sa64Ve
         mLzkQADd45L70SgGnAdBFLOlfhjfuFQE9i+4/RY0FKhBd8yrY2vxBV4lJSdR2H8rixx9
         j0RCS0v8wbO+03EG270KBaWt8FeXsvZVaj6OBmAxzf0Z9MQHkFbS0xvEY9Km62b6oPWr
         hdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yZ5D/xIJ7nJcwLj4uwIq/XuR1cv1Hnm4hbKAZbIHcdI=;
        b=nNVnHV+AxhqWGLxMp0E3Fv31H2CcRqUwiHf/UXJJyFroWdNIO7yQK0dYFi+3vFH9jW
         jR6tABcHuxbY2XgcWumsHR1BAuqEr3k7kJeS51K9WPLDqDIY+hiNPq/YEOp6Xt7cxQLn
         DDct1WAoYSRcs47NstEKPKl/GoNTnyl/hoMSRnyzr11eSi+Zetq7aIMfZ8kMSezOsBVn
         EYI5zribADDAB6s+B6Eca7FpSkcGBAKLcPBQlH7R+C2dTwx+z/MRLpEw5McvDm0pzgWJ
         vZE0uWTjK1WzqsV/A9yAby4SsKZ3dwI35FOqO/kmQf5OLZelyohokRf+gw5Gu7S/VQfS
         oV7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jwCkiG1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a31si10267096uae.131.2021.07.26.05.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 05:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jwCkiG1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7zxK-0007x6-SB
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 08:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7zxC-0007wX-2v
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 08:43:30 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7zxA-0007dm-Gt
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 08:43:29 -0400
Received: by mail-ej1-x629.google.com with SMTP id v21so16312917ejg.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZ5D/xIJ7nJcwLj4uwIq/XuR1cv1Hnm4hbKAZbIHcdI=;
 b=jwCkiG1mANM3wvPDIOqYo9EkAR3ZZ8JfQwai7yNskNEQYN0oSPSpnMl5GVhT1YKVJf
 F307+a16i0Kj5CS11W3SBLBpWEOYx3Ht6hIDLWub/jdrOw/ptOX98cX5rzeLT7AzRyk1
 m7FT2DDRcNvpAtZDDsWN2fr4DpuyDwiR6ZW2aDpA6h2dMe8xqQ3dCFc82j/w+61mC3A/
 CIg3nVGSHIGpq1qjEMEBnurkOdu5OBTziDSBUOZKdslO9aaenR+CYWPrEx7WQekrX3zL
 3RxhtjGneGxRRhD9yVjM1/NEQ0D1VR3Ex9hCpPuzgFzdsMc2iYR5N36buwqBffnOOC69
 prWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZ5D/xIJ7nJcwLj4uwIq/XuR1cv1Hnm4hbKAZbIHcdI=;
 b=TkN7ZnEdfXKMErcjSrtrRh0oVPsIK8bzUt7iFVDPU6TpfZg2V+JH1tVdZ0Uqj5PNGa
 D1w9iDAQ1qU6KlS6wgd8bsAps00W6+kKkm38qPhy3mw25fTDhm2dXPfNz8BViVHSgpPf
 FW4siMGhp9JHAPOEMvmzdpTKN22pDXCHSF7IyrFUyoDBCrmUTcSnVexNFjKIKjCPkk65
 NEc7m3W+nE1HRF4Y+toBdDk8lQSMz8b63b5JJMlVitVDiO5hD8/Qk4Q2JhicQyVmkeaG
 4U6skgShsybe/gXaQPaw31BEttAC+mnM09WbK5CbQLsN0WTCeqt6zuF/cqHUmV/HT9bL
 Z9jw==
X-Gm-Message-State: AOAM530yNnF98AmxXPanqPNEdl6hnOR12XjVwGlCgao6p2QtSxuq3srY
 anMrxgQusAa86nmpvVP9pJVGue9wHFTx2mGaQ88zWw==
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr3603170ejb.382.1627303406886; 
 Mon, 26 Jul 2021 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
In-Reply-To: <20210723203344.968563-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 13:42:45 +0100
Message-ID: <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu
 property
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ppUKVh0VTG/h

On Fri, 23 Jul 2021 at 21:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is intended to resolve #482.
>
> Changes for v2:
>   * Split out length bounding fix to new patch.
>   * Use byte units for sve-default-vector-length.
>   * Support undocumented -1 "maximum".
>   * Add documentation.

I'm going to apply this to target-arm.next with the following
docs tweak squashed into patch 3:

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 4ff36cc83f0..7b97df442aa 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -379,11 +379,14 @@ example's (1), (4), and (6) exhibit recommended
uses of the properties.
 SVE User-mode Default Vector Length Property
 --------------------------------------------

-For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
+For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
 defined to mirror the Linux kernel parameter file
-`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
-is in units of bytes and must be between 16 and 8192.
+``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
+is in units of bytes and must be between 16 and 8192.
 If not specified, the default vector length is 64.

 If the default length is larger than the maximum vector length enabled
-with `sve<N>` properties, the actual vector length will be reduced.
+with ``sve<N>`` properties, the actual vector length will be reduced.
+
+If this property is set to ``-1`` then the default vector length
+is set to the maximum possible length.

thanks
-- PMM
