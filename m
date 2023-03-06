Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4632448ejc;
        Mon, 6 Mar 2023 05:13:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9O++bgZe+yAGogLUlxrDl2RVgguRPGZOZ3Gg7aPeh+xoSgNjf4egjt5G/EXaEJLWgOHHLh
X-Received: by 2002:a05:622a:451:b0:3b8:1be5:3bff with SMTP id o17-20020a05622a045100b003b81be53bffmr18917520qtx.26.1678108386936;
        Mon, 06 Mar 2023 05:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678108386; cv=none;
        d=google.com; s=arc-20160816;
        b=A7gEY90dpOXmQlf/Rq1qGIHDk7meoD/EAvJZYyCrLbXqU/laGU7j6wSerl2G6xPPKQ
         3GgHejT/uRacH952MkhKok10wttAnnTiHgfKrURaYKCQU/IS1XLn/PC1evJQ3mplcRKt
         wOKDfRhNypntpkxmShgJFR82FV/F0bdidLaJVjaKjSBc2NCjBR7RifXwFKnQA532kzjX
         aP6IEs+FjXxaAJ3JWKXy3SAg6e6fOegr1mfpFEzL8SW28XrQsFJTWNUUrTrh7pvTaS0X
         F2pYY+5BKqK5L1Wpx82LVmTkwnn7plpAmvEQblFe+YvQPWEizvI8HwI9ts5vSz8dFV+k
         hn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NoCulbv3/zQd/zQ49zBPDT83aCiejMTqtbQuLfe1gZ4=;
        b=zPiSwBCIGzppilLn3WtWupVcMskCo2EQNe54iWk4qYw6tKbDMZ+7sF33YLsTKEVSzF
         p9u1RShblclsXqRdT6XRtf2j2+Po46MY/MfgkaX2MEbs63FlgqzBCDS1d/IQnAF7PxiO
         1eWfk10g3CCcXjxZSPFGpagmE/+6L+pghKOzetQxdfTx4JCaWdSSwxzxw8U/bDsZ8III
         jk+TNn5ssHpYeWGFHHY/25POFlMuIuP9PrlpUv42SiOCS7SYOLzYfLfSHhK90/ldKRyV
         qX81QfFwMxwH2UIbsfZe20iCI/K+i/n4U/jBch307Kl7b9y66DzLHXCmELgAsy0wvl7F
         wV2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YtGxQsZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25-20020a05622a1a9900b003bd06074343si7180665qtc.726.2023.03.06.05.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YtGxQsZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZAdr-0004h0-Qx; Mon, 06 Mar 2023 08:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAdd-0004fk-Uo
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:12:26 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAdc-0003Wp-7g
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:12:25 -0500
Received: by mail-pl1-x633.google.com with SMTP id p20so10182975plw.13
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678108342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NoCulbv3/zQd/zQ49zBPDT83aCiejMTqtbQuLfe1gZ4=;
 b=YtGxQsZfX/u1k63kFZHZAXHJUFoKi9a+N8HSE/QIu9/bLWBOyHbIKFv3r7f1GZ1Fh3
 GqGVliHZyuLdCRlZGGEBjgFjjNMgNSNoviEtS9SQZZQA63tMotXjwsQPE1zIyEJMngRX
 zrC+Mutt9Gkt7K1W+9DrQRyDtKmkq34TdUQE0EncuI8Q/SDPI8FF+c7/9WQVh0/O0yQZ
 /c2rw9f0Kw9a8q26n0C8QJxXH7O0V9Ba0Ar/5Q5zgdh0VOKfILv0vIPTeQ789Uyk0HsV
 tUCJYNF9cxyTUfaz0wXuGrhSOC5lKFW3VWXpp8Ti3aVR+Z7tUCNp3x0Z+GL9hOm/aPwN
 tKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678108342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NoCulbv3/zQd/zQ49zBPDT83aCiejMTqtbQuLfe1gZ4=;
 b=KHMSbBVlc54b8RjR8DdDW7z3BbGQfCSfX+vEhw05zWAM/o98h2qneyrOhMQ3XPq44P
 y8EQLhURzKVaOaJQ+DuDH+hqss+SuwCCfK3D3ZtjWBIt+MK8MVDQJeIE3Q1SqLpciOG5
 1V5MIw41nZVIuH13w1KvLtVwM7+0Wux/kWU/zy0+zQaIMyu5p6OO54eDIsfo4fMAPsz9
 8b6h7eVSbA549DagtQkhcdHXd6/KnGDsYIBtZY72fe5MCtSIQOudAlD0dJw4It5Ty2Ld
 yTwtl1Q8m1RFBq64IvaAMxlYqwi7wpGdIaRZk4WcxtT8kZuLcuM5Rc0KaP4ygAkJ+9cf
 ECTA==
X-Gm-Message-State: AO0yUKUKY2QdBuB9Z0ZPUGNwrGWFddzH1ZhSt4Y1++KkHD1F+X95ltPa
 VzwEzEIXQfaiF0aFGyJMzp1XEhy581Xbup722OYEnQ==
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr4420766plb.13.1678108342469; Mon, 06
 Mar 2023 05:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:12:11 +0000
Message-ID: <CAFEAcA-B1Odo=gthNKw23w4Q62BXxOqtK7_dLeRT-heOHc1SJA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Mp5Ll78I20CK

On Thu, 2 Mar 2023 at 11:41, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> v1: 2023-03-02
>
> The first three patches try fix allwinner i2c driver and I already send them
> as a standalone PR and can read it from:
>
> https://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.25348-3-qianfanguijin@163.com/
>
> Hope that patch can merged first before this.

Ah, I missed that patch, probably because you sent it without
a cover letter (all multi-patch series should have a cover letter).
I'll go and look at it now.

thanks
-- PMM
