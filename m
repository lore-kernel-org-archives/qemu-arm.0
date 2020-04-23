Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1791611lfm;
        Thu, 23 Apr 2020 04:47:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypI89T/sRUbdUeIiuooCa7/Osu0Vw0VInc4rDWHrVWaE6wUi8GV5Eaj811XmM8Sdfcz0S8Se
X-Received: by 2002:ac8:3f2c:: with SMTP id c41mr3630554qtk.338.1587642437582;
        Thu, 23 Apr 2020 04:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587642437; cv=none;
        d=google.com; s=arc-20160816;
        b=YmC3Tk2pBQnlhp9B76+qTmfD5tfRMS30EvHuAR7NLfPH2DJz/PzDXIHahy3NxHmvvp
         bEiyuyjQsfCvCNfcPtK1OsWIf3fxD4Pv8f1lDOElnW7LFUwH2wHUEDLhEx/nGx3rHJhy
         VfNaJoDnevhMApdXU28kKpHk9L3iYrLkB+2otxZaJHh41P/Drgdc+knM4pfWnuve0oGd
         D87o5dpneawtsB0RmEJmAOKD7FRoAOjXwPw9I00VOysmRj6UNI6WFht3gWtqtoq0cWbc
         h4Q3P9sPpzWJWfttgLjfUA/4b8/9OkyDONgzDtpkkxnQyTNPJKd8pF+HvddDcjNzI6L/
         QcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSetTNDcrpopsgPqP6eitB3o26WOer/xC5F/oWH6eUA=;
        b=nOigjmbhvKdu0XHLs1JXoFSl1Id+Ap2xslJV9EKlo+0CG0O/Z/mJq5sQJfJJyLarqG
         6YqFPmzb7KY2FFVD9gpOGL4k+/i0VskryDgsqDgypi4PS8cL2jmwQhjLHVZKyrmmSqjI
         2HtycAyw1Xrh0e0cN0z21HcAzUrykFggOwH2U6mwCBbDd0yoY7qRXMzX4DCLgbmEwP1n
         R5wZ36SUyuOmoOcbd7SczM+4TfE8+g/9oSqAvcpBbd6nvBdn4a4oONdY1ffqowzy38AF
         bRMSglJfAmlbwXotulNBL8Ap1ufm7UqpQnbzkcrPfkVla4xOq8uUOkSCdu4orhjvh4qD
         8sZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Lv78rc3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si1231020qke.272.2020.04.23.04.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 04:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Lv78rc3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRaK4-0001u6-Rt
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 07:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRaJy-0001tL-6S
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:47:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRaJx-0005DI-Eb
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:47:09 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRaJx-0005Cx-2m
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:47:09 -0400
Received: by mail-ot1-x343.google.com with SMTP id c3so5455836otp.8
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSetTNDcrpopsgPqP6eitB3o26WOer/xC5F/oWH6eUA=;
 b=Lv78rc3/cGLSBgyBX9Rl0tiIxD8cvtx+17/DfZvx9cT0OCOoR+N8Jtl6ZS1Bh9+ShH
 mjFthZElCpGvXIhVUUhAXHWiFUEhCiMkI8TUx7QVAAFgIyOyruiXi5tnidNkITFqcAC9
 yBpoDet85jwLvzcsBNejnhjhjY9dvyvG/baO3koO3IaqZa9T0REk0iozj0+hGhAw4tWv
 oaehfkKCNVIyOYs6+sAqOe542Da5pEnseksIwx0TlgkyBToigCccU3zUrnhmqXQilcsW
 DCmEYORkblM2XLWN/60Vmnc9illgY+8pLXPD3t/Sm7VRzGixC85C8YX2gluUAOqM68G4
 YgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSetTNDcrpopsgPqP6eitB3o26WOer/xC5F/oWH6eUA=;
 b=BG+ukBjdjgm/n1ax4Rh3rOMm+vp1Sn8iaKMA21ahjXVIvk+l+yv/f0rWtMyIs9Xndt
 bHxQkzq9TIYrCuOivSvXR86g5aNopc4Yw8WjjceW2VZZJc/jtiZVK2SDPBCK8U9ECun9
 wskOuk81sq3/TpoGMnnQ//uZA57riixVedmTJ0PEzL/BrJtCRxX5dKZjuR8GqXtJtvqz
 bwV4/VYultPPhEquw3x96Gh9JjwAoTM3bsUf+pq7wbKSQRWoXd/w+Kudi8yvV8KhN0Rf
 nja6VaW9f+53jYO4+kMp9UGhrNwOiyejgPV8pOwptKadD5lRkymO/hpmpXFcYcwF3wN7
 MgYg==
X-Gm-Message-State: AGi0PuZgslt4CcEUmUhVcPdHN5VVz0OT7axs3Co1l0q0oJ0BxQo6y+Zl
 FQf9TNIX95MkA6J2sRn/mSsRlVc1dBoimts6GqY5Ow==
X-Received: by 2002:aca:c751:: with SMTP id x78mr2622737oif.163.1587642427692; 
 Thu, 23 Apr 2020 04:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200419162727.19148-1-edgar.iglesias@gmail.com>
 <20200419162727.19148-4-edgar.iglesias@gmail.com>
 <CAFEAcA8D2HSPg8-ZvFBocmz+QRXTzhJcjDG21PCk7+_N7+2o1g@mail.gmail.com>
 <20200423114407.GE4289@toto>
In-Reply-To: <20200423114407.GE4289@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2020 12:46:56 +0100
Message-ID: <CAFEAcA9DBWSGVtUXXE3dCt=hQghaLw+5b9Zj-sCRHa5DXQ+O=A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/arm: xlnx-zcu102: Disable unsupported FDT
 firmware nodes
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JqwTU17QIyPK

On Thu, 23 Apr 2020 at 12:43, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> Without it, I see the following warning but compat in
> qemu_fdt_node_path should probably be changed to const char *.
> I can make that change in a v2 if you prefer.

Yes, I think that would be better. I can't see any reason
why the compat argument needs to be non-const.

thanks
-- PMM
