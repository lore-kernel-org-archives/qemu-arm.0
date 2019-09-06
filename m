Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp494787wrp;
        Fri, 6 Sep 2019 03:03:14 -0700 (PDT)
X-Received: by 2002:a9d:198c:: with SMTP id k12mr6960847otk.154.1567764194677;
        Fri, 06 Sep 2019 03:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567764194; cv=none;
        d=google.com; s=arc-20160816;
        b=dysU0fcL7I96drvmvZ6km1f9oLwbDHLh61mP/+LutLUIXT0zy5IKn+oahrRDoSB0x7
         dM4jPZf+e7uEUKpSiqE6xztZq+pFdm6SE9+iznDCj21nnWyfhnGJoeQWfEVXXZnUqSIo
         YzT03KQ3nhJdvxXvBaZBihGWYT0YX2k6elzucAN0Q0x1O0Ozitj+xmlJ73MO6NjzX5IS
         Gb2ZyclPvPXv8g9Fjtc5Q3m/XVHoJR17w6UkaXBOe7cdSot+TUtUmQl0R9QEoD3vF8Oz
         p2NK9Qbs2RzH20QDYfI67T97IZ+PyZNT+ZOPeH0evkNvnnzf7hHpAqHGmJj1bx8kyc5K
         IAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2YapL5VDuz7Vd3BxxuvOuiZc+9cI0DhXmCDbtX68ZI4=;
        b=TOa4dYMxCJSUFz6Wt4PXl94VMdllKerEdtpAmBHCdYg+PTZ0I7qxbzkPMXuvzAL9BZ
         FvLt2h0g+LBzuXCJ0ePDQlKH4Lscr88pr1aRtRNJOfolqIzNdLEF7u+hbKWIUGRvjHRy
         2oMrD94xYKMa2DDqyvH3v2Zh0+2UXc8onRBZcsMs0jBVZRsdNyCRTRfmxUEJtV0JlQge
         oENzbtnCku1u+oGQbRiPvzafcwKEOFTG4W0fJI9NV2qiIIoU4cO2QPLgBKQJFSVppj8X
         +ySIhMKru7N9Eoo3izDyvp4DqbwiTLxTUOBRqHOq9yu8lC3P22zB90iGRJWIo65nEo6x
         u3Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBJOkFya;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o8sor2642822otl.91.2019.09.06.03.03.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2019 03:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBJOkFya;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2YapL5VDuz7Vd3BxxuvOuiZc+9cI0DhXmCDbtX68ZI4=;
        b=YBJOkFyavVGOHTG/8kVAAX6fWtghUWYj8uvncL97prhyF4BBxq3QTHqmwseOetkuul
         z3SiiRnNRMQbDMHhJNX1gyeak76vIrfv0Ap+AeXt+/LjRGaVY/ybHMyKrQbDcamdTss0
         dp0GhqG1oIW0pEN6Fx9GiM8BOdAaVsGX/jNGe06cW7vIU8G4+7Wf6eHTCNGHTGHWgok6
         gFEuJwkbvffsJFl1OVWLKXsSDSdQqPsrpbj2zHk/x1GQ3YKhyLjKgbZjdHZ//mX4HXIb
         b8jC0PtalnLUf6RGcB+hB74uqWTGfI4FDJOSQoYvnMPRarGkzEcY+vT2JckB/PsS/PTr
         O95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2YapL5VDuz7Vd3BxxuvOuiZc+9cI0DhXmCDbtX68ZI4=;
        b=APS4p9O3fsbW48ajpCNUhTjwBgC85wvjS7+xWSQ5c3S9YxzA/LYClw7KN47PvWjjtq
         /e0kzwnmUKjxUPlbyLYbw8OcKe/8gaEIlM8dTXeGRpqP6Mpo2YCu2eikdod0+oyEESqZ
         7Z/j2gN9gPOK+icuuRV5wKl/mLncfDxqUgplQX5v4gqRk4Mi+sFcBmV6XbXrN06Tu2eB
         6hsc1kg6PXo1cHfmLqkF9BQl3nk7PuiiWSDqf0OqWznh/ftguCExHz0Y8o8QzMnYzDp1
         NF0lsbfBb20gTrnmbmE6HVFAM4Ig2/jtFNxmfXzIag95+NJ6Lz9VsTEcufKdpl9omIZz
         LilQ==
X-Gm-Message-State: APjAAAWhCrJK/m/7YuJG8rU4JwWzE+KlgRaHVDnjyNhSeEsITgaasIKr
	DxnnqDHxMBUss9j6wYvDqKddUmkrWbOfnq/5tdeejXHTiL5CrA==
X-Google-Smtp-Source: APXvYqzWS7dZEbiONKVTQqkysoyUUcNeduzUCFrhtjU6z8tLgIUjMzTL57xoRiAz8cD4+YpFlb/GFlsdBDfeJqSZIII=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr6654196oti.91.1567764193761;
 Fri, 06 Sep 2019 03:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190904112108.2341-1-alex.bennee@linaro.org>
In-Reply-To: <20190904112108.2341-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 11:03:02 +0100
Message-ID: <CAFEAcA9gr-vf4VP0oBnHjBwRb1vbD=hE-K7kuzQZjOLH_=TECQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 0/5] fixed up semihosting fixups
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2Nq4TOdnO8zp

On Wed, 4 Sep 2019 at 12:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Hi Peter,
>
> Here is version 2 of the ARM semi-hosting cleanup patches. The re-base
> had failed due to a change in the gen_exception_internal_insn API
> which now takes the PC instead of offset from pc_next. There is also
> the a minor indentation fix.

Hi -- I'm afraid you'll need to rebase this again, as Richard's
decodetree refactoring has now landed.

thanks
-- PMM
