Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2091201lfy;
        Thu, 6 Aug 2020 15:56:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtG8x0n6KKw5PNUVXpYDIoPm0wbd8dF9DeJX+c2wDfu74pF/igHSpxW8M0g+D2xi9uljP2
X-Received: by 2002:a25:2b89:: with SMTP id r131mr16102936ybr.131.1596754573862;
        Thu, 06 Aug 2020 15:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596754573; cv=none;
        d=google.com; s=arc-20160816;
        b=UxYMJRjpG725oqI8LypCIkBBRVYPUXbrbZPLyumxhSBvOpmq436k2OaNRVJ3j4w+73
         Cy8CjB79TvoGJ34ZbzR7nrAGck4yfyiWIlJWupD7VzDZsJqeNbc0G4oP5s3cX2y0/2Qb
         EBHV4yBvBMyEgciOHrfsN4Ifod0dy8hfjuiO3u8bsvbDw/GmFb3nZ1j2dXGr64eW/U83
         W+aOu3JNyDCv9rn64zHmhqpNZw+IfiJRdGA0lqWN7Eqn0LoFAi6q5U6RErBU+hmYv8z7
         XxaVURV4UIQokmJXxIHytEjg4FAQHKPUO7SBZeXn64wsh6VvF7AAfcZZlzX5+J/SVF4X
         DN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7Kv3tbuiDOZTDYkzw3VcpO73XHlPN/u3caV0G6GNCJQ=;
        b=jBufSAiuEBMUIIRPYJ+7j1h5B8Hzs7hNYPp8wWcb5OL53R0AwqakPHXDgMDg3vtUc+
         nMuVW2GRMq2MoiZI7hUCsLqhIQJVaIir7tu2A560UvoRKlVzRvhRwTTIaVLJDcS2ey/I
         SB9SpWCG7uh7WNjIeO6ZGxeGS8NwiDFfgdiND4yO0ZOqZ719AKuHPTztwPPnzS/2+IUN
         a1kqHG9yxtYqkz4Nl1kWxw/d+G8elMkQphLTMJ9e7Q9zHyUUvGD/XsPjcQVNHU2ZvE8X
         0HfaSOkdR/pO1dAFiVYan+UOWvYAVazgr9MQ14klkKUnCF4RV8JnHt7/HQeEwYQzs0MJ
         jDAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=XKMR4sb2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si6403263ybh.9.2020.08.06.15.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 15:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=XKMR4sb2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3oo1-0004g6-2H
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 18:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3onT-0004fd-OD; Thu, 06 Aug 2020 18:55:39 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3onR-0007WR-8o; Thu, 06 Aug 2020 18:55:39 -0400
Received: by mail-ej1-x642.google.com with SMTP id o23so83072ejr.1;
 Thu, 06 Aug 2020 15:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Kv3tbuiDOZTDYkzw3VcpO73XHlPN/u3caV0G6GNCJQ=;
 b=XKMR4sb2pzeZuvD0YRbHJ7lYjBiw8qOk5ZXDl9VCrTnDQuY8ZjhvWV5ebCCQKM2RGs
 PXoi8SScqkKLvJZCdv3hKUkEbBUfENyhJJxWZyt34ZnDQoJTOQMz3txOyGm1zxnsogUR
 IRuUKDGrBVnnNpsl/v+N8jQauVhDHiw+nOE/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Kv3tbuiDOZTDYkzw3VcpO73XHlPN/u3caV0G6GNCJQ=;
 b=uZ7acwfiwDpmlctnc5BVWErUz5ZSXBit4z53h7pH/Ywh63cKkqjCqylpZrQE4tfcbS
 C8n/4XofBQJ/ZZg6HtrSroQjUEjt46EN67RTPB1JMvunssnjDesKIV27VxOiyEGOMm34
 701f9h5zI9gkx84qAaiJZe4Y8C/WTDH3M1teK+A8MtgRcaPpUNrtxc85ngGp5Fseh7RD
 6OHIXdcwqDBaSpreZ9qOJblrJ48ejvdUJufcd5eJqDQi3icuqGUpzWo3EnWdWWn3uCR3
 txFtb9gj7mhEFnFgq0N3ArehKa4z04vTmPfij26hjTrAVWaklJPc5NXXGvYKqNcLqxeX
 J2/g==
X-Gm-Message-State: AOAM530Qd7xjXSG48Y6c9wMnj7iVTtc3/+1FbZOshZkdDSDccHJlnPJ9
 aYoiJfZYihW/aOO8ufWNa6x5k2lxerH7SwuHsZQ=
X-Received: by 2002:a17:906:c143:: with SMTP id
 dp3mr6504715ejc.504.1596754534905; 
 Thu, 06 Aug 2020 15:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-3-clg@kaod.org>
In-Reply-To: <20200806132106.747414-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 22:55:22 +0000
Message-ID: <CACPK8XddhjsdTF2tiiuFoDZ9L+LqOSJLydE-YUAqkbGs4OvquA@mail.gmail.com>
Subject: Re: [PATCH for-5.2 02/19] m25p80: Add support for mx25l25635f
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YrDiru3pkC5u

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The mx25l25635f is an extenstion of the mx25l25635e. It includes QPI
> support, 4-Byte Address Command Set and faster transfers. See this
> document for more details :
>
> https://www.macronix.com/Lists/ApplicationNote/Attachments/1892/AN0200V1_=
MGRT_MX25L25635E_25735E%20to%20MX25L25635F_25735F.pdf
>
> Both devices have the same 3bytes JEDEC ID: 0xc22019. They can be
> distinguished with the QPIID command which is only available on
> mx25l25635f. The mx25l25635f also has a longer JEDEC ID that we can
> use for the model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

We don't have support for this one in upstream Linux. It's the one
that Alexander tried to get merged by renaming the mysterious
mx66l51235l.


> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 605ff55c6756..1696ab1f7821 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -218,6 +218,7 @@ static const FlashPartInfo known_devices[] =3D {
>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>      { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
> +    { INFO("mx25l25635f", 0xc22019,      0xc200,  64 << 10, 512, 0) },
>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_=
32K) },
>      { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_=
32K) },
> --
> 2.25.4
>
