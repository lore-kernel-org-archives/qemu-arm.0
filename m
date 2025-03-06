Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1162132njm;
        Wed, 5 Mar 2025 16:08:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMY37Z89w8S+vc7DvBOUZLzI2JNaTU/mYHQRVIpsPeB8FlZ27N1s62br5jMvXNZJdSEZkWbShnVK13Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IFTyR7pnqFqVgKjvpkGIp0Xv7g5oTvdj5o+FWwnw/vml7o7aT10Z7wiy8NQAa3xGMci+/fH
X-Received: by 2002:a05:6214:f63:b0:6e8:f0f8:6801 with SMTP id 6a1803df08f44-6e8f0f869afmr43990536d6.22.1741219689953;
        Wed, 05 Mar 2025 16:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741219689; cv=none;
        d=google.com; s=arc-20240605;
        b=JadlyE1dJ8jkcU3ThDRIdUbYx5WkutWH47EC1+4s2Vvo6AonbWZsYf0MJi2lFMnaSJ
         obVpBSJzFgCDEZAx1bzlTADqwDfxVmNZ6ejK6HnHBL/I/IfNmPJWyY1Kjwb2nOYNdOc1
         MdJLnB1Gn0WkaY18QlH1D2xrE7VEvMaz7INibNSZX5s4jAEheNGaOfVYrOUU3VUlEadz
         8K2ZUJhUDpdoeNY6jhf3J+iebnMjfabDHVDeWJjYVTGzCqLUR70u7zRYdlBW+FZyaQBV
         j/VLp6BhFpZJrACO10U5SRTfErhEEaVkgNDaYv2ChAYVWNbt/IBsvoMm/A6t4EvquIVM
         YmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :message-id:mime-version:in-reply-to:date:dkim-signature;
        bh=st91ok7oCwEuiRJr0/PqKM4jVdbffw88qRzAq3mg9TA=;
        fh=ZRbHy3WIcHwxr9NXGD8p1XejTY2OszKd8/e7qabgKG8=;
        b=euWTLSzOp3eZc3VGAWN1jJLcujbUMIDqy3ZlnTejYMv2maJg36yVzzoF6CgIKcvY6S
         Pt97NgOXFRTpLjc7j2c/9Hph7iUkabEZHAVv2kWmLbN8upsErVRWxALups0sfBARdh8w
         VPOCOFoMdZxVpviZSH/jPtlanO7/ym2mEK4RBRVAuEYgSUnc/BJ42q6RlQRytPTFiJyS
         H0dD8msLeUd4Kj8q2HwDwVjcL76ZLAGUTvqAWzCWNiPzd5yfz8zlSgPwLJBAsGfljrcg
         24DnjnpcHCeAUts+zIx0dypbemQrLUZY910EhfNrPviyNN8+Vrv8hILXOzQRH82DtYgN
         0VzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20230601 header.b=Zp6pUDME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7172f50si1143156d6.271.2025.03.05.16.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 16:08:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20230601 header.b=Zp6pUDME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpymN-0000ZE-Il; Wed, 05 Mar 2025 19:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WufIZwwKCJE8vw32zDEz0v819916z.x97Bz7F-vC789818F.9C1@flex--nabihestefan.bounces.google.com>)
 id 1tpymL-0000Wj-MW
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:07:57 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WufIZwwKCJE8vw32zDEz0v819916z.x97Bz7F-vC789818F.9C1@flex--nabihestefan.bounces.google.com>)
 id 1tpymK-00070z-33
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:07:57 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe8fdfdd94so239645a91.0
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 16:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741219674; x=1741824474; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=st91ok7oCwEuiRJr0/PqKM4jVdbffw88qRzAq3mg9TA=;
 b=Zp6pUDMEI9g1PyZ9Nx7vPL5hkHwLEqUdGrI52P+4jL/J5lJQ/BEIXZTBn0gDP7lzLr
 K79A1ko/eskgDLq+xI6xuCDjY6ot5wy7p2ymFkZJkFLhDR9wOjhATR4x+5vKksJYdnC1
 bcX5XJDrluYZTKMTo+223zIIz8XBizzk9IjkUVo426D+fXrE2TaiDQwGE8jVnDlQX1mT
 k6gcbyb6aRQ7/aG2FgNkYqyDx2dLw93VBSK2hD4mjFqZLNEnorZN70BVwrXN8v1xPTbN
 xAcsaJIFyCUCIkwY5Dra2/xQH7ye25gLDNv/az7DGf+MDfBMt71aA8Gh4Uu//XPXgVki
 aJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219674; x=1741824474;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=st91ok7oCwEuiRJr0/PqKM4jVdbffw88qRzAq3mg9TA=;
 b=o+l7tO9KOo7J4MtFTFXhXYCiv8Pg7ZX1rcSZvvnwq1CmaBGmwBG3/u9m7R5FUUyNKC
 n9h//nuN3mj6ve3a+Qrz3OLNlVJVimtWua7qZbvnzdQvN9UNXjwbTSezc/6MN49NeVS0
 /SAmSGv5CYEYKAeE1hkS308MalaDirMLPRzAAWNjYChFbXXUrmRQ6sKdBtcfu5/hy6zJ
 G/NG2kjlQoUoZwkT3K2YqAwlOSgtU40mPg821n7aSHMP9NkoZbxdzeCV7K1ivpO2wVVZ
 MCVG6QiMdpt98LxJebd0c0Gq1m9seFtvQLvr0j16qF4X2mVmOyl5+Mo+GtO3MAnn0NFL
 J83A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLdl1b7nk6Eubp3j0+d8GR0aN604Pf3BmOkU9IRYZQO5pTUCd5zsEqiRNCvi+soCB7shHT30eR+g==@nongnu.org
