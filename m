Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp36800njb;
        Mon, 17 Feb 2025 05:35:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8n4TAwpZuCHplxEan5Z9CSOPmbM9IG86XdW87KnCvhmCeSG0ivQ5krlQIlwB4mbZGisr2q/xfvb7cqg==@linaro.org
X-Google-Smtp-Source: AGHT+IFoIak1x2WiSl2cBCzn9i69dSczoW3JQsIkd2cOneQvMkdcTE8wcwrSCi8Nm8Czuraj9HWZ
X-Received: by 2002:a05:620a:45a6:b0:7b6:c92e:2e83 with SMTP id af79cd13be357-7c08a9a9173mr1448043985a.17.1739799355395;
        Mon, 17 Feb 2025 05:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799355; cv=none;
        d=google.com; s=arc-20240605;
        b=QuM8Ppxv9ZDlyKwZx0D3JjvNJm9ZjbnsseIM7U1WlISThBBF1wvFP/UNcBQIFZhhnz
         NG1e04DCdpQJ4/vC34Ao+B9LQ3OTY3S7zYhuLxRlrg4D6dRE7Y0XvOEje6WRS0JXFtkF
         N4qMckRkcnRNxPD2Gn9TLmyO/X0MV20XCKBghUodOUVaWoSGJmz0C922KkNOhO5VgOCS
         mKmWhcbn1B303plgzVU9JoNgEj9DonlVReLLEZBAgCeF3PmccDM77PvcuNvwEVgxTxu8
         6Tbk4zdrP2YYYkPeGqdP172csZ5Oh+IkzajoNKaUIU6qFFDRUCQtGT/kruS6dU9jHRa5
         6y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZR6Y/qym+TUDnCO10jd+iLCGX54+ExwaOMfFV0zUvk0=;
        fh=RCAiJ18ll790W/So7qfBVzvfmuAXUd1jKxXszZLdGSo=;
        b=Z7tiUWh3DFVsOQqR1msAQ3vn5z5s4lmt7AAKUtnZKWsTZOickrpJe6BT+XfzAwMLrC
         +X94yvOKrQqA0+eTzMtOouiXYQRsBRh0uJXXfsicyYSDxtz0sufHajXD7oxDFi13tDNH
         BhIOCysWp2JDnNfuqfNq1MTazj3MkJX5/ajTWLj+Ihxnp68fz/lofbBGc4+lxj9OZXWL
         OGJaoDrOP8fKOGo6YTV61wmIn99/8PVIyUA5HIXeihpf3ZNIkvzZRj490kjoNXdGtDEG
         DdXEVoaMdaophgWzezKrLmetnU6GAxVddqYJA1a2sy7CgoDPA80+cl9CSw2ZHsbumQxQ
         DSaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKVawzMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c096ed8b0fsi259525485a.420.2025.02.17.05.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKVawzMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk1HY-00069C-OD; Mon, 17 Feb 2025 08:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1HN-00065w-IN
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:35:23 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1HL-0001pW-LG
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:35:21 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e5dc37f1991so2075535276.2
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739799316; x=1740404116; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZR6Y/qym+TUDnCO10jd+iLCGX54+ExwaOMfFV0zUvk0=;
 b=yKVawzMpXTfTmkr9kfyQL0/4Gcyz7HpcmKQdnkzuwdP8NQ9PStMGfrH71YU9HOxdJv
 y8fNSyp5NQTB86aoa/74JyiDjV/my0qzzkwFU2mzmf47QkhwHJ5gC9C5JfJuE6mD4Zht
 rnQuBzcHS3dqzksV8R6sOeNj8wwLuxaL7MxmZtWkfiMxTUvW7Iwt86BcFzosXrWBAMM8
 5lwPEupgJJCpLTXVCFGF1mBpptl6QVpytCxJ2Xm6MM/4feBIiFdkxJEWDDkOGtk8MHhY
 TmhVinaKCDrD3/yK9IpvL3VLhWHCdGENCtLw6O5xvC0wY/unaEL1vd9CugHV3u/1e2hM
 Za7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739799316; x=1740404116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZR6Y/qym+TUDnCO10jd+iLCGX54+ExwaOMfFV0zUvk0=;
 b=eA3GMVe/cyAejH5QURTdODd1h+qVdS9bpoMgQ+KJoPMWHe0siL4e16NKCqkpNgwgv1
 rPD8up5JtAI+MWCBrjwTP+pa7YnHNITfKvbfK8c/Rq6bSuKA175GtRPYRxb3hNxSlhNp
 hbVlqOKw/ByeP1qzkrl9L09MfAdRVjFlRVHVOBnL7lwMHCe9awNtpWZpccO0COe++Cna
 ExORfF2p25fpEHt9KnCpvMFSxRKyGr9X8GoUwRCv628jxZ6qPn/14Mar0J4NRbnGGczt
 yRsMXbg9/TMppTIv6xTHUzGma0FeZpTddn7o7jBNOq8HGYst/QM37Qzxc6V5tb1e++gv
 X0tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrpxXIZe6fUTRfbB3/t7rPHgzVlDbdHh22IbBpwcC5VlPVgeJwCU4Q+Yl8aGXLd8PH8dfxU5Zt2Q==@nongnu.org
X-Gm-Message-State: AOJu0YzqEBOoPYQkBYub/jUey9/ZojCBOkF9XxVcROxAKmTBU5eozVL+
 g1u/gtX/NwuRPoXveSD38PrRsg7H8k179ZyijQQIu5zy8EeGdBbat6BFZfiylJI3gUVSwY8R6If
 b1cPb8Pmr+MYWLl2tN4H1cCW1BhG1ss6uFhkZXQ==
X-Gm-Gg: ASbGncs15p5y3H044yHKv+P/Os0RfqKPqR7yRvaXK5fRF/mlK6pt6xYKtiPp8d1Ih/u
 hhV0Dd2ALzoNLupSPgBQZISVFbfpCf0UWEkezLV7YEdzyvbEkKnGrTQNrkHEdjn3qJzsrhw6ERA
 ==
X-Received: by 2002:a05:6902:707:b0:e58:14b:6f99 with SMTP id
 3f1490d57ef6-e5dc901f547mr7518787276.1.1739799316021; Mon, 17 Feb 2025
 05:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-4-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 13:35:04 +0000
X-Gm-Features: AWEUYZk-vW3VIOeZxiFcaM49NZ97YF0H0F53_o90tMEwkevB4ARspkvDT2rsPuY
Message-ID: <CAFEAcA8yayMSe+64VDV8TwSMi7u0_wLM+y9-TKsnaZS5seNKZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] hw/gpio/pca955*: Move Kconfig switches next to
 implementations
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: QTOngMbYFmnv

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> While at it and since they are user-creatable, build them when
> CONFIG_I2C_DEVICES is set.

The patch subject says this is just a rearrangement
of the Kconfig stanzas with no behaviour change, but then the
commit message body includes one.

If you want to build these when CONFIG_I2C_DEVICES is set,
that should be its own patch that does that.

(The move of the Kconfig bits to hw/gpio is fixing a bug
in 6328d8ffa6cb9d ("misc/pca955*: Move models under hw/gpio"),
which moved the code but forgot to move the Kconfig sections.)

Separately, it's unclear to me how worthwhile it is to add
these to CONFIG_I2C_DEVICES, because they're GPIO devices,
which means there's not much you can do with them as a user:
as far as I know you can't wire the output/input GPIO lines
up to anything. We have the device models mainly for boards
which provide them, so that guest code that expects to see
them doesn't fall over on bootup, and because the board
model code does have the APIs to wire up the GPIO lines.

thanks
-- PMM
