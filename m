Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2620002lfy;
        Mon, 24 Aug 2020 07:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB3+wdMkfbpt8dLgTQDfQu8/JthSSmI5UjloUWh7BCWW7n+Bs5+fgVQ9EqXUxKOFYTqLvJ
X-Received: by 2002:a25:3b4a:: with SMTP id i71mr7424742yba.464.1598280552114;
        Mon, 24 Aug 2020 07:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598280552; cv=none;
        d=google.com; s=arc-20160816;
        b=s5bp9SBc04BQVr03Fezj1bWSa0tOpBbGsF+2/OqN1xkYDiNvS+feqdxnDQD9fdUxSC
         FnPWVjklgpRTFkxsX/HCLeYdkGhSgDLV8CtklGM63UaYI1lpeo27zpSqTQ9wdcstAljY
         yAkxZj3MMSfO6NkV27/5Axns2cKmSOykgl1FnCRy1tIp+C1QUf6m2BMx+F3xUiU0CDm2
         XZ9gSEeJ4SyLqH70kl5jjBUUDz8UjNw3qnj4HPeQ5Kpo2U1S2GQ7IZ5voZYIOt8MiVxK
         zm4GIcfZlz/lXv1sZzetECAczS9lBk21eEM95FaHQYi7CpVTr+VP/oaWHtir/zCKK1Ik
         k5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yurBVv7Z5hOEmPVsD9hHUnWP2HVRWYL8WjIY3DhW+Q8=;
        b=M9XHpDnllvRUgxHCzShfqcQpHxQnRbCOhj7A0TMH6vhShC5o33lomgf5XluWJyotjd
         6iihBITJEuBS6BY/89/34DbwDBJagHvSlLNiYhmKPynaLl4+cs8HVcsKopbo3GGtU44/
         QVPxSAQomtLaqd4cReKCXmObF2YhFb6thKixaRCk338bEJQiCtP75uzq1mqGO53gw2hy
         lb9WcEe9CibCI1B4/I4EICwG2WBi2KercngpynVUMVKYziOVQChH01+vSIC/aLQj6zVr
         LltriV1U0XmwAbSK4RN62y/rEXiVOfw7NIRdr99fEwjvVzOJGv4zSvX2vo9+uqHazNeb
         4vYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQ0sYcLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si10703205ybl.349.2020.08.24.07.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:49:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IQ0sYcLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADmZ-0002ut-Dr
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADmN-0002qd-SO
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:48:59 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADmM-00061p-5P
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:48:59 -0400
Received: by mail-ed1-x542.google.com with SMTP id bs17so8312221edb.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yurBVv7Z5hOEmPVsD9hHUnWP2HVRWYL8WjIY3DhW+Q8=;
 b=IQ0sYcLU7UDEtXNxpIM+5JuSucS/dA9nAR96cVxLIrMpxdidga/RQOk/fXSfm6kVxJ
 Vuey9pAYfaV1YCbqyFkWnoiCnlyiSpWnX/v/3nV3TYnf4vgF0j66Q6R8qErAwQEDRzpJ
 V2bSew5y/6coynKN/P+dDxHzm6fNR1kUCXExqHpfbtzCptM+gECf6aIftnDxiTQ/FFt8
 bL/dD8rqba1CwNsqlci+yn+uaenNoDnAoH7OAMcAuIeDdRdNDibCs19Iow7STfYU9gWq
 SkhRXwxMZYMfMAOyPE0RjbMzyMY34G0WORSHaOYhLTLR+lG70d2nlE9RglNk117Ys0ad
 JKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yurBVv7Z5hOEmPVsD9hHUnWP2HVRWYL8WjIY3DhW+Q8=;
 b=lQA63ctQ+dxc0ywIXX85FnB+Iy0JMjiJIJh95Kmpaqcb4XeTHJsfqQrQ0JYsqW+5Z/
 f9ZPRv4ZSRagvdaCZvdTlVLbFVnOa3MF7IQegwIDtb/QcUjfDp9cnRTXMI/uhWkBip5i
 eNArUVHADphLykPzQfKMtJvsAYSDx2/FBh+342C8Wl9tcgsjMtjXkfwV0hv2GGLQLx5L
 KHPNLSdUm9Ze/sGXcdfxGZlZMmdWqx2JbQ47BrMBP4IP0QKfkNtbGhZKyaW3nBPp6z2v
 V47SxVHwc2IRKS/ggUctXu/I+n/aEzKEd9g6SqxkrAkS/yJrqgjXQqiv+aHet3whkgIb
 d9Yg==
X-Gm-Message-State: AOAM531/7tSZc4jfIBWDh6F/8NL6+jc9KelOBjNc0L9IeQ549lu9Dbxy
 ofxQ6rmci2aIGAUIS5+uCXfXYOrAhq/T0U+OFmOHrQ==
X-Received: by 2002:aa7:ca14:: with SMTP id y20mr1842912eds.100.1598280536158; 
 Mon, 24 Aug 2020 07:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200821083853.356490-1-graeme@nuviainc.com>
In-Reply-To: <20200821083853.356490-1-graeme@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 15:48:45 +0100
Message-ID: <CAFEAcA_GfXttD7Xq909jy9eE6E+8Kj0mTM+vv-dmicQarfS+Fw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/sbsa-ref: fix typo breaking PCIe IRQs
To: Graeme Gregory <graeme@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: urqDECRB5IAi

On Fri, 21 Aug 2020 at 09:39, Graeme Gregory <graeme@nuviainc.com> wrote:
>
> Fixing a typo in a previous patch that translated an "i" to a 1
> and therefore breaking the allocation of PCIe interrupts. This was
> discovered when virtio-net-pci devices ceased to function correctly.
>
> Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Applied to target-arm.next, thanks. (I added a cc: qemu-stable@nongnu.org;
seems worth fixing in 5.1.1.)

-- PMM
