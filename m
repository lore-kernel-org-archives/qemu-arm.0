Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3319975ejc;
        Mon, 16 Oct 2023 09:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmUqwbOJhqFz16CocI5YcYvEpXOR132Vlmeu7T67mTRPt18lM2rFfaxc/bJlNJ+m4kMw4Q
X-Received: by 2002:a05:620a:2415:b0:774:1c60:4b16 with SMTP id d21-20020a05620a241500b007741c604b16mr40892490qkn.49.1697475173597;
        Mon, 16 Oct 2023 09:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697475173; cv=none;
        d=google.com; s=arc-20160816;
        b=vw5G+U6UF5tfBG15/NRaICnp5jO549NurPzONC2kHIVZpXy54ze6Zo11ykwfdyGgkv
         qcnpYPrWRyUpv0etMX8d6OHZuATJ0o83AsXL88OdfHh6tfx8Y8bK9fp7FVDqqFrmAxm6
         Xi+1NwVLKrSrfHsjVWbfH1Z7dVeLxwaUhqu6jAG9STBZgdzTqsWgcHj5rx5i9f+YhL+Q
         sUWmjMMLrRLh0607YV251GuP8VTMHJZZfTfHwC39oXbFX5nl23Z/+Orq0JiLARhVt296
         WWuJpYgUpngONB3Y2BoxbhKmeBjRyfHyz8bmbGpl8P/nXjksObRJcpfPsJd8dj4DFu24
         4ffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=spq4yYWyRvZELCi5JXYyvg/FkCzTtIN2Qz2QR68ItPE=;
        fh=FOBN3oXk2DeKY4G1AXSUb2xqFKukdIQI2wkQjODk4EI=;
        b=wHnamIVy7LNr5biYd95aAuKfeJE+QKkQoYPslElIoVzmtS4rg+HuxbutKGoOBjWBlT
         nB1QA+vhCbwmlxpChhYX5cEf8nV44pDvAIHqPQThOmIHq8aAyyj5So3Pca9HTsjr0rTd
         1a1yjhx47dFSk7C/EKOvdb/DRNhPKwFmbQQbQP0zi+ukH/xRKf6YdntwnvTCIXDqSEAB
         rMyheT13CKJ/R/5ERq2aJSYgh8iJz7O0uOVtLvNAZD+1ZCXhza01q0PWttl+cqJVGmdX
         ojek/gITvgBgU9hBa2Zj3vFKQmLNKlh5yqf+14nz/q4ZU3rySFX2WmFmQFmBGYsDMIQX
         XgGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esqTYax0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rc8-20020a05620a8d8800b0076db8c00685si5213235qkn.382.2023.10.16.09.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Oct 2023 09:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esqTYax0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsQpe-00016B-S6; Mon, 16 Oct 2023 12:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQpX-0000zd-Pm
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:52:36 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsQpS-00071T-F3
 for qemu-arm@nongnu.org; Mon, 16 Oct 2023 12:52:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53406799540so8342498a12.1
 for <qemu-arm@nongnu.org>; Mon, 16 Oct 2023 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475147; x=1698079947; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=spq4yYWyRvZELCi5JXYyvg/FkCzTtIN2Qz2QR68ItPE=;
 b=esqTYax02B2jVlVlnBxltslbzoozweR6hrA3tTREUTmlEFwZrCcQxnvmlgTE96cWQz
 i155RbqqgBLAMEjNNtT4SthwS+w+BAj6nUagQJhGS6W1nEldtJFnUNPWE2B07oEj41NB
 csdNjK8RCga+uRlrfeA7Q0Hk0XBohTGizDHWJOfSITZ+gBE5raaNG+YZzft9tBu+Ct7L
 8hqC0AzpiCCmHT6AHX2hmYttpQzkBgiNh8HOjBMsbiPZ7QEzNCZ9M/Gk0TCHK5bHIS8Z
 SeX1+Imwd6eH7gyyCvwEPGNOrpRy31HAGfXF38RF9DGJxJuNOdHwxD0fE+ad4hr1VC78
 T2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475147; x=1698079947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spq4yYWyRvZELCi5JXYyvg/FkCzTtIN2Qz2QR68ItPE=;
 b=NudNsnlTQYo1E3Pg+MNkK7RcGMYyM2fOXhIpc10TZ6zwMTEIlhNr97PXZ4J7PWejAj
 u/qogOBecpG41rwvk1NA+YEEb+tQHMiPUBMEn6xsfzxzmDDJo7o+t/316/qP2UFckkyk
 BkAWC+izRcELl1Wki/2p05Fj1K/vpUiO3V+H6cEp4UNMVHy0Pa3O8GyWYnGTtEb1US3D
 gksXMB3ZfMPcS+9ekGWnr1T8RVmMNYkNCvg3reXu8PvNrCkfNoTeL0RxwMQQ6aFRmxTy
 c05bzT4LY0gGw8RQagF6rLwUxgkzsemZBH0Orh8EMOsTyeLVxiH180uXiSxlu2PEBoAL
 zXMQ==
X-Gm-Message-State: AOJu0YxlKEyVkmccR1gOzGzYkNvKc8pecLMfkPfZcskzsNQ5cVkjVJCp
 +yQ4tI6vSVdRfP1ztX+SX3i8TFfXt1Qn3r9BmLbdmLSe6OIoo+2C
X-Received: by 2002:a05:6402:430c:b0:53e:8972:1d4f with SMTP id
 m12-20020a056402430c00b0053e89721d4fmr6305811edc.5.1697475146791; Mon, 16 Oct
 2023 09:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230928094404.20802-1-michal.orzel@amd.com>
In-Reply-To: <20230928094404.20802-1-michal.orzel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Oct 2023 17:52:15 +0100
Message-ID: <CAFEAcA8Uy2293pFs8Dr4ujb8bYeV5v62CxFwXstDWzHZfq=byA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Fix CNTPCT_EL0 trapping from EL0 when
 HCR_EL2.E2H is 0
To: Michal Orzel <michal.orzel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefano.stabellini@amd.com, 
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +iuseIoo5Ej/

On Thu, 28 Sept 2023 at 10:44, Michal Orzel <michal.orzel@amd.com> wrote:
>
> On an attempt to access CNTPCT_EL0 from EL0 using a guest running on top
> of Xen, a trap from EL2 was observed which is something not reproducible
> on HW (also, Xen does not trap accesses to physical counter).
>
> This is because gt_counter_access() checks for an incorrect bit (1
> instead of 0) of CNTHCTL_EL2 if HCR_EL2.E2H is 0 and access is made to
> physical counter. Refer ARM ARM DDI 0487J.a, D19.12.2:
> When HCR_EL2.E2H is 0:
>  - EL1PCTEN, bit [0]: refers to physical counter
>  - EL1PCEN, bit [1]: refers to physical timer registers
>
> Drop entire block "if (hcr & HCR_E2H) {...} else {...}" from EL0 case
> and fall through to EL1 case, given that after fixing checking for the
> correct bit, the handling is the same.
>
> Fixes: 5bc8437136fb ("target/arm: Update timer access for VHE")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Applied to target-arm.next, thanks (sorry for the delay; I've
been on holiday ;-)).

-- PMM
