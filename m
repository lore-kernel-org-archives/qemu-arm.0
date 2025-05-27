Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4797285njc;
        Tue, 27 May 2025 06:04:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmQ+91/Fjb1EPIm6yGXkgiSI3R2a3qpzZh7j8Rj/HvX2JYhb83Cory+8epF4i/HLj/FvPnQcyIRWwQ2w==@linaro.org
X-Google-Smtp-Source: AGHT+IFDAdPLWjXrEhzVOdqgeCvg553vss7hNHnPPkkKIdlS3qekFay6ZzMhLa4U6NV2m0oLFM4i
X-Received: by 2002:a05:651c:411b:b0:32a:5f27:66e0 with SMTP id 38308e7fff4ca-32a5f277905mr15719911fa.3.1748351045069;
        Tue, 27 May 2025 06:04:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748351045; cv=none;
        d=google.com; s=arc-20240605;
        b=d/pN1DQBUMOXvoX9MEOT6BUyPHC0MlLpddYNtfIgTrb8f3UwC6Opq4peuiJdIWVCKf
         /slGITy5dY8RAO/itnzDR61EQ/Hg/ZSvO/kWtuJ09x3ZFOxd5mXr3kvkfIRbQlpZjG5v
         LHB4x5Sux9shibu89CNZRRM3+9YGyAJSUnc3LyCsfI3SCBgTZXHzMiheMZTjrHCh2fjO
         xvR1Yg5L2tyw/KZn64240TzMfYsjMLmvQ3ukw67l72wAdbecsP0uuUoggTIRMS+jE5f/
         QExv/+aEkJZoiMrwWnVvoVG7rf8koj2zFH9CZK17k9art2RJTCdbSvJsQvyjlCWR/pXY
         YhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=8jv5YnKPw0bgkQ99ybognjGNgreUEbk+OwbloSvQAio=;
        fh=8mWce7z8plekLmajEVYEEOTx98AnnHSMEfwf1iW0Ncc=;
        b=HSOqRa9zgRm76V9JLb5+7O9KTnTVuOzkrmHeqedPXjAz0RfgN1LRYFK2eHpA5FZr/A
         TW1IDJwG5MAb898zeeMlD0BJfL6gwPPPX2uDe8a5o4Q4oBr5kpgkzRHIaywKf/LYILGn
         TN6WX2GXh2cHopKqp4McHCvJqlfp0GGUK92rYsyFwNk+s9tm4b2U3SE6jQFQsFMlLi2+
         EWiC0DrpsfoCt5yJqFMcy8GEQR41SZuyV1/t4bslq17M6cpBwWPtMgaUkTlIkfGqLrZX
         JFY8tWl+OsdImUoraPJZeYrPV5FfJ9ClXNCHvJYsB7c0Su3guB8XAD0PMJWLeBtchT+r
         fl7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h+ietowV;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-32a730d8bebsi1478801fa.401.2025.05.27.06.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:04:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h+ietowV;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748351043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jv5YnKPw0bgkQ99ybognjGNgreUEbk+OwbloSvQAio=;
	b=h+ietowVnvp/lvYvuPCoEwbZdGMaiPzh+JXJogSTwC8YoYPlACbSIDHhJL32b4tRetN5IW
	VAwDHUksoll6xtvemjNVidIe2goeeMdGco7M1DmS4CybhWNfhNZvNF+50PdfiUlVSLvY0x
	0oxhY5NasFiehOJoRXB6Dez5KTi+lfk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-cWn4zEjSOi6UOFF_Injrng-1; Tue, 27 May 2025 09:04:02 -0400
