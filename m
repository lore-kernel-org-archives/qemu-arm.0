Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3068033lfo;
        Tue, 15 Mar 2022 11:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2rIzPkAXV460LnK+o4NtGPJwiBQ8/eisSYflqYFar93KtI+hiddGH/Iv4LTZTxrn8oyq/
X-Received: by 2002:a81:118d:0:b0:2e5:88ca:35f4 with SMTP id 135-20020a81118d000000b002e588ca35f4mr4620333ywr.293.1647368072282;
        Tue, 15 Mar 2022 11:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647368072; cv=none;
        d=google.com; s=arc-20160816;
        b=wfahOavenP2itNLIYxNE+h9hR0tAvIPnf5ZGGijc4IznggDGJIUxUZC/lsP2fywygT
         LDmzxW3/XN5jy4tB8FFDuhCiLOr8fAL2FHRWBswC23tzahtMAkeIAkv93goUXnh61VlV
         GbUfD96MWfD7Pnd7+GdIxRPWbY9C/N2KwEzBDPvHJeT24rkgZmoNl5VadJ6fmxB+XozW
         0EFZtmvbSIXb5lf2R/NzlDOAA0hxIcRx0jkKuD7u8fDhf2Qu9T4mzKkd67+nqFVPzmTL
         lWkKDfi2BhnMWoupuUq+odxxSWlLLuPP2qaQLJ5c7IL60VxrhLcZpFVIxVy5SETNtNfG
         vPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q+q1fHTKoAJ5LoKENwJ+pzp10VXd/AEYNtUdotqTQrA=;
        b=WNaUo/7WtEW+ZNThYkZp19VhoMeAqKjlMULDNot8CLZS52yj26smMtbHS8Xmde2nlH
         ezcor76xmIlecJy5ulJG6DEjAu26X1l94P94hg2I9tko2MLvedg9KgL/ynxsfgDhg62b
         6ri3c/P8oYa2Uj16ZabSYG00x5KI9zp998uUYm3IS0+nSHZKOGtYpUHt+z+YdMERplYP
         qSakqwAjAND4UYTC/dwgCsY9WGX+dWKSngIT0YK52lugc0s534cSp2xIpvl7Zin1oxFU
         iX9ZPLmuDlzz3MFwHgPH5w1puyZK4j76fx1A6gI/T3xzvP4BIM406OluCPv8dnnvc3po
         qK7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqUWOd8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65-20020a254844000000b0061da917cd23si11021544yba.35.2022.03.15.11.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 11:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqUWOd8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUBgl-0001km-Lp
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 14:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBc7-0007GW-9r
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:09:43 -0400
Received: from [2607:f8b0:4864:20::b29] (port=43988
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBc5-0000M0-Fp
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:09:42 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v35so64707ybi.10
 for <qemu-arm@nongnu.org>; Tue, 15 Mar 2022 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q+q1fHTKoAJ5LoKENwJ+pzp10VXd/AEYNtUdotqTQrA=;
 b=IqUWOd8CpMJrTfN37kQbbRWWcpP/SOwuMDXPFnv4zA1Vu6jdixbtFBmugPX0toaN0H
 d2I6H9AY1BYumbw14j+5PP+/V5m1FJHci87REvHMzllRu5HuXr5F63sIkJX0W7VXgVLj
 PVe2IhkJwpBxjGGsxJFINpPQWW4lW51SWEmX5NEb4uOl8r183Uw2K/PEMEb3DMPkt0qU
 6+8yvVDmKFTfG+GGaRnkLP8fKeymcTHZMQavf+45giRGjx7Z73S93VgjIhLYx7bcVPgZ
 8amGRtlBe81dSHVvdsDyAktCq+9Sy4NGXkBFlUoMjhvrqnqQEzraqTgZ9qPRDcPIgltS
 Xb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q+q1fHTKoAJ5LoKENwJ+pzp10VXd/AEYNtUdotqTQrA=;
 b=tG0tam+8iqCzKlJpda8HqQ9zq5Dh6634GhzhwvGaF7sDd42rEHPo2seYmkUNQ/oRq4
 K2lrPzs4qHBGlffLAT5QtFijZXrRxrIQQ1YcQJhNnwO1kNKEyCJZlpIGx5mAMQrc8d1b
 M6shFZpUR6XHF2PuC1dyYvDFQbRB442vI+rv9hJzOC448uSQKElxudlli53NSLfr/R7j
 k33UAtVgrWZr/9MT9vWe3XRDHnK2KzQqsRVMc6kzzrEjaL1xUf3iX+fT9zlTRkucrhsK
 xmMGPgmBIvUZrtiIU7iMku9WVBGG52yz8th+C/6McuLxgvUJ9zLw9Y30WNZMjIoX1dLw
 KFOQ==
X-Gm-Message-State: AOAM53371yj4WRYc+HNPr/uUP/8rzb2GDirWRSLhpoOPHlHit7aJJr2/
 V+Ag5hErPLdMuIhYWYdN4uEweN0dB2jLFeIrVYCT7g==
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr23695691ybs.140.1647367780196; Tue, 15
 Mar 2022 11:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220308182452.223473-1-eric.auger@redhat.com>
In-Reply-To: <20220308182452.223473-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:09:28 +0000
Message-ID: <CAFEAcA8fAWcqf6K5pdh2_ufBEkaHESbJ+jC3xvG0b15JSGGUeQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/virt: Fix make check-qtest-aarch64 when
 CONFIG_ARM_GIC_TCG is unset
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, drjones@redhat.com, qemu-arm@nongnu.org,
 f4bug@amsat.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FGoNmjQBtpv

On Tue, 8 Mar 2022 at 18:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> When CONFIG_ARM_GIC_TCG is unset, qtests fail with
> ERROR:../qom/object.c:715:object_new_with_type: assertion failed: (type != NULL)
>
> This is due to the fact a bunch tests use gic-version=max which
> currectly unconditionally selects GICv3, ignoring the fact this
> latter may have been disabled.
>
> This series renames CONFIG_ARM_GIC_TCG into CONFIG_ARM_GICv3_TCG.
> Also it selects GICv2 if gic-version=max and CONFIG_ARM_GICV3_TCG is
> unset, in TCG mode. With those fixes qtests pass along with
> virt machine node.

The use of module_object_class_by_name() looks much neater than
the ifdefs.

Applied to target-arm.next, thanks.

-- PMM
