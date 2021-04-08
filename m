Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp410486lfr;
        Thu, 8 Apr 2021 05:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJFSGYeCFmaS709kdhD+pZ+U79J9uTteJJgx//UxZW09WteHuHgMVM2YS574dHyZhZl9Cs
X-Received: by 2002:ab0:30a6:: with SMTP id b6mr829025uam.44.1617885613264;
        Thu, 08 Apr 2021 05:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617885613; cv=none;
        d=google.com; s=arc-20160816;
        b=mLfidlpnFIRYpEZ0LZBU0sh6l2GuLHBw5HY/gP62ij9ztiZUCmr8Z87A/XWRzlC7g/
         HUZZrj1trwMH20vATYinFnLv74CfwaQd2CrJbYwbteWU5aNGuQF5Hku191r5bmNr4TXB
         +UIY5EUA60qWMSGq+qEZQ4ZQwu/uANEnHekHxZ0XL69tX+s2jkDDblZDEHGet71OuIuk
         QZMjpGdMxvizILzyoGJgRyrtrOZ9SRVYlPLfcdxPcZ8kHPDoA6Sqvh3xdmFGggmAL721
         rXxVMtkX/UIccDG+quozB3f4tSGRUl1SL4ywK2h4PZxXy9GP1+MIN3t3Lmd/iUsmXrKh
         HNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jXr9V7WZuQ1MQUo2L7X8W6+mjxPifB+3LUpeKSURTkM=;
        b=CgXsbCwzZr34xNN5/hlSTwL6KCLofJCCJ98kS76ugxkBPzITC+VBmC67xcdEg5DqMd
         Qy0IGBnITVtkBxzocL7C8wvLvTgESBARpCNu5eUCfbDt741f4G8+kL8ECvdpj6maqOrT
         4XnlkDs0JZuuYgkPuxyJLMShHZIzX/M4Z2h8c6DIp9sXrA4zy03YLqmJNKc9YBFfwfRg
         /SrIs+VfsgRaqe5WuX6sN72ztUQ7zpAEJyc127g4njH1Z5XEfkui3thhP/Ibrs40nvmM
         5aL/uV43x7EAgihQ43gyGrjC15JcRosAKf1AMT4vttXbhFFSrcV3S9RShN3PvzKJ6Kjs
         1l6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=QevFCNex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si3618280uar.123.2021.04.08.05.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 05:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=QevFCNex;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUTxE-00062S-C6
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 08:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUTwn-00062E-HW; Thu, 08 Apr 2021 08:39:45 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUTwl-0002mG-GM; Thu, 08 Apr 2021 08:39:45 -0400
Received: by mail-qt1-x831.google.com with SMTP id m16so602363qtx.9;
 Thu, 08 Apr 2021 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jXr9V7WZuQ1MQUo2L7X8W6+mjxPifB+3LUpeKSURTkM=;
 b=QevFCNexcJh5kchGAQRMSj63OU8eZQ+88KMQZenqaDdqgBvnZ+DDQLzsdLF4mN5rBh
 UZgxkcGKXzi+7SyskyDAiz/S0A0sRup/gxbC55g2v+4wptqeQs+vg8x193k/gC3gCSoF
 yqmu9Idu08U8B+Xol19NFYGzjvLXJc4Pq9bRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jXr9V7WZuQ1MQUo2L7X8W6+mjxPifB+3LUpeKSURTkM=;
 b=npUXGIzJepIKO7PrS3rrf/O1T4w7eLtbJ0fXiIXGbmSjax0bN0kXUS8WLJjLXD2Wtk
 YldWMbrdku9bX7NFyTY2YzCtMV0/kTwt8mx1kzui/q4Jq4hSr+WAI/wGDgOjpneVlmdi
 oUjpzJAC3t0d4dPhyr/hDIeNOaZ+l7PRLdmM3HWunnc+FYId7//asTZjo61DC7/v76BF
 DQqmSHhh4SJbJIiySKzSl9Erzj69szjNN4Spv1JXHEhWABY4qrdZLDRAiSEDoQMax2a2
 rwKt1w6LJah57PECj8tn2hOwfc4Qg1Vw7oow8WXFQyipkITG8AGYNC8VCYQZUtQwqG0C
 2Lcg==
X-Gm-Message-State: AOAM532M10BCjNkm/sfZMAOLCP3uGFCbQYkJq0jxHMSUUkAVBFty0KGz
 bIo9qR3ZvsKFCtWMZatHOYJGeTl/xjrz9e4p51M=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr7010838qta.135.1617885581443; 
 Thu, 08 Apr 2021 05:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-10-clg@kaod.org>
In-Reply-To: <20210407171637.777743-10-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Apr 2021 12:39:28 +0000
Message-ID: <CACPK8XfxeVAx9teUBMxcAhOYoN11pngfMW2zxJfLvGhinPpL5Q@mail.gmail.com>
Subject: Re: [PATCH 09/24] aspeed: Add Scater-Gather support for HACE Hash
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pV4ubOAAYeWP

Hi Klaus,

On Wed, 7 Apr 2021 at 17:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>
> Complement the Aspeed HACE support with Scatter-Gather hash support for
> sha256 and sha512. Scatter-Gather is only supported on AST2600-series.

Sorry it's taken some time for me to get to this patch. It looks good.

While spending some time reviewing, I ended up using your ideas to
rework the do_hash_operation to support both sg and direct modes. It
results in a smaller patch and shares codepaths for both modes. I'll
send it out soon for review.

Cheers,

Joel
