Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1804438ejy;
        Tue, 20 Sep 2022 07:02:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47UlPci0UPZgZBprv4L/EfS2qaLw4/Fx5PFS9BN/4iZnDEIfzkyAi8L0MEiym1zY4xjCHv
X-Received: by 2002:a05:620a:d8c:b0:6a7:91a2:c827 with SMTP id q12-20020a05620a0d8c00b006a791a2c827mr15887590qkl.407.1663682546156;
        Tue, 20 Sep 2022 07:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663682546; cv=none;
        d=google.com; s=arc-20160816;
        b=tXbxVPPOoL28s0fSpinSDH7096U2J1+PC5Ovf4plKBfmN9mZQScv3Ny0E+ahIAhRIr
         JybZw48z3SQHjn2/DVty4VSl3/AtdGy5uWLzquuw9eI+HugpgroQfOAsalDLU2T3FgZJ
         6KIxfuphutqW31/DItkSD/fLyjuFcrtyQk6BJ286QqPBPKZSgnSg39jmrH+9xBmb4wYF
         6KeHBjReVne5uNBQ4yZ+e7QXEiOtqljtjaq4NM6OyeW2ELlpTHiuxBM9UqxTnJ4NIh4x
         KpsJR7P3BpXWDCrRedZIBtap6VIPl25qywLjqerg7Wj6Ddz3k4yf1HXMm5NL3zPH3s/L
         WwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xc7nSGqbDAR0vHM7BBlKjp5FKIsZVDHWbhaPtpRM6TE=;
        b=N45/09IMYhgeNWauKnkFOlTMyHSfxBbqerrmSHHOtWMbCGijdRg6KApAWK5vOcRQ9l
         3L44YmtNYx617WXRIDBPSBwkzElEchshZXxtLDYSHkqkn7x8iXD4JmA18sAq1mX67qYm
         E+QPZvoZEC54vf2Hh3SQ6/U6o2Tf4JLsbNfcYMZ5WGL4C92NzQIXdf7xKObkuEVM+jaU
         KIKCbJPJAZgC/oO+dQJiB8OUoYtf3ikNpxRXiAuYJSlJkL1c0Q2+7p5LqpWAYa9Mu599
         geFqy0xDIwcTIqH45ofOxdGSz3r5JQAsYd0Hb/Dyf/tetjwZ+EQy3gP173IJwK52Ag3g
         xZAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bp+muWlX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05620a410a00b006ce9fb32d8asi308332qko.50.2022.09.20.07.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 07:02:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bp+muWlX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oadpR-0003MS-Jf
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 10:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oabJj-0001SJ-IM
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:21:32 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oabJh-0006mE-Ol
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:21:31 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l14so5310962eja.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Xc7nSGqbDAR0vHM7BBlKjp5FKIsZVDHWbhaPtpRM6TE=;
 b=bp+muWlXbx1clLrtKx37+OmmEEySR05qqPVO4bGvKqVacbYS/bQuiJRclsbUlBiX0d
 BVkuFpMPFLkVzMd3dHC2ztsq5xcyQg0kB5sEZG1sVWDzj3P+LGNSWpnt1zzyV5x0rMQy
 iiBY+chNb7y6Aqr/Z24E5Fm4aZGLN8llAiJvxvJFQywG/Eneo+6pJBU3u+aEBofXerXD
 HZSr6mvNd3m5gpc7HYgZytJgPKH8oG34vzFqb42XJaUI6qQ2zFImu16owQlyWLWJlR3J
 3tDF5CvWtXQTk/iXu4hfnpPvhqKF2H4aaJCjdW5lNofWuH3L2Jz/NsInsRvSszo/Nu6W
 dSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Xc7nSGqbDAR0vHM7BBlKjp5FKIsZVDHWbhaPtpRM6TE=;
 b=sTr0RyiJjNgLRnhSmpRWUCgLLMCRO5zBpjjPJC+VWVODZt28tIkRGbNbTbNCE2Xhgd
 IgsWShOuDr1pc8FGyEDCQ1VUc5uciZRWAIpfnfZTjyK0HxU8BN7pDl/0PBe0VpE8vgFd
 p5WbP4Lg+ppGE2r6qIDtmcAiRDEHL5/4L+tzJniSr2Ffj6H5R7pJEL3zZRlGX2K3qecl
 ZpOBILtyRW6ExJ8pw5rmq/8xlGb6z+8Lge1P/WY2P8F9WDlo8iLdEEv4LunH2LeEqoy8
 Zx+hXv1x54D3muQQkG+fw+HdcQ2UhRe4cxND8o8OQQRO1xFnqofPWlqgNM4ErkFk75gz
 7wJg==
X-Gm-Message-State: ACrzQf3hK4ZsUeYOItX3glWDdN4o93ob4oqvk3Se/AHizDfcAxGSHwBs
 vRrHIV9JO1dL3HnvV5nfbGpVwojr/UjEvZzM6LvbuQ==
X-Received: by 2002:a17:906:730f:b0:781:6a70:ea4 with SMTP id
 di15-20020a170906730f00b007816a700ea4mr5925980ejc.36.1663672886792; Tue, 20
 Sep 2022 04:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-4-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 12:21:14 +0100
Message-ID: <CAFEAcA8eg9640YB-dJ=N6fddzuc4e7QSwEZgZuZM-LoDXL0zWA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vhqvvUNg2MDW

On Mon, 5 Sept 2022 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When PAGE_WRITE_INV is set when calling tlb_set_page,
> we immediately set TLB_INVALID_MASK in order to force
> tlb_fill to be called on the next lookup.  Here in
> probe_access_internal, we have just called tlb_fill
> and eliminated true misses, thus the lookup must be valid.
>
> This allows us to remove a warning comment from s390x.
> There doesn't seem to be a reason to change the code though.

I looked at the s390 code and although it seems a bit awkward
to still have the action-at-a-distance env->tlb_fill_exc, I
couldn't think of an obviously neater way to do it. So
assuming the s390 folks are happy with this,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
