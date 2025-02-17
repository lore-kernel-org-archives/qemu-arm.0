Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp159404njb;
        Mon, 17 Feb 2025 08:44:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqsWyEtoXhIFdTm/OYze4CgTNFt0rVDZPnn9j+ax+ztMtE/UHJTKijXga7t2wEPwgXvuFWXwXFds3tKQ==@linaro.org
X-Received: by 2002:a05:6402:430a:b0:5df:b0e9:a5da with SMTP id 4fb4d7f45d1cf-5e0360de1d3mr8552789a12.16.1739810654210;
        Mon, 17 Feb 2025 08:44:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810654; cv=none;
        d=google.com; s=arc-20240605;
        b=EmrlhX+090ymIzVaAJYaGFTFaIGqlngQqdziHi1mlWW64eCbSj+c1sbZs2vzjBOd7d
         omq4yKJwRPjLfUYZdyPP1jtisQb52/RUrj+3Xl4mWwAKw5dO5mbZJFoVzWrVn2PKDx6X
         LepzLa0ZyE3o4phGdmOXHnJ1bxTBl5MkNpNdHJsT2p8tQK5V7W4Ap8Y73Uzpi9W+hdrm
         1toLofUTxXM78wjh28aZ62YDP+MEqgR2WOkFNvD3V5XSacSAbv6Fq6XG75XsrL0EzCyx
         UuI3K9xD/n4Bfw4ToFKXMmT7JbrBwC39t7zpj5ojKTfmsaDWJKlJKT8kNPwyWv8Ix5u/
         7gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3FHUaz8ZQxfTEz+ywIpzuVfvUH6DLK/X9OlNeD6XI5Q=;
        fh=AlvpSud0Za3JXQ/wT4X0bRO/15Vr5fipQXW9N6pdCRU=;
        b=cgrCVTdZq4/gGnpiaibhlxNi1Yl4x4IuzXx+23IE93ZiuS17/kdMXESzIFGXr7czeH
         mowmsBuHqFncq9JQO+srWPiyS2A92ulFp4oukF3Jjqi5I4YOpmprbWrZ2BlCubj4sAC7
         KCNklLI7j1ih1uoNhqvfNsQvipdHK9XHBI7UNEiEzDG1+PEYllOvmn5PLnsBJVvSOgQH
         R6AzdhWjcW/yimF5YgZkJSg6PHZjb4qydYb/2bR50VeF1M465tduP73iOXD9QEZ+jdyQ
         lCBxjMTAO01Mov8brPxUvX1QVaBkSVJhieD0Xul1bZrvc7JBeSFyl9Mt+m+ESVq0zraF
         Wjwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1z+HSbW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5dece1842a7sor4313899a12.2.2025.02.17.08.44.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 08:44:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1z+HSbW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810654; x=1740415454; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FHUaz8ZQxfTEz+ywIpzuVfvUH6DLK/X9OlNeD6XI5Q=;
        b=y1z+HSbWPPj52/0QeXPKdqZVsDjIozcuJslSlQSdcGWD4HdStCkIuvaQdZdjuO5VY5
         85kQey3a7TGFROlRccrmJn4PxLlfWjDe0cMLS+LjrCgcB3mzrfuP0nBwRukL3nsuMDtn
         NUOeBne5xVNJCpNNCjcor+QbrV8/E5RgmhHpYmvD4OcNUnLFIBXWz0JuMRyn0kI+VrO/
         vwyeoaHHRTozlZOeHEBmnOFkygEGdQ+8uUto85TAnyAVJEk4ylX6uiAPNK42ePaOntb5
         gzCv16e/aDWxte+/3qGI07VT9/0d9EBtEr95EAYDLUUIRd87LoFuB33IRRZvGmnCQfb5
         ANmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810654; x=1740415454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FHUaz8ZQxfTEz+ywIpzuVfvUH6DLK/X9OlNeD6XI5Q=;
        b=euKmeYrNPw4BAefebc5xQD/bu3uM4sJCCVVqF7vhKmyCnbtLycZo3u/XluMF78+1Ek
         9uWrsv+6CTMqtIr6/jJUmwPAqQcohyPFdkHB3ceN5c6yLFQEULaoTmX/25PIxvJZca19
         mIZbeUDNgGKExe0rDd0cCa7z6gkNlD7CYj86MCxVcDMOoJhG+8n4MjLVJsDlPyPrWDTo
         xhJbpnpW3g/1DclS5SD//ydmTQHCkD/WVLzXRs+JVc+Q4L7zlix8hXrPO+12/cW0hmEV
         5tpIVLtL71DpTE/ZG9xlV6rkf5VuwZICbrNNkYIfTJzLXRe1b4NE+Em86JV+bf2Awxgw
         SdjA==
X-Forwarded-Encrypted: i=1; AJvYcCUBc6K+sBwJ8mem/KEiaJ3h0H+0gKjrA+ANrBE0Uk9t7WzYwtayrLk9ktaNCtyXW88fPz1rY2J3LEFo7Q==@linaro.org
X-Gm-Message-State: AOJu0YzNSKqGqIHpw87Qo8AllwDwKVnbfAQPOQqC4VlfR6qizlib46gc
	Om76+jQ7XvlBNfmpL51RhBVvvRD0rfUY1srG3VOrRjGB3x0E6t2VXnF8AdvBdQj+lCWnawcB2V4
	z8JjjKDy3AmdBWRxH7m8zjXhzA7NK+YbzVfSxxMN6
X-Gm-Gg: ASbGncsYDkBdWy1xQffbxixbFVdn5/ZkBv73VxR50JDNASXAM6Gmw8G4QkC7FI5YrCJ
	qVDvHnc+nb4m3g+6KO7t++OYHjWuF/dBmdpZRbiG0gytAT9DYevNvmPIGY1XJGWyPhY/uxIgMQA
	==
X-Google-Smtp-Source: AGHT+IF2z0Tn106JwfTcbTOA8ob1xJk3Nzd1r8r28ml+1/7h8E8YoLHQcQF1OiE2O94pGUXHt/b9leat+umNKo4ICJo=
X-Received: by 2002:a05:6402:3488:b0:5dc:a44f:6ec4 with SMTP id
 4fb4d7f45d1cf-5e036092b01mr11041093a12.13.1739810653589; Mon, 17 Feb 2025
 08:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20250217163732.3718617-1-kchamart@redhat.com> <20250217163732.3718617-4-kchamart@redhat.com>
In-Reply-To: <20250217163732.3718617-4-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 16:44:00 +0000
X-Gm-Features: AWEUYZkA--iZUaOyUegiY0uWHGnZA28MagWGT1ImgXRuF2Ab4cbzkvy7fM5jJho
Message-ID: <CAFEAcA89YVi-0WTD=9=-nvK2-kr859VAtxgmvyhfTDNx3TvERw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: Fix "Arm" capitalization
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com, 
	maz@kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Alistair Francis <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Zhenzhong Duan <zhenzhong.duan@intel.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Eric Auger <eric.auger@redhat.com>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>, qemu-arm@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Yv9+HLAaAyx2

On Mon, 17 Feb 2025 at 16:38, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> This is based on Peter's suggestion here[1].
>
> I simply addrressed the occurrences that I found with `git grep "ARM "`
> in the docs/ directory.  I didn't touch stuff like these "StrongARM",
> ARM926EJ-S, ARM1176JZS, etc.  Related commit[2].
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg05137.html
>     - docs/cpu-features: Update "PAuth" (Pointer Authentication) details
>
> [2] 6fe6d6c9a9 (docs: Be consistent about capitalization of 'Arm',
>     2020-03-09)
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
