Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1054709njk;
        Thu, 17 Apr 2025 14:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUj1GGdpv7B4ZbsN348vQKocM10niCd10VkJ+STynWPqOAQcYoBfXSuA5MZYeLYVC4Srfiqyh1exf8wA==@linaro.org
X-Google-Smtp-Source: AGHT+IFgnpMSNdJySw1JBuGlL07WoIop/+Dscxh+qXlcI8Yjc1lNqNZZH5jGS1tcuXbr7kta/5ls
X-Received: by 2002:a05:6602:3995:b0:85e:8c26:170b with SMTP id ca18e2360f4ac-861dbde2329mr38306239f.2.1744924913625;
        Thu, 17 Apr 2025 14:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744924913; cv=none;
        d=google.com; s=arc-20240605;
        b=P+VJP15NkCN8pfqL3gH5+mc7o8kZqTVzWTIEOqUDQV3HUsbXgT83MAcMJTqU7hpiZ3
         p1C+9Vb31FVSDzdKBEC3Zh0lehbtDmEDDsdLZH8Y+zSXRuPiBoxdpPU0GxiUZbatD/Ph
         F+C53Z0Vx8p8UkzBcLN/0joW7Wa+QExKRg3ugF4OaZR+/g0pkX9ZYAF+T4raqWy7Bkq8
         3ps5GhugNLFU2lPrtt6zjndZsJ2LMdfLeW10ysySl921dK7a9KCAqvwPkzmNrlIgOqoY
         LD4P9FFevL6qZJal3jx1OH2CW2sqDiXRb6OmHLMXaLTWUrDj3nYIWLzs+hKBG80dFLtd
         juPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ARwUeFH/AbXpiF9ATeO2ZoXgZbMQVisi5KpAcd2UYGQ=;
        fh=QdvXuzBgAbsbAhmrBMiLhFiBAU5uHQq69Fiafv8CQYo=;
        b=EwaYHm/FgUwdgx1tBCvegGRIMDLtIPwI1+10mxN03goD4l1UPUS1NNVAyPqw/XU56V
         27eppFICWVdb7xFi3qCWkke8DPzPNzNtmBS+894CNQE1ZLyOER4du3VErnXrYwg76xme
         N+Q2NEoQYT0s4Y3mPdra3gNsg+WZ8jI841zq+uy6flJ90SdBSFWXLIwzOFG/+fjs6Qbq
         VDdi7En6khKACBUeCfxKp3K5aYDjPLhN1hvkz+k6jDXA3iCWF4GRq7Mo6MN3awZJZRiz
         XyhP9w3V1Chz9IdZ1XqUuAkn7nngNkE+epT9dxAz8ifP9VHnDpfG9oF539oZhJsLuYJN
         F6Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=enxbcBzy;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ca18e2360f4ac-861d98e1392si62597139f.80.2025.04.17.14.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 14:21:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=enxbcBzy;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744924913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARwUeFH/AbXpiF9ATeO2ZoXgZbMQVisi5KpAcd2UYGQ=;
	b=enxbcBzyWUWuc9raduhK6LhfVKr+WpTNvux+qhJe4fZtICM1YyKO+LVEOqIpadlVC9xlHZ
	eI1r7qoiRKdpbDbI9cQ1uVVpX7eey5fjx+GZgYK6KW9PqSBmwbtSmt0FEnMcm+RMWlJE4/
	DrCECRShVxEe0cASL1SLvRpMxB1w/qs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-lhwNh07aP4e0OqGRVF-x2g-1; Thu, 17 Apr 2025 17:21:51 -0400
X-MC-Unique: lhwNh07aP4e0OqGRVF-x2g-1
X-Mimecast-MFC-AGG-ID: lhwNh07aP4e0OqGRVF-x2g_1744924910
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so5999045e9.2
        for <alex.bennee@linaro.org>; Thu, 17 Apr 2025 14:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744924910; x=1745529710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARwUeFH/AbXpiF9ATeO2ZoXgZbMQVisi5KpAcd2UYGQ=;
        b=J3JE9CCsWFUFiHNfNdX3iMbpbZ9W+hoam23B/sWjvHFaVDJYU3lCl1NaL/r3D+Kz3o
         xSv5PBusplsZ13lsNe/QCrtpLyFJnimCDj144Na77PfZ8BsZMBncH7ij6yu2ph5kotRC
         qvXV3sQpZnK9YdE+OriUXNpZe0SrpB/MeEIiWaceutkxpoqo9DDnga2IITmTf3r+0wj9
         Vldjy76T9abcx3ktrFhUetpObuqFWYUxhkMHea8Twt2AQRLgnfmkltPKsMv4fBb50gRt
         tk8yGQS4zI0RVasxasdhQZ+Y2iWUEUw0LfLnkkQ0+zc9lu4R4I7s+6RuK5I6wwlGb4m5
         MA0g==
