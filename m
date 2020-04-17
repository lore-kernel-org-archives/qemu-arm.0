Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp328073lfm;
        Fri, 17 Apr 2020 04:11:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJuJ5eyhkkazDmpw95AA9LMPDp+wHJAYq7Oa22AHhCy7V6UyYK0m1YUjF3h3MMf3dhtSGc1
X-Received: by 2002:a0c:ac41:: with SMTP id m1mr1936940qvb.71.1587121892610;
        Fri, 17 Apr 2020 04:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587121892; cv=none;
        d=google.com; s=arc-20160816;
        b=Gbix2lmQDdEjvQH7wTXJn3g6JJXCSVFBnPBmIGrSoWegGNH2GvAt4nwaw/zKPgbgHk
         FXFI/gpLzncKrFgrJdDCVp1jpnftUG2EiN9OLIQMP6D2LSGZrJR7k5gGUN7AzQYE5GzE
         RThHgNXeMbBME0pXUGsWSGo2ECQmg0MtTT70frpitqBFUG60qJcIwuHzrYhTEjIBDGKq
         WNXPcy3B4DtNfp2lpKKK9bgfyqgdT0rMyFkh/OYXgo+uOc/gdlS/b/Ttblzuh9v1fGbh
         iCn7Cp4pT9ZSkaoO0guuLgRzO7uDevUISHyflX1BnNEDKt2/b7DQZz3r5prCXEBQNi5y
         jZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=86vZQve9ArhUT+FdYs/F/8RHbYqg4H9Jt1CkszzGv+o=;
        b=c1Zjy8gAtbYsEU7SuRCRy2/C8nXjoj4egMacuP9c9nSBDJihT4rZ5hg3DaOUDIJrYq
         nWvVtVDQDugdxM+xz/yjW+j4SzP4ooMDwPeb8hwZ/cdpOE1sYcmog1+7DzqxWjg3O3dV
         eSByJtpl1HCZmXKGu9CIXXOaUi4MyFJ5WZiaPrSiyScmRgZy1Jn706DlINKc3xq3pVS+
         PR24QHF76dJjCDk11ILVPcYEJMTuIP1i6FH8e2FaTvxhB4U0spipiBkehAD/Y97ftmDY
         VOnXtP0UhKoZuJ52ugAhjiERZ/oKYacj/zrwxVeDsiL+h9qW9sAM0Q9YBAZzGfjyC945
         g4sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O663D6DQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si11047926qte.336.2020.04.17.04.11.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 04:11:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O663D6DQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPOuB-0000aJ-LM
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 07:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPOtI-0007tg-Fy
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 07:10:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPOtH-0003Ta-EV
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 07:10:36 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPOtH-0003TE-A9
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 07:10:35 -0400
Received: by mail-ot1-x342.google.com with SMTP id i22so1076732otp.12
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86vZQve9ArhUT+FdYs/F/8RHbYqg4H9Jt1CkszzGv+o=;
 b=O663D6DQRTAE+VSKeN4pn5cLcLkbeFLu94HvHP8/m4RoXw9Afv3Pkg6TQjeTQ+aNiv
 XrEHAcQ1VCB36jMUZR61WaNMfN/WqJ8KKks8anJIkHqX1b17mTogUuOvb7XBG/tslpyP
 4xGpWcFe2o3tuAt4cMCyiOYk1R1fkg8OajEchcOGkbKZpZpqHe0O1h53Z3hDLcpiMuYU
 ruXhdkU373gcxBAhPhfJS8QPRNnOzRbCQlZ6CBkY4jUK7i0oKFlPbhQej6oAjNoKklrn
 ubjxc7rOYnbWdQnYUrf9JHNDrYS4YjHns0NweUFSqfk3Da2ANvWkO1FbfaB286oQ6/f7
 BQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86vZQve9ArhUT+FdYs/F/8RHbYqg4H9Jt1CkszzGv+o=;
 b=GxNZ6B/gmlNQocVIc2Qtxb6L5ktl+O5GHVXZMSx2y3Z0dWXnelyger79Vt81xKmfQr
 Qttyq6ym5Q6YLxZR2Nm4sihU/TJywPbVKoD02DJXhm+I6TmgRkdDtUTHZiZarqr0jNCg
 p5U/08XV0JfNH3EIQuRVxXoJUzyzJsS8h0jKpO1CJZcQseEYrGqt/gjPfM1tUfcnVHsn
 ubJBuq9AnVboYUN5xo2SxOJ12stPYItaSc8oiMnU3ccqRKc+TUzCgpPgla6f6abSLImx
 pOAipiyX+dxo39+LYeDjeOhWs3Gzu5NC2uxxp7G+NRu1TJghjV70PWskAMKwqteGn9m5
 BpVg==
X-Gm-Message-State: AGi0PuZiCS0MJafSrzM+ZTI7rY675JnZRue1aLafGDrU8Mj3lMY/w8sB
 ExZNYs1JySyMBS6kNEaBIQW3/pXrMkYo3XAHW7qx2A==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr2048286otj.91.1587121834569; 
 Fri, 17 Apr 2020 04:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200413091552.62748-1-zhukeqian1@huawei.com>
In-Reply-To: <20200413091552.62748-1-zhukeqian1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 12:10:23 +0100
Message-ID: <CAFEAcA_qTykOyC3ZOJkcRMiOm7tjc0iH_pA33zyLE7ZH8Kn14w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Some trivial fixes
To: Keqian Zhu <zhukeqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qd5kVj+WgGVv

On Mon, 13 Apr 2020 at 10:18, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>
> Hi all,
>
> This patch-set contains trivial bugfix and typo fix.
>
> Thanks,
> Keqian
>
> Keqian Zhu (3):
>   bugfix: Use gicr_typer in arm_gicv3_icc_reset
>   intc/gicv3_kvm: use kvm_gicc_access to get ICC_CTLR_EL1
>   Typo: Correct the name of CPU hotplug memory region

Thanks for these fixes; I've applied 1 and 3 to target-arm.next
for 5.1. I don't think we should apply patch 2 (I've followed
up to that explaining my thinking.)

-- PMM
