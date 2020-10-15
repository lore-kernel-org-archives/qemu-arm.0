Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp690160lfa;
        Thu, 15 Oct 2020 08:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzF7UMOEE8zDXFGqWHYpAiyrS+2RmlJE3FR5eUYTm3JSTZg+eDfiV99ZphXB/FLD1dvzLl
X-Received: by 2002:a05:6214:122a:: with SMTP id p10mr5253132qvv.0.1602776546593;
        Thu, 15 Oct 2020 08:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602776546; cv=none;
        d=google.com; s=arc-20160816;
        b=GR5IgEXzMnYBeNWOeYTbWkXQRHLM0bsFnUSQ3J7z9of5KX/UhWuFs8qFR2AExxYPuh
         QJrJI/VNXhJXhbCb0wIXsNt7+bh8SEs+arXSbRUPtaXcsUMs19oARBedDX2ya2lpjMGZ
         VFirBcpxvGqGxkjLnp737U1+OVRMfDcTjiDmtuc27muFmDVS+jlu84N2oN1uruiNrrMf
         BLvfotwkQ5gH1RhMgFsB6Bu76HSHqFmhCsdMqEFhChDkVN33pxyomMzyKgTKW+BRXnO3
         mWJtDt8u5RlWhC3eCRi5UzsFSe4SlNA/dFkd70ikeZVCzgnsQH2BwImCp2kMn6VQe5/v
         UPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBuKOmZ+1wb0rXNSIrM3zJXE++U/4YyR49GY80nl+44=;
        b=e4i5LjGuiHL403whAWzygKyd7wybExXyMQfECQhq0+mkIDrd2MztyLHtbbxOiQqT73
         iYmLiQeLLVJaO+8CS9f7/3RwpGT3aDbvaY6P+MGGpvUwZnHGmt6spFhuEqRtIuFDXb6v
         MReyU8sDb5/Sci79ela4pHZ+8eLTJbQYgVCxXGoygpw6fV0xeEQDcqWoMeivv3K1BC+A
         O9swMYBNz3ggFzAPCr7eyfIv1m/U66fokk9deXycINnqXCggHqOazsyfK87mgSRVvrC2
         cGI5+Dl1CxL4LazGv20v+13ceCmqSchTKvNjZAQEF2TfBHa0ILeF0mctRe7cJ5ZcHW7w
         nUTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M95eddoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si1760699qtq.287.2020.10.15.08.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 08:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M95eddoZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT5Oc-0001kP-1H
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 11:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kT5EF-0001TK-IJ
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 11:31:44 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kT5ED-0007Nr-2j
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 11:31:43 -0400
Received: by mail-ed1-x543.google.com with SMTP id p13so3518341edi.7
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bBuKOmZ+1wb0rXNSIrM3zJXE++U/4YyR49GY80nl+44=;
 b=M95eddoZJGH3LfLQ0bMzwIbjJ1Unudg9PVhR71I4PQPTy+E2K0/4ujW5CTV+pLVX9n
 tNaSanX8zjEmq5tcXMMty7CDEIShhU4cqIge4ZCHTDHAfgHiWc8rYP8T2xbgO1oxa+gQ
 1igIuPbf+nVc4TyCgbzHRMpTfrLa1XXpgdIwZpgeFGhOUGshPWl9pFg20tJV5F64TScu
 kDhCm4TsQspyAp9bxnCdc5l3+9F9hf/B7cg1O4HirS0K5oR1FOeQ7UZPlaZFUeTQOwN/
 eKG3Uy8JaKjmdF8a2LkuJmzwrfs/j7SSJA6GqEcze+llrINhLcDsUwF0ummkQgVoSGlD
 ZYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bBuKOmZ+1wb0rXNSIrM3zJXE++U/4YyR49GY80nl+44=;
 b=oFPhTRbRDLqCi3+xLe6P6nzscAR+NGbVO82K4yxlva5ARDb3k/lD9XKNQO4VxUMfsr
 5IQKkGEyyJ+Xo/SpxD2GudyfwD7l82Duoci6bOsd13iOoVmE3vmCdGGTQQqHi9yyA9tM
 fsVVhIDTSkuQH5XHJr++wUNRUp2lqnTxghkwutyT6T5UucONscqBfIuok67DM6NDfrbg
 1QKbC9RkuZanzpk5b8aN8/kjJBI9toOjQNKbJEEbppqkzsYB0C65w++qr7lxqEaGLdnP
 3eOTwUXgyb0rI4c18+CInyWO/CWqhTxzT8SBHhTWhvhEj36jHUIewPaOnJVehPAciSjT
 IY1g==
X-Gm-Message-State: AOAM531PaBgh7gANPqVHXX/1OdTYu73jdyhdZahG6wxDFnSswAZQmpDg
 9N2mtl6HTdWZhwzlQeU6Xd1FOUy08ge+fIxrAHpKneDFM5Pz1Y1P
X-Received: by 2002:aa7:d79a:: with SMTP id s26mr4851319edq.251.1602775896953; 
 Thu, 15 Oct 2020 08:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201015151829.14656-1-peter.maydell@linaro.org>
 <20201015151829.14656-3-peter.maydell@linaro.org>
In-Reply-To: <20201015151829.14656-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2020 16:31:25 +0100
Message-ID: <CAFEAcA-4qq=kknVKck_tGdFaj6F8QP9MCOiqvydLcs4F+tmffA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/timer/armv7m_systick: Rewrite to use ptimers
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73aMG0FRm80D

On Thu, 15 Oct 2020 at 16:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The armv7m systick timer is a 24-bit decrementing, wrap-on-zero,
> clear-on-write counter. Our current implementation has various
> bugs and dubious workarounds in it (for instance see
> https://bugs.launchpad.net/qemu/+bug/1872237).

...and 10 minutes after sending this I realized I'd forgotten
to finish removing the no-longer-needed state struct fields.
This should be squashed in:

diff --git a/include/hw/timer/armv7m_systick.h
b/include/hw/timer/armv7m_systick.h
index 84496faaf96..d57e299fd89 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -26,8 +26,6 @@ struct SysTickState {
     /*< public >*/

     uint32_t control;
-    uint32_t reload;
-    int64_t tick;
     ptimer_state *ptimer;
     MemoryRegion iomem;
     qemu_irq irq;
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 2f192011eb0..5ac3a8a7e81 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -219,7 +219,6 @@ static const VMStateDescription vmstate_systick = {
     .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(control, SysTickState),
-        VMSTATE_INT64(tick, SysTickState),
         VMSTATE_PTIMER(ptimer, SysTickState),
         VMSTATE_END_OF_LIST()
     }

thanks
-- PMM
