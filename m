Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp371254ejq;
        Thu, 18 May 2023 03:09:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yLUACWrVb1jtpeWEfnvCI7xVxEMr3IRUyzwcDZ9GJoVjzdIOBm4pGOfJ9A1eXagmbNSBe
X-Received: by 2002:a17:90a:dd43:b0:24d:e123:1eb2 with SMTP id u3-20020a17090add4300b0024de1231eb2mr2069425pjv.37.1684404557163;
        Thu, 18 May 2023 03:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684404557; cv=none;
        d=google.com; s=arc-20160816;
        b=vijzgAwspNQX8DTsSsDQi/zE5T2ta6slWOTSBMy46FzLt8J+TQ0RGbwAEWftY369LJ
         FqaZ7pjBFvKVG36RZ20GthqLPRsIXM9BQjh4Oj+Y6i4r3dESEpTr6nk6spv0sw6QzVZ3
         YkConLBqJ3/CP2PEN58ugnEdZmb5DpeUKbyqJXL+o+v4H11AKy/9Lgt28RsL+vPtXRVj
         EAXkmCibHojY5F3A/Uyt5co9o1joW4PECaUqW72bQAj0K3HXywPGbEAL9DaXI1Yk0IW0
         soBqg3Dsnbjwcx7+LLw+qmI5zAokv2yGMDmElGn/wnjs4Bb50ESyNuYWxNeT3XLOINvx
         /p1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=IokzdUXiS0nUEEaa7/jQsGpUvXWQd2mOT/RBRCxrmjc=;
        b=pK2hD9Wr9x6c3wu9WZL3xQzlGW4bF8BzkREYliOgYAkwdxjMbD4qhj/z3mmJpODhM4
         hi0gfc2T5EHbUf5ngUM7gnLl6alpxGZ3/Feuebg7/k712H8kJ9iAFsdrcqtDhmcVSOC9
         gBy+bIp5hPQCYsbQYZyYmrs7acswLeJ4cXaUHRf8Pg1c+T6Wz+IvsXCyK8fMB+zFE3ud
         ZAv3Nhk8+jkCkBqg9CB6c2y2lsEWLqxw5UfwmPUEQrFFjDiLECgzrvSwB0HO42FkQyIS
         1/iQ3j3hdFTJNT6UZrMK1sIb/up1QRE3H/GqTqtSSIz2vt0UIcJt5+9Mc4kKts/ow/Pb
         39qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k5V1IAZB;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id w5-20020a17090a380500b0024de4be9639si1375830pjb.34.2023.05.18.03.09.16;
        Thu, 18 May 2023 03:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k5V1IAZB;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjERKJP (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 18 May 2023 06:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbjERKJO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 18 May 2023 06:09:14 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BF11716
        for <kvm@vger.kernel.org>; Thu, 18 May 2023 03:09:13 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510e682795fso867510a12.3
        for <kvm@vger.kernel.org>; Thu, 18 May 2023 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684404551; x=1686996551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IokzdUXiS0nUEEaa7/jQsGpUvXWQd2mOT/RBRCxrmjc=;
        b=k5V1IAZBU7AbAzZ8ix2k4JfdHJalOV3SMqCOq0AZOhEwN4X38pXv3AIATsLBSrRAPN
         astiW/p/oBbOBNnTCH9pBoSe0PaWRSD8ufpHR+0oDN4wjDUGdIBD8wC0eCyiFzneOM9Y
         sIFlr7vhrHKcDK+QzLSUiCedrD3CFT34+z9QDG+BwnAOkpy7rEMefQAlGNIAAnaXXEXL
         QwTD+AzjKPIvekNXrGLDC2q7lSWP6V1UK3YN4WwEkLpKF6pK6lbJLjDveu7zEQL/VxI2
         Po0aZRBQMYB5wMxYv7PQpj16KIJ1nQ9K/heYwnvWBbHVusJs8W5cFdNMvx5Qnz212+hD
         nE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684404551; x=1686996551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IokzdUXiS0nUEEaa7/jQsGpUvXWQd2mOT/RBRCxrmjc=;
        b=helBlkq+/RkyHLJ1GacnAFssw5/fMgfx9LNmseHBt1vJV346j6LJ5pngnfQ69WcslP
         m3te31X2mX+dTV5JujbX+IM8+23pOpuLzVezzHDzCwk9OhjTyh7JzU6noXYp/kn1Bt6Z
         KSSYVplUyx+quZA9N9iLCDDC8CMvoABCSP9w4LQO9YPKPZ2YLpBKxArm1q/uLBel0BzR
         ZHE4fgZicuYVNFO7q5cRvI+Xi/gTh/ue6FCB8u+a/EzYExih+kBOE10hZmkZJ1UJNV9W
         WznGiaYUg3DJm+OXB8AMSEDFIEZlZ0/9zGGZOE9Sc7VEKbM9Sp1bdDm/d5peCMEIQdWH
         u3Gg==
X-Gm-Message-State: AC+VfDzebBw0GUeoHuPmuUwB8/FkQIPMeFxSQ9kVpSMRurExU+tcnhbm
        SUX2xjLFiaharjkDwHcySJZNsCGsGy2wEJf/jLfZIg==
X-Received: by 2002:aa7:df84:0:b0:506:7385:9653 with SMTP id
 b4-20020aa7df84000000b0050673859653mr4224895edy.39.1684404551263; Thu, 18 May
 2023 03:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230428095533.21747-1-cohuck@redhat.com>
In-Reply-To: <20230428095533.21747-1-cohuck@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 18 May 2023 11:09:00 +0100
Message-ID: <CAFEAcA9W3SZe0r34N-17KmqS-Fi9bAtaSo2Hh0zwDnAVvTjU2g@mail.gmail.com>
Subject: Re: [PATCH v7 0/1] arm: enable MTE for QEMU + kvm
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gjihuEjhX1L5

On Fri, 28 Apr 2023 at 10:55, Cornelia Huck <cohuck@redhat.com> wrote:
>
> v7 takes a different approach to wiring up MTE, so I still include a cover
> letter where I can explain things better, even though it is now only a
> single patch :)

Applied to target-arm.next, thanks.

-- PMM
