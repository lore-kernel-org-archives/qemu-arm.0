Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1792510ocs;
        Fri, 30 Sep 2022 08:12:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dqFwadIkIhDuBcK7q4oNLlX9/ID2fY1DC+5oVQ0/CnPH5i0u4G6nbYNyJLYOD944qBFYf
X-Received: by 2002:a37:e10e:0:b0:6cd:f114:6a85 with SMTP id c14-20020a37e10e000000b006cdf1146a85mr6495181qkm.77.1664550756659;
        Fri, 30 Sep 2022 08:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664550756; cv=none;
        d=google.com; s=arc-20160816;
        b=VOMD3AXWeu4E63Fj2b3U8TtcDK6/6ivtV40vaDaTvwY5su4KYhzCY9B2McUUHsnIw8
         98PJtWzIe5tTpvfepj0q78qykSuJ9mQ6w8HpGrd6CmtH/JjH8XAp7a4EUo6I/aST8Inu
         G8/q55fUB1rPIrhsrJXcw0WibWB1oxVJtOxHXwzqGVOsdaRObdVHXZJqu2lpULIvSrKL
         mJgCaQ6qjwPbDGNKWe7dS9635oYw1dU4bcjT58eg/jblClWxXMcKjtK2QFnUrITBV/jU
         KH87eIbObO7cC0I0nq7TC0nKfV2YQS186jUR8Pz9xGE0nAiJ/lAzd2/PJ/A0QhuJUplp
         pEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+UXzsQ4mxQEbYY/YKVDWD3zpEclhcCN53dbIzlORkmY=;
        b=KWgXhaDUw9gE+aSFLiNDBocBe9FmGQ2kDuN6PvKQXUUseMVx+ye2N9pxqIlayVg1Gl
         8ppSNMxouIqI76Spz0TtSp3iGy/CGK+e9o6sLdBAgbGUyIwUztwdc1sfzrGmTTd76F8O
         KLN6tTCAhaNNSq9orstWs1jH7A7ITqdcnjH4P3FaDqe8U2p4N3CKJi9WIa+oldZ0eZCI
         NlerBEK7lCL9G0bbBwasc6+adObJZILzU327y+FawR/hdYgoKyRNhAOIAlKK9gI5s0eX
         TrlgFFyJUCZRGh0rXdd3fTQ8ZB7HYbFp4Iu+VWJgRKmThStUD1QYSUNajeFx0Z6uG2Ac
         FyNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJ7VyEj0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a056214202800b004afa77bdb29si1413190qvf.585.2022.09.30.08.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 08:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJ7VyEj0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeHgq-0006Yt-8p
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 11:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeHfF-0005BM-Ew
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 11:10:57 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeHfD-0006CM-ID
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 11:10:56 -0400
Received: by mail-ej1-x632.google.com with SMTP id l14so9631375eja.7
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=+UXzsQ4mxQEbYY/YKVDWD3zpEclhcCN53dbIzlORkmY=;
 b=HJ7VyEj0++HeUEu9mEtmVBNLGW0lvalLqBl2/NthwjsZ95M+VgiuaQ1+LdA4Ezth7I
 i4d/U+B01+9G2ODwyZmxDDTWMUfr3+0e+7Qsn/3lwKnipua+Wjx1Pax5XXgklGJOAbuq
 f6+bsa1wH6o8kZ6k4f3WmuodNAFqu/BdbJrCs1U9yaZKeuTO6auWgSFq+IvAbyoHe72M
 IgFothI6F32qeUchW1KbW2ard8c7SDsTv4gjxc4sLZJX/SETfWLJBUdHaWvOiqNZGom3
 9D1fWx6K9XkEHiZBu5Wv44cvDEEqJ7AN45qTdAoE0hUSZLHqG7k9/5rZ4yHVKMw7fiCd
 mgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+UXzsQ4mxQEbYY/YKVDWD3zpEclhcCN53dbIzlORkmY=;
 b=jmjFCbez1E+Napuh9yb7Zegy4WIuyDnMdMNN1KsBgHIWyMIUpWzV1cdSoHcRqEvNWB
 +Oqcz37J0S3SMZ/3QTny3mExB8MWEPGJQrI2/IPcnDI3H8xLpB0PweB1z37TYxR1Hzcx
 my+P50H1N+hMdq65LGQjW4ndM/WB6xNh5fJq0yc+lv47CB+O0zCCnGp7BQaxwTU6E9dz
 NmylMiKqBE9LY78yvQGKbDX4v8qhIXppImKZTiUTI/J3V43Ri6uLXjGnfYanPEMRAxGv
 mnN+5RKHmCkYlDmTHVdQQ8td6EtJ/PZ852jtotcQl3ZSVseMi9pBSjTOxGWYYQV/9Vnl
 c5HQ==
X-Gm-Message-State: ACrzQf3UCnKYU/nMNyizVfueYj7WbOYygtFMJ3qKeXi60bP8bUHS56WR
 0dyKB15CY+o8Q1MkvzCLZ78avtn7+WD16pEfg1+MnQ==
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr7060872ejc.659.1664550654130; Fri, 30
 Sep 2022 08:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
 <229f555d-5f69-1c40-c65d-552a0ed8a39d@kaod.org>
In-Reply-To: <229f555d-5f69-1c40-c65d-552a0ed8a39d@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 16:10:42 +0100
Message-ID: <CAFEAcA9qJjMQyMDYFjTRTZ5uXK5NxzVu-ySqcqjTji5z8cRm-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6xEw40ehP+ia

On Fri, 30 Sept 2022 at 15:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/29/22 13:44, Peter Maydell wrote:
> > If you want to be able to turn off D32 and restrict to 16
> > registers, I think you need to add a separate property to
> > control that.
>
> Something like "vfp-d16" ?

That ends up being a sort of negative-polarity feature.
Maybe "vfp-d32" for "have 32 dregs", with 'no' meaning "only 16" ?

thanks
-- PMM
