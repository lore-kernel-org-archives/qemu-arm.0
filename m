Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1858495njb;
        Mon, 29 Jul 2024 08:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaZyhnRUXehOVt4RZZxsQxLM6xw7wBEViEbe20qjihPw6Yi2FvF7W8saQMghlfnTLA3JWKRxOSGyD+lBTGmiWA9j3iLuzy
X-Received: by 2002:a05:6402:254e:b0:5a1:cc07:6bb0 with SMTP id 4fb4d7f45d1cf-5b0207cb455mr5560086a12.15.1722267596165;
        Mon, 29 Jul 2024 08:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722267596; cv=none;
        d=google.com; s=arc-20160816;
        b=brLV35cuLP9gSWUgrOMrr3Tytp9NgN6eO3GABEdGMl08PFPlpa7KPkgx4MFo7cBtQ+
         XvOgyFPvmhsGtZJuxmJSU/IRcHIIDZKO2zgukgVIM8nyXZY6oHa9uRzdui6XlhFz1n0c
         O2PHz/BW8tMrCFalKbjXNXF8l8THfBuEh60u40EmyEM793j8rOXo5FyggjVE8mEYGzhx
         jGVam6oodCw2BepimFwY3/DaDLCtFvvVperlGL9Z/9hylOwAH26clN/N/tXqmhCic88o
         ZJW+3WWRpoISleMPcU7pP3AiY4zMKcHEG39DJvq1wc0h/wc0I9p7FS8XzGRq/tNYRMLp
         tfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAdGHqsVAshOCFETQ2/r5quQ4ndeF0viqEh+dfcB/T8=;
        fh=rcFyR2bsCbcF2qiVk0mD9UrIWJFOhnBBT72msHG4mqw=;
        b=itnix4tUXeY6AY5myNQtOvwgVMN3O4c6Lu/VxDN5ofD/dMSA0dPUz2U5W3x8JPkO7u
         Yln32K3oCQx8okSr2DruiinmDX1BX7VwBRUdmLA7RWFBN/6UNTgETHwaOpZ8e6a1X1sT
         BhKqC/LWsJdVf+k91cA5JkT4zMJFu+nMGI5JN43D774h/t1y41Zx9dUkzAWzbrUMABq1
         PiEIL9XiqXgIVXC+FghUn5g3n0UH7TmdwVpGIID4HU6pfgodlUpjbmlOVyr3lsZxaPhH
         Xyzey3p5N4AhOewkBaD1KFapJRV29nDNrYpCK/Ws6fTZP9GS95FCOcr6euBwddXxRqcx
         b9og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xR484Qqu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ac6b6898d7sor1690575a12.12.2024.07.29.08.39.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xR484Qqu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722267595; x=1722872395; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAdGHqsVAshOCFETQ2/r5quQ4ndeF0viqEh+dfcB/T8=;
        b=xR484Qqup2YP6w8Q3tuI+pvDQ/Ojb4/JFTgN4s/UulijeRXEh7+/gzM68h1LwOuqnt
         Qv4c3Xb895s0gD9dAku2QoC5XmpOGGWf9dBu0Id7roJg+CNmnqksL56eRYHPRQIN+Crq
         WJf91UUU89sw2IV2JQZ+3UpmZoGIIMxpOOSj/5wm4fu4BGwvnPKwBGjbYgUOw/ClckuB
         zHaCQKz9wdXxPHqyZStp+av3MbiU/9VphsKB+5z8yB94jQh/zGnZlk8N+9VdvES0eGX0
         Mds9IqGtjTs2opZKKBHnL6d8+TtcyFhcxyFQyjT17EtlPERSoXlkEP3cH854Orn79CtO
         WA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722267595; x=1722872395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAdGHqsVAshOCFETQ2/r5quQ4ndeF0viqEh+dfcB/T8=;
        b=GjAH4FH0bTgQo8AbvWHWYhOj6uqfvYlCtkeUFHS69MInkxEPgNjfwSC7539ri06bw1
         x4QYsrxnk2k+894G0V+j9lKC6a8FjCIfU9qJg46ECpYxgLmrY89dUgDSDsnMYM+xDJgp
         8fU0+2a47Y9v9vjQ+V2Ia9+0/XGBXRlqO7dryR6Uu5kiRu+vC5kwgtOloj55HA6CkNiH
         uklZkspAL4G3l0tu0ycgTisx4I3gx2PqJzpVR6gRsHInsHgHYzmY7cr4rax9gVjR3z5f
         JV3xUnv6VDKHck7Q7wpnxbjGkR9WwBkInTVst6ZpaCRnewX2i1JMYSbhU/sKcDoLxEHb
         2Ntg==
X-Forwarded-Encrypted: i=1; AJvYcCWeAjCfUGh0HGJxeLeygnvG+WFWxn42DPkw1AP0xjVgCsWxPqw9xdZw8/oUzn7M+v2jgqHvcPXNMSwU10Fy+vMHERfSnfa7
X-Gm-Message-State: AOJu0Yz7Bd4HYAfzreDW9/gdsCImzd0qPIqVPRIGydMgmBQIfBNru2o6
	OT6qCfGWwefMthWtQInrw9uYDw2uV45Jt+1XLQsMLERtVNv7IaPJdf92b6yMKqCt+/3yJ6c+R+X
	hYF93UithQOA9XePNUvfE/xzrN+9tfPufJ4JShwBl
X-Google-Smtp-Source: AGHT+IGwgXYkNsLNgKY+zkoJbWl72pV5+RaeWhw0/2JcieMLWzPORdWnn77Du4KpKhFYDsy0GwtM1lZAt0CH0Xfk/jc=
X-Received: by 2002:a50:d7c5:0:b0:5a2:1f7b:dffa with SMTP id
 4fb4d7f45d1cf-5b020101f53mr5057488a12.3.1722267595584; Mon, 29 Jul 2024
 08:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240719181041.49545-1-philmd@linaro.org> <20240719181041.49545-4-philmd@linaro.org>
In-Reply-To: <20240719181041.49545-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:39:44 +0100
Message-ID: <CAFEAcA_95CjgS89OJynBwqv7=dNCNip_YuAKq5YWG=tPp4hLgw@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] hw/char/pl011: Move pl011_put_fifo() earlier
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8Z4g+yiKyXfP

On Fri, 19 Jul 2024 at 19:11, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Avoid forward-declaring pl011_put_fifo() by moving it earlier.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
