Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1958121ejb;
        Tue, 6 Feb 2024 09:35:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE69U07vwGjIqLUvWp0cHvKopLJE521WMpnzVMAJaY17Z5x9Bjc8tzfQWc50eAcvIy3SRvv
X-Received: by 2002:a05:6214:528a:b0:686:abd7:7690 with SMTP id kj10-20020a056214528a00b00686abd77690mr3094108qvb.19.1707240928806;
        Tue, 06 Feb 2024 09:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707240928; cv=none;
        d=google.com; s=arc-20160816;
        b=tonvb9kZX5ZqL8xW3SfwsAoU3UdlQadFeDQQMOmpeKk8b+hQlG/jJo6WHdlyGnzoDu
         MM4muugP9TzJmu37ORDmPUXkL5Svmaheq0JnYznmImNMF1w6xsCbVF4D0/an9FCeCAtb
         f6wWNfAA/amFRtdtesWxLMMlgtfXCEVDZJF0zMnJn5LAncg1X5BsP2u5RjeLw+twFPdA
         c2KvR2gKNEfWwtlCvxKtYMfZaHipHHJVwTpI0UhgdsPKgjybGEAvTmiY3qAun/rcg2pe
         DW4ZquoF+3YwXjU7/o1qSc06bs5awxcSSYyfpsioF86I6G10iZICC71haIDF5GiouiL1
         Bzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yF8BpSrmRLYzUWuqO5QJUnOLMwmeiMm/c0Q7pcVzuSM=;
        fh=tsbzsMql43yuC1wDOc2glavi6ibsxiRgHvo/0Zc6nA8=;
        b=GYpfzb4zv2Gk5ZUzdmSFcCW7KezZU8pVVxxn4U3YVm+CaL07Wd66LZFHERncB2sltO
         zPpvq/lqVRN/zPq+yJLvcLdac0D2toRS0Ynbsh4HY7ZGLoBimj3nGV3ofkuyj1N9IEOU
         eV/Fea3xOyQr52XjGTSA+a1nwG10Z2E2Cqio3R+lXqyUlfoR7G69ASnkOcnjU8e9qQuf
         tWl/a87J85ruzvFlCj53VTaC+oRLw0aVa7Bve2xFTz721A6963TPl3A8ttjBbScYH9VU
         CNDm21pRoa5xqAJ3JdkOVTcTuFu65ecdIO1H+KwSlFfR979bi3BYtwefAh2giN0q7KsP
         5MDg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gjgjA1KR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUgIKcbIl9k3mRFhEXo7+HXuQztzaR+2e9FmyxffoaDd/SvNcA7bSzPb7jbjbbxV+meI1jQdExvekcVUOWGcKczKHb1Mc4C
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a0cf60a000000b0068cb62cb4b2si1342632qvm.62.2024.02.06.09.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 09:35:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gjgjA1KR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXPLa-0004cz-FN; Tue, 06 Feb 2024 12:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXPLZ-0004cU-6B
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:35:01 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXPLW-0008Dt-6J
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:35:00 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5114b1e8819so3946818e87.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 09:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707240896; x=1707845696; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yF8BpSrmRLYzUWuqO5QJUnOLMwmeiMm/c0Q7pcVzuSM=;
 b=gjgjA1KR2pWhjsNGar5zvcVLEr91mfBkqdaQbKQ8YN5g+GtBZJuwzEy0RC0GssMVC5
 3Mp7psoJ2DX9sAPaykgNdg8w78y9OEss4KfBB459JTICEtLsBOCeCJrBY4BDMfo+INxg
 GkjNZsN5whODvdoPQkKvpK1mgt9ETQ8sNjXoGcpsz2gxi55yOEikg9HziOBFiTL9+dFM
 dKTvprYAJbq8ebxZa3wtafffHkVqnnZ1fg1Br33VRXyxSbmmE8W4se17MfZdVir9t9Sa
 fHbenlkcJyH5PCO4TaatY43k8UKHHzU3aWKVDJ2+9vthibsZ0Nj+ozjGS35IhJDEgX2H
 9KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707240896; x=1707845696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yF8BpSrmRLYzUWuqO5QJUnOLMwmeiMm/c0Q7pcVzuSM=;
 b=TWyvBzq34KXCWdcoSHh4fVe4oEPswsv9UbHMn6dNXJfw2jKX0EwaG0Z3NeTLWxeZBu
 KNBJBKGRwsDzR+gGvYXX9hGJaK5F034I4Df3s9zPTXkPIrzAKeoCPb7zPhgAPecW3HFy
 w0Yz92+fbBhw13ivJHNUGgUeOAsVNJeBf2IVSLP7/SPT8XkyA6zqXkFIBCV9Mxx6Wjto
 Q7hv843xj1FE99SwvV3IjGOMQtX4IjFVUchExgGnKS+TvkzA79wlxGlNZu1S/v/QJCwb
 CNpFz7ZWRNT0SAa/TgmAgpZpayhkedZG+1q3kBBM0PTgXfS188xyz8zLRYlPVVLFSM/i
 zr0g==
