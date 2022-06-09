Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4085437qvs;
        Thu, 9 Jun 2022 06:06:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznAGNzTDjhke9gnHT+WLb9QF20KFsCl4FP/psAzSdiD5lmKC8vzHKKW38gC2DpzUD/Dkq2
X-Received: by 2002:a05:620a:40c3:b0:6a7:1c41:8a72 with SMTP id g3-20020a05620a40c300b006a71c418a72mr3708776qko.331.1654779989775;
        Thu, 09 Jun 2022 06:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654779989; cv=none;
        d=google.com; s=arc-20160816;
        b=qjXbfsk37cC2nmWKqHmAVF90IN/BSI4Cvv6dvQ5QrD7PAyPLjZ6mkzewBNO1T9qKA7
         5liXXDIDPGsWTIJPp5fVTlQn+bYVSPisSnfKMIVvbci+z8QDhgp9m5FYp+NJZdAXNMQS
         rFEbs4EMX1I0vqfLwlMQ7mXzTsWoQY/DEAO/nkR5QyHu/mLOqZzo9pG9QN3W47+zv9y5
         dhO1cz7bZYVpz0YVeex2i8HNLcHTod88qdNr1t1QFIORMVmAkB2YVQfJHCaxxlnGb6A4
         bTgPtg1LVVMJekNYtk594mwou71CX5X/6QJbDzHZNu49Np7PGBWxBOHW4xSKH/lFoII9
         jtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hCnkYS2x3ui/4354QdNO4nQlKFbTZpM5ktCaEd1vLfU=;
        b=zIlBlbzjsCW91SVMGVioLyQKJ/+hLHX++v2Mgyj8YdelDtW5k9kJ87toO4j6xdq62E
         3ELT+6waQgWI3wIhhmALFxdXlGmzzCk6Tly9tVRDwrdyynXMqXLVWMfOM82qd5KCZiUB
         /kamQO24M2YlzfnVVPoR9Muv1jxJLl+0eps+qzVAsk7XGP8caHcH4OrqGAu8u8UFptKo
         xPkjVwg7WJmkq5i5IGKFcpUwTyOMBlTJfh0RXd7Gz5pE5GK9mtQ2ODyXbQxLm1dCR3BA
         JfRUJKNhvdoyWoKjWJ7zK+jMiEtXYvY3L1qYZbMOg9EgIMV0kzJQD6mgig9kklibue6n
         fCAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bvka2LvW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq34-20020a05620a46a200b006a7316a3b30si627059qkb.373.2022.06.09.06.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bvka2LvW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzHrn-0003D0-Vx
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFtL-0002uN-AK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:59:55 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFtJ-0007oL-NM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:59:54 -0400
Received: by mail-yb1-xb34.google.com with SMTP id r3so6974295ybr.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hCnkYS2x3ui/4354QdNO4nQlKFbTZpM5ktCaEd1vLfU=;
 b=Bvka2LvW9vBThoxwZ8n+orFF3z/WYJBDkKXviJ5iUG+IxHH7QPfm+xVSy0V4xkJ1TK
 a0gzTc740XI3o2bI7FIq9J3KVrM/Rt42T0ptovV7T0K9I9gvQy80zpRqkaqxMBKYOBCm
 tMbthAifZTndIq75fvjvuFOqD66D7JYjwu08wyFnoGh5IVwmUFKbFeFktzKxS8nXAX0H
 vWTahNPrNasXj5FZT9F/Ov5XhMOBS3zii8cucjBuhaMaTiFG9nr1viiksUw1XgENtYi8
 aRV4ymLGPYTbDn2XwFfWiPlZ5ZHxYcBLG/0P9OWDRvvahBKCXs6G5I04BSqJx/gA/Q9e
 2rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hCnkYS2x3ui/4354QdNO4nQlKFbTZpM5ktCaEd1vLfU=;
 b=TN39GCezpHePXnqaej2vdKYSzSv9wJQQk5yNx5hN2iygICoB9omds6UtDZyg4AabZd
 9qyikIMsEqS+seQ6a/u23sKAtzvB0WvNtPPMOdK1cucQxt0ihEmyB8rWKHSLf2twsnoC
 1XO0VNJrHiiXVyI367Oj18moYxfyh/9eBiSsoVmoGWh9U6yGAmVNJBWrmIyPPOIMyS5p
 pKKUrbpCpwe6diQzFsFdjkFEOtzAhewtqyG6t4jVT2pD+jLPfG+tHOmWB/aHd0PmxIOu
 1qNqHaOTaGZuv8SO2U5hy8ut3Z7rTy6cgK3DR7MreIP1ZGarxvwx8vHOr8kQpV86ygjE
 LvGQ==
X-Gm-Message-State: AOAM530R7DZlcL4sBnY7mAXlbeYdKT/H7S5EPmwFIIJjFhLP14FB0E9o
 M/Om1UUq63QJelnUw0krMD5FfjhKHxqKjCQ+frhbhA==
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr38923207ybr.193.1654772392789; 
 Thu, 09 Jun 2022 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-29-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-29-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:59:42 +0100
Message-ID: <CAFEAcA_TAA2wwpuF_sm3oPTGv17Fz3g1Uxy1HFJzT9oQ-9ab0w@mail.gmail.com>
Subject: Re: [PATCH 28/50] pckbd: move mapping of I8042_MMIO registers to MIPS
 magnum machine
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OeawaLRQ8lv9

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the register memory region is exposed as a SysBus memory region, move
> the mapping of the I8042_MMIO registers from i8042_mm_init() to the MIPS magnum
> machine (which is its only user).
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
