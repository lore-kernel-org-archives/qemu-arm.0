Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2042367wrp;
        Thu, 12 Sep 2019 04:50:10 -0700 (PDT)
X-Received: by 2002:a9d:4d0d:: with SMTP id n13mr8910964otf.351.1568289010207;
        Thu, 12 Sep 2019 04:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568289010; cv=none;
        d=google.com; s=arc-20160816;
        b=zmpAXJq/BXSwOkCDGRP/khY5RTvmo36YQ2LfhXypIaQdn1zCqGcBVrfxmS+D0yNUQb
         Inqfxd/XtqcntvjgJBM1Um/9h7qeIBWOek04HUZvQTJJSCddJZy0ehGOFkhU09e5KoYp
         0ukyXtTNwUAeOyivU2HXsd9++cyq34Qu+6091sXhgzyWqS9IoRB6tjHiWol7QE4RV8In
         gFKF50Wr/tEzbmLTs8FN8EN+mOFWnmtdNkg/HkLpT1yaOalrJ12o2KUM8khKKKeKNF7K
         rrBTZ7u5p7llOCSjIZnC6Lpd1juuTMPsZzFrFf0M9hj3SVpcoeYUnpA/ju1bP4UefK+d
         6GNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0TALGyqS6vw/07WRSxOGLEF7IH8JmJLM8psL7al33k=;
        b=H3Na4ynSXKG193WdIUIZRhm7kfNfgHLq/1dRRb2UL2jXwO5ohuMCU3/BDI39UmNf8d
         YRMYf+K0j9S3W3jS+BrvDUpJ3ODxSP7o2ipS+s1GRVip1KVXii20L/eQts5vkcCnLOqA
         jTXmHIDBIMsuJK4WM0hzfg1oe3OVmFAkQVtsQGZvuIkKy4+l2vXyfXRnsGnBkh1WpjLY
         zdXR9rZ/BMhRbGe1kFQqY5+1hAs4og+tDBXDLZ5PfqIzJRGlnTFl/Lkj6VrXRtETzR4i
         rVORhlYl26ZYzuNf/10vI7W8M3ucakRCrUF6NAnhVfE3N2Qt3fOfQKy26+VTy/5rYeCa
         k//Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSB3An+7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l28sor12667116oti.122.2019.09.12.04.50.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2019 04:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSB3An+7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q0TALGyqS6vw/07WRSxOGLEF7IH8JmJLM8psL7al33k=;
        b=vSB3An+7k1+kJtG0FvtD8kDeYTF+z0YnaPS2Iw8kerN1X4SjQeaAqOrwArWYuZz8st
         7Ym4o+LVKP/dyc7s/A2pvNU0UfxDwelsEH5O2J+3ve6OTFY7o0tmr2oP0QT49BGe+axP
         n24ZsH2+KtjAfbAmrmWakctoz6HXYochxTumKE7jBsMZOGi4j7GKGisJnxq7HGnYY+tx
         J4b2jLN30tr/+VLa8kkpWmYRqbhp6RoqfRUTVS0vGWrs3H+gxZWPTOC39wZp58cTX2vp
         neEKe+jcLXmo5Z4xjw8BLe8Wx6sOaKYG9sz4PhB8Jzgkx/JJ0ZvLYgmzXj14DMU4gbuf
         i5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q0TALGyqS6vw/07WRSxOGLEF7IH8JmJLM8psL7al33k=;
        b=EI4wnTWPmDYGCJjtrOzr3LdlZfvmJbIcoFmTX96aFea24pr5/EsqzejkBdB7RCB/kW
         DJ/z1n9VyFKOjP0XH1UvBRl5XuTCcPrZfB16BnU6vb3sk7TKTM60H0zrQe/nuYwwCPqP
         Hed78KYMGrMaRoLB1GBgFjo1TzNHo/6b0qGzvQUdGxO0jpDMYIaoFGpchw4a/M4R5M02
         8MnY8wwUK1/IQklLxW9vCd2vjHrpqSs65EMt+RltTen+4H/01fhZHr2M+qoyFNua6qG8
         Gk73Ea05Feq8ofJzvyY64wyrZ6Gb56rdlKmGp0WxQIF45ffLu1XXoo1OeBxylVzcIgZu
         siow==
X-Gm-Message-State: APjAAAWEJknYeBFrDpJh2un9HpzdNltQdhknazJaa6LcDKGJRnM07F60
	qMhrVhrP3KQxF3UqRDrobfbgP5FvaYmynXpIqHbbgXU84qBEug==
X-Google-Smtp-Source: APXvYqxk9aCu3KQ0UFHfhGWOr77qWXEbz2qP4ZZdSIZdx8b0cMFnqotIrdboA4+pNSXzYyTLHsYwj1j/IS2zOCU9/is=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr12609896oti.135.1568289009674;
 Thu, 12 Sep 2019 04:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-5-peter.maydell@linaro.org> <87ftl1zqo2.fsf@linaro.org>
In-Reply-To: <87ftl1zqo2.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:49:58 +0100
Message-ID: <CAFEAcA-iaae3+AKv3F5iV=XnqgaVB3BS1dT_ur+1+YopNqxQrw@mail.gmail.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 04/13] target/arm/arm-semi: clean
 up TaskState* usage in non-user-only code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: g4LyKokJ5+fK

On Thu, 12 Sep 2019 at 12:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Why not pass cs to set_swi_errno and deal with all the differences in
> the helper?

Mmm, that might be better. I think I was going for
not changing the existing use of TaskState in the
code paths that use it.

thanks
-- PMM
