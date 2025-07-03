Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp431133dyc;
        Thu, 3 Jul 2025 03:15:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2Ppb+ouFs+jGcUJ1BBLhiMDaD4arkt9Z2KLeLIWYaCRcEHbgo54hsx37cLbc0MMANfld0o2kvn7baMA==@linaro.org
X-Google-Smtp-Source: AGHT+IErZ8dN8/ZgrJZIjAA5wmOKWb+EKratdSMez8AY25BCgH82QTzhElyICC+HmUCXtAx+e7g5
X-Received: by 2002:a05:620a:126b:b0:7ca:f37a:2b4e with SMTP id af79cd13be357-7d5d13f205bmr378918885a.23.1751537720865;
        Thu, 03 Jul 2025 03:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537720; cv=none;
        d=google.com; s=arc-20240605;
        b=WEJYzGzYGQz0hYcjDq1k5o3+yMiBowWYcn5GHcpBn0sEtmggYQSN0MUGrOdB4bONud
         fcjMdxOEpDIHfGQwvo/NviSy6zmj9ZQvqpticJVfy+/45DVInOwHmQjKSvptATKmXWCi
         ANo8LGwFGZRB+zVUCKZx3lsOLgmx2wWjtWUvnPOnSnHqVVovKGD9Xc6Zj7Pcwx9879/1
         hBKbLlrWEARC9CnxXQevGOmNX2PcHru9p2j4rkDzd928RMBRQemJXW3qoYiltCDrZQ+E
         RDANL3w2Bs8rjHsjCX1q9Yf7xgpcrbtWHznr35Usd5s2miZG2eURgv5TzXJB1vfXu2AX
         TxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aViMPGx1ruWJPe6ev1NB/jE9/Yb5UbdOnAcP1umvZrQ=;
        fh=k2k8nVDbyi0PJPgsTuKpZ952FzRq1eS7phDbT9bHIp8=;
        b=iOczO6jR4GvBF3v6R2prOlkl34QsS/2/gtoYobZiQKkjbjPjQKvZjtq9CUeSZT5hMx
         QKZdjmORaZrZ9PeDSoZARyt033SQ6MRmpcp1F8ds0lHEjb2FDcTRqDBWiSfWc4ckkDrB
         7V+6NNtVdQNhqvYbP0prTH9BPdBobruwuWp0izxn3QmJoHulLnEehWjks72ZxpQaS5b5
         C0c6srOsU8d738UQr1AIUQYP6HKVWvtcAqZKd5zjqYeC1nn+htM5OeLYp7r3C5eT0O7Z
         KM6/2/KDfeQcvEzGawNw4F+Ip4cwGX/wYylCbIk3Vf1qv5uNsmfEPcnAfzcq34P+4OvL
         7NSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYo0cGX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d456567764si944985185a.639.2025.07.03.03.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYo0cGX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGyC-0002vU-DT; Thu, 03 Jul 2025 06:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGyA-0002ov-Ab
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:15:06 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGy8-0001LU-6f
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:15:05 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-714066c7bbbso88676037b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537701; x=1752142501; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aViMPGx1ruWJPe6ev1NB/jE9/Yb5UbdOnAcP1umvZrQ=;
 b=yYo0cGX5JwcIcRXtGO/FTvWgaCKOJUQ07ru8ckFIRqXN1rz6xNvojejwEEf9jvu06X
 So+FQEIdXQp+5gHIQ6P1UNfcT6/ZpKTuyOGaOub1zSen2LBtvtXAKOTkyMMmXeS/Np9C
 s59hd36TKSSOSGMlLzJIibGhLNjzm2Fj5CFTGTXXYls4MO9fGQt1Adn8rZwupOFblzM9
 oE76C4DyRkVGDOVKzsNrxBjhtgGcPwI1El1GkqLS3/fBJrfRMMSBmTOE3yaEkipPMrob
 Wx97OmYyMB5O61/5mKUjeI+7ot6ejDOro8mK9fKuBOXpQ7tJaDNxhxz71mIGGWeFRSgk
 kM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537701; x=1752142501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aViMPGx1ruWJPe6ev1NB/jE9/Yb5UbdOnAcP1umvZrQ=;
 b=ZRwTERKP2WxRF6n9TpWeYzPhum5R8kK8v0kJlrzVsxf2LW6dxYnGRD7cJpv5LomHWD
 kysFYDCRN3kR3lc0Y1BWpKMrq0GOQ/tv1ea8tJRCuvDJDs0zho3Tsr4sa9zpjFiq5vY0
 umxEFgyJCsDqd7+2Rk6l2a/Yg2dCuVHDHgQzhGeycUW4quWDPXIAho8D8xtV/e9IAfoP
 svd0MKSDKOTWHYyIX2kEOM823wuEpe9/Xgb1MckYenqDD+XyS76y75NreilvHGbQ1gkb
 C0D/+LEkhWIEUwLseZTEpYX7/BNx82g180cpHdQ+kE49wE40JWBPbN7GYhIdFvF8ur0P
 upLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtEpzX3/mfqE38Qv/quqclB/5jwd9K9woP/Cu5swtxEknjcxJqx7fKeATLm+HHQFzV3qEHT0uzWw==@nongnu.org
X-Gm-Message-State: AOJu0Yxi9CqUCvBcHTXq91G+2CHdP6zXIzTcLdRoTcXLk/Strhvfphnx
 xhCKCyS9HGc1Jhua1BWgspGb/at8+5mA6LdZvciUOvjHW7Ty19aIMhUZ0P66yWazvFmD9CQqapd
 Y+qgVNhHfDogRXoEo/GvELtUN51pOQ5qMXgwBHSKCL7YqtJBJe7nQ
X-Gm-Gg: ASbGnctuuj59AqOAnr+iNalnOhFy6kBngrrfu8+DZQ3aoFKpwTmmaJLRtfhlKiRH6nW
 4TcMirG/6T/jyPMb3iMj6YLFz8QsHs3UukxBW/UbkgmLImiCY3i6t+yvwFe3y44Qejkjc6xgAay
 b2AOU2gcgj+lKujMByOvDuwbI4ekvSrbpMzf+RSUOJAHup
X-Received: by 2002:a05:690c:6982:b0:708:be8b:841e with SMTP id
 00721157ae682-71659100e33mr41078887b3.36.1751537700768; Thu, 03 Jul 2025
 03:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-47-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:14:49 +0100
X-Gm-Features: Ac12FXw3GlEW7Zjmmy-bx3hJUmx3y2zBiocLJ95Hnufx0w0Cw9W3gHUEIA6Jt-g
Message-ID: <CAFEAcA-Oc+Hk97gsEO82m1ugVxJWXPn6K07VL9ga_qTw6MoJyQ@mail.gmail.com>
Subject: Re: [PATCH v3 46/97] target/arm: Implement SME2 FRINTN, FRINTP,
 FRINTM, FRINTA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UzyABSRCT81T

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 9 +++++++++
>  target/arm/tcg/sme.decode      | 9 +++++++++
>  2 files changed, 18 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
