Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp560257ocs;
        Tue, 27 Sep 2022 06:25:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tTio5YfWZRmI0zpd7J7YGMV61Kf59ZhVqTtt1CKrlGFFIHEYFFe3tLUl37je2e+aAUZir
X-Received: by 2002:a05:622a:510:b0:35d:50dd:3062 with SMTP id l16-20020a05622a051000b0035d50dd3062mr961682qtx.437.1664285130530;
        Tue, 27 Sep 2022 06:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664285130; cv=none;
        d=google.com; s=arc-20160816;
        b=YhZfCHokvLsLcdXZirwWZaSauCfiRuih2IiKeCgsrSXroYOzYyhex/AORm6mNjOryQ
         uiVZkl3isPGvIPnZ3i4XydPXraf1FW3ZDyQZX94uH6knj2+E99EhdEzPUhM+eLaaYCK4
         F7WR/ZYyw9Qb3nSQ8Hl1ZnsJ85RAVeAR6hJX5NpYZkEeUh6U2tQHpaThrmQTrgvrEgKp
         NI7MJFMHyqZU5H+MRkBCgv5Yq2AlDsxtWYprSnjVDnkd2KwY2Jbjy+Flb9+OnLmmKgF+
         on0xTp5PgQy3CYsPm6vCLo1w3r3LscZJuhCwkiVhuJzOWPZHP9QPmgPLuJEubAQ5GCVk
         8WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p5xB8UromlejGrqdx5oSXIOZz4Pw0Ay2LHwSmOVYuuo=;
        b=PDyCB5Br1+N3bOw6brJYH3wSLzWlRa9cHIiFBv2KOfO8I7wBmdKlHIThSnUlHRKpgI
         H1J9nCJMQw51vDOO4u+NAhhNxFwVmDtK2tpJtYL+bEOJE/Z0UoATr477NbMZ33oMYVCT
         9psZA7tdiHp/9zVBNYhHNKXJUbABsaYXt5TMKvxtuE/9W5jgl6V19SdimXc7dSezqwxT
         ecCvcSKiKrkKYdsTLQi3XB7rzLXYq4dO2t7ilaXdJI1S9D43xO1A/dAMT4ZVKbfOxDXu
         Lppebh/F3CeBgZKdK8/+Ti5jtr68nE2cSETGPQn46SewUyOjWHp9RggdrKw4PkpX14+X
         rxTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xLp/NC5T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140d6700b004aaa28c1e62si965498qvs.403.2022.09.27.06.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 06:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xLp/NC5T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odAFU-00070o-FB
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 09:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8nX-0003Q6-La
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:30:55 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8nO-0002Lv-Jc
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:30:42 -0400
Received: by mail-ej1-x636.google.com with SMTP id nb11so20021953ejc.5
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=p5xB8UromlejGrqdx5oSXIOZz4Pw0Ay2LHwSmOVYuuo=;
 b=xLp/NC5TWD1cxArYsggRc4sSaJd2IxhdORIavQjEBwLaP9uwwTskscoRc7Tnw/X42R
 21yxK0PQzsxYbIQwn5HUB9KEqOPrA6STr1fnooOt3e3CCs6pI40Ny3NSxFwUSmXIvA4u
 y7jbRCT24VXsA5Z6KDwGXqsVYr8roIMLIOPkvS8JH8+cI/JTatOAAjn5oABIXJSnABx0
 OT7R2jf3b8FCh73gXph4lyN5GX1Uc+krZuU6dE7kK292bC5CInQi+PLYU/M58woO3RWO
 OAnAkuadYOmxxFaGUWdQWh0GOESjGaUDkGerJ9DTu3MWTAj5CpFglmTmwCa273wORtHj
 Ymrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p5xB8UromlejGrqdx5oSXIOZz4Pw0Ay2LHwSmOVYuuo=;
 b=p3JaKBxk4vJeGgRg0oQKPOgvNoTfrMe4neN1TpF1cf1KMCVHjFTLEAE43JN41J+QU5
 dhVAP5tkzBeJa7CdxcabRgcf6aPQyV+QFyHVu7sU9REQEn8PYPz5HZhnf0ypmN5q9l89
 LEvNpUVHqp08cwHLalqCp5bwhBFC2Rpd1k5HP6TkaotJsAJM2wjflgOjBAiHFGOcFRxw
 NB9u6exoHEAc4Bpx1x72ZBok0wEWvGXKLb7Q1KnQtmFv85QeREXszj94GO3l2l67lj8h
 fTSHKSBvTddM8fqXl0rWK2LXZU7CuXrJ2Q/g2rvVsd8zQmFhk2Wd3mzRwPZRsWPbRSXH
 2EYw==
X-Gm-Message-State: ACrzQf28wXDngV4dO0JnUsoMOKodPIAK9vEN3Xq8EOYDxgwqUMAr9HTd
 YkRWxO5MGRyM4JAarXTawLIgepZxxhdP7oXTXh96UA==
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr14095024ejc.555.1664278225196; Tue, 27
 Sep 2022 04:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-2-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-2-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:30:14 +0100
Message-ID: <CAFEAcA9e_5jO-HMgy3XbTEW3jG1WRJyb+OmPR4V=R6b=2knCXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/arm/virt: Fix devicetree warning about the root
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P7Uom5t1kd1i

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The devicetree specification requires a 'model' property in the root
> node. Fix the corresponding dt-validate warning:
>
>   /: 'model' is a required property
>   From schema: dtschema/schemas/root-node.yaml
>
> Use the same name for model as for compatible. The specification
> recommends that 'compatible' follows the format 'manufacturer,model' and
> 'model' follows the format 'manufacturer,model-number'. Since our
> 'compatible' doesn't observe this, 'model' doesn't really need to
> either.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
