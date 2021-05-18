Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp802652lfm;
        Tue, 18 May 2021 14:44:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8VJSMk3Jhf6kv2OCIjydfRFUTetgYWXjV+VOWmelscdYqe92uWaw8n50lEOxVnHf9Ihqb
X-Received: by 2002:a6b:5015:: with SMTP id e21mr6301920iob.104.1621374299303;
        Tue, 18 May 2021 14:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621374299; cv=none;
        d=google.com; s=arc-20160816;
        b=JpSb5jnF3TxJlDzT115yNGS2kTiVlXZFkJMnGiX65YsYTILteZhmEi3YDIls5bEK9s
         iiLWxTN6+JktQxQMaa0j5HKVcMvjmlHetn6TZtyzYn7qyrC9HWmagKb5qHfv1X/c558G
         SUB+d7OGkRKfUfp/N1UddX1W/hOFiYeJiFeOM9lbOtSwHP6GjJXUNDlrBeV4LumCmYhO
         FjLjo5TaStDz+TNTkhukZ58l10+SCz/JJ0TLJluCx8tAidHa40nSv87KJH5Hw0yU5YHa
         bp8RcCWYT/1pTkHwLio2LBIff7tYd0kpHn01jDcv5xq3kEnaIy+jotSBxieocmtkXewo
         NfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=++hAhtO4LPF1o2LlzQdmUXQLn2+1OzzrGNr+AYgwRSs=;
        b=wOk5M9x5sDLJEkt2yr05wBSwsjtCalbqXQgjOpj3eMU59w4L68L1u0vA5G4pgLN0qr
         DE04vHXtsVNlhKDtVv1NnaaLS0yJx74BmP+jrfIpCqyOgrz/OaY1+j3rKu11M3nJ6mii
         FxUtBWr+9ub9gHZS4oK+y7o3sUV8pYmXRcSlAIcrxLtDz/rf3Ta8ftUJsaZWMvuoshbm
         nv3NAlRMOIg7Im5DmUYlYNHJ1har58ImB7MLPXY9H+1Ayp8XaySXzneAO3RBHRYT88Li
         fPhDeVI8d1Pb743vsp8j6h4WLh6o+f44uBx8rUoMEKcnj3hfhmXuxygJnE4/6LKHMXhv
         V2qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cl6H+eCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si21147226ios.97.2021.05.18.14.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 14:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cl6H+eCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj7WI-00033B-GR
	for alex.bennee@linaro.org; Tue, 18 May 2021 17:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj7VV-00031A-QS
 for qemu-arm@nongnu.org; Tue, 18 May 2021 17:44:06 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1lj7VP-0003qU-FC
 for qemu-arm@nongnu.org; Tue, 18 May 2021 17:44:05 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l4so16837123ejc.10
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++hAhtO4LPF1o2LlzQdmUXQLn2+1OzzrGNr+AYgwRSs=;
 b=cl6H+eCy7mQGyVJQCOOzCvzmaiTsKpFqt+tDhaZIQHlTegTDhm/5QUr9YtoRejJ+oe
 pXGzSoe86ZSnIAKtGFwUDvx8V9DPu2GsdkpOP3SdzCi0maU40tWiv9GIQtuRvXraNag/
 fsP7KhJI4OCEkGHdBxK97xEv2oz/2Hksmf7AAz4l004SKHQkZhYToPuxyPxOasL/Liu7
 JDvxuDYSMnhvFamacoKPXIQBysePPltY+TKSxBWmiVEonzPS8gZLfA/dUlXx6cJrQl3o
 IW2SFfTl4JM5/2RmDIH0qcqa5IPA8gX1DvJzhUHr6dSgGSaI6iuWm8IxZDNWMGxo87tr
 daNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++hAhtO4LPF1o2LlzQdmUXQLn2+1OzzrGNr+AYgwRSs=;
 b=pIO29s5M+i0FBuMy6MhvSYf0o/URrGEWwU8AKzK9NfYOBnbbvJ3p8y0XRuD7Yxptkt
 pYE3NLdSxIseNIq2Jy+Ey7Qg92wBTOotzH3L9jPJ3wx4oJQc0VwlJY3tGxbT3+YlQCbn
 CzatW9KY9wi8ynpbSsOb+ZciO+uIcbQqG7miGeVPBVMLFz0MqpqtntwBA/uk2RUOdn2i
 APuNGLVtqMsF8xYp10IS6tOITPCmfLHZ+BY7OfLWpbJMjzMx6f6AWMkfr0w9WTSV5VUs
 oTVrPL1yBJs97euMoJmJnEdRQaGCr/me02ZndOGNI9sXe06Y5RXqg95ikvPV1rKRLGRS
 pi1g==
X-Gm-Message-State: AOAM5327TcBKukh1tsef2ShLcTJGo2Z3uybAQXyusqeRvzrI4HwgYd/C
 242ayWHf/w9nPRVdPVn9NgFwzpklb1Mtm9kcNKuwow==
X-Received: by 2002:a17:906:56d1:: with SMTP id
 an17mr5835058ejc.6.1621374236339; 
 Tue, 18 May 2021 14:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210518184527.1037888-1-titusr@google.com>
 <20210518194518.GY11196@minyard.net>
 <CAMvPwGquxnT7RDOVCeXG1Jdjg1hU+a1-20Pu4c7ufQDytbNHag@mail.gmail.com>
 <20210518205951.GZ11196@minyard.net>
In-Reply-To: <20210518205951.GZ11196@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 18 May 2021 17:43:20 -0400
Message-ID: <CAMvPwGonNtKeSwbLpUimBJ6U_OOjiC_3N_1t+L64uce-or6oFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add support for PMBus in QEMU
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Hao Wu <wuhaotsh@google.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=titusr@google.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wl3q0vpE8quS

That would be great.

On Tue, 18 May 2021, 16:59 Corey Minyard, <cminyard@mvista.com> wrote:
>
> On Tue, May 18, 2021 at 03:50:57PM -0400, Titus Rwantare wrote:
> > I would also like a directory for sensors. There are quite a few of
> > those incoming. Any objections?
>
> None from me.  I'll add a patch to move all the sensors from misc into
> it, if you like.
