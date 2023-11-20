Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2266839ejb;
        Mon, 20 Nov 2023 07:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT+MTIJ7u/R1EKSp9bIVHKU6huSs/sP9j+/nAezPsSs++uxqeZXod/8Swb03ntn+xhgr7p
X-Received: by 2002:a1f:d483:0:b0:4ab:fbff:a811 with SMTP id l125-20020a1fd483000000b004abfbffa811mr5937951vkg.14.1700494526060;
        Mon, 20 Nov 2023 07:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700494526; cv=none;
        d=google.com; s=arc-20160816;
        b=MeomfmbW7JKN+bEoDbUL0KMG7HARvCgvHIeiagiL5FFVOdiSUr663+tBDDqOM1mCMu
         85ko75TJtWWuLEvrqgE1ErjiCePwuFg9yyBV9kEw9DV9bURXjicsZIfvo5bWTS/hxOvB
         zbZzdtNBzZ5SQoP9VL67aBeo0JLhLQPAWTWGym48ndxr2FOZ/3mbBxfn28hEQoHjxu2b
         1eZ60DBFTaK9KGrzBp4CMGkcL3CxS+bQtGhI9Dy6wqEy1Ecem1BljlKIphMOuL7RtfL7
         eJyaJwlXyOJAwpF2Th3m5PqStUct9HyrUhKizvzhs3MmChL+b8MpxVYnZhH1D7vHLbeo
         MwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CYhnTPmXl6jUlJUI0BGlg6yM2mHdCjS29bZ7CgTP0tM=;
        fh=CBrHP2hh3EmnlRZfRrJkvLUdQSW+lA2pbDcKzKlYEC8=;
        b=MlwH6DE+u/wR19W4FJ4Halh6j/aeTu1iqUpaXDV/pll9j747jJ9ymDwAyml/O7lZMs
         95b4SDY05sNN37GxDptkWNWIuGMReO/peRFoh+oQRwJGnEP8K7VRY8d3pCL2Oa6VDOVR
         KNTMRRJrn1rDzrHiZK5j0/5o+y+G8aZK+iLXal6mx7MgD5I7CJVhwnASdv06leKwRIcX
         05Gj9FVmLx+sC8RMWD4XQH9kS44pDKWTcTCCvfgog6L3rfoWJ0GsBMcFhm1gkl3Y7Lsb
         54GlGwS9NqdPlBE6WXzr7qd3IxJSKI+jHdE9D8Ab8zGW/lmj865aRUYfcygLaeI2fGZy
         ULvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pr2I7hsk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i187-20020a1f6dc4000000b004b016167442si875891vkc.114.2023.11.20.07.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 07:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pr2I7hsk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r56If-0004uO-Mw; Mon, 20 Nov 2023 10:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r56Ie-0004u2-BH
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:35:00 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r56Ic-00029T-Pq
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 10:35:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-548d4fc9579so1303680a12.1
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 07:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700494497; x=1701099297; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CYhnTPmXl6jUlJUI0BGlg6yM2mHdCjS29bZ7CgTP0tM=;
 b=Pr2I7hskxFBzXiYk3iAo69ZiXv3l8JN4c4j1XPe0L/W9oMCNXNtWqJAanPYHGzxZxV
 PHfNp4mganj9tE/4pnfIZtnjyXWOs+QpHrKeegJwdZ47u7QjQn5ysTJYBEX4Kn6gX4o3
 PIXhYSjVtswLDZcc8eiu7KE8Mm/JS3AzrhjoeQY7nVpsjHaZgdSZbuDmWmNA+Q4vNQT7
 ShV0QhdZHkVfzod9dgh1qa4fykr72KW/BXVR1ZXIMEXIxmTSdF7SkTupLWItJzRXM+Ev
 yq5vToyhrehNWXWO5WOsR9cYN2xSsmePNBE6mTuEq4JNy+n38zX9HH1gRN2joEHWa3Iu
 DRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700494497; x=1701099297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CYhnTPmXl6jUlJUI0BGlg6yM2mHdCjS29bZ7CgTP0tM=;
 b=KnEH6al7U/z14BjFZft3slT0Pr8Xc4XU25LgDIOmcmbIidfpnn2PAW5giAq05HZLMI
 Ai6oGFpbgCTkQRxOl91u7WUPlA3Pyf6MOSew3eo6Sc23jH2DJrx6t/bRiU6YS+zOCvRv
 GuppSo1ysUzM4JYyZWiwm62pTLZBXPKOXMIWkV1WBcH1N2NvxbCEB7gmdoTUlRhGauUM
 HSsZmQtwJyW7ImWnqLBJRVCk3wTxyPBgvp+dyL57o1OLabIOCd3Z8xQiPmZbfsaqHHZc
 PxZlX1Mj+TQDgZB2CCob6ujI6eBMDCxVWgoccNaBYayWKH9GtixHBK4xKr+Iz30/FQLY
 goag==
X-Gm-Message-State: AOJu0YzUXXIswl8sfoxLty+w8j4WFkdDAfq6UmX3uc4+si9jkEshGgd8
 ZaCfdD+dDLEPqgPS4MvcY0JwiQp8+NyLdVpURSfHwe3mA1XZ+ifu
X-Received: by 2002:aa7:d1c7:0:b0:544:4a91:a30b with SMTP id
 g7-20020aa7d1c7000000b005444a91a30bmr1894274edp.21.1700494497223; Mon, 20 Nov
 2023 07:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20231120115116.76858-1-philmd@linaro.org>
In-Reply-To: <20231120115116.76858-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 15:34:46 +0000
Message-ID: <CAFEAcA-YRPL_UOu5JPwfY4yRU=USk678JayDjqL=DKQjv+SWWw@mail.gmail.com>
Subject: Re: [PATCH-for-8.2?] hw/arm/fsl-imx: Do not ignore Error argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: fFDIC2IAKwy+

On Mon, 20 Nov 2023 at 11:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Both i.MX25 and i.MX6 SoC models ignore the Error argument when
> setting the PHY number. Pick &error_abort which is the error
> used by the i.MX7 SoC (see commit 1f7197deb0 "ability to change
> the FEC PHY on i.MX7 processor").
>
> Fixes: 74c1330582 ("ability to change the FEC PHY on i.MX25 processor")
> Fixes: a9c167a3c4 ("ability to change the FEC PHY on i.MX6 processor")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
