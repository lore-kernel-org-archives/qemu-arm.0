Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3513499lfq;
        Tue, 19 Jan 2021 09:28:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/Vt0A/X/zz9BdHh1x2sF4QzAn6zTddRWb3g21Ytw5/YW1yZNvdcd6QPmcYpejOlVYTUUR
X-Received: by 2002:a25:b5cd:: with SMTP id d13mr7672959ybg.252.1611077323901;
        Tue, 19 Jan 2021 09:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611077323; cv=none;
        d=google.com; s=arc-20160816;
        b=Wwp2pvlR8I2DIfpced6ACBkyZFlnDvxyujiagMZwtFCo95CDXLWPtGWuhp+uw5/1h5
         HRAX+sH1EdG8Ej98tpcPLfnEOxuG1hwyqTYDXWhkZM7Ga0o4lAEsplZrboul3bxJXIix
         2wkfjj2IykVvxxRwt0AffDAnfD9Z8aN+a9k4KgULMoY/9Kp3TtBLBYQuonvCmweLSUvc
         vaUwnOpspBIzl5E7qWk1iLUCGKNlyGJ/mvShDXBfhQNphFy8WPx6ybU2x9J/oKyPzMg4
         fK5ZvsnybHVw/q4hYmkhmYrrmnTxusOOqR2uEDBP3B7O8thOlZpGWATUuETZy4PtbqI2
         Im0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZ2ctHuCZRSSA0vDJeUus78PBx9ryMPOvf5VO8XqsQk=;
        b=ra45lsyEYny1wrgQvU0AVq624MrSYpnq8zwHjxF65qjKP26Msx+u6T233bgjvT5Pnv
         OK9Sr0Kqrh4QjE6FgmOWICBUXbZZohNd/yFKobttma4Gar0nIMs85YRFS0sdqAXgnTCj
         IImwhYiQvH1bwgemKndVkPYnWpWdjKv6sK1cNuCChnMApz55Eal7LYO3eshdYK6si/Ge
         uYx7ZuIdYyy0OKMEjY6MCJnrc/t2PIAXNF11PWXyghvD5GbpX/DMydQJTkw/a2i2uQyr
         SiEJ6Rd78ElDRJKHgru55GHjHvTxJ8PpCm6Y9KrAIBfHI3oQYSAuhYwSrzBdHZVY2X45
         ZzTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cJVdhaJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si19334152ybt.213.2021.01.19.09.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 09:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cJVdhaJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uo7-0007Vv-88
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 12:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uYQ-0001UZ-EJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:12:31 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uYN-0005TT-W4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:12:30 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b2so22425130edm.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZ2ctHuCZRSSA0vDJeUus78PBx9ryMPOvf5VO8XqsQk=;
 b=cJVdhaJwbZcOAJtFjGXuTM2TQwrOhUmoha0l31CnXaoZVB3kK5BgZy2JtAZycnTRjr
 D7o/d+feVaO7ai1DgBCGq6QFl5JYXUqMs5Nxb2wXaCT42hV1GsChaJyMhVhdtBWulT1/
 4zvgyOdUIInYIWOCsROEvajKK5QEoKYBys71LAfHKUzOnajhFavgowr9nsWLB22gqEY2
 4bAjaJ1bsJHj7wZOBzR2euTjxHd5qGedUnJzbmx3TvL86oEJGiKjUvFLUaAB0V7MqQn+
 /uG/gEpSDY1c/IPYIgSWJPZ/iC+CvU2/QCk270Kc0o4ACcg+Cf5hQJACc/j/EOJSZNgt
 /jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZ2ctHuCZRSSA0vDJeUus78PBx9ryMPOvf5VO8XqsQk=;
 b=AZ1gquh6yn8mTsX4KeGkPGfb32iz6NPaFwZNT5MX5LDs4L9RTakYvm8v2zMRAOk8SZ
 YckUd8DW/uWa1Uvn83rU9/FhwTwDsonbILclTx4brgo4dXXRkDdX2+gsF++PtLlEUw4W
 wTRTOIxEQ/J+HbjAQBLtnQ/qmsu17UW17LHabf8r28a3gefo1SuWFcm9EYHTmxF39siG
 GlFZVKpnszTP5XOM+Hvhx0nn5nsPZ4JKslPolBRXhstcQKhxG5n566huOYeN+3e086ev
 djG/O+yCWa6lxSrA7bYKWznJ1XKIrT5+zDzkkOhrIbFbPzYMueva35X5LSCHLjTy8fQa
 5xLw==
X-Gm-Message-State: AOAM530Us33iTkxRzNK0PNmTMtYjg8Lg8hO+b4TNJgWdKxad2SM97elD
 FSJHcibKl4dPDZkEvzmjecJE9jk4RZPYf7AkKiVVgw==
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr3365933edv.36.1611076346256; 
 Tue, 19 Jan 2021 09:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-17-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:12:15 +0000
Message-ID: <CAFEAcA_qGZTgQ0HMSctMEv+veDwgzdgmHt0uZZSKj7=O6UdqtA@mail.gmail.com>
Subject: Re: [PATCH v3 16/21] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1+Y8qgzJacIy

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A proper syndrome is required to fill in the proper si_code.
> Use page_get_flags to determine permission vs translation for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Use syndrome.h, arm_deliver_fault.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