X-Gm-Message-State: AOJu0Yy0AM+hQnP6uPq9RNAAex2QJEx+C9FoPcfjalUX5ADw+hnnnYYH
 8STXnVGToeiUT5lugnOH22KRglRFXoCC5Nkb3iTXQ3dPS1JAHBfK+T0z6fT/9YHP5vjNaTeBMUf
 g44SG5Eu0iJb5Y9t1SLTPSSFQZnYKSlbQW7+clyhuOWcb8Ufo
X-Received: by 2002:ac2:550c:0:b0:511:577a:3647 with SMTP id
 j12-20020ac2550c000000b00511577a3647mr2390653lfk.11.1707240896129; Tue, 06
 Feb 2024 09:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20240206171231.396392-1-peter.maydell@linaro.org>
 <20240206171231.396392-3-peter.maydell@linaro.org>
In-Reply-To: <20240206171231.396392-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 17:34:45 +0000
Message-ID: <CAFEAcA-DuVwhihFp2cDyWGSPk=fFOX8ctL0iLufKxdUJWhf4aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest/npcm7xx_emc-test: Connect all NICs to a
 backend
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Nabih Estefan <nabihestefan@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: tGYJSDrueo6b

On Tue, 6 Feb 2024 at 17:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently QEMU will warn if there is a NIC on the board that
> is not connected to a backend. By default the '-nic user' will
> get used for all NICs, but if you manually connect a specific
> NIC to a specific backend, then the other NICs on the board
> have no backend and will be warned about:
>
> qemu-system-arm: warning: nic npcm7xx-emc.1 has no peer
> qemu-system-arm: warning: nic npcm-gmac.0 has no peer
> qemu-system-arm: warning: nic npcm-gmac.1 has no peer
>
> So suppress those warnings by manually connecting every NIC
> on the board to some backend.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/npcm7xx_emc-test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
> index f7646fae2c9..63f6cadb5cc 100644
> --- a/tests/qtest/npcm7xx_emc-test.c
> +++ b/tests/qtest/npcm7xx_emc-test.c
> @@ -228,7 +228,10 @@ static int *packet_test_init(int module_num, GString *cmd_line)
>       * KISS and use -nic. The driver accepts 'emc0' and 'emc1' as aliases
>       * in the 'model' field to specify the device to match.
>       */

Whoops, made the classic "create patch without having saved in
the editor" mistake. I meant to also include this change to
the comment:

     /*
      * KISS and use -nic. The driver accepts 'emc0' and 'emc1' as aliases
      * in the 'model' field to specify the device to match.
+     * We wire up the other NICs on the board to the 'user' backend
+     * purely to suppress the "warning: nic npcm7xx-emc.1 has no peer"
+     * etc warnings that otherwise are currently produced.
      */


> -    g_string_append_printf(cmd_line, " -nic socket,fd=%d,model=emc%d ",
> +    g_string_append_printf(cmd_line, " -nic socket,fd=%d,model=emc%d "
> +                           "-nic user,model=npcm7xx-emc "
> +                           "-nic user,model=npcm-gmac "
> +                           "-nic user,model=npcm-gmac",
>                             test_sockets[1], module_num);
>
>      g_test_queue_destroy(packet_test_clear, test_sockets);
> --
> 2.34.1
>

thanks
-- PMM
