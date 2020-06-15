Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1588997lfm;
        Mon, 15 Jun 2020 04:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzY2up5tv8MB32IcYjPCoxJlyCBZdWUdqs8Wq15PArbXfpZ7TXmo+xYdoqFpkFdA/tEdXw
X-Received: by 2002:a25:aaa9:: with SMTP id t38mr40913739ybi.312.1592219219930;
        Mon, 15 Jun 2020 04:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592219219; cv=none;
        d=google.com; s=arc-20160816;
        b=BtUFJEsA93pBosH6dy3Vx6ngQPTqJqWpxlKij1eGAwXT4wzB3+9EHySiWZ8LBGdP/u
         E1pLXBMYVOco8B8JWWWr5jk80jjEh8FVgUmxE7p+8MymUyXApqY/JNAwjd5KgZWwUtPD
         5pOqwV1XqM04l+1ZCpdCrk4PRW2XZrbzQvZbiT1In/T+Ws9SQR0CReKF0YC222mfIfth
         Ykr20NI6jXO2ad+LgcrTOR57U055coAwNdiPVAe3MsZcB9HVkXhvQb4PowAPbgLz/bQl
         VHfE8gmLZD+AtdPzQ0UwWiqG6J3GlBdS/HCxlpBfThdRpwT/TazjV7R8GzTiuC5y4rAd
         KQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t4jnwsfDh4rQUgMQ8ScaNHjXqaxBLjFZUQJluio1Pk8=;
        b=kNqokhGbSkjmrDkNWp7CuoA90LWOwiS7gvLi15CGNdDTBweB/2amLVo6VoimX6zn6P
         oEOMQAZhdOP3cCU0GTThw49JyKB3UuA7i092m6fQjCUyT7TDqp0LGVIOzpOC6thDKpQ7
         SnMYmy0cFWnMzU1LDxNQcL2BHxw6xYyG+8To5+8jUCZNDsg+cuLP5xnePvH3+KNeh/Ru
         Bv1qzsDASWhtYaOmQX5tlLzdOD6zRtPXx1ByNKJvdFsgXd9a6mv17XG+IgH1xCVt47S0
         PnWqbdKsTUqesNCcbw6XH+PviMXnWRcQuTPEnIYdoRj9LvjAJUunaEdmNWY8oyIXYNFJ
         vo4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3TT+qkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e81si14588228ybf.12.2020.06.15.04.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 04:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3TT+qkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkmx9-00015W-C6
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkmx2-00014q-Jd
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 07:06:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkmwy-0004BT-Qa
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 07:06:52 -0400
Received: by mail-oi1-x242.google.com with SMTP id 25so15457228oiy.13
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t4jnwsfDh4rQUgMQ8ScaNHjXqaxBLjFZUQJluio1Pk8=;
 b=E3TT+qklclIkRzn9FsH1hqTIRuHGVitCx1WtrZfB3ulVSPeyCZUWeXlsTsIvP19V3a
 gocVZ1Zsg8iT75wR8SbfSPv09EOGMC0dkId8mbey7ONEKfYvuMzvxNvwBrm0j09fO801
 IU3Qem6COa7Es4ZscXPqN9zxkaIze1Xv0hjw0T8gbtbMwKsw+1a+Tc/fsvOuF2pr8yv7
 gu2TE74JXHFFwMLg6qXU5dgE0cahNb8tplZrln9kdAGGEM8sUpii48vFWArwYeOpJm+E
 V4nuVVDMStbvHd20ObvtHyXugvUNMD5MMEXFoSRThLgv1CAnJJ0qsvLzDlQRMQnsAwSo
 yiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t4jnwsfDh4rQUgMQ8ScaNHjXqaxBLjFZUQJluio1Pk8=;
 b=MgrzPfOJY5g6ppRMa//sJ0WiRukJQX69DUXNNJkzFxNNC7rULC53UFlSKmsWQE4GZi
 VmxfQEh7CP/q+oTJ539zFgiO7B1Mnnw4hWnNJmXn+0r2fJdVdgSQz5KhYX5nSG1ADS3w
 CinG/FfHGUI6tdVTLZ5bdY3SQD5eSkUkDldTOUbBQaAvC5s7njS7p9CVL7QEe2RCvXkw
 Ij9mk4Y6MVpNOwnH9QEEq5q/hEJtrsF4sdfsxaWth2GCg8+Id11zNV2Mpc2M5FBDI85L
 Cuo4g5dYgcQdglvVL4YqRj3/bt8xkC/+6x1XHdgCdTPUPonKs5tyxbDvwvCzakyCWIQT
 Dcjg==
X-Gm-Message-State: AOAM530F60S7if7t+klgH+RKM/XMJTKhhFlxu4luQQOks3D7IMx7Bv73
 XvgSc3BgoqaZXP0eEv8PB5lecyCnAJVTqmqDubPzKAZUd/I=
X-Received: by 2002:aca:5152:: with SMTP id f79mr8121333oib.146.1592219207018; 
 Mon, 15 Jun 2020 04:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200608133508.550046-1-jcd@tribudubois.net>
In-Reply-To: <20200608133508.550046-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 12:06:35 +0100
Message-ID: <CAFEAcA-q3jzqXvm5_bkBH_Yhbf_aeaiu_PXHeCD3iD5S0bpg=A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc/imx6ul_ccm: Implement non writable bits in CCM
 registers
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pwhKDE2oNBh2

On Mon, 8 Jun 2020 at 14:35, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> Some bits of the CCM registers are non writable.
>
> This was left undone in the initial commit (all bits of registers were
> writable).
>
> This patch adds the required code to protect the non writable bits.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>
>  v2: simplify code after feedback on the first patch.



Applied to target-arm.next, thanks.

-- PMM
