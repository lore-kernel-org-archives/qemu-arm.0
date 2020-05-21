Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1706696lfb;
        Thu, 21 May 2020 09:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRTkI3PjnNKYcxgHk0ybuaMRBVKksz1L6bsR8fBnq39URZPr26z/y8Dj7+sRy6o5lt2y4y
X-Received: by 2002:a5b:5c6:: with SMTP id w6mr16655677ybp.339.1590077325844;
        Thu, 21 May 2020 09:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590077325; cv=none;
        d=google.com; s=arc-20160816;
        b=jhkjb9SFluZcA7n+3pM+RIXrITNGITmaNg+xCkiJDTPa7sYkNvHCGOuak8xoT4Xf14
         KJ7Xg3tOSeC6htACpFDux3oB2R16az0zwecZlDaD/qfy84lTmeW7kBd1OMzv5qdiXplq
         LLsIFqMqK3Tw4RrOOxr6SPCHcdadHKD5DP4yMxuBMQ6aK+erMMYkIi9AnqqlBPOj+qzL
         CRPgtWk3siHtqzGio/AmOg2V2VI+JFCyBT4AYoc0Jww/lF0r3Sy7vOb1HFCCpNsBUDfJ
         UYJo9kFicCvnRTlcuWFFwWZXBXReSCrCSQeCD8spCRypqzfUd+y/NwMA5+7fQiyZ+o0i
         JZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IOLhARJ1tgt+Qu6q4i7HRkc7EUqe7jOLcBJP52QCNTE=;
        b=X0GC/xf+gxa+xdEHVrK1bu0PFzjiW/EFt8un115REzU9I5hEqiNecQIRwREdTtB1FO
         qJmbiDhIv9JeblZdLZYXtXI7Yjvgm64Fth2qcxBRGYWJgl9tNlbAxnQjql0FSy4/XTj4
         6/CWSxNKTykplgSdog2vd2F45AlRoVmQu8cuevm4ZG7Thbv/B64lkB/NonH5AbeH8bOu
         hbxn19aGuKgMnl3ZAj3sXTYfF3XWJOpzkRsfC15S6DROvJc8030tt61sWcMVSAsiV2Tg
         Ep1mm/WM/53wTHhYH1R9HPK9FwbXfOB1RIjXg7/pcH8iC2j0A8SCqESI3hcNTWyFNvkc
         Rkbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fnbbSfya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si5698033ybc.170.2020.05.21.09.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 09:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fnbbSfya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbnkT-00077L-7M
	for alex.bennee@linaro.org; Thu, 21 May 2020 12:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnkK-00073c-Rb
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:08:36 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnkJ-0006c2-BJ
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:08:36 -0400
Received: by mail-oi1-x244.google.com with SMTP id d191so6614157oib.12
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IOLhARJ1tgt+Qu6q4i7HRkc7EUqe7jOLcBJP52QCNTE=;
 b=fnbbSfyalB8AL4UEc9tN2OhQPNYiYnSOqp4IdTddT/GPQdxycKD/wBlDq8dQj15l1c
 HgvG9d9a+zb9nm5tirQhEZctGAZyBpNcbYud4CmZq8iVyo0cjUBA9SXVeZRl8dQY/WN8
 SYKJ0Hg24jVIYIs0ag9ssIx3BD7eiHw6A6VKKUeyr8oj7UgQrCy5QVqwq4lIwPES93eG
 NJ3Zmmj9Jsw9XYCrw0OHrk/h7VgB9NMRBRB9IXJwTbjMsoM/YrG9UtIJGTdbzNbpwqi9
 3vZQQk7mpdX1ypyDuqWErwT6VXv1VDrJcvc9lB8lZgZc3SA/an7eOyfqhjGcgEZh68JF
 vf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IOLhARJ1tgt+Qu6q4i7HRkc7EUqe7jOLcBJP52QCNTE=;
 b=faWn2ReKIVc7L/FnziK6WVGXOPRAS0Qgl2Ky2+Ti7d/5fRfNXWgGOmTrvCvN15jGSm
 g1CgeVsVQNDEc8wN1HKf7YzwIWS4FWT8ZA79KzCn0q5Pd/DsbRUnsZKu5gvL7T/7OhzZ
 XQpLyR9iseRMlDnSLiMlQJCFlcVV73WpvFpY++GZ1pgaHyzd2H3tdLaWSnANzYFwK/4i
 vzApEY+i3Fgqn49XDg56JKeRJ5UL1mvbeXHu7Bxc1UunIkJcx2d+xqbLwFQveQzO8jb/
 69TGKX0rEv0nfpFnbrE7BwmkRIwTTNQ5tFAeKTlPlbX/j0tzUf0GxJfrwYXana4sb93Q
 fPjg==
X-Gm-Message-State: AOAM533gof/hTsFJ9z66PEcIfzGdRDXbJYLkY4eaP0ovQo8nsDR7dqdd
 rUz9RQrFZgyWnsi3sOr3/UhMpRQ0nH2t5+DDM12iK8Ke
X-Received: by 2002:aca:eb96:: with SMTP id j144mr6697722oih.48.1590077314309; 
 Thu, 21 May 2020 09:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200519085143.1376-1-geert+renesas@glider.be>
In-Reply-To: <20200519085143.1376-1-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:08:23 +0100
Message-ID: <CAFEAcA-BR=jHHLfvsy2CbUA1v+P1_5sOrkHnms_CCyMscppPVg@mail.gmail.com>
Subject: Re: [PATCH] ARM: PL061: Introduce N_GPIOS
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8/uGT/vauQNa

On Tue, 19 May 2020 at 09:51, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add a definition for the number of GPIO lines controlled by a PL061
> instance, and use it instead of the hardcoded magic value 8.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  hw/gpio/pl061.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
