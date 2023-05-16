Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp425555ejq;
        Tue, 16 May 2023 06:48:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4OHDRshn8hFjgVL8CLe2cmjX3FGIqU55VGqkXUC/6I35X/iwLgZxnKOl8GtDp5lc20A0gv
X-Received: by 2002:a05:6a00:c83:b0:64a:5cde:3a8c with SMTP id a3-20020a056a000c8300b0064a5cde3a8cmr21896142pfv.28.1684244913949;
        Tue, 16 May 2023 06:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684244913; cv=none;
        d=google.com; s=arc-20160816;
        b=xfoQIiRlHGiLRSEugjf6EI4lsSIrYMxKAt3ngMp/cT2NM2oSh9cEBUUEZYEdXPKIU5
         nRsTACyDOi3CteVobl0h3oU3EmCVsGE9aVXw+qpgfTxNDM77FEyv0lgzhyRfAeSoS3LT
         kqwjVjxNyuX4d400GA30wcIwkOh3JDzdG1XufnpG82lCFEyu4HlME043SeZMP5VTdeeN
         PuCvGei3EkmYjbUmwUzTyrnL7mum5MruoXDvxoLoKwgRVtIKSVe9hr4fDxeGSCqaDzI+
         K3a77d1MRJhWKfGAUMVIRG5EKUKaTV9LNZ0sNxaBPyl9eusXwkrGUtPbn8t6ep/oUjVC
         t3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=1ot4Bi4Ki/s0cbAT7HgNgUbS632ji4vRzkzC03cAbUU=;
        b=lppaGlaWAGi0nX3Sr0I6qgdr1TIRW4LVh4KDaNDcOQ6Ht7dcTqjx7/Wmfaj0JTUTUi
         QlyiNAGY3kzYs64DaL8cgt4DrrGliqBZbcdoz6muH+lM6JwasVyo08UD1gkduXPp26fS
         AjQRYORmg5+Ud2Qrp4ossp7QRRlVx9X8PhXatxfaqLIR9he23fVQeDX8+/XaB/BkRCKm
         mmxL9nU0EZ9TnjtjnbiiM/6GtFDtS2dze+kIhAhlrRjzF/YcdQlhr4RbDJGRWU81m7zi
         vfdeu0QN2YgINH+EId7O/aQi3UA57iomdgmuG1t6KFxY5VOldNyjLgCYCHpQgEJFKHiQ
         fN9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8KNT7hX;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id i8-20020a633c48000000b005344b60f7ddsi61830pgn.117.2023.05.16.06.48.33;
        Tue, 16 May 2023 06:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8KNT7hX;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbjEPNsd (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Tue, 16 May 2023 09:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232459AbjEPNsb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 16 May 2023 09:48:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7722A193
        for <kvm@vger.kernel.org>; Tue, 16 May 2023 06:48:30 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so13532854a12.0
        for <kvm@vger.kernel.org>; Tue, 16 May 2023 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684244909; x=1686836909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ot4Bi4Ki/s0cbAT7HgNgUbS632ji4vRzkzC03cAbUU=;
        b=y8KNT7hXGpuWgf3i0yd3JV5pD47081FXs43Ao/Qb6KYGQO8165Pk0CfdoLieJYWIQ4
         MTVYHUlr3FMNq3SKZinvFXZFs2TR5r4ilBLn/2fDdwT4/HsI3yzh1xeumkuwXdRzCIq4
         N2+CzJU/4BnQiyEeDyrmmqnsH62MIxj3ErNIWctzorXieVXUHSMgMV77qVOg7FVouTxW
         ivTE3Frd/3BkdPF4QkIn8XiK3lEbYoG+k+Jvkm03qXNHElB7I4pNkgeyZQfvQ2Vef+5V
         bcGIALEc0KOOD/IOWOjd4s3sd6PBStkPpTYGS8wMQKjU3plW1TmXTtFm+va0jfpO0+ys
         sl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244909; x=1686836909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ot4Bi4Ki/s0cbAT7HgNgUbS632ji4vRzkzC03cAbUU=;
        b=UdeJzzwfkGUjFAx0XK29A8CUOx+XOyekiMnD39TwJgiCPSABx5oI469tSu33VbMa5x
         6nRuWMps0hqup7RYP782NQ642WlMG7JkToNfK8XZv0IqiCMhxU7BTGoYRTSMHGo8dy4y
         HshoPh9SyKLER4pNNo79APE8uu5xIaMkYjRKDTPjwbI5L0kbhvZqTCh87Ro+HmRhc3qH
         tZJT7EM7Iu4MHABUuSqBs5rbRbQwZkW2JGDrpQS3F8SZdqQYYvUCx2fgES3r22n2wE/h
         +5PizbtEnWvOTVAtaboTxyUuUTgMBCFikx4ZJF2jyUvI7Q68ew+KLKA6jzRmK0BZmAiH
         D1xQ==
X-Gm-Message-State: AC+VfDxPgCf41JMrESJ0Njv2iLRk4OUlu4XJAfkM8ERo/NfEnq7Wn1iF
        ODYterSCnIzebboTp+atimErmr9xiKguTxyrHGHO2w==
X-Received: by 2002:a05:6402:202a:b0:50b:c804:46b8 with SMTP id
 ay10-20020a056402202a00b0050bc80446b8mr29254392edb.31.1684244908932; Tue, 16
 May 2023 06:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230428095533.21747-1-cohuck@redhat.com> <20230428095533.21747-2-cohuck@redhat.com>
In-Reply-To: <20230428095533.21747-2-cohuck@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 16 May 2023 14:48:17 +0100
Message-ID: <CAFEAcA_dEmq7s2SyKV1VCg4XF6o-40tbY-tNoiU71eFtbJH18A@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xEcz9i4nHVhm

On Fri, 28 Apr 2023 at 10:55, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable the
> capability.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

So this looks OK to me -- we don't handle migration but we do
install a blocker so we can deal with that later. Richard,
is there anything else here that means it needs more work?

I think I'm OK giving it
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
and will pick it up for target-arm.next later this week unless
anybody raises any issues.

thanks
-- PMM
