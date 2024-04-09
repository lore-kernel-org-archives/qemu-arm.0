Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1928618ejh;
        Tue, 9 Apr 2024 07:06:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbSQlAUneFZ+jal7DI19ZQnjPBE794bXtuaUhC6JXVZO1UpNMCk3X0UU8O7OibdCwL22/Fq6ZyLrmD5INbSk+gYbU9jgWa
X-Google-Smtp-Source: AGHT+IEEN7QzElWetmcci2mU1PSKb4xi+SyZJXBGes4Uh1lOkxy6u4EboFTH6b5B7lG4d0x3AI4U
X-Received: by 2002:a05:622a:1102:b0:434:f6c1:b3ae with SMTP id e2-20020a05622a110200b00434f6c1b3aemr216457qty.51.1712671591267;
        Tue, 09 Apr 2024 07:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712671591; cv=none;
        d=google.com; s=arc-20160816;
        b=ANYR7j9Bx4ZK1joSmRLrPrRDCLz7aoRnwJJKnSxRDso+7bH47q7e4l4jLwZWXCrwrT
         kFGDMy78e2TmyIsYpDQjFf1q0ZgIQ8LHaCTtgpSsEVafYMcYSzJnkj0CHiTJoyp8vx+A
         q1jCZ2QwishUSggZOeReJq8bp0ZcIHoyLZ/rXr7n429ar0gpxeWkQQQqHoZ5QgXQpqYz
         R86IA+VK2VD9QtArnuotTOu53qrJ3R6sgZsYxO4CKXO6/T13khxqfm841T8M1dgc7eYD
         jNo73p7m+8MZUXxnE1dTRFR9jqd4EVDHpKX1cpt3bn6jZBqIQUc+jDdnk73pgK1vCbfV
         D5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kq74n8QmF/8vkVCgPiL8KHqd0m7ZYpshZwl+KVQquYY=;
        fh=lMr66YWO2NNsKPKpMDQNKa75STa8w1P0wpumtLrUy6U=;
        b=Rng1KYKY9UOckZRIpwFkpzPD8t+5g5Lxoh5Ok5OV7VJ8JHKB8jl2MuNU/VB6VVB6oH
         AYNSPQKcQWjcJiwvPvpTv0UU5rtsgbrPGcB2tUv3XIaxzAdJYy0DB5OhNRA6bXaP4gfK
         rzmSZ2lY+hYqEoW56RdD3SOPaH8RISw0L+AUokOGveMrVKG9G/VMPrRHvu61OLIChull
         /FKZjrVR+fx7U3BbNtp5GNTOZ70IchPHYcQPu0XTHJLO7F+i4II4QnyHkT2FBhv6FRwA
         ZdqjJkC9CUewp2Ff0zmEtSE/X5ez0TAThzrSmgru+zVRRf05/CdtmZsN7bGOIPKwOU/x
         OA9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHpkQ0Vl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020ac85a13000000b004346094bea9si9685901qta.643.2024.04.09.07.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 07:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHpkQ0Vl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruC6d-0003sp-JS; Tue, 09 Apr 2024 10:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruC6c-0003sK-KN
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 10:05:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruC6Z-0005bq-SL
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 10:05:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56c404da0ebso8425120a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 Apr 2024 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712671542; x=1713276342; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kq74n8QmF/8vkVCgPiL8KHqd0m7ZYpshZwl+KVQquYY=;
 b=gHpkQ0Vl8nD/euS0Ra9kKydYdldMStD/oxqyZx7Tpm2CnMLUg1cBjObsiEiWO2/D1g
 9C5xVs4S/fhNrvzCM9Y+DXxantCWoUbRTZb4Fi+4UhJPzplD10VoTeqOVNT1ALcKIS7W
 iW8dil6zVKReNEa/rU5/7Ot8dIPBf3fq2pnjFyDeqFCZnfkxhguAM2WxbCioN0ADj7LF
 +2OznMJO2rg80+roLXcFZ10FhTx5YowuZAuPaiKv3nJaZYbdYf279/N8L0pYYen4a3Sb
 DCDxfjFaV3yw6gXiXhTztPBtYUcySH62+tTLiAhW9Eodc1T7LJoznfsh+cJsSsZU8Bhk
 Nkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712671542; x=1713276342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kq74n8QmF/8vkVCgPiL8KHqd0m7ZYpshZwl+KVQquYY=;
 b=lRcd+52Ne00qWL4WO1XP5rT+tufGtW9DDu8cEhr5vYLvkbonvR+t3bds+vWCHZ/2Hm
 2vsdKaq44VWXk870szUQZ+ITqyQSfxJ+YBbpAUgRyEfc5IOkrLz34Y971uIrW28I+hqy
 BPFwCOP+FTwET11VBSwiH0oXcplwU14D3rQVIdGtTHV7K7dOgdP70VYsujFjbOAeqQnT
 63qqQfQMeAReHuhlaq+Uq6CmloWMr7eVma0M1OM9P4QyYd7FFuC2iqUhzE6okkXEqQAA
 oQ4uPLiKK2Gy7wZBPi6J+RzKkOBzgFqdXBQNgIMUQDxDiufU6FEzKWv9RCI9B8KpRrGQ
 37SQ==
X-Gm-Message-State: AOJu0YyaFgl7K4a7IE6P615/FVItZCpAeIISbkcT93d//JaNQpX4Uwi5
 iV1FsCQII4d3dIY5Re0DVPnBsTBxb7uc3AsUIE2jHDi1+8t5SiKb2+mNiEfa5sKM6I6PDa/o0kG
 r6fn2maAgs8VPJFCYgTGEW/50i1u7jFX9Lg/flg==
X-Received: by 2002:a50:9e44:0:b0:56b:9f82:4a40 with SMTP id
 z62-20020a509e44000000b0056b9f824a40mr9019832ede.11.1712671542100; Tue, 09
 Apr 2024 07:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-11-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-11-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 15:05:31 +0100
Message-ID: <CAFEAcA-HN=AL+af2QgvASr0YaUDVgtckpB=ay9sTuHd4m_hRTw@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 10/11] hw/net/lan9118: Use RX_DATA_FIFO_BYTES
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z5MgPMtcdJ3K

On Tue, 9 Apr 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> rx_fifo[] is an array of words,
> rx_fifo_size is a word count.

True, but that's not why rx_fifo[] has been sized to 3360.
It's 3360 because that is the worst-case RX data FIFO size
in words (if TX_FIF_SZ is 2 then the RX data FIFO is 13440
bytes, which is 3360 words). So in this case the array size
is correct.

thanks
-- PMM
