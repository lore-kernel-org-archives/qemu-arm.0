Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp884613ejb;
        Wed, 1 Nov 2023 04:09:32 -0700 (PDT)
X-Received: by 2002:a05:6402:cad:b0:540:1bc0:65b2 with SMTP id cn13-20020a0564020cad00b005401bc065b2mr11855209edb.10.1698836972519;
        Wed, 01 Nov 2023 04:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698836972; cv=none;
        d=google.com; s=arc-20160816;
        b=clP/ZjSs+XJ33loAf1Im0c7eRZnfTQUqGm9CJ+McqW8g9vB8p6gO46DWlJyZzlKCyo
         GDDgLd4q64WASwAq+WMFmaSzUC0Lv2AJNDEdoduIxV7eFtxLvEUaZ0FJHWHH7cj0SxSN
         55qWu6rzvldmxdrrf5MgRQ4bVTrIX9mpgheSiTfMGIcPEjkuF+r7clAZftgt2m7+yGTW
         gEobYmsD8PPA9OH6Z+VZ7bJWcP3ylp7dBcbElFdcBS6XzxqCwuB/EmA0B6rGHj1ce//c
         z3NxzUUKZhHoDfmGZcQqDlEr6lBEFXoZA+TRMaGpaYVB/PP8NXnKsla9cDbXj11KJvYp
         44wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=yqVFnW1WUFIe+4EJTxkGaGemTAQgj7XGsOKAu6CZ+Zw=;
        fh=nostK4uholfZQz2xFpf5ajL9JVfbmVsFSRvduyIl1pM=;
        b=m4DfWjBDb5VymzCtEKQaLG9e+bjc6XfL/qXO9ujoyZQsEJxZQ1zy3P2smlBQfHofhl
         jNFhlwA1qNJIKgtZnxjGFklRZhDIR+nsn8efPYXljELL/oysz8sreJN6uyYVnLZiSL30
         ymExPHHYg1QIbUEVBxEk0pfhU4rUEl4POyGyiQkYBFoP8c0i/C6vg8E+MBwyzb3EMO8/
         8B80d75dmkjf1AYvkzfISnACtSGJgIOqnfXpDqgRrrIkBC3yCk0q1lqBXXRzWO8CJ4vB
         DeVOKsOL9/cNMV96lkNH9WbalRMyS2crB6Tq0oMncmsW4fpWPDcnI9PPkeUP5AmW11PV
         yJNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2SiwlMUq;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s1-20020a50d481000000b0054353639155sor108413edi.11.2023.11.01.04.09.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Nov 2023 04:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2SiwlMUq;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698836972; x=1699441772; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqVFnW1WUFIe+4EJTxkGaGemTAQgj7XGsOKAu6CZ+Zw=;
        b=2SiwlMUqnYPKTfB3Gan1ETJlHN0II0VlTX8q2tJNcpKPT08GXOcIqNNO5MGmGw96zG
         JXJrUQz7eK8lIH74sSuWqvFuoT5St7uFyGQThXJNDAaY4EtnLr+CJBPIzgPeDxUS5mOw
         g7OIIRnSkfWmazNfd6TAXFjFSDYFxuawkVXp3g+woaZ66iJ/4GtbExPgULHhNTFTAmlZ
         YyaY9OwHQL3Y6+3ISbNrouuqmxiy1GtLQW1rkClZmDZx5G3JFImWQVAXlOc6TEw5qJSR
         v3ZmUpcOpkTazj471soJ7graqIj1IilwqIewVC39fejyr2avCBB0gi65i0/ntcxp/Ipi
         RYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836972; x=1699441772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqVFnW1WUFIe+4EJTxkGaGemTAQgj7XGsOKAu6CZ+Zw=;
        b=S07EaI4jbW0tNaiQFJyNIUhLtk1tXgKDKSA2YlJftPrYpZ+njvch8UhYyGh/XAmxP7
         CBZGNJAMGp2rkix1fwkElrYEWRNB6UCCBpF5R96Z5rKPJKKvI2l+aOeus96hbSijQKVI
         92MQJ4f5omhSE/y2wh4BXGAHbayPOzibomVA7ujLf1MDXlTttphvmX34pxCuhG5h/fXb
         IF/A53xaFBpi0ilGrOHKz4QaY1Lrf3qgmzWJp0Fg0oBU5omn0AAA8ag4ltffaMhNbAM0
         sR5+yxiFWvh81SQUmHtRTbZ5xCRByIqnmgjIlRjX2pZkLUDv/wuo7vxBSth68y/OiacI
         lJ9A==
