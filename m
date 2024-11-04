Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2198965njc;
        Mon, 4 Nov 2024 07:35:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWt8u0sWbuJWYAvCfbxMIoLO6HZ8UtTsRiEhxMzRHlft1foevLKYsKctfk43MRcnFc5maKMyjrWKtxTDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IETXNLpYHdqAzOOBDmsD4TX5ERoOUbx6Op5Dta5mhWIpF9gPE/X41LO9kAEHeoD06ushZO+
X-Received: by 2002:a05:690c:304:b0:6c3:7d68:b400 with SMTP id 00721157ae682-6ea64aefbcfmr111956667b3.10.1730734551433;
        Mon, 04 Nov 2024 07:35:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730734551; cv=none;
        d=google.com; s=arc-20240605;
        b=gO+TYa+CvyXgQKCfc2VicoqI0wjSL3stIsn+KRWAYDTgNruJ1dgVuI0OCWxiEcM7Oe
         tXxVUGar+gkhzsx+kNLk5LRcnDCRx1ukcCA0Gvmw9+Usd2J82MTGbx1xKJjXWs5hp8y5
         JgM5mDrP6wvDZ4Z0i8qyRFt8iuUENi9hH28uqPVMlqE1t3QdwtPhMCLS/hd9rddNSqeE
         hdVs2lZ8k7W/PPmv+Y3xDiEbYND/bbW5oNpx4+v/FR0s6Nefi4EFwkcyj0TZJdcfIuL+
         9kCX7lj/MKwlSdoreg0epr7/L0iHvhP8Hd5gJTONSVHDXqU0vzS4DIdhCdOPzSd7u4sG
         Q6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=3XguMVXGbfzkZGKGoqgqbNVlfw/hHevHdV2cu/d9T/8=;
        fh=hpX9GovMIYolJPkd4Fk5890CY0rXEdHAvm6tNMrvPMI=;
        b=fr5zAplezpt21a3MWIDp4f3sNl2S/0GOLCeSYjdLru2KN9RtGMjX6NP83X6ikPB/JO
         TiV/AKr0kRv5KiqeJc7jpPc67XryaJGQ/foUTMj4pSZdXvYXU0a9/5O8b29IZT9riRWz
         4rThHUSYOenBw1ch411o6eNYIdNQM1t2EIKgLK3NaukR3lcKLQDwTlevJnIYbiE3eiTV
         K7UzGircY9Ls/FMM1HBtPtQZWnpjbpPgP+1XVzV1g1veq3pP8eVLxYGb/D/cOwOYyPpn
         7wtpves7Cq8JLN4YHnuqAZhjUg0S894C8l0Ku9CxzxiXUv41BX6+SeAlVlg2/17QLfVA
         RkMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b="MLB/NJsY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0d20d3si118178541cf.209.2024.11.04.07.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 07:35:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b="MLB/NJsY";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7z7A-0003bM-Lg; Mon, 04 Nov 2024 10:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z78-0003aW-2Y; Mon, 04 Nov 2024 10:35:34 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z76-0003hU-GT; Mon, 04 Nov 2024 10:35:33 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-71e953f4e7cso3459912b3a.3; 
 Mon, 04 Nov 2024 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730734529; x=1731339329; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=3XguMVXGbfzkZGKGoqgqbNVlfw/hHevHdV2cu/d9T/8=;
 b=MLB/NJsYVYeNNdAkmLtHPrHQG0HhPbeOPR7NPUPx4/Lg51vt+AL0+dt+9J7ObpKMbg
 P5R/59/Pjv7YVYPjT9ZUkJXe9Msmfw2q6qu7609HnzyrMeq1R8B0APx9R3FQbxYAkllz
 ncD2ZYp9chjSE/VHnTXBMGVsUDMVCx/VOnveMyBm1UPk4JCkvrwO0r5A417AcWzj1Er6
 Sdd5m4cSEa1dqT3/fbKtaUjf4OhiK4pMKM510V2+NwjEfgONrGrRrWp4MMcaixBQzHPF
 byc6IDo7MjxyyuTUxSz4pIGZouDVhMQqzztBvfAfy8oP4kTKu2/IFDXnpQlapawLmYp+
 /ExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730734529; x=1731339329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XguMVXGbfzkZGKGoqgqbNVlfw/hHevHdV2cu/d9T/8=;
 b=LkOgrTIq0sR72PwhrSaXq3MxeLd80XtXLYDVh8JV4OWAXo81j3G4tzL8uGXUZRviLb
 mGYGY4Gp0rNNy+MyxDP63xXUiWGOSkBlysw81gc+rY9N1zzMFQebDX1XxVhH10q4VTSQ
 bHJSKaYyQyC7z9wiq8SOk9rB2Lqn+f8P01cHBQN2mwHeSkw67uk/9eQeOziOuNtQ9sYO
 d6QQpynKcAoII9qd8hGa8Uce25D5+rX/BppFrz7jopPP0KwQ8JXvkr9YgY7lQVuHn+yo
 QMAvVb00mATYss0zPf8kicpbPq0BnVXKjFsx/Vwm3QRZhoRKloHbLe+u3o7wujeznd1X
 9f4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5bG06OmHKFtAh5gSoecXfRHLyayl2jpQVbH+dsZBQ51tzxXZ+/L8/5HbzmAYXDsJAoMktAb6F4w==@nongnu.org
X-Gm-Message-State: AOJu0Yz7D4pi3bV3N1ugCCUDqG8SB8sSF07sO1TWGqx6D5aU6IMab8Zl
 zqFnvHT+EnnBMWfDQ9UtqsPUNy+huxYEM/Dlzz/7uZEiAZIzhkBv
X-Received: by 2002:a05:6a00:8c9:b0:71e:410:4764 with SMTP id
 d2e1a72fcca58-720c98a3d19mr20625826b3a.8.1730734528765; 
 Mon, 04 Nov 2024 07:35:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc2c47fcsm7536097b3a.126.2024.11.04.07.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 07:35:28 -0800 (PST)
Date: Mon, 4 Nov 2024 07:35:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 1/5] hw/net/lan9118: Extract lan9118_phy
Message-ID: <ab8b424e-848d-4e1f-9216-2fdfb6516bec@roeck-us.net>
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102125724.532843-2-shentey@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J2t8sdWiMtZE

On Sat, Nov 02, 2024 at 01:57:20PM +0100, Bernhard Beschow wrote:
> A very similar implementation of the same device exists in imx_fec. Prepare for
> a common implementation by extracting a device model into its own files.
> 
> Some migration state has been moved into the new device model which breaks
> migration compatibility for the following machines:
> * smdkc210
> * realview-*
> * vexpress-*
> * kzm
> * mps2-*
> 
> While breaking migration ABI, fix the size of the MII registers to be 16 bit,
> as defined by IEEE 802.3u.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>
