Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp708008wrt;
        Fri, 4 Jan 2019 07:16:24 -0800 (PST)
X-Received: by 2002:aca:4ed8:: with SMTP id c207mr1400176oib.276.1546614984798;
        Fri, 04 Jan 2019 07:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546614984; cv=none;
        d=google.com; s=arc-20160816;
        b=ZuG3xafJz7LGXsoJcAGng2uXNVg6lPIAphzVbpLwtMi9Q5fdQKx+LWhxXvW7FvlxIf
         2xHupvKCuyEBcc1Ae4ULiS0xnAhOBjslPejX1hKRnWGvJm1W58F13/gpmrZCGu7aOy9C
         WkP4vXYgS6la+p/qvn9+TgkKTgwTwI9p3pesZ2oQYJYJLzVUiVk5ALGAxTkYZ/4vsAEz
         JRsXYhnbOuyl9NObm6TDcwedprYCh/HX1qi09ldcD1PqLXRM9ETqs9rJmBNyPbp2jlKv
         a/6x52a13d0VG9+x5jhXpJDRicYbJk6XKmScTcwrw0xrDVRJ2pur60/odu1ltHHuOkbe
         PHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wQLo70OGJrn7K8fz0q95Ot9sWorOhzEzXv+vO9T9mic=;
        b=wLiOn2AzxoGr4uOA54lanhPMPqEifMzKnPeETc2IA5pBNqj1eUTxm4tEl5T2RMGRMV
         /Vjtuy+M6AVfqoC65g2fvRmiMyD4vH0qhSiZF8PpOZBKkoCV5amJ11VOrkg2pNuJPxp+
         6YPmq/kdnxCJSPZKqf8p1/JbM1Sw3b//Dk0+7vZtaL8l5oMfnR7/slAAhL5Yh/DsXBR9
         zDPALFvZUj2VbEU/uo+R5suK2YKlu90M3uK9Ostw0sHTtt0mG/LprcLEMvcucF8T/Ui+
         a/KG+7H641WfsU5B3Vu59Q+/3g70B0K95hRCii5vAwL20SgUYCWUcLuyI7geL8d2TUCg
         1odA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KzpMIBC1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k203sor24271566oib.16.2019.01.04.07.16.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jan 2019 07:16:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KzpMIBC1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wQLo70OGJrn7K8fz0q95Ot9sWorOhzEzXv+vO9T9mic=;
        b=KzpMIBC1lXPy7Jzh+3b86DoeO00jMtDMTb1VZoh+2MR0oB3AZ6/Tyduq6KM+OXtaOY
         S78TymlrPIwVF9fdC0pIXAMjmDj3xaUYSfimuplojFcc2h+Ufe6rIYm2kBxuUfFeLqsm
         xgjaT4iENUnq7Puihz2Z+nztM7+OVmcnXXqio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wQLo70OGJrn7K8fz0q95Ot9sWorOhzEzXv+vO9T9mic=;
        b=ctbxz0YmRel7RNbcHJ5vKxEmuihswyPmnA335J8gYRGuElbWplCvph2h8e4P6VeDqm
         3sSv229FG+1alfHH2EHlOf/I/9p8BXG6IpyooWZxwMfi/oBYLw2UEhwjY3lNODmOR5al
         jqE1ZTeuWUGC1qQ2j1DgT1BJvuUtMjFkQ1UzavWAlLCRJPLwS+n2r9khsLFoo8kqX5/a
         qICoIFB/vj6aQLdMbbr5unqsCKMJd54je8ImrzUD11AEuGTXQ3F75RsjWmvORgOR8/As
         3XSvZo0XBixHr6KaEXwbMdaWrJPRqqOyEswZk9W1ZndfATWgx9dZJYChzNxlUICKsAH5
         D3iw==
X-Gm-Message-State: AJcUukfhTzqUvwr0YbHg2+8H9KnCSexOpJvPObl/CUz06lu8xHIsdmlO
	xm8iyrMO2ktXkuIYMFb4aVYGZAztTyLl+NiNZaOT9QACl50=
X-Google-Smtp-Source: ALg8bN4t3dLJ6ePsNhtIudJUMRqZ8Q8UFufv8c1kYgZxursIZUKn5pT0LGMC9g7mgYeTM1WGsEoOvuBPb2WuYYntcEM=
X-Received: by 2002:aca:bcc6:: with SMTP id m189mr1385375oif.337.1546614984491;
 Fri, 04 Jan 2019 07:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20190103144124.18917-1-stefanha@redhat.com>
In-Reply-To: <20190103144124.18917-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jan 2019 15:16:13 +0000
Message-ID: <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "armv7m: Guard against no -kernel argument"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Jim Mussared <jim@groklearning.com>, 
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Steffen Gortz <qemu.ml@steffen-goertz.de>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-TUID: BDineIf2mqkx

On Thu, 3 Jan 2019 at 14:41, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> This reverts commit 01fd41ab3fb69971c24a69ed49cde96086d81278.
>
> The generic loader device (-device loader,file=kernel.bin) can be used
> to load a kernel instead of the -kernel option.  Some boards have flash
> memory (pflash) that is set via the -pflash or -drive options.
>
> Allow starting QEMU without the -kernel option to accommodate these
> scenarios.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
