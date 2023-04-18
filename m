Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2463918ejm;
        Tue, 18 Apr 2023 05:10:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350avytjhIIcL30OGBDyvEpfJznNrku7iEmbHCO0hsmLuFcZxfZYV7ScKjA0WUBPrdSSJs3oR
X-Received: by 2002:a05:6214:519b:b0:5ef:6b89:91b8 with SMTP id kl27-20020a056214519b00b005ef6b8991b8mr15335410qvb.1.1681819842423;
        Tue, 18 Apr 2023 05:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681819842; cv=none;
        d=google.com; s=arc-20160816;
        b=YUOvu2FAY6eIglb+0EslydkZPM+YB51VeLz1a6ggT4G3hYyCslZqntTo1KEuWcpQAK
         QE/vumksxMGghaQSsjHcZyKENoEaoUL302pmZEvigWW3vsA2AX7agXHH1DfuzuWOZboD
         1ybptGSztytFtmY3xwynhjnhKqyq7eN4zm2OqHxV5Q75GEJrdTjzkrS/8SJUVdFVYusn
         46pcsWkTU3ZsOIBr8gkiI40mgt1EWNFKRvPF7DocXbq9WzrhSIWpJc2/C0GMZdlvyXph
         fjrPsFeDoQI/I4870+bsHCRmYlBQf1W5ZzY2QaxC6ZzL2NGQwK7i9JikSI4BWFTRS6Qo
         7CHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yDtHyI1vdDXmzca8rziKF/Nl5eBqsY+fp7mj7ylUhP8=;
        b=Hm7jYqyLJfOf+3ejzsumYyDZ5tGAcgawTJ/yjb1lwnGWg/7cwpT9x3+sk52wir32ew
         PVYHS2YoSdcpfeQ3xtr+dNpFC2acGw6qcV6oHB893ckj5jNoefWnXxsSzDUTuCq7hkFn
         kDm8U47ce2GyL3VyX6rY6WdQRpCYBnNNUm2fptPmLTay3lqsYyRV5758p8SYCJdzR+WS
         j2w8COwf96yGVuT0gpdRNV0yYSPK7Syw08l2HvygVdLmlx1AM9DoZwY1s+SkU8owPrNK
         WNLI/NwyjIwz4nIpk54jLP62bC9F5dMvbSNOXRqkf+W9Gz/i0Hjg4ppfOdkVPm+5GO/T
         cIuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4XcKZBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020ad45c4d000000b005e10070af02si7187632qva.112.2023.04.18.05.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 05:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4XcKZBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pokA9-0007M2-SN; Tue, 18 Apr 2023 08:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pokA9-0007Lc-3X
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 08:10:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pokA5-0007vQ-0c
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 08:10:19 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so23926338a12.1
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819813; x=1684411813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yDtHyI1vdDXmzca8rziKF/Nl5eBqsY+fp7mj7ylUhP8=;
 b=A4XcKZBEEAsqX2cbgqyv6N2z0sBgSzWYhcI8V+y1YMyUXUv8NV6lqI2R+N/EA4Ka+5
 T7cOcKs9hJVO/FaSznoq7lE7Pp+rIAsyECpabkaNmWhGnQ+tZu2orWl8U4idj7IiT/Kh
 qSf6YP/dvXrpcsB8FLZjdSjSc9ZrZyVVUQEFR5TldIO+KgHtYgDOrEPgtVpT3iekupG2
 ONBqqxxBV5RWh512kEJeYNNFn1ZRZXPtF8gmmt0CuxsOP7tAaz+4Kj3N4Ugcr27KFxtK
 hGOxj1UQVOaSGW06soTSp8sAPe7fP3a3rAhnv0MbYnYBikFdIAHLg0Q3KT/dZ0R6n8CR
 uH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819813; x=1684411813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yDtHyI1vdDXmzca8rziKF/Nl5eBqsY+fp7mj7ylUhP8=;
 b=H+SAvd4j4r/eUzMwEyhu3p/ZtS+6v9nxa/GIOWalxyGZxiDWxevBql2/Ava7zrskRx
 FV36H6M0Hc9qqsvdv06POy1VL08PpDWtOsY7fTcWWyTcoKfh75fkCrAD0I7/0Jr0PsZ7
 22ZUbyNXy1jq8luiuABrX3LtiXAF42mCqroHEa52AZqoGDfPbwXIcJ26sX8HRrCUntXN
 vIR/fM8nGjcGS2c7IgVcKyM33ADs1x7/yG/OLDRc1TeqOzd3K85sEcqMSA6nNzSxDykw
 FpI4PgNdLJHdqdBNWkoCHFfrukLCQHw/zNqhxOTYAn8JW8vlNJK1w8mtrZIpLELkVvXl
 ONjw==
X-Gm-Message-State: AAQBX9fhFjf41ZVQJvHEkCe+c0o5hpSuyP33uGYoocKo90BtDx6q/iYs
 pl30ON105F4OTfALS7LuowCt3Ub6TC804WYKmqVAng==
X-Received: by 2002:a05:6402:1e96:b0:506:bdbc:e59f with SMTP id
 f22-20020a0564021e9600b00506bdbce59fmr1075943edf.3.1681819813149; Tue, 18 Apr
 2023 05:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 13:10:02 +0100
Message-ID: <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3JEd6bw1zSCm

On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
> be connected to separate MDIO busses, or both may be connected on the same
> MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
> property to the i.MX FEC emulator") added support for specifying PHY
> addresses, but it did not provide support for linking the second PHY on
> a given MDIO bus to the other Ethernet interface.
>
> To be able to support two PHY instances on a single MDIO bus, two properties
> are needed: First, there needs to be a flag indicating if the MDIO bus on
> a given Ethernet interface is connected. If not, attempts to read from this
> bus must always return 0xffff. Implement this property as phy-connected.
> Second, if the MDIO bus on an interface is active, it needs a link to the
> consumer interface to be able to provide PHY access for it. Implement this
> property as phy-consumer.

So I was having a look at this to see if it was reasonably easy to
split out the PHY into its own device object, and I'm a bit confused.
I know basically 0 about MDIO, but wikipedia says that MDIO buses
have one master (the ethernet MAC) and potentially multiple PHYs.
However it looks like this patchset has configurations where
multiple MACs talk to the same MDIO bus. Am I confused about the
patchset, about the hardware, or about what MDIO supports?

thanks
-- PMM
