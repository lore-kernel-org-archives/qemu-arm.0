Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp472000lfk;
        Tue, 1 Feb 2022 06:44:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJAg32fAq9Oc3Ldy9mOCb8dkVB7ZTIqvAIfdKdC9Ya7Fvqp0DlzTNcYegMQxTAgLfLqfoU
X-Received: by 2002:a25:7904:: with SMTP id u4mr35696589ybc.563.1643726683003;
        Tue, 01 Feb 2022 06:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643726683; cv=none;
        d=google.com; s=arc-20160816;
        b=Si6JrMgp71MmIS1hNppvDH1o/2Z5nVPeymWX+oXFLPPD8kTYcspCBb7UrPCJGQnjrQ
         WdGs28ce2fa3N52KCRWm4P92hrxacEXEsSm9xnVqeSKKho7lqrcOpKkpDRTXbcwFFmgx
         RYTcWD3/B9X9qCtiGEw1AfRt8LKG0bH7QK6wfbsgIPQFBB1T96dkxMWWlUlqkkSqX5iv
         8mRWEVKn33Pty0o1hpcWNL1BAArtZbK+TOV5wj2dwBu4OlCJNmrLfgsKbAQDMHX85aRP
         /xRVJKI9PU8e3TpIn28TWhojqELoz8Ixm5tsb3BnMQMIVsr87kj6iB/kosEtTgkkp5Ql
         IGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xPr60qxZCyURf1wWnO6jqTyKtFPYAeP8pg9MJVVWY5E=;
        b=VH/WnnbEbRK3Q2IEiKmivLwsd0rYSWHmQdJncP3YLvGX2U2gygKBqTq0GcMALSqoyU
         R6FxMo857g+qMX4lRJR6FdKXo0ZdHw14erGgDxIVyPRfs+ktCpSS+91H4dYgFOWLUvH9
         v0+UpUArTarvolohh2MZ7CpCDBtMqEIQXSf5YFIYRwkdNJfVbLAv5jwS2z2wru2+DsCi
         /KR/Dyej9b54Zh/hNZuWKZHWvO6jRHUENqz3mc7KQls/oianCt7DimbRbeq3N8hmYI/T
         4OYWsNCIWzk1x/BGA3tLdh+xRVXY0pkYZNkIgSynpyLXHpgqIPHQe75Ok/aqAZSx+QYl
         dNMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+HAYH5c;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k10si9809191ybp.674.2022.02.01.06.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Feb 2022 06:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+HAYH5c;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643726682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPr60qxZCyURf1wWnO6jqTyKtFPYAeP8pg9MJVVWY5E=;
	b=i+HAYH5ch+qg91aKEEuUk3TLTK2yBB9IihnJX2d0FkUHD8bhxBumH9xSGRzF03LZZFqKxN
	YqHuw+q3a39u78G6D5l6d8bVIiFCcblGv0SkhCJFfqD+JsVIw7lev11LwW3uuzFdgVkshr
	Tcjfiow0UgA2q/9EZMES1P9NDVp1hM8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-k6P93xnaOmu9KJvP49Vqtg-1; Tue, 01 Feb 2022 09:44:41 -0500
X-MC-Unique: k6P93xnaOmu9KJvP49Vqtg-1
Received: by mail-ed1-f71.google.com with SMTP id v15-20020a50a44f000000b004094f4a8f3bso8823836edb.0
        for <alex.bennee@linaro.org>; Tue, 01 Feb 2022 06:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xPr60qxZCyURf1wWnO6jqTyKtFPYAeP8pg9MJVVWY5E=;
        b=XSz1n3iMQFRNn2QjcPrnflFf5RsMDl3wikJ4smpP2hTMX/NxRtpReJGYug6aj4M7Qj
         EqAGhKFYkCfcGDVU9XjUKq3UqBnQ2OLVc6Uz+UF0Uy/MutUXm8oCKfBntwVEXmk32Z8Y
         EP1jLWindJ6t8XnWfS1brdlLeJ0CEYAGno5b6c/hwHB94sUmI2nRhauAdTtEUv8lzEmt
         1PMJeOhP2xhnCeBRCumyl2AKy3rTbNmEGYmhsGDtRfyqICOY0nt+BJqzMvgqqGqX6qkQ
         Ng5fYp3yggLt3fuffuvkeFMBkwDOvWqz6X2PHgJn4KPC1/pWTIiyg/2sEL7Ju58SBZ/O
         RuQw==
X-Gm-Message-State: AOAM530K3RuVl6IXD6wrs54CwQon5r8McjC+nMqwos2s/DsB7kwWSWbS
	e53QF/fmHtC6H0cXX92bTRw7wtZc+CThZjlmGYU8QCwZfiQAzAaoloGFrLxRDaEOFuN5M+4ITUB
	QOlYaNBLoHh4O9o5QNmIMV5tQ3oRuvAOHP9Vr73mnviObHmjmuO+pTYLDv4ZCF1ecHCI=
X-Received: by 2002:a17:906:7945:: with SMTP id l5mr21603469ejo.104.1643726680195;
        Tue, 01 Feb 2022 06:44:40 -0800 (PST)
X-Received: by 2002:a17:906:7945:: with SMTP id l5mr21603437ejo.104.1643726679954;
        Tue, 01 Feb 2022 06:44:39 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id m13sm14613223eja.160.2022.02.01.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 06:44:39 -0800 (PST)
Date: Tue, 1 Feb 2022 15:44:37 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
	qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
Subject: Re: [kvm-unit-tests PATCH v3 0/3] GIC ITS tests
Message-ID: <20220201144437.fw5fv7xfxspf7a6s@gator>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
 <20211112132312.qrgmby55mlenj72p@gator.home>
 <87wnldfoul.fsf@linaro.org>
 <20211112145442.5ktlpwyolwdsxlnx@gator.home>
 <877dd4umy6.fsf@linaro.org>
 <20211119183059.jwrhb77jfjbv5rbz@gator.home>
 <87a6hlzq8t.fsf@linaro.org>
 <20211130143425.bh27yy47vpihllvs@gator.home>
 <87sft2yboq.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87sft2yboq.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: vG0mB0Y7XU9M

On Tue, Feb 01, 2022 at 01:10:13PM +0000, Alex Bennée wrote:
> 
> Gentle ping, I'm trying to clear this off my internal JIRA so let me
> know if you want me to do anything to help.
>

Sorry Alex! I've been juggling too many balls lately and completely
dropped this one. I'll rebase arm/queue now and run it through some
sanity tests. If all it good, I'll do the MR right away.

Thanks,
drew
