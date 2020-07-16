Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1521973lfm;
        Thu, 16 Jul 2020 07:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx72EAXNuJiEuK4zECfH3NZ6eRPhATXtsGbWnXTbmZ/wH0XObgfz86m5txAjGy6Q5CA//U3
X-Received: by 2002:a1f:5806:: with SMTP id m6mr3408538vkb.88.1594908470221;
        Thu, 16 Jul 2020 07:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594908470; cv=none;
        d=google.com; s=arc-20160816;
        b=NSUZuT6ceoA+i079x5AWra/bEu2jSGIkTYgOtQC0/cvL8g6DyrirNiwjfTjGwEp6LU
         awHjXrEiNwaJajaaOjqZR/UF2n/otYSdIOGmOB/eHTxY5P1GMaois5bKF/1H776LqijM
         9/qED6Ds3K7HXfxfqI/CvhsxjxWyz+QhENTTVr2vzZxv1UuI4fRPCAxFXG1tsKSBHNNH
         GeG/AnnZ4vB3QYuqfmqZvnlXgEWcYdphhjdlHxre0u1fOJhAJAcdsXDapJaYcBtbMlGh
         Eftwnmq0xLSdoOOkFSUh1YRZMcYnvCXeJ40DR5D6J40e1s8fsIiOdQiuhlJRN2VexImT
         7Vew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=meBHaDeM21zC9TdihiN42IiCDadZaFUBqZTAt7ipv2I=;
        b=Mn/qzz2iHKxRz8wE7JAklFGqzxBE/3j5LGppbI0FQzDaJPymUV5H63RUFfOYfCFVGD
         Z9h1+d8XzZV+PFUwWnseGWmBn5jR281DPm9QaJIJ1+z8vlEDRIJL1h1b2GPDYBjpjZgs
         E7EDfnyfhGoE70kTzaqagE7lRjQsHi05MrfKquANZFKT/207Oo4VLMmRQIkxm8mShSTW
         VXLmtokZtufTbVhAgPdf1Vhwd4gpPZr+Lo7VFc9gvbquoyVSF5DWYr1bsGt3gl6D7tq1
         WD/X/R3FYToZyGz0Iu0g02GubiMvzqKUSJ9ntSVAgQ8tKV878e8otc9q5XxjSqEQwaRc
         u+iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MdCwDsCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v143si696200vsv.26.2020.07.16.07.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 07:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MdCwDsCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jw4Y9-0007Vl-Gd
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw4Y1-0007UC-Ov
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 10:07:41 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw4Xz-0002Fh-3V
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 10:07:41 -0400
Received: by mail-ot1-x344.google.com with SMTP id 18so4274807otv.6
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2020 07:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=meBHaDeM21zC9TdihiN42IiCDadZaFUBqZTAt7ipv2I=;
 b=MdCwDsCJzTWfLpJbtLQlCbtKRQ9S586gBDBEuU1pSn2ujP/fXK1Ge8yMAlt3sZc3Ks
 G7hms1wRzaRbC8GlNGawrCOTmzEDDWiIwgSTQ3A+BkFMzQfWl6md5dKra/0NbGADMzTL
 eFUAVXZq/VsQ5fjXRXYqhUiP+pjbcUtUdJgudJ6MG/PwNQRByaZN3bcQxqJVTWfvzCoQ
 r80xBFdLwxFr9op9nJd/xeIbLfLcrCs9P9Npq88DmSQy+Yya+5/SHP5fl7LGJJQIYup8
 m4f8mkPkwLrNYNNN76EKpr5FwrSQQDn7xY2NKWTM7bsO0qrKZGOrQWx8iNA+ihjE0vvT
 hBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=meBHaDeM21zC9TdihiN42IiCDadZaFUBqZTAt7ipv2I=;
 b=Qw+hMuOUfDc83Kcxq0BpMxYoFcr/OjjKm7tgQLAjcF4mEuBMuoZate28dbMSvoAz1o
 gGSta6DMzs1ddD8btbzXoD6NcfwtyxSLCt2SDwdplVM1eT4SkbBTBzYrwtMZKl2gwfvP
 I3WxXJc/gU7FHEFDsoDVC0wD13N2nqV3l9BpW4SdCW7VRXuAMTlmh/u9PDCHjTvOBwMb
 C20krGaV6xyLMBuQRY8KvnaZ7J/v2mZsSKBqyvYmPFbDLp5jigbTPvGj0PuGvltcog1A
 p+udMYKYJL5Fegm1nHmE9hwqUa0BKxSr/XnNTWSlsVLdN76lyP/GC9cGPVLg6ryDy78z
 tgBg==
X-Gm-Message-State: AOAM532fnl1tnznWcxvqT+UnmFNeXy8+yuj8xTTZPWI4+tjIjmX/ES+q
 3lyFwuynxTMZFtwdowFfdZjHdXHC2VIZ9lIe8Gc95A==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr4727217oto.135.1594908457624; 
 Thu, 16 Jul 2020 07:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200715173418.186-1-erik.lucas.smit@gmail.com>
 <b3c8ef39-5a1e-c49d-6ab8-342f42be088c@kaod.org>
In-Reply-To: <b3c8ef39-5a1e-c49d-6ab8-342f42be088c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jul 2020 15:07:26 +0100
Message-ID: <CAFEAcA9H633W4eDsXJ40o0pAje6t103MaKjkaSqrW2BHLmaP7Q@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/aspeed: Add board model for Supermicro X11 BMC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, erik-smit <erik.lucas.smit@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nRL44SWVC685

On Thu, 16 Jul 2020 at 07:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/15/20 7:34 PM, erik-smit wrote:
> > Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks; I've put this in my list of patches to put in
via target-arm.next once 5.1 is released. If I seem to
have forgotten about it please ping me once 5.1 is out.

thanks
-- PMM
