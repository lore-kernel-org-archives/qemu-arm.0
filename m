Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp2055486ejc;
        Fri, 29 Dec 2023 03:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjFKqIGs7MGxugvfoE51ftJnwyk/SjHL7O9xI/6qCS2FW6IMNa1yjicKH85JqBhzIAqxjI
X-Received: by 2002:a05:622a:1984:b0:428:ad3:18d6 with SMTP id u4-20020a05622a198400b004280ad318d6mr99403qtc.94.1703849852090;
        Fri, 29 Dec 2023 03:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703849852; cv=none;
        d=google.com; s=arc-20160816;
        b=mAebTZ+2OIV7PWu8G7uH3pvKsSuQEI9irvwK4lo6GJM2KIaA0dG1LdGD7Z1v6Vh0pE
         59w9M/TVbZn+U6TidPGMoSddQohbDZOGg99GwyRJkYzhDVCjYpTFx0Q3mWpyaST6s8Mg
         eYezq6AxLvXqQ6Te9OQWiiSJCjYzo8x8PmqyndYGBDpVcSfzd9KrNzL7eInhr3RQdUC1
         wM642YzRPESXU8p3D9tNsHMWDhUKG3yN/KNQSUWa2jU7lJ75snH/zppEGp62dWp4teB2
         UoMngHh2CByKn6PeVrNpCoPBCLIOG2cRzE0m+qVTZz6j7HIdkpudME4THWWw+ufYPHbE
         1sHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=kVnB6cm5OGM7qxjAd7B27svF/kdFtaarIP32txvR4u8=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Vj7HaMbWmt2yPoTOiUNdY2bI/Z2QGXvvssrBQKUp54JvLFOhrXnjb6ghs+IRd4nX/V
         bvm/NLgGCUtFv1ZZPOjASUSiUXrP237L8ZNOHauTYCZpKuv7vfFOAQCqabHgapwNjXPI
         WsCvV01MX6g8N8RwwfbFI8p+7C1mEE6I83LdhfxbDFZPSm0DXcrh+47Y2aX+/dx9Ew1+
         //g1V5cTBfn45NDDH6qnYx4p8n3yS7ffR+74r1fN5WE5/NSgOWwOAGAR8riWkX21immb
         Zr2XAphKiEDq8doQEBQ6n6xUsX+r0zvEvaI27Oq2zx7BnXgh6nbBtSAVxSFrV8ZktE+n
         NkEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPb2cMLM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj15-20020a05622a258f00b00427eaa83194si6322654qtb.216.2023.12.29.03.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Dec 2023 03:37:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPb2cMLM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rJBAp-0000Ug-MJ; Fri, 29 Dec 2023 06:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rJBAo-0000T7-Pd
 for qemu-devel@nongnu.org; Fri, 29 Dec 2023 06:37:06 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rJBAn-0008Vu-1W
 for qemu-devel@nongnu.org; Fri, 29 Dec 2023 06:37:06 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2768b78a9eso226798266b.0
 for <qemu-devel@nongnu.org>; Fri, 29 Dec 2023 03:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703849823; x=1704454623; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kVnB6cm5OGM7qxjAd7B27svF/kdFtaarIP32txvR4u8=;
 b=KPb2cMLMzjPrQ1am3FpchqstEWgnlQs5f/zRSz5Vt4+C0p3fK6iR1ZbpOYxq0bs5Nq
 f54zoHs+LRdSeM4MciYFs6J/KN8exa141r0sEc58djr9YpvVmI0PheuetMigZbLo24rW
 pNSpCDg4u02KdsWZj6g1xN6TopDAjMd6GSmLNUHoM+gEQlQHCnC+kbmfaL5Es9ELIh+5
 f6cuTo772xWiu+Y/2CsZ9G4DL7ENMIVNfB7FpWq70ai34QkzGhMERD0rZ/HeDXxE0L2Z
 sPJjrVV/vuxltHFwJCxjdk5QSbu8rDXLoO32wyiJeGzZ5sDUefsWz+6+a1kShndonkwt
 UbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703849823; x=1704454623;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kVnB6cm5OGM7qxjAd7B27svF/kdFtaarIP32txvR4u8=;
 b=CKhVQ1QCDMsWXFae7+kKA44bFPs20PErTyUcYguq/dR38QB4A0rpqYujMsIt7BpYVs
 k7rBDXmvCJEHDhnVSAuem6t8N8ks+8hyPqrEHQeiBM4KFhBuSLboefthRpYlQqShSkrn
 mhxaf0QPaHF80zi5lTeiDfhUQC1v+ENXLHPLf/+Eb4BsGO29wAIu9GiEZSQM9r+r+maN
 T/xHeO5g+ibRMD3eYRgONUl7mqWLY0+e72y+KTbr13DOl1cOGyDMvy81Rg3mGvzFRC8l
 2V0bW7yMpOzFpETmWDx1OAtBSk3uJ2MyqQ15IDSQCGjzio+TxxMidaivxz4fbUDLvkGC
 Eg1Q==
X-Gm-Message-State: AOJu0Yw98TvMwvCNMVK+c8l84e8aqnOHO34x+AqkkdfeBUFnuumoHMab
 XeJnmMzNSWt35X/WsmRd77J2DtlRzrvPCw==
X-Received: by 2002:a17:906:73c2:b0:a23:62ed:105b with SMTP id
 n2-20020a17090673c200b00a2362ed105bmr11171786ejl.69.1703849823337; 
 Fri, 29 Dec 2023 03:37:03 -0800 (PST)
Received: from [192.168.200.206] (83.11.185.71.ipv4.supernova.orange.pl.
 [83.11.185.71]) by smtp.gmail.com with ESMTPSA id
 kx26-20020a170907775a00b00a1f65433d08sm8425822ejc.172.2023.12.29.03.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Dec 2023 03:37:03 -0800 (PST)
Message-ID: <b411a3d8-9ae9-4f99-8a5f-4b3f29b10bce@linaro.org>
Date: Fri, 29 Dec 2023 12:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/35] target/arm: Add FEAT_NV to max, neoverse-n2,
 neoverse-v1 CPUs
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-22-peter.maydell@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231218113305.2511480-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bEsjstbVas56

W dniu 18.12.2023 o 12:32, Peter Maydell pisze:

> Enable FEAT_NV on the 'max' CPU, and stop filtering it out for the 
> Neoverse N2 and Neoverse V1 CPUs.  We continue to downgrade FEAT_NV2 
> support to FEAT_NV for the latter two CPU types.

According to Neoverse-V1 TRM r1p2 it has FEAT_NV2. Similar with Neoverse-N2.

You wrote already:

> in practice hypervisors such as KVM are going to require FEAT_NV2 
> and not bother to support the FEAT_NV-only case, so I have
> implemented them one after the other in this single patchset.
So maybe they both should be FEAT_NV2 and FEAT_NV will be left unused. 
Or enable FEAT_NV for V1 (as being older) and FEAT_NV2 on N2.

This way if someone wants to test nested virtualization then both 
versions will be available without use of 'max' cpu.
