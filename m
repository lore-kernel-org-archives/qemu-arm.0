Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp276693lfg;
        Thu, 18 Mar 2021 04:39:16 -0700 (PDT)
X-Received: by 2002:aa7:cb4d:: with SMTP id w13mr3069388edt.249.1616067555986;
        Thu, 18 Mar 2021 04:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616067555; cv=none;
        d=google.com; s=arc-20160816;
        b=IS3tpiaihhWD7bMhY4hL7XXkKa8vcVG0a51jz3Y4JWT2MSKARQyJoU6wVxlJvq18sv
         2Fi7kq0uXAximwjtAgkbwhj6J5RqJpieNkz/ro4bxP2CLY3yLkjaG0FpylCx+Lw0iMM7
         1t1L3jbFIeL+0ydtFkZ6xHfEA8V3RQjCXxnAbKZc3UAWz0WIlFGTXE9KUI+YSUAI+m4O
         EmVcxhOA56aiPlN5FuQBxUyOYYYOaOblhj66KIDA9wg3v2nWYi7GrMDJwQXmJ9OgNOpk
         qZZ3BRIHOP+X6Ke0u3J2Gv1jPTd+XnvPFz5VB0Me8D4mkvwfY94AcfRocNzx2h6vUYEz
         Ro5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5fc0rYREPoyM171mPCFs3fflTQuz/Pg0IrClqL2rKzQ=;
        b=mBMYw1VJ2c4sCbrT5IvvxOPMVYLjMqeeoY6Te5akDAF77oRnbCaV7Ori40V76nNwUj
         3nxNdCDGIdKU/IPevjmsBTngijEK87aEQ78Dc7Tw9lCGRcpsVHbeRmno+FESLv3FaMpf
         gkP6AJautcR8sUcMoLMUMnmOQx6CkjCJM7X7gDMOhQMlHnIwhZci9wqg8Z2OIOi7Ze+B
         WDfkmIJ0Bn4ulT9XauE31fxQKQmgU8YFF81yPJTbomBqm1wZlzTeq5q2Az4VxIcNYkd4
         sIZ0E/WTYaEp2jdCRXFS9dvKMou+lv8rFZWLNr/U+BicqRE7xbIUBBsCFrs/XDW8jnMS
         qiKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpSZRjWg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r12sor1180236eji.20.2021.03.18.04.39.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Mar 2021 04:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpSZRjWg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5fc0rYREPoyM171mPCFs3fflTQuz/Pg0IrClqL2rKzQ=;
        b=lpSZRjWgrhsxARoLyqYSaM5PBEwGX6bBhw0TDQ/ziRbjK4y0tfKWd3JnvoXWI4LDAl
         v/fS5ylZRP2SwGY36PjzNCIZyXho8n1+lRhouOVp0GMs+NT6dXQ4D9bUoW/IE4zCZ1Tr
         uKNzcFqdhNLrQ0PaPZaWHtp97qicFay7wfzlZk5vKD8a2g2gaCMtwHMY/i2uV+qa+qfR
         u9Fh7CpL6dn+z3za0gd1mkN292Y+zmxNBOyT6wBooX/xSBE6fwrNwYijgYgJzYQB+djL
         HBWxBM0ye+F8OEC5nqtcoEvv+0IohTHvT6CYIP5xwydJzjAf8EhNmlJGNB9kklz6OH1h
         /inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5fc0rYREPoyM171mPCFs3fflTQuz/Pg0IrClqL2rKzQ=;
        b=edPVGB4xKoM5E/ZUmvyFQIOUwK6ouLx0K/OGGC6jCROJy1Gdj0hmWV+T+ugranCNpb
         F9hXKczqhFd3aM7DJrzupx8ghpjoayMjER5aB3qP28XUstf8Gcm8K811C1vzwC1Je08N
         b8FLDA/ufi9cYS844ZSOACXUGJ86roBa/COM5e4oI3GH9EGJ+jniVhHrxQRRcSVQzjxP
         E+DLzZaSDUxSGdSkcxwSv+VcViXHrK0CpcTKJ2hTx4ayBlzfgiZh6Ujn37GSa/e73W+V
         A/t4PiF0gpp0qzQo+oOU+0WhRQ+r00wyTHBSbDmqgJ4Z30qPlAtV0dg4JWFGmYAqkETm
         Yfxw==
X-Gm-Message-State: AOAM531O4hyLYcGivJEQHyCo7E89IlotdGQdHpzjdsVkHTpdMZPNWWWk
	wz+/AyltopDRWADgmxjt3UqAdKGaHtZBE4g0ofPBwvqj
X-Google-Smtp-Source: ABdhPJyKQ2vR8zvfqEzAHSIGRAI+XFsLHnMewnTHmf0c5x6/lMIrKvS6QLizXAtfRE1fmKfp7LJRW9gjZ+2McWip4I0=
X-Received: by 2002:a17:906:1ecc:: with SMTP id m12mr40142996ejj.4.1616067555645;
 Thu, 18 Mar 2021 04:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210221222617.2579610-1-f4bug@amsat.org> <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de> <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de> <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com> <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
In-Reply-To: <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:38:51 +0000
Message-ID: <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	QEMU Developers <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Qo3xz6qOmyr3

On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> I tend to agree. The problem is for the running VMs started before
> 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
> the forks are supposed to do with the running VMs if they want to
> migrate them to newer QEMU (or upgrade the host QEMU).

Anybody with a Cortex-A15 KVM VM is just going to have to stay
with their pre-existing ancient hardware, their pre-existing
host kernel and their pre-existing QEMU binary. That's what
"we deprecated and then dropped support for this" means:
we no longer support running that kind of VM, so users who
were doing it need to either do something else instead, or
else just keep on going with the old versions they have.

thanks
-- PMM
