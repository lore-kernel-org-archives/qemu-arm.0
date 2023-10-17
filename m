Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4050562ejc;
        Tue, 17 Oct 2023 09:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF913NjhnLYdzLoGRB3kASZCGuz/Mw1H/ngZm1P1pOv3aOHDAXra2ODkdN9e0XpMfFFIAlh
X-Received: by 2002:a05:6214:1d0b:b0:658:9565:9736 with SMTP id e11-20020a0562141d0b00b0065895659736mr3440449qvd.56.1697560413963;
        Tue, 17 Oct 2023 09:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697560413; cv=none;
        d=google.com; s=arc-20160816;
        b=bupJ3xUCPyhT+/Fi2gx3/EkCg6I1z7f37fg+fl1uXaQNQQy7y/u8UrbXxLEZSk5hkn
         wvY/UGR3G0+OHx/DD8qWVrvAMMwkWgE+uM7qz6pqkC1eN3vTN0vzjILz2QZGqXcitf2s
         UeJxxy+eozDOnTEFPQlWC/l08VYwNw+TxnsMwE37s9seC2a79IfbY1UYAI3F2GPkLvy9
         O6+OLHzZcl8AXhzS+FLOYCERoYQ6G5hHHdFrRAvVrnClJuA89AYSFdxaHnVAwGxbGzLv
         pIrexfzHl4SJcgXZu++Zjq8LIdfLSs0AWRE/+xsxzQDg2PotsZEga3jxZNBFDTZO/74x
         aYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ApZ6dWptMed9FFcnGR/+NtEdFJDhlsQueolLsuqiDCw=;
        fh=SK5x4hx8wvzk6BSdv/2ji2hc+6Da5OLpfcqaB6Bkztg=;
        b=lHD8LJH5/yNjC3H8uqb16i2slZdH94AAf1RQmq+6YAYrqIWl6Br8n6CgMcpB65qNV2
         bSPgNF5zJSBwT00wYEtN5H0kGUZ0WtR2y5GoH1DEhEY/6Z4gLHktaKzICPpSAzPVCGMe
         IOOfbg+51NxkTg2CgelAce90P4bhtqeSONdKjwdSfeRDidTGFaQ2e4EYKSYilrRVZKEk
         i9kxUDHv29ciMgPKwcai/GITuW7IACCKv4mMrpPOdpG4430HHKzdHfw44pnecGolXRby
         vKj8tPcM6OVi7tYZGy3UvG59CtEEqkY9+dC201HPP9aGdzPGbO+aQRvSHOuwMpLe39J6
         gEow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hRERmOC3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020a0cdd01000000b0066d1eae4841si1254439qvk.95.2023.10.17.09.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 09:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hRERmOC3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qsn0U-0005lb-Mh; Tue, 17 Oct 2023 12:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsn0N-0005Zs-8w
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 12:33:20 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsn0L-0003Vq-Gr
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 12:33:14 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507b96095abso2010743e87.3
 for <qemu-devel@nongnu.org>; Tue, 17 Oct 2023 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697560391; x=1698165191; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApZ6dWptMed9FFcnGR/+NtEdFJDhlsQueolLsuqiDCw=;
 b=hRERmOC3GaFcyMIe14SXBRwmAsi2+ckso1DH4hgbFKLzG5yfKgxDWl79VdfURHLFHB
 n1DWHsPvAj5G+SJ0TWcGbU//VjprevMKvAOc3L1ftsgrVlhQD9ZmbJ59OCgudLJAVHhX
 megq+4D8qs7P3Hps/ay0LRwQfS45sUr7QQ4+y3EWkgjELyWvC6OHN8a+p7Z+bAoatEBF
 jOs/c+xJUgEUc/+rRU+wYbIvLIQSQ16f/wNUWRslMIs+2sfV03vyHaj+GdAra9AvVoKi
 em04a33mT3FT/LPELPrIAbJ6gXZOc1BabHOEC2vEITih9PCeWjWuOfGoIvIvQFYCf0Oy
 wv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697560391; x=1698165191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ApZ6dWptMed9FFcnGR/+NtEdFJDhlsQueolLsuqiDCw=;
 b=OSKashfzNskCf2NycWuvChc3Vx5HeNUF/Jw3JK3Nf5oQjiCI1DJLdrlrdh+8HJYetR
 2gaNpnq7dj1CS9dzcWPT999n6YdB6opKTUudq9Z5MhA43Rn7GKIhjmhh/Zx5yVVY2aGy
 Qolt+LDyDa+KI8iJM/U5ciJmasHlXliWIG8eJe0yHK7zZ4caIgKwPCnICnzmZsqtjSTZ
 XRdO9MQolK4AHBc/3xH/a30hpNc6j2V7AT0zqI0SJdv5VoH3Bnd5MInCejY3Fws9FrRl
 dGsFJWXRdyzGga5SZpsDymUgjFhqHh3U1ifZ/CIYIZLwLBXTu/Dj0vPIGDbOEvTmHEJm
 7ymQ==
X-Gm-Message-State: AOJu0YxcaVUYH4BYpaA+kmDsdn8Nzpvkf7cb1VMQfomueohd4hGi1xjv
 LarVwP8nydYEicXi0QZUw+AMpxzX+Kx++Y3WU0B01Q==
X-Received: by 2002:ac2:43af:0:b0:4fd:faa5:64ed with SMTP id
 t15-20020ac243af000000b004fdfaa564edmr2044674lfl.11.1697560391106; Tue, 17
 Oct 2023 09:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-4-philmd@linaro.org>
In-Reply-To: <20231012121857.31873-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2023 17:33:00 +0100
Message-ID: <CAFEAcA-qgZejcWSvi40p+FsmYS2ipPAua3u9bYA_6LKj8HV3Rg@mail.gmail.com>
Subject: Re: [PATCH 3/8] hw/pci-host/designware: Add 'host_mem' variable for
 clarity
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /Ics6qYgAPkG

On Thu, 12 Oct 2023 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> designware_pcie_root_realize() uses get_system_memory()
> as the "host side memory region", as opposed to the "PCI
> side" one. Introduce the 'host_mem' variable for clarity.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
