Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2905359ejy;
        Tue, 4 Jul 2023 06:22:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFgNaWhSuP4EGr7VQzoAr1SMubqwxn6NEgWScF2FBamYf+cbItQ1H6tgZPQruoK+dP9eg3j
X-Received: by 2002:a05:620a:215d:b0:766:f654:9c9e with SMTP id m29-20020a05620a215d00b00766f6549c9emr11564335qkm.57.1688476965780;
        Tue, 04 Jul 2023 06:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688476965; cv=none;
        d=google.com; s=arc-20160816;
        b=pTe4pD0bubQ4+UfzoNp23B+ly965Aw5+D3Qb0BZ+xzOrJ7cplQCHp7gZxGyULFAq5c
         Keh3p4i6zWCgvZ6AMZvQ87rbF9bf7WWpVhYK6cbY1pKQ4tNi62/JtPLaD4b+7ANPxPuH
         O3NmWKUACGG1ZvcjjIeG43V9EQRCGRIz2Rgprc/HblRICtYCL4gEdrCBEIZLbfszR9qx
         FtprgwujI1Xd2rElgK5bcWgxJw7ELFXSYzju0y1uRt7OPjSBP8MVKO4ywRBw01mzSoNX
         34VCTibV8nE7GwAUwpoMqLJfyaTErcQCTyM23vaKdPhiZx/iKpigfibxlpJwBAZkYuct
         8zDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vAMnyiMorzcHURg4qxEa6kQulnu9dC4YyPQVn8sMTLw=;
        fh=i1DxsZ/26FhvxoGQfPI9dADRJ5Z1GhDZWHraR8OaoTE=;
        b=A8W6/frxlq7pUqub2hfMhFp/KdF2P9ZaU3LWS0hN4sFANWKeCuwMkUxkRbjgjIDzyc
         R59f8NCnDMo16TzyYaEOw4TVMJrv/PxJ/JL+A+JF13TVkfSjnU5c2LmRS59nwF5C6w15
         VPIR6Nto38PkFOTdsmsUePAREqsRuyN3F9I9Nm8iYOtcnHcv1UBot133UoVGfrNpHWSV
         urbBE6JFvC27OEcNgGHxOFMBJtCG8lVWwVwM5lSI+gSSTx4KatoyhAFUcE5JgcG/UGbX
         gaHLPhy7TXEyX5KZE3rJwc1AWIrQtjKd4NS02SEY02Nb73QEowu92oBNCAUUMoNAkFxf
         D5Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PdpNgnN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a098a00b00765a959938csi12207818qkx.699.2023.07.04.06.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 06:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PdpNgnN1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGfzP-0004SB-L5; Tue, 04 Jul 2023 09:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfzN-0004Pr-Mg
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:22:41 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfzM-0007zk-1A
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:22:41 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f766777605so8723296e87.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 06:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688476958; x=1691068958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vAMnyiMorzcHURg4qxEa6kQulnu9dC4YyPQVn8sMTLw=;
 b=PdpNgnN121Ac/KxhnfFQPJ2XHtKIHd7D2Li8MBLD1leu6G51X7CGnv8dE7HgyaE431
 b+uiXjmd55ZC6PYTZ32X4BwBO/ajM3PKOiwF0skLZwD56yZBB8/2o9z9YKAENz2+OLrX
 zftjE+9Oc9BvJo+ENJboELvoqGdDJQkwJodCR3PPxcYNNE331lznjM1axy7vK4VqpdZu
 1T7Ve1ipR4OaS56zy8hvF+lFoseUa0IHejMe1Y5eSS1FYH11WSo2sgSial1MWPnzoePI
 J1YIp7oF142LfJ1E6Gf6Dy06iN5sbszG2aqxX+FErjcfiVHr2bI4hSpGKGkhPjcyP3Sk
 jU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688476958; x=1691068958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vAMnyiMorzcHURg4qxEa6kQulnu9dC4YyPQVn8sMTLw=;
 b=R9SPWSx6+1oTzevhBVjllemhSaGZ8VuJUZpNJcjHgS1uurhTU7rW9XBiEng3cxtt8t
 9g4stMyld+tmbvYg2KHhlfchdf2/cmN+0B/0poqLw8GDNJgYrDmBD2htHGKZdTBa/cBI
 mSLA2rbbOMc5iJtbk6Cd6rscTD77qpSWV1dSQ4tNkHh55J+Pm3JITZLOAc6sUDSeI3Gl
 rhfa0lqVZGXZnfVYTuMxvJa8XXM2F7VHv1bXw3U+I/WcsupRBLmzHksqrAv7HlARlJNn
 cepCXvlrTuuawvv8E7mG6oXI7LUJyGYe0UMPTz0momtODRC+Mt40wxvVLjP0ZaycCMRe
 h7Wg==
X-Gm-Message-State: ABy/qLYlWWWIs16zy7VaYJPv29BwUy83CJvQDIaXmSZ/cTEwGNwcZN61
 w+bx2WaUrUsDdvHy3TArzifPaLYso98TNb2ifxIyvQ==
X-Received: by 2002:a05:6512:2815:b0:4fb:893e:8ffc with SMTP id
 cf21-20020a056512281500b004fb893e8ffcmr11000733lfb.17.1688476958394; Tue, 04
 Jul 2023 06:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230628110905.38125-1-akihiko.odaki@daynix.com>
In-Reply-To: <20230628110905.38125-1-akihiko.odaki@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 14:22:27 +0100
Message-ID: <CAFEAcA81c0tnHfsMfafO0+hTViYJO3XuLryJKzPco7k_7M2ENQ@mail.gmail.com>
Subject: Re: [PATCH] hw: arm: allwinner-sramc: Set class_size
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: u/l4dNwcAoxV

On Wed, 28 Jun 2023 at 12:09, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> AwSRAMCClass is larger than SysBusDeviceClass so the class size must be
> advertised accordingly.
>
> Fixes: 05def917e1 ("hw: arm: allwinner-sramc: Add SRAM Controller support for R40")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> --



Applied to target-arm.next, thanks.

-- PMM
