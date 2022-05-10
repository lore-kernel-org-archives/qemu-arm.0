Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp4211615lfj;
        Tue, 10 May 2022 02:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9WEJXMTP7n3dmPPP7jzfGm+xXybhg0dxSFfZnqU/Ratq1nA4ikr/d5KqBi6wx/uTCDNIh
X-Received: by 2002:a05:620a:1a14:b0:69e:9090:a7ba with SMTP id bk20-20020a05620a1a1400b0069e9090a7bamr14811987qkb.582.1652174385700;
        Tue, 10 May 2022 02:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652174385; cv=none;
        d=google.com; s=arc-20160816;
        b=i6sBBaGoSj3rqzppBE2cf1jHxfIevfatMf1+P4QQWg2q8KVnLGwV2Inan/bkmVjeTc
         aPp7CZOfbmJhYhiP/wRR5kKlqJzHn2tEBjyDr5labTnEtQYmp78Z+PretZeQ6TjV421h
         HuoZlno5ctVJr0s84AboCT/HUQPo9LeeQDtcecPTe6OzXZMWag3W9c0vXZHwESElSbIb
         gmLpTSOejH+LUCLVtPZEoilKs+njARlYjjaFxZHW9Wg5l2IZqquqVYxghO7Vkl0zNXAi
         KBsZlM+vwvGBh1j4Htn1naz6pRpXtXUonc4peGhOsmp/SRPSqDVxeyXvh5f45CfPvTq/
         SzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pzv45RfvjbHQF5TORTm/mZZkiglHz/F2Mts4FfACK08=;
        b=KNHdjh9BbtN+yDN+BFGKKvVwqn1h3YnMAniyOXLbKlGDReRQUxa6kw8kUdfmK2qeiP
         wv6ngtU65Nrf+NEyuL2Th2MC6R3/day7DmVCB/RVrWDGTNBYPaGZwzh6lKakOwFd/+jB
         8Jf2kj36iHHGJ7G5TZ3Ng0JI20muAMriSsnIQl67l1AmUqiO6hvIAqZxBiswqINgx5j+
         QrnvktBlsJ7ZTo1Bm758BsbSEbbgkKDsbBjm2Xhf33be3seF+LelksSs6yrzPGgTlTlY
         dfI8IQFI1kbT+AMCyl8A5nt3r6EuYJMpAvnY1WyghzonVGyHzA8yGh3i9cQl+DErJvXo
         NgiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZS869B5A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28-20020a37ab1c000000b00680f5cd5076si9240007qke.683.2022.05.10.02.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZS869B5A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noM1x-0000Qr-3N
	for alex.bennee@linaro.org; Tue, 10 May 2022 05:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noLsB-0006aI-BK
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:09:39 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1noLs9-0006Hb-0q
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:09:39 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7ca2ce255so172025987b3.7
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pzv45RfvjbHQF5TORTm/mZZkiglHz/F2Mts4FfACK08=;
 b=ZS869B5ADwLn/i/zJCQVYU1bIOU6CsIwy6XIIc9yrLamWxhkWlACc2CXa8xQXcVpEg
 FEvAkvMsMomCTlHvkrL3vTL3zFVj8aVYRnkbzcLv52hvt7M3Y2XhmU7T7cZjI8ewD+Za
 7n3ykAr+tIATNN75uYtP/p6OQbyabvTgXF+zxFZlyPOtF7ZfezNuW1vGrwehog2mqZ0z
 LTGRJGVZJNNPvMgcE5b3bT/DYWnmIfA/uiR4xDtCtO6nn+tEqKIO9Qi3u2CKmiTQdLRu
 OOLraOZ/hJDfR9KNB3OIvcIAY6rnkTgzAgAUVMcwIocXWNCdT2Ug5FUTSEdDiax7FNBj
 Dk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzv45RfvjbHQF5TORTm/mZZkiglHz/F2Mts4FfACK08=;
 b=G5G9whFF+iZY3P2GJgG4NOnMajt3sCeW5FnMX5cYPh4JaBYVs8pQxP9ekYJt4f4Xjp
 4YxDDCnHCmXExwKAw2DuSDuFgRQ8FQWt14e8NuCN9X6hNwbMThzijAEaG8Rn9MnMViq4
 aEyhPuOUYLvJwDHYT5jMiQEgHBNWvQpn6VIZObweNVWXg6f6ojuEKBmiroPdBoyZ/6Qo
 FcemWH24Y1+WEtdwg12N/opdWvIbq3MPWwwa0cisSb7EeMvwk3PsYt2OPlL1ramvBRgm
 s3zrq0+mkYrLsOq/IJMKUBikA6x8d6BRPQN1QnHXvCjrBhdtvy4XUP/88mOXVIbcH0cI
 R7YQ==
X-Gm-Message-State: AOAM532BlO90k5+ZXZZBpVqFj2HTezF5U83MSb0hC2IYz+QnOr+di9M5
 6RGJJg9beqDMT3X9xbewjfsf6jVfu17PkScjCUA91A==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr19110273ywf.347.1652173776051; Tue, 10
 May 2022 02:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <20220506162129.2896966-5-peter.maydell@linaro.org>
 <CAFEAcA8bT_LzFTuuciWOUEVnozpOqySrpr1pkZ76MGEk4NK2RA@mail.gmail.com>
 <TYCPR01MB6160896C1CCE56DEDD44393DE9C69@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160896C1CCE56DEDD44393DE9C69@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2022 10:09:24 +0100
Message-ID: <CAFEAcA8XGy8_HDrEihJXSYQCc0uvxDFbVTx7WGVxRYf2R+bJpg@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/intc/arm_gicv3: Use correct number of priority
 bits for the CPU
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Itaru Kitayama <itaru.kitayama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7bcbL65q+/WI

On Mon, 9 May 2022 at 23:55, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Peter.
>
> > Shuuichirou, Itaru: do either of you know the right setting for the A64FX for this? If
> > you can find what the hardware value of the ICC_CTLR_EL3 or ICC_CTLR_EL1
> > register is (more specifically, the PRIBits subfield) that should be enough to tell
> > us.
>
> The value of the PRIbits field in the A64FX is 0x4.
> Therefore, the following values is fine.
>
> > > +    cpu->gic_pribits = 5;

Great, thanks very much for confirming this.

-- PMM
