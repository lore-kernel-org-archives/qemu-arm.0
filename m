Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1404313ejx;
        Tue, 27 Jun 2023 05:35:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48WP6m4P3eqSMZIMGzUt/YNQDAKrm3HJnv59nbVnskUEog20AayMZeWEovDd3vcHH8DRbZ
X-Received: by 2002:ac8:5a4f:0:b0:400:a37e:8980 with SMTP id o15-20020ac85a4f000000b00400a37e8980mr8153506qta.29.1687869354834;
        Tue, 27 Jun 2023 05:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687869354; cv=none;
        d=google.com; s=arc-20160816;
        b=hYa/s1O+2BS8SDqTskb6Zd53jDWlijo4D31rykEuYzc076Gd7Rg3ozpep4K7lZTeVm
         6ObGB2tx3Csx9E9HvBV3SNKDMW2il7MDOzetQr/PpQBlY+hD958EgfOq/3vvQGeopdK0
         /ZcwVND7zPudogp4eJCk1EWLfDA9yTwgCztYo1T0VgwiQygcvYKpxedoVtEs37Ztwd5O
         v2kmUsChIYrfsABY7FTUv6LvASFAu9frSsykDCMbu32Tj0MxjSkPp4kvSeLikrkZ61Es
         KZ7QUbK3XztAAjnilLaqQhyedVQcA1SlLt9Tqju1yB7OroKz8rh0QvnJh6B6kbJ68VcD
         oofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LDusC5fYPzsABGWCU1hmNmySIBrIbdI+94aWrncPMh8=;
        fh=0pkHRVOlfN/2EGp8l7waalZvEMBx5lPANhE8EaDXxVw=;
        b=s0rK8Glakrf65v1PjyuU2oSin5IfBVkfkU+vICGGZteOdqOt5I+KGmbLEIcqb3TM0w
         8oC0lc5cWwSUmk3CIongrCsDiaPSMhEGEvX2IC4bMVGUpcaMXnej71GvP1fpQK6byKZu
         hyw3jjTc0k+BWSW4zvTg/+AGK6/RZpJDL3Pam3hFA2u88/SRC60DBPmJlW6msJjIHDcN
         BhKgsQ4+/JxwzAx0QcvuszVGu8LTw3UbHTdwFBtOnklu4vCpiPoPezdxbmZS3jPOMGfK
         QWXPjCGEfU/Yl5KSEL4QwRqOBKRvdDWvlOxAVwVME4jDzWYwfB7xzjAcer1QAmOgAoWm
         +0aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUX6EX3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05622a038a00b003fddf406815si3127157qtx.202.2023.06.27.05.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 05:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUX6EX3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE7v7-00018G-Tk; Tue, 27 Jun 2023 08:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE7v5-000178-Jj
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 08:35:43 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE7v3-0007IZ-PR
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 08:35:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so12946566b.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 05:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687869340; x=1690461340;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LDusC5fYPzsABGWCU1hmNmySIBrIbdI+94aWrncPMh8=;
 b=gUX6EX3VBZHwlotgbnWvm5aTAQJdTLcphhNpnDGSJX7ECVxcTbibEEc8icLr1M1dZE
 Ll8UznRQ/u4vyaR/Yhqs8Y3FwHgcUd+p/HaKt/bYwZUwl/N5XX4A7Q+TGO78Mrvk+K/i
 BSxe6k9pzDXFJXMFcGl/oQWVdTEnbcTX2VvgbBoplC+TW60UgKjDc3HIUqqN9RSPYu+M
 IxUeivmVPucGEPGNkK6wjywgeiFxOShely+nZ8FW7+DFF0Ui9IKSFEvTHUgP9Bwvw9Rb
 X0gZjjuk5qcUMyMYo+xxCAquGSitOlT+GOwOlBRgkMUzc/whDQ9DzE2ITylWWBQ07pzo
 1TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687869340; x=1690461340;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LDusC5fYPzsABGWCU1hmNmySIBrIbdI+94aWrncPMh8=;
 b=kYOqO+blryyTwQFfNdJJo2siqMtP9WcIIN1PQXNDyD6Rus9B8bQmrBK8xGUcL2aCBM
 Bx2MNqrnYGSgJyr8qZZmaYPWswUF+lj58db67Z2OU4XILw6UpZomBi4vORoWyPvTedGR
 mFOxfturz0TwzXqepgwjM3h9PbyePVS4G8eJTRtL1VIPH30MCwSuRy2xwlvjEzJrYAtE
 HZMnxX58HX80iAszh1kZi8ivbSiRaB2zmfvd0zOB879tNiRh2ye7sJzlSYqwqg+GueiL
 W94iNeYZotTlDR+ewRjhzTb6NMJ4EUAvUPTUzBpCbZfcc8uZV5doTLI/UOMSYYW4C+7N
 nRQQ==
X-Gm-Message-State: AC+VfDxmroioBi7KRXd3iguna5CaDs4A5TUOZLxzWD30egFe5G86N/ca
 XDdX6G03dUPcGGsh4+0eoCaGbFC0I7h1OZC8SDFyFw==
X-Received: by 2002:a05:6402:5157:b0:51d:a724:48d6 with SMTP id
 n23-20020a056402515700b0051da72448d6mr1628664edd.37.1687869340270; Tue, 27
 Jun 2023 05:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230621103847.447508-1-wangyuquan1236@phytium.com.cn>
In-Reply-To: <20230621103847.447508-1-wangyuquan1236@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jun 2023 13:35:29 +0100
Message-ID: <CAFEAcA86sw7aCehmYHogpn=D_kXd0cAohj2_jP3dwwLyNrh_HA@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: rad@semihalf.com, pbonzini@redhat.com, marcin.juszkiewicz@linaro.org, 
 quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ycQuODimSAe0

On Wed, 21 Jun 2023 at 11:39, Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:
>
> Please review the change.
>  - sbsa-ref: Replace EHCI with XHCI on sysbus.
>
> This work bumps the platform version directly to 0.3 because
> the addition of ITS will take sbsa-ref to 0.2 version.
>
> Yuquan Wang (1):
>   hw/arm/sbsa-ref: use XHCI to replace EHCI

I'm going to treat the testing/review that happened on previous
versions as sufficiently applicable to this one (since the
patch didn't really change in that aspect) and not wait around
for fresh Tested-by/Reviewed-by tags here.

Since we now have a place in sbsa.rst for noting what
changes between platform versions I added an entry for 0.3:

+0.3
+  The USB controller is an XHCI device, not EHCI

and I tweaked the commit message to explicitly note that
old versions of firmware/kernel continue to work even with
this change.

Applied to target-arm.next, thanks.

-- PMM
