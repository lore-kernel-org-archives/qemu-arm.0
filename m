Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5030268lfc;
        Mon, 8 Jun 2020 05:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+8XuE+M+UrVQnVprg2GuqRdeNhuiaMb0H/rGMO23cxVtPL9i410xB4bfaikbknZXd7p9F
X-Received: by 2002:a25:ad5a:: with SMTP id l26mr35132594ybe.188.1591619203758;
        Mon, 08 Jun 2020 05:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591619203; cv=none;
        d=google.com; s=arc-20160816;
        b=R7TO+PUtwi8DVnbrhd7+3W1helaI0kplelXs6bhlVTt1FGwcRZMrIf/123HKBfXXqY
         56xjdBZIQM6PW5wTPIxNR10yCtjr+M/22lwyQjTZp7ltz29XI6mAwQsPhKR+qLcTsaji
         qg1EmidIJoJ8SwNCm/owMBNqvfARnmICSVmvgofuXWtErV5XbntGpMsm6Y82Joq5LgoS
         oAcpW2jIpsWRYYqxuZJAYYJaqMIAkg7pF62qA7JxtIrGlddUg29gCLirls4SwTKwA7wV
         1NKYmuqwKW0XK1EregvKFpP9pnMffTrQxB9LBW2AeV9xMKTvdlQK3mbn6SUCPhoz1HX3
         K0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h5roUSMtNRKPasYu9gHcSMFWr8D6wdYeu2hUrSBiw9E=;
        b=HUsbuUipr9zw6/+wkIrJiZut9IjqhhYNNwV08wnmyITc0v/opnflNWuLaZnVVvYfyB
         qaD3nQ7oi6H7ErM8CCs2Y2efVfpS3538oh3kLKYKin32BXtZMGsPsqgN8ZLQZArTMup8
         agQNFwmyqXR1xqe+9QVGLidy174UFQKcwuAUNUioS0KaxytupANGezsB1BFY3Jorf3Ge
         VNAx8OqtpI99Zp7Xpvk3U3CeeHYikBXip/mtO701H4y/hZp80eSItE1BW/ta+Piv9/nT
         Jhh4LfUcZGm/J8il/HiosoXAsCDljlH6advZPAqr2UjLuvPfNkG2St2LfGcP+55YvfxB
         u8Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DzUpul/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si15308413ybh.132.2020.06.08.05.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 05:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DzUpul/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiGrT-0001pJ-52
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 08:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiGrK-0001n8-Md
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:26:34 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiGrJ-000327-Tt
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 08:26:34 -0400
Received: by mail-ot1-x343.google.com with SMTP id g7so12356485oti.13
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5roUSMtNRKPasYu9gHcSMFWr8D6wdYeu2hUrSBiw9E=;
 b=DzUpul/fzhinjZSjllkFwAGtaHoXPzwyWdQyVH8CzQl5SdW/B4A+2rB0vzy7R58Z1F
 p2fQeC3B9eBjVYjIT/3zwK7+sNIFGwUvl/g8KqVX0oBJiRw32ux36Dv28DZceVkcxwr5
 rUmEgNoRLDgk6krx7oE2o7daxe8GT64Uz0NRm9kDxVdzYVADU7xBitkqb2mrcsWV2qCe
 vl0LPLEe6gbUZ+yOYEbnOEPtFmWyooJk+iKfcLOeWy8HTAWU88oyIftMt1SUqHxzLbnF
 rZIZ7l3BgBNdOxM1wcpp3QSd1GiAlBjQ5NcUDiaX4S9a9Fk9Do9hg3or6TJfUBS+ypWc
 J2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5roUSMtNRKPasYu9gHcSMFWr8D6wdYeu2hUrSBiw9E=;
 b=AiDnEGqbzcUQHQt4BpyFYmN2SqDtkKalZ8hEds1A5NO3A842dzQiCPiMOO54e5ltqU
 HJiKKGt417JHwDDZhO7XNGBsm5kI/tjyCMCarqIyOHxKrIY7iiCwCAXIWIlvys8kuiB6
 2YhLsGwqT2IeJzj011Ov3YXdHukuIOth5O03W9SE/8QcBivHJ3HgKhZAq5jZ/JCGZugT
 M/W2yru0Pu13KjQkjVWNyOXH/bQT4y0gNVfn8e9P0w8mcVaPckD+cyuzfl6xqSl+Ig/C
 DFkpG9wIMUFhNeKiNGmoHdk9XJ+a7rhrfdTVLipiqLmeEMGrPqhd+xaW/nNrzDdWKhry
 oyOQ==
X-Gm-Message-State: AOAM5310rdiFfBZOxRjjAiIdXI4A+r/xH2fBNl9bXkbBoCJx296xLvGl
 ekm7Hmz1fD0sA4cYqOvZq9e34gzjTj8LKXXg5aZFN54N3R0=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr17842999ote.135.1591619192920; 
 Mon, 08 Jun 2020 05:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200608114028.25345-1-leif@nuviainc.com>
 <20200608114028.25345-3-leif@nuviainc.com>
In-Reply-To: <20200608114028.25345-3-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 13:26:22 +0100
Message-ID: <CAFEAcA-a1U4AnMpN31Ea1TJsufexTGVtd2LoB-ZW+zgpwTYK9A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] target/arm: move cpu64 cortex processor common
 init settings to function
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TLp0wpT9hDRd

On Mon, 8 Jun 2020 at 12:40, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Move the id register initializations identical between the platforms in
> this file into a standalone helper function, and change the cpu-specific
>
> The value of mmfr0 set for a57 and a53 violates the ARM architecture
> reference manual, but matches the values set in actual hardware r1p0 a57
> and r0p4 a53. The function sets the architectually correct value, and the
> a57/a53 init functions override it after the fact.

...and pulling out the ID register value settings into
a common function is definitely not something we want to
do. Any new CPU should set all the ID register values and
we want to be able to easily compare those settings against
the TRM.

thanks
-- PMM
