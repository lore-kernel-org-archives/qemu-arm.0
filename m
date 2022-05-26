Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp401571lfh;
        Thu, 26 May 2022 08:54:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqINJmn9Y1XHSQtIZuELxr1VbS278evnEP4cA3Q3DUn8eQw5KG/zRg6XkqoMdZYzRq1VFi
X-Received: by 2002:a37:758:0:b0:6a3:3dd3:d2eb with SMTP id 85-20020a370758000000b006a33dd3d2ebmr23247032qkh.448.1653580456519;
        Thu, 26 May 2022 08:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653580456; cv=none;
        d=google.com; s=arc-20160816;
        b=te8/VmP/dcVEhbtWx8DOIqtAh1dV7nKqiSGu0/yMYzq+U7tdWQ6UqtXJ/tuutngRXs
         Ow9Z4zxNfhgw9Enm1vrzfbZsL2cG7XlYzL/W6JsDqhx+ujbZ7FXEbot9ihe6WLc5cAn+
         JirN2xG57u2Hy4OuqZ75QaK9lZ7hb+zHPv570Om4JkYNumCJwwqhPTLU14BfGFbuZVYY
         Mag7uJCHwxAxKJVjPsMNtAiloYeuPmKLnU3IyGm307NfNAVe9VGo2H/Vu4tUwudHuZSC
         uKKlPyfnS/OGxNPtbl6sE8xqXTnpUDvu8HtLzA2161fxn4eFi6ZP6W4TQPLA+Qd4J7iP
         opRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BwttWzckPGVuWP72wF1PabwLrM+OAc8xNfRmrrcbhF0=;
        b=mSapZ1i+VgzRt4n9PfjGBJoT+SKNmRWRiLHK46/eZADiHnDKx60muuwgb6xks75tt1
         hXNm4IHj4sQC7lksu/2JvHFlpcUkeBUvBSzJVv8BKEaYB/O3VBUOutmQ+PfBPPFcQJ+f
         bHHIdgxq9kkkRtmPBi3mh0c8LDZ1IQQZF20S9YZyHq1E/AtMndTcsj8weBa+TKpqw708
         W5ie3m5WYKpuLSDJNC/SGM2HOhWiJW4hc1P44u4DfLye/hrVd9J7oZnIisQMQ8zyuHb7
         xMlRASk3vszWYJOsQi7wIGvErGoAJIzH8y098vRlq13+KAAxJHLaVH5LR9onEYPeMNWp
         7Y8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8N4IUHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85708000000b002fb391d138bsi1184425qtw.155.2022.05.26.08.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 May 2022 08:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g8N4IUHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuFoW-0000qG-2d
	for alex.bennee@linaro.org; Thu, 26 May 2022 11:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuFoL-0000o6-W4
 for qemu-arm@nongnu.org; Thu, 26 May 2022 11:54:06 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuFoJ-0001Tl-Ef
 for qemu-arm@nongnu.org; Thu, 26 May 2022 11:54:05 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z7so3546834ybf.7
 for <qemu-arm@nongnu.org>; Thu, 26 May 2022 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwttWzckPGVuWP72wF1PabwLrM+OAc8xNfRmrrcbhF0=;
 b=g8N4IUHP3V9Tmsr9aJi2IZcrOdkMmURKoXeDrAj27wvStzr0LL9nHkWWnCeAr8GQum
 CfOvZqU4r8IyHSK1TvXCsRbjg8pNrdh4sDfAfb1LmoIH4MHBVJhZznCyjLOpyaAEW8CN
 FokaBIRUThdpzmeooijpcdqhn6SpdTTL3GMDU2GGxxedxCquY4Q1E69ltW5CpOfdMH9h
 717YnOEiSxDtr+UR14D3t5LD1eh2mLSkX5wdGVqDEuklHuO2S8GnEuqQF0TpZV4R4JAJ
 AEyXbpvPmQ9GwLFzjkWcbjWH1/l3F5gjSOBEp/jMGteQTXNN3sf6dulUC2AwrOhP9GFM
 hpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwttWzckPGVuWP72wF1PabwLrM+OAc8xNfRmrrcbhF0=;
 b=xdxywvmN9m2SgT1Sw0OfICGdcB5CAnWX+HbLSmRKTGD4CREbzVl/PrW8Ml75nDqNwb
 NRRW8PRixnUV7PG6kADQAKjeCKVRJY1I5QIi4BLDlwozctSrhRNrl6uBtc76GqQWcxGj
 m/sadeG8YAx2odyq7Vjx5GOVXZUvK6ee555rLxua+yoXwwcvD72vQJUocCSIqETl4m4v
 NAGYEzNvdIREnipOmzSxDtoi6U0hEC+iSRVOysekEwdQjTbGKMU6acU6sCYzvftqxfOB
 ZUfs0Uc4i1r6zD4MUNxzQYmpjJRU/VD9jSN3RD5nVTIdDcHfpheH7/TRkzvxH3xKzWFb
 K/CA==
X-Gm-Message-State: AOAM5333kMsScyMRzy9qSmEITcu9yRgdSO0D69SkGAmyaSmjJLf7m1uK
 qMTdr6OTATZ+3JlWY8Pq1ktDeMkxsOvrcOcSrJm86A==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr36413082ybq.67.1653580442083; Thu, 26
 May 2022 08:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220225174451.192304-1-wuhaotsh@google.com>
In-Reply-To: <20220225174451.192304-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 16:53:51 +0100
Message-ID: <CAFEAcA8vcRme05raLOhtaxmvbbLhLrSZwEaz1BVk5uUYSdmL6w@mail.gmail.com>
Subject: Re: [PATCH v5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>, Shengtan Mao <stmao@google.com>, 
 Patrick Venture <venture@google.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7ryp3j5Jaqqb

On Fri, 25 Feb 2022 at 17:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>

Hi; John Snow tells me that this test fails in the tests/vm/netbsd
VM (you can test this with 'make vm-build-netbsd') because the
assert() on the ftruncate() call fails:

> +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> +    g_assert_cmpint(ret, ==, 0);

> +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)

I haven't investigated the exact cause, but this is a
gigabyte, right? That's a pretty massive file for a test case to
create -- can we make the test use a more sensible size of
sd card image ?

thanks
-- PMM
