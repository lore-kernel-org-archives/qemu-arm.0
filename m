Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3296646ejb;
        Tue, 21 Feb 2023 06:21:46 -0800 (PST)
X-Received: by 2002:a17:903:120e:b0:19c:9999:f488 with SMTP id l14-20020a170903120e00b0019c9999f488mr1496279plh.54.1676989306706;
        Tue, 21 Feb 2023 06:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676989306; cv=none;
        d=google.com; s=arc-20160816;
        b=Vjp2V6sVDO8DNUzu4mepuOb2offf+9F1JFcXPhUAMhqZvGNzydWe7yT2oVVWWpWTsT
         t3kwHxSiXG+vdidvhmznAQ5KYggDyR9R6HjnjcWeKuM2X6zdDxm/1qQ8Lph4FK8gOqwZ
         LhJcWK61Os5JO9R9EAoPCd5AKy0EigadylzmxQTQSFP9kLUpM/72p64wqiDbAQpQN9DU
         O423s/TzidoMk5a6cPH5EysKmZN0yo8bEoua6PbuoaJK9Dk7m40Ytvu9wJ4u6gNHSoJN
         trh8T1rnK9af5NfIcwHfcdqBX+W5oPTJyJpSZ99OjmVoiwsN9T/fOM50ahjCGAOvv/vp
         mTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EJfbVMQ501XvlczRMJfeAMzE28K4xSrRT8Enr8GaQKs=;
        b=sS6qWEIx6/Y8Gy3pzSrHSdVl3dLEWRP8ocVAhTf/+N0Qhl15TYSCRjgrJf4bf4/15w
         6W10fSNSUwmHJlmHlKYhnMS1YG1fqmblJp9qiLABQ/JeVvCD+hAPn4ODg3BPfNVUrMQW
         C2un/z4UCPk6O7lExVwH+yUVGJnrmM1g8X+OYQN/Fr2o/IJa57zffhPMgaSasAHGvw/t
         rkMYRcvtpO4rfby/i6pBI3ONQ+KvV3fRzjsNhrfL6x7p9Mzw8RUChEezqNpjVtYwjGKp
         0br6DT7vvuXgfWIohbi4/pYbJdgf9C7htWX0C1lbvD3XFrrVruccnF1CUSkHHLdxjZPl
         Qcog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zj7ycWqA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o16-20020a170902d4d000b0019b8b794b3csor1508099plg.67.2023.02.21.06.21.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 06:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zj7ycWqA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJfbVMQ501XvlczRMJfeAMzE28K4xSrRT8Enr8GaQKs=;
        b=zj7ycWqAeYSlxJpJElcQC6lrjIy59fJ4bPpWEqLES+FpeE7TORB3CCQ4scbPw/GR6l
         5YqjH0UKJAyRngvSQ/iW0N5g63zYvx3SLVGtrTuWI79KNAuE1GeyXi63vU5dhtLp6fWc
         TtBMr5gZuCf/1mpQpyLCdUGDX1uCkxvqfkhPsM8a//QJrHKB6U/ir4i6/Zl0NjO+BTxC
         /iWpIQOBldSka03H3phH00buB5aCFuGcy5m3QI0FDcctN4ra1f7AqfF4hPjgnJpVyXxT
         HJyoh9n8o463UKUarTB4GoemgyjpjSWYMbNuQlJayVDRqSBO1ipE25ZAfUJE1d2fHj/a
         FsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJfbVMQ501XvlczRMJfeAMzE28K4xSrRT8Enr8GaQKs=;
        b=wwbX4NAJ5HXGTd/pSt21QcrIG0j6+YEbg0zk5NQbw7YDO2lKu6AxXTycHQfz5cnN9q
         BJkfYmZxzx8JZaxybPYA8yODupKTRLHxHLWGovQJObIs7519p3euyumitUBixx3vy4DC
         BQ8Y4do8sH9xegCYGDiyhW99/+Jb1xF6ratMF261UVIaIpFBm1I/FX3/OfnKvVi1iDBr
         jPGMsykYKqEH3lsuMQNypqk6DHjUZkk8HQyNFBVCvPWJM4SUral9wpGcdtxgUZUP+x+4
         /k6CfDm5cHGK2aA/BS5E6XWmaEYZSLAniF9hMa5qnwhf2r4p3J8riz3mY7wOT2QTYQk4
         uwzw==
X-Gm-Message-State: AO0yUKU+qrNr7NjH1wuvxW565+HT/3iMzbWB7vqQbqkqzi9KsXPAOTnq
	L3h2YNtvKXvuSXy2nDivDfZXuRfrDAoefnZiXwHX4zhk
X-Google-Smtp-Source: AK7set/P5kFez/x1ZgxhYVz0sy1PQKl8X+ARI7Uby+qk1XL6a+ql4zcRNAplYlgpuWEMLDw+sUFqkDetbc4F9HSeNqY=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1780257pjb.92.1676989306265; Tue, 21
 Feb 2023 06:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20230217201150.22032-1-farosas@suse.de>
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 14:21:35 +0000
Message-ID: <CAFEAcA-uk7V+Mspo9uZ5W9P9beYNEdhs-VSuOAD6S=5cqtPGew@mail.gmail.com>
Subject: Re: [PATCH v6 00/29] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: BAtNJmw4LlvX

On Fri, 17 Feb 2023 at 20:13, Fabiano Rosas <farosas@suse.de> wrote:
>
> Addressed Peter's comments and dropped the cpregs change which is not
> related to fixing the --disable-tcg build. This unblocks the xenpvh
> series and I can tackle the regs split without holding up the build
> work.

I've applied up to and including
[PATCH v6 15/29] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
to target-arm.next, and also
[PATCH v6 25/29] tests/avocado: add machine:none tag to version.py
(and some of the rest were already upstream).

thanks
-- PMM
