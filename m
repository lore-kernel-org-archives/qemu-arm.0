Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3847806lfa;
        Mon, 2 Nov 2020 03:36:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoRDddO/jsHzlbpjNT4uRnGUxGnyNdrXPldmruMjmUsSEwThj9tEOFWddYA7mD32e1Vlwn
X-Received: by 2002:a25:9009:: with SMTP id s9mr21309623ybl.471.1604317012676;
        Mon, 02 Nov 2020 03:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604317012; cv=none;
        d=google.com; s=arc-20160816;
        b=Qx+fyiIwdW7gYqtgNZyWA40r1oy1VR4po6U83FB6r8/G9A9GIUns0y0bXDSwVE9Qhb
         Mwr/80EIu70eoMr7Hc996Ec/qBkyU7kwfmW1r3Kl7p7vC8N8FgSEckQfpxCvLK9Sf/vM
         J5gaYa6E5vcUCOmOgrnAi8BC2OwjaVleJN+NWFM+PlHMtZ3aJNfoDi0DsECb0efeRRid
         BfEfgXUfIUZUZZkDdMgEBhCMewTIWOCy3xcN9Y7ssxw8XbpsxX+kBGgvJQSifDzKkAF3
         jyRkWkezlHGVG9DaCYRlmpz9InoFEsZfPy3SvLOhKnRWDuuKObqxK7HZVaXAvhPPfSPT
         vVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Bq73EWlkdB6KKvewluwtnuT7qQVmTu5Re/ZsXBEA+w=;
        b=Fkl3o2jNZ222diQp++499jKQZX2PJZd+ezWPxVKlO/rtgg8emLSBsOOU4RL49H4cC1
         gaXXDX0jYJYvN5kPPvGShHeIUXSGCbqmoX5sSj5oXJcPE98+SfGWzSEsYxsBX6f1lqFT
         Cdrm9z/knLOmdDcxK9jSrKCLuhtMVGWXpp6dUqFuiDsN/16wXc2BQecpLSW2xQRvtp5H
         mvWTtOO7SGo3O+4vaC60NnH7n/Yv727Uo+8XX/hYlZRTFFQP+w/f6YJDOfQoo1I88P9o
         9+TlSF6eld8vxB2KWRO2wMuoe6qYHshvVB9s7+bI++V66s7m/lD+r9ZZOZJSF0tnBQNm
         0fFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o4r3yRh1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b93si10994380ybi.392.2020.11.02.03.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o4r3yRh1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZY8q-0002gT-0P
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZY8h-0002fN-Da
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:36:43 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZY8f-00043C-Mq
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:36:43 -0500
Received: by mail-ej1-x641.google.com with SMTP id 7so18480155ejm.0
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 03:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Bq73EWlkdB6KKvewluwtnuT7qQVmTu5Re/ZsXBEA+w=;
 b=o4r3yRh1teoXPaD/2LfY76xu3KlCPj59nuC0Wrfzt4kC8RmfXw0K+NSxKr6pLDcyeM
 Sy/0EQZq3XhMnMBvL/W8mdAPaOSNUljJ+g6rJotIpm2BY9wVTUfSOoAVqh3Gn8Xafksk
 Jbya9yvfm1kBKTB19gS4f7Yz/JQcfUitAlxf0XzHJKsad4Yr1xdcxfqo48PdFA95n26+
 rJwNPzX0RWHxfvAguMVDNcIPaS3se/69A13J1h6lc51P87+8yD7ldgvUzZ4an4zfHMYp
 e1/lNAAnZxmtLVcZhlkjLeSBcpsK1iimUHo9d2rwn2DAb4JXDBx8+7lKHAAoO8x57cIK
 ocpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Bq73EWlkdB6KKvewluwtnuT7qQVmTu5Re/ZsXBEA+w=;
 b=EMVh3jV0z40GkJHv5EMij4E6gOHG2TW+utaiHxlMKFuwr8+iJ1d89EmP2TtQhKz/vV
 KQz8vQp6wdmCi3E6Oly8zbKdMfIOFrTBPWEddaz7DXv49pP3f971vC9ex3/sIcHHyIAy
 bUXAdJ1H2ZstDEfb9wV+OFQHFCkpBpjL1lLL/qxGMhd9bkQxiBMuViIzvE/aL8Rucy0V
 Yte3K21OtctTVfX/fEutFnxsHWHU/Mcx18wvbBsFoizQ7jShNPka6N85c5r5Cgh3jRIk
 LrW4coOsZSPNoUhTO0PAlbMiow9YXxRDoZbz5sgJQKClenubuooZw8UiNU5txFeciHXn
 RUqA==
X-Gm-Message-State: AOAM531C4f8LdeigHhHTUUKUWj/gWt2p5PLa9qxlH83heKqa5N0tsPb0
 y1D8d2GnPI6IFdNBlExuML9EwHWn06vkZIgClRVarw==
X-Received: by 2002:a17:906:3b59:: with SMTP id
 h25mr15679846ejf.56.1604317000326; 
 Mon, 02 Nov 2020 03:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-5-hskinnemoen@google.com>
In-Reply-To: <20201023210637.351238-5-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 11:36:29 +0000
Message-ID: <CAFEAcA8YvmFA7=7+CGVpubVScuKPdy+OQdmJdfMD+Fmk+Hb0SA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/misc: Add npcm7xx random number generator
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5Y/mDa2UrvK

On Fri, 23 Oct 2020 at 22:06, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> The RNG module returns a byte of randomness when the Data Valid bit is
> set.
>
> This implementation ignores the prescaler setting, and loads a new value
> into RNGD every time RNGCS is read while the RNG is enabled and random
> data is available.
>
> A qtest featuring some simple randomness tests is included.

> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +    g_test_set_nonfatal_assertions();

While I was looking at this test case I noticed that it
calls g_test_set_nonfatal_assertions(). Why does it do that?
In our entire set of tests, only the npcm7xx test cases call
that function, and they don't explain why they're a special
case that needs to do so.

thanks
-- PMM
