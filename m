Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1914804ejb;
        Fri, 10 Feb 2023 06:39:35 -0800 (PST)
X-Received: by 2002:a05:6a20:cf57:b0:be:940d:84b4 with SMTP id hz23-20020a056a20cf5700b000be940d84b4mr12375261pzb.44.1676039975284;
        Fri, 10 Feb 2023 06:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676039975; cv=none;
        d=google.com; s=arc-20160816;
        b=w59vlW/4cqeUEJfLji7J1vXc50sxeJ2gwivxI6IoAndiYGj19ske8VZvUg1psFH29Y
         r22CQGhdS5KJRWch70FjvOpPoGfxwGlzTTkSsmLuMpPyXPd/7OkH5wc2DJcDSr5nexQY
         4AOm3gVg88+EYYgwa7hlzcI/6C2QzIvxCEJHAPN/FOx8vVcW+IeH+Dfy4IPP/Ji8cLKu
         yb9136qYwS+lwNR0ykjxcBlgbxnlw7vAY2qV0CkdobrWytlZwrowBGn9Ak732s8rOs+s
         h9FK5MOsnHOHuk7+GbjxEW98QVL+TdmZyMdwirnLwNb5eetJG7IvJnN6QI0m68FKcHSm
         9orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZeS6cET6lOBNmWTRydZpAT15MUwnqq2DFp3U3yxTmic=;
        b=tGQG/uMQytNVE4ssHJ0MWV1cOfAXuxejdgxfBsROvuDHhGdbipMidBm+yync1h1SMu
         KGTOQhPMU7+ajbqDn8cPk7N+9E0hmAzoOxJanTNCo9CbqkJFb1MpE4i20ZFoU6ZP/szm
         dramWmr6hxlopR9TaXlDs9gFBKZzFYhb+G9GXUl2m5b6KUQDM5TEAjXQVc7qJJMk98K2
         Ivh/yDoKtWDVsjysdaPYN+60EFSvhw4WWjnb+oGaiahgzhStgDi6dGN4jFRoOrUkHu9C
         hUReqqJmES4b9usRGPiD42+U8du3q1sr0SzS8MbfbZQ4QKS9b9UJj84V/solECkmAArF
         0jdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDQshhIL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h9-20020a63b009000000b004774c8e0dbdsor2503619pgf.34.2023.02.10.06.39.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Feb 2023 06:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDQshhIL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeS6cET6lOBNmWTRydZpAT15MUwnqq2DFp3U3yxTmic=;
        b=FDQshhILE9b20GQrNCJzdZE6HsoXMeOUMzyvFrll0+sE9xdqwhWTJWefYeXU0PgzG/
         q0e9KwCO7rUBwuzqcDTIaMO0bxQ+Gzq/3LttiKI36NRZVGihaG0C9kJykrSEESo2LZOi
         ST9Oyxskq0ypVke1M8LxTLyzIIT//rxQIr18tSfXhCY19I2d3BVwgmTUC2QgIv1qR0p8
         3lkD/MVXkz2pmfBGgTgM+umFDu8KpzYaeUFa2NrnXQ4pgYi2+rLIVKcKypxeXoxiAp3W
         ffOqHHEt/st7atNyQrdk2cr5iYlbcBeePnEo30ng8F67l/AFVk/4Zu6kBnug2DnBjT6F
         zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeS6cET6lOBNmWTRydZpAT15MUwnqq2DFp3U3yxTmic=;
        b=AeQNWSqtvIqN9uR1oMxg2+QP7XPIGeLDbdN4qYSXoSGbMKxDeHpM+04jirB7P26cJg
         5xRpYiH/wJF6doBItxd7zgRhQ9O+fL4D0XEEIcFHH3wEpkzSGuj5UPB1IGhDzXdKkJ44
         mTB6jUhK83RowUCI68BnoB7zrr9ujCO3S3C+uM16XoobylR1xH6aVOX++xh8n3/0LIdl
         N58XW4hlx9/80oP907Mm9cfb0rtI9F5sSar11gfj/+aCTg9EBudnPOaqZHI6p12kqhGZ
         gp+CL4VE8s9DMOpa0UL8Whxh4lBBdaHyqQ6NPthtC8HXnL0dLBfo76vEoObTf2F/yYqR
         Jy6A==
X-Gm-Message-State: AO0yUKXLFG43M7KPuSADTNFvBbFxihBavjs/FH7wtKjS30+dS3lFOW2P
	AMP6J0yeG2hVjDCX3vl5fV/+T07Hjy7CbIhqCxZrXuFI
X-Google-Smtp-Source: AK7set++hAX+p9VxQkTSHomt7MF1bLHB/7TRAzo488FVHK5B0WSN9MTq0droGOHxnmnBF0YtW5o+vRpcP4D9r6LqE9c=
X-Received: by 2002:a63:9356:0:b0:4db:3747:ff55 with SMTP id
 w22-20020a639356000000b004db3747ff55mr2993399pgm.110.1676039974836; Fri, 10
 Feb 2023 06:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
 <87cz6loahb.fsf@suse.de> <877cwtpl1v.fsf@linaro.org> <87k00p7gwt.fsf@pond.sub.org>
In-Reply-To: <87k00p7gwt.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:39:23 +0000
Message-ID: <CAFEAcA_tRKUpBXkrzaZneX4NUgzvE3P1Kb8roGYRVHbjEkLNkg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5Dd3yBpFpAM9

On Fri, 10 Feb 2023 at 14:07, Markus Armbruster <armbru@redhat.com> wrote:
> cpu_arm_set_sve() is the setter for property "sve".  Checking the value
> of another property in such a setter is usually wrong, as Fabiano
> pointed out for this case.  Check in the realize() method instead.

Yep. Compare what we do with the "must have both VFP and Neon or neither"
check on those two properties, for instance.

thanks
-- PMM