X-Gm-Message-State: AOJu0Yy0poEGkS4bKHqJs3lub5WD74ETpTlOuHG/1nadJ6XwvjtIdoXP
	aTf5Mx+W9kjSEXWmwBAWWL2UBAfMKgM9LXKMgkBtGg==
X-Google-Smtp-Source: AGHT+IEglgoiFzblwGaoUG696VsUyY6rrTgHoyX01C4Z9yioOlWCKk1Tbu9+fJ4ivJz7cUM0dwtdTQ==
X-Received: by 2002:a50:99cf:0:b0:543:6397:b46d with SMTP id n15-20020a5099cf000000b005436397b46dmr224828edb.2.1698836971343;
        Wed, 01 Nov 2023 04:09:31 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id du15-20020a05600c634f00b004083bc9ac90sm1162832wmb.24.2023.11.01.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:09:30 -0700 (PDT)
Date: Wed, 1 Nov 2023 11:09:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Simon Veith <sveith@amazon.de>,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Joe Komlodi <joe.komlodi@xilinx.com>,
	Prem Mallappa <prem.mallappa@broadcom.com>,
	Leonardo Garcia <leonardo.garcia@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair@alistair23.me>
Subject: Re: Any plans to implement more ARM SMMUv3 features?
Message-ID: <ZUIx5qA8YAIbyWEI@google.com>
References: <87il6n0zlw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87il6n0zlw.fsf@draig.linaro.org>
X-TUID: pP7vFb1FFGWI

Hi Alex,

On Tue, Oct 31, 2023 at 12:02:03PM +0000, Alex Bennée wrote:
> 
> Hi All,
> 
> Since 8.1 we enabled the FEAT_RME CPU feature to allow for Arm CCA
> guests to be run under QEMU's Arm emulation. While this is enough for
> pure software guests eventually we would want to support modelling
> systems with "real" hardware. One part of that is updating the SMMU
> emulation to make it RME aware.
> 
> The recently published F.a spec is available on the Arm site:
> 
>   https://developer.arm.com/documentation/ihi0070/latest/
> 
> As we have a keen interest on tracking (and implementing!) Arm features
> we have coded up the various sub-features as stories under an EPIC for
> each level of SMMU feature on our public JIRA:
> 
>   https://linaro.atlassian.net/browse/QEMU-533 (SMMUv3.0)
>   https://linaro.atlassian.net/browse/QEMU-553 (SMMUv3.1)
>   https://linaro.atlassian.net/browse/QEMU-558 (SMMUv3.2)
>   https://linaro.atlassian.net/browse/QEMU-566 (SMMUv3.3)
>   
> I think the state of the cards currently represents what has been
> implemented and what is left to do. As you can see it adds up to a fair
> bit of stuff. As a lot of people have been hacking on the SMMU code over
> the last few years I thought it would be useful to reach out and see who
> else is interested in further enhancing the SMMU emulation support?
> 
> If anyone has any patches/branches cooking or is intending to implement
> any particular bits please do let me know and I can update the cards to
> reflect the current state of work. As ever we will do our best to help
> review and smooth the up-streaming process for all Arm related feature
> enhancements.

I worked on adding stage-2 SMMUv3 support in qemu and was planning on
working on nesting (stage-1 + stage-2). However, I haven't done any
work on this yet and I will be busy till early next year.

If this work would start before that I can put some time to help with
the review, otherwise I can start working on this early next year.

Thanks,
Mostafa
