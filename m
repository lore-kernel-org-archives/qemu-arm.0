Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp96283ejf;
        Wed, 10 Aug 2022 13:00:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bz5s6ef8p5f2NF41ROn2Q8D2ItqYp8tWOFzEOpx64Ds+PdF0bBixlYb3DZtnTPR8PiZAK
X-Received: by 2002:a05:620a:bc3:b0:6b6:5746:f91f with SMTP id s3-20020a05620a0bc300b006b65746f91fmr22522609qki.391.1660161658682;
        Wed, 10 Aug 2022 13:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660161658; cv=none;
        d=google.com; s=arc-20160816;
        b=xfJc6nMLjKSLg0Ha5PtCMYzJYqwtCNAscJ/O38ZAHNPuoMdZ6YrvUyi8YYfUPnYiJm
         4ezeYoxLRqvRF6zfLeMnfezX+KbqE/ZpRE7i/lo+7NFca55c04ii5b+2c7rW5WltGUyy
         GlJ328yIoNsT9OyMgiH4O8GKjmN5X7U0+ERdaEJkb4W3r5onhIJpHyUO0/lKWzGBgNd+
         x0QbuQApkYxFpHgF6sGj6Z1E2BeNMNuYN+qCxvL2EVp2l8dRFgtYT+vmDpXWGs43JjEw
         ioh+JPdaxHfVOIdUoyetXZ8CBc0dvdI+XnRNvl1bqeJZwyp4FlfzPoRjWZXtGiWA8drI
         Vz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=ou86LLdED76z/lbLFTbrzGT3hDQw3Ch0izyhLgn8VMo=;
        b=svpRjRNoaH7WDm/hrkEpH2gHgyP7dbiceeaMX7M6t7WszOeig4kAd6/lVlI5aHo5NU
         0RuazLwB8MqfmZn7GHlUxFS7RWcD1fn5bNZn+wKQMAvlTRUzKBf1NEQNqUiagB488Ban
         L3Dd5KULnF/sgzqGJtl+nndnPe0+mnR40axI5u/hAmNh/Dtj5ZgvZh2cE7RSfF/bgUnH
         ruCIsUwuyAw+SYqIL85C1GJ7JR0pwA48BnkajtzpVo4uErPewCAKJ3BSV5xPHMz4kqnj
         nAtMO6cQ/Nv5v/cARy3pLys6mAtxL+1WP5/9ukscK4vE7PPne+TYA5nMRVwfqKk2JFXl
         WA6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=JuHk75Br;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj20-20020a05622a259400b00342fa31b715si428017qtb.691.2022.08.10.13.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 13:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=JuHk75Br;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLrsw-0001Kb-6l
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 16:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLrsd-0001IZ-QK
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 16:00:39 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLrsc-0002Kg-9E
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 16:00:39 -0400
Received: by mail-ed1-x536.google.com with SMTP id b96so20555459edf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 13:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=ou86LLdED76z/lbLFTbrzGT3hDQw3Ch0izyhLgn8VMo=;
 b=JuHk75Brkl8Qi3JDXJCwLQWJppk8b8KjcqyXc+pteTsGeCskadFfin50jvq+c7rWBD
 vcvFLXteO2Gd1QJ/3fZxrBdDLKGksJ5fqoO+RmirP2V2BmwOhOqbMXXPqeE5SK5cEAbq
 Tmw4HtjuBFMyYgutDO6xlDnl1cPCh4o7A+F6wjtqQSvE11LWv/qirlNQIImQCApvJd/q
 XQgc+oczM9HjifGl4aRvEz/JB3IZcmQjeflSnJ2wgg7Yt/7pRE5ab7+jRNkB0/rwa4Jj
 rg3uzDh5z49VZjh5QwNuFk8AHVLDiH+BWrz9P8t3UIt4BBuFjvBNFaAJ3gMbb9e2bwCk
 SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=ou86LLdED76z/lbLFTbrzGT3hDQw3Ch0izyhLgn8VMo=;
 b=fvLTgx0RFf7wTTrxK3Ymd5raJxgrtvUb+tx1fyxWOSiiQ7tB3ST+PbyAvHQ20Yof5r
 NeEBt3ZHiK+vwWF5yvP1nS0mQaqoGyR54uAc9CPonYoVcJ0gIpoipsiKfHEck2K0U9MW
 td0rgGC3jKE4U6zhmc5IRACADO4gKee4MtrmIJqjVrO/cwGn1GZhe89H/yegPqaSF8aF
 2qIVGJDAmFPiFmIwDIe+H45TxmZDXjy+78GIFlzj04kEfLYTDSn69jlzEg5omrFg3Tuc
 Xh91tBYHovY4Ezq/aYxFOR8EPEML7sYbabnHheJWczfUx4+D6l/s6NV3AhqRNm/VUsX6
 Io9g==
X-Gm-Message-State: ACgBeo2P3SWZxVg79mkaRzjD3UPCXhtqbFesHbIX3rV30xm3McP6a6zT
 D1mbPNaxxp8F6VL6aAgfglWsvEdbGkq94I26WBzXLg==
X-Received: by 2002:a05:6402:354e:b0:440:5398:cd65 with SMTP id
 f14-20020a056402354e00b004405398cd65mr20241515edd.43.1660161635673; Wed, 10
 Aug 2022 13:00:35 -0700 (PDT)
MIME-Version: 1.0
From: Vitaly Buka <vitalybuka@google.com>
Date: Wed, 10 Aug 2022 12:59:59 -0700
Message-ID: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: richard.henderson@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000090edfd05e5e88075"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=vitalybuka@google.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: NcXrYYox+g7p

--00000000000090edfd05e5e88075
Content-Type: text/plain; charset="UTF-8"

How can we land this one?

--00000000000090edfd05e5e88075
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">How can we land this one?</div>

--00000000000090edfd05e5e88075--
