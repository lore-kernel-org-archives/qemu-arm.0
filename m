Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6524425lfp;
        Wed, 5 Feb 2020 02:57:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqynh/mkFedztcer68uWuZP098GKVN5FQ7ya4ZC41/GE6JNgeOaaAeqhdBzzVL86ulrd1aS6
X-Received: by 2002:a05:620a:2093:: with SMTP id e19mr6003182qka.355.1580900278397;
        Wed, 05 Feb 2020 02:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580900278; cv=none;
        d=google.com; s=arc-20160816;
        b=UuxtnFHPQ90MwJh37VtAeIDrphth4ZuQ0DYgLlSc5l4N2niuileuZ3qhua7+HXl39A
         NM6X2QALYYCOAi+R7rYKZ+TWLBND4jI2H2wGFLDTnXyFva1dI/qhCLNHcxeg82FqmkTX
         I+hhXrFezRDiy4sYg1ZoSmI0VH6E1iSW3AtZhjAEIWSf+ysD6kqBVYDGJL4uaDD++smI
         2e/DEHROx5eziqVzSzL7OUy4NeOx4ore6ZVXkt9t42aXT6r9IVwFEJW3DMCEGmsk/rve
         aWH/53PM+n8PtOMBwAGMlQGk1hUofB2+zQKtG6X4wUEuCf8mZr1qM4mJAuSDLz3wVb/r
         lskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuqPWZKNjNm9f8fAps+bSajFLpp3MKgF5KAHrExt6eA=;
        b=bekVXK+zaKkODIxHjs11MsESgNGB8/4VxXTrMfNZQsIxdIssLNG3z5v83A12ka59A8
         W7L5XJYsz1bczhGWHw1tlQlw3loe0f8ipsFF9DepLqM8WSgpc3P2yz+J4kF1VO4hcSmY
         hWSn0N4XsiDyQOkO5LmLsk5fHW/uYLL9pKCzO7VPFJS3FoCCngs4c2MNwUKTjkRq+YCB
         6gFF1ZgEXimpxyYQM6EesiCRAL4UiKXyuKWZ+QOD/zFT1QixI7JvsS0He74JxVN/X87T
         7E44MkBY3T1zGg08q5nlFBSdYnn2JHIRy11mzQ2eoQm9xT1Oh7Rx4AwMmQXIqZKdpQo9
         X6Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvEHO0cF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si15282428qtd.257.2020.02.05.02.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 02:57:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BvEHO0cF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izINZ-0001qq-TY
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 05:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izINT-0001qS-5s
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 05:57:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izINS-0003gD-1H
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 05:57:50 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39917)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izINR-0003fY-SH
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 05:57:49 -0500
Received: by mail-ot1-x343.google.com with SMTP id 77so1506399oty.6
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2020 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FuqPWZKNjNm9f8fAps+bSajFLpp3MKgF5KAHrExt6eA=;
 b=BvEHO0cF3JmXEDak9ix/GclfaLkGcmedCaZY2jU6N3no4vTINeIk2F++ro2T01yngy
 Sr9wbR12zJT1pYG0BAXtx2cyfI7k/vEKqyeRCcjgra0Sffznrnc0o3n/jH6sE8+IVosn
 gVJqJ/ACKzX1kvP3JbFL0LGfAwrtMceQYPyZbDE/5iH5NQPLven/zaK8/9uh9St48xbm
 DeklY3e3IaijeF6RaADKHWssiozU2XU32FLhG67Q9hileV8sEzOX7m7NJoGqi9aFompK
 szGReml983cCDn8Sz2ztG1E2NOm8AHIcm38MVsVcVwhfesu0Y+y439ORRYol8MTdDOo3
 1thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FuqPWZKNjNm9f8fAps+bSajFLpp3MKgF5KAHrExt6eA=;
 b=mpoFarhS4TUFHU1fB0u40TipId70MXgRX6fY0oOPPTVYkwpZ4sZ27g1uXA6ADc7ekl
 Oy6b0SKvcE/joupI1gfmx7wLGTzOdQ1Tr08Q7ArQcZzrdBHfOlNQBISzvEYaOhkUp0kF
 msMOoDaQkR6zpvwlfWVyPHTsSKkvBucgOOF7acXmyp2YCMiCPW2/2gbdAnNoJyRXRufC
 WzphMzg7Mvx9P2nhjjBtRXywKgmPoMDQq4jfoSRoHk05Qu3U42pOv3AdqknDLqSP8L9n
 /b0lr3MmBUvC3VsL+xvayyPMUHxEO8onPxiLvIUn2awFk1jS46loiVHnApMoTE8jyzDj
 mXVA==
X-Gm-Message-State: APjAAAXE+yXz3UEM/yLAaXLfRfqyvAupToKM6ivtzapSi+fmuwv6fc7n
 QGGfEAgH9mmeDZoaDhnR0WvqSRlLUhPMOOsqEMp4Jg==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr25771413ota.232.1580900268906; 
 Wed, 05 Feb 2020 02:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20200205031227.24355-1-gshan@redhat.com>
In-Reply-To: <20200205031227.24355-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Feb 2020 10:57:37 +0000
Message-ID: <CAFEAcA_3A5fxo4gedJxsc64jus-rjzaLgzcipguOMwkSD4PNbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Support NMI Injection
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hMGTTaCgliTj

On Wed, 5 Feb 2020 at 03:12, Gavin Shan <gshan@redhat.com> wrote:
>
> This intends to support HMP/QMP "nmi" command. When it's issued, the
> SError interrupt is injected to the guest. The guest is expected to
> crash with it. The behavior is similar to x86: NMI is injected to
> guest as error indication. The guest possiblly crashes and reboots
> with the injected NMI. Note that the functionality is currently
> supported on "virt" machine and {"host", "max"} CPU models only.

Hi; you forgot to cc qemu-devel; can you repost, please, so that the
tools like patchew that monitor the mailing list pick it up?

thanks
-- PMM
