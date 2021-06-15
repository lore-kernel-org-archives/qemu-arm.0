Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2923762lff;
        Tue, 15 Jun 2021 05:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx49NeL1i8T6SORlepba4Eg5rpa19tnzfk0mD7fo2/F/2k50mrpzk56P8wwXR2SudJnxAp4
X-Received: by 2002:a05:6102:11b:: with SMTP id z27mr4725482vsq.8.1623761750040;
        Tue, 15 Jun 2021 05:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623761750; cv=none;
        d=google.com; s=arc-20160816;
        b=R9sh1hkn4F7pmgxt1+ks/JQ9mus2lTiTvXssqNj/SJ83M5GRMmKHS6X552qrbwtIpS
         Q4pUTWrdMU8ZFTyQcjcyF+EnjF04oTn2mQA4p+Ca1hKia+iK49cQQ0SvPqCM7xbCST8U
         tywH4o7MVK0rX+ICOd3AjtKfp1KG9fBS9A7E2RMYADWr4Zk7/7FH68pXYsdtrwTWsCgv
         axNFAAA6NCN0XoZLGcEuMmqICfJ22HAY+IWWrZ460a4zatXDJMBVfJ791RhPvJqByMCG
         b7/MgBSKJHMHyM3XHYeDcHA1wWEPZvCKN7V4Kq4PhRyEl6oH9/dO2ml9SyUn8Xgngibo
         jy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmwbq7fCaR9bueBB4agxnlkDOrnJX8w3X4d5mdJlxXI=;
        b=pax0YY4wNj9GNY1utaLznlJ0Nh9MlQdSo5sDrRsVoPoC6pqOlHIYJfvrcFuUGiooKl
         aXRzHr2QFwcf5DbhKVbjVNAPBvfDL0tEOUf9cS1qxvH6yPDkFSKByidFLqy57lvI8HDb
         rvK+apkDssGA9QGV0p0oTKzx/pzYTxkIO9SdBTB0p7CMKE5Lm5jRfpeIYaPfkWESRAqX
         CcKbs5jwRaLs9RgoAB0dihCi0/jYsJr3tm7DW1EVcQkF2l/dewESGpxfcbXsl/MjFnWG
         sl5tU+3FFa/LtsgwIU6So2szqSaPwuGSFfnFHf3UPX/frI18mvGkD09wtU2yWs6ckeVD
         ALYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mcM51RFC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si2143649vkk.29.2021.06.15.05.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 05:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mcM51RFC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt8bd-0000ZW-BE
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 08:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt8bQ-0000YW-Dg
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 08:55:36 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt8bO-0000te-Tu
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 08:55:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id g8so22419676ejx.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kmwbq7fCaR9bueBB4agxnlkDOrnJX8w3X4d5mdJlxXI=;
 b=mcM51RFCOUhvdZ7iO393ins5ABJNpEDwTzioAeGQKHEKtP59hFFYVvRE9PRXr/Zpma
 2xJB/R+Fki1V2ikhA9ngSFYqFFAhOWVktbE5WyhrCeNX18h6mE7h4HM3jNTi/4ZBFCnn
 Dz32TB9GBBtW1BjxToIj6Rj3rIU2QzPbgF/8lNF4lIuaJb1lrl7iI589sV9Hf9JMHvZo
 gyiCuGtq/ffhZP6MhpkhTuytH2MJvdWcp1h9y3NuZ6XXdU6vKbcrJ6M+7k14kw1eOeZj
 +I9JAqDaP7BELMRWxgJNoS1JK/f7B3ozB9ds5z/+st3FfK+B6pOd3fu0GZGwavdPAMMr
 TQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kmwbq7fCaR9bueBB4agxnlkDOrnJX8w3X4d5mdJlxXI=;
 b=gNYZ8+duDB1/9dSBtOxM3MZYCZQ/AzA7Rh3lBk0eyluX88MT6FB2rjApc7ztXU4y5+
 Ey9e6W+DtlHaReqrVvyN71tvULHF66ydknLFCyFKYPbyq7ZTwLosP2//etftyiINpcUj
 z9H4nXjlhl2s5+Hr/10cfcDkT7JUbWT8m4MIy6BCXXT+qq6kWBcuFbZmo6GifSXI1rNV
 oSbi/jsFX2BD86kzT0jtiIqJ30dxifB2eizVM9B8E5OUnQWMaS27K+bdo/9BkhnuZqUV
 c5CMBKYPXr5eX/XsPE5H8gflDRljY0VDSEnFZ1v4sV3nkAQT9C58fUb/aPZOVkIiv3Ek
 9gSQ==
X-Gm-Message-State: AOAM531y2ZUaN0x4a6UaquMTk70j7UwAWts8mrGkeGNJrAPOM5oGaXOx
 MZ/BGcyIyVRL4Q9YixLpEJlMGqFIts6HJFQtUNi1hA==
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr20806336ejb.482.1623761733429; 
 Tue, 15 Jun 2021 05:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 13:54:59 +0100
Message-ID: <CAFEAcA_jd-htXgeykbpSDQmv5NwJNhJSP8fi5Zo9xTrTvBnoTA@mail.gmail.com>
Subject: Re: [PATCH v8 00/19] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHX5D3U0OV7x

On Thu, 3 Jun 2021 at 14:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> I haven't had time to review the tail-end of this series yet,
> I'm afraid, but these first 12 patches are clearly all OK, so
> I'm going to put them into target-arm.next so that at least
> that refactoring part is in master and won't go stale.
>
> The last 7 patches are still on my todo list to review.

...and now I've gone through those last 7. Sorry for the delay.

-- PMM
