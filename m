Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp568883lfb;
        Thu, 9 Jun 2022 09:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCBSwmytqxAWxKsaqhFWh9FjIzBDYBpqzOqK9MeGk62iPOGDtu/LGYORahBCVfQmiuC+aH
X-Received: by 2002:a05:622a:196:b0:304:f0a4:fdcd with SMTP id s22-20020a05622a019600b00304f0a4fdcdmr16303235qtw.659.1654793632578;
        Thu, 09 Jun 2022 09:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654793632; cv=none;
        d=google.com; s=arc-20160816;
        b=FQQrGenuheq6bubzvEUqVZphgFbDbc5btB8TiJy0jSRsGQVFeZiOOSX0hGLEgIlImz
         D8W8eM8XBe5+ih2H9jKyyscmYnqZOpX7wY7d1k+bjz3aYQ8WZKTus5XX3Qk89qpxWFlA
         MjxxRyrqgf56mtc29t+pNdGFczFi4kS3URvXC/l0sgMf+RQW4TPqSCzaIioU+8rhM8gL
         VK5NM4j9TvqDvfWfTIo/j3PwDPbk2F/sf+VLbfKdVSSaXHmay6Tb+3sVamvf9lvzQwR4
         xGQGomCSIaSTVse7tESyGs0dQDwKwHYu2xQH6In57AQ1Ejwd6zphVgNvQSRy5VDRRhqu
         K76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IXMjwHzdV5pap4XQ71dk+04GLmzD9yvLftnUp4Icep8=;
        b=cDbiPsSJqMLsZxQLLDTU/KFtIDjIqSz4nD92W2QimoUf2M6sZNgzU+WNtqhHrz71WC
         2andhZekAXlDa8v49TDUMgpSTI698s8GCl5VFIwiZm/9xvQeHG0zxWECXzXbiHi8gpUU
         97o7f6PnkmdrC3SdSifz8bb3Ea1A1DT/39p3hHTXw22esM/kRCV6hOgEBJ9NEA1tJhIN
         JgsQ7SNYmOs7Rs2JlUqod5NNRppWKn7x0FZOiCE2GBQTokady5wD5PryPHigHU5ivg/b
         7ehI1hzvrtRdxaPlKd/MG1zl6vjpZ5xwLYqaHJmyLXSgwfgoDY49sge+CynALWDUT2gq
         2+Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=shYgQO3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a409600b0069c8046051csi13980205qko.270.2022.06.09.09.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=shYgQO3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLPs-0005bW-0V
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAE-00019H-FO
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:37:42 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAC-0004he-4v
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:37:41 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-30c2f288f13so246938927b3.7
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IXMjwHzdV5pap4XQ71dk+04GLmzD9yvLftnUp4Icep8=;
 b=shYgQO3rQfDDaaO68LMt/N0Ff9dDVD1gwJH5DNVRK2gLf3CcCkuZbOy4HGANg0j8T4
 D2VyhPPbsdn2vzHJIoexH6trns+u2Ld3FW9+as58tfLTLZ/QyYobusBVvP5jfvWSCn+U
 cOMxx/THGDic0yM3N7qZa88YdopLfJtn37ICFGUYDr9Vwp7LJej4nCHbP1tQJi8VrbQi
 JLQCCctlTafUUIuJRBgo9HJHmbAl1YrSbkBO7Pl2wZzf6bVDLMfDPs0qX69IPtbuS7O+
 hfiWqMqSCB+ErIulf89oexyLPYarkcW8vOiSBJn7onB0qdr8QnzkafEGDDp0qlwLikZq
 r6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXMjwHzdV5pap4XQ71dk+04GLmzD9yvLftnUp4Icep8=;
 b=d12jGeXF7lVP9eu+Buj+UoOT7FHqFA1QuYbUhzdFRpeZJxSG9OtkDa2dKyNoRhIbAS
 s9LnEpcgR07zf1XAlGk9K3FEat4bGjuW0awJb88J29yvNbdQRPWypNlb8P84XaZD7fEF
 gXN/VSVVQaBfDlvwX+znNb0h96Pj7CzyJ19WDs2nA7fXZagzOrzaDjrPCbPPJeVcRVVb
 F8qX3bh/XsMJybwh+SB83bd3N5rJUOIRjeMi4CismokmwpYjM4HLpsMumuRedGHZhGKP
 8NXh78+WiM1hlPpNLRUYzVvV4olZSf03tTJIJMsBDYP0U6XzNYqq31M8fx3wj1ZKStpN
 NNOg==
X-Gm-Message-State: AOAM5331U1wwYipLVDhtQ98s3MxZU28iUoe6W7bs+8sM7hBm9mfJy35F
 iQlUuFoQKA3hmaCt6qmNvSqfwvfvDvlXLIWCdvaEsg==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr42507056ywa.455.1654792659131; Thu, 09
 Jun 2022 09:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-17-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:37:29 +0100
Message-ID: <CAFEAcA_fv3TfoWo4__Ar=RaAVR_h7U8=vzrWjaTSWT77=Z1MMA@mail.gmail.com>
Subject: Re: [PATCH v2 16/25] target/arm: Move gen_exception to translate.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +viFAI1EtgQf

On Tue, 7 Jun 2022 at 04:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is not required by any other translation file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
