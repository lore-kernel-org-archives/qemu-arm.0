Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4837120ejc;
        Thu, 12 Jan 2023 06:55:36 -0800 (PST)
X-Received: by 2002:a17:90a:4282:b0:223:f131:3604 with SMTP id p2-20020a17090a428200b00223f1313604mr79767800pjg.17.1673535336652;
        Thu, 12 Jan 2023 06:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673535336; cv=none;
        d=google.com; s=arc-20160816;
        b=Zq5fXXPGKJDjr05fDdwnXEBY6IjxL3EBJFXitNAZdJqwQj/zhd2RaRqarIsFZEJOai
         Fx+8cGxKpSW8jelRNWauPbQgDFH243rh79j6ZssFnSLgYzrFYJ27YzwsRm18p4up8Toc
         FX8+z/OhgS153fZLq5OfNuJgXyeL83E1xxvE/SONvipq/Ca40AOwSKR4vtgdAN9VqC98
         W5Cw5UgT61j8jc34M8+kterQDnPcT594MDVwvaRCL9XecWJFgMTkCNCFy3QB9460PTcV
         SeDShN7G/Bh35XoOC6LMIHC0MyM0BnFxXK565sSP+wZ1wGi5GVIpYu9XuxljUgRpvZLf
         sIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kEg0KppAwxiIFoRbTcUg5+Zyn2+GJ2GySC9oC/qN6UI=;
        b=DOkgHl8EOGOis/1SMS97AkU9AKj7qie2dQgK3sww3VgTeXJHAAfEocACTl0omTruyC
         6/5kw/g522i+rSpLUD9dd8Zs0sw/T08fZ/dYQo/J0bu27ux5mRZdmcm+CmspJyukj9uQ
         qt4b2VPlR8GUQYkU+0sXC9jwe60vZnKo8NBJlBR6x7c9lB8TccTpwk4+mOgDeXCmO2AZ
         2fz+kSjw2naWj9vsi60DtHTk+sV2WxtyDYppqj2TL6qg87vaHSG2jepLkcLVW6XBzv8h
         nG5QYZkx7gLIR8IORRyDo1mYlsAl1NGdLV8xKH8fZUeFIDpE0x/Blqibx/I+OEF0ki8G
         GGYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlwuIqhU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15-20020a17090a6e0f00b00226019763edsor10556064pjk.43.2023.01.12.06.55.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jan 2023 06:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hlwuIqhU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kEg0KppAwxiIFoRbTcUg5+Zyn2+GJ2GySC9oC/qN6UI=;
        b=hlwuIqhU72d2pk0i3LH0bGcHWA7kzjBM+B1WwHV2V9rAMa4UaipYRBEsiGSbCsQKtV
         3AYhX9oWrSSFyEk0D94O7pLwVm/tR08uLWgKLsbCzi4yOznGwClBwBUT/vhIO33VJYEu
         X5TmoGQN29fiyuKFSPFUe2mBPsozoSJJDB+sD9RtosjD5yeW0XinP2naGeaZqgp6ZVey
         nffgk6sQQ9nKY8B5LCYZQLUylxutbTDXGAT6t60deXcpKpi2QsXiTYM4i87Y6m6lEvC2
         yq0UVTamEBWYujIXHxHl/UzhSpqVzZ2x6QRQhsCTlMvQEohQ0XD3ZV5tuHF7D2uNYh96
         ZBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEg0KppAwxiIFoRbTcUg5+Zyn2+GJ2GySC9oC/qN6UI=;
        b=B4wZrDanIrkK4r40HLQYxh2kLbStEnf/R3E8GLyAiszm+L1nRhOOsCPxi9lON8GdTF
         95YRMmQs3bLxbJkUgVcJJ0doD7A/UB+m6im59QrHp4EsTyhd+PcmIE1u2rxtoIS2RwZL
         YxHTNa7iMMOGUtIXLlBfkKe3D7e3jvOIZ8IND3GiNBGEoTmx3MpDPs9WWAFFuUq2w2fS
         tXdP5MDRMulyFm9vcVYy4USapKSW052LixCEHIvYuJfuuJQN34e69fybtGhB2UGzXbl9
         8Dde8ZUA4pG9hkqaEv6SdSHkAaP5w5Q/1jnT1xNDvOq1Cc89DScMUHuKcuor2LCcHR6F
         nnGA==
X-Gm-Message-State: AFqh2krQuzVjWT79b9AGfiDJ9n+PIaJdUZ620oJSRYNEJ7M84IvY8095
	PtjFOW7/+gO02B8vQRRbK/mg6iJuS2rdh7YFnlfw4QgL
X-Google-Smtp-Source: AMrXdXssqlTohfMIJ9D0LJz86dCBiRjMM5K41MpAluJco/xWkrBF+do6m8GX5z3tz7mWUtNNkh63Iy/3Y3lw0DqUV08=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr6278659pjs.19.1673535336216; Thu, 12 Jan
 2023 06:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de> <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de> <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de> <87fschcko4.fsf@suse.de>
In-Reply-To: <87fschcko4.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 14:55:24 +0000
Message-ID: <CAFEAcA_4m=+2OaiYSR4pVTr9StWR5UNFm1A7aAaoAAtFbOmf7g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Fabiano Rosas <farosas@suse.de>
Cc: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XI1R1JXy15IW

On Wed, 11 Jan 2023 at 12:36, Fabiano Rosas <farosas@suse.de> wrote:
> What remains is changing the Kconfig to not bring all the
> machines. Nowadays for KVM is the 'virt' machine the only one we use?

I think perhaps also xlnx-versal-virt -- at any rate, the source
files include some KVM related headers...

Alistair, Edgar -- does xlnx-versal-virt work with KVM ?

thanks
-- PMM
