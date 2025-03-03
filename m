Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2638193njb;
        Mon, 3 Mar 2025 06:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+4sv088fX/DQJYk9Cc2yF5DiZe4/MOLG6ac1wwAAZlTPMgv2sjNWQBiza9bNh78ed3meoCzM0muCIng==@linaro.org
X-Google-Smtp-Source: AGHT+IF8Fy6+yX3e6F88H9j41KQGGDbm0q5hwSFyxQs8ZWJaKvFhPE6cSkRhCLdV9wD9Qk73c6kZ
X-Received: by 2002:ac8:7e8d:0:b0:471:f8dd:a15d with SMTP id d75a77b69052e-474bc06fe86mr154268171cf.17.1741011185153;
        Mon, 03 Mar 2025 06:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741011185; cv=none;
        d=google.com; s=arc-20240605;
        b=GIORrhiPP2nYIgIdZ9LNQjBbfD5ofSlo968MNOwOebCO+xgx/PvcfACWwbNSkTDnnJ
         +5Ict0VJ2OV8UGXo/4J5UYQhKWqjr17CReFx3Uw3+P69NOazMrdFB2uJ/JxLWI597C2M
         zfmlkc87+pQHzOOCr7Gj2AM3JiVer6qkN4c5W6NWV8pgNZuyiWSsRtFX8oG4uoozsulx
         u7F0vhb5AEs1EBXfQv+Yjz2T9j0Q2HoxTzR3ivP4o5ksNBHOMw3++8JaISb8cm1bJ7rH
         SH0KF/xAgWdbMuF5Kwy+uz9o6ItRn3f9j8sqT4bJPbwfyt11DBXMYItXL3am2yUpuXs4
         XdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c4se0JcUUSt1l0DsIdUpVzlZalM69sHmE0kyAvEGe5k=;
        fh=BdSQCTzPv2tEorBhPuemdaWxtKStQPLDpQF/MfUT3vc=;
        b=UzY8iPo/d6QMGwGaSFHfEOoY8MaqYd6bpjgrxXhMAc+qtdbuyRXFVT4BJ5wHD2pz1g
         P1AvjoadU+N+AwRft0QlUqgJVAhM/kVJba38wh2KYGvZcA+ypKdR9x7V4QDFn/7s8sJa
         dZbCTkJJU0oldKA2kJSCjbtdifA2gOKbO4JrLQsO3VepOXLO9kAfi1j2HVgGcQ1bgjhU
         srAotnQ8OsCgkya4suu1Oxu7qybvLFKhe9Kva8Eh00qYto6ONh/hBMRSm1aXDdhNTiJp
         HKxgO4qRFDumlf+MRmq4+qBn6vUV6krBBasWK5prHPTLd+ZQUhWuFpdq4PJWtEroo+03
         Xysg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQNDrgHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4746919dad8si89077841cf.129.2025.03.03.06.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 06:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQNDrgHy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp6XL-00011N-GG; Mon, 03 Mar 2025 09:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6Wf-0000pU-I8
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:12:12 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6Wc-0006Ey-I4
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:12:07 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6fd5a24a8d8so19247467b3.1
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741011124; x=1741615924; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c4se0JcUUSt1l0DsIdUpVzlZalM69sHmE0kyAvEGe5k=;
 b=aQNDrgHyqLjD2q0MGMGwpRSbV1wCftuZb1zswvDYKGIYf4rKw0eu6lPDr7ZD3tax0i
 rCBC2QGEgLAPHuWKRMaeSVrXpABZ/kLXD8lLiT8/Q7qK370jz9aCxBUxVpkSLFLogsdb
 YqdHANvJbwWoznxWVlKWlylz4A0A9LEFZjzEEV7isI6IXLtFe3F0ou4Xz7oiSTESJa9h
 Cc9w7mOfAl4wRek+KMiwXCBw0uZX1aliYjWYm3DFAabqWOrGfWcO8OGNjAYlKEDLROcs
 dCGRatJ0SvDUZ12PsZWvVhrft1eA87eDlNJkpopkOAkymTz0W8kbnYOC6IIRSCMf0zp6
 IIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741011124; x=1741615924;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c4se0JcUUSt1l0DsIdUpVzlZalM69sHmE0kyAvEGe5k=;
 b=JYGpMceCrT6zxjqCfX1ghDDwEVCouJweDK3yx6xId3MtzEtWTAxIpQIXv9VJ2PMEhV
 IeZj46nnIkxX2/uHWMkBZI/8CdTifqEgEseOr2JaYqXmeUkQg97YvwJ+PtwjB98OuoF0
 y/q86JfLmOAaQHm3ZZaThvyo52TUzP1R+/3Z48/WjUfbVSKUafHJ6WaLjXQZzoR0tjGc
 bOvhVNFOzaaevdrw4r8wBvsci0WCNNOzKVeypOrP68x7Wqsul53W1oeMPaR7Q9Q6Q64H
 0PjZWoeyxQgXqD6eGEpq1FRzxUbt6h24UbkGFvS9Cv22TXRIcE0wUAiSL/0Sjq8Y1cvM
 GbTg==
X-Gm-Message-State: AOJu0YxiSUOjXKsqJP7zOBVm934qsxLCOz8pvVmXdWoRY+O6KaLi+q/r
 RdZUfekJ6afbaP/dAgje02//ilQ4TE6OU4jy/qFXuxCBGNridRyhcrWdSqbXIC5HL0t9/38rVcr
 pFY5pohPpUeMHmtXv02vJSmzezwTNOtLY3+nOixwg8Pdj9+sH
X-Gm-Gg: ASbGncsjwpbjfNYUZ18xHIfdo9ZQ0ymQcOBJqijD2cJ9iiWVcl2okflYY/2A1C1HkJq
 mjwL8ZBQ8UafFDrIQZXeVZWOIs3ubmDX0DIW8g9qhM4QkuP4at0o+wZHPld5ON+Bpu08SaienRS
 XOhaR/eFeYWPKMtaI+hpN/05UMilI=
X-Received: by 2002:a05:690c:4493:b0:6fb:b8a1:d3bb with SMTP id
 00721157ae682-6fd4a02387cmr164796637b3.17.1741011124254; Mon, 03 Mar 2025
 06:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20250226024603.493148-1-venture@google.com>
In-Reply-To: <20250226024603.493148-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Mar 2025 14:11:52 +0000
X-Gm-Features: AQ5f1JpzfHXwMG4-5NoLwQ7JEqGektmvxs4fJTBxL0SxP2ogXNLlo6dNN7jJM9s
Message-ID: <CAFEAcA-jOcycjqDiqKPJi+WMK6OBBp_8vwx1ASpd2jr3HnqE0w@mail.gmail.com>
Subject: Re: [PATCH] hw/gpio: npcm7xx: fixup out-of-bounds access
To: Patrick Venture <venture@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FGWuqyQ3zH6x

On Wed, 26 Feb 2025 at 02:46, Patrick Venture <venture@google.com> wrote:
>
> The reg isn't validated to be a possible register before
> it's dereferenced for one case.  The mmio space registered
> for the gpio device is 4KiB but there aren't that many
> registers in the struct.
>
> Google-Bug-Id: 397469048
> Change-Id: I2fb8d0d3d41422baab22e8fc7e9fadd0f2ee7068
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to target-arm.next (with commit message tweaks
as per Philippe's email), thanks.

-- PMM