X-Gm-Message-State: AOJu0YzaEfuxuivj1ygOK4KrAetl/E+t7T3b9Ew/gMtgrWD2TRadmEVg
 1a3jPfpAwaP3P2KkL2CiRd9APXJ6aYjT3GeqkPRgaX9ZEyhLed1hEswmVxr38glOV/9woDINQzW
 mZ9VV13eip9TYvTQFcQM6BE5uPA==
X-Received: from pgc14.prod.google.com ([2002:a05:6a02:2f8e:b0:ad5:4c03:2b16])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1506:b0:1ee:650b:ac22 with SMTP id
 adf61e73a8af0-1f349570daamr10278575637.40.1741219674089; 
 Wed, 05 Mar 2025 16:07:54 -0800 (PST)
Date: Thu,  6 Mar 2025 00:07:49 +0000
In-Reply-To: <20250304064710.2128993-6-jamin_lin@aspeedtech.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306000749.2097023-1-nabihestefan@google.com>
Subject: Re: [v5, 5/6] hw/arm/aspeed_ast27x0.c Separate HW Strap Registers for
 SCU and SCUIO
To: jamin_lin@aspeedtech.com
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3WufIZwwKCJE8vw32zDEz0v819916z.x97Bz7F-vC789818F.9C1@flex--nabihestefan.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Reply-to:  Nabih Estefan <nabihestefan@google.com>
From:  Nabih Estefan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PPmGvzbHimFK

> There is one hw-strap1 register in the SCU (CPU DIE) and another hw-strap1
> register in the SCUIO (IO DIE). The values of these two registers should not be
> the same. To reuse the current design of hw-strap, hw-strap1 is assigned to the
> SCU and sets the value in the SCU hw-strap1 register, while hw-strap2 is
> assigned to the SCUIO and sets the value in the SCUIO hw-strap1 register.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih

> ---
>  hw/arm/aspeed_ast27x0.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index a48f47b74e..92487bf229 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -333,14 +333,21 @@ static void aspeed_soc_ast2700_init(Object *obj)
>                           sc->silicon_rev);
>      object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
>                                "hw-strap1");
> -    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
> -                              "hw-strap2");
>      object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
>                                "hw-prot-key");
>  
>      object_initialize_child(obj, "scuio", &s->scuio, TYPE_ASPEED_2700_SCUIO);
>      qdev_prop_set_uint32(DEVICE(&s->scuio), "silicon-rev",
>                           sc->silicon_rev);
> +    /*
> +     * There is one hw-strap1 register in the SCU (CPU DIE) and another
> +     * hw-strap1 register in the SCUIO (IO DIE). To reuse the current design
> +     * of hw-strap, hw-strap1 is assigned to the SCU and sets the value in the
> +     * SCU hw-strap1 register, while hw-strap2 is assigned to the SCUIO and
> +     * sets the value in the SCUIO hw-strap1 register.
> +     */
> +    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scuio),
> +                                  "hw-strap1");
>  
>      snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
>      object_initialize_child(obj, "fmc", &s->fmc, typename);
> 
