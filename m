Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp145379ejx;
        Tue, 21 Nov 2023 23:41:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeMlBZ3hpHvK4//dbQ3IyTKvf7PAOy2DpbiPzdJX2o1xLiE52A0S+GLAEQvILg/0U08eUc
X-Received: by 2002:a05:620a:600d:b0:778:bb39:7d34 with SMTP id dw13-20020a05620a600d00b00778bb397d34mr1677909qkb.36.1700638917317;
        Tue, 21 Nov 2023 23:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700638917; cv=none;
        d=google.com; s=arc-20160816;
        b=lfVfg2+yXUWsOPJbDUyVBX+rd3kJ4x2phS7LwbCBLdwc9plMLdVFrZTYo4H9hnlobX
         t1Gj66fDKJ8opro3AfCF1dZMxR9bKjZ1jjZAA/ABcsexnTXAvEEc148wjUA6ZUXJu/Er
         oaZ/cRP5ByOQbTFYAx/50QaS+MxMYiiPcoV+2+42YotO5b2rdA6aD9xURIUulHHUdTRO
         WmscRKA6+czNIAo/t0WRZ9b+/Yac1shrf84oHfeViUkJp3ld9eq4GW2Wo21DwsTbsebH
         tt6R124/HOGZnMhfrpSwIVef4QHw1H16g6pk1gqJpmN1mP7uWfufFoU/iWY0U1pWojKw
         eT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=Q1xA0FLva6Ni9XLTK68kLIgdBywCtMCb1zB997VOfIs=;
        fh=UJNoRMXvawh+Nz90wsqCB4hLiJ339wMcpkkSd2G8ai0=;
        b=F2oI8z8ZH2hQUKjigiEeMaeK6eXfYUaFrrmKOptlfN/xS4fXqFmDe77vX9emXvvUiz
         fD5BGoPUmfL7E1VXSYZ33xwGkw6eQ2uacL1GMB1ICWFGJbN3BaRAp0ysxmbe2JpqvNI7
         SVfMk4dSS4EaHcDGwolwPgiO+embGQvd/8AJdmEtFe/BiE3rcvQ5agOXMlTf8q+4tVpp
         QYb2M7OoqBM4OebPxPU9MWfsKyA28m05EwYQ/ufElKlmDHggO3ecpzkwrWMI6Ujstebe
         lz7cjwjDA11WUqm8VQtyJYNTVU4EVJTa9Ow4Fn+CdfxDsKz/FTzyvpZKnibgvMn9MRh4
         p07w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aE6ULhdG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05620a0f0500b0077429eb9588si10825541qkl.326.2023.11.21.23.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aE6ULhdG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hrb-0006IU-O4; Wed, 22 Nov 2023 02:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hrX-0006Hf-Ad
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:41:31 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hrV-0003fc-RA
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:41:31 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507cee17b00so8435635e87.2
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700638888; x=1701243688; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q1xA0FLva6Ni9XLTK68kLIgdBywCtMCb1zB997VOfIs=;
 b=aE6ULhdG/zzRjtRaTCs8B43SDRI0jfoZLZfwxiZ8GIe0qWkDjqUQjqh8mTAbHaw8J7
 dpEmfZQ3glswGEvATMSSpFXbav6UHE2BDf5tJlPDEmLZkXp+77ZonxeWoz7+zeTcjvoi
 fgz8ZTDMrDyTjISFz6S5FSVHOUIokBsd0Csr3CLHGVfheuLYXURUhOU8YPvszPGT30Jp
 6vBh+eDKNuRnVCvgi1kSi87qvPTvyMbOuF+7nV0XyWVdtLerezKFGISU26jzGToWugbw
 ATnKu71Kf0CyySydT6IldNL0iFksHtxXo492p8UhdyUwubxJV2vEmfiX5rU4An8ovI5O
 IvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700638888; x=1701243688;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q1xA0FLva6Ni9XLTK68kLIgdBywCtMCb1zB997VOfIs=;
 b=Y46qIqxlMV4bSRIZ+i84ezv3ueDMi9gopN4eHXpViSRargc1i8iMdwBLR5Dl4F2G2k
 y+nd8oroVd2BI3pRmJxYW5D6nwqm3wcLF1scAVi0qSEBRuhO/YIeO2ljHWX4+4XaDtmJ
 L8M63rHorDh/ETCXvV+L6YMCNgqPvVwiIPrNfHP8VQrHrBy1RVXs447uaSUUuEYeUEYv
 fCYsJ3YZeSzQQKPkeZMSaCg7wLcQ6pEk18R4csFUEIwsmvGTaNDQa3ZUUKhGO1AO6RYi
 M0dFP+yU1g5vw0xnjVfnDzNddY0Mc0OM/cLx8grvqvGhQAKqoaGwZ59TxUWHkdhyKIqx
 nOpQ==
X-Gm-Message-State: AOJu0YyE/ShmZ37NO5BuDA5Ffy9qxEJvPELSUr4j8x8FPMIX3FudHoYi
 ZaMbrv4mbFy7dajliga6ScR8zw==
X-Received: by 2002:a05:6512:20c5:b0:508:126a:751e with SMTP id
 u5-20020a05651220c500b00508126a751emr837989lfr.36.1700638887775; 
 Tue, 21 Nov 2023 23:41:27 -0800 (PST)
Received: from meli.delivery (adsl-27.37.6.163.tellas.gr. [37.6.163.27])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b004060f0a0fd5sm1241172wmq.13.2023.11.21.23.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:41:27 -0800 (PST)
Date: Wed, 22 Nov 2023 09:38:26 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 19/25] misc: Simplify qemu_prealloc_mem() calls
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-20-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-20-philmd@linaro.org>
Message-ID: <4ild1.0v3gsvmc0lqe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R4qB1Ug3RwA2

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---

Commit message missing but indeed there's not much to say

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


