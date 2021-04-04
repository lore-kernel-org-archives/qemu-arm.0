Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2992822lfg;
        Sun, 4 Apr 2021 09:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqdyfqg0hnHwoH942i8HfbYTOBkY9WVO9dcXxuj46a2ViH4oxJ9Tqg1Jhon3ZPTkQ7fQtZ
X-Received: by 2002:a05:6e02:1c02:: with SMTP id l2mr17061116ilh.183.1617553257364;
        Sun, 04 Apr 2021 09:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617553257; cv=none;
        d=google.com; s=arc-20160816;
        b=WRVMpfQcPhQuTU+ErcZ6Chm2PerzQmIWeokGeGYcOqXE0U5q+PWDrCoT1wLnKWPkqA
         OxODWNndRuZ/wVNLoE9ktY23L16Bk9txJzrNmqKvcfsWCmK5vR3vP8PbAc8sJ6NConJB
         I4G1kYjzN/apetVzCw5jQ6Sg1hA3f82wwGqfwgWXiPPzRPAy71Oc4AaH612nw4Jq3o9/
         4FWoGQ2YU9jXH3jmXTAQC6qxZ8N1QzS9YyPF5Ua9yE3I0pme4415ngDyc1Ug1nECBOyc
         Y5wuErIDLrcVU2tg3vNTbou01k7HNtfGhbCGJR5/ZUIe2ikAlQ/Edqp7DAcX3T7yXSWL
         wHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=709qAv2G7+bex/RdaZ6WPP9w6UhWfO1zSd5aYZM/1Zo=;
        b=UTVkdeVC4wYXrm3X/h/Yi+RpByVCh0QbYAQ+WgpTYZJlbixFGPL1GAoop9NuPxqjDY
         gxCNQrPI1UrEvJlZBTzCbsuYwGI7b1hPbfvhb31RUhQPszAvbkIkdMUazO4AWtOBGVEC
         LZ8OyLUV31FBG36FeNtb5AkecwhXQKZrT4Ixf7oIWHOPk95oRRYgV9YHjOWaHmWAZJuD
         IIItw9mb43KJ5kLNDl456xbZvS4UynJzDyXeKV9poE7LTrQkDUGgRxm+bb89WBoUCkj7
         xkP54sW7RAaLNNYNFeEMqZvfUILLrjR1NQWWb9HLPjkNCUhZIFyURhqBsVm9JRKlxo6y
         /pzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OWlWYRDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si12702352ilm.27.2021.04.04.09.20.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Apr 2021 09:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OWlWYRDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lT5Ue-0007bg-O4
	for alex.bennee@linaro.org; Sun, 04 Apr 2021 12:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lT5UW-0007aa-Pl
 for qemu-arm@nongnu.org; Sun, 04 Apr 2021 12:20:48 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lT5UU-0003FE-PR
 for qemu-arm@nongnu.org; Sun, 04 Apr 2021 12:20:48 -0400
Received: by mail-ej1-x62b.google.com with SMTP id w3so13851439ejc.4
 for <qemu-arm@nongnu.org>; Sun, 04 Apr 2021 09:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=709qAv2G7+bex/RdaZ6WPP9w6UhWfO1zSd5aYZM/1Zo=;
 b=OWlWYRDlexXmCNcAQt+sxteWumLzml8N1Vxx4ukk90KS/o2RncEW8DfN119Lr94qQB
 0VHCEuClDIdDiRlrdZ4SeR1n+e/iCQC8C4AAxrSFp/GuBtqAakjONQk6KmZvbO2LrOTK
 ShOkY/NhSD0ymumSnKH3EWcq/A93nHAkGcVarbaSA5pMqbnV1NvGMw3iSjkE8AWdq1/P
 n95gsRR/s2oB4B9luDp/rAz+peVwbJXWBYrzMWHRSvUPTZ3xTNEuCZVWF+c7cYeryACR
 ICWHkgKpq12MTAFqICcB+o+FwZRT1mGRwaB4D+IGpJuPeI1pt/tQTsKY3Qwkq8PN/gBh
 sMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=709qAv2G7+bex/RdaZ6WPP9w6UhWfO1zSd5aYZM/1Zo=;
 b=VqwwniycLafOaCnW8tYCyM9ObefaxIPpzAzhRDT1g7ibDsPtmjgDXu/zPmVWgA2BLU
 byiQJZDChWn8vewpUyHJBCX1gbqTg5ZEDHfY1MMxOykdV37DwARtGet5vLlcb5P/5KKI
 pnImQ1bcAS8PybrVJPN1wX+LHmC4GWSaiaSU5QwRtU/ACIAJ5uJPh4VI8qVPO2jMVCCj
 2qPSi5fesWcHYu9yMEz6L/6d5eHDlI0gsCoeW28Hv7hMQ61LhhxJ0MMWc16cHqmAtWom
 ZYfKDXYDjFVpwozIAiWUs2H3TTbQNa7Nm/FnrxGSXHwcc17SPixnBVxRzzGBPzpq+HdV
 tXhg==
X-Gm-Message-State: AOAM530a/M7A8lDvkZIkLODxb8ANjdwdveRZoq8m5WABhi99SBCxMlOE
 jtVJrL3QkazjNVpStoxpmU0w4P9Z/+hY4r+kQXyNISxopOudEA==
X-Received: by 2002:a17:906:ce32:: with SMTP id
 sd18mr1061197ejb.85.1617553244342; 
 Sun, 04 Apr 2021 09:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153310.9131-1-peter.maydell@linaro.org>
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Apr 2021 16:20:07 +0000
Message-ID: <CAFEAcA-4vwYyw=oDBMOOKgGaL-t1=4JTeJsBdwBv2Xipb1BBbQ@mail.gmail.com>
Subject: Re: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JNi/rSl0/oh8

On Thu, 25 Mar 2021 at 15:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On the two machines which have the "platform bus" (ppc e500 and arm
> virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
> hotpluggable in the device callbacks, and try to plug those devices
> into the platform bus.  This is far too broad, because only a handful
> of devices are actually valid to plug into the platform bus.
> Moreover, if a device which is pluggable for some other reason (like
> a PCI device) happens to use a sysbus device internally as part of
> its implementation, the hotplug callback will incorrectly grab that
> sysbus device, probably resulting in an assertion failure.

I'm taking this into target-arm.next for 6.0 (with minor commit message
and comment text tweaks to use 'allowlist' as suggested by rth).

thanks
-- PMM
