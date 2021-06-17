Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp509432lff;
        Thu, 17 Jun 2021 05:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0iVJxD/gAJPS5ymDzDHLvHyX1OQXBx1JsU2gxjFVUJiDLwr7Nk1b+e8FKTpLMOUTQkU/X
X-Received: by 2002:ab0:29d9:: with SMTP id i25mr1748383uaq.70.1623934361085;
        Thu, 17 Jun 2021 05:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623934361; cv=none;
        d=google.com; s=arc-20160816;
        b=nfEnCPZ8QWbVAqL4c9OXRe8kYmpER1MQPRRFfrZeO9gRrnP4EDZCj1Myu8nhTzRH+O
         ifSo4f5ja5+uT2ACj6GIYXcIE3EbvPru1tduNjjcWXL/2HXA8zmGsKkyo2l0MjV/kMbt
         j+OHX/M2R5j/dbqRIRhabIQq5IX8A7DgjpEvQjdu234IfMrvzlfiCjWVW3wra/D60FKa
         ofm3zMuAbP7aBbufNbLJGy/xaVxvLcO9j6NMUMXGvsz4NdVkeJXNSaO2tBjBYbFozMqk
         bcJdOWLYSq/47T1bP9z4B2Kn/mQqJPlhQERhCFYl7pOR4y3XvOEzehDhjmDklbl7pS2U
         fNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXLDh+yfw1z7IW9znBpg5l7mmmjf/oa4XnRzPYKl+Po=;
        b=lP5Zh2yVgxXJs28+pH9jcJvwmtDnRV4VpILitxyk6EoNwyX4H6c5uP3/kcr4u76exP
         3gIaGqsnH/+48WMphkBfnd4TwYMTU+OS+O7BLOPR4jgNzac7B5vfCfl8dPrZ8l9lnEwk
         0yO81ROFAL3UFha/jikUVeFBuwT/jcIbCDkkjcWhwSNqoyFhcXFnoz1QPoiQRe3oTCPQ
         Ei3xMOfPX+9VZ67LySxYAJ2yfzQl9VWL8aIOf4dsjhV/fPrLRdnOmgQryLcEgA6/3sB4
         tR3P8CLQKYFoVTLqOZlwe2H9w+3xoScC+NqJbhr9ytERHb3y/Hp+wQJmX6megUKWZ+HI
         mwcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q9HTiKrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si4234100vsj.371.2021.06.17.05.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q9HTiKrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrVg-0001jn-C9
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltr6E-0003sz-VI
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:26:23 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltr6D-00031R-6j
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:26:22 -0400
Received: by mail-ej1-x634.google.com with SMTP id ji1so3435923ejc.4
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXLDh+yfw1z7IW9znBpg5l7mmmjf/oa4XnRzPYKl+Po=;
 b=Q9HTiKrO6PFspMiXNEHnIcxZlNBT8+gLSrp/o5qxjh8/U4v1rlYC3kOnivndQYBkTT
 jYVIyrFO4UnaMU9jWr6QoWoiuR0HkFWWI7Nh8Oe/apF4tbHocQ6KIKeX179/225/01UP
 hl3a4uz7txDONJrHSoHtyt5t3uUo5DswragOtcfPTYYurZNGN9+VrVLPVSGoS233m6SD
 gsitlSckrXrxN/gP15kfzHYeYFa1Nw5C8+PYFOwOwH1jM0j6nVYgeg5a8yK2teWNkla7
 /1mENTvKOWlNHSgwIvur35dXu5uo+7LeHvx+QZRaWTXbXRmClg2eUipmf1/6HmK+xJWU
 TnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXLDh+yfw1z7IW9znBpg5l7mmmjf/oa4XnRzPYKl+Po=;
 b=Rgfm7fcbjVrKq2NumoUVc9tnij/IDzctTkUQGBh1a0Q36fHVaCSdifNNbug1U2UMT5
 da5ZVR7E10Y8bUseRHVtDjPglfZbszDXRTtZvuB6MMZgc3iOlmzfOm2nEHq7BqQ4bh6J
 Vx0KMvAMos5ERNIra1IksMpkN6J+Ms++NOBKwYCTHs27mUfjSxHH0BD0sGQeN3pmKZbT
 V3w96JCCZln88gkf4fxji04atnQykuNsYFONjXTDURUUdia4paF7O5WhDqO1Vt5cp4Yw
 RCS/M+2ayVNpIDV/YeqB2BOm+up2X7dIkr55ZdfJtBiC4GaCFsxWaPjK3p/OkPNo8TYt
 fZrA==
X-Gm-Message-State: AOAM531pddXuAUdUUlsGnpufvVWPhPFltdKrupIZZLH88uTFMMgnjXuC
 PSOO0XiEOC2TxYsJuZstAdtdNLxtOPlS9X7cT7GFzg==
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr4854971ejz.382.1623932779290; 
 Thu, 17 Jun 2021 05:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-2-peter.maydell@linaro.org>
 <794108a2-fbaf-dfbc-ed8f-2d3d87ba2c07@linaro.org>
 <3e6b9e75-a0b7-eb65-a357-43d0cb3a3027@redhat.com>
In-Reply-To: <3e6b9e75-a0b7-eb65-a357-43d0cb3a3027@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 13:25:44 +0100
Message-ID: <CAFEAcA90c643JhudpB=g4Fpz8B+dQvd=9tYZVyss-kfa3DUbRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/acpi: Provide stub version of
 acpi_ghes_record_errors()
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Swetha <swjoshi@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8khQNVu4DSQa

On Thu, 17 Jun 2021 at 11:28, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 03/06/21 20:52, Richard Henderson wrote:
> > On 6/3/21 10:12 AM, Peter Maydell wrote:
> >> +softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c',
> >> 'aml-build-stub.c', 'ghes-stub.c'))
> >>   softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
> >>   softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c',
> >> 'aml-build-stub.c',
> >> -                                                  'acpi-x86-stub.c',
> >> 'ipmi-stub.c'))
> >> +                                                  'acpi-x86-stub.c',
> >> 'ipmi-stub.c', 'ghes-stub.c'))
> >
> > Gosh that last line is confusing.  I see it's documented in
> > build-system.rst, but yeesh.
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Yeah, it's vestigial of the makefiles and I should remove it.
>
> That said, here:
>
> > +acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))
>
> There's a missing "files" after if_false.

Thanks for finding this bug -- I have requeued the patches
to target-arm.next with the "files" added.

-- PMM
