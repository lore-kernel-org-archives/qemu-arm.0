Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2640023ejf;
        Tue, 27 Feb 2024 04:34:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVV3vFpIYXoVq1U57liBREHO3t19H+GYTTPQKqeq4lYm6Dt3uyMXSilwSYqKOlM5VrNbl2qls5y09H8CyJPQ/WU9Skz3GXj
X-Google-Smtp-Source: AGHT+IF5P78cCPXNrTXj39DIaMRKA2y6oOcmHz4ktAQBFYmRTQbEGg38LmY01pU4/DGbq5f3uOjB
X-Received: by 2002:a05:622a:1315:b0:42e:8464:d36a with SMTP id v21-20020a05622a131500b0042e8464d36amr6395111qtk.60.1709037251929;
        Tue, 27 Feb 2024 04:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709037251; cv=none;
        d=google.com; s=arc-20160816;
        b=fmdN6qkGwN+4VYQHqWXMaUjt3yuITa0FmpQ9HdiJUBlwumcJBZkTOB/xoNbD+w+xfo
         S6U/guD5yfN3nWA6cTpcRzGAIvvMDGYT64ULNe4xx8PHDbmvn+3tC3PPFv6wc/c1RhE6
         Ug8e40v96RyMwcrg0XWrn1tal79CKGGkIls0bpW9/ki8Ihyv6cAxLOeHku/Px0mW6RBU
         AspezUrq9f5RfLxx3brg2qfDWOfYeamqatgk4knQMnTjK0x2XpXNdqsp+QAg6LyIn0pu
         nhdiRe6IkJ6/JVo720sC3rGTpGgnlx9IjWu+ZktbBffzwmp+Tj9TKLtzaLkHf5KzFVYE
         HTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pEOUocoZ4xSZ5sf4B5oQ2siRhD+4cGJaVgEPNv+cdwM=;
        fh=f2TZ7lGrE5uGLRzg7groXZ+oqVNMISEOrm0oyh5MulE=;
        b=kNvVHyi9j4KRZlBjVgThwCUi8FNcXEa/BaGZJO6DcZjc85kfoE1zlWKBrDZh6cufsH
         vClSjhS5WcpPt09t+yRiEUAjCwGYzT2VVXZw6lr/bA+nt+DUifF7M4IjDYpqJV0V85wo
         /79MHwAWvZ2j6q1HqIcbdCBIFXbyxA0c6H29qChka4eewYIG4KbW+YRHQ6MQcthsNcFg
         f60A2auJDb2ZjWyVostMVS6XryY2dKAQYsving03jiTr4CrBfREfAZZhcrRXSb7h6ng+
         sQCap5VQo2fB2EHbtIZW1HnATF0vQGSL6KTTFrdwZ9ItDhyrlSUYNm6u8yzgk41haNsB
         Oy5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4peydMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020ac85253000000b0042c501aa0ddsi7269472qtn.778.2024.02.27.04.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 04:34:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4peydMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reweA-0001Re-Ot; Tue, 27 Feb 2024 07:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rewe8-0001Pr-TO
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 07:33:20 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rewe6-0007pt-5h
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 07:33:20 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so651324a12.3
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 04:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709037196; x=1709641996; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEOUocoZ4xSZ5sf4B5oQ2siRhD+4cGJaVgEPNv+cdwM=;
 b=N4peydMofJ3ZWiBrWgo/JkAMEZGw0ihS0x7zOmJdroasArrhuObxa9fZ0SFlji68g0
 XFytZRX93N8KIiUDtcOVef4YqXGJ5SxI9ELW0UIb5W3TFPBJz+1GBnSeq/+dDJOlvTjy
 uSzYA5Kg1+ij1hwqRKEe/L11DctVbeXl6dUoSOLcD5axjuCTGO7ruSVnEYtK3lfx2Ndx
 gtTM8fTAurdIKdwxAbFQsuLDJzw9VXVqRahX0U4WiayIHdOoNMdBt4ioBcuPs9D2+hB6
 cHFRvcxEbXyTcoJmvUxCKUwpJCEnJkANk+75hA0wdmATu6/zngKVES17NZT3QsxCmfAM
 kO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709037196; x=1709641996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pEOUocoZ4xSZ5sf4B5oQ2siRhD+4cGJaVgEPNv+cdwM=;
 b=xTAsIxnp67T1UJa8wxFnwWCvT0DXBfgSasyNVkdPltIe9h8ckUU3GN/wzR2qae1GcB
 wEOBVIAg3Lp+SLoDHxLO/8AIcMM4KZAbhHT26JM/reBljKFw3T75qTMB/oUdXLGlaFsV
 4qee6Fek6+AazqKAXNukAz7fugihy/6FhixFBDLXMdQlLJZDHMIbl1G8k6TnrNbmHiuV
 10gaWj8p7stQ19YxLQzqCe0YaZW33qo2eEi21zmkfc7Qmt/Tj1A+BRXNWT+nTyzhHuqL
 V5gaMf/8BWqBbhiBwWvN2m+4K857I5FsR2AuAySINYy1EOcN8LZ5zlAYtN17W+SmUCuB
 SZIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeNIdz8DV1Dqsy0Jnz0fiV/VPzhDnNdZlleLYA/WPvGYrkp4V2NSaC+xdrLTyqYFEDuxvH9RJOLA6rFayWHRVyCgwO
X-Gm-Message-State: AOJu0YwWovwcyqsah2IiFyKDFXKeC6ws14+venKsgPxRMugSKwCJb56n
 rNFAXvsJO62Gy+NFOwGH+HFBhAxjsE5xhw9yCDmtdgP6MvxoYOy3BrlZewS1FVhoN4bqNMXqiBj
 HRWOJ/iqXdAmCJta08vjLn0PwQ6OSWWOornzmGQ==
X-Received: by 2002:aa7:d818:0:b0:565:f7b7:8db1 with SMTP id
 v24-20020aa7d818000000b00565f7b78db1mr3629122edq.27.1709037196202; Tue, 27
 Feb 2024 04:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20240227083948.5427-1-philmd@linaro.org>
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2024 12:33:04 +0000
Message-ID: <CAFEAcA_SzY7nJd_s670g8qttsszLxynDiVXH-=7feyq-vVfixQ@mail.gmail.com>
Subject: Re: [PULL 00/30] Misc HW patches for 2024-02-27
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: joi/LQTuf3Cj

On Tue, 27 Feb 2024 at 08:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 03d496a992d98650315af41be7c0ca6de2a28d=
a1:
>
>   Merge tag 'pull-qapi-2024-02-26' of https://repo.or.cz/qemu/armbru into=
 staging (2024-02-26 11:22:32 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/hw-misc-20240227
>
> for you to fetch changes up to 0316482e876988f7526ebe62d579ad069f485957:
>
>   hw/ide: Include 'ide-internal.h' from current path (2024-02-27 09:37:30=
 +0100)
>
> ----------------------------------------------------------------
> Misc HW patch queue
>
> hw: Remove sysbus_address_space() (Phil)
> hw/nubus: Add nubus-virtio-mmio device (Mark)
> hw/usb: Remove usb_bus_find() (Paolo)
> hw/usb: Extract sysbus-ohci from ohci (Paolo)
> hw/nvme: Fix invalid endian conversion
> hw/i386: More PC machine housekeeping (Bernhard, Phil)
> hw/ide: Restrict "ide-internal.h" (Zoltan, Phil)
> qom: Expose object_resolve_type_unambiguous() (Paolo)
>
> ----------------------------------------------------------------
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
