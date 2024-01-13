Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2932302ejs;
        Sat, 13 Jan 2024 04:28:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc6ufoGlKO3742SY82fN2eDEDrNQwxFzYTcVlaT9WtXSAozVAXa+BxsfAkwtyhVqo6Lh+5
X-Received: by 2002:a05:620a:24c5:b0:783:25f9:ca96 with SMTP id m5-20020a05620a24c500b0078325f9ca96mr3549696qkn.118.1705148902393;
        Sat, 13 Jan 2024 04:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705148902; cv=none;
        d=google.com; s=arc-20160816;
        b=OsFJzOOMgLZG5/mL1N4H7nKy7X1FEwlLGseZQCCe/nEldMDpASlqW1lM6HwUsvGHCr
         oP9akPHgHtCR90MHiq7jgLjcUh0iuFA85hsXYSLLDlSD6JY9eiYkHwfF5mXrjcCnWuqT
         ZnCLG7Kz/uQyKuh7RC+dNulXNKJf6jtOXVOtTlkMGC4KQ/62jGXHKYIEG+a86XkTynet
         RcNIVStOIHU0/W70esT0dNM53UsC3zFJslrFtf5fNoLuUC1sxN8sFSR58xchzYXgrc4P
         PMZmLrji/7SofEV+u+OgUKjSSOFlevmELEMfrnDzmwjE4ECEQ+Gfyy0QFja4VuOQpaTY
         q+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4xrbxaz/4B6lrUVfIcj/awmWGZFHG4TrvF53keG1b1M=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=c/3nIHUvwq9vchYTGbFMx6LkmHuY3xcBss2jYYwc2nBLcedgwkCiGzXCRfSzOavYYO
         EPYCMMU6ZGyiCiJb2AYF25gsh1HBo1fJaMd7fj57ho7zlfjN1tLrVjtUUAXDLeWcc3ph
         O265ysXkjiOr86GCEKH5nh+QRsIueH40Dd+PnJ2L79KDXXg0vhOP/apjmZhHPVMg5VLT
         iLY1wod+46pCeTf5SEWCN0CSGrSUPDJv/eXWC9Le0c1g2jUJh9z9rxOtAZMi9ny7t6fu
         8pk5gXPs9OFodeCfQwTFJZtNbcpIilUXa9jHsQsArzda9DJ7NPPE5GJPDQj/tMJVaTDJ
         pyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ara1IQEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a05620a11a400b007811ac158fasi4671212qkk.214.2024.01.13.04.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jan 2024 04:28:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ara1IQEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOd7J-0000xo-U3; Sat, 13 Jan 2024 07:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7I-0000xT-Bh
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:28:00 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7G-0007nK-Ly
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:28:00 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-559058418faso225952a12.3
 for <qemu-arm@nongnu.org>; Sat, 13 Jan 2024 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705148876; x=1705753676; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4xrbxaz/4B6lrUVfIcj/awmWGZFHG4TrvF53keG1b1M=;
 b=Ara1IQEwdpl7QWYBLTcMn1y9AkjCh1vOWUjtS7CAmt5QyNyCslzsboM/MjifcgeL2c
 9DOh7rUm17hKvUviAA+ZT6nQZhCLsiM0A73Sin4eQ+XIRa/LA4+66HEKxxD5DPAlwGex
 iL9dKhk/GJ5qDYNrQ1YIK4M6N8PJYP7gqlpLIqQQ+gX1ddhkmajwWy4bivZkjh278879
 nflA+BF6IQiV4oYCzt74GDhwynY/XEY5iWJhQi5ON+iqoxb8K23VfMjtZMWpWofSpXZ0
 CJZFEK9z3Vl76pKZU1610FZkmahSJqQC9i9n53+aqbbnGR58691lNMgXkXxg1ZW+mIW4
 H3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705148876; x=1705753676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4xrbxaz/4B6lrUVfIcj/awmWGZFHG4TrvF53keG1b1M=;
 b=VIF7wMroAePm8g+8o3e+qma9QJzHF7w+wL3cERjN1LqEOH1CJJcKxiNiqMxUPcPFxw
 9iq2Slw5qHgadAtlTZXGLvJYvhlei5yuRgg+ubAG5bw2Tf7yeU4OccLECbZptA/DWs6e
 t4PQ6bayp93D8mLd/WHzflZ0k5lFefb/oo7S3iuexjLbNKVSRWc+/of5kGl9MSeD9WkZ
 lOEyQTaDyg731BrODoZpxoMKFz8xVaNZ5RGcCnxYiAoact56NjpMnLZDIllyIpKKJKuY
 ResCi3XOjE3lYqzTbSEaJVRPqdldyybqnQFtlGS5KjexlpLOSTqjx9B/EY9095bw6oCP
 9HUA==
X-Gm-Message-State: AOJu0YxcILFhZJO/XCNvkUqlWwql4y5E0JLkJBsOgJcwLuUao3KbZPub
 43iAN5zyJtly1/uPfuHAyn5mOBq99eZAXMity8OpYhsLqratLw==
X-Received: by 2002:a05:6402:31e6:b0:557:639e:ae21 with SMTP id
 dy6-20020a05640231e600b00557639eae21mr1297053edb.23.1705148876718; Sat, 13
 Jan 2024 04:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
 <20240110234232.4116804-5-nabihestefan@google.com>
In-Reply-To: <20240110234232.4116804-5-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 12:27:23 +0000
Message-ID: <CAFEAcA9Bf-uTsn-B_QYyB-iSu-7opDWVYDQxqMBRTUzOO7y0Pw@mail.gmail.com>
Subject: Re: [PATCH v12 04/10] hw/net: Add NPCMXXX GMAC device
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yqj509/TF4PO

On Wed, 10 Jan 2024 at 23:42, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patch implements the basic registers of GMAC device and sets
> registers for networking functionalities.
>
> Tested:
> The following message shows up with the change:
> Broadcom BCM54612E stmmac-0:00: attached PHY driver [Broadcom BCM54612E] (mii_bus:phy_addr=stmmac-0:00, irq=POLL)
> stmmaceth f0802000.eth eth0: Link is Up - 1Gbps/Full - flow control rx/tx
>
> Change-Id: If71c6d486b95edcccba109ba454870714d7e0940
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan Diaz <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---

This patch doesn't compile at this point in the series, because:

> +static void npcm_gmac_write(void *opaque, hwaddr offset,
> +                              uint64_t v, unsigned size)
> +{
> +    NPCMGMACState *gmac = opaque;

...

> +
> +    gmac_update_irq(gmac);

the function gmac_update_irq() isn't defined until
later in the series.

The easy fix is to squash "include/hw/net: General GMAC Implementation"
(which incidentally still has a commit message subject that
doesn't match its contents) into this one, since it's
not very large.

-- PMM
