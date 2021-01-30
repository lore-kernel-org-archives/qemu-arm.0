Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2043128lfo;
        Sat, 30 Jan 2021 07:37:38 -0800 (PST)
X-Received: by 2002:a05:6402:40c4:: with SMTP id z4mr10461540edb.233.1612021058426;
        Sat, 30 Jan 2021 07:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612021058; cv=none;
        d=google.com; s=arc-20160816;
        b=ADoYtMMp/pttvjKbUAE+u3O8Dn/hgVKXs2avCkiZW3grPARi2jKV1u9EVYI9SITukW
         S9uheWY6e1dGzCKor3XsysaCgoX9dYFzXg28scHR4XOwAESyUMYFQUmNT1NRxaP9Wbsc
         QTCPnn+UPKaDoUNnjjtjbwJiQmZPz7ZQ4dFCecKceBtkkg8HVuVZECFogDNh0BUtQ/7+
         Vr2aTPuMdH/+RWLSr1MoXKdyhKpS662SX7Xi01zh1Oo3fAH8AvgwTha526QgEnDw08M7
         Q6JRpAYzSm8fwgm/5ACpHgGF47EoVMUt9f4FYtqYH9xB33d/JX7UiqwzlHmPkrThE7F9
         17xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78kOyNsh9PFQ35W6G6J34UFL3WJ0plW3fjCLydvhNGU=;
        b=eumm9OJMMZL2wCvPeNASvLv8sJ6E74t/F6Zv3VgnYT0Z2om4FLN1G+iNs6MoM+6pJP
         KDLdDIyEVlp+FJKLiczTF5qD1zvVGFx6Il71G0Papr6R/bcYArGWkUQ01j0ivf+aeX/5
         jo8cxhE+muhLsPzKhrVV4UBK550Ec9JXOzl7djP8uUSBtrCRNK7oL6rp/9zvjMoNx7C0
         sZVTHUwN7w/pfzHyeLyVzhONHMWBsEKNg1lx2MqpI989JAuaGXJBUekW8R2EtkA7H2RZ
         E2LYmky0w6SMpo3ZelMIfE9p2kEK50EzvtW8F7PwnNGM4fDxREclELFtl98K8slX2LbE
         3u3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evI+JCiN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10sor7690409ejf.57.2021.01.30.07.37.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Jan 2021 07:37:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=evI+JCiN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=78kOyNsh9PFQ35W6G6J34UFL3WJ0plW3fjCLydvhNGU=;
        b=evI+JCiN4q9fC6wQYJuhNtFMDoH0y/ah6iDJRi+XmLvWYdNKZghG075xgvVS6nEH63
         QdOKU1s/tbYWcdHwDvDugZGRZzCkn/NBqE3cYw+ytxwNgNK7h9d4lF1nfdaX2dqkhC1s
         m4+eSEQWVVB2kCpgZVbmzfVhV2dfOIYlq6Vn8FQITksyJmROd5NLThrkFBPHH5OqjzTl
         COIOuFHypRtV5TiZdLH/9lecUqz5sRcjDl+DEHJb6ojwly5a2AJDEb3Bk7F64IO5s7Q0
         DlGL1cp0xxiiP+UvlIJqJPxke6LXOQduMAUGGia1Z027oaon4bMF7R08U/DuutijOrQs
         ViAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=78kOyNsh9PFQ35W6G6J34UFL3WJ0plW3fjCLydvhNGU=;
        b=bcSsv3e7qZ2bsbY8yZ491ORCvsAVbbopXhkuHm27WsdJh3mtfFrRNxis9MwsfbXEjB
         0LGGTPJ3ppD5hCIWcxdqwCtFPAoE1+XoDNSVlVqSiYEdqS0b+wpoUdcz/KZN/M9MFqEC
         0oRshXkJ2IGvdZWhjbNGQ7MFUo7IZG2cwwTyqK7orQXsKnlk3Nk045k5zlE1LVEkHl8k
         CSHdtqSlrJYDfYtLAKSk8W1brWNAdIuwnkoSc8565CdJ0/LO5Vju8kZI56dvgiaMNmQB
         /SAGsdfqdRp73zt8pWeHr5tX+rfOyXZ+3rUggeRyKC5xSDgjBr+Z4VyRNJIcW5+5QQdg
         CUDQ==
X-Gm-Message-State: AOAM532SbIhuD7ObEPwohT3MM9i982rkbnes0Ce/QDBqwKjCbkJhB/N9
	X6JbRfyJXCTIyTTEPTl6CKc2hTYh3sdIEqRoEkxuNKzd
X-Google-Smtp-Source: ABdhPJyD++UlciKvmROO24kS3r/XXDVKijRu1H7xIYaJRV48MHyTsJtFtdfA1zpizwOdbfEwhqs6mx4IqJ20F8mkBMc=
X-Received: by 2002:a17:906:b215:: with SMTP id p21mr9386002ejz.407.1612021058129;
 Sat, 30 Jan 2021 07:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20210130015227.4071332-1-f4bug@amsat.org> <20210130015227.4071332-4-f4bug@amsat.org>
In-Reply-To: <20210130015227.4071332-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jan 2021 15:37:26 +0000
Message-ID: <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +nb1oNUq9Rjg

On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> KVM requires a cpu based on (at least) the ARMv7 architecture.

These days it requires ARMv8, because we dropped 32-bit host
support, and all 64-bit host CPUs are v8.

thanks
-- PMM