X-Forwarded-Encrypted: i=1; AJvYcCWlX/orWqqOTkfjvv9UTUKVKtlvVxFb2Tnl3i26MHWDyGkVFztVXpbQE5EInQASSNyAYm/H2jHmE4/sBg==@linaro.org
X-Gm-Message-State: AOJu0YzqAdmYZR2uqwZV0jTRnf1qTtjxforqQ2zvLVf1MAdhOFw+7BS5
	/GIqUeb097WVFQyRQnk8Q4Nog6hK2N6J5RunfG/chL+8hwEn8ZsukekwLZkDrxsO2M4od6N/i+W
	O9IvDiTtebeWgFyhM+b37we4uLYBOkwzLjB5fqQcKaL0cGOOArZPHjA==
X-Gm-Gg: ASbGnctp5f9QKwYv+e/4hjZf7BrhIyssUh10xqsY9FeyM5sW6vmGH2Ix0XQOKqLRM6V
	kvWpoYyjjcXIveEx/MAKFTmwWIS7ZHm8tsh1w5XNDKMOjOrXrh1f4db2SkA1qiRVp5BGmmGk3Wu
	DUhDH/j1V4J8anQL2+NwVTxFyhjJLE2omgSMDnzHRSYvNfL3m/tFEkxMa+4w3x7HP0bwSbWKY4p
	mpL869HYqf2OlzAOczaOpSpkbaN3qORN9gAPoHJANIYjlBGT3CMwfjCbGdbro7lhoHybQVvBk3L
	S3Y59w==
X-Received: by 2002:a05:6000:2401:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-39efba608ecmr334065f8f.26.1744924910454;
        Thu, 17 Apr 2025 14:21:50 -0700 (PDT)
X-Received: by 2002:a05:6000:2401:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-39efba608ecmr334046f8f.26.1744924910012;
        Thu, 17 Apr 2025 14:21:50 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406abfff1asm3872555e9.27.2025.04.17.14.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 14:21:49 -0700 (PDT)
Date: Thu, 17 Apr 2025 17:21:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>
Subject: Re: [PATCH-for-10.1 v3 6/9] qtest/bios-tables-test: Whitelist
 aarch64/virt 'its_off' variant blobs
Message-ID: <20250417172138-mutt-send-email-mst@kernel.org>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-7-philmd@linaro.org>
 <671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
 <20250409160531.341c205e@imammedo.users.ipa.redhat.com>
 <98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
 <20250410085042.6aa5593d@imammedo.users.ipa.redhat.com>
 <ec5cec94-4d02-442e-94e6-c0c2e79f3684@linaro.org>
 <0dffbcec-ca2a-47d0-b837-2400865371f7@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0dffbcec-ca2a-47d0-b837-2400865371f7@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U_wu-iCVmigPaYCvrCZeiEuI-QsIOJTxKBI66Ia1HMY_1744924910
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: k9N3f5hNHC8W

