Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1245852ejf;
        Mon, 15 Aug 2022 08:08:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IW5EUk6XSFSOqEJFw5OH/B7hElpnvGu9OclvI1sn4BJN9CRC+8lXXlvba1n1EB3e4pbHw
X-Received: by 2002:a05:620a:298a:b0:6b9:5772:94f1 with SMTP id r10-20020a05620a298a00b006b9577294f1mr11909854qkp.652.1660576097303;
        Mon, 15 Aug 2022 08:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660576097; cv=none;
        d=google.com; s=arc-20160816;
        b=QYSAEPuDl44nQ37R+LEvqSQ6HZoBS8Hy8FgVGJNdH1cVQNlbfXvk3z05ecdinIOCPT
         +pYzUTt1EeWIgOkDnjnSe9wKK5/NYGUDI9DKXjy/tZxPGtd0irloSGoX55/tSjG9aaVM
         lInOstwqRnD8mypV9HsF7WzAsr9xnRQX7MsKeXaHNOg27eE+oL+pqpoawKYnCywMbx8U
         6TqGKtY7C84G5YIjxzDGNYaG/62vhUkvZSO7owGwcmrcQ8lcw+hhR16fsogyqSVKKEq5
         jzZvAn86/LQq/5L0Zk4PyB6KdseUDkhEEV2zPzifzjmMHDLyPlZC1/NWZQcJVvEuRWpU
         nFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xk3D0qnFEv6Js9SIYN+NeNUNen8iIiMti5KqnenDtCI=;
        b=vhcXcn+mKTYbWy8J5S+hEhm1fDkNZSMYTIq28dccbZbKKCi4uLCLvEA2nVzK9vPZ5w
         2WzbHMA1FGakVfxPLzSMeS/6hdRbOYGJEYj6Tspy3p23kXTXrpBceTAxJT2oTT5+EEhx
         zzjo5uw1MtN25y0bUeIn2lV4XRnTz9NijWGOOg4DhDsTcdXmns1mNTFDiLpJgzU/zo/x
         GjzpAlaJGDkfdcVxeI7ejRsvidWIBjURjROCypQpLqk+WT2L5q8m54EdbezVVdGQFRF5
         k6W2/vZBSbJDwbZ41R7TSut1yngFw4FdykcjGeyrKH0hN4kakuyk8HS3Hb6MbStCaaKH
         0pcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZH6i/Urv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a05620a268300b006b94299c9f3si5364169qkp.7.2022.08.15.08.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Aug 2022 08:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZH6i/Urv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNbhQ-0008CS-RE
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 11:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbh2-0008AK-Q7
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 11:07:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbh1-0002uw-A9
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 11:07:52 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3246910dac3so79379837b3.12
 for <qemu-arm@nongnu.org>; Mon, 15 Aug 2022 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xk3D0qnFEv6Js9SIYN+NeNUNen8iIiMti5KqnenDtCI=;
 b=ZH6i/Urv/InUOrTukcha3fE+bZS6aGdaVCDDgASyKAGXLUOVK7zkPfMTgD+q1XiYKe
 XpceXTzpGn6Oea5qDcf5Ku1txwNGqT7OQ0Zf4YN5VjDGBEss5z6tqHyWiU3rkow5pML1
 h9jrAC2reqibXLrKNZYLy6DyZqSjrtT5v/+ruaQVyLhJcnQKQtaPk8N8bkDBA86gD+tW
 hgH95iVJI0KZaudcu0+/KZDaZvLv+NmDN85pFcZMRIriggIhe07Dy+Yq3dFK1Xt4U827
 R8ixwyUW4xU/DkofqSF+jWfGZZjyunonJ8gAoByp4uh5rEU3k3kJ2DVzyN8qu8IrLOqP
 XMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xk3D0qnFEv6Js9SIYN+NeNUNen8iIiMti5KqnenDtCI=;
 b=Y/AwcnOpNbZ2+Okr92rzPIg2A+YtDH26zckYsGNR5A26ftEiO0OX4Y2G1tPOZt0veG
 3xGa2l42927DC+8q1HmxgCAdkMy3z0b3cGuXM9Ny6U7qVH/shQr5dI+qGZ+J7bkdddET
 phfC6Kz/FakakITMbFkpbx2U1Tc1FdXTdFQVIdeYeEM/MscmRxpAe6QBhmRRnm2Yb6Y6
 ONlrr0+CJTVYbVbUVKRex1cYEz4ecMgGwl79b/e1azE2WBCoi+JJAH9b9dk2l1XxEPcM
 LfvFyd7kUIwfk+nf5T3A12ScVa6sV+DQxYXObjbAqCtMdQ4Vrj2RpT3cuQ/3QPSbiNJE
 FKag==
X-Gm-Message-State: ACgBeo2VYEeHUNIoY1s80Q0fz4+BjrhT6i2+pxIRCm3vh6wDKgQ1evYg
 X2KTB+47AtxUi1Kk+hclzRN5Y0GYPsUDwcP9BPzK8w==
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr12595202ybn.479.1660576070236; Mon, 15
 Aug 2022 08:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
 <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
 <20220809170825.00001b61@huawei.com> <20220811180857.00005e67@huawei.com>
 <20220812164403.00001654@huawei.com>
 <62f679b67828f_992102942@dwillia2-xfh.jf.intel.com.notmuch>
 <20220812171509.00006034@huawei.com> <20220815151809.0000294c@huawei.com>
 <20220815155516.00007ebf@huawei.com>
In-Reply-To: <20220815155516.00007ebf@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2022 16:07:09 +0100
Message-ID: <CAFEAcA-W-xnm_H_qo_YJXY0Ve75DCMH8WQkZh_AWU1RF3JQcwA@mail.gmail.com>
Subject: Re: [BUG] cxl can not create region
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jonathan Cameron via <qemu-devel@nongnu.org>,
 Dan Williams <dan.j.williams@intel.com>, 
 Bobo WL <lmw.bobo@gmail.com>, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zS/c+PHiUI0Z

On Mon, 15 Aug 2022 at 15:55, Jonathan Cameron via <qemu-arm@nongnu.org> wrote:
> In the interests of defensive / correct handling from QEMU I took a
> look into why it was crashing.  Turns out that providing a NULL write callback for
> the memory device region (that the above overlarge write was spilling into) isn't
> a safe thing to do.  Needs a stub. Oops.

Yeah. We've talked before about adding an assert so that that kind of
"missing function" bug is caught at device creation rather than only
if the guest tries to access the device, but we never quite got around
to it...

-- PMM
