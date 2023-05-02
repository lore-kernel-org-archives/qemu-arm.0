Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2238847ejm;
        Tue, 2 May 2023 07:51:59 -0700 (PDT)
X-Received: by 2002:a05:6402:690:b0:504:94b9:f21 with SMTP id f16-20020a056402069000b0050494b90f21mr8740183edy.27.1683039119495;
        Tue, 02 May 2023 07:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683039119; cv=none;
        d=google.com; s=arc-20160816;
        b=1J8pMdhw7Bk4BfBWXtOiC4sdCaUmhOEdm7ukgWbp3Vkjqw3CzZW31GDR6HxMKtK6yP
         Znqu0WQh4DDQrVdhhKAzRWNlaCOcBkMOaEoNlkihWM+rXkXA3lmcwFqeZcHSibtJNptx
         TfEJpR9HjTDcpl5Gjz4c7DQEtkay/E0RcAf0dxxObi0i2TwMCMN3GSMz6g6rO0qoKJ4m
         Y53brILU+GdAhHht5++73sZXkT6TpavXb0BnOlOYrWk1BpRkgLxEDvORM/U0fiJCbKwm
         R7PVHAQzlCrHDfcDXthQeJOAwHBzZ2xSroN8xl5QSsRcA6EaVfKQDL32AV1CkMhw0da5
         tsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mF+zMGVbAPbV/xStYxuDg9Tgjy/fj1dzOt1Y9eEZuSU=;
        b=RCsyDl1g756K3NyDW3pn7mO6ggV/Caa8sOFSIeDOzDeE441xdvs2jDdRr7c20DiLWs
         i9xbvkOwJpkYlgjSKYV7LWygLPJ/LcPfZ9dsiJB3XyaZJHW2888TaCeexhJdtwHBhb2m
         aiSYRte+sUXMemOueB0onU112KRArQkXTkXLHA5xC7N+or5hKO6FMjZVCwd9ZeRSr5MD
         OYCNn7FVyzNfx5UYwkTkEw8ooRlkpCSbBYicHHXmW+bv+xJ9H9XrRQhCi5ZDRSPbVmWp
         SKLAo8J9pWWvY35oNJqOGR9jJvxPphctSEXxwGoBtwo+P3rJVCUkIAMLX6L1233OMA8u
         OuCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H1tGyX2A;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a29-20020a50c31d000000b005049b0f6d9dsor1484294edb.6.2023.05.02.07.51.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 May 2023 07:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H1tGyX2A;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683039119; x=1685631119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mF+zMGVbAPbV/xStYxuDg9Tgjy/fj1dzOt1Y9eEZuSU=;
        b=H1tGyX2AB/+av7b2+M1zqnxBg3r4zwuqvQs8ZSZx86sGtww9Ll0RFpJETKSJMEGDHW
         zl1HHTCt/FGd9oFvcLryrcQqlHDeTKb9vMfjglguSxryurgogKRf0ljNFFoj5LVmNfgX
         BJorGPGzRq9AEen7kRtpP5kqlR42vpE8t4lsEd1ppFMb+8zxD4e6hb9EgVwdBfcHJfux
         4IwK1rkjJdNVGbENH3aFk+BYE4uwSf+Le1JA08IuqKeU7RAtmQegbRJd+/LSswwC/8ch
         gsPhLkQ8kJtIvA3m32Dg9qI5hVHKrvLXw+QAoFUR0sYhXlZMw1WH5CRtY1MFloxdQYlr
         M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039119; x=1685631119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF+zMGVbAPbV/xStYxuDg9Tgjy/fj1dzOt1Y9eEZuSU=;
        b=mEgnWlpioHC7/qq75VyUisTtmtqDlrU7z/vFFmOfeeEqzpSITlaWgzjFqBcR/f9s6Z
         Iyep7Ctvbhbg3GYJPW4xisWzsNixnamtmnocCtL038BK/nxb4TulMO1CqSIaudXqP6NX
         oL8I6N7aZiNkJVxwLWpHlGVoGUF4TzKKNi86fgwsMRsuveCHmgT9AycP7WEOAIwZb+ZO
         3EESrZ7pg24uSgGJdYSIdGzCC1+LIeiupvtRx2QgNh2KNpnZ2dUCOMsZqnOyhUKKSZOo
         0n4pmcgKXNOjkf7Fzf73S8uOCtECccvJbUqE6+pI7gs263UFGFmtNp7OucxpFXvbeZD6
         q/NA==
X-Gm-Message-State: AC+VfDzgLiiqEowT5tGegVHOv2XK1FepslHveKYGo7XzJeqiM4Iig48a
	kfa3BvvxALPKafteqU4pGaoXoyjkVw+AGBKb/5NdUC/M
X-Google-Smtp-Source: ACHHUZ5nV1hLMIWn0EQaQVzg89f/PUQgrLsn3+SRY4V/jDDpIIhk5o7moY6Xa7th94Vhyew4xDQAbUnnOMpwbYTLUtQ=
X-Received: by 2002:a05:6402:407:b0:501:d52d:7f88 with SMTP id
 q7-20020a056402040700b00501d52d7f88mr7620187edv.10.1683039119008; Tue, 02 May
 2023 07:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de> <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 15:51:48 +0100
Message-ID: <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: SNj9g5LqOJiA

On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
> >
> > Hi,
> >
> > Some minor changes:
> >
> > - new patch to move a test under CONFIG_TCG (broken on master);
> > - new patch to document the unsupported CPU test (Philippe);
> > - changed the test skip message when no KVM or TCG are present (Igor).
>
> Applied to target-arm.next; thanks for your persistence in
> working through the many versions of this patchset.

Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
because it enables a CI job that fails on our aarch64 runner
(because it wants to run tests using KVM but that machine
isn't configured to allow the runner to use KVM).

thanks
-- PMM
