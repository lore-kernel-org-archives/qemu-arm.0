Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp16395ejz;
        Thu, 21 Dec 2023 20:37:16 -0800 (PST)
X-Received: by 2002:a05:6a00:1c9f:b0:6d7:28a8:45f7 with SMTP id y31-20020a056a001c9f00b006d728a845f7mr942342pfw.59.1703219836293;
        Thu, 21 Dec 2023 20:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703219836; cv=none;
        d=google.com; s=arc-20160816;
        b=OgFQLb4GIjUTFSvfQy5oKJGJ/X8hntTH9h7FO/uImQmYE/VkXa6Chy/G88CcnfGI0+
         08aziuOQtpD4pRWy7AeczjdXW/cdMWZAAcf+dH/QqYElbGD6nTGnYiMzz0G+ckff2XxJ
         J6qdUz0/2WtU++jdsZIqSaHf7rvtdEUtMSOOrr0M3S+Pdddk/ssSJzimJVq4VuP27YED
         qHNiuSIysBVK+0/lVZToEG5Tjr5ND2uokIIeQGwKAT0yQ7IXcxxOwQ2yRFWyeWHtladK
         TEvaGbSMeqlYewUkKAy4/0S/qgJOA5cf+WYpKwq5oiGqspFV3R/bv0V34+djB8XNAcyx
         huIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=wgbOU8upAnXjTn1k3hXjDm0JM5y/8ovK8kdYS3DuYTw=;
        fh=N0VRbgcrArYorErwqmSo7BFLlLL7xYoahKI1n5QXdyY=;
        b=la9VFHsK53G6CDC865dCyQkVRRt3EhJOXvLGfIciZbLTEscxftwZS7S/6aoN4nDYdU
         c2kDLJjn15cH1tGazAg0STir4pdhY9OGHk0tVlwkgRqNUBRKturrcUE6H/4/e9JV7F5D
         N/20eIpghlA1Oi0+YlWuadGXWsEOvi/833Tbku4p5uBhHSF/RPTfuwcUdTB5z2W9F2WG
         CT0TfkcKJ+IeXbRQFczfnjMs0o5gq0h8Q6zzhqRKyDwg+uXKzHVzRtRVmkkzEHESLXUI
         GBxH2OgN/Oj5aIcyyg8I9Lpk8mlfmaiE719sT+EFQsyGm503YJgwiOav2y/qQs+rAmNf
         VFvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5jiOZ4b;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r65-20020a632b44000000b005cdcd57320fsor1771901pgr.2.2023.12.21.20.37.15
        (Google Transport Security);
        Thu, 21 Dec 2023 20:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5jiOZ4b;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703219835; x=1703824635; darn=linaro.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgbOU8upAnXjTn1k3hXjDm0JM5y/8ovK8kdYS3DuYTw=;
        b=d5jiOZ4bzXZq5OrkcNQNWqoeD2TxAQSijCqm0K8L/7rDAbuLRtzDJfLQp5JK1ARLHZ
         GMYr41AtlEE2sajEDCHrpxF/nmvYrUeyuRbqWo8YcIeGvyeNFWEqPDCp7dou+VqUnGjx
         6s/kcTAzttI+RLKTHDK2aDcURB0hHX/0XMHQuIZnQXKwWupyS5REyC9dXxFDwMCLEO3A
         4Q+7WbTjfEEZl5vq3SrObl2T85YQQeAaqSRUIqEPGlmlZzqdfKLcZ9/FCM+RPVhhSc29
         oewEVmL8SuUnL6jMhIaH3H8y7FZkB/C9X/jZqhkSCejV/+fshG1jNcUE4psoEtZnvxDD
         wRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703219835; x=1703824635;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgbOU8upAnXjTn1k3hXjDm0JM5y/8ovK8kdYS3DuYTw=;
        b=LEl8sWvf13tOWI/70owlPPqCRLduanOqLHP3cZQpEu/YTR/r9Ta6PyssTR5EIBTEeg
         gtAhP+OBVqJ0BgzlC8P4gPRXQr5FVd3W4yTveAosmhWeRS5lJbyDWZ4wc3RcGEAj+zKJ
         ufcxRc1cFIaE+De8RqtAH96Opt6aKPo/nPtw7fzFsj+mtN/fjq8UTVJhsi/Ie6ldJRGR
         YAnc+H3NM3/2LR7YOnAdYdR+vn7jbyP1on2w6izM+OmJlI4sV3fy8TTkxErWc1T7cY77
         74vKe1Ja/Sj99OXPMZG0ZCw+l9y15zcSfAZ8laMyAj45bHi+lmzN16ojOPkmWViEgNXt
         U86w==
X-Gm-Message-State: AOJu0YyUh354rMkIHFUIQb7tTetA3EJfkt2p4qiYgtNVgUdfUKd3vuUn
	n8M3ABnM0723mkdFOeqm7ZiE6ysERXA=
X-Google-Smtp-Source: AGHT+IEzGYteh6ju41xh+kmV2jHDL4x/LDbTHCYXHss7B6ob7M7088K9WAbPmSzEygfU90Es9K9+tQ==
X-Received: by 2002:a05:6a20:e11f:b0:195:306c:814a with SMTP id kr31-20020a056a20e11f00b00195306c814amr646817pzb.100.1703219835178;
        Thu, 21 Dec 2023 20:37:15 -0800 (PST)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.126.39])
        by smtp.gmail.com with ESMTPSA id o8-20020a17090ac08800b00288628acf6dsm2625274pjs.14.2023.12.21.20.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 20:37:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 14:36:57 +1000
Message-Id: <CXUL1AHC8Y18.WHZQSSFCJNWR@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, "Michael Rolnik" <mrolnik@gmail.com>, "Song Gao"
 <gaosong@loongson.cn>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Aurelien Jarno" <aurelien@aurel32.net>, "Jiaxun Yang"
 <jiaxun.yang@flygoat.com>, "Aleksandar Rikalo"
 <aleksandar.rikalo@syrmia.com>, "Stafford Horne" <shorne@gmail.com>,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alistair Francis" <alistair.francis@wdc.com>, "Bin
 Meng" <bin.meng@windriver.com>, "Weiwei Li" <liwei1518@gmail.com>, "Artyom
 Tarasenko" <atar4qemu@gmail.com>, "Max Filippov" <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 03/24] target: Define TCG_GUEST_DEFAULT_MO in
 'cpu-param.h'
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-4-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-4-philmd@linaro.org>
X-TUID: 55Hhww8nrPxD

On Tue Dec 12, 2023 at 7:19 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> accel/tcg/ files requires the following definitions:
>
>   - TARGET_LONG_BITS
>   - TARGET_PAGE_BITS
>   - TARGET_PHYS_ADDR_SPACE_BITS
>   - TCG_GUEST_DEFAULT_MO
>
> The first 3 are defined in "cpu-param.h". The last one
> in "cpu.h", with a bunch of definitions irrelevant for
> TCG. By moving the TCG_GUEST_DEFAULT_MO definition to
> "cpu-param.h", we can simplify various accel/tcg includes.

Acked-by: Nicholas Piggin <npiggin@gmail.com> (ppc)

Thanks,
Nick
