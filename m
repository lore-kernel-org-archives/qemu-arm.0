Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1298222ejb;
        Mon, 20 May 2024 01:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHJCNW2g6a0mJvOaKV9edbw1CfrT0LnroWbn7iy0G4b3uTOdmHffg9lZKif8h6N0e2LaDNvJdzICnfF04NQC7+krTMUe9r
X-Received: by 2002:a05:6870:702b:b0:245:415b:8558 with SMTP id 586e51a60fabf-245415c1cf4mr12427752fac.1.1716193158052;
        Mon, 20 May 2024 01:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716193158; cv=none;
        d=google.com; s=arc-20160816;
        b=pD3CDvraTwmWvafHoPCS87TnjE0Rzxw0QMYDrdpij2SttFdGIDcwQXZI+pBDgc7MiK
         t7SutNum2nqsJRM0ZkzNk/15aVC+UM1ItQSU2ZKCO/ag3DU5zWwRg59uRUMz1zmphG02
         6LLAMTcySXr88gwIcviHYgVMVbv/7w6TwmtelpImd6XVSd9V/zbVPbR2R9tBz/8NuaUX
         IbRu+cqr3DKTmIKvHpX7k80vFpFgUpBjDybZ9Xx63zYdU53ZjYlksLXkei3FQsSwRDtw
         nijUq+sAUfRK4zQgC2W6R2XfmTWYsnWGHb10EX9Oi/QvmfRwzamvS2490O1S8s2W/6jR
         EUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=PAYpCWwcQATvupcV2tgualSPZZA5rb1LW0+/UfgwQkI=;
        fh=ZGkHhDWryKh3MRopt7XA8UyCtvt06drcrVTokICllDM=;
        b=Yb8Ir2LpWCacvKjN0V8OkB0J3VfFLrKew4CI79rCyiFYoVkfqC0NJ68rg9YYCk3A6n
         c+Yl6+YPdHPqu5yMhqZ+TTuweAjFuZ8LEXpaSQGXFNvArhRgHVEVJL76xVhe9L5GEJSs
         1SCOVP2FOyl6KpZ/zr7aNafGDr69QpQoe7IiuxDUGxjRQXJmYjQL2Lg5PVnF2UCu3Vjp
         wi7LCDbvvCNbGX6UApjgmDipPpuH7VSCdRTwRPguDP5bskH2xsXXuGyU+36wpmnikGnw
         fS1C5UyzLKQxskHY8hrdbrGo//p1mUZDZ8c/yspqq8maf/BEnHYRolKyAXGsH3zymBI5
         COXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GwI7322s;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-6f4d2a8f8eesor18434987b3a.4.2024.05.20.01.19.17
        (Google Transport Security);
        Mon, 20 May 2024 01:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GwI7322s;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716193157; x=1716797957; darn=linaro.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAYpCWwcQATvupcV2tgualSPZZA5rb1LW0+/UfgwQkI=;
        b=GwI7322snJXv7VT+Qu7zvLtwyODd0VUUXscgqgO7rGtIH1TKq/l109p7JIPNy73C5u
         YtRVAau9iiuc/f6uOCSmnfxIKPRuky7DIsKoxJfYVUIjiAUog1Ev6ybO9LhA/Gfr8VCG
         CMlH8KaIB488996t5rh/u6K55/f45cXbP1WAgRRmBoOJqGnV5ogSznXMb0TWIlqQ5kCK
         aF0PI2W2bOig8oK9l4S4N3zCSx0DWeNB2cjt2gQ36Ja8m1E255D6FVFvVDU5KHGmtbEm
         DVZq3mxRPE5RQYxcvH5Bkta0J/cQMw1e9h05ngOM67uPhRKDDU/iGOW2Z8UsyJ79+toJ
         5TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716193157; x=1716797957;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAYpCWwcQATvupcV2tgualSPZZA5rb1LW0+/UfgwQkI=;
        b=GAOS2ed2eyEjEOWsnwYnDsSFGciDfU777c3Nxf4HAOLJhZGnO6fJbF9mdJ76Z0wovA
         jk9FFfJLcTvhnhWmhDaEe+IgLYqu+EsZ5DftqCDauBfTKqde8C2s1CwFw+Oe7CildxpL
         l2ippnMKKXaw6z/3JbR8ZGDzIp+8U4F/uEZacrdFZS6TBKsCYxW4NO5StMtsw8wahnCs
         z2U2hGf5hyoqEATkqUHJJaKJkz0zlOZaMWfk0qc6p5sAPdWoMMtC4Nu1XLeQl+pE7wkw
         yBC84UCQoLg/TH8MFdDG8NiYGL8u2eVEpiodgJRvpdUDwV5BR+fKzM6Nnjz7PlHBcNF7
         Lftg==
X-Forwarded-Encrypted: i=1; AJvYcCUIqNS6ymr136Ru422fLY+WWo/FBZoGmUv+kmd6YxSqV1wpvR2ScQmIOMt3vctK8iO1IB+4CFAvLpXV2ZmlNQVX+KDnUj3bS/F0egfOLe04HWUHUBLFueYS5mKjGdL8D0J10fpvhxHpDgMMLQ/fqPM58/A7e3cVGzXa3oFksfc0LwmN1utueE6WTYypEb2P3j3nNKPAq8okt+PrYtXKOOsbzckcQbb155WEsvA=
X-Gm-Message-State: AOJu0Yw6Umxb+sSRpnX2QEwcLrcYldq6puYdEV79Lb1jWf/94+MTI5o7
	N4P90aC42J2+N8a6lgr23q3PHS1UO8dpgmw4Ox5dhLc8OEqysHM2
X-Google-Smtp-Source: AGHT+IH1YapN3itLGtuVif1hmKwKiLGRpJyAjinPbWn72IB64uqS8WyjzVwvjTmXGZwe3vrNltRyKw==
X-Received: by 2002:a05:6a00:1887:b0:6ed:cd4c:cc21 with SMTP id d2e1a72fcca58-6f4e02ac739mr34767891b3a.13.1716193156109;
        Mon, 20 May 2024 01:19:16 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.114.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ade27fsm18605744b3a.108.2024.05.20.01.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 01:19:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 May 2024 18:18:58 +1000
Message-Id: <D1EBOZTRN8SZ.Q9F4CFDZ8VYW@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
 <philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
 <pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
 <gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
 <linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
 <ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
 <karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
 <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
 <wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
 <jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
 <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, "Shaoqin Huang"
 <shahuang@redhat.com>
Subject: Re: [PATCH V9 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
X-Mailer: aerc 0.17.0
References: <20240519210620.228342-1-salil.mehta@huawei.com>
 <20240519210620.228342-7-salil.mehta@huawei.com>
In-Reply-To: <20240519210620.228342-7-salil.mehta@huawei.com>
X-TUID: LADovtN0dAvS

On Mon May 20, 2024 at 7:06 AM AEST, Salil Mehta wrote:
> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
> involves destruction of the CPU AddressSpace. Add common function to help
> destroy the CPU AddressSpace.

Patches 6,7 seem okay to me. I would like to see a series where they get
used. Would it be possible to include at least a TCG user in your
series? That would make it easier to review and test.

Thanks,
Nick
