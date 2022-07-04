Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3247399lft;
        Mon, 4 Jul 2022 06:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sePcQC2sQFDNC6Oht6AnRKHqf2b1xt5cvTJHM5FzW2C0mh9hcjGT/EgvolaVFMviMRHJtq
X-Received: by 2002:a25:33d6:0:b0:64a:9d22:f005 with SMTP id z205-20020a2533d6000000b0064a9d22f005mr30707647ybz.54.1656943140036;
        Mon, 04 Jul 2022 06:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943140; cv=none;
        d=google.com; s=arc-20160816;
        b=u6v/oMqs5QuljzHMZAlvktARq4Qz/EUVzNaesQbHMagB85//XLDWKwcjctP+ADqPXo
         nwf1Jf3yantWRBL3WBV1y87or6GTIoobVSrFpFvHrlcqlJMkKizhr3AaZql6qBNtt3Tw
         TpzokDmN7TmMMM4ZpKDlAJWoGuH4mwc2B4ZvnKWMwjkHs3AS7tuMntraAbxrxIT/Bvak
         9tXvUERMf6e5NDv5KaeuiMZoZ41j3aOJjwvF7ks4pXFllSJctGkDBqvv45P0VmbsxtEk
         GcRneVEH01AIRjRLfHUawLvDBwR55CdhM9ZFm2KzNMBZ8okAypIPgp5YC3vyzBkGSSgz
         71Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZhmmSDLjUSdCxWptSms/OE7S1Hchl47Y0edu4goDPTE=;
        b=09K8GiQJj40gaz1OFOJp0+BWSsKtqgd/gXb1oKeRzGPXbAHwF7htHqW56UM/bfChk1
         Z9tDHd+JSqNngf8L4hQiYi2FveJXSXD/P4skS0YGXnK92TF9863ElIysrRTR3aemnV4r
         ktmWGx+n8MF5Avzlfk1mF8UyKA53FYNHPziP+6V1dK4eCvLK2Vfx8cr5f9v8ZEGb54TF
         ZZOxOr0z5iJC82dwFjzsmX1VpueJ9Cl9yQamJtO9xPLxVq/hTX7ROO0uQaOLQKGcjrH8
         sTDiD9EOvhSEgudYIMLCudQOa/vnMpXHOjZhVWqVbtJJwcTdlA7B5k+XWhPLphRvXWG+
         QXfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4APaJsA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 131-20020a810289000000b0031c89b32a3asi6291375ywc.270.2022.07.04.06.58.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4APaJsA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MbL-0008BU-B3
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGr-0006jL-Ow
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:51 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGo-0005ur-AU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:48 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c8a1e9e33so30183157b3.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhmmSDLjUSdCxWptSms/OE7S1Hchl47Y0edu4goDPTE=;
 b=U4APaJsA9XKHEIXzGdxwxcj/YcPxZyDVbzevFmqdX5k+aIyVaTsZne80SVxeK97IhI
 bQSyuMWBrCh+/HcxHbd6OSr7kcWT8uXDORYIb5lNPo/U7+ItZg2AcNB/D7Yg9vhZ2+xW
 6SHbiNiyIMH28/Ck2xTl5XZOjeLsWJ4OsPAfaR7bwPuPnhreWc3sZGeWw2n/iC9VDQlk
 sP+OvaciqmoM55vkSiL4yTasTxk5LsI3ArK2q7T8okkqzWu9pj40dLcyxlWKaLMjZVFj
 UtwnlwF02ncuXKDCxJK2RHas1YwrzOiZU1QYxeXc8Dht5v2z8lEMcJsu2GEvr4oXSgKW
 GRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhmmSDLjUSdCxWptSms/OE7S1Hchl47Y0edu4goDPTE=;
 b=keZqvnznVJqqdvwF2G53n9K9bo8ybnRP4m+uBSs3WCwnANw8f6J4X/C7bVHFJlVUHj
 BbXQyPaIvqfoiv3vDRspQCow45ClM7EjuthkUaDUtuOPLnni4GBLZNF7IGStABc7sloZ
 TCWLxdSZx2/bSNkLJJUdE5kkmpbbzsYdPlkl4F/rcMsGrD5fU21ZBU6jb4CWyn/y0V4E
 s9/7P7vG0egqFbfw121qIbRX4hDvWqSqydmqB2Dqx0sII57r6Bipa0n5lrqivYbwbE+W
 l6e3dJzko+51bea3kk1yDBhCVmyANkZJfvDEpo5YtiW+VS+aJluD+NX3SonszTOd1iSM
 MFwg==
X-Gm-Message-State: AJIora9z4tdPWGlBtUNP4imKBo7Gy0GRSXRYsYvUzq3mUDp+bjtdATyL
 KygDiccMZjnLPi6hLSYElNj+thbZ3nSLvchc3mQeaQ==
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10082312ywe.455.1656941865224; Mon, 04
 Jul 2022 06:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-39-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-39-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:37:34 +0100
Message-ID: <CAFEAcA_dfRUk0fW6tzq_KT+eHMgLAypnsyMCZsUMRfpvn7p7Uw@mail.gmail.com>
Subject: Re: [PATCH 38/40] pckbd: don't use legacy ps2_mouse_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: geokGpVs8uwy

On Wed, 29 Jun 2022 at 13:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 mouse device within KBDState using
> object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
> it in i8042_realizefn() and i8042_mmio_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
