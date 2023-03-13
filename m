Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp535806ejb;
        Mon, 13 Mar 2023 11:08:31 -0700 (PDT)
X-Received: by 2002:a17:902:c412:b0:19c:be03:d18b with SMTP id k18-20020a170902c41200b0019cbe03d18bmr49267022plk.22.1678730911548;
        Mon, 13 Mar 2023 11:08:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678730911; cv=none;
        d=google.com; s=arc-20160816;
        b=fzVhreDRmwIR0dUOXfbWNt+ybXfc+LQT4makvsRfyX5SsIfFy5yXkjv8go5iBcQHbk
         RiwY7Q4Le7Mv6S645bJSBScNRhhUvX8WSC3uasOiNwP2MQkVTi67tCL5+7SA84F17Z5q
         7O2Er7ESlu6APGfW7oSjI7zYSBnFxRveEKrBhFxoa3Ll0aZmALn1oY/PiPid2x1BIR/n
         Sg0QULSe5Yf0r4BOik+v+OF4ByOwj8VffdHXrWr+UVgYPetT4UuLGscjA8aiwttRCk81
         JNgpbCEUMf8o11fPw36XJ6ooztf5pXp5S57uV2O611XONf7xiQGsNsaLim7KEdCzt/SU
         ebQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UchdR41GGGsjV9M/bLgsRU97vcok19P93n1AF7kvcOo=;
        b=kaZx+OxliXHTQnVs4J85lXALUarEixZoONItnFH53bW+Gn5Qp9FTOOmgUwoYtB1ySM
         wB96ZdmG4QvGrOjg68aaURLQbCSu5WIncf5/NGwT2/uTunjydg3gCnYibW/40TjLQupt
         vobA31V2VLWU7VGHlvQtQgG3W++LaWZFOEh2QExh7pkWAfQdEnhWS4wnGStaiziLCJjD
         RaHhqGOa5/Td1MrE9Vlh372mKYujEgSXJdtXRSbbOylZ8YWrQ3v4L75HP46ftPqoI3tE
         4LEHR4aL6+TW4repY8aHguGrxn3bPh3bxIUOw5DHcUBhl8iMSzRxrLyYYagi8echYhSI
         LIfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d63cBzDj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kt7-20020a170903088700b0019cbcb1d786sor198304plb.63.2023.03.13.11.08.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 11:08:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d63cBzDj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678730911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UchdR41GGGsjV9M/bLgsRU97vcok19P93n1AF7kvcOo=;
        b=d63cBzDj9gGVqCJvoVn52/LWbOQ5/drzRMVva/zqI5SWJJh7sE0RRddLvaA2It2zwD
         +72soNm+AXgwokTL7O/AQfUctr5LU4ZKNqCjSuwEzfWPOV51Qat9CZkaHO4mD77IP4Ku
         Srf1Scq8bvJSGUZWVKlfLwujmjpaNIS3Gfo53ZvGPZHEo5KZ+r146KTIm0vLZAqNtYRS
         Q3DUaizU8o1Fp/xyviLFQ8POuBqpCoFDvNY+Y9Ymk7h9MB1WR6in52A5oriKzhVKzZuQ
         86W07dbNogmEZ0dp+ngLjgRsm1OlezaoAYY7Tl94C329klp3wxx6TMIKCTbFV8Z7PiSc
         RF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678730911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UchdR41GGGsjV9M/bLgsRU97vcok19P93n1AF7kvcOo=;
        b=DyEiUjdnlcgiyCp3WJzcHZW+ci9zXyHS6/uirTy8aR73SKUxkcskJhG8l6/53nY3sU
         CEOXq6kXdKDHVmIk2rBYuajvfVwN7tcWEEQUGz7GyAii9vmPxBdyleNyPJvS27S5t+rP
         WsSkWjHZ9UeG5dMjm+91UVrWROIffcGxyHn2u+yEquodmOQNuoh8cueqwMRiBVHXVt69
         mYMoVh7+jM7s+jPySbXc0pf7mHwFmpGkghzbYX0XdjD5xK1OuJnikIcu5FD57nPbtx8p
         9IlCH3ojEK8erlKRjXqO9RAvmmU4Z17nPHei9MWYCct5bG6qeLmjXt/TBDMU5qGRZGch
         +zDw==
X-Gm-Message-State: AO0yUKVE1uV1CtaKMNJE+XcK/tAz3PHSdNUnU9ZdpKXhRKNsY8DnRgvO
	qFewA6E31/j/CLJJiqdnO2JRwM5c8yX0/AXtZes0R/6X
X-Google-Smtp-Source: AK7set8EqpIA0Xay2r2SwSJSxruU56ZSogFvvWn5nHaxx820dFQ5YUtxo0Ys4nq4NvI001JM9P7uBmelupR1P98QhlM=
X-Received: by 2002:a17:903:1388:b0:1a0:4be5:ccea with SMTP id
 jx8-20020a170903138800b001a04be5cceamr1480759plb.9.1678730911035; Mon, 13 Mar
 2023 11:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org> <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
 <CAFEAcA94DQ9rhCwhXHUKQQG6QdWTVOLNEUcKk12t=_WVMtG--A@mail.gmail.com>
 <b23fcfab-cc1b-a861-94ed-217af69f1ef8@redhat.com> <CAFEAcA9gdHi0QV1zj7nMNz1=NQjPyMisqU_Wqdc-HaLZg45HYA@mail.gmail.com>
In-Reply-To: <CAFEAcA9gdHi0QV1zj7nMNz1=NQjPyMisqU_Wqdc-HaLZg45HYA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 18:08:19 +0000
Message-ID: <CAFEAcA_-zbfHkHQqQHyv9EESkv1Xo2=exs2iGvZa_Up+9UPajw@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: p+k3iwLmTt64

On Mon, 13 Mar 2023 at 17:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> So I think the problem here is not with Sphinx, but with the
> kernel-doc script. That script has an option "-Werror" which
> turns its warnings into errors, but our Sphinx extension
> docs/sphinx/kerneldoc.py does not set it. I think we need to
> have the extension say "if Sphinx was run with -W then
> pass this flag along" (hopefully Sphinx lets us find out...)

This works:

--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -74,6 +74,10 @@ def run(self):
         # Sphinx versions
         cmd += ['-sphinx-version', sphinx.__version__]

+        # Pass through the warnings-as-errors flag if appropriate
+        if env.app.warningiserror:
+            cmd += ['-Werror']
+
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []


but I think it's prodding undocumented Sphinx internals, so
I'm going to check whether there's a better way to do this.
It might be more robust to have meson create a commandline
with a -Dkerneldoc_werror option that we then pick up in
the extension code, rather than trying to find out whether
-W was passed.

-- PMM