X-MC-Unique: cWn4zEjSOi6UOFF_Injrng-1
X-Mimecast-MFC-AGG-ID: cWn4zEjSOi6UOFF_Injrng_1748351041
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so17319305e9.3
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351041; x=1748955841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jv5YnKPw0bgkQ99ybognjGNgreUEbk+OwbloSvQAio=;
        b=NUksZdWHum/gU2f95NsMu1hZfaZF3A5ru8x3cEqFIo/NFpSJYaSLMTV4xqbg04+McU
         bfXTzQeOLf52ceqgIbkWwsHB1QlcHlZUYeFczrMDeJXB2ZJfmzSXbaOy7AV6F9eze71Q
         98XxiaOamGKwl1MTc6kYN4azelCeTDdj55YzPqMW3UlVx9OLc0o7i1IAWF+hrgWzoaZK
         RdfvSxt2MugLIdReXaivV9m/vZ71KXNWvUM+ls3i47imdes31Mh3aeCIJCmlYCmEU9MD
         /Z6PdT/412Kxe5hFwx9c/pV82iGE0YOqrzdT/jlTEQ7Ak2iRIHgN3WifxNzowu2/qZtD
         XuqA==
X-Forwarded-Encrypted: i=1; AJvYcCVsTjkFMUzaz8UmHD8Nc9sRelATPXxXmr02Gu27JbLbYz6tcMGNIBzDODOmb8PGQ+rapxaGX+JhNbD6dw==@linaro.org
X-Gm-Message-State: AOJu0YwAU0MyWIG8ZBTOIThoP1RE3rQ6YZPj4gWz4Eiqb+uiJGfoZO2T
	TK8J/pX3aBPhjupPWqbnm0wYyEX8XrVsYsyzoDD1aTwcIfonT2amEC+Hd53j+8PER9WAGxwIsI0
	e+V3Izn/xqrTsCQUOdK+mSnxsjYSGfiObWwFr5pAU7cPkk7rNcKZXjK3eKQ==
X-Gm-Gg: ASbGncvh6kuUOWyNi5Mh0APzf0mCXk7W0ZMlXn5i4K1ACZZcuT6lgmVNj4wwMscE1sl
	kKLKLm5aMOo9fjy/1z2FlHm/lEt/+Xklio56AiUAvov8K8Xx/bBHlsMrFYx1VZGgPoBdh3WZmLd
	0zxkVs84qy935JymQj6TixKvCCwGfMPcwTqWvFJC5Z3bY20T+kbkK7RIFWSISvXtSMjunQGassq
	nrfssBdETFeHOPYMnSVaLH2/EMOSqUgZtvfuKiiEYspp51tufY8EUXc6Safjlm/+jL8gH7oBtXp
	iYUP0pi1zVlGHWgQmBeSZX5RRB4CBIt5
X-Received: by 2002:a05:600c:648a:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-44c9141ab42mr129018235e9.2.1748351041080;
        Tue, 27 May 2025 06:04:01 -0700 (PDT)
X-Received: by 2002:a05:600c:648a:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-44c9141ab42mr129017335e9.2.1748351040342;
        Tue, 27 May 2025 06:04:00 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44804e89c42sm277960545e9.21.2025.05.27.06.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:03:59 -0700 (PDT)
Date: Tue, 27 May 2025 15:03:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 08/25] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
Message-ID: <20250527150357.03bfab2c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527143816.39c0dfab@imammedo.users.ipa.redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-9-eric.auger@redhat.com>
	<20250527143816.39c0dfab@imammedo.users.ipa.redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ntevchCIL7XIvw0ycaCgtXn3-mM7z5SHGY81BNW1OZA_1748351041
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: G8LILxywoBCK

On Tue, 27 May 2025 14:38:16 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 27 May 2025 09:40:10 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
> > From: Gustavo Romero <gustavo.romero@linaro.org>
> > 
> > This commit adds DSDT blobs to the whilelist in the prospect to
> > allow changes in the GPEX _OSC method.
> > 
> > Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>  
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
I take it back,

test with x86 enabled breaks on microvm,
so it's missing some DSTDs here


> 
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..abe00ad4ee 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,6 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/aarch64/virt/DSDT",
> > +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> > +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> > +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> > +"tests/data/acpi/aarch64/virt/DSDT.topology",  
> 