On Thu, Apr 17, 2025 at 06:06:14PM -0300, Gustavo Romero wrote:
> Hi Igor and Michael,
> 
> On 4/10/25 13:22, Gustavo Romero wrote:
> > Hi Igor,
> > 
> > On 4/10/25 03:50, Igor Mammedov wrote:
> > > On Wed, 9 Apr 2025 12:49:36 -0300
> > > Gustavo Romero <gustavo.romero@linaro.org> wrote:
> > > 
> > > > Hi Igor,
> > > > 
> > > > On 4/9/25 11:05, Igor Mammedov wrote:
> > > > > On Fri, 4 Apr 2025 00:01:22 -0300
> > > > > Gustavo Romero <gustavo.romero@linaro.org> wrote:
> > > > > > Hi Phil,
> > > > > > 
> > > > > > On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
> > > > > > > We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
> > > > > > > test. In preparation, copy the ACPI tables which will be
> > > > > > > altered as 'its_off' variants, and whitelist them.
> > > > > > > 
> > > > > > > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> > > > > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > > > > ---
> > > > > > >     tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
> > > > > > >     tests/qtest/bios-tables-test.c              |   1 +
> > > > > > >     tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
> > > > > > >     tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
> > > > > > >     tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
> > > > > > >     5 files changed, 4 insertions(+)
> > > > > > >     create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
> > > > > > >     create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
> > > > > > >     create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> > > > > > > 
> > > > > > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > > > index dfb8523c8bf..3421dd5adf3 100644
> > > > > > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > > > @@ -1 +1,4 @@
> > > > > > >     /* List of comma-separated changed AML files to ignore */
> > > > > > > +"tests/data/acpi/aarch64/virt/APIC.its_off",
> > > > > > > +"tests/data/acpi/aarch64/virt/FACP.its_off",
> > > > > > > +"tests/data/acpi/aarch64/virt/IORT.its_off",
> > > > > > 
> > > > > > I think your first approach is the correct one: you add the blobs
> > > > > > when adding the new test, so they would go into patch 5/9 in this series,
> > > > > > making the test pass without adding anything to bios-tables-test-allowed-diff.h.
> > > > > > Then in this patch only add the APIC.its_off table to the bios-tables-test-allowed-diff.h
> > > > > > since that's the table that changes when the fix is in place, as you did in:
> > > > > 
> > > > > if APIC.its_off is the only one that's changing, but FACP/IORT blobs are the same
> > > > > as suffix-less blobs, one can omit copying FACP/IORT as test harness will fallback
> > > > > to suffix-less blob if the one with suffix isn't found.
> > > > 
> > > > OK. Just clarifying and for the records, this is not the case for this series
> > > > 
> > > > 
> > > > > if blobs are different from defaults then create empty blobs and whitelist them in the same patch
> > > > > then do your changes and then update blobs & wipeout withe list.
> > > > 
> > > > Thanks for confirming it. That's what I suggested to Phil in my first review and what
> > > > I understood from the prescription in bios-tables-test.c.
> > > > 
> > > > However, on second thoughts, for this particular series, isn't it better to have the following commit sequence instead:
> > > > 
> > > > 1) Add the new test and the new blobs that make the test pass, i.e. APIC.suffix, FACP.suffix, and IORT.suffix (they are different than the default suffix-less blobs)
> > > 
> > > blobs should be a separate commit (that way it's easier for maintainer to rebase them,
> > > if they clash during merge with some other change.
> > 
> > I see. What is a bit confusing here is that the series consists in
> > one blob addition act (for the new test) and one blob update/removal act (after the fix).
> > 
> > 
> > > > 2) Whitelist only the APIC.suffix since that's the table that will change with the fix
> > > > 3) Add the fix (which changes the APIC table so a new APIC.suffix blob is needed and also stops generating the IORT table, so no more IORT.suffix blob is necessary)
> > > > 4) Finally, update only the APIC.suffix blob and remove the IORT.suffix blob and wipe out the whitelist
> > > > 
> > > > This way:
> > > > 
> > > > A) It's clear that only ACPI blob changed with the fix, because there is no addition of a FACP.suffix blob in 4) (it remains the same)
> > > > B) It's clear that the IORT table is removed with the fix and is not relevant anymore for the test
> > > 
> > > I'd just mention it in commit log so  that later no one would wonder why we are adding and then removing tables
> > > 
> > > As for the rest of suggestions, it looks fine to me.
> > 
> > Well, 2) won't make sense anymore since APIC.suffix would be already in the
> > whitelist in the previous patch that added the empty blobs. Since there won't
> > be a commit that adds _only_ the APIC.suffix to the whitelist, in preparation
> > for the fix, this info is "lost" in the series, even tho it's possible to
> > mention in the commit message.
> > 
> > Hence, what I think is not ideal from a maintainer's/reviewer's perspective,
> > is that in one commit all the blobs are updated/removed at once, which is
> > confusing because the fix did not touch the FACP table (for instance) and
> > this table is updated with APIC and with the removal of IORT, altogether,
> > in the last commit.
> > 
> > So, for this series, which adds new blobs and _also_ updates and removes some
> > of them, how about the following organization:
> > 
> > - Patch 1     : Add the new test, add the empty blobs *.suffix files, whitelist such a blobs
> > - Patch 2     : Update the blobs in Patch 1 with the ones that make the new test pass and remove them from the whitelist
> > 
> > - Patch 3     : Add the APIC.suffix blob to the whitelist (the table that changes due to the fix)
> > - Patch 4 - n : Fix(es)
> > - Patch (n+1) : Update the APIC.suffix blob, remove IORT.suffix blob, and remove the APIC.suffix blob from the whitelist
> >                * Add the APIC diff to the commit log
> >                * Mention in the commit log that IORT.suffix is removed because IORT table is no long generated after the fix
> > 
> > This way: a) no commit fails the test and b) blobs are added/updated/removed in separate commits
> > 
> > What do you think?
> 
> I’d really appreciate it if you could confirm whether this organization makes sense.
> 
> 
> Cheers,
> Gustavo

looks ok. Igor?
