Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B5AC43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 13:01:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfdWH-0006Qd-Vk; Fri, 03 Jul 2026 09:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfdVw-0006I5-Dh
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 09:01:10 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfdVq-00060Z-0H
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 09:01:01 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-664c4a04081so407026d50.2
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 06:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783083656; cv=none;
 d=google.com; s=arc-20260327;
 b=gWzaSVqDVCzWFdkvmz72o308QPDWBfsgrZAES+zt73J6dig72bbtOKJrzQa+KuKg7i
 76CcmBZQ2D+3eMDvlcl3Ne/5Qr/WQMoa3lscUqnnPQ/H5+/y9RCUHNYwZCmdJFsO5BpE
 Mb6Fy7EvYbvh/0fORYWnqTDlWbfEgAzFe9e6ZmsgM4sz7t77DMI7nZPBq2VIi6HSe/8f
 jLS0XoZKY8wIrnB2EGa9cE+c2CdZMQLQqLbDwuAjymhzVlMMw7FdXxn3b0VDL+0Z39w5
 oS6Ojgs4sikzU7ZpppwUZKX4bRE/vTHMS/gbCMDsu4+C9JVAhCFW4cHJkYO9R+twgffO
 rvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UckMtLVF6KhaXmpXJv5ywf6Zb6vXY25s7Sc1MAYSPQk=;
 fh=RD/nGLUElzrB8PK5xIp47u7WY2dZSWvzn0ASxWkXHtc=;
 b=ZLXK78PTOjrTIpn70n7ZHCcpV5RVG3Cg/C1X36n3Oiv3/i3m2f+SYr6lwo7ZaFW4/l
 /GSr2BCRgVpsXwurPRd5OPYvdiS01PGW9XYJ9MkhmttGfIEdI3cq/sHOXtzEZBAmnuod
 WrFIUtAXcD66hEwH2vX4IX8LP/3ZcUd0HJpnaksEl/3Q9eqWXotQ8xP6sVp3hSAfATEz
 t60hUvyQN72VRNOZ19fmIftVdb17hxKxTlIhusb1zutNOilIcLkIl3y2YkA34UGVmWnc
 gLzffr9/9qU/CvtiehBziGY9vCtGhT0PUG7QvmcY1eLXETdibMEp9Z8cVUhFYj6ePvt2
 E7LQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783083656; x=1783688456; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UckMtLVF6KhaXmpXJv5ywf6Zb6vXY25s7Sc1MAYSPQk=;
 b=u91y83MFniygD8brX5sibrgm+HESuActVv48fscF4JWR68SXSiZJEXKut4Luf/BEt4
 /y4i2Vq/PjrEuBV9ExQxBTuwNkUR1bp23eXbcw20c1GB5WOHDWSZED5s9/u7ESWWfIzl
 +2+4zkrqKTk2Zber4x81SAx+YEFC/BU05zjafz5LI5V+ccHTB45AmnPvdZDXlsi7kN+m
 Ca0gVrbSrNapB1gBPgwi7JNjIOI8USNbHj93XawLZjHug/XTo9HbvW2if599iwJRuTFO
 bfOsGwLNMi81tLSoI53ne05wmOIUlzlYvhroDTZ0uFks+nDNoUaFYuFk+q8o2T8stPoI
 7qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783083656; x=1783688456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UckMtLVF6KhaXmpXJv5ywf6Zb6vXY25s7Sc1MAYSPQk=;
 b=o1hYscBBf4ScM8SunuDfLD2vI9tN9wO9F4A39C2QqqN9TsoC7/H7CxAOcvTXV2uJgc
 f+uR9Pn3YbT53X9qVmk5TP3OeoUc9U5aTaLLDLxpQoRgvSn4efy8ecWiS6kWO8/NvJ32
 ViQwiODaTJccZTDX7E971yVhBv4YbYNLAXV/TCGsdLfioivP8aTheLbMdhZmWITmOyGS
 GIMQXeIbiJCkV9id3mAFgaRZZ+TwMfjrXCugvCUPUb1JcayL7ivvp/yqxS2bmd/cDSez
 T11lcs3o8NYkvxH18gsFwFMBS3aZMQArS9InHKVDXbme9MInofy2xM9VyVl5zr/Hl7hX
 RCxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNsmqJDOx+MLWTMQQec3h7TCYrFRpeHOQAD1lRfLgspXnG7mjGUdhysT/F/SiT5fzyWnFbRVdCnw==@nongnu.org
X-Gm-Message-State: AOJu0Ywwj+cHC6E61NdEqxf+e6/uKMuKytzkiAjjfYDZV/yNqDuWA/wt
 tP4nZi8yTHLbb1h+JNl9eraVi7ALF6aNyMnuevDArwFyQAPZkuxaEqPX34Vo8fYFwCM0rnV7ucR
 1oUwSQK04zLAIfVOR5AApxftM+MYc5189QJu+VjClbg==
X-Gm-Gg: AfdE7cnLHlZNRTAwk9fWpnHU7V0iXb4knhyz/TXG246ksNAZg9lSwlMBrbBLaf4EpPA
 jfyr7riZRmIDOilcnCHbRyq+QRMnYyV7qGxOqVnU02RJQUMe74SSRqDaOIwFFEb7fsSr13GfoV3
 ATX8ydJwqVdRzN8CyxTSCP9G/H1JagtrORGZ9mYan1ROCGOpINF100vCgAogS8hOl+joUcfLH26
 IR5QEhzZpqVot+AxqA+W+arODlX/7c5ZaYP5Hzue8JY6vBxu/El6XPqV08YGIlNG61LX/at/RWQ
 O/QDSoUQg0Wf7OwaEQ1qpMN5M1ulwNPcoBhcrv9CkFKyLAFjcX/lZKg0
X-Received: by 2002:a53:d014:0:b0:664:d162:6b95 with SMTP id
 956f58d0204a3-66521d4f223mr8780360d50.78.1783083656035; Fri, 03 Jul 2026
 06:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260702133606.34529-1-sebott@redhat.com>
In-Reply-To: <20260702133606.34529-1-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 14:00:44 +0100
X-Gm-Features: AVVi8Cdjp4rhgW4B84oSynffNmIv6XYhu6GnwNTUBNFSpV6yRtac02uO6Md2tug
Message-ID: <CAFEAcA_0KOc_4DHioDbXKrAy-R45PEyDg1iS_dz7XgB0=0m9jg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] arm: demuxed ID registers (CCSIDR_EL1)
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 2 Jul 2026 at 14:36, Sebastian Ott <sebott@redhat.com> wrote:
>
> Handle the demuxed ID register CCSIDR_EL1 as part of the
> idregs array. V3 of this series was posted here:
> https://lore.kernel.org/qemu-devel/20260622135627.40573-1-sebott@redhat.com/
>
> Changes V3->V4:
> * added R-B from Eric
> * incorporated suggestions from Eric

Hi; there's no description in this cover letter of
what the series is trying to accomplish. Could you
explain a bit what the motivation is, please?

thanks
-- PMM

