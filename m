Received: by 10.223.172.38 with SMTP id v35csp3904926wrc;
        Mon, 18 Sep 2017 08:50:44 -0700 (PDT)
X-Received: by 10.223.163.203 with SMTP id m11mr26977132wrb.130.1505749844616;
        Mon, 18 Sep 2017 08:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505749844; cv=none;
        d=google.com; s=arc-20160816;
        b=oehImbj8nY1+IaEq0eiG6VzcJyqMnm3EBRyWGkEWNJCYV1dBwaLzEfK9chd/d8v/cB
         vgwfSaPGei3zqPJflj2EU/2JbDXn8bid4fkgRVKrAIb7TJas8P11ct0FiGcVoYWG4/80
         /+JzmR1YOxU5e9nKMONWjDkts+ZHdd9EMlAstvqB4JfKFkYUu4oioOTrAFjNa9/YpqGx
         KIz7y3UzWm3HQ4gm6rzmcK6UtAqDdOQeAMGpYs8f+CIfSGOr4ndIt+uE6PjJXKgzJV00
         feNp+pDBImw2zZVmDH5T7flytYa5js5hgGA+NlHN0dIrq5fRAtAMb+tAHkZ3/Gza2gxH
         bybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=iLf6sAljCehTxXFzPKTe4ztNiOTE4pdXYs9ZSaurKYY=;
        b=YZWtEFlW9JsvJdhR5vcOFOnsV9HxdgHh5CovQ/jtVNUj+clkLfm/8SzkCqhidGwjq0
         IYlVMRV3HCxYOdHp8oRKuZnhRPEm5/0Z82xUwTs2sdPmBAIEJewoHoS9u86mKG4J4YKw
         ZFK+VQeBnV8g60xQK5Jq/3LmbXCiHya8d1xP4aoeL3qqe9j1fWKRCzJ7UirvBACmPfEK
         wdwisRN1oSNwWZZQTCHBTNewGbOMRgprG1PqiZx1SptZLu5cP4Oc+1BqUFA2o2gxsBmC
         yo65QZlI7w0rfW4F+C5HBFsxA8kztF5O/jeAGuViVpyLUIMyuCigdWmJ9uZ7bo0KFXTr
         rehw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BnlRGtet;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k31sor2873565wre.61.2017.09.18.08.50.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2017 08:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BnlRGtet;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=iLf6sAljCehTxXFzPKTe4ztNiOTE4pdXYs9ZSaurKYY=;
        b=BnlRGtet5Rz7MRu9/DxKRc9Ne3tSjlleDeKgBwhwcTVAoSskaA91dUzSFzKwLgM4wi
         fTS3Ds8MWrPlxyDY4shjkvh4xqS4LfBxWRvZvO0Ah7zzGVaYKdm6iqsKTlwQ5DAJ10eR
         SryylUBUTrwfbRqlbUvhdn7kYsqoTYHukTu4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=iLf6sAljCehTxXFzPKTe4ztNiOTE4pdXYs9ZSaurKYY=;
        b=UWsAMzBSS9xSI2zhQ9HLXglMzvZ54sGTiQMcykBt7K7uKdK2N9N8syC3susGt3IO/X
         mUXUVgttQ01N0PwsjQWwrTNOHCkF5c7hGkno1n8zsklsM8X8lCAGm2efSAnMkGwealeB
         3JyKHvX2x5ev6V/x9+BBh5X81nXdKwl/RCWtO8TgH9OOPdZQiogvKRPppSAZB82DVKgi
         QVSYpFBt9OSBYv/vukN9+4V1eGDt16DfK/T/k96sJ2ANawfmwgH6KlnsjaJsRSvbnrtn
         mnevQNpx6wLmweKx9JeZdz5MsaB8/2LC5eK7L0wCp3UoTWC0npGRD40YPI441ZHIui9I
         igtA==
X-Gm-Message-State: AHPjjUg4IoXiIrHsE8WEok7mhjXkDS+Zz+Vx7qmLJ8Oeo1YnQa1flL1V
	klkYEyJewDCM0K1FEguUJVIhNmta0YtUhieQzr4l7pJakT8=
X-Google-Smtp-Source: ADKCNb5yEqtxXzYr56Jz9bb8H9QGx9RFNN6sLdHmG6MNPaDhB8mX7EjxyiLU7gK+AdEaT3gx+QkyHyGOVr1fjHBGGAM=
X-Received: by 10.223.175.100 with SMTP id z91mr30959072wrc.177.1505749844325;
 Mon, 18 Sep 2017 08:50:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 18 Sep 2017 08:50:23 -0700 (PDT)
In-Reply-To: <20170711103859.GC25504@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
 <20170711100334.GA25504@toto> <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
 <20170711103859.GC25504@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2017 16:50:23 +0100
Message-ID: <CAFEAcA9wn_ozBCHBZqxqARB5eD4wX1snyGfM0JW1Yk103CTytQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: h80fSTguGcOt

On 11 July 2017 at 11:38, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> Another way could also be to have get_phys_addr() fill in generic
> fields in the FaultInfo struct and then have a faultinfo_to_fsr
> mapping function to populate FSR/PAR. Do you see any issues with that?

Edgar, did you ever have a go at implementing this?
I'm currently running into a similar issue with M profile,
where at the moment we stuff the information about what
kind of fault the MPU generates into a v7PMSA format
FSR value and reinterpret it into M profile exception
types and fault status register bits later. This works
OK, but for v8M we want to start reporting kinds of fault
(like SecureFault) that don't have equivalents in v7PMSA
at all, and maybe it would be better to clean this up rather
than assigning arbitrary bogus fsr values for internal use...

thanks
-- PMM
