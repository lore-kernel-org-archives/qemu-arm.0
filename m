Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp530906ejc;
        Thu, 10 Aug 2023 02:17:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuRFGOKK/5WkOrgLXLKSFUVJeZkszM7fFX8Gt33i/Bp/8vJ6kht4w0B9Qw7Lc9A326Dzer
X-Received: by 2002:ac8:5ccb:0:b0:403:ab73:9d55 with SMTP id s11-20020ac85ccb000000b00403ab739d55mr2797091qta.6.1691659060129;
        Thu, 10 Aug 2023 02:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691659060; cv=none;
        d=google.com; s=arc-20160816;
        b=bhw64ry77IWHcV3If4uF3gY0aO+YtHYKrXNN2fMKzFX0KPesoOReXBtG9jxkfqE9vV
         ilwUN/7XRbsWSrL65tMm/kPNlDQdFCJzkKozEBpkf40LZf95XVkTqQvBaDgQGpfiQ6RE
         RvQDMqsnLqXJq/XLx3oZpoR9SMZsglnWekPihdHf3bmWSHNIta2j2eMQeWKA8AyMi8pw
         +opONMp3h1pqKLRAk68JNP0/I+WkbmzI6sxE/ADWl1pnWcmoY+u0CNr3enylcqslJCEO
         6tBICNMGgYQp2UHL6dHMvWipLdiRGOo+irFJahOMjo5xghgR5duwKRCxskQxDcJZSTb6
         juyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cROljJL0g0JpQ4Zaq6M6Leunnnywaeha3HFbFJAjtMg=;
        fh=qQktnNHMF63/lvoaUW87qKTlrnLutpTDl+gH+pSxVgA=;
        b=m0T9peQgbxnjOlpmQXdsKQ6bxFts1rz3OuHxE/puXo5qLwXKWM7EposwyQm0lnx/dI
         KC/lfqufQ/D98OvjL+YETDm+I6ioxUsQTAxCNV2a5oghGQQEwoSW4bUH9FCUbwE0Sr12
         SddGqbPiqP6dZANx5HS16um2qUQvfBZVqIOLyY3TxBgcZ9Ft8cXy72iSfX/aidm9uA3F
         uRshnbOyqcl4HbcVPt4RzjDNeadmCGcAy7/IdUiKUmuBJTgogDx2PAr6slO7XxxGX7dI
         AGbNt6S2wdTPyv9nK6TPQFjNKL3LmQAYSELJiFhYWK0rFpxa6UtWlH7Cobkb5Gj3WHkJ
         MjrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/XS9zm1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020ac859c1000000b0040ff9749944si640235qtf.732.2023.08.10.02.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 02:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/XS9zm1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU1nK-0002cZ-6n; Thu, 10 Aug 2023 05:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU1n6-0002R2-11
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:17:16 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU1n1-000063-V2
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:17:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5236a9788a7so874007a12.0
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691659026; x=1692263826;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cROljJL0g0JpQ4Zaq6M6Leunnnywaeha3HFbFJAjtMg=;
 b=S/XS9zm1x+2jN7SIU5iFOPbaEVricnXezMf0e4+3Jk3PSeBw8g7XMXHHa4Yk2ZknHZ
 IPfQvu/xhu3y6xwoyUtoVxCxb5yHO303bR/bqCgMmHVyL1ujAjIafM74wjoG2WLgenfH
 R2Rd8chPDYyL+YXyWWsjpguPWp38QzsH2DJBERXXoVzKkB3Wn96UZPfXohbDz39mYnuu
 Kz5enXx/xGeJzLKECh9N7eE4c+wA646fj5Ph18le1LSwmq7QIZVGeRqVvdNSEVophAr3
 dRTz4dA8YItodDjVp0QYev+oiavBWrgKySDnj6lZmLIFhT2RclSvOE2+j4QqqqX1SQoH
 eklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691659026; x=1692263826;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cROljJL0g0JpQ4Zaq6M6Leunnnywaeha3HFbFJAjtMg=;
 b=OoJ71z8E9oeCpSr2dgnE6uacaN0Bf5ugIq5sG6ObQDqzOsiDhcUF5WT9swrX7aQGyw
 NOCRrs0GWlU8G8acIDEvxkisudpSL9bVNkwEKToDqRH72xyg7G+j4FWgwv8DfWWlu9jX
 0ziK8XCQR3T2WIuYi/y8cgyoRv7WgAuV+9dyCk9s5pYuKqBeGtsh7TAlY/iaKEFCLwIO
 zs2BYQVkR/PEbTnyT2UfEJX5tB+sWsjH8VU1pli7/Kst8ZPLGv9e2EaIJ0aGR6qAkxpB
 bMJtYDkqlnNSGMKMU9TKdUjdntwYGdzsukOvwaaagcJ08YBC5IvMDvmEY6vgvZb4Ljqq
 Kz4A==
X-Gm-Message-State: AOJu0YxmdP+2EPlKLiWLHi9HvB9BV57zyX+VVqJLzmhEjSq8RinaUXx8
 Zxi9P6ms7wjKD8BV34XQktq8BvbQdntiDo1/MBwrWYCRpmDVF6Yi
X-Received: by 2002:aa7:d814:0:b0:522:2ba9:6fce with SMTP id
 v20-20020aa7d814000000b005222ba96fcemr1816474edq.8.1691659026097; Thu, 10 Aug
 2023 02:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-2-richard.henderson@linaro.org>
In-Reply-To: <20230810023548.412310-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 10:16:54 +0100
Message-ID: <CAFEAcA_utXHbmNydvQZoNVciuj8XnTjRW8zdGRbruyr2QK70ZA@mail.gmail.com>
Subject: Re: [PATCH 1/5] target/arm: Disable FEAT_TRF in neoverse-v1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: t39NBRJfbUS+

On Thu, 10 Aug 2023 at 03:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Self-hosted trace is out of scope for QEMU.

True, but we already disable this in arm_cpu_realizefn()
along with FEAT_SPE, FEAT_AMU and a bunch of other "out
of scope" or not-yet-implemented features. I thought
it more reliable to do the disabling globally rather
than rely on everybody adding a new CPU to remember
to adjust the ID register values. (Plus if we ever do
implement some approximation to one of these features
we only need to change one place in the code, not
re-look-up all the CPU ID register values.) See
commit 7d8c283e10dd81.

thanks
-- PMM
