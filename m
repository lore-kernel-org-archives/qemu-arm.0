Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1785041wrt;
        Thu, 27 Sep 2018 03:30:26 -0700 (PDT)
X-Received: by 2002:aca:2c5:: with SMTP id 188-v6mr2704848oic.192.1538044226662;
        Thu, 27 Sep 2018 03:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538044226; cv=none;
        d=google.com; s=arc-20160816;
        b=uTpi6Ica98L+ZkjRBGu1I2E+1kNpo/U70nyEP0zTPYld8yhTS2Iv7trD2G88zEAySy
         KKNHWRr4Bu0uSaBt1tPng1MF2UePaJnefdjyNHqKWGqHTooNoC55YlaUk98G5WE3fKDU
         p6U3mhCJLPBq+wNHpCkOYUNdDGNhB83OUbp95Ot+0Hc0giX35BjqDNdNXebY5oKjAnuM
         o2djEWvI9XoB+8hn2cwUWr37RE2jVIFKt6SuNnx9v02xW4LgYqZ5KauXNTx+806Wvvt8
         ayBkpMcCbMIrPulpCcDmIIv0dZYdaFeXZYx3v1dHNc+gdisLegeyIPzmgOku8Q/tYtBR
         4DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Keq2CNKvt8LQQLPsP1QpIqs5Icoj8BQBpM5TEf1qOP0=;
        b=M/fHZJyus6J0hDTJiMG1g79Sk6ufLuBQ7oGymTh7OOJ4fdV6XATc3LuJejW0ZsukwZ
         +pQ7w272ru6hu3IlWh8xK40wYvp1n3u6K+2qtRGEOGvrN1FDZcDwtq3jNQecBs7iBU0d
         iKMvqdtBlbjKM3Mv9kMJzz3iM1RCyfmAuPOcVxqhYYnNwKYCE9MjNGhiVmrBUy5jJ3ns
         1XugiR7Fbd+KaiNiMexPlaSl+/klQ+A/vh5Amyj6qNmX/PdPRsNl35rKf0Lqc7xLd1mv
         Nf5Ra/5/+wvFRs3tLZM610zaY9kd8BEDR32qDdM3IslyiVAOIWSmxuTMig8I4Gv+2piC
         PI6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bi/e/HfA";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u1-v6sor698698oiv.7.2018.09.27.03.30.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Sep 2018 03:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bi/e/HfA";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Keq2CNKvt8LQQLPsP1QpIqs5Icoj8BQBpM5TEf1qOP0=;
        b=Bi/e/HfAqEd1wi4bWOEnEkR3GV4i1nz3y+waKfiCeE3wf4d9mFNv6SNy6sh+jv2Mdj
         ZKY+gGpyFlsR0fkq0NOqlsyOhN7DMWeSP1owqxEElWAEFKVikiPk7uW1c0rgS4onbG+o
         ip/PnUpwR5Jwt/SJYfvolTCq9t31ajJWYMi1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Keq2CNKvt8LQQLPsP1QpIqs5Icoj8BQBpM5TEf1qOP0=;
        b=HCbo/zoRkgFYNsUJ4YqEq7Pm6uM0Aixz/9dHrgbrK8nunwTT24Xkb4fca+7PwhQv5D
         Xy0LIQmf2ToN1sRWMCQemNKQKs4EGufRsZG+SWN0mgi90TdiNhlFt0YDkedMvwXUqAmt
         pvvMfZjYpWcUiiHQCd20Qqp6Ws5loPv9/dNPDXpKCV8TKrk7jqctfJRc8uKI6dY1u8ZA
         3FZK3ob2+i6DobjGQL5byQg6mkVo0sUwSpQtPmYL23H2IYPcUl+fEbQXfuN0pX+svUzd
         P+iJ0yTJqGnJvDlaSJw9szZd+cbSI2sleV7QNbijHru0VZ2jLHSjpIpwita/F2lSOkDp
         hOVA==
X-Gm-Message-State: ABuFfohlz77l+NUlMxGBalD8Z3TPTHAj1L3A7lGPTrCneNH1ufP+VHRH
	N+78vuJr9CBMuNOvq+M+X/lf6dHeO4GJEwTTtcN4wDDm
X-Google-Smtp-Source: ACcGV61GN9bTGLZCHvWqhT1SlNlsS4ovoLJqgg7f1+PwmzdB1EtLiQcJiHSD5OvptuBmAmi+W7XUyq+BPGaosLWWQFc=
X-Received: by 2002:aca:6898:: with SMTP id o24-v6mr2699915oik.44.1538044226334;
 Thu, 27 Sep 2018 03:30:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Thu, 27 Sep 2018 03:30:05
 -0700 (PDT)
In-Reply-To: <CAHmQWvAL5BdgjuZ7wM02DqKhLFYasXy_OGiFQU50O_Q4zgXsNw@mail.gmail.com>
References: <1536488638-29326-1-git-send-email-hongbo.zhang@linaro.org> <CAHmQWvAL5BdgjuZ7wM02DqKhLFYasXy_OGiFQU50O_Q4zgXsNw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Sep 2018 11:30:05 +0100
Message-ID: <CAFEAcA9Cueh8+pJq20OhOTTXf+g=C0GCk3rG1F+43kDguYXoDw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: K51bwEauW39g

On 27 September 2018 at 11:23, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> I would mention that there are some issues in the base qemu tree to
> boot this (and also 'virt') machine.
>
> The MPIDR isn't emulated well, currently only 4 cores on one cluster
> can be booted, if we have more cores / more clusters / different
> number of cores on one clusters, SMP cannot boot correctly because
> PSCI checks MPIDR for booting secondary cores.

8-core SMP boot works fine for me on 'virt'...

> And I have to revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB" and
> revert "target/arm: Implement new do_transaction_failed hook" to boot
> the system, these commits not only block this new sbsa machine , but
> also the 'virt' machine, maybe the patches need to be checked or maybe
> firmware needed some adapt to these commits, currently I just revert
> them to boot.

Problems with do_transaction_failed mean the guest tried
to access some physical address where there is no device. This
is always a guest bug or misconfiguration. The commit you cite
there is the one that means we stop ignoring this and instead
generate guest bus errors, as real hardware usually does.

Not sure about the device_tree one, but again, 'virt' machine
works OK for me.

> I will add a cover letter for the next iteration included explanation
> of these issues.

Thanks. Where they affect the 'virt' board, instructions to reproduce
there would be useful.

-- PMM
