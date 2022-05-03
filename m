Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1527160lfj;
        Tue, 3 May 2022 09:24:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybBwgid1GcDq+7uZetZBg/IhH7Q0wkfgD9CRa1dQLLr5QaK492tX6RZqjSK8KyHwnBBO0z
X-Received: by 2002:ac8:7dcf:0:b0:2f3:83ba:4d7 with SMTP id c15-20020ac87dcf000000b002f383ba04d7mr15517480qte.151.1651595050807;
        Tue, 03 May 2022 09:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651595050; cv=none;
        d=google.com; s=arc-20160816;
        b=hZy/zK6e0JOX50MZ2N3a4OI2iM5N29uZR7j1nSFq36tMex22Ij0HOdSYIg/IAU1J2K
         3cAZ6R0k5pTGY20V2hSyMzMlOHtj9RjVgVV7kzI+LgunaIAl7oBdTcInBam3TYKm5I9N
         BpkUyuOnGlD3q3g8iPOc2X3tRZYFQxu4Nj7ceZz/f+Djxd7il6UwdhKayUglC/8Zvhc+
         VA9Wa2q+NRvqOcirxqUsEYC2Q6CN5XwhhpC1wAszfr9T3dsSP6Z3GeopciJQZ2/BCjyd
         tUKdTS+cC8xKWLhZQ6ToAnmHngh2xiunF9wmbCfGeKweCf4/GHIZXXXcRAyx6PPEo+A0
         8zTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cn94dFDbnLnjwqI9wYaaOEp4EnInBczDj7/nzolq+y4=;
        b=uj3Hq1JZw69m/LT6GMM9hnGNyx74Do2MfWTM7jKwpxs1jpKZJZB8ibIF9PT/ROreM7
         2hYBEsDqK2pM7XWf3/sNaIv4HsHm0ljl71dB8mrR0ev2dauN6VnhaZAnABd3CoJI3s8e
         p6pUF3igPHnu44YAWvodtY1HAFcRNU70E6pRw2uUSh5aiET3jRqoCjTFnyxgwn2DHd70
         Aa2z6fg6MJ9zChFctbCw5v/wiFP0foNNaBFqoPZCrv5hijP1iJDWXy4JvE1A+Eq+oCQM
         bnAa8AF/mgGp+pK41EllwKwZV/Mhbdfkt9kKtgqV4XzvOFSDMRKzp1SaRjBypZ6y1tZE
         F0Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQJSwS5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a148300b002f39efcc22asi4484110qtx.405.2022.05.03.09.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQJSwS5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvJq-0007hl-Ae
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv9V-00024E-NC
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:13:29 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv9U-000553-6W
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:13:29 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id w187so31926257ybe.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cn94dFDbnLnjwqI9wYaaOEp4EnInBczDj7/nzolq+y4=;
 b=DQJSwS5WWxl3RgwtUqPkYbTfOqAvfjPAUo5ffp1Bjjy4Uq8GHTkUGtBDMAft0iAakR
 7kkE9BIo0MBdCqbQBKiM4aKNW5QQYU5F1X08EMplGNRxs+WNrwE0EeLcdb6OJFIzmjpl
 /b9+uBqgK2vtVtkFtuPcYIacGu6bW3v40bh3dBytGvtRK8RljZUZN3Z3uQby/XwEVEEi
 Noz2LnkK4y3BR2KgbjL3vsHm7AyFIetLS5eNTKDJHHWKaaDk0B6NSmpZkcJd7G8x/lDh
 Mr6NCDQGnSBK/GzcytKVsehLSp0X2I2IIocZZX8JHQ1WJ8ItjnDuyr6QPpFGxo//V7xw
 i46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cn94dFDbnLnjwqI9wYaaOEp4EnInBczDj7/nzolq+y4=;
 b=q9Q8dlQVo3yEY39IbI7y4e19ql8sd3Op+b1EH9J5EA3tjnpHD+Pgpj5ao9QWLcQIK4
 IE+ntZGZvGBe6M5+vMzb1e75CFywyvyJb5/FbjOrUZ5EQT0cmCxK/1nKO2o2Tbp0rScD
 7JLBUuMSki1/+cSEQx+TYc7Y7i5GZBMVcWxSSKu2NRPgfmqdfkE5c2Gy2B+McUE6TjBc
 9UA0j4peRunlNeUZPUtMyGvk1a3OMTYLeukZumSf2CigJdVfXnyZKoOOeBRZZzMA1PMj
 F2nFO7P2mjer5Mepx8pQV0FdtsXLtvKX7BFYE50aDci6hbn1BqLjILFTsPeOmCzJnXTm
 vh6Q==
X-Gm-Message-State: AOAM532zKaDo7OoR8v+VAppP70fXb47JmMHnbUUiiLySdi7DXv9CxCQ2
 NNN1nseQ1jzPWU+QnObc6uW5oHqzWtu+wevquS8eIw==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14531463ybq.67.1651594407300; Tue, 03
 May 2022 09:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-14-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:13:16 +0100
Message-ID: <CAFEAcA8_rbO+5hH3RsYfBUYm7MqpvD57hdrn+30U=6LmJJS=Bg@mail.gmail.com>
Subject: Re: [PATCH v4 13/45] target/arm: Hoist computation of key in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
X-TUID: mzKYe4YKH1Ol

On Sun, 1 May 2022 at 07:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the computation of key to the top of the function.
> Hoist the resolution of cp as well, as an input to the
> computation of key.
>
> This will be required by a subsequent patch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
