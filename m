Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp192894njb;
        Thu, 27 Jun 2024 04:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWexur6+YPpnd272NPg8Ode6MmBp2q4c2K5UZ+g9BZM0wLOCduMr6mwhF+S11a/pXncxpRMkCvPuuqRrP8v3kwWBgOAMhtL
X-Received: by 2002:a05:600c:982:b0:424:a58b:4078 with SMTP id 5b1f17b1804b1-424a58b4162mr48746305e9.32.1719488654790;
        Thu, 27 Jun 2024 04:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719488654; cv=none;
        d=google.com; s=arc-20160816;
        b=NKio65zsvhR30Gva/04/fWuX/7TPSD49TTwjQQKTgmhA8/K0pbkPATruYDZm+QR2wY
         mFKZIM+iS1t98Iaxp8nRO04DWtbvpDeXgYKOQE1j155p/GClTBupEQDC6ykDFk8ZXNDB
         QBLJy/iLjKeDwTZb319j/4jkH9luKcxcnsjW6ZmSFY5EqABb2Y6meHmAW0tdQafAOziF
         /iGfRxyUm/bFp8x+HmM/8vWCdw8yNB7AhBCDzM+gWPRutZVJxSACf9Co8tb2uq5ebJpx
         SGY8FShP2C7deU9LpHQJg2zp7snBm4kRjHvArfv74GrYgCN/AYMcb5qiXivjaTDGVFFQ
         K+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=HsQ4ZRZxh8o4ChWO6fX/mSdbcAFATwqT4cBw2eqnJcs=;
        fh=YiZv3+/A5IwASgvUB/IV+z30mrkqFwUc3zYDtzPSBik=;
        b=LY5c3+mfKP044hV1wXg2F9J0Blf1VqkOcIQFFRojp5cWbC+q++8xIz5ZWjaRlwPgOW
         13BdVgtNxLfLaieuUd5FusJ/WydZlSpLWvsOISJ0AMXAjDhnI0+a8ytZNiRWc4NLtxzR
         2kgNxPYu9mrwUUtOprFIgr7CAf9Id2HnPf9A8rhOQVUk7U06SDVzVmPzzZraslhKetg7
         zqqqbd0Xp3eD3LZF33fb3x6Y6A0IVKV6tPxEvPVnXL6LgL5hd/97uNJxbEvZwP9lxyRP
         h7QI3VusK66Ro1LZS3fI5SFc0a2xly6346Z1f62eVMH7SrkDsPv/yj7tmePMnKTqYzls
         FS0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bouxnPFB;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-424a25f5799sor2179805e9.3.2024.06.27.04.44.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jun 2024 04:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bouxnPFB;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719488654; x=1720093454; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsQ4ZRZxh8o4ChWO6fX/mSdbcAFATwqT4cBw2eqnJcs=;
        b=bouxnPFBVE5EEY5G76qB8iQ4HQh/KBND0m/dFtXcEqFpK68JhCznFqrd5+TRXa8tWa
         C72F3ZWXu3ZXhF8E4+UMoEdePKbzAu5xoNEExRu1ysKvXe1TUHz5TPrFfpuj7Y09dTt0
         O81bIN39xnlBePkHZFLc1kuaUbolq/Luj7A34cB/yHjpBbJ+nfcU3jHRMEThZg5chDiR
         ut76MRXZ5+OOZOOcRn+Nz5MGdempp8wEHMN3pxfbh55FGg8DvfjTCi3CBjQlQBNHchNI
         sr2KIud3uFgfmgPj+mbpE7a2WMzde0/X7hSBEkthltOSDsxWnpQTad3CvnHsWAysRQ/I
         ycyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488654; x=1720093454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsQ4ZRZxh8o4ChWO6fX/mSdbcAFATwqT4cBw2eqnJcs=;
        b=tRTAQYmXU6zb5CspOy9i3DMqJhBMWBs4ciI/GrqxgeakSyJRnOxBt8m848H64A6enc
         LHp3vnud+TjCuNCQ8TJck73pBaDOOlGlXaHOftCtZchgsfe6TX/fm2ETa8Idd9Gvc7lY
         YnHxm8FLo9pFrNHXHlqyP+iQ8oaJI5yyGcSS92lXR47gBQJM16nEhm5nfQ5Fh9FL3Wzw
         stNxVB6qIK4C7GfUvl/Y9zEKICgQ+fHFjn8XBYlC9fl8QPnfC5k1GTbhQj4oB+QUDuAt
         w39zWw6PJactCiD2//zzMwDTmN4mBCkOoMzhmrjbeMNgZZvR3hb0wijgIlfbf3MHI0TN
         1H+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV860t9zoD3icdrxfDh3zpPtpGNKlr5IsAHXNtAnwmCBJuXdwwN47SRLVYCrFDYfEgalSzxEONn02fpPlZXRMLvwbgfdV2G
