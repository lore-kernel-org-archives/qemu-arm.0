Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1210288lfp;
        Mon, 18 Jul 2022 03:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sCowTRUHUGPHOlvH1HBzPifbjypieZ6cWwsQ6OR1g/62C6HtV2j7dsM1xvjjLpQrJYtTox
X-Received: by 2002:a05:620a:240f:b0:6b5:e3c7:d54a with SMTP id d15-20020a05620a240f00b006b5e3c7d54amr3497946qkn.557.1658138733993;
        Mon, 18 Jul 2022 03:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658138733; cv=none;
        d=google.com; s=arc-20160816;
        b=UeXdd9cxHQ6fT5/p8d619Ek4axD7+/Z3Rgy/yTSHjR5jjuEGRqgX7jE4cZiurr7/p5
         LTGTFxnZG4kEaxjqsgrmTgQP2lSBeveWBL0HTrutqnv3LfqElBi36duS6P5nZFuereI2
         s4wuay4VvaLYMLCACbh5n+UlP9t04WAdX1ohnLtHiOjEbEIy6tz6cZ8SKWYF4Rz6otpA
         vCydyQraqCpaS69ka+Ydn1cGJ8Sy1SnxgHzzothI2MLy7fpLs1qAt8BCY7aN350FZQQb
         3sI6ABo7ZRTtQy7D9BBT15MX8ZuvHyz18w97w01PjyWc7kvYRrNzq6IKKnTpcmchNNPs
         8NBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=68VJoLMRPo3xk7JEV7Sc52MYOD1eudgxRw7myeOMVb4=;
        b=NNOY/hJRoOMBHC7as+6FkMvIFmtP/EQcHN5xhzhMH5m2UDcNIxRq4VDuSLfqxQcWCM
         SDoBRejsKJqaBGwV5EMxjvtjdHA6g5eVHqVCmHmeu5AFGjSaUyYlVV8ZrxXwHpFbwceY
         6fzMjQh1A0RIKwdN+7Ibpf5soq64xbeghG5KgIK/XefUZChWD90itr/+17yCfBDu0yY1
         pfzJ/AjMQyuVeCJamuOAziOgK212ZJFIkm5wwSrJ2bcE+U5vVIyMUTnZQnII7HAFezvy
         LMveWpXreTMS6NBxl9pQWBJ7V8yAx3SmiwkXOnBjivBRjYrtgnthkl1WXDu6A38VAVC4
         oSuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=nuta5DXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05622a130e00b0031eea625bf4si2183513qtk.597.2022.07.18.03.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=nuta5DXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNd7-0004Rh-En
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNct-0004Px-Sp
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:05:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNco-0005dH-3B
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:05:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d16so16247713wrv.10
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=68VJoLMRPo3xk7JEV7Sc52MYOD1eudgxRw7myeOMVb4=;
 b=nuta5DXo2fcLPrpSFSI0lcI7ULn0CauJJQVrxR/zNpHLUe7wDhv1IB9IVRlg/pnMj4
 bB8mv59hK3+KM2IGBhYZKZNs9GvVdAXPFAAQhO62LqwkRFgqWzsazhTJRGRkaGAO8+v7
 mBRVbv39b09jMIlzFR/0S9rpBqgSvU144DDHev5C4thDBSjurohXlgtCCSNq9lMNdMzl
 jCQ7mGX7NncUT/ZXqVYtqh1oqkxtMia/bFq2/OUq/nxU3jrHOSW+6SC0oALcYl3hmesp
 VD241vPdSS1911Lapzc7M+ibSUUo93I+zrl+iqFpyyibXOnGLgWPhxc80rNGuEYvY9IO
 0afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=68VJoLMRPo3xk7JEV7Sc52MYOD1eudgxRw7myeOMVb4=;
 b=q6NAHbWsO0E+O1gnVxekG3vnSfmVBGZDNg1WCii1qx7B2aAi7swqtSR3S1QRTy/8dM
 MkSmEjh6U1wvy64ZQI4agak+pbPa5BfiYbGiyHParAoVxwqyHU1/fB/6HqxjcfC24z/V
 kG18TlEzPk8U9LqajgOIS/mqR9FE29nUb4AgI8Rj9KZ+qcckAOZUB1qD1hmFLPNUkXMP
 vOXvciH4bMEnX8lN5As20hxwlfbGTWonG2kI0aYCsk7b5ujR2g2tEleMYsEvChkdHD02
 +UvQOGch50eef4Gf8Y8rpuDZB7+p9VwIH71D7jm5BT8rMRCNXGMknvWxZV5qIfYqMQ8E
 +2KQ==
X-Gm-Message-State: AJIora+APLxox9AtRbt552cgKBneaczJYXOgu6HO90Ndl3OXQMSkbp7B
 SUHZ2ihO5AzDYW1DOujo9+tYkw==
X-Received: by 2002:a05:6000:1446:b0:21d:c3f1:395f with SMTP id
 v6-20020a056000144600b0021dc3f1395fmr17307214wrx.333.1658138712280; 
 Mon, 18 Jul 2022 03:05:12 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003a033177655sm20850844wmp.29.2022.07.18.03.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:05:12 -0700 (PDT)
Message-ID: <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
Date: Mon, 18 Jul 2022 11:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gpio: designware gpio driver
Content-Language: en-GB
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713172010.39163-1-ben.dooks@sifive.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <20220713172010.39163-1-ben.dooks@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ben.dooks@sifive.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vAbAkeBrRq9f

On 13/07/2022 18:20, Ben Dooks wrote:
> A model for the DesignWare GPIO (v1) block.

Is there anyone else who should be reviewing these that
was missed off the original list? I'd like to get an idea
if there is any work to do. I've got a couple more drivers
to submit and was waiting on feedback from this before
getting these submitted.

-- 
Ben

