Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp414246njb;
        Thu, 5 Dec 2024 12:45:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUiAEXNaamvqEDRUcKlsSwKlSibtw1CHijScapmZbqiIFYMPS5B/gZODAa0CXRlaTm6scJR3GesgaXqw==@linaro.org
X-Google-Smtp-Source: AGHT+IF2msLsZ/pCxoirhpOiZWwS+TLjcuynsTkBRK6y2NkgEhyS5uwNemI1E98BGruDUMpS9fwv
X-Received: by 2002:a05:620a:2608:b0:7b6:7519:588b with SMTP id af79cd13be357-7b6bcb52410mr113635285a.46.1733431538907;
        Thu, 05 Dec 2024 12:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733431538; cv=none;
        d=google.com; s=arc-20240605;
        b=a/2YxBl8ADkond4VOyO8cgfKZYcmUM9aTiVCl5Fy9WKBKlVaLr3TbsUFy9xdKtpxlL
         /ZLCeXzzvCOXNKvYbiIcxO5djA+9Ycaj9CfEA09U3rqv74c4z4SCeuH4atQu4Dy1pGeM
         MwSyr9rHFWyoSnN2Rvedoa0bZ+3EZKrE1jknBVyxYHJC9clRUrvTvRzhMsEzBt/HVfWe
         9zAikBs1b9sHArdKFCP7voHv6NxJCxQt7bAJXr2f5whDa1IijvtZNE1Aeh593ws+vM4F
         MkPiKVuJhpBazqlpV45HmlgLiSzZqkgEhG3YWvDEP/h3J6ml8JTu7nJATi2lIWnaxvBU
         3Xlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=B/4yk3j8jjYLcO9HU+90ftFIG4v23nGSfNItPEFTNr0=;
        fh=j340kjalXSsH7WTSw8JuccsM51gCZmSE1lE+IbEKQA4=;
        b=ioKAoytFWXOp7A5Sm9xBOCN8c8eFszGGzCA4xm0Llkk8N1DRtgDVZG/wdN9Oi3KDyi
         tXboBBxue1+OBJ9o5xCIOpmnlZ6ngAsnqJDPi6pBZrjDkCVXgpV6yXgEfHRMtkOY43U1
         S2qYahXYLdQKWLwvIQFyM4Fjjq84JvETn9TDDEUz7tH4qz3JmDCmT9XvhwLpLQCzhG2M
         onsjTSuHk6ftl7IaeVORMsxmMVO0d7WoBEbSVmyJLh4RnyBmzPV0q8L3p+GTnl9RRZk0
         WkkOqr5r2dhtjuiHU2+9pr8aL+3OOKmKpnTleGq1sbg3WOMM7WNcuMeEYvFIBnuQ8Rsl
         Ognw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtociYvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e0a0aaa8si21047776d6.500.2024.12.05.12.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 12:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtociYvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJIiu-0006F5-8G; Thu, 05 Dec 2024 15:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIiq-0006EM-0o
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 15:45:17 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJIil-0007Bh-UM
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 15:45:15 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso1583934a12.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 12:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733431509; x=1734036309; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B/4yk3j8jjYLcO9HU+90ftFIG4v23nGSfNItPEFTNr0=;
 b=xtociYvpcniR/220i5Dx+IBJWfJLWeH5itjsiVZtdP5TnxaxJX8UGGq6uIdwJ6lPjL
 iI2xETxhkErnc95zfjwr+U4vr+snKMdTH9r4MLf1iQfNQZYze1Ctwx8uiy63UjXnpERA
 3jLOck22TbPjjUHjVyY5WX1cBqTTHzKlHB9mcteqUDx8zGl9dZNANMWXUF3UQolYhK8J
 /oZIk3Kt95MW2kAk2nF1wmHEekEuoOPiFbwvANTqXdJFIZxpITHPJoxK5M17ogNynG3E
 5AvVmlnG7MDw2xnh/PFlW0n3qI6CGycDonOE+dN20scuBGkJxvkxRzBXDl2eLJnE4mdT
 iVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733431509; x=1734036309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/4yk3j8jjYLcO9HU+90ftFIG4v23nGSfNItPEFTNr0=;
 b=UTQDKtEWa78kT2Ek4nbz1C8i2oPE+cYtLZjbCM2MvLHjUrIY2BgoWvfYgJauN/x76c
 vle9odnN65KLLX8DpsBa08LIsLqbHYR+jomGJmi7imDWJTmmlOUplkWCs0/iyLOn/TcY
 p022BS5M639fBYF8ucdr+LY/L08gFur+ph8bvMv7+97gwsy8b0vEzrrlu0g3+8JFbhYv
 9/s3y0ZGvwg3IBZaO3cElmFC39pep8pmn0z4XUT3+gS7oShsPhPw7zs+tmuppyJWlhBT
 6CrSxrJRDUtpgaCjsGTYtPPhZb5URXVjlmfYdNj1IodLNrm50zVJZojNx11hbG1RIr/j
 4kpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmoZ+BudEdi25gwNP1fJ/mU+ZQSGV62yPD1Cc2QEPRZ8/mYYC1kFjuXMnij+qHUvc+W9L8uEkuYg==@nongnu.org
X-Gm-Message-State: AOJu0YyIucSsKk3154nA/2RxqArMlSAZ4Rk/RfuBEynHf2ih/AARrmVC
 AuG/q7PcNhHVYmoDU52wRWI4wr8M7IbJNWuHA0lP1uBHX7k25kmgu2HEsjnyC/mgA02xK6qH70B
 3Tn20rTP2Q+wr3hQoB4y8OO0kWfoKSahdZvmlAw==
X-Gm-Gg: ASbGnct2AMS2ee8Bcki5HOkORJoEIXAoLMT8m1hoWw6E7aTBo0JmHZ3W4sZc+e48qV0
 x26WsezCBlqAYZf8DG2td9Md6Aq1Jw/0F
X-Received: by 2002:a05:6402:1913:b0:5d1:1064:326a with SMTP id
 4fb4d7f45d1cf-5d3be69a19amr1041560a12.15.1733431509183; Thu, 05 Dec 2024
 12:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-25-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 20:44:57 +0000
Message-ID: <CAFEAcA8vrTL6EwQud75H+ZKYN-TE8txyj-8vmeApsB56y6vboQ@mail.gmail.com>
Subject: Re: [PATCH 24/67] target/arm: Pass fpstatus to vfp_sqrt*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: jT6aEHPgrIB0

On Sun, 1 Dec 2024 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass fpstatus not env, like most other fp helpers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I have a patch pretty similar to this in my work-in-progress
FEAT_AFP series, because there I wanted it as part of splitting
env->vfp.fp_status into separate A32 and A64 fp_status fields...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