X-Gm-Message-State: AOJu0YyxW0UO8oYQcZ60qfPQWJkpWL8WUSwGHYEPS7VDvZYUAdU4ic6j
	+UFMds5eYupb4IzeNE3wDV+IiT22a56ihQnXmmUiF1Nk09H2lqpt2YW2OlNvp2rNHooiYD+w5n5
	4hg==
X-Google-Smtp-Source: AGHT+IH9ioBTJIjo58fz7MfO2NxK91hj4b9tbCZakj54bZeI1sDVjaMfHLNrNBaFVOP46FfbQi5ziw==
X-Received: by 2002:a05:600c:3ba9:b0:424:895c:2f97 with SMTP id 5b1f17b1804b1-425641c5e76mr1389145e9.3.1719488653962;
        Thu, 27 Jun 2024 04:44:13 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b68511sm22946925e9.19.2024.06.27.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:44:13 -0700 (PDT)
Date: Thu, 27 Jun 2024 11:44:09 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Julien Grall <julien@xen.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, jean-philippe@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com,
	richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v3 18/18] hw/arm/virt: Set SMMU OAS based on CPU
 PARANGE
Message-ID: <Zn1QiRQuVwNCkvss@google.com>
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-19-smostafa@google.com>
 <0b40423d-cf19-46a0-a86f-aefc5c7b02b1@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b40423d-cf19-46a0-a86f-aefc5c7b02b1@xen.org>
X-TUID: z7gHz61hTC9h

Hi Julien,

On Fri, May 24, 2024 at 06:22:12PM +0100, Julien Grall wrote:
> Hi Mostafa,
> 
> On 29/04/2024 04:24, Mostafa Saleh wrote:
> > Use the new SMMU property to make the SMMU OAS match the CPU PARANGE.
> > That's according to SMMU manual ARM IHI 0070F.b: >      6.3.6 SMMU_IDR5, OAS must match the system physical address size.
> 
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   hw/arm/virt.c      | 14 ++++++++++++--
> >   target/arm/cpu.h   |  2 ++
> >   target/arm/cpu64.c |  5 +++++
> 
> When trying to build qemu-system-arm, I get the following error:
> 
> [1/3028] Generating subprojects/dtc/version_gen.h with a custom command
> [2/3028] Generating qemu-version.h with a custom command (wrapped by meson
> to capture output)
> [3/3021] Linking target qemu-system-aarch64
> [4/3021] Linking target qemu-system-arm
> FAILED: qemu-system-arm
> clang -m64 -mcx16 @qemu-system-arm.rsp
> libqemu-arm-softmmu.fa.p/hw_arm_virt.c.o: In function `get_system_oas':
> /home/jgrall/works/oss/qemu/build/../hw/arm/virt.c:259: undefined reference
> to `cpu_arm_get_oas'
> clang-11: error: linker command failed with exit code 1 (use -v to see
> invocation)
> ninja: build stopped: subcommand failed.
> make: *** [run-ninja] Error 1
> 
> I think you need to provide cpu_arm_get_oas() also for 32-bit arm (I guess
> it is implemented in target/arm/cpu.c).
> 
Ouch, thanks for testing that, I am currently reworking this and migh drop
this change as Eric suggested, but I will make sure it also builds for arm.

Thanks,
Mostafa
> Cheers,
> 
> -- 
> Julien Grall
